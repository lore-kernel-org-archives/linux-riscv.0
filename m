Return-Path: <SRS0=MB+m=T5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90732C28CC0
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 29 May 2019 04:26:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63E4521721
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 29 May 2019 04:26:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DF9gUMah";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="kTq5oKCO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63E4521721
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e0087am3iCaJquqHMUUK46CzdciN6TcWqQT8eHPi7ws=; b=DF9gUMahmgn4bU
	CQxxT1hMD0/v7T0xjVc+S7fP0VV3WCW/bGba8lfbpU2nFUNsF1tNNg9XE6NFCbmsQQffz4vHaPySJ
	rBDfvgESG0PH7rsQLSn9D5GYBt6gsy/TJURJSoibgaNcFDbeh4FgVTWPW2D9aFqQF04pd8k1vWtR/
	QvD/e8R8I1Pcz9DAL4bXJo+i3Lhxt5nmcc1/QSPu85RWJ7n9/pJ6gSe14LogwPvoovVFicgrAMpdS
	AgBS9DC3qxKBnwhTB+NEcFhmIahiJIf0aPUpdNUS4yiVd/x4B5sArV6xVyqnEbAeuSG2LNpj7ryFb
	0vREI2AI0XokFjbdgY5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVqAm-0005SA-6B; Wed, 29 May 2019 04:26:44 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVqAk-0005Rr-12
 for linux-riscv@lists.infradead.org; Wed, 29 May 2019 04:26:43 +0000
Received: by mail-pg1-x542.google.com with SMTP id d30so544046pgm.7
 for <linux-riscv@lists.infradead.org>; Tue, 28 May 2019 21:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id;
 bh=5JJ5fP/lDTAT9lV7xByh9EU/tkZg+0nZnzbUrujyoZg=;
 b=kTq5oKCOvb2JCjaJ13ybujn6O92eJItL/ZZRxZzq2f9s59vvAI5lkJSqmOB3CjQ0qD
 9u8MEgtx6tPOCi9fXdf0/Y4JGYAYxJ+IPb9C78+I2QwQOi0yGpa5pvWqLZ/FORR/RyY6
 63x5WeSHMoeExX+r6oIGbbIUmVsY9BdH3zSIsm5nO+9MEAncg1hT+CvrebHklrUYoIKm
 sP2GcxXbyzLkJdGqbOS1TJjrqYtqBNNC6VZPF3ELlMPG1sGxRnHdv4BYVn3rGPs3x+jf
 YW/3iMocgkhTd1hkEHr8Xky56S8fE1llF5tbygiELsel0yI2uN497rAQW8dpWZm8ACgI
 4kWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=5JJ5fP/lDTAT9lV7xByh9EU/tkZg+0nZnzbUrujyoZg=;
 b=HbBECywCJhx9CxGJ/1CbLoE+uKwmBcw3ab809IopeeB+Ug2Yr7ngnB1sNlIFff159b
 OcCUS4TcdeIp1PTLogc7ybOYRwqUwhbb227uz6oK4MBGdw2gT0StUSSuIzjXHBzOWLYJ
 s7t4ApjPK/pLkTkAhKEWXlCUHJcNhrXNLCfDoiYUyJGO8Ae3LpnhsgAeica3Qbwltdg/
 IS828OQSiEvE6vkbXzjFg0qStw2ocMX+JE1SRGU2CPXGd5nUYe8rO3e0DSQrPwjltfhP
 tlQ/Afl++g0Zwo1CYt1S+qSUX4HlBgYxnlbXWGWbWywsD5EoxMaqtUdr/wOY7kpuzeXs
 PUnw==
X-Gm-Message-State: APjAAAXXVa1Ey2O4YIc92jYGrH5HrqnI7/lCmd0qEBGwacZYDzjyh1BF
 O9DxbdF7tyDeFX347zCQ09CdJw==
X-Google-Smtp-Source: APXvYqz8+KopayMYqNIAnYzjwkQi92y0EfTJXP+WbfUiu3G6DyTGAMkJzIynLIfakB8aLVEH3oY7WA==
X-Received: by 2002:a65:56cc:: with SMTP id w12mr3084328pgs.415.1559104000681; 
 Tue, 28 May 2019 21:26:40 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id 128sm9217350pff.16.2019.05.28.21.26.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 28 May 2019 21:26:39 -0700 (PDT)
