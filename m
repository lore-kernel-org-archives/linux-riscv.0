Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C213ECCA48B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jun 2022 18:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fChV6BerMqehSqCgDcdICOJYTOtA51e6ViX4cPpEynk=; b=z2C16Opmt5qmMG
	o7MccYDeKTEBTe64dOtwRxgZyY1LyPlG5B3U/mjJAKNf802DiNB5wJQESOfZN4Pwi+fi1Odlyp5XV
	Qhh0N5ABJ2NbI6mksqcCe8R91nqB2CqHydT3+ZlHnfQ/ooF1I/17YT7jv12XI2E4csMiYPulJUYax
	5rY+J5w01OFhhWpzom0gq5rSqnCCfQ1WHa6tcEIg+xgmWQOyxqZSI742z1qgj3zCbvLueHikWUlef
	TOfDmhdUEl0Gl6MjzzA3PZLHPGK5s3SgfUmQ7Dvr33Dn+FpfNdjmDRjr04TnVBCksYxQBG5PYrKB1
	bLpvzR2rg3i2GynyGYiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6cg6-00DaAG-Aq; Wed, 29 Jun 2022 18:44:42 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6cg3-00Da6e-21
	for linux-riscv@lists.infradead.org; Wed, 29 Jun 2022 18:44:40 +0000
Received: by mail-wm1-x336.google.com with SMTP id u12-20020a05600c210c00b003a02b16d2b8so179945wml.2
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jun 2022 11:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ujlFidKBYN3+gnt+1Wkvol7kmUwt+TJSsn/V9xvehgY=;
        b=FOsaCOs4FhntcBVLVzvRAs2gDZxoyx3YHWEOhRh45yswt/+jKUwE/J0wNxaZ37V6Uc
         zuxSruVBSYWJDtgARcDoe5RocT823Ey0njk5JlleU3d0qYwcgqh6fodDsvAnnvbvV7Rm
         PY3MlPeU1iH3j3/ZPjhi8DaO/OfWsUbzBea7z+PFQC921e9IBleQBh66fo7u2hKhyarj
         5uvUGrXTVCRqFYQUTptcKkWgRxYwWQNU4qoXt5ehOXJMh8e1gGppyJaQ2eRKydUR+3Ht
         l5p4BtxvL9zi+7zSv32N5RRgYtbMdTeb2fbubnUmSY4CPVXLHJ7NbZqjxV/soVbvVz+r
         yCJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ujlFidKBYN3+gnt+1Wkvol7kmUwt+TJSsn/V9xvehgY=;
        b=GPxUTXIfdJKQii5Cv997BNbbyjynwGsyOb9QP3l81Fw65QmNk255qCCo2Z/GVynCk6
         Y0HBCpmTQwWXGL4nJrThr/vJVfcsZmVYgrytEU3ctHk7SqiWr6yq3BH+tnoJxIDUEd6K
         OCqenPoLtseBf+0FM0EsKCWyN/Csm6ZHvMnQ3sZzOgPjZP/L+bUWkas4Oj6R1rM//exc
         RymALPObnY+fFTgyCfro5gtRDn4UOqLkv8yYe90d2BAejsGIaVkL/LAB2FtrNg2CnSsc
         ODlpiBJtkcQEdSXXAp4MB0vPe9A3IIxqKMOdTe3Fa0TyVYUaYYgNskjxAg90cF+XDMJZ
         NSFw==
X-Gm-Message-State: AJIora/tKunGp7mdy4SHR6uDrEiv4UETa7KMHi4pmIo0NKDyWEhJpROb
	H3Fjuypo5eJCPqEeMcSoaatHaw==
X-Google-Smtp-Source: AGRyM1vkI72xwUrVzdm01K07LqtX2m50dz3LRYbM6zcBvoybVSkmTwAhtiBUgec39zvaIkLF0EZJrg==
X-Received: by 2002:a05:600c:3516:b0:39c:8091:31b6 with SMTP id h22-20020a05600c351600b0039c809131b6mr7587210wmq.164.1656528276189;
        Wed, 29 Jun 2022 11:44:36 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id u23-20020a7bcb17000000b0039aef592ca0sm3834371wmj.35.2022.06.29.11.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 11:44:35 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Dillon Min <dillon.minfei@gmail.com>,
	Jose Abreu <joabreu@synopsys.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-spi@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 00/15] Canaan devicetree fixes
