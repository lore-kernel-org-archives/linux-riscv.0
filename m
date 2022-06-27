Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D7AC43334
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 19:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/KcHvGdDB3UA0poPEB0DurKXN0DuB8bWE6O2slS4Yx0=; b=mZxouhBdpbAp8R
	eSMUjj5ZImbitJZY81fslchpJCNHFr+Tpw4346eSlC0PXwhhjs+JgxnVOzzZMCj/FsBUfI4c9sswJ
	CPNFzL3xZE5PXIIPqfXVaRwpQzHcIIn9E8mKZx8BLr+l0SmtO6p65n6YEdLrHib1EAb23i2MQizBY
	LY+ibLuNw/qXhNcQTl/7C0Y0HfzQVL1qUqzBd3+Nu2OwSCuaRoYYgK3/9O2DYZUeDUzmjn2aeFLsW
	TZBwFd0RJmwr1oCuF9S2VcWGsIoc9wMMJNVilDWnFPH5NM69fNL2BKrY8I8oy+IcJVe1kDanAoJDG
	EMMDHWk5LkdTV+4dtBYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5ubs-002aiP-EW; Mon, 27 Jun 2022 19:41:24 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5ubn-002ads-Ob
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 19:41:22 +0000
Received: by mail-wm1-x331.google.com with SMTP id o19-20020a05600c4fd300b003a0489f414cso2716020wmq.4
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jun 2022 12:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QIsRfhdQMUkP3ryaWA3tv1Mq4oyLE45ECuiu3trpN00=;
        b=B9k2d87DXty7I8E8LE+438emVeZlup2sIzCEsaWM1/EJIZIIppoNtZkCPt2B28TvB1
         fdKtH1VPlJ16WyEMx1xIBZTokOGXYXJAfUsriSAw/CpgnU/+PGc/DWxZ7qOcSPbfaeGR
         rM1s3NrexWkt4JIzMD25YQaH95anZDeTxbULdV8w7TEGkH8RBATcyyLwr/sjLesRwRcy
         0U9RvCUP+tg6PUtyUgz0XndXRLxU9I3XVPAehNBfQE275chl7nDU8XSSIbYZ6ThnJBeb
         RD/AeP34/mdXcNfB37IJm17xr1DNsnhqVVkZHleXi5mgtiwiFAN6khWnFjFTaYy47kFf
         W8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QIsRfhdQMUkP3ryaWA3tv1Mq4oyLE45ECuiu3trpN00=;
        b=TWgPnoZJ+rKhbtsRnfDJYVmAApNayaSeUwA/xBoFdreLP4bNLTJXSLAskWqR0XcIZs
         Jd/KVT/IozybmRi/ADAIadoE0k1+kYHWAmkQu25PBi6rplzvsQXi5MKj59A+NovgRY8M
         58PNv7syUNhhpHUqlg8RmGABd7QLCyZaFVftfP2+svU9/SBzhEU1x8/oYXeBIbgilJ4U
         QTQS3BJH72rV8jwLOjtk15UCbpi3Rz9mQJint9N6lAJ4U5tSbmZ9esIQNKHNAK+BdDBR
         8uD/YTrMqYTk0FzZPFopCy6pi2o3ktUCIwSb5Py1pyxkChczT1zKCn0KWcPzMVmqkzJq
         KE8g==
X-Gm-Message-State: AJIora97HyVC8lf17Ae7rSe7xcvzRSVYFNDSkKIMLBYoxRfTClJ9wpw+
	vCVjlX+fi0+j5QjgLH+cTxPaXQ==
X-Google-Smtp-Source: AGRyM1tvTVBKfByGAdgX8FjccMcjonG0JFKRVmUJw6/qO5b6Hes7fhYw0GHyt2p7jd1AwDC9JUm25Q==
X-Received: by 2002:a05:600c:4f15:b0:39c:7eaf:97e7 with SMTP id l21-20020a05600c4f1500b0039c7eaf97e7mr22218520wmq.199.1656358875365;
        Mon, 27 Jun 2022 12:41:15 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id e9-20020a5d4e89000000b0021a3a87fda9sm11428047wru.47.2022.06.27.12.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 12:41:14 -0700 (PDT)
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
	Heng Sia <jee.heng.sia@intel.com>,
	Jose Abreu <joabreu@synopsys.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-spi@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 00/16] Canaan devicetree fixes
