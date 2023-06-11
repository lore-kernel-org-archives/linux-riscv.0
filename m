Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D131AC7EE45
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Jun 2023 08:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bd6b9MjTJGRH6dQNEpTwLD44RBLH7QQ6c2MOzGuRACY=; b=OKt0QHUdyQeSGC
	pdUVIoD6spfviqKImeQfWsIWXB0bzeBWNxZ9ZS4+xw4xv5jYkeqMMJgh1oCi13Ye5JGIJDQqjgAJW
	auznUDJFShTiTouTuNO/StmFsV3GhFa/MdZAN3fEKch8tyc6hPb+OTy77TU3goeUsPRPXnuKeD4OM
	YdCSGKezhcF2rNwfau1OdoRx+8uh/jfhWFdZMwGod83g3D2Ru2gvRoXMMVr6zxaamLbI243JV74ii
	yb8pIeXxlZH+uhLL30rt9pT7nlHLhCJbCCDDm5L01pdseo32GQGuvhNSVtw8H+slSkeS6r3ukLJiX
	EBKHEKCcYOv9XsAgYxXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8G1g-000J5T-2R;
	Sun, 11 Jun 2023 08:02:16 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8G1d-000J3y-0g;
	Sun, 11 Jun 2023 08:02:14 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-977d0288fd2so550567666b.1;
        Sun, 11 Jun 2023 01:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686470529; x=1689062529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKObufiJaJTeq7fGpjaIRGbwXaTH9GVmjYgQdGAz6pk=;
        b=QOMnm1A0pEkSVJI0SrtwyUDPwz/GuPP+G3hnOTHQpF3CuucjlNN/HqGM7Flr1GpDBX
         4okirRSt4FqCzNBTHdy2/0tDoIwQ8sLKg9M01pq6T2Wd4IEmdtqyGDRqPEImct/mSd8j
         2jRPLNfsdsCi/0NubYx18UwVtNsZKMHSi29Puw6Prf7CyiWaH7W5pEJtShO3L4LAZXyk
         dbgEhwlJaIRWKC+V5G/HPnCH8httnbg6sbV6rYmUWk1hxLlYJp2nker1CX+cYbe+sndZ
         K18KKX4tax+gNolkhAYjqv8f39hXLeRW/bYfY8eSaoQbWTHOH28tbXCwacUQ7BiYOBrF
         nHBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686470529; x=1689062529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oKObufiJaJTeq7fGpjaIRGbwXaTH9GVmjYgQdGAz6pk=;
        b=Y7BqDjFqMxdpiMXUJlBBHFMuUvXre+5aJFZUasLxWIgor98n8bsg3d/ZIeHj5/UO9d
         rwWF2MmLL1u7j/4Y1bklgwZFXncOCvAkJdDbIGiVASeMKl1DwjQ/v+0o++Zu4AAmbxO0
         hNrg80adYcvyj0cyxlvi/jD/pmEwgoGJUG6/5cbpPNZrCF10Zi4tAjVpK90E/Fi4eFlV
         KNCq1c5btETcJcb0Cma7U52AipFYmJvFTxm9A/JsxzgSU0gFSdeJNzkX6CNHO6ovA6O5
         Q3OyZzj2IZ7EDQJnPkszpmC3uqcYssXcMu9Mxr1FFjG84RCIfSBGLlMmTl0X/h0lQ+t8
         /cpw==
X-Gm-Message-State: AC+VfDzQLWfsjwcXUzAOREuBc/X2lTP5gWvh9eYC+bcaJnizl8M2vNVZ
	0UYvIXh005iWbZ4L2p9LZIer13vGiHDUclYIc0Y=
X-Google-Smtp-Source: ACHHUZ6NjQzgb76bcbhBYj8nK9a65jeRLHSFzppdF5FKxr8dY54Z+i7w+9LyA079iQisCTQ2sCwWWevYb7QwyN5bDhA=
X-Received: by 2002:a17:907:7244:b0:974:55a2:cb0b with SMTP id
 ds4-20020a170907724400b0097455a2cb0bmr6593282ejc.55.1686470528985; Sun, 11
 Jun 2023 01:02:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230610202005.1118049-1-bigunclemax@gmail.com>
 <20230610202005.1118049-3-bigunclemax@gmail.com> <20230610-thinner-sector-795141d97f40@spud>
In-Reply-To: <20230610-thinner-sector-795141d97f40@spud>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Sun, 11 Jun 2023 11:01:56 +0300
Message-ID: <CALHCpMhnVOt_H0VXNcbrt+53SkWsR6ZMNsmWyGw47JGUgePKzg@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] dt-bindings: iio: adc: Add Allwinner
 D1/T113s/R329/T507 SoCs GPADC
To: Conor Dooley <conor@kernel.org>
Cc: linux-iio@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Cosmin Tanislav <demonsingur@gmail.com>, 
	Hugo Villeneuve <hvilleneuve@dimonoff.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, ChiaEn Wu <chiaen_wu@richtek.com>, 
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>, ChiYuan Huang <cy_huang@richtek.com>, 
	Ramona Bolboaca <ramona.bolboaca@analog.com>, 
	William Breathitt Gray <william.gray@linaro.org>, =?UTF-8?Q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>, 
	Caleb Connolly <caleb.connolly@linaro.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230611_010213_274212_007520B1 
X-CRM114-Status: UNSURE (   6.71  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

0LLRgSwgMTEg0LjRjtC9LiAyMDIz4oCv0LMuINCyIDAxOjE3LCBDb25vciBEb29sZXkgPGNvbm9y
QGtlcm5lbC5vcmc+OgoKLi4uCgo+IGJ0dywgZG8geW91IGludGVuZCBjb21pbmcgYWxvbmcgbGF0
ZXIgYW5kIGFkZGluZyBzb21lIG9mIHRoZSBvdGhlciBvbmVzLAo+IG9yIGRvIHlvdSBvbmx5IGhh
dmUgdGhlIGQxIHlvdXJzZWxmPwoKQXQgdGhlIG1vbWVudCBJIGhhdmUgb25seSB0aGUgVDExM3Ms
IHdoaWNoIHNoYXJlcyBtb3N0IG9mIHRoZSBwZXJpcGhlcnkgYW5kLAphY2NvcmRpbmdseSwgZGV2
aWNldHJlZSB3aXRoIHRoZSBEMS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
