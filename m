From: zongbox@gmail.com (Zong Li)
Date: Sat, 30 Jun 2018 00:53:49 +0800
Subject: [PATCH v2 3/4] RISC-V: Add definiion of extract symbol's index
 and type for 32-bit
In-Reply-To: <20180629071200.GC12956@infradead.org>
References: <cover.1529915117.git.zong@andestech.com>
 <4c4def99db5e0392238947dc878c5018cc7aca3e.1529915117.git.zong@andestech.com>
 <20180629071200.GC12956@infradead.org>
Message-ID: <CA+ZOyahLiGS-7DQO8ncJ_=w-Mkav33FBBOC9-K08XSyhPgjtGg@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Christoph Hellwig <hch@infradead.org> ? 2018?6?29? ?? ??3:12???
>
> On Mon, Jun 25, 2018 at 04:49:39PM +0800, Zong Li wrote:
> > Use generic marco to get the index and type of symbol.
>
> Why do we even need this in a uapi header?  Shouldn't ELF_RISCV_R_SYM
> and ELF_RISCV_R_TYPE move to module.c?  In that case we could just
> use CONFIG_64BIT.

Make sense. I even think the all definitions can be move to include/asm/elf.h.
How do you think about that?
