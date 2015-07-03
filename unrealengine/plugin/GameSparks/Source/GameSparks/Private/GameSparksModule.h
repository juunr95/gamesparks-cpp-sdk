#pragma once

#include "GameSparks/gsstl.h"
#include "GameSparks/GS.h"
#include "GSMessageListeners.h"
#include "IGameSparks.h"
#include "Runtime/Engine/Public/Tickable.h"
#include "GameSparksComponent.h"


DECLARE_LOG_CATEGORY_EXTERN(UGameSparksModuleLog, Log, All);

namespace UGameSparksModuleNS
{
    static TArray< UWorld* > WorldList;
    
    static FWorldDelegates::FWorldInitializationEvent::FDelegate OnWorldCreatedDelegate;
    static FWorldDelegates::FWorldEvent::FDelegate OnWorldDestroyedDelegate;
}


class UGameSparksModule : public IGameSparks, public FTickableGameObject
{
public:

	/** IModuleInterface implementation */
	virtual void StartupModule();
	virtual void ShutdownModule();

	/** FTickableGameObject implementation */
    virtual bool IsTickableWhenPaused() const;
    virtual bool IsTickableInEditor() const;
    virtual void Tick(float DeltaTime);
	virtual bool IsTickable() const;
	virtual TStatId GetStatId() const;

	/* Initialization and destruction of gamesparks */
	void Initialize(FString apikey, FString secret, bool previewServer);
	void Shutdown();

	static UGameSparksModule* GetModulePtr();

	void SendGameSparksAvailableToComponents(bool available);
	void SendDebugLogToComponents(const gsstl::string& message);

    GameSparks::Core::GS_& GetGSInstance() { return GS; }
    const GameSparks::Core::GS_& GetGSInstance() const { return GS; }
    
    void RegisterListeners();
    
    // we need to notified when worlds are connected and disconnected
    static void OnWorldConnected(UWorld* World);
    static void OnWorldDisconnected(UWorld* World);


private:

    
    GameSparks::Core::GS_ GS;
    
    bool isInitialised = false;
    

};