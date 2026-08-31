Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75936C61DD3
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 10:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oj2Gh9t212E3r5qzr0G6P9bx9gAHyjnyAk0rOVovcR0=; b=d2+G7z/xTNCntX
	XF5vqApqWn1iXKTRgtFO/oRa4mu531Hi8rD/zjMPjTH8xNRs5IOa0uQbyvveCkt9j12ZgWHcScr62
	yd2O2/5AW2NCbls0N7G1g0fBivqeAmxu4LSKqCgH71jAygVerWC1t1Ibg7KYMIL6kvu820Ky0XepU
	WILWmFKJiKRQquwkdEQOX6VprXsk0W+cUwVLVyw3607bn8O5uG5d6J/SOh9LwOSGt5mWLuYfTMIV+
	4v7wO6ik/YJmncmnw8fnxOPP3MH5UxKcNSLmJLC85X2UeFnDfjSboLiVYzoJwXaSWdVVtu+D4R2nj
	aI9l1z6Zlm5GKvjrqRLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0zbx-000000098Fq-00Dx;
	Mon, 31 Aug 2026 10:51:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0zbu-000000098FP-3xIW
	for linux-riscv@lists.infradead.org;
	Mon, 31 Aug 2026 10:51:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1338B60215;
	Mon, 31 Aug 2026 10:51:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C8611F00A3D;
	Mon, 31 Aug 2026 10:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788173489;
	bh=7hL/ET5Qq3wr2P6zFL5txI55cnVWQQzZ2F/qHg0lYf4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=B13Jc/HwFvJynvpEddSdAjEGRTOiABRThBqmHHiE/4AiD0iQWYf3HCX//4rHRXK8I
	 gLVcoEf9n+ORgiBBpUVy2G0Zq8Wm4m0BykmnRfURD7sCFSidGdfPcF8IboCQB2JFAI
	 pJEqB1nMiACdRRQUBzV2PVPcFgm90SOE5Ho7YmlmaRbaRQtvOpvNjYol1CIc9hNaIV
	 rfC1wVbiQTl/bE5QGaLNmMcLxrRAtUnwzlX8bn8txjqLqOQI1+0/CEmJYJV2LpNy3D
	 AlS5BnRLIp5/un54LIxa5UGIhjYg2JPAwnxOwmzuYbSRTsXwPbzR5xY6AXfyDxBN5R
	 iDyF20bOAh7zA==
From: Conor Dooley <conor@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Valentina.FernandezAlanis@microchip.com
Subject: [PATCH v1 1/3] pinctrl: mpfs-mssio: fix whitespace in debugfs output
Date: Mon, 31 Aug 2026 11:50:57 +0100
Message-ID: <20260831105056.756259-6-conor@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831105056.756259-5-conor@kernel.org>
References: <20260831105056.756259-5-conor@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1029; i=conor.dooley@microchip.com; h=from:subject; bh=uG6lbsSheysd9Z70Hex7XhWgc/RhjnhbE9NFxwPVduo=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFlTY1b0z56vuP7oswNFk89+4Vs38Yro1riYH5NChI+bq 3oEfIma01HKwiDGxSArpsiSeLuvRWr9H5cdzj1vYeawMoEMYeDiFICJTE1hZFi8KcpY3XCdUUaX 68S3s2s4Wpdq7FX9rSHM5L/opN/DuYKMDHf3ffh9imuCb9Y+FpV9tv2BXTo9PIflX6ScYlqa2cZ 7gh8A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

The printout from mpfs_pinctrl_pinconf_dbg_show() is appended to
information from the core, so a leading space is required or the world
will end.

Fixes: 488d704ed7b7 ("pinctrl: add polarfire soc mssio pinctrl driver")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c b/drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c
index ea1026a0d22c..502624221aca 100644
--- a/drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c
+++ b/drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c
@@ -612,7 +612,7 @@ static void mpfs_pinctrl_pinconf_dbg_show(struct pinctrl_dev *pctrl_dev, struct
 	reg = mpfs_pinctrl_pin_to_iocfg_reg(pin);
 	offset = mpfs_pinctrl_pin_to_iocfg_offset(pin);
 
-	seq_printf(seq, "pin: %u ", pin);
+	seq_printf(seq, " pin: %u ", pin);
 	seq_printf(seq, "reg: %x offset: %u ", reg, offset);
 
 	if (reg < 0 || offset < 0)
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
