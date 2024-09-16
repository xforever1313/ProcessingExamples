//
// Processing Examples
// Copyright (C) 2024 Seth Hendrick
// 
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as published
// by the Free Software Foundation, either version 3 of the License, or
// any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.
// 
// You should have received a copy of the GNU Affero General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.
//

ArrayList<Card> cards;
Button restartButton;

void setup()
{
  size( 500, 575 );
  background( 255 );
  
  restartButton = new Button( "Reset", 300, 500, 440, 550  );
  Restart();
}

void Restart()
{
  cards = new ArrayList<Card>();
  ArrayList<String> cardNames = new ArrayList<String>();
  
  // From Requirement 2:
  
  // Thematic Game Elements
  cardNames.add( "Story" );
  cardNames.add( "Setting" );
  cardNames.add( "Characters" );
  
  // Gameplay Elements
  cardNames.add( "Play Sequence" );
  cardNames.add( "Level Design" );
  cardNames.add( "Interface Design" );
  
  // Game Analysis
  cardNames.add( "Difficulty" );
  cardNames.add( "Balance" );
  cardNames.add( "Depth" );
  cardNames.add( "Pace" );
  cardNames.add( "Replay Value" );
  cardNames.add( "Age Appropriateness" );
  
  // Related Terms
  cardNames.add( "Single-Player vs. Multiplayer" );
  cardNames.add( "Cooperative vs. Competitve" );
  cardNames.add( "Turn-Based vs. Real-Time" );
  cardNames.add( "Strategy vs. Reflex vs. Chance" );
  cardNames.add( "Abstract vs. Thematic" );
  
  int cardId = 1;
  for( int col = 0; ( col < 5 ) && (cardNames.size() > 0 ); ++col )
  {
    for( int row = 0; ( row < 4 ) && (cardNames.size() > 0 ); ++row )
    {
      int index = int( random( 0, cardNames.size() ) );
      String cardName = cardNames.get( index );
      cardNames.remove( index );
      Card card = new Card( cardName, cardId, row, col );
      ++cardId;
      cards.add( card );
    }
  }
}

void draw()
{
  // -------- Update --------
  
  for( int i = 0; i < cards.size(); ++i )
  {
    cards.get( i ).Update();
  }
  restartButton.Update();

  // -------- Draw --------

  for( int i = 0; i < cards.size(); ++i )
  {
    cards.get( i ).Draw();
  }
  restartButton.Draw();
}

void mouseClicked()
{
  for( int i = 0; i < cards.size(); ++i )
  {
    cards.get( i ).OnMouseClick();
  }
  
  if( restartButton.OnMouseClick() )
  {
    Restart();
  }
}
