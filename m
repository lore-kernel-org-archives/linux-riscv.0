Return-Path: <SRS0=Il0f=OB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3140DC433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Sep 2021 06:04:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E03156113A
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Sep 2021 06:04:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E03156113A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=FKzGkqKXSeYlTbGlk7YiI3s3t04XSUeb8yoH4qXUclA=; b=KNrfbeeKFWfjVifTmeqjNX4AAW
	qMUbk/UzUWYdhaMw2XCSAyc0yZc4A1BWMC32kyAKtwpvtv0wKXmfm8Qw3/bitz6GXx2x6+H9GVDRr
	DqoHS0uB3wcADGFTCiGprqXpLSRVULmLfX4S1fFjqp7q5CiGn8tGfBGxi0oA2lZxAAeZ69d0F+KbG
	dD0GbizT6So2LjV7ZEPRT3yv+rq/xflwLl406fip/dxStDrLH0NbLQSWNM5zk7nhTrFUFdaMuzlAP
	/AGx/d/XOFHnZ5s85GQycvav72Aj+/LULARf0mGFuSj14IUl0RiIDHlxHSfDEqTXvTKpuI9iQDxfj
	zL4Lp4lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOw7U-00ELhG-Sb; Sat, 11 Sep 2021 06:04:08 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOw7C-00ELcd-3v
 for linux-riscv@lists.infradead.org; Sat, 11 Sep 2021 06:03:51 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id
 j11-20020a4a92cb000000b002902ae8cb10so1399773ooh.7
 for <linux-riscv@lists.infradead.org>; Fri, 10 Sep 2021 23:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=FrB+DdiGqgva3j66XrBqrvCTjol52H42MNwBkBa5bhQ=;
 b=N8G5mm0nrjANbw+JW5we9a6A2gEsMImr0Bfw5cQE2t79e86LMwDJOruoFY3gb5F3qh
 7qGbXkYpO6DOFvd6kZIZg0lQ5Dq1ECrnPsbT2yI+b5nv/K+a8WZTxUYTYPFsKkMMy70R
 bujw/fmpmTKeFFs/oc1ARwUgV5jRG4689a8oLvW+k19mj/Ff2E3cFcG8KKnMLtnbhJfA
 Ki25ldtxebMn0J01e2do5qgzpzO7/f0IarhI8fqPwj/7v500l9fnK/cbmpM+/cPTJLBZ
 sWdGW98Mj6K2cvNAkEoP1rbNNrHyGFdVfsDyJn6Bfp4hT8vvsUhWpuF/xBkp/znHls60
 t+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=FrB+DdiGqgva3j66XrBqrvCTjol52H42MNwBkBa5bhQ=;
 b=3d+/bQWMkl+MHBNXBkgT8ScCryaqiWMoVpU4sEtRHu5YAzuLNOyh8L9Ps79TC+0Uh8
 CcuMTsHN7/UHCox3OjeeWITK8UI/4z5EgQmJ2EXfAY9MqzzSA/4kTMYomxj+0ZpenCH4
 lNVexmjtpft9fFoDM9JInIcBvQRJDeBVfWoOvDuZ0UEEi5DsuZjzvzeW1ZECVtKPDuDq
 lYV5cvCwiFmzpP9DaWK7a7sKLE3GvLDLvU2y0YBYHpKt1arUW9jhgjoQPGvAT98Qo65j
 CN7xcVcrvGqNtXEPOjx5Tb2JZIGLUfMJas4KmQBg31MYrpSi3eSqbmoZ7GdY2c4SCJjl
 7F1Q==
X-Gm-Message-State: AOAM530K5Jvf8u91hazifw4tvUV6DF5SYUGTaLNAELbHs0JNgQEpSgSo
 OoPtbQHXuDDtjEi7jtQ7G1w1n71235stBTEn9YM=
X-Google-Smtp-Source: ABdhPJyEKmH+WtfewYTvbUFrrKnX1M2D87TLq4hrG0vMfnrYO4MS8J1RP8Hp8qZwLJZk9KQuHvq+aQ==
X-Received: by 2002:a4a:5592:: with SMTP id e140mr1041396oob.59.1631340228689; 
 Fri, 10 Sep 2021 23:03:48 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id w9sm202621oti.35.2021.09.10.23.03.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 23:03:48 -0700 (PDT)
Date: Fri, 10 Sep 2021 23:03:48 -0700 (PDT)
X-Google-Original-Date: Fri, 10 Sep 2021 22:28:09 PDT (-0700)
Subject: Re: [PATCH] riscv: Improve stack randomisation on RV64
In-Reply-To: <20210812114702.44936-1-wangkefeng.wang@huawei.com>
CC: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 aou@eecs.berkeley.edu, wangkefeng.wang@huawei.com, alex@ghiti.fr
From: Palmer Dabbelt <palmer@dabbelt.com>
To: wangkefeng.wang@huawei.com
Message-ID: <mhng-d49d0616-d4d5-496f-90f8-00e6c4b14006@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210910_230350_205679_FF80ADE1 
X-CRM114-Status: GOOD (  20.07  )
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

On Thu, 12 Aug 2021 04:47:02 PDT (-0700), wangkefeng.wang@huawei.com wrote:
> 54c95a11cc1b ("riscv: make mmap allocation top-down by default") support
> ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT, which will select ARCH_HAS_ELF_RANDOMIZE
> from commit e7142bf5d231 ("arm64, mm: make randomization selected by generic
> topdown mmap layout"), so riscv has support ELF ASLR feature, update the
> documentation.
>
> And enlarge STACK_RND_MASK from 8M to 1G to increase stack randomisation
> on RV64 like x86/arm64 does.
>
> Cc: Alexandre Ghiti <alex@ghiti.fr>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  Documentation/features/vm/ELF-ASLR/arch-support.txt | 2 +-
>  arch/riscv/include/asm/elf.h                        | 3 +++
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/features/vm/ELF-ASLR/arch-support.txt b/Documentation/features/vm/ELF-ASLR/arch-support.txt
> index 99cb6d7f5005..2949c99fbb2f 100644
> --- a/Documentation/features/vm/ELF-ASLR/arch-support.txt
> +++ b/Documentation/features/vm/ELF-ASLR/arch-support.txt
> @@ -22,7 +22,7 @@
>      |    openrisc: | TODO |
>      |      parisc: |  ok  |
>      |     powerpc: |  ok  |
> -    |       riscv: | TODO |
> +    |       riscv: |  ok  |
>      |        s390: |  ok  |
>      |          sh: | TODO |
>      |       sparc: | TODO |
> diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
> index f4b490cd0e5d..f53c40026c7a 100644
> --- a/arch/riscv/include/asm/elf.h
> +++ b/arch/riscv/include/asm/elf.h
> @@ -42,6 +42,9 @@
>   */
>  #define ELF_ET_DYN_BASE		((TASK_SIZE / 3) * 2)
>
> +#ifdef CONFIG_64BIT
> +#define STACK_RND_MASK		(0x3ffff >> (PAGE_SHIFT - 12))
> +#endif
>  /*
>   * This yields a mask that user programs can use to figure out what
>   * instruction set this CPU supports.  This could be done in user space,

Thanks.  I cleaned up the commit text a bit, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
