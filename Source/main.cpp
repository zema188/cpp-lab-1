#include "SFML/Graphics/RenderWindow.hpp"
#include "SFML/Window/Event.hpp"
#include "imgui-SFML.h"
#include "imgui.h"

// Глобальная переменная для хранения цвета фона окна
sf::Color backgroundColor = sf::Color::White; // Изначальный цвет белый

int main()
{
	sf::RenderWindow window(sf::VideoMode(400, 200), "Color Changer");
	window.setFramerateLimit(60);
	if (!ImGui::SFML::Init(window))
	{
		return -1;
	}

	while (window.isOpen())
	{
		sf::Event event;
		while (window.pollEvent(event))
		{
			ImGui::SFML::ProcessEvent(window, event);

			if (event.type == sf::Event::Closed)
			{
				window.close();
			}
		}

		ImGui::SFML::Update(window, sf::seconds(1.0f / 60.0f));

		ImGui::Begin("Color Changer");

		// Кнопка для изменения цвета на синий
		if (ImGui::Button("Set Blue Background"))
		{
			backgroundColor = sf::Color::Blue;
		}

		// Кнопка для изменения цвета на зеленый
		if (ImGui::Button("Set Green Background"))
		{
			backgroundColor = sf::Color::Green;
		}

		ImGui::End();

		window.clear(backgroundColor);
		ImGui::SFML::Render(window);
		window.display();
	}

	ImGui::SFML::Shutdown();
	return 0;
}
