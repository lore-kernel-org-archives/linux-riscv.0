Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F4BCCF8548
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Oct 2024 23:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cmD5fhhJTiaJzuqupxkbjQy06+uhAQ8ehCd7L70uaUk=; b=kZh72KSajOgMxT
	Ah++t+1A7Gw48QQidQJpOwATRbHYSnU3XN7ZJzPEjX3C2V7XqlQ9SOZPtuTrHR7ez/YFv4bCbKIHW
	xYzxOR0QBbb/Z+4n85QXMiEA7PPlWD1T04LJJ+zsBD6JU2PK8y5VsmKs/c2tUMzsUS3v/tTNSQiHl
	ATAoTNDtyT8onnjc1LIuCqIj86+IDxumprm5kE4S5APuE5glznPeLwuByKOBorK5irFUaUfsBA6G0
	D3ktc6pu97f7j8WgI369Wc4qWPb3MRXqL1OwZHpz7tAetT42lGGyqaZ/REvMj/ZdoC0rS75Pp7A2x
	IrRJP3SHSA7BRCxwB9mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sw8xD-00000007mkE-2FRy;
	Wed, 02 Oct 2024 23:40:23 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sw8tq-00000007m2L-0FqY
	for linux-riscv@lists.infradead.org;
	Wed, 02 Oct 2024 23:36:55 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-e260b266805so338115276.0
        for <linux-riscv@lists.infradead.org>; Wed, 02 Oct 2024 16:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727912213; x=1728517013; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nY/F4CTExAOuUkjf0nz7rLS5b9eUxUi19ZbRKHEJLRc=;
        b=Nbkak4NZP/w8d8l8FlN0h1Sl/YGjM8I2xcOqjEGXsF5dYPePMifsVVdLknqFHiY5n5
         5BDTPQZ/ZWGFUZ+zxSsWkevjG4Zu8CBfppRyeH1+sokbjyxV1v3OKJCrU1b3Z43cKfsC
         WIWYmQEdRsoOfLAUHXWjET4fyXE0D8B0mFTmwwXQwzubdL5g/c+AgghceIN8fzFSeMnG
         wO/2TLyIlSe3X/drHXBf/VKRrir92I75a0GCRyVnEyoiBvfqM4j3DV3ueeYgin+lvvxN
         XShcr28uXCg3TRCWweaQ9DOQyqstIhpUU/Rt3ihNQMsX7lcL7MXSy4JyLRuFCtDONymt
         T5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727912213; x=1728517013;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nY/F4CTExAOuUkjf0nz7rLS5b9eUxUi19ZbRKHEJLRc=;
        b=rEXPkLokgFBa8D2S9HV9yTyYS0n/yvArtQ4PWQD4bWy687yTCgEvJF5fUdxC0roEPz
         CfyyCjwwrtKnewSmWdLQh4RbpYo066w1krBLQIHvx7wVbjHirTQMX8b/j6yXyz/NyP1O
         b1cxrUeCj9Vb9nt6x1UkKVeNJC2UjvuyG/RT25Ys1tIpMCLJHQP1TsDp7gW9SwDSQ4Mt
         Oz5/KnOQuLb8JaLe7/hYmwVlvB278sXlwu0jlxcFC1e2d66jJ33yO2rt9fy8owcUVO14
         LJs5XvLykcV2N1ixv6es9M+iVqCrgr73sbQdAAngUFMZNn5J/T6yLCsGa/BrlR1Ryc7c
         H2cQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpwmmSZKawKzp568zRzCSAu5Xof5osnrpgyi1+aoze++ZQ1KI5Pk1GE4K88uLgTdRki7aatcGSrCssuQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxoNdQy2j/ozGabO2C4fWr+pz52IzN9XMmcVcHukgbp1jvfUr0O
	iQOUuAJfTiD0PDIEffMZlJ5GI9+iAd+jOd9UdEkCIlU3UOgw+Q2FtDuURErqn3Y9i+o1L5FyIwp
	nhj4xN3ek6bhM+TUIu+RKnuNF7JVQ5Mq2jLrqzZppJq5NjHyt
X-Google-Smtp-Source: AGHT+IEqtBvDPMiSYGEm5TXVX8Sxz6COAlI/JwMlP602/bf3/owumvcuy4u17DBfBna1bb1pV8OpNWPenXFZIJKVLxg=
X-Received: by 2002:a05:6902:91f:b0:e26:365a:6488 with SMTP id
 3f1490d57ef6-e2638385296mr4616693276.12.1727912212845; Wed, 02 Oct 2024
 16:36:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240924210123.2288529-1-linux@roeck-us.net>
In-Reply-To: <20240924210123.2288529-1-linux@roeck-us.net>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 3 Oct 2024 01:36:17 +0200
Message-ID: <CAPDyKFqPPF7RAzmS2Lb69rb-T6T2WgNrwx8vcRLJ5WUZF2UOHA@mail.gmail.com>
Subject: Re: [PATCH] mmc: core: Only set maximum DMA segment size if DMA is supported
To: Guenter Roeck <linux@roeck-us.net>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>, 
	Robin Murphy <robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_163654_123424_E5A10068 
X-CRM114-Status: GOOD (  16.60  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 24 Sept 2024 at 23:01, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Since upstream commit 334304ac2bac ("dma-mapping: don't return errors
> from dma_set_max_seg_size") calling dma_set_max_seg_size() on a device
> not supporting DMA results in a warning traceback. This is seen when
> booting the sifive_u machine from SD. The underlying SPI controller
> (sifive,spi0 compatible) explicitly sets dma_mask to NULL.
>
> Avoid the backtrace by only calling dma_set_max_seg_size() if DMA is
> supported.
>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/core/queue.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/core/queue.c b/drivers/mmc/core/queue.c
> index d0b3ca8a11f0..4d6844261912 100644
> --- a/drivers/mmc/core/queue.c
> +++ b/drivers/mmc/core/queue.c
> @@ -388,7 +388,8 @@ static struct gendisk *mmc_alloc_disk(struct mmc_queue *mq,
>
>         blk_queue_rq_timeout(mq->queue, 60 * HZ);
>
> -       dma_set_max_seg_size(mmc_dev(host), queue_max_segment_size(mq->queue));
> +       if (mmc_dev(host)->dma_parms)
> +               dma_set_max_seg_size(mmc_dev(host), queue_max_segment_size(mq->queue));
>
>         INIT_WORK(&mq->recovery_work, mmc_mq_recovery_handler);
>         INIT_WORK(&mq->complete_work, mmc_blk_mq_complete_work);
> --
> 2.45.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
