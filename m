Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2888FC77B7C
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 16:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gpA4RW35ykdI2BHEGE582HWFiMnyLu3hKBA4Uej0KhI=; b=srv1Bve+MBQJax
	FKBCImVa9mFuTlyLKXTsB/yAhi3t71sI0zJFjTM0VOQyBAhpwVy7CM40tRJX/IcCW1YpjO1z88y60
	sOG9A51PAbedpma546aAOcwI35aKMOBC2EtKkcN35xOfwIQwPhQVi2158LEtSqfFEPibQdU/oKzT5
	u5Uu2Eh//TxFgZDZFynGK3153QJ/Syp6qG9uQVznxX5/XHsNk5lm/5ZO+Ig2+2lWI6NL7mNDSiQoM
	nvNKOOYyEzHHoPW9QXy38BkWmlecsB791cRGqI/h3f3US092yKT7mGNuBgEGcK7QZeMP2/PKlnPx2
	icYAiHxhFyS6d2RBl2Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px9Jp-009O01-30;
	Thu, 11 May 2023 16:39:05 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px9Jm-009Nyh-2O;
	Thu, 11 May 2023 16:39:03 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-50b383222f7so13194319a12.3;
        Thu, 11 May 2023 09:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683823141; x=1686415141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wa3SOvISZGaKHOA8+TPFpP/9VnubTDpNEPMLKFetZ+8=;
        b=K8TNyHobvnQWygzUwnU3H8Zqy+ySP0IfO9S2cuZ+akESC67EELHYE+Q5xiI8i6m+RT
         znFamR1F1Ylt3QWPBLwrZ7XCQzoOhzTOUZ3zKhE+zuoH5XoVG59E9Z5XuuxN+U52Wj2Q
         lavQ5Ycrjk2ECWezh08gdoDrnPOgFnXitYwZC+UBRhsxRMnjwJV6qkg2ePCgmg0zuZSp
         JbA7jsqLwva/hzFGFu2Sv1w5USSD/WBEOJSjIySsHEdShB0Qr/EgdWtPREoGrBcwM18W
         3BS9NiTSizMZJg9F3yFtRmmEzUg+zLr/+0uH4M6rcxrMVJvPGQxyqhE7ZX9FDfHOGJw2
         2ZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683823141; x=1686415141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wa3SOvISZGaKHOA8+TPFpP/9VnubTDpNEPMLKFetZ+8=;
        b=RPIgsTa1BirdiEok5XQ91a+FC4kivnSIu7ueRDYNj59gUUXnhmTDRfmWSHGHovRzmM
         ewMRZJv9321YVm3Yc4ICZuGX12UDgCO0x3b/MGg6Ez7l/TocaxOF0hudodoazWyERcHH
         wSKKaey+TdZO0u4dI/ITP7RCBFTVY2SrqZUCHjQ1GYKL79zQJF1NBNZGe6qHy2lpuLix
         SmJ2clCEuejBO6kUHACbtwk0aJu/WLx3vtBv2Nf5gX9peF31ezBVivUPtGKsrDx9HgbN
         4YkKzNpVx+fUqAw/p0VeNCaYedjZXSglbxue/Gx9QCoxYr6JC3feJxKvKkxuHHuZ6aHV
         r6nA==
X-Gm-Message-State: AC+VfDwQLaFGerhKy3RNzmPRAAy9dl+RzWYlvEqabwplxsW6VYcfwT5a
	fcFB5MD9/YoiT8FIPXmHBdU=
X-Google-Smtp-Source: ACHHUZ6FTNvxZ52Lw7NBAuRpzL4lNKYkUViPH7hIkSsrbZqqnREejzk9ADHcMFBkgEvRr4ylKMP7ZQ==
X-Received: by 2002:a17:907:98d:b0:96a:37af:ff37 with SMTP id bf13-20020a170907098d00b0096a37afff37mr4554954ejc.15.1683823140726;
        Thu, 11 May 2023 09:39:00 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id p8-20020a170906a00800b009658264076asm4198381ejy.45.2023.05.11.09.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 09:39:00 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
 Maksim Kiselev <bigunclemax@gmail.com>
Cc: Icenowy Zheng <icenowy@aosc.io>, Maksim Kiselev <bigunclemax@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Maxime Ripard <mripard@kernel.org>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject:  Re: [PATCH v5 3/5] spi: sun6i: add quirk for in-controller clock divider
Date: Thu, 11 May 2023 18:38:58 +0200
Message-ID: <23071886.6Emhk5qWAg@jernej-laptop>
In-Reply-To: <20230510081121.3463710-4-bigunclemax@gmail.com>
References:  <20230510081121.3463710-1-bigunclemax@gmail.com>
 <20230510081121.3463710-4-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_093902_776178_4EC7CEAB 
X-CRM114-Status: GOOD (  10.06  )
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

Dne sreda, 10. maj 2023 ob 10:11:10 CEST je Maksim Kiselev napisal(a):
> Previously SPI controllers in Allwinner SoCs has a clock divider inside.
> However now the clock divider is removed and to set the transfer clock
> rate it's only needed to set the SPI module clock to the target value
> and configure a proper work mode.
> 
> According to the datasheet there are three work modes:
> | SPI Sample Mode         | SDM(bit13) | SDC(bit11) | Run Clock |
> |
> |-------------------------|------------|------------|-----------|
> |
> | normal sample           |      1     |      0     | <= 24 MHz |
> | delay half cycle sample |      0     |      0     | <= 40 MHz |
> | delay one cycle sample  |      0     |      1     | >= 80 MHz |
> 
> Add a quirk for this kind of SPI controllers.
> 
> Co-developed-by: Icenowy Zheng <icenowy@aosc.io>
> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