Date: Wed, 29 Jun 2022 19:43:29 +0100
Message-Id: <20220629184343.3438856-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_114439_174843_8DBDCB14 
X-CRM114-Status: GOOD (  16.57  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Hey all,
This series should rid us of dtbs_check errors for the RISC-V Canaan k210
based boards. To make keeping it that way a little easier, I changed the
Canaan devicetree Makefile so that it would build all of the devicetrees
in the directory if SOC_CANAAN.

I *DO NOT* have any Canaan hardware so I have not tested any of this in
action. Since I sent v1, I tried to buy some since it's cheap - but could
out of the limited stockists none seemed to want to deliver to Ireland :(
I based the series on next-20220617.

Thanks,
Conor.

Changes since v2:
- i2s: added clocks maxItems
- dma: unconditionally extended the interrupts & dropped canaan
  compatible
- timer: as per Sergey, split the timer dts nodes in 2 & drop the
  binding patch
- ili9341: add a canaan specific compatible to the binding and dts

Changes since v1:
- I added a new dt node & compatible for the SRAM memory controller due
  Damien's wish to preserve the inter-op with U-Boot.
- The dw-apb-ssi binding now uses the default rx/tx widths
- A new patch fixes bus {ranges,reg} warnings
- Rearranged the patches in a slightly more logical order

Conor Dooley (15):
  dt-bindings: display: convert ilitek,ili9341.txt to dt-schema
  dt-bindings: display: ili9341: document canaan kd233's lcd
  ASoC: dt-bindings: convert designware-i2s to dt-schema
  spi: dt-bindings: dw-apb-ssi: update spi-{r,t}x-bus-width
  dt-bindings: dma: dw-axi-dmac: extend the number of interrupts
  dt-bindings: memory-controllers: add canaan k210 sram controller
  riscv: dts: canaan: fix the k210's memory node
  riscv: dts: canaan: fix the k210's timer nodes
  riscv: dts: canaan: fix mmc node names
  riscv: dts: canaan: fix kd233 display spi frequency
  riscv: dts: canaan: use custom compatible for k210 i2s
  riscv: dts: canaan: remove spi-max-frequency from controllers
  riscv: dts: canaan: fix bus {ranges,reg} warnings
  riscv: dts: canaan: add specific compatible for kd233's LCD
  riscv: dts: canaan: build all devicetress if SOC_CANAAN

 .../bindings/display/ilitek,ili9341.txt       | 27 ------
 .../display/panel/ilitek,ili9341.yaml         | 49 +++++++---
 .../bindings/dma/snps,dw-axi-dmac.yaml        |  4 +-
 .../memory-controllers/canaan,k210-sram.yaml  | 52 ++++++++++
 .../bindings/sound/designware-i2s.txt         | 35 -------
 .../bindings/sound/snps,designware-i2s.yaml   | 94 +++++++++++++++++++
 .../bindings/spi/snps,dw-apb-ssi.yaml         |  6 --
 arch/riscv/boot/dts/canaan/Makefile           | 10 +-
 arch/riscv/boot/dts/canaan/canaan_kd233.dts   |  6 +-
 arch/riscv/boot/dts/canaan/k210.dtsi          | 76 ++++++++++-----
 .../riscv/boot/dts/canaan/sipeed_maix_bit.dts |  2 +-
 .../boot/dts/canaan/sipeed_maix_dock.dts      |  2 +-
 arch/riscv/boot/dts/canaan/sipeed_maix_go.dts |  2 +-
 .../boot/dts/canaan/sipeed_maixduino.dts      |  2 +-
 14 files changed, 253 insertions(+), 114 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/ilitek,ili9341.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/designware-i2s.txt
 create mode 100644 Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml


base-commit: 07dc787be2316e243a16a33d0a9b734cd9365bd3
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
