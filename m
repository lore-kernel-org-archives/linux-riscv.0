Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75412C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Jun 2022 12:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zUOlh9J2lu42+sANCui3JTYyWl1uaVlNU5UyDWyqRlY=; b=jnZCsbwQKyUFrV
	0OQYXVamDHLSN0t9d/CKeZOtUnyAQURwb9h3r11QxTRpqrse1AhDZAeXEPGXIS2OpJB9bR21kVcOz
	PajoDdcWNxMgFNzM1eC9kbIkF8FKf8+TEdEMPIMa/T8/omlbxAoDpTjhYI6AiFefkcno71xtj5xjN
	6y9fvseMV+g51+6m+dv/9RDM8jn8jaTKnIm7tBmrz8MaVjuk6b8My3EDOvkWz6z/MAYjfx4yVGaKJ
	VjuIIO8JwUawVmkXrVx+IjF7RKFT5K+UcpItj4wTfJq58RLZis8s4UVToM6OMxjpKPIZJ8VEpise/
	XbPO4lBGjSjb//R5lDWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2XcZ-00BHYW-9F; Sat, 18 Jun 2022 12:32:11 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2XcV-00BHVk-Aw
	for linux-riscv@lists.infradead.org; Sat, 18 Jun 2022 12:32:09 +0000
Received: by mail-wr1-x434.google.com with SMTP id e25so4939155wrc.13
        for <linux-riscv@lists.infradead.org>; Sat, 18 Jun 2022 05:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cxrfrrOtT2Oa/bD+7FBstHMfLsi5+SmAhxAWzjAkyZ0=;
        b=S2mJhG/EP2bvAoovp3+1EX915fqgCN7s5TTHRtk6gjrtEqOI/5G9b2iqkP8Hp2fPJT
         Xv7w9JM5mIzSBmUBnG5veKqEPc/MaxIruLrav0YlVhnIQlMG/M+wTnbgpcN0tcmr+tr2
         or89IY4gglZ6yWfGfoA+jfJEq4JsK9dvMaD2rRItnHWPYoJkG7IkTqJN1pM8cYB5TpdM
         9bGqfIt5FOQFRPbbNCxOn37acP1sIBQPp6tl26reXViVZmDuywOt0O5V9tWi+koaQg4c
         DJEmvefmmDhAvEMjrhz9P1n7uaAObdu8xiUcENoorbn9u8vIjZNy1IW7RHROc+mSnsUJ
         yKqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cxrfrrOtT2Oa/bD+7FBstHMfLsi5+SmAhxAWzjAkyZ0=;
        b=vKwB0gdAuBw5MCxYT3UTdgElnUJBua9vg2Oq6pCvq4IoDOand4cvplbx2stMQVzvvD
         QBDoBlNVF7HcUpUIpa4ZAitFn9JPES1aQwj4P515VJW05UhJIcpbza7c4ENZtgNs+uPL
         AJjhSDVDsJR7WtJiKxfjsJbo2sXR6RwbDNfc8UL7Cm8Nhk/K2qRfRjSfUg83JzeHGxyw
         0X8MghQGE0UDpl4PwpJKXoybjXOv0UYmGPCNqa2R7DqRer22lj0BbtngqpqXILyTHpGO
         /0rynxOnO/e8DK5220ioXCt8Fb9xsS23JnxAOZ1Pt86nRvi9H6ljHT+f/MiTtQRiISnS
         6a2A==
X-Gm-Message-State: AJIora8X+7bCFarkYAWPM6od+kY6NkixuvciECX9U5MRek8SSq8Q4+y8
	C+5Qo1gtVIa9kRvZyG08V744Og==
