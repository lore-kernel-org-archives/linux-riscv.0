Return-Path: <SRS0=Qta6=KR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3889DC2B9F2
	for <linux-riscv@archiver.kernel.org>; Sat, 22 May 2021 15:59:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64E9A6109F
	for <linux-riscv@archiver.kernel.org>; Sat, 22 May 2021 15:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64E9A6109F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=gTcrn8E6qdsSZvNv+rYSrdMLU74UhoIbdH9YPFa3Euo=; b=RJE7ttphL/LOp8oSt+TdU7Wepn
	bO18re+YqPLN+YKJ/FBXBwQEgedAUfeoT9vAieE17dvMU4Wyo8ochxh/Xl1TH+T86fG5Hwm70jcpO
	TRwSKteeb2bZQbghARSjwTsR4LgcdcaoaBB8WcfgaIzp5K59xA8r9dnhNQ2IBiUZcKoBp2KkN4n0i
	ARGo0G+oBfS8xhdcD9oO6G1b2UpitRgWQ1QZW7ZUS9lLwtWeg28JrPasSQZhAslYgAyIjFD2QTMir
	RuvVg0JUw3913giJKuTNK4wWBuYBe4dAfZcNzsfPXjzIINH3OfWT5f/2tHl1wOZ6n13NGdKlWq1mI
	WUYDYjHQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lkU1k-002kXx-Nh; Sat, 22 May 2021 15:59:00 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lkU1i-002kXr-Mt
 for linux-riscv@desiato.infradead.org; Sat, 22 May 2021 15:58:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=YC0AUzrulbfXTPGUc6+Eo3yjtdbpbQr1DON/2cAmC8k=; b=Teh74R8UxzOF3zNtlERmW89izF
 DuiSjyWL6G6ElqrclWHs9sgmS1GRe1oVMt2eCMTAd3XAHV8v04DDRC+QqqPsouNauPPgjmI1TFC6s
 3v1LXXyeTZ9+pwxr7jFIo9cStK+e63kv/DRitvRSg0+hmzvIMzqDfZMwmbrX7bka3hEFCBs5lEDil
 8bFVn3a4qUAoxpDsgvG9Xkz5JkmQ4GsCwG/06RrRTNjc8jAlZ5ex+GboA9NuN4qDUCFCWbye/0zgS
 r9Mu+T36pY/Mvdu5BLC7Kdm3eb4YDiX961pe7shl9vonyTEbeVwVvzj4o/JG5eSnGWpiMNlS0azUQ
 z8reTlDw==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lkU1f-0008sK-Is
 for linux-riscv@lists.infradead.org; Sat, 22 May 2021 15:58:57 +0000
Received: by mail-pl1-x632.google.com with SMTP id u7so3932480plq.4
 for <linux-riscv@lists.infradead.org>; Sat, 22 May 2021 08:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=YC0AUzrulbfXTPGUc6+Eo3yjtdbpbQr1DON/2cAmC8k=;
 b=1ZCdw+5jYXoni4Z20fd02wMjFgDKuQCeYYsbZZlGNgrYaRso7G25McVG5/j9Ndp2qo
 Lho+FiPX1jtz5f9pPWo60WCw+rqoDJ6QbZVZven1A94SEOUQMb/7CFtHD0swUVfA/92F
 20gSHXAxKWkl5jON7/R1ufJPwir5GZcNWfbJkbdZ86POZIs9+ozjV6dY+pQuYPRU4/h6
 dN7hwg44G1JYfxQBeJp+KfW0HtJlb1TNmQChe9iylgPUbokhBuQzO5oYQz8Oo5/5YUMb
 fcyJNkG9v4o+La6OM/y3QIcsh9XPLWWP00zC/HTQXD350unyXbpCVE422Di5OkqhHJ7c
 heGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=YC0AUzrulbfXTPGUc6+Eo3yjtdbpbQr1DON/2cAmC8k=;
 b=WEXPWekW0XJrhOohC8v0C1e4NULVgzWQSDD8PpH+l26qDNDpCLuHCKn3rl3YEUEIwF
 jjPRavnh/n8Ti+acupYFw6YCgBGHDQbXLwVwi0fTZClaVFovHl9rCZFaHoyj/u8mxWMp
 Y7dUQ5krbFnlM4evQoAArcvRAdqDacSDlTbjqygvfCPZ3VGxXc7v1prI3aiHeIY8QC8R
 7uEcHXxMGBKuN9khpMDiwgzgAF6RozNITVEOPeZakEvyP8lYrUGB3UhOeyGQy4HNDNt3
 ZSd0xsaK6glTG0qR+iQR8JKkvAXmwWEdycR7aM2OKF5Busw9deWGnzQ0F64hFSYmguHH
 4ILA==
