Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74653C2BA16
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jun 2024 08:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TIvrtjy4INr5Lxl/4nGr9uS2mxJpXU5pKDOsrZCjJsY=; b=3WvReAG+afVZr9
	11w5y4BP+8ZenORnU7KmXBY9O8JWT2MyGn+gWbp3K68XFypatlZ3HmwZnR751aVWoLabWBa3+7afu
	8qyX0DYtBMx1CuDi/oyp57LtabAcKCv2xrCtb3MgtjNias7DpEdBW4uIeuo803PB64Ftfcof189MK
	20LQwr7vlV5o8DvleUfNIWUQmlnNyAXMDyo2X8RgcnLfEBMxwi/JeeSaYOEh6Q5X1PFo39OfsSrDf
	PzTD3hdoAJRmisHa2kEHFtsiXJQqLytqb1Nvi4nT2649YvAy7C/16AhfkhngAovGkjDHUjzx29FO8
	zBSDaMwNJI2fYU0cnO1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHIze-0000000Bb2m-0ICC;
	Wed, 12 Jun 2024 08:06:06 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHIzV-0000000Baux-2z85
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jun 2024 08:06:01 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A63491C0006;
	Wed, 12 Jun 2024 08:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718179551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sg5LM5Q0y/4zk083q4HytJVsSyW8T6Yex1MqFIcsA54=;
	b=MN8o7Vl2jEVH+2RAPqLd9I0ScNO9Bva28Ct0IBruzcfox3+rztCaK8yyf6TofSJgReNXLv
	H+8LGAUhaLjVHbQyLrxC5+Uj5rFyvzlAkBb9y5XUcEUlb7uCIFUqp6iPJCTVUhlUOSBoB+
	MtmpEQBKjVuWp7jW1sSd8O000nLD1akvx3BcimTRL1F7EViqNtVN0GHuu+k7hH6O5vg/8R
	bfh0u0Ri3yD6R43Z21+SogfFMycFFKQkSbTPb/QGpxAvXS8EzAm0GcgOjEgpy7+/f++Hcr
	Ac6udX2FM4oPh03LnFs7obSCBKvkOU6IwDTRi5Rpa7JPAm+Gy+5x67/mfNY8pg==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Subject: [PATCH v2 0/6] Add board support for Sipeed LicheeRV Nano
Date: Wed, 12 Jun 2024 10:02:30 +0200
Message-Id: <20240612-sg2002-v2-0-19a585af6846@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABZWaWYC/3XOTQrCMBAF4KtI1kYyk/6krryHuGiSaRvQRpJSl
 NK7m1ZQirh8w3yPN7FIwVFkx93EAo0uOt+ngPsdM13dt8SdTZmhwEzkkPPYohDIK2kNgcVCamL
 p+R6ocY+16HxJuXNx8OG59o6wXH8qRuCCS9uUCmolMgUn7f1wdf3B+NvS+QYoN6DSkOkKVKXq+
 g8oNwB0YbRUhlSTbcAyc8TvtALEB2KChFJb2RRWinIL53l+Acs6jc85AQAA
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
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_010558_122314_F320AAD0 
X-CRM114-Status: UNSURE (   9.28  )
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
Changes in v2:
- Add SDHCI support
- Change device tree name to match the Makefile
- Add oscillator frequency
- Add aliases to other UARTs
- Add aliases to GPIOs
- Move compatible for SDHCI from common DT to specific DT 
- Link to v1: https://lore.kernel.org/r/20240527-sg2002-v1-0-1b6cb38ce8f4@bootlin.com

---
Thomas Bonnefille (6):
      riscv: dts: sophgo: Put sdhci compatible in dt of specific SoC
      dt-bindings: interrupt-controller: Add SOPHGO SG2002 plic
      dt-bindings: timer: Add SOPHGO SG2002 clint
      dt-bindings: riscv: Add Sipeed LicheeRV Nano board compatibles
      riscv: dts: sophgo: Add initial SG2002 SoC device tree
      riscv: dts: sophgo: Add LicheeRV Nano board device tree

 .../interrupt-controller/sifive,plic-1.0.0.yaml    |  1 +
 .../devicetree/bindings/riscv/sophgo.yaml          |  5 ++
 .../devicetree/bindings/timer/sifive,clint.yaml    |  1 +
 arch/riscv/boot/dts/sophgo/Makefile                |  1 +
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi            |  4 ++
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi             |  1 -
 .../boot/dts/sophgo/sg2002-licheerv-nano-b.dts     | 53 ++++++++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2002.dtsi             | 34 ++++++++++++++
 8 files changed, 99 insertions(+), 1 deletion(-)
---
base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
change-id: 20240515-sg2002-93dce1d263be

Best regards,
-- 
Thomas Bonnefille <thomas.bonnefille@bootlin.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
