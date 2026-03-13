Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50805107BCE6
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 21:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=feAA8ny9mEtrI6XVtcnCEqJJmpW3mUjCrzZmYTybRUc=; b=U0/9kjuby7SFIW
	mH+BXtT/MHKCHHEVndfky2wPcV5oodCjv4amcOlHmJZ9VhKDoEZm7n8ZGKCf+qygmpUg/HYqWSKF9
	d22XBS2iO4BUzzV4n08k1nBbx2NjiYlL86WWvx4Egi0wEHp2BF2XkSajCkc1LLzUzq7sZ0iXC+Xoi
	3UAqBXt5OSLKOiiavbLH6iOEsKPKZQ6ALqpN7pKSke7COrZ/wiLbA+x6Q5R6u9heE+IIsAABNR3K8
	0QmnhAxkMohFxbBEuy27bmD6U+HDn6lRC7NY301flMt4Q445bWpoL/bQLJk63+qG3EuxoBMD/TZkW
	KX0lpCHXA7ze8mFdl+nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1A3P-00000001DKB-1V3Z;
	Fri, 13 Mar 2026 21:28:19 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1A3M-00000001DJR-2wu0
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 21:28:17 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-2be19f05d7dso1763923eec.1
        for <linux-riscv@lists.infradead.org>; Fri, 13 Mar 2026 14:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773437295; x=1774042095; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XFQN2iDyW5m5a7jX1vRhVdG+wB2cb7HPaqKy8sTeyCQ=;
        b=TEDobUPIKdKTlZI9PpmhA+dU/v7f86+4o/IL34ViT8gVmUG92LraF1AjSnyQpiiQNR
         AMw9i9lrr280+lHwAxd/THpUbsf7pIA6JOOMUFRid27YJaTdYAPk4mwe4cntmuAEIjAF
         s+NzltXKTLEwGJ61FNNER/SETzhGY00hqPMY4mYQWi3F9R++jMdWfPYEuJrvgeQe66bO
         +Xl7wbrTqjrqtK0GcNiZU10JTMC65umS850j+78LMNsGpWzTd4QDx/BPxmY0aJnRJ5KJ
         RuXwjjkEiLMWixsfmyB7JqCFEJJ6GDBuFW5SxSHM9ZzM4bMhyaT+oOz92qXiAxgKv6//
         F1sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773437295; x=1774042095;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XFQN2iDyW5m5a7jX1vRhVdG+wB2cb7HPaqKy8sTeyCQ=;
        b=CsaCFoCtn/n/dbsL5k47TtdAafqbTlrBMYen46Z7dPBWedJwJ05+2PWqxHcnwKTAbV
         HssO6e18CM9I6bPsl7k+l6TkWZgYoYdPq9Ozyw7GchauwlILuWWR5WYxCN1M2XLp6bEU
         8xhS16ZocnUPdMbdid3nMdjwSloq+hZdd5WJC/qqagWWQhIFfcqdVCDU86vmbLHEakIJ
         DWJA0nw79mKx2ztPJhtLc58zfqMcCJwfaYjSOQ1VkbYIMLld3bOuXS0f2JMWfAEL0J48
         fiXR1GVW1Q17vxQdFwdYjA1GhXTmzajFnvDkKJAQ3Nwy1gPdeNYPobO4SzgmHWoEDmGI
         gtuQ==
X-Gm-Message-State: AOJu0Yz61+U2a0eu9uPoXiVCJ25aoE0xQKtmKfOxNTk9MkJJgBIf1Fb6
	6TmKJagL4/y/AXcpIs+5Y2470MCpQKL1oRJIdVdomxRw1ahbPvgG3ruS
X-Gm-Gg: ATEYQzyks9MRoE1E9ox04byYiW8OGTpO57A+8OLysAF2iKk/Xcr5gHuWYSi1Ejrr/xd
	eyTnxiw12cClBVTVd8dugE4zxgqWXSpR86A7Bo9/oXweIwJlNG1hEtGsEOmXUr82Jo0ExZZ2m0z
	WMaqXgbdCaScOpMSt8ByGcrk3NyvQ50FeDVh/QI4hnCO1UbGRaB3R+i3o+kdkIOZSZdm83dwx4q
	L8HO1C3iKL5g9gTAdE+kgdFJWfSPkrmLxWJu8/0Y05wL/uKbAA33xAnBFkriTyqUE6nU2sYoreN
	XQy6XAAhIsfUstw1K1Z+dej1wbyqlS9leQ7exS4P17tkVK1ReVq6hzNi6SsIIBj3OfAn1E6etsz
	n9vWQGIFafwbLcZnswGGCciMhnFmH1M9ygdRAvvJ8QcXbvPrDZAdwxqdVMldoSyzqVQdiDzwlqI
	h+hmhW5XLlNVtpdoIzrjRNaa3Gm1w/zFJ5FD1WvTt49cSUUUI=
