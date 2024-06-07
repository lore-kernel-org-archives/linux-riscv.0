Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACD1C27C53
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jun 2024 22:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H31sJ0G3XA2XWOF5FJROEtsDBQe/c+Ov+k9/nx6rxFI=; b=V0lZGYu/+yaWgEgzneKucKJ+Yo
	OYwyxEu4yv17kAtD4jdXrvzyAOmhVIhag4eldkGKer6wARRdKgswNA6NctBM6juCVReDglk9F5+f4
	u4w2pce5I5rc/kbPnnpHjPHWoncjNL95QnwtTFBBjTtz9rxY2oVbpPQsY/163J9yJqeyeV4UY5Ws5
	MFm7IXaP/hGjFQSQ338X+JfkTquYwwuCTmdnUAqkQQF8+3ylUb9mcON9ElU2VptvDK+oDZiwc3Tv5
	6zvv+uTwPy70MVK9ZuL/R1Ly6wjfoQmWwYiZMvh4Afzs+NYSDk2pHyl1u4S0w/MjDLySthmorfshd
	6iuOXbNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFhct-0000000Fmow-3CBD;
	Fri, 07 Jun 2024 21:59:59 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFhcr-0000000FmoF-1MGe
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jun 2024 21:59:58 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1f44b441b08so20857565ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 07 Jun 2024 14:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717797593; x=1718402393; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=abwbQjKkdLcyA3ZLBTexttcGmNEMcNRQlC/IY+wd5Rg=;
        b=ti9PsUR7TWQpnrrCYDPtWAPLTW/Mo5x2y9g78ZUVtcEPFjTBfOYbsYiVhZANxxEPmU
         zHo2q7uG+IwvDhpus3Kv4AsHTNar1czXG/SziEIxaYLcyT9l6FV/7atARay2EPA5jPnq
         BLwW6fP620sK98acf8RZsW18R3HLLeGYsfs1JQAoQqdqq7SG0usNgkUE4tJ1UKO8vLrS
         Hp+EEma9/nGKNvIMr8OUvq7ma+lAuTIbWzhudwUYYRElf/vmV9agirQhNGwkwJjaoSIE
         +29nVxddPFkj4q6NL/bctndUTiuLcQuArvU7p+U/8EORueSpitX6l5TLQn5MIZ36x4iC
         NIJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717797593; x=1718402393;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=abwbQjKkdLcyA3ZLBTexttcGmNEMcNRQlC/IY+wd5Rg=;
        b=lBN/RqhNWdEmTyaMwVN0YFjlTWDIcvvhfKIA56gHouO0GKmEx3yxlAWErg7NTAJfRk
         EcQmarA3I02xgRkNHWfYriNcNU1U/MMiAgFwGQjkGCofgWMeicFvYJjlU0VLtYrXhxxG
         F+nmUrByYLFvMd2oHsCejwxX7KJF9PvvbRdRFHWGkgYBSAw1df4nJdTTomyxW3Y3svLL
         3na0AxONsV0f8hxlEAAHqBpDaYATE017LYn3jxEgTsa5pa6MpHFZjpnjlqgtaqOKzkSX
         2JwCIdfRr2JtuJTHA8EBaMTfLpjDJiLoaFE7aPszC7CTPRO99JwHuZzowgOr8aYj0UM5
         cftg==
X-Gm-Message-State: AOJu0YzkJQmpRpbffX76h+BMcQ7Y0saT1DuZk41mcgJgirXk+aoq3tIu
	LaA5wcbCwAk/b39hZf1BAqTpljzKeL+ixoVXYjMIp2nE2Tf2Wo7ZuaomQb+GRABE3uXGuUe2GFR
	K
X-Google-Smtp-Source: AGHT+IEhy4tn7bfCFbg3FP8GGeWKEJlk4JoPD+Sf0Ab6hBJqXd6TZWntaCjHmX8Tbs3J6VbUbkAHeg==
X-Received: by 2002:a17:903:41ca:b0:1f6:7f45:4d37 with SMTP id d9443c01a7336-1f6d03f5337mr43464365ad.66.1717797593381;
        Fri, 07 Jun 2024 14:59:53 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd7ccf33sm39167825ad.125.2024.06.07.14.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 14:59:52 -0700 (PDT)
