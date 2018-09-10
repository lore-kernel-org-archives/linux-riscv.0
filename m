From: hch@infradead.org (Christoph Hellwig)
Date: Mon, 10 Sep 2018 04:23:06 -0700
Subject: [PATCH] RISC-V: include linux/ftrace.h in asm-prototypes.h
In-Reply-To: <20180906215756.28414-1-jcowgill@debian.org>
References: <20180906215756.28414-1-jcowgill@debian.org>
Message-ID: <20180910112306.GA12979@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Sep 06, 2018 at 10:57:56PM +0100, James Cowgill wrote:
> When exporting symbols from an assembly file, the MODVERSIONS code
> requires their prototypes to be defined in asm-prototypes.h (see
> scripts/Makefile.build). Since both of these symbols have prototypes
> defined in linux/ftrace.h, include this header from RISC-V's
> asm-prototypes.h.
> 
> Reported-by: Karsten Merker <merker@debian.org>
> Signed-off-by: James Cowgill <jcowgill@debian.org>

I think this needs at very least a good comment, including for which
symbols you are doing this.

Also I'm curious if it might be worth just handling this in the
asm-generic version, as those symbols should be assembly exports
in most architectures.
