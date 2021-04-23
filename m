Return-Path: <SRS0=nRIc=JU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4006C433ED
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 07:53:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FE1D61452
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 07:53:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FE1D61452
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3Wp9v5EhuvMm/WYtkCFVCip9zsfB3wC9XE+Law9y3GQ=; b=UKz5FgqLOeQM9mq2wQGYepVHD
	5wKIpO134l8ybS5nhiwv8Hq6jp3WKoQgaOyZ2fChX0J7V610FkoVcgNpHajPfSxI/QT5URR5oKTAz
	jAViK8JSTs23QxZ/LwfaLP5UF1hsxtaLs1h65dtAG3K2F6K67nV093a8FJTi9d4ay+/D8CbbFF4j8
	X1XjjDOgFtLbMsvAvNmcCMcOPzQND34BfEHAEsznE2TOtskB4514R3pAAJ8lD0ow+0ix8dMxOVvEN
	AyZ9jstmf1+Tl4j6ub6G6y13x6rdnNerot9kZXaI6JHNF5Fa3yAyW3Hx+H/YLYU1xeMLksBdOD6K/
	N+s5QaAJA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZqcK-000zVn-RO; Fri, 23 Apr 2021 07:52:49 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZqc8-000zV7-4p
 for linux-riscv@desiato.infradead.org; Fri, 23 Apr 2021 07:52:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=eedfyKN7lbRKXfreuckoFV/0aa9xABH45LFZArFtDHM=; b=J5Zgv21689DkrjEKjBD6MjvbM+
 ne9KZvqZehj/vKML4BPjVZovXgKt82cEw7l9aFpl7vrQGfNaw8qSp39r24EFaSviP5EIbJYm1RLpZ
 ZqY8Si/o17VXk+UbQDufexw4IrUKyXioMaLucNTbZo1mERyhq4P6hWT8xYIWbnQtyZH8gKZjXj8GS
 r6ExI/ZD6oCpml+H9eLZmEG6gVLepPMgG6NxcPY6LCR9yqBLbccVyp7Jj+CgvNGzO0D17dE7WJPJ0
 ioIGvM2mI2IjWITQ5lhTuNE+3CCjdsv2ajUxoMS742SmMwjG1wuZF+txU9XlllWXObJEg3VPGsSLX
 HBhDywNg==;
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZqc2-00EEOf-W4
 for linux-riscv@lists.infradead.org; Fri, 23 Apr 2021 07:52:34 +0000
Received: from [192.168.1.12] (lfbn-lyo-1-457-219.w2-7.abo.wanadoo.fr
 [2.7.49.219]) (Authenticated sender: alex@ghiti.fr)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 2757D24000C;
 Fri, 23 Apr 2021 07:52:22 +0000 (UTC)
