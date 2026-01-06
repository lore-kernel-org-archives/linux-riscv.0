Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5330ECE9D42
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jan 2026 14:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XDtdx3xs2FifLPqIa4e7ujnAz8J/zVwHgkHiELU4IGc=; b=NvOwhQIiNH4fLq
	UwC8jKqeTCYfXWlcXJGgqzbnwiSYkxsiBIPZ8qvRL2mpU7LpnqG+Lw/ve0OlYL5fkk0GOlhA/VhSI
	p7TODFAkcT9jhKQyS4OpUY1jXZeInFdI4sKvHdMIuCZcRLzW383RM14YrNzAzT2vuAm+FtEbIgDs8
	uBFOe/iX46JMuqmy7gbP2peJSmmMlfml45+d5D5l8Cd1y1FAs1fuwgupKkDrkg9W/qVWeLuDZ2iq4
	ZWTgHbnRaIqxfjxCT7WFdMVgrp7/WXu7d5DFIdPuLzTOR3B4NkUgWbbuSDxZTaD/jGs65faAhBx1n
	Ips5t/d6iC8a3pBLrR1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8I0-0000000DJLO-3CPh;
	Tue, 06 Jan 2026 14:44:04 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8Hx-0000000DJJT-13WJ
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jan 2026 14:44:03 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-8b144ec3aa8so99832785a.2
        for <linux-riscv@lists.infradead.org>; Tue, 06 Jan 2026 06:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767710640; x=1768315440; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a0O6uqIuffeH+rUN8PGPXOYCGY9UdGKz4wTv0c6GmNM=;
        b=0pn7LkK1RLCyd2t36o6ZwPLe/Y1VcFYJxWyWdNhiex8DXOp+30uAH6ZI8RawTcpIGz
         bj7LWbhdNwICbhlvU/OMyvKjDervt76LdS//5q0AUnbLTHeivnlqpbmbrRzcE0GfOpIa
         YPkYbtpliUjOhKqkzQbRdRx1NZCUl/4exEhOezgANJm2e2xdFk9VdzAyV99UTs1Njmyf
         RPJFhpyaDWHv56oyUih7Ii9wUySALCCR9+QgmVB9YEbRxLzQ4wNWkSdyTT2xxweIfgYi
         GKDv00zqjgodW2pZnOOq2LAevw0Ec8qf1ntskhA1dITS6QgB4wilNBVXyEtT4V+Dwdk8
         8IJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767710640; x=1768315440;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a0O6uqIuffeH+rUN8PGPXOYCGY9UdGKz4wTv0c6GmNM=;
        b=OcCi5nbDJC3z9aHQA8EMrJu+p/miCRCTEgVtp5v8KhpSBVC5kfLUnOGsSIcW7GIWuu
         X++HoJIwIvB2aS7rcpqgnWbx0ylrrG+Angt8w6HM18YwH6NLaZcIAeNTja+/olyMQBfb
         1AmStRnzXwi9KBQPh7PezFljW091zUNoxLmsTuUHtdcH4oMh7CovC07JegsQ9HPt0XkT
         nToWKn0vlQuPZGaSTjo2ILnJ331K5m0QWcNUopGf04dQk0vRpSwXtc7wEs8321RERJVt
         QuDBV/PK/Vak7XndOrgfISK4WW/9bMokJF5fbfCe3DHChjZxYwnxt2gFTVyMH2y0eeLw
         KxJA==
X-Forwarded-Encrypted: i=1; AJvYcCWfw8BNI8Ol8esVcjeqMv2tT6kJ/apsWu+0eq3dVnFZZdNoRWSphLcpTz9Z5LbCqpr1Qry8udYXXQqH8w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxAFDv6p0igYHw9s3KOhfcxStnPd6edAN7oniJb67LVegf/CiMb
	P4ASx6mYP9rxHHtUhzK45iS0EWhlCkFmIbpciNPpmvK91wo+6/29oubJt0EG888yxRk=
X-Gm-Gg: AY/fxX62XtIWw7PFBtretY4VFECikYw4l1Pi5Uxn6wyiW6Tfn8XDA88NdHcs4Vi+7GO
	/TN/IqZQH/uqXCsBSH3e6JHE0MPNaA+gUmnzWvm+jOpnTsnXF4pAn//Eo6xneTvdZ8iCzQ5hYug
	kjclFGbqjJcaYXb+TJ3/a5ld5mm7Qja4AC3Pw0N1btIUdSBzIymk/UpzwZBbxN/zgHZYkUb3Ewe
	GBj7Mo0xPCH6slXcq6m73P7MRqiU7bEKxkynrMZNEABKUQquWNMaxgstUxMeDDNeg2EZlbzKCUo
	h3FLZ+WmORosm2k7vTJV1LJfo9G0SbhqsySj/qR/vjjygBtme0AaG86OU9/sin4NFmXOW8OQL10
	10q/kPt/lEn6UheJNNMjGicrnTfBGPIaQU5YaEE/h97UiEIDYcUXpLzfxG3lGWeHOgrYOeYPNXy
	4I5zaUTvri/mPOgld5RfU9Ueeo4dWScPyjXbfiTNZ8IRCr07q4etkyhXlu+0PFUw==
X-Google-Smtp-Source: AGHT+IGrfIQofU9ZXGHQqOM8HyQbxngWETjyA4UE68tcePwXWmd7b3PCLuyw9SW25mP3XlxN8HPLDw==
X-Received: by 2002:a05:620a:1725:b0:8b2:e9d2:9c69 with SMTP id af79cd13be357-8c37eb6cbcamr425625385a.22.1767710640277;
        Tue, 06 Jan 2026 06:44:00 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f51b732sm173883085a.25.2026.01.06.06.43.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 06:44:00 -0800 (PST)
Message-ID: <058d3911-ff2d-4151-b585-5bcb8810bedf@riscstar.com>
Date: Tue, 6 Jan 2026 08:43:59 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] reset: spacemit: fix auxiliary device id
To: Yixun Lan <dlan@gentoo.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Guodong Xu <guodong@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20260103-06-k1-clk-common-v3-0-6061d9f69eef@gentoo.org>
 <20260103-06-k1-clk-common-v3-4-6061d9f69eef@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260103-06-k1-clk-common-v3-4-6061d9f69eef@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_064402_604409_C5F60FA6 
X-CRM114-Status: GOOD (  14.95  )
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

On 1/3/26 1:26 AM, Yixun Lan wrote:
> Due to the auxiliary register procedure moved to ccu common module where
> the module name changed to spacemit_ccu, then the reset auxiliary device
> register id also need to be adjusted in order to prepare for adding new
> K3 reset driver, otherwise two reset drivers will claim to support same
> "compatible" auxiliary device.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

This would ideally be merged with the previous patch.  Maybe
Philipp can negotiate with Stephen to have that happen.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/reset/reset-spacemit.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/reset/reset-spacemit.c b/drivers/reset/reset-spacemit.c
> index e1272aff28f7..cc7fd1f8750d 100644
> --- a/drivers/reset/reset-spacemit.c
> +++ b/drivers/reset/reset-spacemit.c
> @@ -278,7 +278,7 @@ static int spacemit_reset_probe(struct auxiliary_device *adev,
>   
>   #define K1_AUX_DEV_ID(_unit) \
>   	{ \
> -		.name = "spacemit_ccu_k1." #_unit "-reset", \
> +		.name = "spacemit_ccu.k1-" #_unit "-reset", \
>   		.driver_data = (kernel_ulong_t)&k1_ ## _unit ## _reset_data, \
>   	}
>   
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
