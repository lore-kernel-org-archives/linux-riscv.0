Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F0DCF11FE
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 15:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LEW1JyRutwCeQEru4ltV3dXG5lsldlX+BuFGpz09OTc=; b=yM0WGvJgo+Ivc0
	Wqny88UuOqFFkWbyfvrVJEZSPkVz6beIL93Ha8gBB8ZeexLF2Juj0V2y5SZhClJfppisGHpOafTCC
	Dfq5CDxpyvLvwAkA15ig+omGdgmWl6N7rLEmfV9eSiD6GDcJrIsCU38j0A4fu04is+iC8iF0NY0C8
	yWKPwda6QFTRMFSBdvNbU0t1ehl7EtTcqeWjJi8/xmKoQ+/0EhWEKeYDteYqH2+neJDNRlwBfKMyj
	+rr/3wC1dJHJkgLkEIo1mtQgm6DwXlnIAIhXILT5Y7UMJ0y8xEP1QwwjITwZs72Gg9YfNSQ/QtehU
	QcZLM2d9mjWKZihhm0oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syv4m-0000000DKRA-0Flq;
	Thu, 10 Oct 2024 15:27:40 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syulv-0000000DGD3-2bfJ
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 15:08:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 560621C0009;
	Thu, 10 Oct 2024 15:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728572886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=T5Jus8ME/eIiTNM0qUOv+UNXq09uP1fqmQJwoOm6oNg=;
	b=PM4ZNOoejV4UsJG2CsGMeundur1sZSQEGQnDzkWGlGmQM4FGIoWgke5FcxwRI495/oGndI
	FXAYJ6a/2hrbv5uc3V3O5InjlKXo5VFlMBhX1lgkvnZlmPqa2bWS5PKdFPWvFtkf6Co5qL
	A0HkXSw4no0Hh3x26WYEYlDsqCtzaul4H/pt+xEkGnjLdwji+AndCI1J5hzLrTqlDuLKON
	MX6MpH+1HoFQZRdsEDKCrEMFKzqu6sXRZWlVN5UrU7YwHo/5wKVVnhpJAEYxEfe422e08k
	L54ZfNc/pzMQwz2DkvyZy63ccPDdEUYtOxFjPrS6/S0aNsywfiMej+8Z5vuiQw==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Subject: [PATCH v5 0/2] Add board support for Sipeed LicheeRV Nano
Date: Thu, 10 Oct 2024 17:07:05 +0200
Message-Id: <20241010-sg2002-v5-0-a0f2e582b932@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJntB2cC/3XOy2rDMBAF0F8JWtdFM6NnV/2P0oWeiaC1ih1MQ
 vC/V07BqXG7vELn3rmxMQ0ljezlcGNDmspYat+CfDqwcHL9MXUltsyQo+ASZDcekXPsLMWQIKI
 in1j7/DWkXC73orf3lk9lPNfheu+dYHndVUzQ8Y5i1gac4cLAq6/1/FH651A/l84fgLQB1oPwF
 ow1zv0D9AaAV8GTCclksQHLmRM+TlPAV4gNJiQfKatIXP+5pAA3AKyTRrqsjFD7JXosaW5XSA2
 6rLUNFIFs3EPxCwKsUDQYrU4BSbVCuYXzPH8DxNQ4idwBAAA=
X-Change-ID: 20240515-sg2002-93dce1d263be
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
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_080811_994186_0A1DE88C 
X-CRM114-Status: GOOD (  11.34  )
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
Changes in v5:
- Add support for pinctrl
- Remove nodes for i2c0 and uart1
- Drop dt-bindings patch that are already applied
- Link to v4: https://lore.kernel.org/r/20240711-sg2002-v4-0-d97ec2367095@bootlin.com

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
Thomas Bonnefille (2):
      riscv: dts: sophgo: Add initial SG2002 SoC device tree
      riscv: dts: sophgo: Add LicheeRV Nano board device tree

 arch/riscv/boot/dts/sophgo/Makefile                |  1 +
 .../boot/dts/sophgo/sg2002-licheerv-nano-b.dts     | 95 ++++++++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2002.dtsi             | 42 ++++++++++
 3 files changed, 138 insertions(+)
---
base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
change-id: 20240515-sg2002-93dce1d263be

Best regards,
-- 
Thomas Bonnefille <thomas.bonnefille@bootlin.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
