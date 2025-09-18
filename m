Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9DB3CAC59A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Sep 2025 16:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M488P/9OxtKTNsfd3osD8aGZcmYZ6dYTx2St9iNVv6w=; b=XCkX9y/nd/Bdd+
	XOpwzbH4gVtO96scaSLd+OLthYqS3sYYsNuJhyAVfyacAvGKONsdG1dnDdW03M5tvef0mKzLm1OmS
	LxRWVOlkv8ZC3KKyKd37E6BmrER4smcm8pA2moIB+iKGKE9OSDXhBFdXSEr5Jnt26kKu5bOAHY1Oe
	Zj1lKrEianl6tZJbP9y3XNILjV/h8/62E+mz6k7r5N7eapoe1MgTf8ffBcA6S2GMNI8ikQLew5x7l
	2jNs1oTH/EngmCpyLI3+ZpbL4Jn9eiCDzaB7bqaZ4hQBvMPPRduIIdo3rp4Qfld/lWESNst/cKCRV
	KJ8PDvTZKlHmFFSS1Jjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHOt-00000000bfW-3GTK;
	Thu, 18 Sep 2025 16:22:27 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHOr-00000000beD-3bXy
	for linux-riscv@lists.infradead.org;
	Thu, 18 Sep 2025 16:22:26 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-42406e56820so5980005ab.3
        for <linux-riscv@lists.infradead.org>; Thu, 18 Sep 2025 09:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758212545; x=1758817345; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q60ma2V2EhO0+PfY8j2XOpbs7KGOot7DJdfuAqVmdQM=;
        b=GaOyQGg4LwKFGizV8SdTRW8hErDIx3ascm56Wd3FjD3NF5VSXI5A8B1DNaaHlCEqen
         KLOUPnudBTeKT25diNN0CgAIm7GjmOk/XRCjAr6JZQIXyqeQIR8XCxZfj6yVj159zJfv
         mLtualI1CuKjyLu8VfmfqDs97TjE9auZfKoeTuwk/Acq+O7pGxbXRVVI8QiIN0HU3Lop
         aCVU9gDDlsWDaMUzWo2B4HNsDHYHq4qDM47kiJ+4yjK3K/RSH3iuF82Wvi2DbNB6S7Gj
         3pyshnsGPtv1ULUU0hps+AZ/WJfD6Da8r5YMp/Cev86nUSpXRZtyJbt0SqZZyXkN+HeI
         6R2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758212545; x=1758817345;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q60ma2V2EhO0+PfY8j2XOpbs7KGOot7DJdfuAqVmdQM=;
        b=bhkW6NBSwkcSIbGbeZmWM09xcz0+WrBqIHZeNUTNOdoDZeekRfx844Y6hpUXofgSz6
         BqPgbQrhU+WG5pXHqJzZ80pKi7CPgMdJJRRYLLEHSpgt4L7xhBmJxEyqnEv5xkgJqdUa
         /lblpkOoi7P6tEHtF95ovH9+2PbbnC/i9wLumdxFbLsJ8jKvtZicNyM04xceCtzsv4K9
         gh2YYhtJJlVhYdKDgLX2Nn67vtgAFxN3QTGz4UeuDSD/g4PVEnm/y5wzDgoZZMPKpGyn
         SISqNuAs9Cfb1uNgLs+IgbxtxRnCxSE53IX7DkCZl4AT79b1SDkMG2HJshqmTiNAl+wl
         7Mfg==
X-Forwarded-Encrypted: i=1; AJvYcCUH007AWN38mRz5rjYhTQjTpoSaymb6LhvGqAYFr2taDsf5BRuu7bKPwwjioiiLe/ggBj9mO/gSrpbR5w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwWTDE4QFINwKQyona9yzf1JWtNvwXglpp6BpYusKrvCJvDR3uK
	vfrEkbzp0of6oJfZb9tlfMRUC0wHZfQWkrdXklHaXUnCCz4dTkrE3hbnfIsmf4tmA0I=
X-Gm-Gg: ASbGncvZTYSnP2ZaCkjy49+lJS9cmZLAym0wI6ZFVqSZ6jzDwCbPi+dFNIF3DxaOGzB
	mBbXuWhBRB0bF5vYiwEP6GO8RlyQaIf+Tm6gabnV7YZ9aOIURVjOX1e8MQDUCT0ysLEI5WCKoDK
	SF5jjSqdvgrIhEJ+Fs4zEEPVo1/Lc81r0/mokwXU3L43UROXN3HvqSpeENx0Xdz04n/3pllMPoz
	obJ2cuZIRRUg9WtAjXSJQZYdxIWiaTD3GQbAfJA1KlatelAfKTPBUC8apqqwEodalROfDyp4GBT
	FaL7jKGRoN/bvXiI34gGb7WHczyjHuVKVGgl2GzCRTvrgGOjQRvWZF5By2R2pa2SDnq4/8Nskgb
	+m+biHdONKj5cV5myZgis9yoedwQvUsxydPSgoqs1SD02477AP0yJjeGKC3sQP5wsQq8odi41iu
	ZhtlM/gsrz43dsisJ4
X-Google-Smtp-Source: AGHT+IHno87PGRHfIe/4sYG48mSDNVPM2G0IVfwWSmkQa5Io8uxPrbllpYQCUBUanWZMFS1pdWGK8Q==
X-Received: by 2002:a05:6e02:148c:b0:424:80c5:87a with SMTP id e9e14a558f8ab-42481984015mr1925725ab.19.1758212544749;
        Thu, 18 Sep 2025 09:22:24 -0700 (PDT)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-53d3e3373f6sm1110059173.29.2025.09.18.09.22.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 09:22:24 -0700 (PDT)
Message-ID: <c32cc8da-6703-496f-b30f-4961aa811869@riscstar.com>
Date: Thu, 18 Sep 2025 11:22:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: define a SPI controller node
To: Yao Zi <ziyao@disroot.org>, Yixun Lan <dlan@gentoo.org>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, p.zabel@pengutronix.de, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250917220724.288127-1-elder@riscstar.com>
 <20250917220724.288127-4-elder@riscstar.com>
 <20250918133209-GYB1273705@gentoo.org> <aMwYRGjTdbQCJf3S@pie>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aMwYRGjTdbQCJf3S@pie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_092225_902240_095E55EB 
X-CRM114-Status: UNSURE (   9.21  )
X-CRM114-Notice: Please train this message.
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

On 9/18/25 9:33 AM, Yao Zi wrote:
>> .. em, so the SPI will use pdma, then probably you should also adjust Kconfig to
>> select PDMA driver?
> The driver seems to depend on the generic DMA engine API only, IOW,
> theoretically it should work with other DMA controller as well. And it's
> even capable to operate without DMA (see k1_spi_dma_setup()).
> 
> Dependency to PDMA really doesn't seem something should be enforced in
> Kconfig: it doesn't exist in code level, and the driver is actually more
> flexible.

You're right on both points.  The code doesn't *require* PDMA to
operate correctly (to my knowledge).

Yixun, what do you think?

					-Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
