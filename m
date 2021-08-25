Return-Path: <SRS0=1JZA=NQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61444C4338F
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Aug 2021 04:45:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27E62613AB
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Aug 2021 04:45:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 27E62613AB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=VkqkoGlXcdqJr8thLtv8I/ySSgGuwHXKYoVhYhBQjsc=; b=xUWbJ88crC1q7AqWb9+w2wqLNR
	e/TvJupn0hSZQan/SyKz7AR43sHLykg0YIFuiTZpChfnpNubNwxB9pGSB9xqWv8BRBkg+SsvbpT9H
	rkgWE80up9CXnz0ShgnskSxRURVcEPtNp4kv+yFl73fGQYwqOJWGfOp8u+/j++TWfpP9s/zWM0e6/
	9fjKXoZnm7b1x5oe3tL5qtbUA9d8w+6L69m/qClBw3oY7N2mPCsESxDtRLZrYDaPQgmCCzRFaB8tv
	v5NIKWiG/FPvwiqJNhB2umn1+W4tMAAp/z/dWhaHocJiQSDRmSGz88dNcGnabsMJyIMSbgiHxo+GJ
	eCl6Mm2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIkmO-005UUq-OQ; Wed, 25 Aug 2021 04:44:48 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIkmJ-005UTZ-AW
 for linux-riscv@lists.infradead.org; Wed, 25 Aug 2021 04:44:44 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 ot2-20020a17090b3b4200b0019127f8ed87so3216047pjb.1
 for <linux-riscv@lists.infradead.org>; Tue, 24 Aug 2021 21:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=HQb1qPKPVQv8i2sQtSNBJbfKt3KpoSGtp9yhja3ONfM=;
 b=da7vg+SZq/t3BfPYQw8YZOFbshDhxnvL4qQmVe3n/Vwq+sKt2/xeRm42ZekP+MgxoZ
 CeOeiqbyq6fugqqtRsTrsBA3/mj+qf91j6TKcpbkWS0z97waN6tzym2cnS+KeO/6tC8l
 H+RdDqXUj18VXpRzkOz5nuBmmWgUz6LXcj920HGddbltWG38a0ffFOGx8vC8tgyyI2pk
 GU5rK4F0r7K7az4iEO2TIELNX+q9J9bn7XrY9TPFEtpBw31fsWFWcfZR+4f4DnsaSfta
 g/UyRr1fRQPLREpETfYfEytjNWWMSy9f0FX3t/gMHUc3St2MLSwrdot/Vjdf6m/NnI0T
 qONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=HQb1qPKPVQv8i2sQtSNBJbfKt3KpoSGtp9yhja3ONfM=;
 b=t0Q2q7L1AnvZrDsMptgcbQhlUdi5XO7BiMz+1zY1rw4Lw8pmSr/O8xg8unIMUVXCWP
 8gNCLI4QKXhlC2wvjuCRNanOIUIRw05xziA78X98+NJ+LsMjPK28KQPCVDlPruyeZXRe
 WONXxzno6afUTtUWCRDz4lb4RAAzgyFZgEk295HAvm6RUnmitE5In/R+eu8EUvoS5kki
 AZJy+fB8v4WwbiRXshMYeFQmLKlb+jdYzz7F3XGD+9j9dT4D39Iv8QQD4hNup8IRTlVp
 iO2eRRdaz0EiygLo4JZSeCtsbVbj+AdPl31jZSgY+CI0DxyYrL8A1csyWVeIyoYbSkPs
 nxgg==
X-Gm-Message-State: AOAM532aTWkNUsNK8Fwj/yqoEPJod/ygS/EtjFft3BjgxNqga7O0BR1n
 mI4fq8W5g+BOq+XjE96yw1bhaQ==
X-Google-Smtp-Source: ABdhPJxOM/2YGAEIgMwLGRY1pn58De9xkTf6LI9HnwGc+e+OCaed3fTdkvB6pVx0RQb+YRFDkn/OkQ==
X-Received: by 2002:a17:90a:eb0d:: with SMTP id
 j13mr6812463pjz.163.1629866682543; 
 Tue, 24 Aug 2021 21:44:42 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id t42sm8940750pfg.30.2021.08.24.21.44.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 21:44:41 -0700 (PDT)
Date: Tue, 24 Aug 2021 21:44:41 -0700 (PDT)
X-Google-Original-Date: Tue, 24 Aug 2021 20:58:40 PDT (-0700)
Subject: Re: [PATCH] riscv: Keep the riscv Kconfig selects sorted
In-Reply-To: <20210805002908.2597836f@xhacker>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang3@mail.ustc.edu.cn
Message-ID: <mhng-43c0a2a8-fbd8-47bf-a9c4-4ac01333b6b0@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_214443_407901_B4863F40 
X-CRM114-Status: GOOD (  15.93  )
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

On Wed, 04 Aug 2021 09:29:08 PDT (-0700), jszhang3@mail.ustc.edu.cn wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
>
> Move three Kconfig selects: ARCH_STACKWALK, ARCH_SUPPORTS_ATOMIC_RMW
> and ARCH_SUPPORTS_DEBUG_PAGEALLOC to the right place.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/Kconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 8fcceb8eda07..f133ac72572f 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -13,9 +13,6 @@ config 32BIT
>  config RISCV
>  	def_bool y
>  	select ARCH_CLOCKSOURCE_INIT
> -	select ARCH_SUPPORTS_ATOMIC_RMW
> -	select ARCH_SUPPORTS_DEBUG_PAGEALLOC if MMU
> -	select ARCH_STACKWALK
>  	select ARCH_HAS_BINFMT_FLAT
>  	select ARCH_HAS_DEBUG_VM_PGTABLE
>  	select ARCH_HAS_DEBUG_VIRTUAL if MMU
> @@ -33,6 +30,9 @@ config RISCV
>  	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
>  	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
>  	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
> +	select ARCH_STACKWALK
> +	select ARCH_SUPPORTS_ATOMIC_RMW
> +	select ARCH_SUPPORTS_DEBUG_PAGEALLOC if MMU
>  	select ARCH_SUPPORTS_HUGETLBFS if MMU
>  	select ARCH_USE_MEMTEST
>  	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
