From: emil.renner.berthing@gmail.com (Emil Renner Berthing)
Date: Wed, 14 Nov 2018 22:08:47 +0100
Subject: MACB in 4.20-rc2
In-Reply-To: <mvmwopffwlo.fsf@suse.de>
References: <mvmwopffwlo.fsf@suse.de>
Message-ID: <CANBLGcxSA0GYd+D0Ofe0mAJhGQcqdi-4jCWGWk=EUqnqK-4v1A@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi Andreas,

On Wed, 14 Nov 2018 at 17:33, Andreas Schwab <schwab@suse.de> wrote:
>
> It looks like the MACB driver is broken in 4.20-rc2.  I can see these
> two messages:
>
> [   38.530000] macb: GEM doesn't support hardware ptp.
> [   38.540000] libphy: MACB_mii_bus: probed
>
> but appears to be stuck without ever reaching this message:
>
> [   38.750000] Microsemi VSC8541 SyncE 10090000.ethernet-ffffffff:00: attached PHY driver [Microsemi VSC8541 SyncE] (mii_bus:phy_addr=10090000.ethernet-ffffffff:00, irq=POLL)
>
> The module never finishes initializing.

That's funny. I _just_ came to the same conclusion.
Here is my bootlog with a backtrace:
http://ix.io/1rTR

..and the code I'm building:
https://github.com/esmil/linux/commits/hfu

I tried reverting Atish' hack, but that's not it.

/Emil
