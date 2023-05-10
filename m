Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3734C77B7D
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 21:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XpnwjIPTKzC5uqYZAXE9DI3QvVsSfTsnONLoLC2u4EA=; b=CUaVKJPwXMn7sv
	US+3GzTQxUicQChadeI93YFtv9pmbTF5lhJ55tjQgLZ5Moao/TbUAn+naZCkGBJ+GLolfOeJSrrWh
	ZWuIjfV0WxL/P5tZ3S20zJJxlr7Jg8i542ApzNmITpzP4jFJxCDgilZQeqnt2A+xzQtrbF8FkaJjm
	htBQw/L3tdQAqp/TblJugDJaHv7Xy/1uRaXsWsactSRfuAlgGNSkq+9+PospPxFz0OoXF7nF5C+rj
	0esnHtaJ9ZdB0mNGhSkHjLhWStn9MtVvrBYoDXg7tMGuX3lPtBjNVrf7Hthv5McFP4hOz5+8oimKq
	+WP12xtHwNXpt8iyhP0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwr0E-0071J3-1Y;
	Wed, 10 May 2023 21:05:38 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwr0B-0071IH-1o;
	Wed, 10 May 2023 21:05:36 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-96598a7c5e0so1244107266b.3;
        Wed, 10 May 2023 14:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683752733; x=1686344733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nFI/AGkZEYwWG8fSHOsXcamR405M2Qv38gjoGfCKNeM=;
        b=ovchRibZYAQviLH9dX5jb99BxG+AS7aDTIwBB7C8HLtQorCHH4eNTbtCDLiS0fj3nB
         dR3Pyxh+jKBgm+/Wri7zEvpNZvjdNLI44jE3hjiTVVTh6odErkG0Ns+BUsa3/3UDeyra
         0BivPjhBTIcC8wSIiJtStqh0XU/kFmBRiD0bq+gyicLBq46gtZZlEaxBhK+NZaciPJ9Q
         iEEk9WgZY8MiVNzvu/lNc435FXTzL7rreouRg10OjZpVt0uGrwYUvTeQPMMdslu+1QX0
         ExDrE1yhfPZD5hPkI4oKo1gWQM43H+/lf08JlqKqmn30SXPvwA7SR0Y1kLCJyfuvDgGG
         wqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683752733; x=1686344733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nFI/AGkZEYwWG8fSHOsXcamR405M2Qv38gjoGfCKNeM=;
        b=X5HC/qMGoyod/ND8SCGSxBM4oaN4SSOjo1eB9l06wsd3O34HHJfFGcse1jbpLKG9+K
         9a8KsFmbV9jyXFXBoeG4ehYO2/1w45Uymkj+ieorlUyzKfuJxynKv4RgIaerjlrB3eOH
         dj/lT3Ut0B8stPtvRLDUDuJAOeDWemm3rErvRTmswmUz+l/rds0eTkPeGnBMCO+tyr6S
         NJaW4E0NEhQr9pGBCq3AscbclysfvytJKLEENmWnKMK61qjuPIXq5n+MxKBZMGRr20me
         kYgX7xJ5c3GMTx1k+PIr+5Cqt5x7xKBZ3HGsm9qitpsD+X9Y3FfTvDFTEyIaWPJY4TJ9
         0O8w==
X-Gm-Message-State: AC+VfDwxZWTmhMhW/dF6+A+x6tT3ywHa4YJl+qi7nLK5kFqRYbJtJZVL
	xxaKvs60im24oSo6VNpJLFrYBWcG8X5hpHWY
X-Google-Smtp-Source: ACHHUZ61hk+OAcODH4eeT51yIZ3XxxsSviX9vqg5Cf3X9lqBzmuOBS43oBR6cQfmDcqe2MzRJXJCuw==
X-Received: by 2002:a17:907:26c2:b0:94f:788:6bc with SMTP id bp2-20020a17090726c200b0094f078806bcmr18796096ejc.37.1683752733238;
        Wed, 10 May 2023 14:05:33 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id n25-20020a056402061900b0050a276e7ba8sm2329786edv.36.2023.05.10.14.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 14:05:32 -0700 (PDT)
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
Subject:  Re: [PATCH v5 4/5] spi: sun6i: add support for R329/D1/R528/T113s SPI
 controllers
Date: Wed, 10 May 2023 23:05:31 +0200
Message-ID: <3739192.kQq0lBPeGt@jernej-laptop>
In-Reply-To: <20230510081121.3463710-5-bigunclemax@gmail.com>
References:  <20230510081121.3463710-1-bigunclemax@gmail.com>
 <20230510081121.3463710-5-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_140535_596509_213A7A98 
X-CRM114-Status: GOOD (  11.61  )
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

Dne sreda, 10. maj 2023 ob 10:11:11 CEST je Maksim Kiselev napisal(a):
> These SoCs has two SPI controllers. One of it is quite similar to previous
> ones, but with internal clock divider removed; the other added MIPI DBI
> Type-C offload based on the first one.
> 
> Add basical support for these controllers. As we're not going to
> support the DBI functionality now, just implement the two kinds of
> controllers as the same.
> 
> Co-developed-by: Icenowy Zheng <icenowy@aosc.io>
> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