Subject: Re: [PATCH v8] RISC-V: enable XIP
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-mm@kvack.org, vitaly.wool@konsulko.com
References: <mhng-308e5471-7834-470f-8111-9d140ad33ac9@palmerdabbelt-glaptop>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <f5324234-e87e-c7e9-8f54-d13b6f403171@ghiti.fr>
Date: Fri, 23 Apr 2021 03:52:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <mhng-308e5471-7834-470f-8111-9d140ad33ac9@palmerdabbelt-glaptop>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_005231_351192_6EBB1DF7 
X-CRM114-Status: GOOD (  32.69  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Palmer,

Le 4/23/21 =E0 12:22 AM, Palmer Dabbelt a =E9crit=A0:
> On Mon, 12 Apr 2021 23:35:14 PDT (-0700), alex@ghiti.fr wrote:
>> From: Vitaly Wool <vitaly.wool@konsulko.com>
>>
>> Introduce XIP (eXecute In Place) support for RISC-V platforms.
>> It allows code to be executed directly from non-volatile storage
>> directly addressable by the CPU, such as QSPI NOR flash which can
>> be found on many RISC-V platforms. This makes way for significant
>> optimization of RAM footprint. The XIP kernel is not compressed
>> since it has to run directly from flash, so it will occupy more
>> space on the non-volatile storage. The physical flash address used
>> to link the kernel object files and for storing it has to be known
>> at compile time and is represented by a Kconfig option.
>>
>> XIP on RISC-V will for the time being only work on MMU-enabled
>> kernels.
>>
>> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr> [ Rebase on top of "Move
>> kernel mapping outside the linear mapping" ]
>> Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>
>> ---
>> =A0arch/riscv/Kconfig=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 |=A0 55 +++++++++++-
>> =A0arch/riscv/Makefile=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=
=A0=A0 8 +-
>> =A0arch/riscv/boot/Makefile=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 13 +++
>> =A0arch/riscv/include/asm/page.h=A0=A0=A0=A0=A0=A0 |=A0 21 +++++
>> =A0arch/riscv/include/asm/pgtable.h=A0=A0=A0 |=A0 25 +++++-
>> =A0arch/riscv/kernel/head.S=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 46 +++=
++++++-
>> =A0arch/riscv/kernel/head.h=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0 3 +
>> =A0arch/riscv/kernel/setup.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 10 ++-
>> =A0arch/riscv/kernel/vmlinux-xip.lds.S | 133 ++++++++++++++++++++++++++++
>> =A0arch/riscv/kernel/vmlinux.lds.S=A0=A0=A0=A0 |=A0=A0 6 ++
>> =A0arch/riscv/mm/init.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 1=
15 ++++++++++++++++++++++--
>> =A011 files changed, 418 insertions(+), 17 deletions(-)
>> =A0create mode 100644 arch/riscv/kernel/vmlinux-xip.lds.S
>>
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index 8ea60a0a19ae..7c7efdd67a10 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -28,7 +28,7 @@ config RISCV
>> =A0=A0=A0=A0 select ARCH_HAS_PTE_SPECIAL
>> =A0=A0=A0=A0 select ARCH_HAS_SET_DIRECT_MAP
>> =A0=A0=A0=A0 select ARCH_HAS_SET_MEMORY
>> -=A0=A0=A0 select ARCH_HAS_STRICT_KERNEL_RWX if MMU
>> +=A0=A0=A0 select ARCH_HAS_STRICT_KERNEL_RWX if MMU && !XIP_KERNEL
> =

> We now also have STRICT_MODULE_RWX, which causes a merge conflict.=A0 I'v=
e =

> added both as !XIP_KERNEL, though TBH I'm not even sure thot modules =

> make any sense with XIP.
> =

>> =A0=A0=A0=A0 select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROAD=
CAST
>> =A0=A0=A0=A0 select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_R=
WX
>> =A0=A0=A0=A0 select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
>> @@ -441,7 +441,7 @@ config EFI_STUB
>>
>> =A0config EFI
>> =A0=A0=A0=A0 bool "UEFI runtime support"
>> -=A0=A0=A0 depends on OF
>> +=A0=A0=A0 depends on OF && !XIP_KERNEL
>> =A0=A0=A0=A0 select LIBFDT
>> =A0=A0=A0=A0 select UCS2_STRING
>> =A0=A0=A0=A0 select EFI_PARAMS_FROM_FDT
>> @@ -465,11 +465,60 @@ config STACKPROTECTOR_PER_TASK
>> =A0=A0=A0=A0 def_bool y
>> =A0=A0=A0=A0 depends on STACKPROTECTOR && CC_HAVE_STACKPROTECTOR_TLS
>>
>> +config PHYS_RAM_BASE_FIXED
>> +=A0=A0=A0 bool "Explicitly specified physical RAM address"
>> +=A0=A0=A0 default n
>> +
>> +config PHYS_RAM_BASE
>> +=A0=A0=A0 hex "Platform Physical RAM address"
>> +=A0=A0=A0 depends on PHYS_RAM_BASE_FIXED
>> +=A0=A0=A0 default "0x80000000"
>> +=A0=A0=A0 help
>> +=A0=A0=A0=A0=A0 This is the physical address of RAM in the system. It h=
as to be
>> +=A0=A0=A0=A0=A0 explicitly specified to run early relocations of read-w=
rite data
>> +=A0=A0=A0=A0=A0 from flash to RAM.
>> +
>> +config XIP_KERNEL
>> +=A0=A0=A0 bool "Kernel Execute-In-Place from ROM"
>> +=A0=A0=A0 depends on MMU && SPARSEMEM
>> +=A0=A0=A0 select PHYS_RAM_BASE_FIXED
>> +=A0=A0=A0 help
>> +=A0=A0=A0=A0=A0 Execute-In-Place allows the kernel to run from non-vola=
tile =

>> storage
>> +=A0=A0=A0=A0=A0 directly addressable by the CPU, such as NOR flash. Thi=
s saves RAM
>> +=A0=A0=A0=A0=A0 space since the text section of the kernel is not loade=
d from =

>> flash
>> +=A0=A0=A0=A0=A0 to RAM.=A0 Read-write sections, such as the data sectio=
n and stack,
>> +=A0=A0=A0=A0=A0 are still copied to RAM.=A0 The XIP kernel is not compr=
essed since
>> +=A0=A0=A0=A0=A0 it has to run directly from flash, so it will take more=
 space to
>> +=A0=A0=A0=A0=A0 store it.=A0 The flash address used to link the kernel =
object files,
>> +=A0=A0=A0=A0=A0 and for storing it, is configuration dependent. Therefo=
re, if you
>> +=A0=A0=A0=A0=A0 say Y here, you must know the proper physical address w=
here to
>> +=A0=A0=A0=A0=A0 store the kernel image depending on your own flash memo=
ry usage.
>> +
>> +=A0=A0=A0=A0=A0 Also note that the make target becomes "make xipImage" =
rather than
>> +=A0=A0=A0=A0=A0 "make zImage" or "make Image".=A0 The final kernel bina=
ry to put in
>> +=A0=A0=A0=A0=A0 ROM memory will be arch/riscv/boot/xipImage.
>> +
>> +=A0=A0=A0=A0=A0 SPARSEMEM is required because the kernel text and rodat=
a that are
>> +=A0=A0=A0=A0=A0 flash resident are not backed by memmap, then any attem=
pt to get
>> +=A0=A0=A0=A0=A0 a struct page on those regions will trigger a fault.
>> +
>> +=A0=A0=A0=A0=A0 If unsure, say N.
>> +
>> +config XIP_PHYS_ADDR
>> +=A0=A0=A0 hex "XIP Kernel Physical Location"
>> +=A0=A0=A0 depends on XIP_KERNEL
>> +=A0=A0=A0 default "0x21000000"
>> +=A0=A0=A0 help
>> +=A0=A0=A0=A0=A0 This is the physical address in your flash memory the k=
ernel will
>> +=A0=A0=A0=A0=A0 be linked for and stored to.=A0 This address is depende=
nt on your
>> +=A0=A0=A0=A0=A0 own flash usage.
>> +
>> =A0endmenu
>>
>> =A0config BUILTIN_DTB
>> -=A0=A0=A0 def_bool n
>> +=A0=A0=A0 bool
>> =A0=A0=A0=A0 depends on OF
>> +=A0=A0=A0 default y if XIP_KERNEL
>>
>> =A0menu "Power management options"
>>
>> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
>> index 1368d943f1f3..8fcbec03974d 100644
>> --- a/arch/riscv/Makefile
>> +++ b/arch/riscv/Makefile
>> @@ -82,7 +82,11 @@ CHECKFLAGS +=3D -D__riscv -D__riscv_xlen=3D$(BITS)
>>
>> =A0# Default target when executing plain make
>> =A0boot=A0=A0=A0=A0=A0=A0=A0 :=3D arch/riscv/boot
>> +ifeq ($(CONFIG_XIP_KERNEL),y)
>> +KBUILD_IMAGE :=3D $(boot)/xipImage
>> +else
>> =A0KBUILD_IMAGE=A0=A0=A0 :=3D $(boot)/Image.gz
>> +endif
>>
>> =A0head-y :=3D arch/riscv/kernel/head.o
>>
>> @@ -95,12 +99,14 @@ PHONY +=3D vdso_install
>> =A0vdso_install:
>> =A0=A0=A0=A0 $(Q)$(MAKE) $(build)=3Darch/riscv/kernel/vdso $@
>>
>> +ifneq ($(CONFIG_XIP_KERNEL),y)
>> =A0ifeq ($(CONFIG_RISCV_M_MODE)$(CONFIG_SOC_CANAAN),yy)
>> =A0KBUILD_IMAGE :=3D $(boot)/loader.bin
>> =A0else
>> =A0KBUILD_IMAGE :=3D $(boot)/Image.gz
>> =A0endif
>> -BOOT_TARGETS :=3D Image Image.gz loader loader.bin
>> +endif
>> +BOOT_TARGETS :=3D Image Image.gz loader loader.bin xipImage
>>
>> =A0all:=A0=A0=A0 $(notdir $(KBUILD_IMAGE))
>>
>> diff --git a/arch/riscv/boot/Makefile b/arch/riscv/boot/Makefile
>> index 03404c84f971..6bf299f70c27 100644
>> --- a/arch/riscv/boot/Makefile
>> +++ b/arch/riscv/boot/Makefile
>> @@ -17,8 +17,21 @@
>> =A0KCOV_INSTRUMENT :=3D n
>>
>> =A0OBJCOPYFLAGS_Image :=3D-O binary -R .note -R .note.gnu.build-id -R =

>> .comment -S
>> +OBJCOPYFLAGS_xipImage :=3D-O binary -R .note -R .note.gnu.build-id -R =

>> .comment -S
>>
>> =A0targets :=3D Image Image.* loader loader.o loader.lds loader.bin
>> +targets :=3D Image Image.* loader loader.o loader.lds loader.bin xipIma=
ge
>> +
>> +ifeq ($(CONFIG_XIP_KERNEL),y)
>> +
>> +quiet_cmd_mkxip =3D $(quiet_cmd_objcopy)
>> +cmd_mkxip =3D $(cmd_objcopy)
>> +
>> +$(obj)/xipImage: vmlinux FORCE
>> +=A0=A0=A0 $(call if_changed,mkxip)
>> +=A0=A0=A0 @$(kecho) '=A0 Physical Address of xipImage: $(CONFIG_XIP_PHY=
S_ADDR)'
>> +
>> +endif
>>
>> =A0$(obj)/Image: vmlinux FORCE
>> =A0=A0=A0=A0 $(call if_changed,objcopy)
>> diff --git a/arch/riscv/include/asm/page.h =

>> b/arch/riscv/include/asm/page.h
>> index 22cfb2be60dc..635c6b486806 100644
>> --- a/arch/riscv/include/asm/page.h
>> +++ b/arch/riscv/include/asm/page.h
>> @@ -91,6 +91,9 @@ typedef struct page *pgtable_t;
>> =A0#ifdef CONFIG_MMU
>> =A0extern unsigned long va_pa_offset;
>> =A0extern unsigned long va_kernel_pa_offset;
>> +#ifdef CONFIG_XIP_KERNEL
>> +extern unsigned long va_kernel_xip_pa_offset;
>> +#endif
>> =A0extern unsigned long pfn_base;
>> =A0#define ARCH_PFN_OFFSET=A0=A0=A0=A0=A0=A0=A0 (pfn_base)
>> =A0#else
>> @@ -102,11 +105,29 @@ extern unsigned long pfn_base;
>> =A0extern unsigned long kernel_virt_addr;
>>
>> =A0#define linear_mapping_pa_to_va(x)=A0=A0=A0 ((void *)((unsigned long)=
(x) + =

>> va_pa_offset))
>> +#ifdef CONFIG_XIP_KERNEL
>> +#define kernel_mapping_pa_to_va(y)=A0=A0=A0 ({=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
>> +=A0=A0=A0 unsigned long _y =3D y;=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
>> +=A0=A0=A0 (_y >=3D CONFIG_PHYS_RAM_BASE) ?=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
>> +=A0=A0=A0=A0=A0=A0=A0 (void *)((unsigned long)(_y) + va_kernel_pa_offse=
t + =

>> XIP_OFFSET) :=A0=A0=A0 \
>> +=A0=A0=A0=A0=A0=A0=A0 (void *)((unsigned long)(_y) + =

>> va_kernel_xip_pa_offset);=A0=A0=A0=A0=A0=A0=A0 \
>> +=A0=A0=A0 })
>> +#else
>> =A0#define kernel_mapping_pa_to_va(x)=A0=A0=A0 ((void *)((unsigned long)=
(x) + =

