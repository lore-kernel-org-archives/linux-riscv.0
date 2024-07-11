Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BBAC3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jul 2024 10:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5Gs5F51Lr+JGHwK1nUXvaJ8FmXcqSuaMI9TqTboerIs=; b=A3AfjFIY0MVljb
	sSYP3yHXh3QuEUDPFC7dYuKNn41LlfZvLrSauAd8Avy6SMRXiA+8Q1VMJhVAFRRmXrfqYVaN60AIX
	8CnZ56wtRNXRBv+v/0fzM7KXT8A4bCwZs2icsGxOlnmBXbj1yYs/l2UMFvPPr5Lsw3UafHHekC2v0
	p4+jDAnLB7lJzZjAW1Z0UNVVP84/l4WrHSz8rut63efR8SEwtuVntsueBSObYDET8nuH41YGMlHlW
	+/z4zQcge4BH7pg6X2cb3BHU3B/cbT+F4WYUCKQWWINnfB7dNLm9nhFj9e7PPmQDjRicPf9KIcKb5
	NVqwllkwQHf8FMTLdzEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRqcU-0000000DRDY-1tbL;
	Thu, 11 Jul 2024 10:01:46 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRqcM-0000000DR9I-23un
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jul 2024 10:01:41 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 95C19240005;
	Thu, 11 Jul 2024 10:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720692093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vlU1weA5VgH1E2dh8WVjvbQOwF4vjq6cd6VW9er2tWU=;
	b=aW6ayPAEcB36p23PxWi3enx40Cf7PVxlhwtg0QPdovqFdoVhiX0Sc6R2TbxcTWa6lvA1ew
	tTETtwTK402Xk++Y1z65U6RL62j9WxUL3FRSnHKlNzjU6WiyFgpNW2nungDtytJhn4iekr
	LTH10E9NP/NzscW8qLhNcjAt9+BnB03VJTUped7b9+/a4J4bPXgc/qHRu14xZiwJfMtUsM
	EWiGvFb+nzVGp8p8TYVPI8XGwWikjSRrnyRk+feDJ8AOOQuhEX1Y3eyswUUQ2Z3cS7Bvn+
	5O6952u+ecx67zqDewC4g0lP+wJqx1n+HZV8GrjXPDqLsqgpy425wlf+5FYLQA==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Subject: [PATCH v4 0/4] Add board support for Sipeed LicheeRV Nano
Date: Thu, 11 Jul 2024 12:01:27 +0200
Message-Id: <20240711-sg2002-v4-0-d97ec2367095@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHetj2YC/3XOy2rDMBAF0F8JWldFMyPr0VX/o2ShZyJorWAF0
 xD875VTSDBpl1fo3DtX1tJUUmNvuyub0lxaqWMP8mXHwtGNh8RL7JmhQCkGGHg7oBDILcWQIKI
 in1j/fJpSLt+3oo99z8fSznW63HpnWF+fKmbgglPM2oAzQhp497WeP8v4GurX2vkLkDbAepDeg
 rHGuX+A3gDwKngyIZksN2A9c8bHaQrEHWKHCclHyiqS0H8uKcANAOsGM7isjFTPS/RY0sLeIXX
 ostY2UASycQuXZfkBRCE45KMBAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
 Chao Wei <chao.wei@sophgo.com>, Conor Dooley <conor@kernel.org>
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
X-CRM114-CacheID: sfid-20240711_030138_833799_8DD1C193 
X-CRM114-Status: GOOD (  10.92  )
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
Changes in v4:
- Add correct bindings configuration for SG2002 sdhci
- Drop commit "dt-bindings: timer: Add SOPHGO SG2002 clint" because it
  has already been merged in Daniel Lezcano git tree.
- Link to v3: https://lore.kernel.org/r/20240709-sg2002-v3-0-af779c3d139d@bootlin.com

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
Thomas Bonnefille (4):
      dt-bindings: interrupt-controller: Add SOPHGO SG2002 plic
      dt-bindings: riscv: Add Sipeed LicheeRV Nano board compatibles
      riscv: dts: sophgo: Add initial SG2002 SoC device tree
      riscv: dts: sophgo: Add LicheeRV Nano board device tree

 .../interrupt-controller/sifive,plic-1.0.0.yaml    |  1 +
 .../devicetree/bindings/riscv/sophgo.yaml          |  5 ++
 arch/riscv/boot/dts/sophgo/Makefile                |  1 +
 .../boot/dts/sophgo/sg2002-licheerv-nano-b.dts     | 54 ++++++++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2002.dtsi             | 32 +++++++++++++
 5 files changed, 93 insertions(+)
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
