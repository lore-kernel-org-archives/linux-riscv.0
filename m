From: atish.patra@wdc.com (Atish Patra)
Date: Wed, 20 Jun 2018 10:50:09 -0700
Subject: an initial RISC-V Linux 4.18 tree
In-Reply-To: <20180619171444.GA10395@infradead.org>
References: <20180619171444.GA10395@infradead.org>
Message-ID: <0a84fcea-e35c-cb2e-dd78-1c3cd1f26901@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On 6/19/18 10:15 AM, Christoph Hellwig wrote:
> Hi all,
> 
> there had been some requests for a more updated working RISC-V
> tree.  Based on that I decided that instead of a private working
> tree for 4.18 I'd start a public tree:
> 
>      git://git.infradead.org/users/hch/riscv.git riscv-linux-4.18
> 
> Gitweb:
> 
>      http://git.infradead.org/users/hch/riscv.git/shortlog/refs/heads/riscv-linux-4.18
> 
There are some other timer related patches present in palmer?s wip_timer 
branch.
https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/log/?h=wip-timer

(I have few of them as well)

Should I rebase my/other patches on top of your repo and resend?

Regards,
Atish

> For now this just contains core patches, that is whatever I want/need
> on Qemu, or what looks like it.  I've also done all the usual cleanups
> to get the code submission ready, the only exception is the
> documentation of the PLIC register map as pointed out by Jonathan last
> time around - I'll need someone more familiar with the hardware and
> driver to fix that up.
> 
> Except for that the patches should be good to be submitted, I can
> help a bit with that, but in general having the original authors submit
> it would be preferred.
> 
> The tree is going to get rebased as needed.
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
