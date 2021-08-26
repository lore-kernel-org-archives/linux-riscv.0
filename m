Return-Path: <SRS0=v94U=NR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFC23C432BE
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Aug 2021 06:08:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A5A860F91
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Aug 2021 06:08:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9A5A860F91
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=okRSQ/XBDEiffz47SeESB4Qj8fWzoXy5Pp8HEBN0Ce0=; b=yyLVSvSfIVOr30A2uaDR5YsJBi
	JAroW2EcdZidYsIsfu5ObJDX7G7aT2ZTyxi0TxP2EVkxWoGKfpMvoCb8eclbTwUk8hO+GUc+DGaqT
	VuxBJUPeqfczX0jfJTwLeDfV04Hr1F2DO9/GK7bvmSWSHOEGWvIBulIsLl537Nce6sg37DfpOnINr
	v6CN0u0uyq7bPOz3WfLkBKLB9DXVsvYrZyGd2f86AU87DFReQ8mBOb6ALff7/1SE8FLSGOkajLPJH
	VioZ779nsvMgn5no/55Rv0YW4BiV1gBANMK1FpDIUIJrbRYMb3xGb5eyic4NaYl+1d8y6gfTNyizF
	CGCX2UAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJ8YZ-009GHz-S1; Thu, 26 Aug 2021 06:08:07 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJ8YX-009GGQ-0j
 for linux-riscv@lists.infradead.org; Thu, 26 Aug 2021 06:08:06 +0000
Received: by mail-pj1-x1032.google.com with SMTP id
 oc2-20020a17090b1c0200b00179e56772d6so5822179pjb.4
 for <linux-riscv@lists.infradead.org>; Wed, 25 Aug 2021 23:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=NNtuO05+8Dc6BRsSuMp/HZ2ZgToThCggAJvItaSKgr4=;
 b=UfcKjyWt1UqNEnNoP5+DZEnZy48CAGB30gxlXK76kRWAGeQlgwXqYCj+UZkoChsnQS
 8PZnkIkfMU/5vI7oBHWqwt3xLwzZ1lqOdfrhCUx4vULc0rqUtyWZUoJReiXkHRAj/rFB
 pbrObz6/1zif5tvGh/T4Q81xkOHXwjAiCy0UbjdWF394gHVO0VPKFyHZ7Y4faDFdj6cO
 0ryo8i0Dyb7ON+RVPOHlxAvkkdAuKIPU8JGXm1lODq27JjpcXA5m5RGlxtC1ny5qdhP1
 RYAHgPpTQfE3THkwM5UgRK3xigtNRMPjJlTs4TFYxHk6cMYNMVJyyRcy+v6kki84aEOB
 kuag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=NNtuO05+8Dc6BRsSuMp/HZ2ZgToThCggAJvItaSKgr4=;
 b=mLi9Wlro8BisDL9kysboq7nitNsos1sTa4SrIASCOXa98V+pqUbVBfbH8fzVCw92M+
 rm73A83NomjIddnWM/W/rOuBP5Gd3cxItGf7GOWFMOauNxbP0WUKtciVDvy0zViu330f
 J0z6VnrZN8VAhE5DPgKueascfOaiDCpe1YWwNcMbJ+f3bjnvi2O7JMfE7HcTmrUdvLyb
 FiSHUfRTblOrwWwFITabKEs83egE0bCZlvuZcX5Vb6qojH94j43iolp+8O5/uIB8huMg
 dkr6szB6N6qP4xqeH6HozncQC+EhEMXaBMpKJ9kI8rT8OYb8BZM68GwhIEFvS2jGw6Jx
 TedQ==
X-Gm-Message-State: AOAM530hceu6J9kM3U6bzZDLjEL8t9fcH9FJcI3q8a1pj5i9oigLt3rF
 p6kOSpAslXwDiSOhbn4vrSkyOg==
X-Google-Smtp-Source: ABdhPJx9ctMBPCljF2Xlz8amzdSmJcEDJ+3zpshuIOv0EA3RuS6bF9bVNd10PkvIt+pqrnzJRB0vCg==
X-Received: by 2002:a17:90a:7e8b:: with SMTP id
 j11mr2478556pjl.210.1629958081797; 
 Wed, 25 Aug 2021 23:08:01 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id j4sm2025639pgi.6.2021.08.25.23.08.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 23:08:01 -0700 (PDT)
Date: Wed, 25 Aug 2021 23:08:01 -0700 (PDT)
X-Google-Original-Date: Wed, 25 Aug 2021 23:07:59 PDT (-0700)
Subject: Re: [PATCH] riscv: use strscpy to replace strlcpy
In-Reply-To: <20210807071427.59613-1-wangborong@cdjrlc.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 Atish Patra <Atish.Patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>,
 wangkefeng.wang@huawei.com, mick@ics.forth.gr, 
 alex@ghiti.fr, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 wangborong@cdjrlc.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: wangborong@cdjrlc.com
Message-ID: <mhng-ec52f7a2-7fe9-4109-b326-a92af8b8205b@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_230805_103318_F08EC8B4 
X-CRM114-Status: GOOD (  23.68  )
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

On Sat, 07 Aug 2021 00:14:27 PDT (-0700), wangborong@cdjrlc.com wrote:
> The strlcpy should not be used because it doesn't limit the source
> length. As linus says, it's a completely useless function if you
> can't implicitly trust the source string - but that is almost always
> why people think they should use it! All in all the BSD function
> will lead some potential bugs.
>
> But the strscpy doesn't require reading memory from the src string
> beyond the specified "count" bytes, and since the return value is
> easier to error-check than strlcpy()'s. In addition, the implementation
> is robust to the string changing out from underneath it, unlike the
> current strlcpy() implementation.
>
> Thus, We prefer using strscpy instead of strlcpy.
>
> Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
> ---
>  arch/riscv/kernel/setup.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 18bd0e4bc36c..2dc62ebc0001 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -255,7 +255,7 @@ static void __init parse_dtb(void)
>
>  	pr_err("No DTB passed to the kernel\n");
>  #ifdef CONFIG_CMDLINE_FORCE
> -	strlcpy(boot_command_line, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
> +	strscpy(boot_command_line, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
>  	pr_info("Forcing kernel command line to: %s\n", boot_command_line);
>  #endif
>  }

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
