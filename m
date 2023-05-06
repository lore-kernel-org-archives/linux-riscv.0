Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D43EC77B75
	for <linux-riscv@archiver.kernel.org>; Sat,  6 May 2023 23:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cgaq+Pc0Rt+vxpbxkV7d2WCXkydYst67Ex+aI0ijxIc=; b=J66ofREyh3WcDj
	cmq1T9BuNDHi8aSeb/OQ/WcRS6olVTpVfS7EFeS0jhDOekUNZtWXGYl8XWBS6uL5t5n1jJJq9yevg
	97e/4PT1uMRUv1OFjm3QItSqAfKdvsP7nwygtdbyzeoi7eZbarxs6rEUb6cHuE/st3V9vHNUMNtaf
	HKeQu3jQdyxHu+YcBQhOzBk7jSfPb9COA47L2WYKHBvG6/qSyRBDjqXygSKcMoaoQDDxC7elbTNtz
	Mu513aPweaN88p8jAy7wMOOtWcZOCTg6UYfFfenTT04zeJarT3EanyCb+A8RArlzZ+VWX11NPXIrN
	7ZBBtt2t+OBCFxXamkjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvRIx-00EaHu-1l;
	Sat, 06 May 2023 23:27:07 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvRIt-00EaH3-1t;
	Sat, 06 May 2023 23:27:04 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3078d1c8828so434977f8f.3;
        Sat, 06 May 2023 16:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683415621; x=1686007621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y2FeWgpYGVgw05x9NXcehpvxe6YOrGKp5PKb2y+cAxE=;
        b=aclnyCppp/OmsCpCe1DSKh3rn0yYLZ2xnsF55M4+R7iOOYjFgjr53u1m2Z9zIrGbzX
         NlAByOYA2QZ9Jmsqw7IgqtddayGPyJCz6vv9QczyU1B/WEl7NJ+VPYK1yV6h5xgq1SCM
         kHozxKV8JynSHihZodBoR5voiy2okjHCZu6s6/H3QSag40kw+gCfD71GUuAr/pusuYtY
         yVJgaKWGyrKKjG7wiSbQr3z6yjvErhE5veGYqSQ8m05r0xpBjBupIIZjPcn/OzF+I1NQ
         iUhN7u+g2qiSZUfRcvzh31anBjVA2xOcsFp3bmJw/OIQ16IBHFZn+z6tTiK/OG0bNKIp
         3Kjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683415621; x=1686007621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y2FeWgpYGVgw05x9NXcehpvxe6YOrGKp5PKb2y+cAxE=;
        b=bTa757jELLh4wyCB5LwNllisJWJbtv/T9qKrNCDNErtqOeQgBEFch5AA4JwneMQ0PT
         30viHHNYzeWPnPMLsrUwl99hg6eoMzIBnLI7SCkxEvgLAp+iffSB+V3kFdIHdLLPTcjZ
         BcCqr8sZR5uZJRFQfDL1/O4YNpl0FYpNlCo9m6bFsBP17NfXVmN28EAfDbULlz4G8Dxg
         sAqiGFT9jkuLauUXI+rY2Kse5kO2U9sv57+jiX1CNXbiptliUU6bivtQiZ6ZLwOwDNpA
         DPjclrfA7vPE+9nOV9zjlYGlNFB22akQsZ4XsT+EDaIBNUwFMefh766I5SoOn+0nBG08
         1YdQ==
X-Gm-Message-State: AC+VfDxW5JUROpT3CHD7vFEqjaqGbIcmxIKsTbBQBicZOT811xzC9yeU
	1CHXdBgBbUO8l6O1Qx/FzxA=
X-Google-Smtp-Source: ACHHUZ6aXW+eEEp0ETGPH/k3zEH3JlzcT1+1ZrNspVjJp7yeJW1KVWql3w4Lr8zfryZlzHKsOOYuUg==
X-Received: by 2002:adf:fccb:0:b0:306:3899:ccbf with SMTP id f11-20020adffccb000000b003063899ccbfmr4455889wrs.14.1683415620621;
        Sat, 06 May 2023 16:27:00 -0700 (PDT)
Received: from localhost.localdomain ([176.221.215.212])
        by smtp.gmail.com with ESMTPSA id p4-20020a1c7404000000b003f1739a0116sm12098655wmc.33.2023.05.06.16.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 May 2023 16:27:00 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Icenowy Zheng <icenowy@aosc.io>,
	Maksim Kiselev <bigunclemax@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Maxime Ripard <mripard@kernel.org>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 0/5] Allwinner R329/D1/R528/T113s SPI support
Date: Sun,  7 May 2023 02:26:03 +0300
Message-Id: <20230506232616.1792109-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230506_162703_650482_4A0775C0 
X-CRM114-Status: UNSURE (   9.62  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series is attempt to revive previous work to add support for SPI
controller which is used in newest Allwinner's SOCs R329/D1/R528/T113s
https://lore.kernel.org/lkml/BYAPR20MB2472E8B10BFEF75E7950BBC0BCF79@BYAPR20MB2472.namprd20.prod.outlook.com/

v3:
  - fixed effective_speed_hz setup and added SPI sample mode configuration
  - merged DT bindings for R329 and D1 SPI controllers
  - added SPI_DBI node to sunxi-d1s-t113.dtsi

v2:
  - added DT bindings and node for D1/T113s

Icenowy Zheng (1):
  spi: sun6i: change OF match data to a struct

Maksim Kiselev (4):
  dt-bindings: spi: sun6i: add DT bindings for Allwinner
    R329/D1/R528/T113s SPI
  spi: sun6i: add quirk for in-controller clock divider
  spi: sun6i: add support for R329/D1/R528/T113s SPI controllers
  riscv: dts: allwinner: d1: Add SPI controllers node

 .../bindings/spi/allwinner,sun6i-a31-spi.yaml |   7 +
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  37 +++++
 drivers/spi/spi-sun6i.c                       | 132 ++++++++++++------
 3 files changed, 136 insertions(+), 40 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
