Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5541C7EE24
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 08:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Eoe6+hslThD0eSnFyTlifjDn4CV71rYytm9iKW+rdyk=; b=VgtmbpKv33c2Lw
	aGekc5Z09XLP6QuUa++/YS8tLUOx4g5eXG3jM7OF5v1ascMWTZi3IIvPgES+ebJCOfrGIWx0TlkwA
	lx79aFKLQGQYoNjV+ly7Pt+mBI3QY2BkGmyED9ccfk1CxJ8d4IutrElhkSvHnryRGkLxmNxpKycnh
	ycCuxyZCSrNANcpNS/j6vJLghUlZjhQNr/C49fij6ugUsABLbWd8Kyo5Ypmh44TQdX9Rf/DjVFtXF
	puTN85QecsuB5NMYciT19ox5cRI022dJo9c/O5oXY0CsEAScUnVpdkBqX0Ne6sMy6SvjH2n4iryVN
	irbkKMMHPxXmqwHppjPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwevD-005TjB-0D;
	Wed, 10 May 2023 08:11:39 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwev9-005TiA-2A;
	Wed, 10 May 2023 08:11:36 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3f450815d0bso7349335e9.0;
        Wed, 10 May 2023 01:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683706293; x=1686298293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kaQpRP2PJulxYaO5bFooRdj1QYIO1irnm40lBiyMQfA=;
        b=sGsXHOCDB1/G09BwgMcl3P9fyGYxgKy3Lg32VYzLCmWTMGjuN0Og+jZ0pYkjWmJ+5g
         Zne7CNel0vAodrw5NQr0bOgH68uTNzlfPNUgOZih9LMJX34lTXhuUPDGfgqtgSPuZorD
         V5zDRnIsfctWawQ3dOXE/g5ejxcI6zl/SJ4lDMuFRKal66KSfKiuSpbsz5O/jm8G2AiT
         W0IKm5IiAosack2KCtEDLu4JqSlUXwA83mrxWFPMLAczYSXHSov4urgeJwcOT57yeSpM
         K1N5nEUZrTC25G/ngzvFsXq5BWuj820aa+EmvpGlp//SWdi2RunF+IErZPV9Y51Z5ml0
         7Ceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683706293; x=1686298293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kaQpRP2PJulxYaO5bFooRdj1QYIO1irnm40lBiyMQfA=;
        b=R1/ZARCwnKv3/rsqh3POPsuCeJM47WTiRwev5HEx9U+sl4VunACIgxPrA0eVBDRMsH
         IcT5jlKR+6xoxDOWF5p79IXthYVXUn7kFlLQGffQrYl5M7ZTwznCxJHQb5RdaWR1rDrq
         0gVO4HC2txS9HRY6Uhc3gYRZadRrPB1OSVDlHOqDo7pTdBli6acodjlnX70kzhGg/ajY
         SvyeInnpQjRGWpNQtxHQrt1lI0O00CtkoAHpBLLe2XMTldcOve0y/dm1bUwlYynoRFqX
         h4IuoYXCxM2uxaLhuAiOoIOpNYYTGVbZ0wAlwl0+Z9qtAPbgI2APFJuZZg8H3jzKjKLn
         ZliA==
X-Gm-Message-State: AC+VfDwXAkIISyYx0wZPtc4jpDTJt0D0kP2TVrFw+qqqcTfEOi3NL/oB
	PlAz3/mD5F4EF3QH6PJZ/kY=
X-Google-Smtp-Source: ACHHUZ6nA8An0kWETX3sBghZaBOHEHWZkW9kJemfajv/KifLNkZtMoHeOoheAEpkUZYo+RyRDOmVEQ==
X-Received: by 2002:a7b:c356:0:b0:3f0:3c2:3fa4 with SMTP id l22-20020a7bc356000000b003f003c23fa4mr11776779wmj.12.1683706292779;
        Wed, 10 May 2023 01:11:32 -0700 (PDT)
Received: from localhost.localdomain ([176.221.215.212])
        by smtp.gmail.com with ESMTPSA id f16-20020a5d4dd0000000b003062ad45243sm16496375wru.14.2023.05.10.01.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 01:11:32 -0700 (PDT)
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
Subject: [PATCH v5 0/5] Allwinner R329/D1/R528/T113s SPI support
Date: Wed, 10 May 2023 11:11:07 +0300
Message-Id: <20230510081121.3463710-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_011135_749999_EF03CF29 
X-CRM114-Status: UNSURE (   9.04  )
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

v5:
  - fixed DT bindings (Allowed three-string compatibility)

v4:
  - fixed SPI sample mode configuration
  - sorted DT bindings list

v3:
  - fixed effective_speed_hz setup and added SPI sample mode configuration
  - merged DT bindings for R329 and D1 SPI controllers
  - added SPI_DBI node to sunxi-d1s-t113.dtsi

v2:
  - added DT bindings and node for D1/T113s

Icenowy Zheng (1):
  spi: sun6i: change OF match data to a struct

Icenowy Zheng (1):
  spi: sun6i: change OF match data to a struct

Maksim Kiselev (4):
  dt-bindings: spi: sun6i: add DT bindings for Allwinner
    R329/D1/R528/T113s SPI
  spi: sun6i: add quirk for in-controller clock divider
  spi: sun6i: add support for R329/D1/R528/T113s SPI controllers
  riscv: dts: allwinner: d1: Add SPI controllers node

 .../bindings/spi/allwinner,sun6i-a31-spi.yaml |  10 ++
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  37 +++++
 drivers/spi/spi-sun6i.c                       | 131 ++++++++++++------
 3 files changed, 138 insertions(+), 40 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
