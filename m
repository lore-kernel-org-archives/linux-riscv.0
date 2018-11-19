From: andrew@lunn.ch (Andrew Lunn)
Date: Mon, 19 Nov 2018 17:25:29 +0100
Subject: [PATCH net-next v3 1/6] net: phy: mscc: migrate to
 phy_select/restore_page functions
In-Reply-To: <mvmva4t9h8x.fsf@suse.de>
References: <20181008100728.24959-1-quentin.schulz@bootlin.com>
 <20181008100728.24959-2-quentin.schulz@bootlin.com>
 <mvm8t1pazea.fsf@suse.de> <20181119151057.GC26852@lunn.ch>
 <mvm4lcdaynt.fsf@suse.de> <20181119152830.GE26852@lunn.ch>
 <20181119154005.GA8367@piout.net> <mvmzhu59idl.fsf@suse.de>
 <20181119161204.GC2393@lunn.ch> <mvmva4t9h8x.fsf@suse.de>
Message-ID: <20181119162529.GA31955@lunn.ch>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Nov 19, 2018 at 05:14:38PM +0100, Andreas Schwab wrote:
> On Nov 19 2018, Andrew Lunn <andrew@lunn.ch> wrote:
> 
> > Could you turn on lockdep and see if it reports a deadlock.
> 
> How do I "turn on lockdep"?

make menuconfig
Kernel hacking
Lock Debugging (spinlocks, mutexes, etc...) 
Lock debugging: prove locking correctness

It has changes its name at some point. it used to be called
CONFIG_LOCKDEP, for locking dependencies. Anybody who has been kernel
hacking for a while still calls it lockdep.

	Andrew
