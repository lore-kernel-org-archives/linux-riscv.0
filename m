From: zongbox@gmail.com (Zong Li)
Date: Thu, 5 Jul 2018 21:33:07 +0800
Subject: [PATCH v2 3/4] RISC-V: Add definiion of extract symbol's index
 and type for 32-bit
In-Reply-To: <mhng-640c8a78-7e3a-4ccf-9951-fc85a0969b9c@palmer-si-x1c4>
References: <CA+ZOyahLiGS-7DQO8ncJ_=w-Mkav33FBBOC9-K08XSyhPgjtGg@mail.gmail.com>
 <mhng-640c8a78-7e3a-4ccf-9951-fc85a0969b9c@palmer-si-x1c4>
Message-ID: <CA+ZOyaggr-Y2-Yh_o4+XQLoT5-o6PM9m4_T3sHHUq13+CgJYEQ@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Palmer Dabbelt <palmer@sifive.com> ? 2018?7?5? ?? ??4:58???
>
> On Fri, 29 Jun 2018 09:53:49 PDT (-0700), zongbox at gmail.com wrote:
> > Christoph Hellwig <hch@infradead.org> ? 2018?6?29? ?? ??3:12???
> >>
> >> On Mon, Jun 25, 2018 at 04:49:39PM +0800, Zong Li wrote:
> >> > Use generic marco to get the index and type of symbol.
> >>
> >> Why do we even need this in a uapi header?  Shouldn't ELF_RISCV_R_SYM
> >> and ELF_RISCV_R_TYPE move to module.c?  In that case we could just
> >> use CONFIG_64BIT.
> >
> > Make sense. I even think the all definitions can be move to include/asm/elf.h.
> > How do you think about that?
>
> Sorry I've been slow about reviewing this, but I think just in the interest of
> getting a sane RV32I port up and running quickly (so we can try to get glibc in
> shape) I'm going to take this for now.
>
> Do you mind submitting a cleanup patch?

I will send a patch to clean up. Thanks everyone to review this patchset.
