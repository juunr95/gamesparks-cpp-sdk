#include <iostream>

#include <GameSparks/GS.h>
#include <GameSparks/IGSPlatform.h>
#include <GameSparks/generated/GSRequests.h>

#include "./extra/usleep.h"
#include "sample_configuration.h"

void AuthenticationRequest_Response(const GameSparks::Api::Responses::AuthenticationResponse& response)
{
	if (response.GetHasErrors())
	{
		std::cout << "something went wrong during the authentication" << std::endl;
		std::cout << response.GetErrors().GetValue().GetJSON().c_str() << std::endl;
	}
	else
	{
		std::cout << "you successfully authenticated to GameSparks with your credentials" << std::endl;
		std::cout << "your displayname is " << response.GetBaseData().GetString("displayName").GetValue().c_str() << std::endl;
	}

}

void GameSparksAvailable(bool available)
{
	std::cout << "GameSparks is " << (available ? "available" : "not available") << std::endl;

	// try with wrong credentials
	GameSparks::Api::Requests::AuthenticationRequest requestWrong;
	requestWrong.SetUserName("TOTALLYWRONGUSER");
	requestWrong.SetPassword("TOTALLYWRONGPASSWORD");
	requestWrong.Send(AuthenticationRequest_Response);
	
	// try with right credentials
	GameSparks::Api::Requests::AuthenticationRequest requestRight;
	requestRight.SetUserName("abcdefgh");
	requestRight.SetPassword("abcdefgh");
	requestRight.Send(AuthenticationRequest_Response);

}

int main(int argc, const char* argv[])
{
	using namespace GameSparks::Core;

	GS.Initialise(new SampleConfiguration::NativePlatformDescription());

	GS.GameSparksAvailable = GameSparksAvailable;

	int cyclesLeft = 200000;
	while (cyclesLeft-- > 0)
	{
		GS.Update(100);

		usleep(100);
	}

	GS.ShutDown();
}