X-Gm-Message-State: AOAM5326ZpC4NMppUDl1XvBP51tN3/vEKN6uHNSW1OCxbN+BO/5i+Kde
 cEbJaJpCcDW32osrhMWzS4gQ5A==
X-Google-Smtp-Source: ABdhPJzfD3lIGj2z7tMu9To9+LZC4m6Mitb2IPcsL/WvC7j2QUJD7RgGKOvA5D1D4ItV67bS5B5CWA==
X-Received: by 2002:a17:90a:aa14:: with SMTP id
 k20mr16800134pjq.88.1621699131009; 
 Sat, 22 May 2021 08:58:51 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id n69sm636105pfd.132.2021.05.22.08.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 May 2021 08:58:50 -0700 (PDT)
Date: Sat, 22 May 2021 08:58:50 -0700 (PDT)
X-Google-Original-Date: Sat, 22 May 2021 08:58:47 PDT (-0700)
Subject: Re: [RFT PATCH] riscv: mremap speedup - enable HAVE_MOVE_PUD and
 HAVE_MOVE_PMD
In-Reply-To: <20210417003539.5bceabc2@xhacker>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang3@mail.ustc.edu.cn
Message-ID: <mhng-5de139d5-ac6e-4f73-9d63-721790b30c26@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210522_085855_699829_DBACEE75 
X-CRM114-Status: GOOD (  21.49  )
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

On Fri, 16 Apr 2021 09:37:22 PDT (-0700), jszhang3@mail.ustc.edu.cn wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
>
> HAVE_MOVE_PUD enables remapping pages at the PUD level if both the source
> and destination addresses are PUD-aligned.
> HAVE_MOVE_PMD does similar speedup on the PMD level.
>
> With HAVE_MOVE_PUD enabled, there is about a 143x improvement on qemu
> With HAVE_MOVE_PMD enabled, there is about a 5x improvement on qemu
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
> Hi all,
>
> After reading the risc-v privileged spec, I think it's safe to support
> the HAVE_MOVE_PUD and HAVE_MOVE_PMD optimization on riscv. The patch passed
> the mremap_test on QEMU. However this can't be tested on real HW due to lack
> of HW boards, this is the reason why I mark this patch as RFT. I hope I can
> buy a sipeed Allwiner D1 SoC powered SBC soon, at least I can test
> HAVE_MOVE_PMD. Helping me to test on real HW is appreciated!
>
> Thanks
>
>  arch/riscv/Kconfig               |  2 ++
>  arch/riscv/include/asm/pgtable.h | 12 ++++++++++++
>  2 files changed, 14 insertions(+)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index e8074d248457..37660de68b00 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -80,6 +80,8 @@ config RISCV
>  	select HAVE_KPROBES
>  	select HAVE_KPROBES_ON_FTRACE
>  	select HAVE_KRETPROBES
> +	select HAVE_MOVE_PMD
> +	select HAVE_MOVE_PUD
>  	select HAVE_PCI
>  	select HAVE_PERF_EVENTS
>  	select HAVE_PERF_REGS
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index ebf817c1bdf4..287733b95d10 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -360,6 +360,18 @@ static inline void set_pte_at(struct mm_struct *mm,
>  	set_pte(ptep, pteval);
>  }
>
> +static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
> +			      pmd_t *pmdp, pmd_t pmd)
> +{
> +	set_pmd(pmdp, pmd);
> +}
> +
> +static inline void set_pud_at(struct mm_struct *mm, unsigned long addr,
> +			      pud_t *pudp, pud_t pud)
> +{
> +	set_pud(pudp, pud);
> +}
> +
>  static inline void pte_clear(struct mm_struct *mm,
>  	unsigned long addr, pte_t *ptep)
>  {

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
