Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A6D5C25B78
	for <linux-riscv@archiver.kernel.org>; Fri, 17 May 2024 09:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LP0Xq+WhmP7fQK1ZYd1B9GOZ5nsdPvc5OdzVVFdMpyU=; b=vFCN/wZoxdE8Nx
	j+tyfhDaCt+0QpWLR0fYxlbDs1pAoQUXUxDVFDL2m1z8nezYM3vwGwI9B8YGH2eEUDZz4W9szUvmb
	oTHWfMlcThbOo0X5SaKswMD72lT2cBH2kxMb7Y62UC+tdX0V+X1EQXIHXY5sQavYN2genJd0N9bzU
	hfjueMA3wwGcqataE2KVSZB/z6bElc90X/PT89nabDQPMQX2ProDAa6MGGlmYssBedKvco4A7go5d
	dcPL6RmR6PFMoCyX/XrrTZKt7thxvEZ5atgsslvH/os9/dmHuSkm7IQ/OYYJOI7U8qYpKb2WlG9lj
	ffC7eROLORDJLypj8x7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7tba-00000007IdB-2N0I;
	Fri, 17 May 2024 09:10:22 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7tbW-00000007IbT-2m8W
	for linux-riscv@lists.infradead.org;
	Fri, 17 May 2024 09:10:20 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2A19320003;
	Fri, 17 May 2024 09:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715937013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=E9YI5IhJQd+9CPiNZ2Juj0hyKn1eM6koEnskZ7nXuGk=;
	b=Z3XVq7HTZDQDQNn5t+fzpekKxhSYeQR0NMJsT0E7v0NazyG3Hhd6Ij3FodPhpxYXezfIJR
	2iP1ZwBWYEj0iyUI8ijZEwnm48MU51UBF03xMCZoYiUDom7zrRfo1hVhg5btwgXAtzgOhI
	pmN/L9ci8XIRqwztOOBo8FPD9KAh0SSVD8rK6Nx83JFtMi4WwT1BPClN9Ns8R3uxdmfVG+
	X3o+kD1tMz9+rUJuLHDj7wDntCwSCawoO0D58y5bLO4+5lUT/mj40cIaUkmxMke2JovFD+
	G8vxkgmp4Wo1KEBaFpH+hY33JP/IK31HHo6WnSDonQ7Us7wvzslv4xCJG3adXw==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Subject: [PATCH v2 0/3] Add I2C support on TH1520
Date: Fri, 17 May 2024 11:09:52 +0200
Message-Id: <20240517-i2c-th1520-v2-0-d364d135ccc6@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOAeR2YC/1XMQQ7CIBCF4as0sxYDI6TElfcwXRRKZRIFA4RoG
 u4u1pXL/yXv2yC7RC7DedgguUqZYuiBhwGsn8PNMVp6A3KUXKJihJYVLxRyttqTdWLWRo4I/fB
 MbqXXjl2n3p5yiem92xW/649R4o+pyDgzRokF9agk1xcTY7lTONr4gKm19gGCJDUwpgAAAA==
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
 Drew Fustini <dfustini@tenstorrent.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_021018_871713_7942D4EB 
X-CRM114-Status: UNSURE (   9.02  )
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

This adds I2C support in the device tree of the T-Head TH1520 RISCV-SoC
and a default configuration for the BeagleV-Ahead. It appears that the
TH1520 I2C is already supported in the upstream kernel through the
Synopsis Designware I2C adapter driver.

This patch depends on the clock patch from Drew Fustini
Link: https://lore.kernel.org/linux-riscv/20240426-th1520-clk-v2-v2-0-96b829e6fcee@tenstorrent.com
and the pinctrl patch from Emil Renner Berthing
Link: https://lore.kernel.org/linux-riscv/20240103132852.298964-1-emil.renner.berthing@canonical.com

Changed from v1:
1. Remove redundant example for Synopsis DesignWare-I2C bindings
2. Remove Node Ordering commit as it has already been taken
3. Remove EEPROM label
4. Rebase on pinctrl and clock driver patches
5. Add pinctrl configuration
6. Replaced the fixed-clock with a correct configuration

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
Thomas Bonnefille (3):
      dt-bindings: i2c: dw: Document compatible thead,th1520-i2c
      riscv: dts: thead: Add TH1520 I2C nodes
      riscv: dts: thead: Enable I2C on the BeagleV-Ahead

 .../bindings/i2c/snps,designware-i2c.yaml          |  4 ++
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 84 ++++++++++++++++++++++
 arch/riscv/boot/dts/thead/th1520.dtsi              | 50 +++++++++++++
 3 files changed, 138 insertions(+)
---
base-commit: e1fb0b71c746f863fa49ff359d58c949538ce181
change-id: 20240425-i2c-th1520-fc3ce1a8b472

Best regards,
-- 
Thomas Bonnefille <thomas.bonnefille@bootlin.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