From: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, peter@korsgaard.com,
 andrew@lunn.ch, palmer@sifive.com, paul.walmsley@sifive.com,
 sagar.kadam@sifive.com, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v8 3/3] i2c-ocores: sifive: add polling mode workaround for
 FU540-C000 SoC.
Date: Wed, 29 May 2019 09:56:18 +0530
Message-Id: <1559103978-13852-1-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190528_212642_128916_7C088EBB 
X-CRM114-Status: GOOD (  15.07  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The i2c-ocore driver already has a polling mode interface.But it needs
a workaround for FU540 Chipset on HiFive unleashed board (RevA00).
There is an erratum in FU540 chip that prevents interrupt driven i2c
transfers from working, and also the I2C controller's interrupt bit
cannot be cleared if set, due to this the existing i2c polling mode
interface added in mainline earlier doesn't work, and CPU stall's
infinitely, when-ever i2c transfer is initiated.

Ref:
	commit dd7dbf0eb090 ("i2c: ocores: refactor setup for polling")

The workaround / fix under OCORES_FLAG_BROKEN_IRQ is particularly for
FU540-COOO SoC.

The polling function identifies a SiFive device based on the device node
and enables the workaround.

Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
---
 drivers/i2c/busses/i2c-ocores.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
index b334fa2..4117f1a 100644
--- a/drivers/i2c/busses/i2c-ocores.c
+++ b/drivers/i2c/busses/i2c-ocores.c
@@ -35,6 +35,7 @@ struct ocores_i2c {
 	int iobase;
 	u32 reg_shift;
 	u32 reg_io_width;
+	unsigned long flags;
 	wait_queue_head_t wait;
 	struct i2c_adapter adap;
 	struct i2c_msg *msg;
@@ -84,6 +85,8 @@ struct ocores_i2c {
 #define TYPE_GRLIB		1
 #define TYPE_SIFIVE_REV0	2
 
+#define OCORES_FLAG_BROKEN_IRQ BIT(1) /* Broken IRQ for FU540-C000 SoC */
+
 static void oc_setreg_8(struct ocores_i2c *i2c, int reg, u8 value)
 {
 	iowrite8(value, i2c->base + (reg << i2c->reg_shift));
@@ -236,9 +239,12 @@ static irqreturn_t ocores_isr(int irq, void *dev_id)
 	struct ocores_i2c *i2c = dev_id;
 	u8 stat = oc_getreg(i2c, OCI2C_STATUS);
 
-	if (!(stat & OCI2C_STAT_IF))
+	if (i2c->flags & OCORES_FLAG_BROKEN_IRQ) {
+		if ((stat & OCI2C_STAT_IF) && !(stat & OCI2C_STAT_BUSY))
+			return IRQ_NONE;
+	} else if (!(stat & OCI2C_STAT_IF)) {
 		return IRQ_NONE;
-
+	}
 	ocores_process(i2c, stat);
 
 	return IRQ_HANDLED;
@@ -353,6 +359,11 @@ static void ocores_process_polling(struct ocores_i2c *i2c)
 		ret = ocores_isr(-1, i2c);
 		if (ret == IRQ_NONE)
 			break; /* all messages have been transferred */
+		else {
+			if (i2c->flags & OCORES_FLAG_BROKEN_IRQ)
+				if (i2c->state == STATE_DONE)
+					break;
+		}
 	}
 }
 
@@ -595,6 +606,7 @@ static int ocores_i2c_probe(struct platform_device *pdev)
 {
 	struct ocores_i2c *i2c;
 	struct ocores_i2c_platform_data *pdata;
+	const struct of_device_id *match;
 	struct resource *res;
 	int irq;
 	int ret;
@@ -677,6 +689,14 @@ static int ocores_i2c_probe(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	if (irq == -ENXIO) {
 		ocores_algorithm.master_xfer = ocores_xfer_polling;
+
+		/*
+		 * Set in OCORES_FLAG_BROKEN_IRQ to enable workaround for
+		 * FU540-C000 SoC in polling mode.
+		 */
+		match = of_match_node(ocores_i2c_match, pdev->dev.of_node);
+		if (match && (long)match->data == TYPE_SIFIVE_REV0)
+			i2c->flags |= OCORES_FLAG_BROKEN_IRQ;
 	} else {
 		if (irq < 0)
 			return irq;
-- 
1.9.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
