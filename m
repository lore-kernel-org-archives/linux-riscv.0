Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277A0F46455
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 11:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A+w1GiLQCWxixUCELXx8zRAPRQl8tAI/CBW0uXipVBY=; b=OwyUO8gLOw9O5r
	YWQuLubA31rRBhNXAqBZtJjpCrR/zfmP9iz22fUjownPhFpIbovHU1jhOp9YvVvVxHsRwPAU2KNaI
	eovhidaPiGORuKUruxgqIGrEbkRMFpiNndZQDeyAx6wL7j3CpgkM0DpY5cEIEJvYgYibxuYoBlHFc
	vTLqSgWIa7aQ+pbHnH/8XmYynGC3ujC6MWyhe7oervWhEvPe2pfs8aMOIilmbaZXLQ7FstGInVt0m
	M1snN55vxQ7B5DfnI9KfJ+APPHrYfCgIzgr5CfM+1ioU6t39TG1MKOCAg365N+Hdz3m8ApGKLdiun
	BcnCaoZt9rUi2gbx4Drw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26Uq-00000003rbG-1Ze7;
	Mon, 16 Mar 2026 11:52:32 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26Um-00000003raI-2DxQ
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 11:52:30 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4852afd42ceso39305445e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 04:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773661947; x=1774266747; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G1FINDvU0UxUqjZlFZpZ58KZuPwMyU/XPMlyrs5R8Wo=;
        b=MsUBvV1NPrZ9cKVxVtFhoTCXoyNNILl+tynHOEKZchH71TjXv445r+HAVq3vOFnI6i
         s9S1UyJhECN+5enbblM2OonN/qYAD6RP8Z0w7ovRLt9p3D4gDEiQDhMnS6p99mHKc0WC
         92F6XkI671gAi7yt4nSMBBcurUObg8K/IHhM4ktZnXhMiYQ9qc7vgObZZibwFhVVeXSb
         hpiLr/njM5kSHSao16zmJ6Z/DRdbriuyklorq1o9KSjH6iJhZuz2zbZjdSxXTFUaW1pN
         F1RN8QaA00L9lQsN/KJIs+xYEBZQjy1gS8EGiIuO7O4gva+YN0vp33Tg9KZbCTnLQtNw
         3i1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773661947; x=1774266747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G1FINDvU0UxUqjZlFZpZ58KZuPwMyU/XPMlyrs5R8Wo=;
        b=ABSdzhUeqiQDAorHx/TAN5PLxYx7i3JHrITh3dUznqXdxRaX4VHZlpnUrKDkS/5tfa
         nfqLFdNCSAc8h6rFjNOjudN7t/0I8wWe1Z2aEYEcWPIS8t8U4v3KfamXML/L0hfLZY3v
         g+O4/992XJ1Fc2hb6EacCdk/pw83ePquUE/miIRZAhB2SofWr6KCWleQtxB5FShqeXjd
         3812AIsCbChdO0WuQw0yovSiNXLBp4a91HZdQZX/9BO1OPtj8cIqSPO5a87ibyG6Kt/U
         QriO+LvKpy7L/pqeF4kOpAjquZM0KYz7VBP9OOxu8u29n0ITFCFpolrd0Gd54kj2b8H5
         olWw==
X-Forwarded-Encrypted: i=1; AJvYcCVT2iAvJ79pM+dhbEmzs6hKdu+6XiCV+jJuejYbtqywJ4+JD2+622qmxMiNi3o/oGaBARWIa/93IiIm2w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxlzqJbJNceQpS1q/fCHGbIktqSgYKVwyM9xyxm7clXGja4oaSn
	vB2cFMWPt20WhWb+JUr2UNIz/lCqQaZ/zHEADFDYWOSfRhVnKbYVVuF9
X-Gm-Gg: ATEYQzwrk8reNgn67md6kmg1Nd5608STgTw3MCcvr2d3zJy+LbjnbkBBWi/XLXKKoSY
	gwjM6p9FO1Z8IOCN/E06lmk0+n9V3cQLYOgrLTzLgLbfiWZTZkJVwslSV5McprvEKid7JF36/pF
	ifRwiX0pGqDMuWfOGkqRjiI9bAo9qja03QD3YqJyaVjE0f0JZoiXz0gvI8+2Gy3HNK5gC9GFISo
	HCS/iX0BRC05T04jFHyeq0eRUrZ8kARXyD8AN+fkxfNzg0+05qW2FRf1L26j8fh9pJLh4oPgDTX
	Bmn1kbtdjWkP1f6ssQCIbB1ZL8LHowlHk5WKHCauDZknzX4BrPXmut+1B4E/F/rI+lKXCnGeKRx
	WUJA4i3Mebgl9t9PEyt5H/pVJXDZFVPKqQo17ZI9DEOSpzEegjq+caEp/bTjV3nD7Ifcfu6DipK
	gzOH+1Gu5XwBF2TPIARyt+2iBuglKJXZ2n+roVehmfSPHxw2ZGrehOFtFJR44STpqm
