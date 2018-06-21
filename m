From: linux@roeck-us.net (Guenter Roeck)
Date: Thu, 21 Jun 2018 09:34:48 -0700
Subject: Risc-V, qemu, and initrd
In-Reply-To: <20180621145217.GA12445@infradead.org>
References: <64d50cba-8215-763c-a5c9-f384b2901d01@roeck-us.net>
 <mvmpo0kjjog.fsf@suse.de> <20180621144821.GA15280@roeck-us.net>
 <20180621145217.GA12445@infradead.org>
Message-ID: <20180621163448.GA2292@roeck-us.net>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Jun 21, 2018 at 07:52:17AM -0700, Christoph Hellwig wrote:
> On Thu, Jun 21, 2018 at 07:48:21AM -0700, Guenter Roeck wrote:
> > I did. The resulting image hangs (I tried v4.17.2 and v4.18-rc1).
> 
> The upstream kernel is missing support for irq controllers and timers,
> so I don't think it can boot on anything.
> 
Hmm ... not as bad as a car with no engine, but getting close.

> Here is my branch that allows me to boot qemu with 4.18-rc:
> 
> 	http://git.infradead.org/users/hch/riscv.git/shortlog/refs/heads/riscv-linux-4.18

Yes, that boots if I disable setup_initrd(). I am still puzzled about the
purpose of setup_initrd() - it effectively disables external initrd,
initrd built into the kernel via CONFIG_INITRAMFS_SOURCE works just fine
without it, and no other architecture has similar code. Can/should it be
removed ?

Thanks,
Guenter
