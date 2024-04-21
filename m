Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB54C4345F
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Apr 2024 05:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dqFXpQ217Idqh8562qd0tbQ6b6WqkWi/3CluCytrSZc=; b=JJEg8Zo/Gi9RMN
	Sl4ZJVWpDuhKbBD+IXg8znma+W3XxoHPVegHIOS9dkzeXtZRCX4sqD3tfiDqp77gFJ5h8O43GfjEq
	yzrKTpogRCaPUVX1wF4U0oSn6JJ7C6BOjJg8aw2AfC3fueuy42Od4VUFBtN8rnLSYfWoXJeId2Cbn
	eJ7vh31MZgHO9vYNTX8Bx9TV8Y8VAAX3fDbwweAozUAdyvEHcR0ZET0ztNEnf0aQ6i36UFf9MMAQT
	ctTQs/9JsePUAqNTyN21SAevMh3Jf9oDPD3tGUPXd492/ptBI+j7dVw7XLNpMNcH28DrmzR8AtqAX
	dapmpXeeDruYVD8m00/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryQCc-00000009vH2-0txX;
	Sun, 21 Apr 2024 05:57:26 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryQCX-00000009vG3-3v2v
	for linux-riscv@lists.infradead.org;
	Sun, 21 Apr 2024 05:57:23 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1E8831BF203;
	Sun, 21 Apr 2024 05:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713679039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=no/pL7VOcARO0BS/v1RNO0fsjJEINHgcsZ4jd5IOM9k=;
	b=XVVQ/4hOWkKM5LQ0fELZZsZGbi974cOPy56h04cj+An7C3LvjC2FQzjAd8pJll3rqLJyKd
	/AK7csjAbdsOrazlV5pS8Kw3nlkbsC6Q/8pfDQ7MdSKFaq2imzibiWYEPwjbOdKsV5WLs4
	XFC1LNU69Ti7lAzpx03zWzW2ALoONy2GbytnPwipGAlREFY8loIDmz+8GP24WIEwk5BkbA
	ten3sf0HqPXY55NYDHTJB2yQa723AXZ3HyGJAwucUgabX4DEeRpmAKs0NP8OAGGqvINoEw
	0/dUYXC5dcYPmZgzt8WhNACFxBoHpL6qrch2MG+xymYaO/HW0NyapzYuuWqaWg==
From: michael.opdenacker@bootlin.com
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v6 0/2] add initial Milk-V Duo S board support
Date: Sun, 21 Apr 2024 07:57:08 +0200
Message-Id: <20240421055710.143617-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-GND-Sasl: michael.opdenacker@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240420_225722_133737_FE79B373 
X-CRM114-Status: GOOD (  12.04  )
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

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

This adds an initial device tree for the Milk-V Duo S board.
Last tested on linux-next 20240419

Patch produced against the "for-next" branch of the sophgo "linux" tree:
https://github.com/sophgo/linux.git

- Changes in V6
  - Change board compatible from "milkv,duos" to "milkv,duo-s"
  - Rename sg2000-milkv-duos.dts to cv1812h-milkv-duo-s.dts
  - Remove redundant line from board DTS:
    device_type = "memory";
    It was already set in cv1812h.dtsi

- Changes in V5
  - Fix the commit message describing the board DTS.
    MMC is not supported yet.

- Changes in V4
  - Remove mmc device (&sdhci0) as not working yet with linux-next
  - Use "sophgo,cv1812h" compatible as on the Huashan Pi board.
    Should I call the DTS cv1812h-milkv-duos.dts instead
    of sg2000-milkv-duos.dts?

- Changes in V3
  - Fix enum in devicetree/bindings/riscv/sophgo.yaml

- Changes in V2:
  - Add a first patch to register the new compatible string
    for this board.
  - Use a correct SoC compatible string
  - Add "disable-wp" (disable write protect) property
    to enable write access to the external SD card.

Michael Opdenacker (2):
  dt-bindings: riscv: add Milk-V Duo S board compatibles
  riscv: dts: sophgo: add initial Milk-V Duo S board support

 .../devicetree/bindings/riscv/sophgo.yaml     |  1 +
 arch/riscv/boot/dts/sophgo/Makefile           |  1 +
 .../boot/dts/sophgo/cv1812h-milkv-duo-s.dts   | 33 +++++++++++++++++++
 3 files changed, 35 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv1812h-milkv-duo-s.dts

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
