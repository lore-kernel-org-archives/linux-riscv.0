From: andrew@lunn.ch (Andrew Lunn)
Date: Thu, 29 Nov 2018 03:28:58 +0100
Subject: macb: probe of 10090000.ethernet failed with error -110
In-Reply-To: <mhng-0ddf5852-8900-4131-b3e0-81c5cc7de2eb@palmer-si-x1c4>
References: <2e17bba6-d932-37b2-5dca-0963fc50f5e6@gmail.com>
 <mhng-0ddf5852-8900-4131-b3e0-81c5cc7de2eb@palmer-si-x1c4>
Message-ID: <20181129022858.GG5037@lunn.ch>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

> This is all fine as long as Linux doesn't go and reset the phy again. Until
> bafbdd527d56 ("phylib: Add device reset GPIO support") was the case.  After
> that commit I believe phylib is resetting the phy while attempting to enter
> unmanaged mode, which is now allowed in this particular chip.
> 
> Since it appears the phy is not usually described by the device tree but is
> instead discovered by probing a MII-based ID register, it seems the best
> place to put this is within the phy driver itself.  I find it's usually best
> to describe things with code, so I hacked up something like

Talking to Florian, i was under the impression that you could not even
discover the device when its reset state what wrong. You could not
read the ID registers.

Your suggested change assumed you can discover the device. Is this
true?

	Thanks
		Andrew
