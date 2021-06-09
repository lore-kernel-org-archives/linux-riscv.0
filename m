Return-Path: <SRS0=S+R5=LD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C851C47082
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jun 2021 00:13:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59BBE613AD
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jun 2021 00:13:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59BBE613AD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=9ZViEonQ72OucIov0o9p6PecrBo7g7sxFy4ucriqP00=; b=PgwejSr1lqf71/+Rm8D/ffMJS7
	ZYVBcU3ZMUl3Qd4rWTzw7xAbeFXZ4WbXb6+Ah0n5dZNqyXn5VEW8IlpRmBn0+bEr5V5D2E2a+ThwK
	n4EFvfIbHiOpRm8c8tV0Ucy1mKBviekcsMFH+RYSk93r5dY+OIv5M15ozDuSLJy8/SKwk6SWXT8BK
	vmJ66R5bWF2ng0wlO5KZ271LQK0ohGkKJdgdGT/EwXN9ytNrTa8TgMKMP7VSxuJNGVfppWGV3tfgp
	9CN9fhTqtsUnzEssBdMLHE+0Jd1SgUYH3rpCDusAnG4kKcPxx3YdD4Y0p9u0fgZdPz9/yHmw9kg7q
	Nu/k1VEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqlpz-00AqQG-6w; Wed, 09 Jun 2021 00:12:51 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqlpv-00AqPj-RE
 for linux-riscv@lists.infradead.org; Wed, 09 Jun 2021 00:12:49 +0000
Received: by mail-pg1-x536.google.com with SMTP id e20so5975737pgg.0
 for <linux-riscv@lists.infradead.org>; Tue, 08 Jun 2021 17:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=gpshw1WRGUrOMDm1dHvWn3SBn8eQqTW1CLj/AcXBFEQ=;
 b=mOv/ug9Hykkz5Ggy2DWpWSNHozSLIFLI8GgaEfLnGrC4yJt3D//AIhJi9Y8EIHZzsu
 cNFa3JVlKL4fzzSrcPp6esJ0W0zATcsNP0hIMx3acdCF8vCCxjTsM6eZxX0Mcq6cxJ/m
 5sr/aXUi+lx9xQsXkawA5y833gz7/50TZAsSaLbtM4G2+jK8412IKmpzrkXLQCnRWEQq
 IngKdJN/SLPS3ZPOH0QOGnesI+0cjAyBx/Ny9rv4mjiyx4Y1xD6iKz66gedqT5G5p4r4
 ahDv+zvW41IvP5tJ7/wXqpwEgcdedASFUzkhHtd2o4LP5RjzcuMAHI4KTnbBhRvCT/mb
 N/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=gpshw1WRGUrOMDm1dHvWn3SBn8eQqTW1CLj/AcXBFEQ=;
 b=hYo0Uz0Q450w2mKRSBDpdfEuBdPp0l6OIM7PN2LimJdkzf41478d90xTZ1sG5A5B2z
 7MWSiPR3XRHvbG3xRbQEbw6eUM/82931+Cljy8betONYKvs17Zs3Qbc7VGJbpBVmV5EY
 OsvKGYb0gbjaYnbr36ikVSaPYZ/4NQl8K36CKTca2guFeWYTxU3rdYMj27mpXP8b/jj2
 FBuXZrxb/5/Orx7ZraVQnWG6LmiW23SsTFNqQQf6wR7H2sxUUdQGbT4Stlet7ma8gOW6
 Ja+IltW10SXAHfP3wDE8DqA35K3EGdBiP/utC8KSK6nhMJ8GuX1Mb8nPANeDPBJijoik
 D6Yw==
X-Gm-Message-State: AOAM530tsEgY0Zb/CeFI+V47dO+4bIh6lw2pY0qD/yWeiokLppKlJsV3
 z/6Du0Y2ewE1ZsikVix9A7YVKdFeK9FM+2fg
X-Google-Smtp-Source: ABdhPJywSS6XUoBLf/U+A5Boragd7qhq9DipEvt65WhCwPtu+Vxa4eR+ChWvWXaWHCcmhtmbTQNsUw==
X-Received: by 2002:a63:d40d:: with SMTP id a13mr881986pgh.382.1623197566210; 
 Tue, 08 Jun 2021 17:12:46 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id x8sm471221pje.52.2021.06.08.17.12.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 17:12:42 -0700 (PDT)
Date: Tue, 08 Jun 2021 17:12:42 -0700 (PDT)
X-Google-Original-Date: Tue, 08 Jun 2021 17:12:38 PDT (-0700)
Subject: Re: [PATCH] riscv: mm: Use better bitmap_zalloc()
In-Reply-To: <20210529111534.186534-1-wangkefeng.wang@huawei.com>
CC: linux-riscv@lists.infradead.org, wangkefeng.wang@huawei.com,
 Paul Walmsley <paul.walmsley@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: wangkefeng.wang@huawei.com
Message-ID: <mhng-c8eb7997-acf0-408a-95b4-60de80678298@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_171247_902741_CD21542C 
X-CRM114-Status: GOOD (  16.21  )
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

On Sat, 29 May 2021 04:15:34 PDT (-0700), wangkefeng.wang@huawei.com wrote:
> Use better bitmap_zalloc() to allocate bitmap.
>
> Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: linux-riscv@lists.infradead.org
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  arch/riscv/mm/context.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
> index 83e7ae37675a..2aba0a6343d9 100644
> --- a/arch/riscv/mm/context.c
> +++ b/arch/riscv/mm/context.c
> @@ -243,8 +243,7 @@ static int asids_init(void)
>  	if (num_asids > (2 * num_possible_cpus())) {
>  		atomic_long_set(&current_version, num_asids);
>
> -		context_asid_map = kcalloc(BITS_TO_LONGS(num_asids),
> -				   sizeof(*context_asid_map), GFP_KERNEL);
> +		context_asid_map = bitmap_zalloc(num_asids, GFP_KERNEL);
>  		if (!context_asid_map)
>  			panic("Failed to allocate bitmap for %lu ASIDs\n",
>  			      num_asids);

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
