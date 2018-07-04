From: palmer@sifive.com (Palmer Dabbelt)
Date: Wed, 04 Jul 2018 13:58:44 -0700 (PDT)
Subject: [PATCH v2 3/4] RISC-V: Add definiion of extract symbol's index
 and type for 32-bit
In-Reply-To: <CA+ZOyahLiGS-7DQO8ncJ_=w-Mkav33FBBOC9-K08XSyhPgjtGg@mail.gmail.com>
Message-ID: <mhng-640c8a78-7e3a-4ccf-9951-fc85a0969b9c@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Fri, 29 Jun 2018 09:53:49 PDT (-0700), zongbox at gmail.com wrote:
> Christoph Hellwig <hch@infradead.org> ? 2018?6?29? ?? ??3:12???
>>
>> On Mon, Jun 25, 2018 at 04:49:39PM +0800, Zong Li wrote:
>> > Use generic marco to get the index and type of symbol.
>>
>> Why do we even need this in a uapi header?  Shouldn't ELF_RISCV_R_SYM
>> and ELF_RISCV_R_TYPE move to module.c?  In that case we could just
>> use CONFIG_64BIT.
>
> Make sense. I even think the all definitions can be move to include/asm/elf.h.
> How do you think about that?

Sorry I've been slow about reviewing this, but I think just in the interest of 
getting a sane RV32I port up and running quickly (so we can try to get glibc in 
shape) I'm going to take this for now.

Do you mind submitting a cleanup patch?
