Return-Path: <SRS0=iP4b=E3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE687C56201
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Nov 2020 03:25:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 403DC2222F
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Nov 2020 03:25:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V4CZC3bA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="U92UXwN3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 403DC2222F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=oSPmQbTV4VJJNI72QvPYn86dyZ59F4/73IZWQo3UOoU=; b=V4CZC3bAGr93jUkEn98uk0Lvs
	XqZUw9s06Z0POP6DnMCDsJAcGkU8CShvZm2+wmADxdChiU+D40H9xRDdixvUOTt+rO53tev+IQl5x
	8fQHXVzG8205J/VcSlwSxx2NKEEsRGcCNx8I0E4mmb5h5tRATjHaTtLr4JU4cvEqiGh98KJCoB+/2
	f09Bs5Id152WrY67wDPsHC7u0L2tJb54BlSPYJf/qjsIRndSt0qDXtsBT+/MvcoHixDePIi5Y95UY
	F10C+AZQk9aymygysQnSbs1pN9/T0Iwlm00pNJpfvMYnksHJkr1hUzzgSitQkDIIzeYnoycfC59fO
	rz3OjNx2g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgJWs-0001kt-Vq; Sat, 21 Nov 2020 03:25:39 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgJWp-0001kD-Sk
 for linux-riscv@lists.infradead.org; Sat, 21 Nov 2020 03:25:36 +0000
Received: by mail-pl1-x644.google.com with SMTP id k7so5918792plk.3
 for <linux-riscv@lists.infradead.org>; Fri, 20 Nov 2020 19:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=F4LHuwHPehTGg6C7SwMVTgSDJxeRk/wpcUvGl+GXLpg=;
 b=U92UXwN3msyCRk7cskDKA/IK+g4HTcj7kVry+hoQSSAovr8eSvCulEoBdUImOUIKXs
 9d3Nz45fFLcxE0prv5yNHdKzZC+Dn8ljLEb5JK/z0wNZcMFWbKnOGH2VzAxd4QkjWl9U
 XpodiXZ5C9tCgNFZAl2VIwUbYnNe46aUilCMK4VyU94T9qd/Z6D1iHL/P+h4IazenZO7
 V6LYITT4WulnwgX7ZjpVWsbZssu4+gc0/CcRf64YMm12LwNg2RB+bpHy5CVpsUEZzTRn
 jms9ymXrbQM8YDDwuaENU0YeQJDQH0Qs5CXWG1Tz0XIRQophOK6ftzeGidYn7UZ5rTZr
 2f7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=F4LHuwHPehTGg6C7SwMVTgSDJxeRk/wpcUvGl+GXLpg=;
 b=RGmGBApt/m+dELtoCg9pFSugNn13TFpcZ2I5G8NITtahfaXMrkx9kGy6zBlW5lY2KB
 t2VnL1KCR4Kl/S9KAl9My+kKOVONzeAzTZrRPbRzAQZBBolOHDPrO+tQWaXLsnRMrW30
 eUQi3SBTkrJcoMRnt97xs+RHWRjBdTcITSz66FWL2NDbzAA3FOmV/CrBAISh/nl9py9U
 DyRyZgVweifUN37oRi1WALurDCwE+T2iWjyYLUm0wCDJaIr6Q1IRzwWIAb2sUe1GtUE3
 nLWaxvMbPQsB5cKQRQ3zGs2D57QdfDtMlfHqJu9G9RIgleOWFTfhp2uK8G/y8sIAo1mu
 vgLg==
X-Gm-Message-State: AOAM533U3kU593dCBj4pjkAoYEO32MiGU278tVZI+xwN53Ocki5+ENBU
 HRUVUxiLu/4HxeOfsBomtztZ1m6s7ftEQQ==
X-Google-Smtp-Source: ABdhPJx3nkWlFu0uu97//0uNkR/dir2aPZDUB1x33bgenASk/eg4bD2X/6gKX3DIQiuKW8/ACRr4+w==
X-Received: by 2002:a17:902:bd98:b029:d9:7b0:e1e5 with SMTP id
 q24-20020a170902bd98b02900d907b0e1e5mr16129511pls.77.1605929132538; 
 Fri, 20 Nov 2020 19:25:32 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id w22sm4673768pge.25.2020.11.20.19.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 19:25:31 -0800 (PST)
Date: Fri, 20 Nov 2020 19:25:31 -0800 (PST)
X-Google-Original-Date: Fri, 20 Nov 2020 19:25:30 PST (-0800)
Subject: Re: [PATCH] RISC-V: fix barrier() use in <vdso/processor.h>
In-Reply-To: <20201117013951.7827-1-rdunlap@infradead.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: rdunlap@infradead.org
Message-ID: <mhng-8c56f671-512a-45e7-9c94-fa39a80451da@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_222535_976402_AE4E25A2 
X-CRM114-Status: GOOD (  20.26  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, aou@eecs.berkeley.edu,
 rdunlap@infradead.org, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, natechancellor@gmail.com,
 clang-built-linux@googlegroups.com, nivedita@alum.mit.edu,
 schwab@linux-m68k.org, Paul Walmsley <paul.walmsley@sifive.com>,
 akpm@linux-foundation.org, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 16 Nov 2020 17:39:51 PST (-0800), rdunlap@infradead.org wrote:
> riscv's <vdso/processor.h> uses barrier() so it should
> #include <asm/barrier.h> to prevent build errors.
>
> Fixes this build error:
>   CC [M]  drivers/net/ethernet/emulex/benet/be_main.o
> In file included from ./include/vdso/processor.h:10,
>                  from ./arch/riscv/include/asm/processor.h:11,
>                  from ./include/linux/prefetch.h:15,
>                  from drivers/net/ethernet/emulex/benet/be_main.c:14:
> ./arch/riscv/include/asm/vdso/processor.h: In function 'cpu_relax':
> ./arch/riscv/include/asm/vdso/processor.h:14:2: error: implicit declaration of function 'barrier' [-Werror=implicit-function-declaration]
>    14 |  barrier();
>
> This happens with a total of 5 networking drivers -- they all use
> <linux/prefetch.h>.
>
> rv64 allmodconfig now builds cleanly after this patch.
>
> Fixes fallout from:
> 815f0ddb346c ("include/linux/compiler*.h: make compiler-*.h mutually exclusive")
>
> Fixes: ad5d1122b82f ("riscv: use vDSO common flow to reduce the latency of the time-related functions")
> Reported-by: Andreas Schwab <schwab@linux-m68k.org>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Arvind Sankar <nivedita@alum.mit.edu>
> Cc: linux-riscv@lists.infradead.org
> Cc: clang-built-linux@googlegroups.com
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Nathan Chancellor <natechancellor@gmail.com>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> ---
>  arch/riscv/include/asm/vdso/processor.h |    2 ++
>  1 file changed, 2 insertions(+)
>
> --- lnx-510-rc4.orig/arch/riscv/include/asm/vdso/processor.h
> +++ lnx-510-rc4/arch/riscv/include/asm/vdso/processor.h
> @@ -4,6 +4,8 @@
>
>  #ifndef __ASSEMBLY__
>
> +#include <asm/barrier.h>
> +
>  static inline void cpu_relax(void)
>  {
>  #ifdef __riscv_muldiv

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
