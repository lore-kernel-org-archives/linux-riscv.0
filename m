Return-Path: <SRS0=5xGv=KY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF003C47090
	for <linux-riscv@archiver.kernel.org>; Sat, 29 May 2021 22:45:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83A0161077
	for <linux-riscv@archiver.kernel.org>; Sat, 29 May 2021 22:45:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83A0161077
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ZKo09m9G+96u/ouN78ZRSUXmi9igGLDgo4+UKL5rn/s=; b=mCBBa8oqWqylKsXgSAI7YiuwaP
	DWzR3lzolEAtbpvhDaHvqRLfujygsnIEj/44kWrc7/e1fF2APCFwhw2RdjXDMHDUiN48sCfuipC8U
	BlBCRZO1ZS0ycPOjvzcFEQ57J1P1YS2EhgnPE1Lqs6aMdzXI9qYyaf8zaZztNgjBKGBGh4iA9tZLK
	TnmxCgoxf5rnH2dSRJjqe1nU1k+tJUqdVKlQ2pRwuEo940GnTcH56x6xj57FIWon/HZqgngRBqQ8T
	pVz3hij4YKA12fhn6EM9JqxUyadBoQhJhU1+Y/nIWiAnqTO808HuBw8I+ka2MSK4Ije84Pzj3XmCL
	r/sgmuyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ln7ha-008W7u-Nq; Sat, 29 May 2021 22:45:06 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ln7hW-008W6W-Nk
 for linux-riscv@lists.infradead.org; Sat, 29 May 2021 22:45:04 +0000
Received: by mail-pl1-x62b.google.com with SMTP id z4so3330938plg.8
 for <linux-riscv@lists.infradead.org>; Sat, 29 May 2021 15:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=re4Y09XMAWION1ySSNBn0YRDWorIYtNrtgT5Y3BVDAg=;
 b=LT4tZ4G+WMAAnkcwa0ihNb9Hfd4tq0FF6AuahUATbIwyQb0Pk7uA8NSSpXHZ+PsWAf
 FCYb47VpsUJ17N++2iCDbAJ26+JdnbLOWxaehe4ax25QzlvExvyBg818Rf1tU6bY7/iI
 dQV53F2YLoG8vHcyMke/5EyIUMZyV6ssQgjklcuR0BNQ8P5NIPs3vG1cE7KYVcu8uRLD
 E8wgmAfrW7P59BqfIepqutuxFUl/W6VDm+ADxc53oWHDDiWhlHy7Eg/Yh6ixWoz93B/C
 HG7lU4J+kuf8LcG5q6g5wG4+czir1Mf7akkm7uKoGI39GjJuYvsnK4A/7NiuABFbrF7g
 Q66A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=re4Y09XMAWION1ySSNBn0YRDWorIYtNrtgT5Y3BVDAg=;
 b=FJDRHkFxqtGT/SmQjQcWEH0quP3DgiewTpFe7rx3+ugTnfSyho/Lgh2JJ69WS/fjAB
 o2FOO3ZNN+hiKZ+sXrVeF3oH12NAp3Kf1gHyMxCUYKfMHsoUqd39Fup0pT26gdlU9ipX
 L3GVNf96HtIjIpCth8jfBv6B5ND3bS+CL2mCHT9ISeLh4Yzepn+N1EwG8j1ldZb6oZbO
 A4YzLUE+WB/1bliVydt35mPsemDizqYfGmJpNL0vGf8GizpptpU25up2T0BA/DW9rSch
 MqDCLi9smBdHndg3OLkZ6S620g28Xwd/nvv4Rsi+/kM+TTsr41NQe4BcGWuWZd/6uTNl
 Rl6Q==
X-Gm-Message-State: AOAM532hJlrkMIYEN3Lhc3BbLs9rKIulQMDCFpY/9Kz06bj/xoONSjuK
 V101YjjT5mUSBPPLcsILy5S3wRxVqXTlcQ==
X-Google-Smtp-Source: ABdhPJxVFCX2Y4LRrEkeoZAbu0OV1xdPV9EupbQMKWexN4dJ4tSi76OQcGeey0v1KNh0zgsDXojXIA==
X-Received: by 2002:a17:90a:448c:: with SMTP id
 t12mr11751937pjg.142.1622328301469; 
 Sat, 29 May 2021 15:45:01 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id p11sm7579499pjo.19.2021.05.29.15.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 May 2021 15:45:00 -0700 (PDT)
Date: Sat, 29 May 2021 15:45:00 -0700 (PDT)
X-Google-Original-Date: Sat, 29 May 2021 15:34:04 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Fix memblock_free() usages in init_resources()
In-Reply-To: <20210522174951.377107-1-twd2.me@gmail.com>
CC: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 aou@eecs.berkeley.edu, twd2.me@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: twd2.me@gmail.com
Message-ID: <mhng-78a7a70a-001c-4f3d-b4a1-c769919a89da@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210529_154502_813072_55726750 
X-CRM114-Status: GOOD (  17.28  )
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

On Sat, 22 May 2021 10:49:51 PDT (-0700), twd2.me@gmail.com wrote:
> `memblock_free()` takes a physical address as its first argument.
> Fix the wrong usages in `init_resources()`.
>
> Fixes: ffe0e526126884cf036a6f724220f1f9b4094fd2 ("RISC-V: Improve init_resources()")
> Fixes: 797f0375dd2ef5cdc68ac23450cbae9a5c67a74e ("RISC-V: Do not allocate memblock while iterating reserved memblocks")
> Signed-off-by: Wende Tan <twd2.me@gmail.com>
> ---
>  arch/riscv/kernel/setup.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 03901d3a8b02..9a1b7a0603b2 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -231,13 +231,13 @@ static void __init init_resources(void)
>
>  	/* Clean-up any unused pre-allocated resources */
>  	mem_res_sz = (num_resources - res_idx + 1) * sizeof(*mem_res);
> -	memblock_free((phys_addr_t) mem_res, mem_res_sz);
> +	memblock_free(__pa(mem_res), mem_res_sz);
>  	return;
>
>   error:
>  	/* Better an empty resource tree than an inconsistent one */
>  	release_child_resources(&iomem_resource);
> -	memblock_free((phys_addr_t) mem_res, mem_res_sz);
> +	memblock_free(__pa(mem_res), mem_res_sz);
>  }

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