>> va_kernel_pa_offset))
>> +#endif
>> =A0#define __pa_to_va_nodebug(x)=A0=A0=A0=A0=A0=A0=A0 linear_mapping_pa_=
to_va(x)
>>
>> =A0#define linear_mapping_va_to_pa(x)=A0=A0=A0 ((unsigned long)(x) - =

>> va_pa_offset)
>> +#ifdef CONFIG_XIP_KERNEL
>> +#define kernel_mapping_va_to_pa(y) ({=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
>> +=A0=A0=A0 unsigned long _y =3D y;=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
>> +=A0=A0=A0 (_y < kernel_virt_addr + XIP_OFFSET) ?=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
>> +=A0=A0=A0=A0=A0=A0=A0 ((unsigned long)(_y) - va_kernel_xip_pa_offset) :=
=A0=A0=A0=A0=A0=A0=A0 \
>> +=A0=A0=A0=A0=A0=A0=A0 ((unsigned long)(_y) - va_kernel_pa_offset - XIP_=
OFFSET);=A0=A0=A0 \
>> +=A0=A0=A0 })
>> +#else
>> =A0#define kernel_mapping_va_to_pa(x)=A0=A0=A0 ((unsigned long)(x) - =

>> va_kernel_pa_offset)
>> +#endif
>> =A0#define __va_to_pa_nodebug(x)=A0=A0=A0 ({=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
>> =A0=A0=A0=A0 unsigned long _x =3D x;=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
>> =A0=A0=A0=A0 (_x < kernel_virt_addr) ?=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
>> diff --git a/arch/riscv/include/asm/pgtable.h =

>> b/arch/riscv/include/asm/pgtable.h
>> index 80e63a93e903..c2dc4f83eed8 100644
>> --- a/arch/riscv/include/asm/pgtable.h
>> +++ b/arch/riscv/include/asm/pgtable.h
>> @@ -64,6 +64,19 @@
>> =A0#define FIXADDR_SIZE=A0=A0=A0=A0 PGDIR_SIZE
>> =A0#endif
>> =A0#define FIXADDR_START=A0=A0=A0 (FIXADDR_TOP - FIXADDR_SIZE)
>> +
>> +#ifdef CONFIG_XIP_KERNEL
>> +#define XIP_OFFSET=A0=A0=A0=A0=A0=A0=A0 SZ_8M
>> +#define XIP_FIXUP(addr) ({=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
>> +=A0=A0=A0 uintptr_t __a =3D (uintptr_t)(addr);=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
>> +=A0=A0=A0 (__a >=3D CONFIG_XIP_PHYS_ADDR && __a < CONFIG_XIP_PHYS_ADDR =
+ =

>> SZ_16M) ?=A0=A0=A0 \
>> +=A0=A0=A0=A0=A0=A0=A0 __a - CONFIG_XIP_PHYS_ADDR + CONFIG_PHYS_RAM_BASE=
 - =

