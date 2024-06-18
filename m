Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E47C41513
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 07:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=w03cXUpTFb6l8MbY3IUXJm8ByXQLtuHs3SYCNfFFY88=; b=vjyeXL0MyJ6SBz
	qJ10QM+q8WZ+8HHznU7YWOjO7dP5LCj66MutEGQsBwzKRdlYFWRD+llrR3P8eSIBO1zIg994caFZf
	Lh+m8wHs9vX+xbyYIfnAhQ0bDtxbtQ/GFguVF1fr9tdW+OGJSqC/AG/Xswbs94LYadApHl0iWbye0
	Jk70XvLQOFS5y7kQ7AhNzICZ/rX9ckALxjS3LiaZfgr0Rebh1mKhuFp9KZCm9GBKu9aPKdfXQ2DPI
	QTn9a96rp9cw3AJH0weciEPI0dPVLrbiFhUc8c8gi8TRQhsoYQevWWBJIGpz4aiBTtM9Xqxlo3tR/
	s/Mt6vPGqzni8BzCG3dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJTUT-0000000DzGg-2HfN;
	Tue, 18 Jun 2024 07:42:53 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJTUN-0000000DzDr-4APY
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 07:42:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DDC9FC000D;
	Tue, 18 Jun 2024 07:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718696564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4utpiHnDm/jDD4wV/QlDCBTVNuIjZ+gRdkVJTonl0VY=;
	b=czS7B6fib5UddaVPgCtk7cPfCHlvNKhF9bOjqgYkr2arubCarLH28ySfWd81HMFudSJoSw
	FqFBZ7R6ypliWNrou3RqItbRYrl3j53W+cZQ6mCJ2+iSG+GQJ2Z67mJy0TT35hhjOQ8KA2
	bclBQOg22YOnRjgBgjKdpJgk7UiTR3M4/mIuyHuP0IpB8y72DgTS9kuKj7eiBSoloITCcR
	6yj5kCbF7Mt8Bd5CeVl6Zuf0XHMDjAK64Nsyooz0G/6sm5/mdDgLIVhqoQLL54Mg0dFBlL
	WxHDqVYE0XuFuecRcefFNP8RCKvEf8ARiC98XC5J/SLwQS6YxWGhJ4+myU+XMw==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Subject: [PATCH v3 0/3] Add I2C support on TH1520
Date: Tue, 18 Jun 2024 09:42:37 +0200
Message-Id: <20240618-i2c-th1520-v3-0-3042590a16b1@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAG06cWYC/2XMQQ6CMBCF4auQrq1ppy0QV97DsKDTIpMoJS0hG
 sLdLeiGuHwv+b+FJR/JJ3YpFhb9TInCkIc6FQz7drh7Ti5vBgK00GA4AfKplwYE71Chl21tdQU
 sB2P0Hb127Nbk3VOaQnzv9gzb+2WMPDAzcMGtNdJBXRkt6qsNYXrQcMbw3NxfVP1FTpXaSWUQs
 TxEzbquHzWogmbbAAAA
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
 Drew Fustini <dfustini@tenstorrent.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Conor Dooley <conor@kernel.org>, 
 Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.0
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_004248_342817_B3414674 
X-CRM114-Status: GOOD (  10.30  )
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

This adds I2C support in the device tree of the T-Head TH1520 RISCV-SoC
and a default configuration for the BeagleV-Ahead. It appears that the
TH1520 I2C is already supported in the upstream kernel through the
Synopsis Designware I2C adapter driver.

This patch depends on the clock patch from Drew Fustini
Link: https://lore.kernel.org/linux-riscv/20240615-th1520-clk-v1-0-3ba4978c4d6b@tenstorrent.com
and the pinctrl patch from Emil Renner Berthing
Link: https://lore.kernel.org/linux-riscv/20240103132852.298964-1-emil.renner.berthing@canonical.com

Changed from v1:
1. Remove redundant example for Synopsis DesignWare-I2C bindings
2. Remove Node Ordering commit as it has already been taken
3. Remove EEPROM label
4. Rebase on pinctrl and clock driver patches
5. Add pinctrl configuration
6. Replaced the fixed-clock with a correct configuration

Changed from v2:
1. Reorder nodes to conserve ascending register node ordering
2. Add support for I2C2 as it probably use the same controller
3. Format comments to match kernel coding style
4. Reorder nodes to conserve alphabetical node ordering
6. Declare I2C2
6. Set pinctrl pull-up resistor to the highest value

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
Thomas Bonnefille (3):
      dt-bindings: i2c: dw: Document compatible thead,th1520-i2c
      riscv: dts: thead: Add TH1520 I2C nodes
      riscv: dts: thead: Enable I2C on the BeagleV-Ahead

 .../bindings/i2c/snps,designware-i2c.yaml          |  4 ++
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 84 ++++++++++++++++++++++
 arch/riscv/boot/dts/thead/th1520.dtsi              | 60 ++++++++++++++++
 3 files changed, 148 insertions(+)
---
base-commit: c7cdaf7e82015e7037131381bec6ba4b2b1eface
change-id: 20240425-i2c-th1520-fc3ce1a8b472

Best regards,
-- 
Thomas Bonnefille <thomas.bonnefille@bootlin.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
