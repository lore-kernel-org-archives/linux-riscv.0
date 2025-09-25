Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BEACAC5AE
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Sep 2025 02:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XG805CdwDJttCYFzy+nAXMxiefNfhxeF+5IGuZ+pqiw=; b=Fzel4LdTfyRA0N
	Y438mYKaNjQpp/eT1w/56kvvb02eZIQiGsRGBtHQ1Xmxahd3OqUqN+mUSrmIS7cOpdjXOYL9iiUOK
	NM+8ETpVBntl8PHb1NBIIQ8Lg+gzVMRHlDzI4AMYuP3eK9RvCE2MC4TS1BeriWYOKe9H45eY3WBhL
	Ok4feeRSDOp98/u0DE/M4S4RLGPpaMg3KRrnBbqSHQaLVigrEjKMBnagyL4cal8dzY5gBowmWnXiS
	20gjGOCdIzpB6Xg12bSMSKttCVIna69gbjERPTzJPVvt1IL9Sv1bHYizV159H7V1effaBY6NIxNxK
	pReEhEARzQZ82sXB4RZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1bKx-00000005F04-2vpp;
	Thu, 25 Sep 2025 02:03:59 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1bKv-00000005EuQ-0Y4e
	for linux-riscv@lists.infradead.org;
	Thu, 25 Sep 2025 02:03:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758765782;
	bh=kT03+4XnqG6gWDiI6gMB6mOz1u6Ts2EmdzOH9ktye3s=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=or2K6Ijer70uu24h61YM26OD4D9PbBv7vY3CgTDefQOibHWX1x2QktsCjV05LPiko
	 CzAA2yykRgr6rRzOduHmmeEpexf9aZ95XQ1/TGivKl/b8tGwNxAE8i5aoyulV0H72e
	 DKrcNC/235nIogIwRimnQhQfAbc2ULC5TD44nGiw=
X-QQ-mid: zesmtpsz6t1758765774t5c847d52
X-QQ-Originating-IP: kUqUBzwMIEQ7wIMl1p0vaSbRBpPIrETjOuVnhxEmOqI=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 25 Sep 2025 10:02:52 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14942359237403717418
EX-QQ-RecipientCnt: 9
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 25 Sep 2025 10:02:30 +0800
Subject: [PATCH v2 6/6] i2c: spacemit: introduce pio for k1
MIME-Version: 1.0
Message-Id: <20250925-k1-i2c-atomic-v2-6-46dc13311cda@linux.spacemit.com>
References: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
In-Reply-To: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
To: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758765753; l=10126;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=WK0ODVtAckVC5gAjeOa1JbbwCUTmZSDbwmflz2CuEW0=;
 b=5Fayp9ctc+NkJNMQtwtCLgYAFltauMCi0e4zvbb3G744ck4+b4zPUOgI2HU5KPYB9JKNjPco1
 KmdFs9WAhWgC9NStyTaH3L622l1Jpcp0oVS5UBqV95qKkjSw+vMAQ8j
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: Ngwq0BL9nhqbdHjScmDR35XcKN9jtmQmlegvbfL/AQrkleNQmb1V7bZM
	HfREaylmbRl5vtrNA+u+FFjSLnajccurTBadfpj72NiVyE/5/YB1WJDnQ7phPzbL5pjUPoo
	gB4oYP9tQvgIoy9MCvHaGIPoq5I43vVm1QEsFwf0uHiQrJBx9scvL7f5Y8+UMAKHH08qtmF
	3mA7J3Lb9umRN+OUWDuuifAU3xu/4rdTJSXTj6gI8iLIczJjWCP8MHjD5s31RsUYsRkoVKP
	ImcwqO1Wf+p0osuecV4rktZqZyMF6PvYiBGlvx8kND+pNaKJ703qLwEd7vAXO+fJrwHEYHJ
	aXhF5RaKsd7EYO3Vz5gGhSTtV1mvE2NWLVyVXmDdS3yhfzj7ALT3L+lfXkKs43GCcioCfJt
	SS17Jp8Q9tfvgK55r7fwYXaX6m33n64/gjbhNIiowt6KIfpP9SSHB1D0FF5XsTMOMxi6nfA
	LSrHbLiYveqhOGGcM51B7AT53OxfKNRctF+rLdUAussoNuCh6TdeFl06nfULHTUthOBwfPZ
	AFkCTq1mJP4NAl9RfTvkupIXIc4PJl9g7ns/0j670kfrpMqWPGw0tnm0Jb0DIgn7eG+G0vp
	6KA9gXDMLdgSAiqrQs6BgaVSaXqsIr4gnEopmWr2ITrOShGyi/dYEjEnFqZY2N9HspnHwm5
	Ai199ZTOaoZFI/zsvKTd36+KyvaJe35qhGRe0s1iPgno5waBr9s5xfjcvM19bxJVUhYM9Y0
	VCY+ZpVImLUu3ldxk8Yotg4GrGw5burueiwothHmM6rOEO/45+0rH0s1u3p9r3E90yanPqS
	ldv0iSNxT1aEaq5tw9QCT3mV+erD+ftLSIhA4z1SB7IG7dsh3JWHrKRxGnI4gavYj36fuQZ
	eWLK3i1oQlutTbsJf0DhGN0vdVYspJu2rWyUkqHE/LFGkV2DC389WpfXP0ADrfT0g/mOLgW
	7DaKVD/4yoGrLF5U9hJuGtCH/aUUgDb1ciEud0k4rCVQqPE9kDU2LaKuy2jKtF5+yhg6NbZ
	uv5iV4915QrvMW85LPcf9n8nlRWAJWJOigHkRengj5zs35A3V50Shy5TcDdTMXTqIHYxO/o
	MMN5qFrzRFm3QvKQUkiMrpgQF8LFadhL0bG/RLUZF9RAYs2/xnTEJKGRu5LDuvJeT8TTOeE
	v7UU
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_190357_567662_1D5D01F3 
X-CRM114-Status: GOOD (  21.50  )
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