>> XIP_OFFSET :\
>> +=A0=A0=A0=A0=A0=A0=A0 __a;=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
>> +=A0=A0=A0 })
>> +#else
>> +#define XIP_FIXUP(addr)=A0=A0=A0=A0=A0=A0=A0 (addr)
>> +#endif /* CONFIG_XIP_KERNEL */
>> +
>> =A0#endif
>>
>> =A0#ifndef __ASSEMBLY__
>> @@ -499,8 +512,16 @@ static inline int ptep_clear_flush_young(struct =

>> vm_area_struct *vma,
>> =A0#define kern_addr_valid(addr)=A0=A0 (1) /* FIXME */
>>
>> =A0extern char _start[];
>> -extern void *dtb_early_va;
>> -extern uintptr_t dtb_early_pa;
>> +extern void *_dtb_early_va;
>> +extern uintptr_t _dtb_early_pa;
>> +#if defined(CONFIG_XIP_KERNEL) && defined(CONFIG_MMU)
>> +#define dtb_early_va=A0=A0=A0 (*(void **)XIP_FIXUP(&_dtb_early_va))
>> +#define dtb_early_pa=A0=A0=A0 (*(uintptr_t *)XIP_FIXUP(&_dtb_early_pa))
>> +#else
>> +#define dtb_early_va=A0=A0=A0 _dtb_early_va
>> +#define dtb_early_pa=A0=A0=A0 _dtb_early_pa
>> +#endif /* CONFIG_XIP_KERNEL */
>> +
>> =A0void setup_bootmem(void);
>> =A0void paging_init(void);
>> =A0void misc_mem_init(void);
>> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
>> index 6cb05f22e52a..89cc58ab52b4 100644
>> --- a/arch/riscv/kernel/head.S
>> +++ b/arch/riscv/kernel/head.S
>> @@ -9,11 +9,23 @@
>> =A0#include <linux/linkage.h>
>> =A0#include <asm/thread_info.h>
>> =A0#include <asm/page.h>
>> +#include <asm/pgtable.h>
>> =A0#include <asm/csr.h>
>> =A0#include <asm/hwcap.h>
>> =A0#include <asm/image.h>
>> =A0#include "efi-header.S"
>>
>> +#ifdef CONFIG_XIP_KERNEL
>> +.macro XIP_FIXUP_OFFSET reg
>> +=A0=A0=A0 REG_L t0, _xip_fixup
>> +=A0=A0=A0 add \reg, \reg, t0
>> +.endm
>> +_xip_fixup: .dword CONFIG_PHYS_RAM_BASE - CONFIG_XIP_PHYS_ADDR - =

>> XIP_OFFSET
>> +#else
>> +.macro XIP_FIXUP_OFFSET reg
>> +.endm
>> +#endif /* CONFIG_XIP_KERNEL */
>> +
>> =A0__HEAD
>> =A0ENTRY(_start)
>> =A0=A0=A0=A0 /*
>> @@ -70,6 +82,7 @@ pe_head_start:
>> =A0relocate:
>> =A0=A0=A0=A0 /* Relocate return address */
>> =A0=A0=A0=A0 la a1, kernel_virt_addr
>> +=A0=A0=A0 XIP_FIXUP_OFFSET a1
>> =A0=A0=A0=A0 REG_L a1, 0(a1)
>> =A0=A0=A0=A0 la a2, _start
>> =A0=A0=A0=A0 sub a1, a1, a2
>> @@ -92,6 +105,7 @@ relocate:
>> =A0=A0=A0=A0=A0 * to ensure the new translations are in use.
>> =A0=A0=A0=A0=A0 */
>> =A0=A0=A0=A0 la a0, trampoline_pg_dir
>> +=A0=A0=A0 XIP_FIXUP_OFFSET a0
>> =A0=A0=A0=A0 srl a0, a0, PAGE_SHIFT
>> =A0=A0=A0=A0 or a0, a0, a1
>> =A0=A0=A0=A0 sfence.vma
>> @@ -145,7 +159,9 @@ secondary_start_sbi:
>>
>> =A0=A0=A0=A0 slli a3, a0, LGREG
>> =A0=A0=A0=A0 la a4, __cpu_up_stack_pointer
>> +=A0=A0=A0 XIP_FIXUP_OFFSET a4
>> =A0=A0=A0=A0 la a5, __cpu_up_task_pointer
>> +=A0=A0=A0 XIP_FIXUP_OFFSET a5
>> =A0=A0=A0=A0 add a4, a3, a4
>> =A0=A0=A0=A0 add a5, a3, a5
>> =A0=A0=A0=A0 REG_L sp, (a4)
>> @@ -157,6 +173,7 @@ secondary_start_common:
>> =A0#ifdef CONFIG_MMU
>> =A0=A0=A0=A0 /* Enable virtual memory and relocate to virtual address */
>> =A0=A0=A0=A0 la a0, swapper_pg_dir
>> +=A0=A0=A0 XIP_FIXUP_OFFSET a0
>> =A0=A0=A0=A0 call relocate
>> =A0#endif
>> =A0=A0=A0=A0 call setup_trap_vector
>> @@ -237,12 +254,33 @@ pmp_done:
>> =A0.Lgood_cores:
>> =A0#endif
>>
>> +#ifndef CONFIG_XIP_KERNEL
>> =A0=A0=A0=A0 /* Pick one hart to run the main boot sequence */
>> =A0=A0=A0=A0 la a3, hart_lottery
>> =A0=A0=A0=A0 li a2, 1
>> =A0=A0=A0=A0 amoadd.w a3, a2, (a3)
>> =A0=A0=A0=A0 bnez a3, .Lsecondary_start
>>
>> +#else
>> +=A0=A0=A0 /* hart_lottery in flash contains a magic number */
>> +=A0=A0=A0 la a3, hart_lottery
>> +=A0=A0=A0 mv a2, a3
>> +=A0=A0=A0 XIP_FIXUP_OFFSET a2
>> +=A0=A0=A0 lw t1, (a3)
>> +=A0=A0=A0 amoswap.w t0, t1, (a2)
>> +=A0=A0=A0 /* first time here if hart_lottery in RAM is not set */
>> +=A0=A0=A0 beq t0, t1, .Lsecondary_start
>> +
>> +=A0=A0=A0 la sp, _end + THREAD_SIZE
>> +=A0=A0=A0 XIP_FIXUP_OFFSET sp
>> +=A0=A0=A0 mv s0, a0
>> +=A0=A0=A0 call __copy_data
>> +
>> +=A0=A0=A0 /* Restore a0 copy */
>> +=A0=A0=A0 mv a0, s0
>> +#endif
>> +
>> +#ifndef CONFIG_XIP_KERNEL
>> =A0=A0=A0=A0 /* Clear BSS for flat non-ELF images */
>> =A0=A0=A0=A0 la a3, __bss_start
>> =A0=A0=A0=A0 la a4, __bss_stop
>> @@ -252,15 +290,18 @@ clear_bss:
>> =A0=A0=A0=A0 add a3, a3, RISCV_SZPTR
>> =A0=A0=A0=A0 blt a3, a4, clear_bss
>> =A0clear_bss_done:
>> -
>> +#endif
>> =A0=A0=A0=A0 /* Save hart ID and DTB physical address */
>> =A0=A0=A0=A0 mv s0, a0
>> =A0=A0=A0=A0 mv s1, a1
>> +
>> =A0=A0=A0=A0 la a2, boot_cpu_hartid
>> +=A0=A0=A0 XIP_FIXUP_OFFSET a2
>> =A0=A0=A0=A0 REG_S a0, (a2)
>>
>> =A0=A0=A0=A0 /* Initialize page tables and relocate to virtual addresses=
 */
>> =A0=A0=A0=A0 la sp, init_thread_union + THREAD_SIZE
>> +=A0=A0=A0 XIP_FIXUP_OFFSET sp
>> =A0#ifdef CONFIG_BUILTIN_DTB
>> =A0=A0=A0=A0 la a0, __dtb_start
>> =A0#else
>> @@ -269,6 +310,7 @@ clear_bss_done:
>> =A0=A0=A0=A0 call setup_vm
>> =A0#ifdef CONFIG_MMU
>> =A0=A0=A0=A0 la a0, early_pg_dir
>> +=A0=A0=A0 XIP_FIXUP_OFFSET a0
>> =A0=A0=A0=A0 call relocate
>> =A0#endif /* CONFIG_MMU */
>>
>> @@ -293,7 +335,9 @@ clear_bss_done:
>>
>> =A0=A0=A0=A0 slli a3, a0, LGREG
>> =A0=A0=A0=A0 la a1, __cpu_up_stack_pointer
>> +=A0=A0=A0 XIP_FIXUP_OFFSET a1
>> =A0=A0=A0=A0 la a2, __cpu_up_task_pointer
>> +=A0=A0=A0 XIP_FIXUP_OFFSET a2
>> =A0=A0=A0=A0 add a1, a3, a1
>> =A0=A0=A0=A0 add a2, a3, a2
>>
>> diff --git a/arch/riscv/kernel/head.h b/arch/riscv/kernel/head.h
>> index b48dda3d04f6..aabbc3ac3e48 100644
>> --- a/arch/riscv/kernel/head.h
>> +++ b/arch/riscv/kernel/head.h
>> @@ -12,6 +12,9 @@ extern atomic_t hart_lottery;
>>
>> =A0asmlinkage void do_page_fault(struct pt_regs *regs);
>> =A0asmlinkage void __init setup_vm(uintptr_t dtb_pa);
>> +#ifdef CONFIG_XIP_KERNEL
>> +asmlinkage void __init __copy_data(void);
>> +#endif
>>
>> =A0extern void *__cpu_up_stack_pointer[];
>> =A0extern void *__cpu_up_task_pointer[];
>> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
>> index 30e4af0fd50c..2ddf654c72bb 100644
>> --- a/arch/riscv/kernel/setup.c
>> +++ b/arch/riscv/kernel/setup.c
>> @@ -50,7 +50,11 @@ struct screen_info screen_info __section(".data") =3D=
 {
>> =A0 * This is used before the kernel initializes the BSS so it can't be =

>> in the
>> =A0 * BSS.
>> =A0 */
>> -atomic_t hart_lottery __section(".sdata");
>> +atomic_t hart_lottery __section(".sdata")
>> +#ifdef CONFIG_XIP_KERNEL
>> +=3D ATOMIC_INIT(0xC001BEEF)
>> +#endif
>> +;
>> =A0unsigned long boot_cpu_hartid;
>> =A0static DEFINE_PER_CPU(struct cpu, cpu_devices);
>>
>> @@ -254,7 +258,7 @@ void __init setup_arch(char **cmdline_p)
>> =A0#if IS_ENABLED(CONFIG_BUILTIN_DTB)
>> =A0=A0=A0=A0 unflatten_and_copy_device_tree();
>> =A0#else
>> -=A0=A0=A0 if (early_init_dt_verify(__va(dtb_early_pa)))
>> +=A0=A0=A0 if (early_init_dt_verify(__va(XIP_FIXUP(dtb_early_pa))))
>> =A0=A0=A0=A0=A0=A0=A0=A0 unflatten_device_tree();
>> =A0=A0=A0=A0 else
>> =A0=A0=A0=A0=A0=A0=A0=A0 pr_err("No DTB found in kernel mappings\n");
>> @@ -266,7 +270,7 @@ void __init setup_arch(char **cmdline_p)
>> =A0=A0=A0=A0 if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
>> =A0=A0=A0=A0=A0=A0=A0=A0 protect_kernel_text_data();
>>
>> -#if defined(CONFIG_64BIT) && defined(CONFIG_MMU)
>> +#if defined(CONFIG_64BIT) && defined(CONFIG_MMU) && =

>> !defined(CONFIG_XIP_KERNEL)
>> =A0=A0=A0=A0 protect_kernel_linear_mapping_text_rodata();
>> =A0#endif
> =

> My tree doesn't look quite like this.

Yes, this is because you have the patch "riscv: Protect kernel linear =

mapping only if CONFIG_STRICT_KERNEL_RWX is set".

> Not sure if I just got the wrong =

> version of something, but I didn't have the CONFIG_MMU check.=A0 It turns =

> out that, as I was merging this in, I saw that failing allnoconfig =

> (which is !MMU).=A0 I went ahead and squashed in
> =

> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index ab394d173cd4..3e7930869ee7 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -266,7 +266,7 @@ void __init setup_arch(char **cmdline_p)
> =

>  =A0=A0=A0=A0if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX)) {
>  =A0=A0=A0=A0=A0=A0=A0 protect_kernel_text_data();
> -#ifdef CONFIG_64BIT
> +#if defined(CONFIG_64BIT) && defined(CONFIG_MMU)

You did the right thing here, I thought the MMU check was not necessary =

since STRICT_KERNEL_RWX depends on MMU but the check is done at =

runtime...My bad.

>  =A0=A0=A0=A0=A0=A0=A0 protect_kernel_linear_mapping_text_rodata();
> #endif
>  =A0=A0=A0=A0}
> =