X-Received: by 2002:a05:7300:cb13:b0:2b6:ffb9:9633 with SMTP id 5a478bee46e88-2bea547cfb5mr2448749eec.15.1773437295332;
        Fri, 13 Mar 2026 14:28:15 -0700 (PDT)
Received: from [172.16.0.242] ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c098cbd4dasm503846eec.0.2026.03.13.14.28.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 14:28:13 -0700 (PDT)
Message-ID: <25a8565d-a6bb-401f-b776-d743a2ec9ee0@gmail.com>
Date: Fri, 13 Mar 2026 14:33:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/6] riscv: Add a custom, simplified version of Svpbmt
 "XPbmtUC"
To: Conor Dooley <conor@kernel.org>, Bo Gan <ganboing@gmail.com>
Cc: linux-riscv@lists.infradead.org, samuel.holland@sifive.com,
 david@redhat.com, palmer@dabbelt.com, pjw@kernel.org, gaohan@iscas.ac.cn,
 me@ziyao.cc, lizhi2@eswincomputing.com, hal.feng@starfivetech.com,
 marcel@ziswiler.com, kernel@esmil.dk, devicetree@vger.kernel.org
References: <20260313084407.29669-1-ganboing@gmail.com>
 <20260313084407.29669-2-ganboing@gmail.com>
 <20260313-visitor-majestic-1a6888dc57b2@spud>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20260313-visitor-majestic-1a6888dc57b2@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_142816_755622_FD5245EB 