X-Received: by 2002:a05:600d:844f:10b0:485:40fd:8390 with SMTP id 5b1f17b1804b1-485567029cdmr158924705e9.26.1773661946379;
        Mon, 16 Mar 2026 04:52:26 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b7f255sm525678625e9.12.2026.03.16.04.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 04:52:26 -0700 (PDT)
Date: Mon, 16 Mar 2026 11:52:24 +0000
From: David Laight <david.laight.linux@gmail.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 "Peter Zijlstra" <peterz@infradead.org>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, Darren Hart <dvhart@infradead.org>, Davidlohr
 Bueso <dave@stgolabs.net>, =?UTF-8?B?QW5kcsOp?= Almeida
 <andrealmeid@igalia.com>, <linux-arch@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>, <linux-s390@vger.kernel.org>, Jisheng
 Zhang <jszhang@kernel.org>
Subject: Re: [RFC PATCH v2 3/7] arm64/runtime-const: Use
 aarch64_insn_patch_text_nosync() for patching
Message-ID: <20260316115224.036e0351@pumpkin>
In-Reply-To: <20260316052401.18910-4-kprateek.nayak@amd.com>
References: <20260316052401.18910-1-kprateek.nayak@amd.com>
	<20260316052401.18910-4-kprateek.nayak@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_045228_608027_E02962E1 