> to your memory map rearrangement patch, but I'm a bit worried that I =

> managed to
> miss something in the process.

I gave it a try and it works as expected on for-next.

Thanks,

Alex

> =

>>
>> diff --git a/arch/riscv/kernel/vmlinux-xip.lds.S =

>> b/arch/riscv/kernel/vmlinux-xip.lds.S
>> new file mode 100644
>> index 000000000000..4b29b9917f99
>> --- /dev/null
>> +++ b/arch/riscv/kernel/vmlinux-xip.lds.S
>> @@ -0,0 +1,133 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (C) 2012 Regents of the University of California
>> + * Copyright (C) 2017 SiFive
>> + * Copyright (C) 2020 Vitaly Wool, Konsulko AB
>> + */
>> +
>> +#include <asm/pgtable.h>
>> +#define LOAD_OFFSET KERNEL_LINK_ADDR
>> +/* No __ro_after_init data in the .rodata section - which will always =

>> be ro */
>> +#define RO_AFTER_INIT_DATA
>> +
>> +#include <asm/vmlinux.lds.h>
>> +#include <asm/page.h>
>> +#include <asm/pgtable.h>
>> +#include <asm/cache.h>
>> +#include <asm/thread_info.h>
>> +
>> +OUTPUT_ARCH(riscv)
>> +ENTRY(_start)
>> +
>> +jiffies =3D jiffies_64;
>> +
>> +SECTIONS
>> +{
>> +=A0=A0=A0 /* Beginning of code and text segment */
>> +=A0=A0=A0 . =3D LOAD_OFFSET;
>> +=A0=A0=A0 _xiprom =3D .;
>> +=A0=A0=A0 _start =3D .;
>> +=A0=A0=A0 HEAD_TEXT_SECTION
>> +=A0=A0=A0 INIT_TEXT_SECTION(PAGE_SIZE)
>> +=A0=A0=A0 /* we have to discard exit text and such at runtime, not link =

>> time */
>> +=A0=A0=A0 .exit.text :
>> +=A0=A0=A0 {
>> +=A0=A0=A0=A0=A0=A0=A0 EXIT_TEXT
>> +=A0=A0=A0 }
>> +
>> +=A0=A0=A0 .text : {
>> +=A0=A0=A0=A0=A0=A0=A0 _text =3D .;
>> +=A0=A0=A0=A0=A0=A0=A0 _stext =3D .;
>> +=A0=A0=A0=A0=A0=A0=A0 TEXT_TEXT
>> +=A0=A0=A0=A0=A0=A0=A0 SCHED_TEXT
>> +=A0=A0=A0=A0=A0=A0=A0 CPUIDLE_TEXT
>> +=A0=A0=A0=A0=A0=A0=A0 LOCK_TEXT
>> +=A0=A0=A0=A0=A0=A0=A0 KPROBES_TEXT
>> +=A0=A0=A0=A0=A0=A0=A0 ENTRY_TEXT
>> +=A0=A0=A0=A0=A0=A0=A0 IRQENTRY_TEXT
>> +=A0=A0=A0=A0=A0=A0=A0 SOFTIRQENTRY_TEXT
>> +=A0=A0=A0=A0=A0=A0=A0 *(.fixup)
>> +=A0=A0=A0=A0=A0=A0=A0 _etext =3D .;
>> +=A0=A0=A0 }
>> +=A0=A0=A0 RO_DATA(L1_CACHE_BYTES)
>> +=A0=A0=A0 .srodata : {
>> +=A0=A0=A0=A0=A0=A0=A0 *(.srodata*)
>> +=A0=A0=A0 }
>> +=A0=A0=A0 .init.rodata : {
>> +=A0=A0=A0=A0=A0=A0=A0 INIT_SETUP(16)
>> +=A0=A0=A0=A0=A0=A0=A0 INIT_CALLS
>> +=A0=A0=A0=A0=A0=A0=A0 CON_INITCALL
>> +=A0=A0=A0=A0=A0=A0=A0 INIT_RAM_FS
>> +=A0=A0=A0 }
>> +=A0=A0=A0 _exiprom =3D .;=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* End of XI=
P ROM area */
>> +
>> +
>> +/*
>> + * From this point, stuff is considered writable and will be copied =

>> to RAM
>> + */
>> +=A0=A0=A0 __data_loc =3D ALIGN(16);=A0=A0=A0=A0=A0=A0=A0 /* location in=
 file */
>> +=A0=A0=A0 . =3D LOAD_OFFSET + XIP_OFFSET;=A0=A0=A0 /* location in memor=
y */
>> +
>> +=A0=A0=A0 _sdata =3D .;=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* Start of da=
ta section */
>> +=A0=A0=A0 _data =3D .;
>> +=A0=A0=A0 RW_DATA(L1_CACHE_BYTES, PAGE_SIZE, THREAD_SIZE)
>> +=A0=A0=A0 _edata =3D .;
>> +=A0=A0=A0 __start_ro_after_init =3D .;
>> +=A0=A0=A0 .data.ro_after_init : AT(ADDR(.data.ro_after_init) - LOAD_OFF=
SET) {
>> +=A0=A0=A0=A0=A0=A0=A0 *(.data..ro_after_init)
>> +=A0=A0=A0 }
>> +=A0=A0=A0 __end_ro_after_init =3D .;
>> +
>> +=A0=A0=A0 . =3D ALIGN(PAGE_SIZE);
>> +=A0=A0=A0 __init_begin =3D .;
>> +=A0=A0=A0 .init.data : {
>> +=A0=A0=A0=A0=A0=A0=A0 INIT_DATA
>> +=A0=A0=A0 }
>> +=A0=A0=A0 .exit.data : {
>> +=A0=A0=A0=A0=A0=A0=A0 EXIT_DATA
>> +=A0=A0=A0 }
>> +=A0=A0=A0 . =3D ALIGN(8);
>> +=A0=A0=A0 __soc_early_init_table : {
>> +=A0=A0=A0=A0=A0=A0=A0 __soc_early_init_table_start =3D .;
>> +=A0=A0=A0=A0=A0=A0=A0 KEEP(*(__soc_early_init_table))
>> +=A0=A0=A0=A0=A0=A0=A0 __soc_early_init_table_end =3D .;
>> +=A0=A0=A0 }
>> +=A0=A0=A0 __soc_builtin_dtb_table : {
>> +=A0=A0=A0=A0=A0=A0=A0 __soc_builtin_dtb_table_start =3D .;
>> +=A0=A0=A0=A0=A0=A0=A0 KEEP(*(__soc_builtin_dtb_table))
>> +=A0=A0=A0=A0=A0=A0=A0 __soc_builtin_dtb_table_end =3D .;
>> +=A0=A0=A0 }
>> +=A0=A0=A0 PERCPU_SECTION(L1_CACHE_BYTES)
>> +
>> +=A0=A0=A0 . =3D ALIGN(PAGE_SIZE);
>> +=A0=A0=A0 __init_end =3D .;
>> +
>> +=A0=A0=A0 .sdata : {
>> +=A0=A0=A0=A0=A0=A0=A0 __global_pointer$ =3D . + 0x800;
>> +=A0=A0=A0=A0=A0=A0=A0 *(.sdata*)
>> +=A0=A0=A0=A0=A0=A0=A0 *(.sbss*)
>> +=A0=A0=A0 }
>> +
>> +=A0=A0=A0 BSS_SECTION(PAGE_SIZE, PAGE_SIZE, 0)
>> +=A0=A0=A0 EXCEPTION_TABLE(0x10)
>> +
>> +=A0=A0=A0 .rel.dyn : AT(ADDR(.rel.dyn) - LOAD_OFFSET) {
>> +=A0=A0=A0=A0=A0=A0=A0 *(.rel.dyn*)
>> +=A0=A0=A0 }
>> +
>> +=A0=A0=A0 /*
>> +=A0=A0=A0=A0 * End of copied data. We need a dummy section to get its L=
MA.
>> +=A0=A0=A0=A0 * Also located before final ALIGN() as trailing padding is=
 not =

>> stored
>> +=A0=A0=A0=A0 * in the resulting binary file and useless to copy.
>> +=A0=A0=A0=A0 */
>> +=A0=A0=A0 .data.endmark : AT(ADDR(.data.endmark) - LOAD_OFFSET) { }
>> +=A0=A0=A0 _edata_loc =3D LOADADDR(.data.endmark);
>> +
>> +=A0=A0=A0 . =3D ALIGN(PAGE_SIZE);
>> +=A0=A0=A0 _end =3D .;
>> +
>> +=A0=A0=A0 STABS_DEBUG
>> +=A0=A0=A0 DWARF_DEBUG
>> +
>> +=A0=A0=A0 DISCARDS
>> +}
>> diff --git a/arch/riscv/kernel/vmlinux.lds.S =

