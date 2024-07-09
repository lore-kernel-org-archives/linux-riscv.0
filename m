Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A484CC3DA41
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jul 2024 10:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Gm7goUQ0zxGPpdlkF0T319AUI94Dxb0GbC2a3xJSeJ8=; b=HfKYeti+rxVOzd
	LheM3CR4cwxbxHXX6SNElkWWaQF6xHMthdIlIOVijbMFg18F2kAAXE5nP9jIYTuC/KLUAvlUbelai
	+APZWcmtDOun/bP4yfOaxyPlhCRH+JxuCrvLyAkdIAu2TqGv8KP1UfNFY2NIn+WTm3NFvdUiGwdl3
	ywpT0Hyw1KZX/+9ESRgf6UpKIRjracEwAhVgeSADIFJP6Fk2kVnX/+JpRgwQssiLyfb253oVkCZLW
	IGVCAMrbtnKhWgV+aLgjtL7ENsEpi6t8Y/3CurPtBTpeHvCnXAp24/gOuQ+q8XhpX2mUE8bvxwP4X
	u/dajX5AgUNpn+HAIH/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR7ky-00000006jmK-1kAo;
	Tue, 09 Jul 2024 10:07:32 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR7kr-00000006jiw-1ctM
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jul 2024 10:07:28 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9BCBF40002;
	Tue,  9 Jul 2024 10:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720519642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2H1eC2RhJwRtaKrShLbPvmd+hHIztSofnjas5VApbIo=;
	b=ZZBkraPryArJgdBEYWibidjRIUA2Haa7axtM61ab9XvXK+bi2mo9eMh/mjuuceIq9byUQT
	lCPzB396TuLB4G62YakjC9No/kQilc6VN0D66qV0cD1ce1qAQauiw/q/8FYAVygcPieb4E
	V2xy8SwmSl6cjQA+17tCRWXut60YizQFE/JrRqkjbQuudxrYJxC1kjBHbkRvfLA98Kyttq
	RaUmiZQGfbo4D2ThOqyMvynm+Vv2e/JTGUTJdfmUCiOaXTtJOkOuMyh+8fKEmib/jNEjgx
	wk9G46mdSz5sTX5p5fGCWblknqNlXdAnlRGepAMeJLD48ToIEML6fWYtmMD8WQ==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Subject: [PATCH v3 0/5] Add board support for Sipeed LicheeRV Nano
Date: Tue, 09 Jul 2024 12:07:15 +0200
Message-Id: <20240709-sg2002-v3-0-af779c3d139d@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANMLjWYC/3WO3WoDIRCFXyV4XYMzuq72Ku8ReuHPmAjtWtawJ
 IR997opNEjbyzPM951zZ5XmTJW97u5spiXXXKYW5MuOhbObTsRzbJmhQCUGGHg9oRDIrYyBIKK
 Wnlh7/pwp5etDdHxr+Zzrpcy3h3eB7fpLsQAXXMY0GnBGKAMHX8rlPU/7UD425zeAsgOsB+UtG
 Guc+wcYOwC8Dl6aQCapDthmLvicpkH8gNhAQumjTDpKMf7ZpAE7AKwbzOCSNkr3Teu6fgEAZU7
 qagEAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
 Chao Wei <chao.wei@sophgo.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.0
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_030725_761798_A41BB2FF 
X-CRM114-Status: UNSURE (   9.46  )
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

The LicheeRV Nano is a RISC-V SBC based on the Sophgo SG2002 chip. Adds
minimal device tree files for this board to make it boot to a basic
shell.

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
Changes in v3:
- Remove /dts-v1/ directive from sg2002.dtsi file
- Add disable-wp property to sdhci node to avoid having a write
  protected SD card
- Drop changes in cv18xx.dtsi and cv1800b.dtsi
- Add fallback compatible to cv1800b in SDHCI node of sg2002.dtsi
- Link to v2: https://lore.kernel.org/r/20240612-sg2002-v2-0-19a585af6846@bootlin.com

Changes in v2:
- Add SDHCI support
- Change device tree name to match the Makefile
- Add oscillator frequency
- Add aliases to other UARTs
- Add aliases to GPIOs
- Move compatible for SDHCI from common DT to specific DT 
- Link to v1: https://lore.kernel.org/r/20240527-sg2002-v1-0-1b6cb38ce8f4@bootlin.com

---
Thomas Bonnefille (5):
      dt-bindings: interrupt-controller: Add SOPHGO SG2002 plic
      dt-bindings: timer: Add SOPHGO SG2002 clint
      dt-bindings: riscv: Add Sipeed LicheeRV Nano board compatibles
      riscv: dts: sophgo: Add initial SG2002 SoC device tree
      riscv: dts: sophgo: Add LicheeRV Nano board device tree

 .../interrupt-controller/sifive,plic-1.0.0.yaml    |  1 +
 .../devicetree/bindings/riscv/sophgo.yaml          |  5 ++
 .../devicetree/bindings/timer/sifive,clint.yaml    |  1 +
 arch/riscv/boot/dts/sophgo/Makefile                |  1 +
 .../boot/dts/sophgo/sg2002-licheerv-nano-b.dts     | 54 ++++++++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2002.dtsi             | 32 +++++++++++++
 6 files changed, 94 insertions(+)
---
base-commit: d20f6b3d747c36889b7ce75ee369182af3decb6b
change-id: 20240515-sg2002-93dce1d263be

Best regards,
-- 
Thomas Bonnefille <thomas.bonnefille@bootlin.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
