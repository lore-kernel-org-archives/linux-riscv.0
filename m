From: andrew@lunn.ch (Andrew Lunn)
Date: Mon, 19 Nov 2018 17:12:04 +0100
Subject: [PATCH net-next v3 1/6] net: phy: mscc: migrate to
 phy_select/restore_page functions
In-Reply-To: <mvmzhu59idl.fsf@suse.de>
References: <20181008100728.24959-1-quentin.schulz@bootlin.com>
 <20181008100728.24959-2-quentin.schulz@bootlin.com>
 <mvm8t1pazea.fsf@suse.de> <20181119151057.GC26852@lunn.ch>
 <mvm4lcdaynt.fsf@suse.de> <20181119152830.GE26852@lunn.ch>
 <20181119154005.GA8367@piout.net> <mvmzhu59idl.fsf@suse.de>
Message-ID: <20181119161204.GC2393@lunn.ch>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Nov 19, 2018 at 04:50:14PM +0100, Andreas Schwab wrote:
> On Nov 19 2018, Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:
> 
> > My first intuition is that he mac driver quentin is using does
> > phy_connect when the interface is opened while macb is doing it at probe
> > time. I didn't investigate but maybe this can help :)
> 
> The phy probing of macb is very unreliable, perhaps it needs to be
> rewritten.

Hi Andreas

I still don't see why that would cause a hang.

Could you turn on lockdep and see if it reports a deadlock.

Thanks
	Andrew