>> b/arch/riscv/kernel/vmlinux.lds.S
>> index 0726c05e0336..0a59b65cf789 100644
>> --- a/arch/riscv/kernel/vmlinux.lds.S
>> +++ b/arch/riscv/kernel/vmlinux.lds.S
>> @@ -4,8 +4,13 @@
>> =A0 * Copyright (C) 2017 SiFive
>> =A0 */
>>
>> +#ifdef CONFIG_XIP_KERNEL
>> +#include "vmlinux-xip.lds.S"
>> +#else
>> +
>> =A0#include <asm/pgtable.h>
>> =A0#define LOAD_OFFSET KERNEL_LINK_ADDR
>> +
>> =A0#include <asm/vmlinux.lds.h>
>> =A0#include <asm/page.h>
>> =A0#include <asm/cache.h>
>> @@ -133,3 +138,4 @@ SECTIONS
>>
>> =A0=A0=A0=A0 DISCARDS
>> =A0}
>> +#endif /* CONFIG_XIP_KERNEL */
>> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>> index 093f3a96ecfc..d03e5e43d2d0 100644
>> --- a/arch/riscv/mm/init.c
>> +++ b/arch/riscv/mm/init.c
>> @@ -27,6 +27,9 @@
>>
>> =A0unsigned long kernel_virt_addr =3D KERNEL_LINK_ADDR;
>> =A0EXPORT_SYMBOL(kernel_virt_addr);
>> +#ifdef CONFIG_XIP_KERNEL
>> +#define kernel_virt_addr=A0=A0=A0=A0=A0=A0 (*((unsigned long =

