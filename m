Return-Path: <SRS0=06uo=ND=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BA4EC4338F
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Aug 2021 07:33:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A362161019
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Aug 2021 07:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A362161019
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=6X10ZA9xPi8D4Kn+NZe4plfsDPWzNSycW1GGaSE8EtE=; b=uwaBHnqohb+8rm52MrZfpl0fZT
	1OjXbdVE5zWiI3rEeETYTUTL6sxkkYP6n66lp5njgR1RctD/Fy5okrfDrIpMpW2H76m3KCedMyyuT
	VZy6wcJiZ2R3wvqp9J/r88azCj8C96wJ7nQQVcGf1SF26xfD9wZsZyB3P9KtdT5t4trHCo2XA15cI
	YTco/07HpBjbqvwI2E06YiWpq5H/UlMHMClkzNx9P6OmboVUycAN/BFJjXGSwOUlJx8vUpQva6EvF
	IKwHagCnK8BC2Gq9n8TD869IOO7ghGE9Q/zm72oeGwiPSz3H3d9Ll2CVmXH7miyMC5mluSGv4qcOX
	mclQM7BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE5Ct-008uxH-5Y; Thu, 12 Aug 2021 07:32:51 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE4z6-008sdU-74
 for linux-riscv@lists.infradead.org; Thu, 12 Aug 2021 07:18:37 +0000
Received: by mail-pj1-x1030.google.com with SMTP id nt11so7936929pjb.2
 for <linux-riscv@lists.infradead.org>; Thu, 12 Aug 2021 00:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=mdOlsfXKdlKl6MyZvBvYASQyu4ZbLHqpUz6jLPzFa8I=;
 b=1pmWvojHGXKtF3Y31/agvPnvgb3Mo8uRp8GVUnuA9iT/DM8T+wOSFcbOhYRq7fg9ko
 rAu5mWvfUJccuG6Xqwty7QVAZa5lMC7G82mjaaCPDCtcJVHU8weO+mWglXB95GCRbO89
 es4x3kR24Ll9QhABrVGfu4H/qrGfPpIrQ7n6CNx3Aduqq3t2vZawfsIhUNHzRVytRyzJ
 Qg/k/LvSGrYhgGPA0EpU8uevogx6ExW9yBTwpTy4dvXA4wFxSEBY0uyUfekW1Avyjjjw
 /4M/bNvysLmVBMSxBD9oHEBZKh+ujRD999wdQU2gX8n9pMMRBoltlkTFLjhTxd1GoJ1P
 zygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=mdOlsfXKdlKl6MyZvBvYASQyu4ZbLHqpUz6jLPzFa8I=;
 b=EPYcq6cAcrV897tIcct23MKZPzEJFC2R4lO2lzL9FeUF7cpWsMN6mDFcsHlOe8YV/R
 EIz1sQPr7Sx2f7bOOTyjkwaO/0eSZni1yoNTEbyDhM3ASABGAszr/BaDOjFXEcA376LD
 Y4TBUT1l4dB8U/neMO7gsAPRc5DKPwN6K7ouN5Vq+VUN5Gg6eopGN3HBHy3b2mwT08AW
 B8G46qAC1G4sB3wjPG7Qux7uAM8dMkFFDbrTN5jknxce6+qTngRWoudstWgYm0FNjdyT
 8iiDAl39+O8WAvwuzgIvKQwDouWMiyb8eqtfUOxvem8XDf7S9JWtyrqSONsSukVu6Gmj
 cVIw==
X-Gm-Message-State: AOAM533ZoF1vtUGDbiY585D9Z0JOE0papbEOrf5mQgrJT4/7nagQKQNo
 +59MED7Nv87qTxaYBESFXrqtsA==
X-Google-Smtp-Source: ABdhPJypp8y/PT/pmeaZn789t3g2lcZzjWVyMVqF/3wBs2ifjAqYaUi4z9s3z6GwhLVGQ86eBUfHyg==
X-Received: by 2002:a63:5153:: with SMTP id r19mr2712356pgl.56.1628752714869; 
 Thu, 12 Aug 2021 00:18:34 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id b20sm1966925pfl.9.2021.08.12.00.18.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 00:18:34 -0700 (PDT)
Date: Thu, 12 Aug 2021 00:18:34 -0700 (PDT)
X-Google-Original-Date: Wed, 11 Aug 2021 23:50:20 PDT (-0700)
Subject: Re: [PATCH -fixes] riscv: Fix comment regarding kernel mapping
 overlapping with IS_ERR_VALUE
In-Reply-To: <20210726054254.21801-1-alex@ghiti.fr>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, alex@ghiti.fr
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-450bca42-382b-4821-8310-a2d43108c7cd@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_001836_314372_B9C1EC48 
X-CRM114-Status: GOOD (  25.01  )
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

On Sun, 25 Jul 2021 22:42:54 PDT (-0700), alex@ghiti.fr wrote:
> The current comment states that we check if the 64-bit kernel mapping
> overlaps with the last 4K of the address space that is reserved to
> error values in create_kernel_page_table, which is not the case since it
> is done in setup_vm. But anyway, remove the reference to any function
> and simply note that in 64-bit kernel, the check should be done as soon
> as the kernel mapping base address is known.
>
> Fixes: db6b84a368b4 ("riscv: Make sure the kernel mapping does not
> overlap with IS_ERR_VALUE")
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> ---
>  arch/riscv/mm/init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index a14bf3910eec..79a2e02924e4 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -191,7 +191,7 @@ static void __init setup_bootmem(void)
>  	 * if end of dram is equal to maximum addressable memory.  For 64-bit
>  	 * kernel, this problem can't happen here as the end of the virtual
>  	 * address space is occupied by the kernel mapping then this check must
> -	 * be done in create_kernel_page_table.
> +	 * be done as soon as the kernel mapping base address is determined.
>  	 */
>  	max_mapped_addr = __pa(~(ulong)0);
>  	if (max_mapped_addr == (dram_end - 1))

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