Date: Fri, 7 Jun 2024 14:59:51 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] riscv: Call riscv_user_isa_enable() only on the boot
 hart
Message-ID: <ZmOC18Lj2WrMe9J/@debug.ba.rivosinc.com>
References: <20240605205658.184399-1-samuel.holland@sifive.com>
 <20240605205658.184399-4-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240605205658.184399-4-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_145957_389902_FAF9BFD8 
X-CRM114-Status: GOOD (  16.90  )
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

On Wed, Jun 05, 2024 at 01:56:47PM -0700, Samuel Holland wrote:
>Now that the [ms]envcfg CSR value is maintained per thread, not per
>hart, riscv_user_isa_enable() only needs to be called once during boot,
>to set the value for the init task. This also allows it to be marked as
>__init. riscv_isa_extension_check() sets any_cpu_has_zicboz, so it also
>needs to be marked __init; it could have had this annotation already.
>
>Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
>---
>
> arch/riscv/include/asm/cpufeature.h | 2 +-
> arch/riscv/kernel/cpufeature.c      | 8 ++++----
> arch/riscv/kernel/smpboot.c         | 2 --
> 3 files changed, 5 insertions(+), 7 deletions(-)
>
>diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
>index 347805446151..4bf7b7ebf6b3 100644
>--- a/arch/riscv/include/asm/cpufeature.h
>+++ b/arch/riscv/include/asm/cpufeature.h
>@@ -31,7 +31,7 @@ DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
> /* Per-cpu ISA extensions. */
> extern struct riscv_isainfo hart_isa[NR_CPUS];
>
>-void riscv_user_isa_enable(void);
>+void __init riscv_user_isa_enable(void);
>
> #if defined(CONFIG_RISCV_MISALIGNED)
> bool check_unaligned_access_emulated_all_cpus(void);
>diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>index 1153b96346ae..bfe8550c0aae 100644
>--- a/arch/riscv/kernel/cpufeature.c
>+++ b/arch/riscv/kernel/cpufeature.c
>@@ -27,7 +27,7 @@
>
> #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
>
>-static bool any_cpu_has_zicboz;
>+static bool any_cpu_has_zicboz __initdata;
>
> unsigned long elf_hwcap __read_mostly;
>
>@@ -74,7 +74,7 @@ bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, unsigned i
> }
> EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
>
>-static bool riscv_isa_extension_check(int id)
>+static bool __init riscv_isa_extension_check(int id)
> {
> 	switch (id) {
> 	case RISCV_ISA_EXT_ZICBOM:
>@@ -725,12 +725,12 @@ unsigned long riscv_get_elf_hwcap(void)
> 	return hwcap;
> }
>
>-void riscv_user_isa_enable(void)
>+void __init riscv_user_isa_enable(void)
> {
> 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICBOZ))
> 		current->thread.envcfg |= ENVCFG_CBZE;
> 	else if (any_cpu_has_zicboz)
>-		pr_warn_once("Zicboz disabled as it is unavailable on some harts\n");
>+		pr_warn("Zicboz disabled as it is unavailable on some harts\n");
> }
>
> #ifdef CONFIG_RISCV_ALTERNATIVE
>diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
>index 1319b29ce3b5..3e8ece31c30d 100644
>--- a/arch/riscv/kernel/smpboot.c
>+++ b/arch/riscv/kernel/smpboot.c
>@@ -231,8 +231,6 @@ asmlinkage __visible void smp_callin(void)
> 			elf_hwcap &= ~COMPAT_HWCAP_ISA_V;
> 	}
>
>-	riscv_user_isa_enable();
>-
> 	/*
> 	 * Remote cache and TLB flushes are ignored while the CPU is offline,
> 	 * so flush them both right now just in case.

Suggestion:
Squash with current patch 1 and call it patch 2.

>-- 
>2.44.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