>> *)XIP_FIXUP(&kernel_virt_addr)))
>> +#endif
>>
>> =A0unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)]
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 __page_aligned_bss;
>> @@ -34,8 +37,8 @@ EXPORT_SYMBOL(empty_zero_page);
>>
>> =A0extern char _start[];
>> =A0#define DTB_EARLY_BASE_VA=A0=A0=A0=A0=A0 PGDIR_SIZE
>> -void *dtb_early_va __initdata;
>> -uintptr_t dtb_early_pa __initdata;
>> +void *_dtb_early_va __initdata;
>> +uintptr_t _dtb_early_pa __initdata;
>>
>> =A0struct pt_alloc_ops {
>> =A0=A0=A0=A0 pte_t *(*get_pte_virt)(phys_addr_t pa);
>> @@ -118,6 +121,10 @@ void __init setup_bootmem(void)
>> =A0=A0=A0=A0 phys_addr_t dram_end =3D memblock_end_of_DRAM();
>> =A0=A0=A0=A0 phys_addr_t max_mapped_addr =3D __pa(~(ulong)0);
>>
>> +#ifdef CONFIG_XIP_KERNEL
>> +=A0=A0=A0 vmlinux_start =3D __pa_symbol(&_sdata);
>> +#endif
>> +
>> =A0=A0=A0=A0 /* The maximal physical memory size is -PAGE_OFFSET. */
>> =A0=A0=A0=A0 memblock_enforce_memory_limit(-PAGE_OFFSET);
>>
>> @@ -159,15 +166,39 @@ void __init setup_bootmem(void)
>> =A0=A0=A0=A0 memblock_allow_resize();
>> =A0}
>>
>> +#ifdef CONFIG_XIP_KERNEL
>> +
>> +extern char _xiprom[], _exiprom[];
>> +extern char _sdata[], _edata[];
>> +
>> +#endif /* CONFIG_XIP_KERNEL */
>> +
>> =A0#ifdef CONFIG_MMU
>> -static struct pt_alloc_ops pt_ops;
>> +static struct pt_alloc_ops _pt_ops;
>> +
>> +#ifdef CONFIG_XIP_KERNEL
>> +#define pt_ops (*(struct pt_alloc_ops *)XIP_FIXUP(&_pt_ops))
>> +#else
>> +#define pt_ops _pt_ops
>> +#endif
>>
>> =A0/* Offset between linear mapping virtual address and kernel load =

>> address */
>> =A0unsigned long va_pa_offset;
>> =A0EXPORT_SYMBOL(va_pa_offset);
>> +#ifdef CONFIG_XIP_KERNEL
>> +#define va_pa_offset=A0=A0 (*((unsigned long *)XIP_FIXUP(&va_pa_offset)=
))
>> +#endif
>> =A0/* Offset between kernel mapping virtual address and kernel load =

>> address */
>> =A0unsigned long va_kernel_pa_offset;
>> =A0EXPORT_SYMBOL(va_kernel_pa_offset);
>> +#ifdef CONFIG_XIP_KERNEL
>> +#define va_kernel_pa_offset=A0=A0=A0 (*((unsigned long =

>> *)XIP_FIXUP(&va_kernel_pa_offset)))
>> +#endif
>> +unsigned long va_kernel_xip_pa_offset;
>> +EXPORT_SYMBOL(va_kernel_xip_pa_offset);
>> +#ifdef CONFIG_XIP_KERNEL
>> +#define va_kernel_xip_pa_offset=A0=A0=A0=A0=A0=A0=A0 (*((unsigned long =