X-Google-Smtp-Source: AGRyM1vo09vBquhwF3XuUkIoGOLL2MXJBKKEyvgcE2QTAi/5UKplOA45WdH+tRLIApC05LNQOZn4qQ==
X-Received: by 2002:adf:fd0f:0:b0:210:32d7:4cb5 with SMTP id e15-20020adffd0f000000b0021032d74cb5mr13971427wrr.565.1655555519244;
        Sat, 18 Jun 2022 05:31:59 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id az10-20020adfe18a000000b00210396b2eaesm9292305wrb.45.2022.06.18.05.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jun 2022 05:31:58 -0700 (PDT)
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
Subject: [PATCH 00/14] Canaan devicetree fixes
Date: Sat, 18 Jun 2022 13:30:22 +0100
Message-Id: <20220618123035.563070-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220618_053207_423779_1CDEC129 
X-CRM114-Status: GOOD (  16.73  )
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
based boards (well, unless you enable W=1 but that's another days work).
I *DO NOT* have any Canaan hardware so I have not tested any of this in
anger. I based the series on next-20220617.

For the bindings, I am never sure about which of {unevaluated,additional}
Properties is correct to use, but the if statements in the binding didn't
work with additional so I used unevaluated...

@Mark, for your two bindings I was not sure about the properties that I
made depend on the compatible, but I looked in tree and was not able to
find other users to contradict what's in the Canaan devicetrees nor did
I get that much help from their docs.

@Rob, yesterday's removal of ilitek,ili9341.txt is moved to ths series
since I was editing the dt-schema binding here anyway.

Finally, @Palmer:
This + Atul's stuff + the sifive dts watchdog patch will get us sorted
in terms of dtbs_check errors. To make keeping it that way a little
easier, I changed the Canaan devicetree Makefile so that it would build
all of the devicetrees in the directory if SOC_CANAAN. Hopefully someone
with a device can test it - but my build log *looked* fine but that's
not exactly sufficient.

Thanks,
Conor.

Conor Dooley (14):
  dt-bindings: display: convert ilitek,ili9341.txt to dt-schema
  dt-bindings: display: panel: allow ilitek,ili9341 in isolation
  ASoC: dt-bindings: convert designware-i2s to dt-schema
  dt-bindings: dma: add Canaan k210 to Synopsys DesignWare DMA
  dt-bindings: timer: add Canaan k210 to Synopsys DesignWare timer
  spi: dt-bindings: dw-apb-ssi: update spi-{r,t}x-bus-width for dwc-ssi
  riscv: dts: canaan: fix the k210's memory node
  riscv: dts: canaan: add a specific compatible for k210's dma
  riscv: dts: canaan: add a specific compatible for k210's timers
  riscv: dts: canaan: fix mmc node names
  riscv: dts: canaan: fix kd233 display spi frequency
  riscv: dts: canaan: use custom compatible for k210 i2s
  riscv: dts: canaan: remove spi-max-frequency from controllers
  riscv: dts: canaan: build all devicetress if SOC_CANAAN

 .../bindings/display/ilitek,ili9341.txt       | 27 ------
 .../display/panel/ilitek,ili9341.yaml         | 60 ++++++++----
 .../bindings/dma/snps,dw-axi-dmac.yaml        | 35 +++++--
 .../bindings/sound/designware-i2s.txt         | 35 -------
 .../bindings/sound/snps,designware-i2s.yaml   | 93 +++++++++++++++++++
 .../bindings/spi/snps,dw-apb-ssi.yaml         | 48 +++++++---
 .../bindings/timer/snps,dw-apb-timer.yaml     | 28 ++++--
 arch/riscv/boot/dts/canaan/Makefile           | 10 +-
 arch/riscv/boot/dts/canaan/canaan_kd233.dts   |  4 +-
 arch/riscv/boot/dts/canaan/k210.dtsi          | 25 ++---
 .../riscv/boot/dts/canaan/sipeed_maix_bit.dts |  2 +-
 .../boot/dts/canaan/sipeed_maix_dock.dts      |  2 +-
 arch/riscv/boot/dts/canaan/sipeed_maix_go.dts |  2 +-
 .../boot/dts/canaan/sipeed_maixduino.dts      |  2 +-
 14 files changed, 239 insertions(+), 134 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/ilitek,ili9341.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/designware-i2s.txt
 create mode 100644 Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml


base-commit: 07dc787be2316e243a16a33d0a9b734cd9365bd3
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
