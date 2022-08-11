Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46227C19F2A
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Aug 2022 17:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Jz9xfnTf+kpQa8sssN3RJZvZdJXwNzrJ9++leaVPOgw=; b=iLQoQ6uljQaWVlNHDiSgxmKkR/
	+edg0P1KNNzG+Lnd0HWPRlE2aJjV+i958Q15BFzbFqLiSU9BEGVOm/3VrWWfojdFKEptD2SN/W+Wz
	w5ajsYdXoapYO5ADiM12JvKWzGXmxh2tvmBR4jeVJZEqaqrxjrRcBPg9k60q4Kz44uVAXZC5cIi6A
	ht692d/QIPHx4gZYM66kYCyYWG2KPnA3A9JKl46ps9E519N+E1BGwdMVv/friuBVO1kAGBakWMvQ8
	jAdbdYymU+EfZ2Hl9yX+CKOn/aWxTBjMwitwG1bh2ULBVCQCClw2zRsU/3Ji20UQI6UJoyTJCCB/O
	WYuTDVsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMBgp-00Fh3o-GD; Thu, 11 Aug 2022 17:09:47 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMBgm-00FgwN-Vl
	for linux-riscv@lists.infradead.org; Thu, 11 Aug 2022 17:09:46 +0000
Received: by mail-pj1-x1035.google.com with SMTP id q7-20020a17090a7a8700b001f300db8677so5675930pjf.5
        for <linux-riscv@lists.infradead.org>; Thu, 11 Aug 2022 10:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc;
        bh=Ck/kSylQVms5JwCJbdw3zQuUtzcZAeiGwMiy/xk3l3k=;
        b=5aM73j+gOKbnY2lxMUT5Vubsy9iseUG+jj5ulQc40FakpvcG4Etg70cohFi7yy9FwD
         5GLf1dEUDz2X3wE4fKvCrqOGZbVEMuXTdk7AmMOKCyxVhnOpcfgop1Ql3sGPp0UH3Luf
         kKnx0VimcbJvFpNenMwXqhfGbE+WTIUXpk+xIhbLv4MmQZWXPfx3yPCLiZVe6n7o9ZmY
         NVlYQrQbpPON9U7V66978npspef+CJkYNhrbCQ+twSrrFiy/TWPAd47JYl6TH6jRes3p
         F9CpdF87weDVAe4ugx5o1Dv85llM7BxakVF3eVRivYRoknUTLTYh3FcDAx30ajZoH9Vt
         CZxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc;
        bh=Ck/kSylQVms5JwCJbdw3zQuUtzcZAeiGwMiy/xk3l3k=;
        b=zmQKxVPf1sJAFUJt/4mXLeE0ON7giVQojs3rC2dXXPw/QAtszevzl16+M7jecwhPWE
         Qan9mOFPJ7hfE9YtaeTuq7+7OXWQM2byAS6ac2xj+VxoD66n9gQ9DAoS7imFGumH4DvD
         jDfMTSwUMMAriQ6X6sevxpsWEGQSGi5yv/E/2IVOsNNR/TfbElTZui7WFYzKuYfdHWdL
         fIGoieHFQZl8flLHOeNNVar/tgyx7Ydd6rKkuZHKhhPd6Qv/VobJUe/t0xNVk9cPM0TX
         WgNC7NyCxsk+bh1yoU54L9GfOiDE0w8L0PkiipBEqnJyMImfGJeposULNQ60Kj0UTY3D
         3A4Q==
X-Gm-Message-State: ACgBeo1udVOTIS8juRpstFKub8OnYJm4ZMcl1fRuoj8UCDbQ26GJY4S5
	3ldvfkIBUJpbqXrbOtk1WuCGhw==
X-Google-Smtp-Source: AA6agR7HztU5aHFmk889S5mE0ZrMU7TcZuua217HAGdwZ+A2bijuXbm3lOJbpJ0coxigOaHrJxS4nQ==
X-Received: by 2002:a17:902:f283:b0:16f:c46:dc1f with SMTP id k3-20020a170902f28300b0016f0c46dc1fmr144542plc.162.1660237783367;
        Thu, 11 Aug 2022 10:09:43 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id e12-20020a170902b78c00b0017154ae6265sm83497pls.211.2022.08.11.10.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 10:09:42 -0700 (PDT)
Date: Thu, 11 Aug 2022 10:09:42 -0700 (PDT)
X-Google-Original-Date: Thu, 11 Aug 2022 10:09:41 PDT (-0700)
Subject: Re: [PATCH] riscv/kprobes: allocate detour buffer from module area
In-Reply-To: <20220629011317.259986-1-liaochang1@huawei.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  mhiramat@kernel.org, rostedt@goodmis.org, liaochang1@huawei.com, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: liaochang1@huawei.com
Message-ID: <mhng-0e2f7f49-2680-4341-83dc-0e7cd042a3fa@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_100945_042147_924F94CB 
X-CRM114-Status: GOOD (  20.64  )
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

On Tue, 28 Jun 2022 18:13:17 PDT (-0700), liaochang1@huawei.com wrote:
> To address the limitation of PC-relative branch instruction
> on riscv architecture, detour buffer slot is allocated from
> a area, the distance of which from kernel should be less than 4GB.
>
> For the time being, Modules region always live before the kernel.
> But Vmalloc region reside far away from kernel, the distance is
> half of the kernel address space.
>
> Signed-off-by: Liao Chang <liaochang1@huawei.com>
> ---
>  arch/riscv/kernel/probes/kprobes.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
> index e6e950b7cf32..bc027a663b17 100644
> --- a/arch/riscv/kernel/probes/kprobes.c
> +++ b/arch/riscv/kernel/probes/kprobes.c
> @@ -6,12 +6,14 @@
>  #include <linux/extable.h>
>  #include <linux/slab.h>
>  #include <linux/stop_machine.h>
> +#include <linux/moduleloader.h>
>  #include <asm/ptrace.h>
>  #include <linux/uaccess.h>
>  #include <asm/sections.h>
>  #include <asm/cacheflush.h>
>  #include <asm/bug.h>
>  #include <asm/patch.h>
> +#include <asm/set_memory.h>
>
>  #include "decode-insn.h"
>
> @@ -86,10 +88,28 @@ int __kprobes arch_prepare_kprobe(struct kprobe *p)
>  #ifdef CONFIG_MMU
>  void *alloc_insn_page(void)
>  {
> +#if defined(CONFIG_MODULES) && defined(CONFIG_64BIT)
> +	void *page;
> +
> +	page = module_alloc(PAGE_SIZE);
> +	if (!page)
> +		return NULL;
> +
> +	set_vm_flush_reset_perms(page);
> +	/*
> +	 * First make the page read-only, and only then make it executable to
> +	 * prevent it from being W+X in between.
> +	 */
> +	set_memory_ro((unsigned long)page, 1);
> +	set_memory_x((unsigned long)page, 1);
> +
> +	return page;
> +#else
>  	return  __vmalloc_node_range(PAGE_SIZE, 1, VMALLOC_START, VMALLOC_END,
>  				     GFP_KERNEL, PAGE_KERNEL_READ_EXEC,
>  				     VM_FLUSH_RESET_PERMS, NUMA_NO_NODE,
>  				     __builtin_return_address(0));
> +#endif
>  }
>  #endif

This probably shouldn't depend on CONFIG_MODULES, it's just as broken to 
assume we can jump to the vmalloc region regardless of whether modules 
are enabled or disabled.  We should be able to just allocate from the 
jump-safe region either way.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