>> *)XIP_FIXUP(&va_kernel_xip_pa_offset)))
>> +#endif
>> =A0unsigned long pfn_base;
>> =A0EXPORT_SYMBOL(pfn_base);
>>
>> @@ -177,6 +208,12 @@ pte_t fixmap_pte[PTRS_PER_PTE] __page_aligned_bss;
>>
>> =A0pgd_t early_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
>>
>> +#ifdef CONFIG_XIP_KERNEL
>> +#define trampoline_pg_dir=A0=A0=A0=A0=A0 ((pgd_t *)XIP_FIXUP(trampoline=
_pg_dir))
>> +#define fixmap_pte=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ((pte_t *)XIP_FI=
XUP(fixmap_pte))
>> +#define early_pg_dir=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ((pgd_t *)XIP_FIXUP(=
early_pg_dir))
>> +#endif /* CONFIG_XIP_KERNEL */
>> +
>> =A0void __set_fixmap(enum fixed_addresses idx, phys_addr_t phys, =

>> pgprot_t prot)
>> =A0{
>> =A0=A0=A0=A0 unsigned long addr =3D __fix_to_virt(idx);
>> @@ -252,6 +289,12 @@ pmd_t fixmap_pmd[PTRS_PER_PMD] __page_aligned_bss;
>> =A0pmd_t early_pmd[PTRS_PER_PMD] __initdata __aligned(PAGE_SIZE);
>> =A0pmd_t early_dtb_pmd[PTRS_PER_PMD] __initdata __aligned(PAGE_SIZE);
>>
>> +#ifdef CONFIG_XIP_KERNEL
>> +#define trampoline_pmd ((pmd_t *)XIP_FIXUP(trampoline_pmd))
>> +#define fixmap_pmd=A0=A0=A0=A0 ((pmd_t *)XIP_FIXUP(fixmap_pmd))
>> +#define early_pmd=A0=A0=A0=A0=A0 ((pmd_t *)XIP_FIXUP(early_pmd))
>> +#endif /* CONFIG_XIP_KERNEL */
>> +
>> =A0static pmd_t *__init get_pmd_virt_early(phys_addr_t pa)
>> =A0{
>> =A0=A0=A0=A0 /* Before MMU is enabled */
>> @@ -368,6 +411,19 @@ static uintptr_t __init best_map_size(phys_addr_t =

>> base, phys_addr_t size)
>> =A0=A0=A0=A0 return PMD_SIZE;
>> =A0}
>>
>> +#ifdef CONFIG_XIP_KERNEL
>> +/* called from head.S with MMU off */
>> +asmlinkage void __init __copy_data(void)
>> +{
>> +=A0=A0=A0 void *from =3D (void *)(&_sdata);
>> +=A0=A0=A0 void *end =3D (void *)(&_end);
>> +=A0=A0=A0 void *to =3D (void *)CONFIG_PHYS_RAM_BASE;
>> +=A0=A0=A0 size_t sz =3D (size_t)(end - from + 1);
>> +
>> +=A0=A0=A0 memcpy(to, from, sz);
>> +}
>> +#endif
>> +
>> =A0/*
>> =A0 * setup_vm() is called from head.S with MMU-off.
>> =A0 *
>> @@ -387,7 +443,35 @@ static uintptr_t __init best_map_size(phys_addr_t =

>> base, phys_addr_t size)
>> =A0#endif
>>
>> =A0uintptr_t load_pa, load_sz;
>> +#ifdef CONFIG_XIP_KERNEL
>> +#define load_pa=A0=A0=A0=A0=A0=A0=A0 (*((uintptr_t *)XIP_FIXUP(&load_pa=
)))
>> +#define load_sz=A0=A0=A0=A0=A0=A0=A0 (*((uintptr_t *)XIP_FIXUP(&load_sz=
)))
>> +#endif
>> +
>> +#ifdef CONFIG_XIP_KERNEL
>> +uintptr_t xiprom, xiprom_sz;
>> +#define xiprom_sz=A0=A0=A0=A0=A0 (*((uintptr_t *)XIP_FIXUP(&xiprom_sz)))
>> +#define xiprom=A0=A0=A0=A0=A0=A0=A0=A0 (*((uintptr_t *)XIP_FIXUP(&xipro=
m)))
>>
>> +static void __init create_kernel_page_table(pgd_t *pgdir, uintptr_t =

>> map_size)
>> +{
>> +=A0=A0=A0 uintptr_t va, end_va;
>> +
>> +=A0=A0=A0 /* Map the flash resident part */
>> +=A0=A0=A0 end_va =3D kernel_virt_addr + xiprom_sz;
>> +=A0=A0=A0 for (va =3D kernel_virt_addr; va < end_va; va +=3D map_size)
>> +=A0=A0=A0=A0=A0=A0=A0 create_pgd_mapping(pgdir, va,
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 xiprom + (va - k=
ernel_virt_addr),
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 map_size, PAGE_K=
ERNEL_EXEC);
>> +
>> +=A0=A0=A0 /* Map the data in RAM */
>> +=A0=A0=A0 end_va =3D kernel_virt_addr + XIP_OFFSET + load_sz;
>> +=A0=A0=A0 for (va =3D kernel_virt_addr + XIP_OFFSET; va < end_va; va +=
=3D =

>> map_size)
>> +=A0=A0=A0=A0=A0=A0=A0 create_pgd_mapping(pgdir, va,
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 load_pa + (va - =
(kernel_virt_addr + XIP_OFFSET)),
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 map_size, PAGE_K=
ERNEL);
>> +}
>> +#else
>> =A0static void __init create_kernel_page_table(pgd_t *pgdir, uintptr_t =

>> map_size)
>> =A0{
>> =A0=A0=A0=A0 uintptr_t va, end_va;
>> @@ -398,16 +482,28 @@ static void __init =

>> create_kernel_page_table(pgd_t *pgdir, uintptr_t map_size)
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 load_pa + (va =
- kernel_virt_addr),
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 map_size, PAGE=
_KERNEL_EXEC);
>> =A0}
>> +#endif
>>
>> =A0asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>> =A0{
>> -=A0=A0=A0 uintptr_t pa;
>> +=A0=A0=A0 uintptr_t __maybe_unused pa;
>> =A0=A0=A0=A0 uintptr_t map_size;
>> =A0#ifndef __PAGETABLE_PMD_FOLDED
>> =A0=A0=A0=A0 pmd_t fix_bmap_spmd, fix_bmap_epmd;
>> =A0#endif
>> +
>> +#ifdef CONFIG_XIP_KERNEL
>> +=A0=A0=A0 xiprom =3D (uintptr_t)CONFIG_XIP_PHYS_ADDR;
>> +=A0=A0=A0 xiprom_sz =3D (uintptr_t)(&_exiprom) - (uintptr_t)(&_xiprom);
>> +
>> +=A0=A0=A0 load_pa =3D (uintptr_t)CONFIG_PHYS_RAM_BASE;
>> +=A0=A0=A0 load_sz =3D (uintptr_t)(&_end) - (uintptr_t)(&_sdata);
>> +
>> +=A0=A0=A0 va_kernel_xip_pa_offset =3D kernel_virt_addr - xiprom;
>> +#else
>> =A0=A0=A0=A0 load_pa =3D (uintptr_t)(&_start);
>> =A0=A0=A0=A0 load_sz =3D (uintptr_t)(&_end) - load_pa;
>> +#endif
>>
>> =A0=A0=A0=A0 va_pa_offset =3D PAGE_OFFSET - load_pa;
>> =A0=A0=A0=A0 va_kernel_pa_offset =3D kernel_virt_addr - load_pa;
>> @@ -441,8 +537,13 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>> =A0=A0=A0=A0 /* Setup trampoline PGD and PMD */
>> =A0=A0=A0=A0 create_pgd_mapping(trampoline_pg_dir, kernel_virt_addr,
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (uintptr_t)trampoline_pmd,=
 PGDIR_SIZE, PAGE_TABLE);
>> +#ifdef CONFIG_XIP_KERNEL
>> +=A0=A0=A0 create_pmd_mapping(trampoline_pmd, kernel_virt_addr,
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 xiprom, PMD_SIZE, PAGE_KERNE=
L_EXEC);
>> +#else
>> =A0=A0=A0=A0 create_pmd_mapping(trampoline_pmd, kernel_virt_addr,
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 load_pa, PMD_SIZE, PAGE_KE=
RNEL_EXEC);
>> +#endif
>> =A0#else
>> =A0=A0=A0=A0 /* Setup trampoline PGD */
>> =A0=A0=A0=A0 create_pgd_mapping(trampoline_pg_dir, kernel_virt_addr,
>> @@ -474,7 +575,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>> =A0=A0=A0=A0=A0 * whereas dtb_early_va will be used before setup_vm_fina=
l installs
>> =A0=A0=A0=A0=A0 * the linear mapping.
>> =A0=A0=A0=A0=A0 */
>> -=A0=A0=A0 dtb_early_va =3D kernel_mapping_pa_to_va(dtb_pa);
>> +=A0=A0=A0 dtb_early_va =3D kernel_mapping_pa_to_va(XIP_FIXUP(dtb_pa));
>> =A0#endif /* CONFIG_BUILTIN_DTB */
>> =A0#else
>> =A0#ifndef CONFIG_BUILTIN_DTB
>> @@ -486,7 +587,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pa + PGDIR_SIZE, PGDIR_SIZ=
E, PAGE_KERNEL);
>> =A0=A0=A0=A0 dtb_early_va =3D (void *)DTB_EARLY_BASE_VA + (dtb_pa & (PGD=
IR_SIZE =

>> - 1));
>> =A0#else /* CONFIG_BUILTIN_DTB */
>> -=A0=A0=A0 dtb_early_va =3D kernel_mapping_pa_to_va(dtb_pa);
>> +=A0=A0=A0 dtb_early_va =3D kernel_mapping_pa_to_va(XIP_FIXUP(dtb_pa));
>> =A0#endif /* CONFIG_BUILTIN_DTB */
>> =A0#endif
>> =A0=A0=A0=A0 dtb_early_pa =3D dtb_pa;
>> @@ -522,7 +623,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>> =A0#endif
>> =A0}
>>
>> -#ifdef CONFIG_64BIT
>> +#if defined(CONFIG_64BIT) && !defined(CONFIG_XIP_KERNEL)
>> =A0void protect_kernel_linear_mapping_text_rodata(void)
>> =A0{
>> =A0=A0=A0=A0 unsigned long text_start =3D (unsigned long)lm_alias(_start=
);
> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
