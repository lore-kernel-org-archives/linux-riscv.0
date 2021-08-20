Return-Path: <SRS0=APW5=NL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CF3CC4338F
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Aug 2021 17:34:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE3E961101
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Aug 2021 17:34:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DE3E961101
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=+sf+23PUbf63DxRh4DeVDGMqwuVldXiakHxdgmm2oTk=; b=RR4DrvP2eTGagTctQfyHq0VFGM
	icZ3c8Bg2kNbYJcoaolDaf8blmt9iuK4yFOTROOKmOgyGXtg3yCRlbXsWm/rxdQ/FwBpuqcmbYcQj
	8VFMspX49bzqLMP/NegSSnGHPP+OFiEaGiKY0TDCFt4vkZcZGZNLexc0uQcRXzSxPvcVTx6aCPUEc
	kUesh9QsXJWDslNvFoHiIpy2UHNzInFLNfUAlLwaEfYDwCWnId9z9efxbMBFxlbwpaWvbxkX6MHQZ
	BszLfmqG7+UEL2kWrD3vngoFpoR8e+ITO+vS9DT/1ME2k+6O3gp2wOPyS9mcdmVum5zaYC6Fnp7zl
	fgbX9sKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH8Ok-00Bk9U-8K; Fri, 20 Aug 2021 17:33:42 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH8Og-00Bk8j-Dk
 for linux-riscv@lists.infradead.org; Fri, 20 Aug 2021 17:33:40 +0000
Received: by mail-pf1-x42c.google.com with SMTP id j187so9196529pfg.4
 for <linux-riscv@lists.infradead.org>; Fri, 20 Aug 2021 10:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=LHmZLwjfpB5ViJrCDrS9uGqZBO+twXTAgRJtKk8rk6w=;
 b=GuhPPzWGbSidt5NIz8+SPXP2vGvnwRq+2VwT864gyQ3srDCFOMHOsd+xlsK/9N5qIK
 VWkkJbpjnHN4RvyXrJIorlxs0w6he6jPQFOZvNm47Dnq7ZSWre9iIUEkmjRO+/xcYGnD
 nC2IlDFfStXI2/d/CAmEh8HIBofJI2PS7u7siOpDNwao1JbLKrs2HtV+aZl+Sof8yAJV
 3si5W6GJqlZcH+4lUPOCCMX9FcHqDwOuNKi/Ol8CjD7+w8vNKmwskjVxQiqB09MDCwnq
 CsJDZyLhOcdUzrL733RnGenavSPKWkNZOQkoS3yiLGAr6mkpUREVPZFc5f4bfoWcxHwE
 qk5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=LHmZLwjfpB5ViJrCDrS9uGqZBO+twXTAgRJtKk8rk6w=;
 b=CFXaVSTMDQT7OOgkI0kFb3m43qizfOUrMbUDSbS3CB34k2eKt1/s5vkyQJ3ht4vcC4
 cD83nt4A9t50eCeEFAOLfKZ9v+fyj60Limv4XRgmhJck7OJ6TKhqIn9wAk9tLMD8QjVf
 RbT/3C2i+KKaQHNNh+33lR68Wtk9cL/ZW61j2vDjClvxwd5DZqumB10C/6wlx4Org8xj
 LsMZJ3ff67GqxfU+iXxdPPs1kflSIVgj+wIIrs73ITUXjAru2x+/OiYFMl1UcFL7JJUz
 nZTGdQGLzdb+lj0EfRfSlQlhTP1ujowhE8MYLqDH/cyS9iDSUmT/rHw2HiRdWHxiPGVp
 AC9A==
X-Gm-Message-State: AOAM532sIhEeVpv0g6amhY++ZEeerbTYPHYYQeA1aiHWQ8ItEH1vapRh
 CVyAZ44AbZvo+eW1F9jIaAHfhQ==
X-Google-Smtp-Source: ABdhPJw1ZESX3w0pts57K0vfQ60rgKQjdDpQ+0daeT0HF0TU8LSQ1UqYdsSQ05QdsDHNE7nJC2+zLw==
X-Received: by 2002:aa7:8713:0:b0:3e0:4537:a1d4 with SMTP id
 b19-20020aa78713000000b003e04537a1d4mr20877155pfo.1.1629480813434; 
 Fri, 20 Aug 2021 10:33:33 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id w82sm7753925pff.112.2021.08.20.10.33.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 10:33:32 -0700 (PDT)
Date: Fri, 20 Aug 2021 10:33:32 -0700 (PDT)
X-Google-Original-Date: Fri, 20 Aug 2021 10:21:53 PDT (-0700)
Subject: Re: [PATCH] riscv: Fix a number of free'd resources in
 init_resources()
In-Reply-To: <7e3ebd5a-cd41-4591-ba2d-0151fa45e8ea@suse.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 mick@ics.forth.gr, linux-riscv@lists.infradead.org, petr.pavlu@suse.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: petr.pavlu@suse.com
Message-ID: <mhng-a975eb76-8d02-4f59-ac73-beccbb5f24a2@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_103338_595889_432443E4 
X-CRM114-Status: GOOD (  23.00  )
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

On Sat, 07 Aug 2021 10:54:50 PDT (-0700), petr.pavlu@suse.com wrote:
> Function init_resources() allocates a boot memory block to hold an array of
> resources which it adds to iomem_resource. The array is filled in from its
> end and the function then attempts to free any unused memory at the
> beginning. The problem is that size of the unused memory is incorrectly
> calculated and this can result in releasing memory which is in use by
> active resources. Their data then gets corrupted later when the memory is
> reused by a different part of the system.
>
> Fix the size of the released memory to correctly match the number of unused
> resource entries.
>
> Fixes: ffe0e5261268 ("RISC-V: Improve init_resources()")
> Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
> ---
>  arch/riscv/kernel/setup.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 18bd0e4bc36c..120b2f6f71bc 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -229,8 +229,8 @@ static void __init init_resources(void)
>  	}
>
>  	/* Clean-up any unused pre-allocated resources */
> -	mem_res_sz = (num_resources - res_idx + 1) * sizeof(*mem_res);
> -	memblock_free(__pa(mem_res), mem_res_sz);
> +	if (res_idx >= 0)
> +		memblock_free(__pa(mem_res), (res_idx + 1) * sizeof(*mem_res));
>  	return;
>
>   error:

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
