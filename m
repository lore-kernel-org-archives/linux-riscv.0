From: linux@roeck-us.net (Guenter Roeck)
Date: Sun, 14 Oct 2018 19:13:28 -0700
Subject: [PATCH v8 3/5] Cleanup ISA string setting
In-Reply-To: <20181014234639.GA14835@andestech.com>
References: <1539051514-3658-1-git-send-email-alankao@andestech.com>
 <1539051514-3658-4-git-send-email-alankao@andestech.com>
 <20181014000205.GA22333@roeck-us.net> <20181014234639.GA14835@andestech.com>
Message-ID: <1867bb22-1858-0f14-e077-5cb4b2e50446@roeck-us.net>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi Alan,

On 10/14/2018 04:46 PM, Alan Kao wrote:
> Hi Guenter,
> 
> On Sat, Oct 13, 2018 at 05:02:05PM -0700, Guenter Roeck wrote:
>> Hi,
>>
>> With this patch in -next applied, I get the following error
>> when building riscv:defconfig.
> 
> I guess what you meant was this commit:
> commit 0a5bee05fc67ce2044b8d91a18abbf14042da531
> 

Yes, sorry, I just blindly assumed that the last version I found must have caused
the problem. You are right, v8 actually fixes it (as suggested below).

> The modification in Makefile was
> 
> -endif
> -
> -KBUILD_AFLAGS += -march=$(KBUILD_MARCH)$(KBUILD_ARCH_A)fd$(KBUILD_ARCH_C)
> +# ISA string setting
> +riscv-march-$(CONFIG_ARCH_RV32I)       := rv32im
> +riscv-march-$(CONFIG_ARCH_RV64I)       := rv64im
> +riscv-march-$(CONFIG_RISCV_ISA_A)      := $(riscv-march-y)aj
> +riscv-march-y                          := fd
> +riscv-march-$(CONFIG_RISCV_ISA_C)      := $(riscv-march-y)c
> 
> and the ":= fd" line was wrong.  It should have been
> 
> +riscv-march-y                          := $(riscv-march-y)fd
> 
>>
>>
>> What am I missing ? Does RISC-V now require a new non-upstream compiler ?
>> Or a special version of make ? I am currently using GNU Make 4.1.
> 
> So I sent the v8 to fix this problem.
> Sorry for the inconvinience.
> 

No worries. At least this problem was (is going to be) easy to fix.
And, yes, I confirmed that the one-line change above fixes the problem.

Guenter

>>
>> Thanks,
>> Guenter
>>
>> ---
> 
> And Palmer, it seems that the patch that causes this build error has been
> pulled into linux-next.  Any idea how to fix that one?
> 
> Many thanks,
> Alan
> 