X-CRM114-Status: GOOD (  48.45  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Conor,

Thanks so much for the prompt review. See inline.

On 3/13/26 06:24, Conor Dooley wrote:
> Hey,
> 
> Gonna offer some feedback on the detail of what's been done in this
> series, without providing any commentary on whether this is the correct
> approach to take.
> 
> On Fri, Mar 13, 2026 at 01:44:02AM -0700, Bo Gan wrote:
>> On platforms that doesn't support Svpbmt or XTheadMae, SoC vendors
>> sometimes map the system memory twice in physical address space, one
>> as cached, and the other as uncached. Through the uncached window,
>> device drivers will be able to map DMA buffer for noncoherent devices.
>> Such setup is usually found in SoC with pre-Svpbmt Sifive cores.
>> Make use of such feature by modeling it as "XPbmtUC", a customized
>> version of Svpbmt, where a single bit in PTE is used for UC control.
>> There's no IO bit with such scheme, as it's assumed that the PMA
>> (usually hard-wired on these SoCs) will properly convey the strongly-
>> ordered, non-idempotent attribute of the MMIO region.
>>
>> The enablement of such position of "XPbmtUC" is controlled by the
>> device-tree property "riscv,xpbmt-uncache-bit".
> 
> Firstly, the naming generally I take some exception to. If this is some
> fake vendor extension for linux purposes, it needs to have "xlinux" in
> it, like our xlinuxenvcfg does. It should also be consistent, don't use
> "xpmbtuc" and "xpbmt-uncache-bit", pick one and stick to it.
> 
Makes sense. I can certainly change that to be conformant.

> Athough, I think I disagree fundamentally with this property, as it seems
> to me like "software configuration" that shouldn't be permitted in
> devicetree. Maybe I am misunderstanding, but the numbers you chose are
> convenient, not set in stone by the specific hardware, right?

For JH7110, the bit 32 (PPN bit 34) matches exactly with the HW. Meaning
toggling this bit would re-map the page to the uncached window, which
matches perfectly with the synthetic UC bit in the scheme.

For EIC770X, the bit 38 (PPN bit 40) is hand picked to be able to map all
physical memory space (40 bit), while making it very easy for the thin-
hypervisor, which can utilize Sv39x4 (41 bit) page scheme in G-stage.

I also considered the sbi call approach, where the kernel can query for
the support and position of the uncache bit. The thing is that JH7110
can just hard-code the bit without any changes to firmware, and I want
to have a consistent way for both SoC, thus the device-tree approach, to
let the EIC770X firmware/bootloader adding the property to dt at runtime.
Any better ideas?

> 
> I'd be much more comfortable with adding xlinuxwhatever to
> riscv,isa-extensions, to signal that a soc supports this stuff than with
> a property for the bit itself. I suppose that bit information could then
> come from a LUT in the vendor extensions, that a validate callback could
> check (via root compatible) before enabling. There's not a super neat
> way to do that at the moment though I don't think, code currently
> expects that vendor extensions are in a different "namespace" to
> standard ones, and this would blur the lines because it's not from a
> specific vendor, nor is it a standard extension.
> I guess, it could be done by keeping it as a standard number, but then
> it's a bit trickier to neatly access the LUT while keeping it split
> apart.
> I know this means having to modify the kernel if there's a new device,
> but I'm inclined to say "deal with it" because they could've done
> something standard and opted not to.
> 
> Could also argue that this should be shoved into a sifive specific
> thing, but I don't expect that they're the only ones with devices like
> this that could benefit.
> 

I've thought about riscv,isa-extensions. The issue with that is that it's
a per-CPU thing, but I'm adding a global extension, and I don't want to
pollute the isa-extension string. Thus, I followed Samuel's approach --
He uses "riscv,physical-memory-regions" in the root node.

>>
>> Example:
>>
>> Starfive JH7110 (Sifive U74):
>>             [0x0,   0x40000000) Low MMIO
>>      [0x40000000, 0x2_40000000) Cached Mem
>>    [0x4_40000000, 0x6_40000000) Uncached Mem UC+
>>    [0x9_00000000, 0x9_d0000000) High MMIO
>>
>> Device-tree:
>>    riscv,xpbmt-uncache-bit = <32>;
>>
>> Use PTE bit 32 (PPN bit 34) as UC (uncache) control to perfectly
>> match the memory map of the SoC.
>>
>> ESWIN EIC770X (Sifive U84/P550):
>>             [0x0,    0x20000000) Core Internal
>>      [0x20000000,    0x40000000) Core Internal (Die 1)
>>      [0x40000000,    0x60000000) Low MMIO
>>      [0x60000000,    0x80000000) Low MMIO (Die 1)
>>      [0x80000000, 0x10_80000000) Cached Mem
>>   [0x20_00000000, 0x30_00000000) Cached Mem (Die 1)
>>   [0x80_00000000, 0xa0_00000000) High MMIO
>>   [0xa0_00000000, 0xc0_00000000) High MMIO (Die 1)
>>   [0xc0_00000000, 0xd0_00000000) Uncached Mem
>>   [0xe0_00000000, 0xf0_00000000) Uncached Mem (Die 1)
>>
>> EIC770X is not directly compatible to this model, as the uncached
>> regions are offsetted, and the offset is different among the Dies
>> in the dual-die version (EIC7702). so we expect the firmware to
>> provide a thin layer of hypervisor to transparently re-map:
>>
>>      [0x80000000,  0x10_80000000) Cached Mem
>>   [0x20_00000000,  0x30_00000000) Cached Mem (Die 1)
>>   [0xc0_00000000,  0xd0_00000000) Uncached Mem <----------.
>>   [0xe0_00000000,  0xf0_00000000) Uncached Mem (Die 1) <--+--.
>> [0x100_80000000, 0x110_80000000) Mem UC+ ----------------'  |
>> [0x120_00000000, 0x130_00000000) Mem UC+ (Die 1) -----------'
>>
>> With that, the firmware/bootloader can set the following at boot:
>>    riscv,xpbmt-uncache-bit = <38>;
>>
>> Signed-off-by: Bo Gan <ganboing@gmail.com>
>> ---
>>   arch/riscv/Kconfig                  | 12 ++++++++++++
>>   arch/riscv/include/asm/hwcap.h      |  1 +
>>   arch/riscv/include/asm/pgtable-64.h |  8 ++++++++
>>   arch/riscv/kernel/cpufeature.c      |  8 ++++++++
>>   arch/riscv/mm/pgtable.c             |  7 +++++++
>>   5 files changed, 36 insertions(+)
>>
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index 6b39f37f769a2..f2b4da6a3deb1 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -893,6 +893,18 @@ config TOOLCHAIN_NEEDS_OLD_ISA_SPEC
>>   	  versions of clang and GCC to be passed to GAS, which has the same result
>>   	  as passing zicsr and zifencei to -march.
>>   
>> +config RISCV_ISA_XPBMTUC
>> +	bool "Support XPbmtUC (customized pbmt uncache bit)"
>> +	depends on 64BIT && MMU
>> +	depends on RISCV_ALTERNATIVE
>> +	default n
>> +	select DMA_DIRECT_REMAP
>> +	help
>> +	  Add support for "riscv,xpbmt-uncache-bit" device-tree property.
>> +	  The bit denotes the bit in PTE that marks the page as uncached.
>> +
>> +	  If you don't know what to do here, say N.
>> +
>>   config FPU
>>   	bool "FPU support"
>>   	default y
>> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
>> index 4369a23385413..6baa6566cf4cc 100644
>> --- a/arch/riscv/include/asm/hwcap.h
>> +++ b/arch/riscv/include/asm/hwcap.h
>> @@ -111,6 +111,7 @@
>>   #define RISCV_ISA_EXT_ZILSD		102
>>   #define RISCV_ISA_EXT_ZCLSD		103
>>   
>> +#define RISCV_ISA_EXT_XPBMTUC		126
>>   #define RISCV_ISA_EXT_XLINUXENVCFG	127
>>   
>>   #define RISCV_ISA_EXT_MAX		128
>> diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
>> index 6e789fa58514c..1a6d04884111d 100644
>> --- a/arch/riscv/include/asm/pgtable-64.h
>> +++ b/arch/riscv/include/asm/pgtable-64.h
>> @@ -140,6 +140,14 @@ enum napot_cont_order {
>>   #define _PAGE_IO_THEAD		((1UL << 63) | (1UL << 60))
>>   #define _PAGE_MTMASK_THEAD	(_PAGE_PMA_THEAD | _PAGE_IO_THEAD | (1UL << 59))
>>   
>> +#ifdef CONFIG_RISCV_ISA_XPBMTUC
>> +extern int riscv_xpbmtuc_bit;
>> +extern u64 riscv_xpbmtuc_mask;
>> +#endif
>> +
>> +#define XPBMTUC_HAS_PAGE_NOCACHE CONFIG_RISCV_ISA_XPBMTUC
>> +#define XPBMTUC_HAS_PAGE_MTMASK  CONFIG_RISCV_ISA_XPBMTUC
>> +
>>   static inline u64 riscv_page_mtmask(void)
>>   {
>>   	u64 val;
>> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>> index fa591aff9d335..faec169004b4a 100644
>> --- a/arch/riscv/kernel/cpufeature.c
>> +++ b/arch/riscv/kernel/cpufeature.c
>> @@ -1118,6 +1118,14 @@ void __init riscv_fill_hwcap(void)
>>   		riscv_v_setup_vsize();
>>   	}
>>   
>> +#ifdef CONFIG_RISCV_ISA_XPBMTUC
> 
> Code like this needs to be unconditionally compiled.
> 
>> +	if (!of_property_read_u32(of_root, "riscv,xpbmt-uncache-bit",
>> +				  &riscv_xpbmtuc_bit)) {
>> +		riscv_xpbmtuc_mask = 1UL << riscv_xpbmtuc_bit;
>> +		set_bit(RISCV_ISA_EXT_XPBMTUC, riscv_isa);
>> +		pr_info("Using XPbmtUC bit=%d\n", riscv_xpbmtuc_bit);
>> +	}
>> +#endif
>>   	memset(print_str, 0, sizeof(print_str));
>>   	for (i = 0, j = 0; i < NUM_ALPHA_EXTS; i++)
>>   		if (riscv_isa[0] & BIT_MASK(i))
>> diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
>> index 807c0a0de1827..4ca442bc8595d 100644
>> --- a/arch/riscv/mm/pgtable.c
>> +++ b/arch/riscv/mm/pgtable.c
>> @@ -5,6 +5,13 @@
>>   #include <linux/kernel.h>
>>   #include <linux/pgtable.h>
>>   
>> +#ifdef CONFIG_RISCV_ISA_XPBMTUC
>> +int riscv_xpbmtuc_bit;
>> +
>> +u64 riscv_xpbmtuc_mask;
>> +EXPORT_SYMBOL(riscv_xpbmtuc_mask);
>> +#endif
>> +
>>   int ptep_set_access_flags(struct vm_area_struct *vma,
>>   			  unsigned long address, pte_t *ptep,
>>   			  pte_t entry, int dirty)
>> -- 
>> 2.34.1
>>

Bo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
