Return-Path: <SRS0=1JZA=NQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DEF2C4338F
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Aug 2021 04:45:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA92E61373
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Aug 2021 04:45:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DA92E61373
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=kS3FrGojPRYwtfoagmL2leTZWEP2lfpT8qB+Im87i0M=; b=buOHHRjPP9bIMHjP4TJ8oHox9a
	fkRfRMjX7lOijxNXC+6N4MfYbAsoQxtWsrUYMdWYKJPYiDxSOHZ5i2pLjFe2rQxq851gZjjpWI96F
	JDBbAuS0VfAAGSArMCICXUGU9rhP6qNuvskYxgenTYfbtHq7TkFw//DkRbO74wvwaItbJemenSOyx
	87Keed+6b9jXb1Pv+cBbHOBQ1ZISE2dvoKmDi13x+5sHzDG3t6pEbVwlmvthWrNY8M3qoPTEBz9Jp
	U6rBM+f8Vl+5lqZNpA8k8DUEzYv3HG/T2vEnxUvBtv9h4VlxYfs72UBuenw4cMOPn718cuFAatJyh
	mC8DZAbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIkmg-005UZL-AU; Wed, 25 Aug 2021 04:45:06 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIkmb-005UXI-Mx
 for linux-riscv@lists.infradead.org; Wed, 25 Aug 2021 04:45:05 +0000
Received: by mail-pg1-x531.google.com with SMTP id k24so21875115pgh.8
 for <linux-riscv@lists.infradead.org>; Tue, 24 Aug 2021 21:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=7An1qOKhb0/BJH1XFWypIzS3gCOZ53jVfEc4mO5wsk4=;
 b=v5mcuMrttY/PcyEkupueYaA4dl1TeGKkRQ3e72JC3lpG3D4457cMIhWBU7Wu+SUumr
 0IvTqzap7e7rQPDpnuEZGu5ef4izlONypoQrGH8SqmjSMATYLk0q8FGys6EWCsFPgqji
 wtMiqNGr5TX5D0OGV/Fg8k8IEY4qzqSWmypEIjkyIu5RIjNe7p+JXFZvhcpD7K2LDgQm
 X5OKoYgORg3L3dsZka+ILXDnfh+pWC+jEB37us2atFQqzGOu40ij/n1RduGtj8Kg2fGq
 Y6pzkmyqbamdKxO3iAG7lqyDr7Z18KZgtfj/lKItw1UXel98tcRIuhcrbE7FW2ONU5Cp
 jqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=7An1qOKhb0/BJH1XFWypIzS3gCOZ53jVfEc4mO5wsk4=;
 b=f0cGbRHBqjO5Aensl4ejmvqg/6unJyT7ocBdufBVGsdGiG5GblYPnF3N/jbgGf5PHA
 YG/dEU9vOO9xDJwg/kbJXXeVybodyozjWnxzZaVVJpymn9HqGrDEO3/9TpWJvFkAQ3Td
 sA0+OmEZrbvBze3iRpFumCmbHRZdBrUiUln09RTaxznlCA2Mwd5obdZh8a3sdtmIi1Hf
 wAkQcJClsNqm1EzuFMZ2P6piZRadM+fgNYZe50th0kHyeRdNAjcZbV0kTPikdKnC8f8P
 UAD83u2J8+IRId5cw7srzNQ7uw/LyfpdByoZIwCfWB4BabRIvORUpzH37goWU98Yc3Kr
 Gtlg==
X-Gm-Message-State: AOAM531bKYrAeQ3UBvYyJKlx5jODxxUWnnbK/eW8Rz7esxx5XRSb+A39
 msB6gBFsl9ft6LILsYhHXXSqsQ==
X-Google-Smtp-Source: ABdhPJz2UhBzkG7qw4W+QaoVEOJjcZGHzARg3VkcsQb/5AcJ3CjIPcjzDqFty4Q1XcX1r2OVWJ2c8Q==
X-Received: by 2002:a05:6a00:2405:b0:3e1:9f65:9703 with SMTP id
 z5-20020a056a00240500b003e19f659703mr42768559pfh.6.1629866700873; 
 Tue, 24 Aug 2021 21:45:00 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id pj14sm3597913pjb.35.2021.08.24.21.44.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 21:45:00 -0700 (PDT)
Date: Tue, 24 Aug 2021 21:45:00 -0700 (PDT)
X-Google-Original-Date: Tue, 24 Aug 2021 21:44:56 PDT (-0700)
Subject: Re: [PATCH] riscv: Enable Undefined Behavior Sanitizer UBSAN
In-Reply-To: <20210805003059.26b03ec0@xhacker>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang3@mail.ustc.edu.cn
Message-ID: <mhng-9d810d01-99cd-4e1c-8642-d9caf3e0a9bc@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_214501_793846_5C68ECC6 
X-CRM114-Status: GOOD (  18.32  )
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

On Wed, 04 Aug 2021 09:30:59 PDT (-0700), jszhang3@mail.ustc.edu.cn wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
>
> Select ARCH_HAS_UBSAN_SANITIZE_ALL in order to allow the user to
> enable CONFIG_UBSAN_SANITIZE_ALL and instrument the entire kernel for
> ubsan checks.
>
> VDSO is excluded because its build doesn't include the
> __ubsan_handle_*() functions from lib/ubsan.c, and the VDSO has no
> sane way to report errors even if it has definitions of these functions.
>
> Passed lib/test_ubsan.c test.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/Kconfig              | 1 +
>  arch/riscv/kernel/vdso/Makefile | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index f133ac72572f..cccb95bf8331 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -28,6 +28,7 @@ config RISCV
>  	select ARCH_HAS_STRICT_KERNEL_RWX if MMU && !XIP_KERNEL
>  	select ARCH_HAS_STRICT_MODULE_RWX if MMU && !XIP_KERNEL
>  	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
> +	select ARCH_HAS_UBSAN_SANITIZE_ALL
>  	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
>  	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
>  	select ARCH_STACKWALK
> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
> index 24d936c147cd..30a5335bd317 100644
> --- a/arch/riscv/kernel/vdso/Makefile
> +++ b/arch/riscv/kernel/vdso/Makefile
> @@ -36,6 +36,7 @@ CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE) -Os
>  GCOV_PROFILE := n
>  KCOV_INSTRUMENT := n
>  KASAN_SANITIZE := n
> +UBSAN_SANITIZE := n
>
>  # Force dependency
>  $(obj)/vdso.o: $(obj)/vdso.so

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
