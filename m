From: linux@roeck-us.net (Guenter Roeck)
Date: Thu, 21 Jun 2018 10:33:14 -0700
Subject: Risc-V, qemu, and initrd
In-Reply-To: <20180621145217.GA12445@infradead.org>
References: <64d50cba-8215-763c-a5c9-f384b2901d01@roeck-us.net>
 <mvmpo0kjjog.fsf@suse.de> <20180621144821.GA15280@roeck-us.net>
 <20180621145217.GA12445@infradead.org>
Message-ID: <20180621173314.GA7251@roeck-us.net>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi Christoph,

On Thu, Jun 21, 2018 at 07:52:17AM -0700, Christoph Hellwig wrote:
> On Thu, Jun 21, 2018 at 07:48:21AM -0700, Guenter Roeck wrote:
> > I did. The resulting image hangs (I tried v4.17.2 and v4.18-rc1).
> 
> The upstream kernel is missing support for irq controllers and timers,
> so I don't think it can boot on anything.
> 
> Here is my branch that allows me to boot qemu with 4.18-rc:
> 
> 	http://git.infradead.org/users/hch/riscv.git/shortlog/refs/heads/riscv-linux-4.18

Are you able to boot anything but -M virt ? If yes, can you send me the
necessary command line parameters ?

Thanks,
Guenter