X-CRM114-Status: GOOD (  26.58  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 16 Mar 2026 05:23:57 +0000
K Prateek Nayak <kprateek.nayak@amd.com> wrote:

> The current scheme to directly patch the kernel text for runtime
> constants runs into the following issue with futex adapted to using
> runtime constants on arm64:

Doesn't this need to come before the previous patch?

	David

> 
>   Unable to handle kernel write to read-only memory at virtual address fff0000000378fc8
>   Mem abort info:
>     ESR = 0x000000009600004e
>     EC = 0x25: DABT (current EL), IL = 32 bits
>     SET = 0, FnV = 0
>     EA = 0, S1PTW = 0
>     FSC = 0x0e: level 2 permission fault
>   Data abort info:
>     ISV = 0, ISS = 0x0000004e, ISS2 = 0x00000000
>     CM = 0, WnR = 1, TnD = 0, TagAccess = 0
>     GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
>   swapper pgtable: 4k pages, 52-bit VAs, pgdp=00000000420a7000
>   [fff0000000378fc8] pgd=18000000bffff403, p4d=18000000bfffe403, pud=18000000bfffd403, pmd=0060000040200481
>   Internal error: Oops: 000000009600004e [#1]  SMP
>   Modules linked in:
>   CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.19.0-rc6-00004-g7e6457d29e6a-dirty #291 PREEMPT
>   Hardware name: linux,dummy-virt (DT)
>   pstate: 81400009 (Nzcv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
>   pc : futex_init+0x13c/0x348
>   lr : futex_init+0xc8/0x348
>   sp : ffff80008002bd40
>   x29: ffff80008002bd40 x28: ffffa4b73ba0a160 x27: ffffa4b73bd10d74
>   x26: ffffa4b73cb68b28 x25: ffffa4b73ba0b000 x24: ffffa4b73c66b000
>   x23: 0000000000003fe0 x22: 0000000000000000 x21: ffffa4b73bd10d74
>   x20: 0000000000008000 x19: 0000000000000000 x18: 00000000ffffffff
>   x17: 000000007014db06 x16: ffffa4b73ca3ec08 x15: ffff80010002b937
>   x14: 0000000000000006 x13: fff0000077200000 x12: 00000000000002b2
>   x11: 00000000000000e6 x10: fff0000079e00000 x9 : fff0000077200000
>   x8 : fff00000034df9e0 x7 : 0000000000000200 x6 : ffffa4b73ba0b000
>   x5 : fff0000003510000 x4 : 0000000052803fe0 x3 : 0000000072a00000
>   x2 : fff0000000378fc8 x1 : ffffa4b739d78fd0 x0 : ffffa4b739d78fc8
>   Call trace:
>    futex_init+0x13c/0x348 (P)
>    do_one_initcall+0x6c/0x1b0
>    kernel_init_freeable+0x204/0x2e0
>    kernel_init+0x20/0x1d8
>    ret_from_fork+0x10/0x20
>   Code: 120b3c84 120b3c63 2a170084 2a130063 (29000c44)
>   ---[ end trace 0000000000000000 ]---
> 
> The pc at "futex_init+0x13c/0x348" points to:
> 
>   futex_init()
>     runtime_const_init(shift, __futex_shift)
>       __runtime_fixup_shift()
>         *p = cpu_to_le32(insn); /* <--- Here --- */
> 
> ... which points to core_initcall() being too late to patch the kernel
> text directly unlike the "d_hash_shift", "__names_cache" which are
> initialized during start_kernel() before the protections are in place.
> 
> Use aarch64_insn_patch_text_nosync() to patch the runtime constants
> instead of doing it directly to allow for running runtime_const_init()
> slightly later into the boot.
> 
> Since aarch64_insn_patch_text_nosync() calls caches_clean_inval_pou()
> internally, __runtime_fixup_caches() ends up being redundant.
> runtime_const_init() are rare and the overheads of multiple calls to
> caches_clean_inval_pou() instead of batching them together should be
> negligible in practice.
> 
> At least one usage in kprobes.c suggests cpu_to_le32() conversion is not
> necessary for aarch64_insn_patch_text_nosync() unlike in the current
> scheme of patching *p directly.
> 
> Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
> ---
>  arch/arm64/include/asm/runtime-const.h | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/runtime-const.h b/arch/arm64/include/asm/runtime-const.h
> index 4c3f0b9aad98..764e244f06a4 100644
> --- a/arch/arm64/include/asm/runtime-const.h
> +++ b/arch/arm64/include/asm/runtime-const.h
> @@ -7,6 +7,7 @@
>  #endif
>  
>  #include <asm/cacheflush.h>
> +#include <asm/text-patching.h>
>  
>  /* Sigh. You can still run arm64 in BE mode */
>  #include <asm/byteorder.h>
> @@ -63,13 +64,7 @@ static inline void __runtime_fixup_16(__le32 *p, unsigned int val)
>  	u32 insn = le32_to_cpu(*p);
>  	insn &= 0xffe0001f;
>  	insn |= (val & 0xffff) << 5;
> -	*p = cpu_to_le32(insn);
> -}
> -
> -static inline void __runtime_fixup_caches(void *where, unsigned int insns)
> -{
> -	unsigned long va = (unsigned long)where;
> -	caches_clean_inval_pou(va, va + 4*insns);
> +	aarch64_insn_patch_text_nosync(p, insn);
>  }
>  
>  static inline void __runtime_fixup_ptr(void *where, unsigned long val)
> @@ -79,7 +74,6 @@ static inline void __runtime_fixup_ptr(void *where, unsigned long val)
>  	__runtime_fixup_16(p+1, val >> 16);
>  	__runtime_fixup_16(p+2, val >> 32);
>  	__runtime_fixup_16(p+3, val >> 48);
> -	__runtime_fixup_caches(where, 4);
>  }
>  
>  /* Immediate value is 6 bits starting at bit #16 */
> @@ -89,8 +83,7 @@ static inline void __runtime_fixup_shift(void *where, unsigned long val)
>  	u32 insn = le32_to_cpu(*p);
>  	insn &= 0xffc0ffff;
>  	insn |= (val & 63) << 16;
> -	*p = cpu_to_le32(insn);
> -	__runtime_fixup_caches(where, 1);
> +	aarch64_insn_patch_text_nosync(p, insn);
>  }
>  
>  /* Immediate value is 6 bits starting at bit #16 */
> @@ -99,7 +92,6 @@ static inline void __runtime_fixup_mask(void *where, unsigned long val)
>  	__le32 *p = lm_alias(where);
>  	__runtime_fixup_16(p, val);
>  	__runtime_fixup_16(p+1, val >> 16);
> -	__runtime_fixup_caches(where, 2);
>  }
>  
>  static inline void runtime_const_fixup(void (*fn)(void *, unsigned long),


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