Date: Mon, 27 Jun 2022 20:39:48 +0100
Message-Id: <20220627194003.2395484-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_124119_908440_29DDE566 
X-CRM114-Status: GOOD (  19.67  )
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

For the bindings, I am never sure about which of {unevaluated,additional}
Properties is correct to use, but the if statements in the binding didn't
work with additional so I used unevaluated...

@Mark, for your ASoC binding I was not sure about the properties that I
made depend on the compatible, but I looked in tree and was not able to
find other users to contradict what's in the Canaan devicetrees nor did
I get that much help from their docs.

@Serge, I dropped your R-b since I changed the enum.

@Rob, <N days ago>'s removal of ilitek,ili9341.txt is moved to ths series
since I was editing the dt-schema binding anyway.

Thanks,
Conor.

Changes since v1:
- I added a new dt node & compatible for the SRAM memory controller due
  Damien's wish to preserve the inter-op with U-Boot.
- The dw-apb-ssi binding now uses the default rx/tx widths
- A new patch fixes bus {ranges,reg} warnings
- Rearranged the patches in a slightly more logical order

Conor Dooley (16):
  dt-bindings: display: convert ilitek,ili9341.txt to dt-schema
  dt-bindings: display: panel: allow ilitek,ili9341 in isolation
  ASoC: dt-bindings: convert designware-i2s to dt-schema
  spi: dt-bindings: dw-apb-ssi: update spi-{r,t}x-bus-width
  dt-bindings: dma: add Canaan k210 to Synopsys DesignWare DMA
  dt-bindings: timer: add Canaan k210 to Synopsys DesignWare timer
  dt-bindings: memory-controllers: add canaan k210 sram controller
  riscv: dts: canaan: fix the k210's memory node.
  riscv: dts: canaan: add a specific compatible for k210's dma
  riscv: dts: canaan: add a specific compatible for k210's timers
  riscv: dts: canaan: fix mmc node names
  riscv: dts: canaan: fix kd233 display spi frequency
  riscv: dts: canaan: use custom compatible for k210 i2s
  riscv: dts: canaan: remove spi-max-frequency from controllers
  riscv: dts: canaan: fix bus {ranges,reg} warnings
  riscv: dts: canaan: build all devicetress if SOC_CANAAN

 .../bindings/display/ilitek,ili9341.txt       | 27 ------
 .../display/panel/ilitek,ili9341.yaml         | 60 ++++++++----
 .../bindings/dma/snps,dw-axi-dmac.yaml        | 35 +++++--
 .../memory-controllers/canaan,k210-sram.yaml  | 53 +++++++++++
 .../bindings/sound/designware-i2s.txt         | 35 -------
 .../bindings/sound/snps,designware-i2s.yaml   | 93 +++++++++++++++++++
 .../bindings/spi/snps,dw-apb-ssi.yaml         |  6 --
 .../bindings/timer/snps,dw-apb-timer.yaml     | 28 ++++--
 arch/riscv/boot/dts/canaan/Makefile           | 10 +-
 arch/riscv/boot/dts/canaan/canaan_kd233.dts   |  4 +-
 arch/riscv/boot/dts/canaan/k210.dtsi          | 38 ++++----
 .../riscv/boot/dts/canaan/sipeed_maix_bit.dts |  2 +-
 .../boot/dts/canaan/sipeed_maix_dock.dts      |  2 +-
 arch/riscv/boot/dts/canaan/sipeed_maix_go.dts |  2 +-
 .../boot/dts/canaan/sipeed_maixduino.dts      |  2 +-
 15 files changed, 269 insertions(+), 128 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/ilitek,ili9341.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/designware-i2s.txt
 create mode 100644 Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml

-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