This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
enabling the use of I2C with interrupts disabled.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/i2c/busses/i2c-k1.c | 164 +++++++++++++++++++++++++++++++++++++-------
 1 file changed, 140 insertions(+), 24 deletions(-)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index 6b918770e612e098b8ad17418f420d87c94df166..e403eb7d6f329f4fe5c5242f94cc21094dff105c 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -97,6 +97,9 @@
 
 #define SPACEMIT_BUS_RESET_CLK_CNT_MAX		9
 
+/* Constants */
+#define SPACEMIT_WAIT_TIMEOUT      1000 /* ms */
+
 enum spacemit_i2c_state {
 	SPACEMIT_STATE_IDLE,
 	SPACEMIT_STATE_START,
@@ -125,6 +128,7 @@ struct spacemit_i2c_dev {
 
 	enum spacemit_i2c_state state;
 	bool read;
+	bool is_pio;
 	struct completion complete;
 	u32 status;
 };
@@ -206,9 +210,14 @@ static int spacemit_i2c_wait_bus_idle(struct spacemit_i2c_dev *i2c)
 	if (!(val & (SPACEMIT_SR_UB | SPACEMIT_SR_IBB)))
 		return 0;
 
-	ret = readl_poll_timeout(i2c->base + SPACEMIT_ISR,
-				 val, !(val & (SPACEMIT_SR_UB | SPACEMIT_SR_IBB)),
-				 1500, SPACEMIT_I2C_BUS_BUSY_TIMEOUT);
+	if (!i2c->is_pio)
+		ret = readl_poll_timeout(i2c->base + SPACEMIT_ISR,
+					 val, !(val & (SPACEMIT_SR_UB | SPACEMIT_SR_IBB)),
+					 1500, SPACEMIT_I2C_BUS_BUSY_TIMEOUT);
+	else
+		ret = readl_poll_timeout_atomic(i2c->base + SPACEMIT_ISR,
+						val, !(val & (SPACEMIT_SR_UB | SPACEMIT_SR_IBB)),
+						1500, SPACEMIT_I2C_BUS_BUSY_TIMEOUT);
 	if (ret)
 		spacemit_i2c_reset(i2c);
 
@@ -226,7 +235,7 @@ static void spacemit_i2c_check_bus_release(struct spacemit_i2c_dev *i2c)
 
 static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
 {
-	u32 val;
+	u32 val = 0;
 
 	/*
 	 * Unmask interrupt bits for all xfer mode:
@@ -234,7 +243,8 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
 	 * For transaction complete signal, we use master stop
 	 * interrupt, so we don't need to unmask SPACEMIT_CR_TXDONEIE.
 	 */
-	val = SPACEMIT_CR_BEIE | SPACEMIT_CR_ALDIE;
+	if (!i2c->is_pio)
+		val = SPACEMIT_CR_BEIE | SPACEMIT_CR_ALDIE;
 
 	/*
 	 * Unmask interrupt bits for interrupt xfer mode:
@@ -244,7 +254,8 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
 	 * i2c_start function.
 	 * Otherwise, it will cause an erroneous empty interrupt before i2c_start.
 	 */
-	val |= SPACEMIT_CR_DRFIE;
+	if (!i2c->is_pio)
+		val |= SPACEMIT_CR_DRFIE;
 
 	if (i2c->clock_freq == SPACEMIT_I2C_MAX_FAST_MODE_FREQ)
 		val |= SPACEMIT_CR_MODE_FAST;
@@ -256,7 +267,10 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
 	val |= SPACEMIT_CR_SCLE;
 
 	/* enable master stop detected */
-	val |= SPACEMIT_CR_MSDE | SPACEMIT_CR_MSDIE;
+	val |= SPACEMIT_CR_MSDE;
+
+	if (!i2c->is_pio)
+		val |= SPACEMIT_CR_MSDIE;
 
 	writel(val, i2c->base + SPACEMIT_ICR);
 
@@ -293,10 +307,54 @@ static void spacemit_i2c_start(struct spacemit_i2c_dev *i2c)
 	/* send start pulse */
 	val = readl(i2c->base + SPACEMIT_ICR);
 	val &= ~SPACEMIT_CR_STOP;
-	val |= SPACEMIT_CR_START | SPACEMIT_CR_TB | SPACEMIT_CR_DTEIE;
+	val |= SPACEMIT_CR_START | SPACEMIT_CR_TB;
+
+	if (!i2c->is_pio)
+		val |= SPACEMIT_CR_DTEIE;
+
 	writel(val, i2c->base + SPACEMIT_ICR);
 }
 
+static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid);
+static int spacemit_i2c_wait_pio_xfer(struct spacemit_i2c_dev *i2c)
+{
+	u32 msec = jiffies_to_msecs(i2c->adapt.timeout);
+	ktime_t timeout = ktime_add_ms(ktime_get(), msec);
+	int ret;
+
+	while (i2c->unprocessed && ktime_compare(ktime_get(), timeout) < 0) {
+		udelay(10);
+		i2c->status = readl(i2c->base + SPACEMIT_ISR);
+
+		spacemit_i2c_clear_int_status(i2c, i2c->status);
+
+		if (!(i2c->status & SPACEMIT_SR_IRF) && !(i2c->status & SPACEMIT_SR_ITE))
+			continue;
+
+		spacemit_i2c_irq_handler(0, i2c);
+
+		i2c->status = readl(i2c->base + SPACEMIT_ISR);
+
+		/*
+		 * This is the last byte to write of the current message.
+		 * If we do not wait here, control will proceed directly to start(),
+		 * which would overwrite the current data.
+		 */
+		if (!i2c->read && !i2c->unprocessed) {
+			ret = readl_poll_timeout(i2c->base + SPACEMIT_ISR,
+						i2c->status, i2c->status & SPACEMIT_SR_ITE,
+						30, 1000);
+			if (ret)
+				return 0;
+		}
+	}
+
+	if (i2c->unprocessed)
+		return 0;
+
+	return 1;
+}
+
 static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
 {
 	unsigned long time_left;
@@ -310,10 +368,28 @@ static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
 
 		reinit_completion(&i2c->complete);
 
-		spacemit_i2c_start(i2c);
+		if (i2c->is_pio) {
+			/* We disable the interrupt to avoid unintended spurious triggers. */
+			disable_irq(i2c->irq);
+
+			/*
+			 * The K1 I2C controller has a quirk:
+			 * when doing PIO transfers, the status register must be cleared
+			 * of all other bits before issuing a START.
+			 * Failing to do so will prevent the transfer from working properly.
+			 */
+			spacemit_i2c_clear_int_status(i2c, SPACEMIT_I2C_INT_STATUS_MASK);
+
+			spacemit_i2c_start(i2c);
+			time_left = spacemit_i2c_wait_pio_xfer(i2c);
+
+			enable_irq(i2c->irq);
+		} else {
+			spacemit_i2c_start(i2c);
+			time_left = wait_for_completion_timeout(&i2c->complete,
+								i2c->adapt.timeout);
+		}
 
-		time_left = wait_for_completion_timeout(&i2c->complete,
-							i2c->adapt.timeout);
 		if (!time_left) {
 			dev_err(i2c->dev, "msg completion timeout\n");
 			spacemit_i2c_conditionally_reset_bus(i2c);
@@ -341,6 +417,9 @@ static bool spacemit_i2c_is_last_msg(struct spacemit_i2c_dev *i2c)
 
 static void spacemit_i2c_handle_write(struct spacemit_i2c_dev *i2c)
 {
+	if (!(i2c->status & SPACEMIT_SR_ITE))
+		return;
+
 	/* if transfer completes, SPACEMIT_ISR will handle it */
 	if (i2c->status & SPACEMIT_SR_MSD)
 		return;
@@ -353,14 +432,20 @@ static void spacemit_i2c_handle_write(struct spacemit_i2c_dev *i2c)
 
 	/* SPACEMIT_STATE_IDLE avoids trigger next byte */
 	i2c->state = SPACEMIT_STATE_IDLE;
-	complete(&i2c->complete);
+
+	if (!i2c->is_pio)
+		complete(&i2c->complete);
 }
 
 static void spacemit_i2c_handle_read(struct spacemit_i2c_dev *i2c)
 {
+	if (!(i2c->status & SPACEMIT_SR_IRF))
+		return;
+
 	if (i2c->unprocessed) {
 		*i2c->msg_buf++ = readl(i2c->base + SPACEMIT_IDBR);
 		i2c->unprocessed--;
+		return;
 	}
 
 	/* if transfer completes, SPACEMIT_ISR will handle it */
@@ -373,7 +458,9 @@ static void spacemit_i2c_handle_read(struct spacemit_i2c_dev *i2c)
 
 	/* SPACEMIT_STATE_IDLE avoids trigger next byte */
 	i2c->state = SPACEMIT_STATE_IDLE;
-	complete(&i2c->complete);
+
+	if (!i2c->is_pio)
+		complete(&i2c->complete);
 }
 
 static void spacemit_i2c_handle_start(struct spacemit_i2c_dev *i2c)
@@ -408,7 +495,9 @@ static void spacemit_i2c_err_check(struct spacemit_i2c_dev *i2c)
 	spacemit_i2c_clear_int_status(i2c, SPACEMIT_I2C_INT_STATUS_MASK);
 
 	i2c->state = SPACEMIT_STATE_IDLE;
-	complete(&i2c->complete);
+
+	if (!i2c->is_pio)
+		complete(&i2c->complete);
 }
 
 static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
@@ -416,13 +505,20 @@ static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
 	struct spacemit_i2c_dev *i2c = devid;
 	u32 status, val;
 
-	status = readl(i2c->base + SPACEMIT_ISR);
-	if (!status)
-		return IRQ_HANDLED;
+	/*
+	 * In PIO mode, do not read status again.
+	 * It has already been read in wait_pio_xfer(),
+	 * and reading it clears some bits.
+	 */
+	if (!i2c->is_pio) {
+		status = readl(i2c->base + SPACEMIT_ISR);
+		if (!status)
+			return IRQ_HANDLED;
 
-	i2c->status = status;
+		i2c->status = status;
 
-	spacemit_i2c_clear_int_status(i2c, status);
+		spacemit_i2c_clear_int_status(i2c, status);
+	}
 
 	if (i2c->status & SPACEMIT_SR_ERR)
 		goto err_out;
@@ -445,7 +541,10 @@ static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
 	}
 
 	if (i2c->state != SPACEMIT_STATE_IDLE) {
-		val |= SPACEMIT_CR_TB | SPACEMIT_CR_ALDIE;
+		val |= SPACEMIT_CR_TB;
+		if (i2c->is_pio)
+			val |= SPACEMIT_CR_ALDIE;
+
 
 		if (spacemit_i2c_is_last_msg(i2c)) {
 			/* trigger next byte with stop */
@@ -479,15 +578,21 @@ static void spacemit_i2c_calc_timeout(struct spacemit_i2c_dev *i2c)
 	i2c->adapt.timeout = usecs_to_jiffies(timeout + USEC_PER_SEC / 10) / i2c->msg_num;
 }
 
-static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num)
+static inline int
+spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num, bool is_pio)
 {
 	struct spacemit_i2c_dev *i2c = i2c_get_adapdata(adapt);
 	int ret;
 
+	i2c->is_pio = is_pio;
+
 	i2c->msgs = msgs;
 	i2c->msg_num = num;
 
-	spacemit_i2c_calc_timeout(i2c);
+	if (!i2c->is_pio)
+		spacemit_i2c_calc_timeout(i2c);
+	else
+		i2c->adapt.timeout = SPACEMIT_WAIT_TIMEOUT;
 
 	spacemit_i2c_init(i2c);
 
@@ -506,18 +611,29 @@ static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, in
 
 	if (ret == -ETIMEDOUT || ret == -EAGAIN)
 		dev_err(i2c->dev, "i2c transfer failed, ret %d err 0x%lx\n",
-			  ret, i2c->status & SPACEMIT_SR_ERR);
+			ret, i2c->status & SPACEMIT_SR_ERR);
 
 	return ret < 0 ? ret : num;
 }
 
+static int spacemit_i2c_int_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num)
+{
+	return spacemit_i2c_xfer(adapt, msgs, num, false);
+}
+
+static int spacemit_i2c_pio_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num)
+{
+	return spacemit_i2c_xfer(adapt, msgs, num, true);
+}
+
 static u32 spacemit_i2c_func(struct i2c_adapter *adap)
 {
 	return I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);
 }
 
 static const struct i2c_algorithm spacemit_i2c_algo = {
-	.xfer = spacemit_i2c_xfer,
+	.xfer = spacemit_i2c_int_xfer,
+	.xfer_atomic = spacemit_i2c_pio_xfer,
 	.functionality = spacemit_i2c_func,
 };
 

-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
