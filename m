Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC63CE8347
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 14:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8fG1WALzXR8tx2OOCRugESP7ddhXkofN/gWQm02tBQw=; b=mx1GJuve2yxY4z
	6SHlz2GH/buvK7iy0phUlckd6ih83yAH3WbT87UNSi3y/LKLnHZp7G2JwBx6VyappLbbCO3GZPPxm
	/dCrxBFe0lKm6SLab8SsmeSumUU1NS9kSOiZPwIHoiQJBnD7shs8zA76YV8PDlIk/s4MR5GfC9GCR
	Mpj31N7ZTpsOS3FNoF97w+sOFRXqS9GxYr9gtYXxJVQAKWt1r89rxI9xbtN8cnOCB6l5U6SO1T7Cg
	b9CnTNcAzQouUA5a1Dniuze5FdaqU3faikHAyhYqTRVRCfstYP+M5D6et+fDu8BDe22jyi5HMhzLR
	vY7qSzpbE8JrhNpNl9nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svH7p-0000000HSTw-1xfq;
	Mon, 30 Sep 2024 14:11:45 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svGc3-0000000HKf2-2Vn5
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 13:38:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D62A0A42557;
	Mon, 30 Sep 2024 13:38:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47E7EC4CECE;
	Mon, 30 Sep 2024 13:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727703534;
	bh=B/VV63MwNx1qhR1X4eT8fuNwsJ15t+hyEuKa3vST/cY=;
	h=From:To:Cc:Subject:Date:From;
	b=D19Oy0epQowzvqI1yS46db9I9eiWJCdGOieekJ58ZPOsyVU6uBcJUVz2FzfjxeeuZ
	 FilzAXKmNtMYII33HMumRjKvAqbxyuMPbdyhSTd8E90Q4tx2u8pvuLJ73A77JJQje8
	 +A3zsa2/xo5qgZJe/LUkae8mVJtxxTaCFCvjCRBzQO9NwGBqheVio4f0/60JeZXleC
	 So6SvZnMWOcMK8oC05Y/a4JkQ7zdAojvDj9AAsZO8E8+qHhVtGexemv3fBmt23cFGl
	 taqRwz4KEMmMKh3xTKdt9UGqKvOva9/mtPWwD16t0AVp+X2ReEdzP3KA8aBaJH4qgo
	 FeOBnsCm4b48w==
From: Conor Dooley <conor@kernel.org>
To: linux-i2c@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] i2c: microchip-core: actually use repeated sends
Date: Mon, 30 Sep 2024 14:38:27 +0100
Message-ID: <20240930-uneasy-dorsal-1acda9227b0d@spud>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6485; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=QA08FTIV1GTEkwQtjktl709XqeTd7VgIcDB7m2evfOI=; b=kA0DAAgWeLQxh6CCYtIByyZiAGb6qdKj8OVYwTMi2GiRDPV5xfeiplIOanrok0j+sCJEIflJp Yh1BAAWCAAdFiEEYduOhBqv/ES4Q4zteLQxh6CCYtIFAmb6qdIACgkQeLQxh6CCYtIpgQEA/Cwr aP+0h61J4vCrQmBJT5AlI3KcG2su9WiQ2rR5QuEBAIov/ive9dDSq3/lZykZwC+Y23wszVayUhH gKUSlSFMK
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_063855_804381_DB4B4A3C 
X-CRM114-Status: GOOD (  23.70  )
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

At present, where repeated sends are intended to be used, the
i2c-microchip-core driver sends a stop followed by a start. Lots of i2c
devices must not malfunction in the face of this behaviour, because the
driver has operated like this for years! Try to keep track of whether or
not a repeated send is required, and suppress sending a stop in these
cases.

Fixes: 64a6f1c4987e ("i2c: add support for microchip fpga i2c controllers")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Andi Shyti <andi.shyti@kernel.org>
CC: Wolfram Sang <wsa@kernel.org>
CC: linux-riscv@lists.infradead.org
CC: linux-i2c@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 drivers/i2c/busses/i2c-microchip-corei2c.c | 124 ++++++++++++++++-----
 1 file changed, 96 insertions(+), 28 deletions(-)

diff --git a/drivers/i2c/busses/i2c-microchip-corei2c.c b/drivers/i2c/busses/i2c-microchip-corei2c.c
index 0b0a1c4d17cae..332dd14483c05 100644
--- a/drivers/i2c/busses/i2c-microchip-corei2c.c
+++ b/drivers/i2c/busses/i2c-microchip-corei2c.c
@@ -93,27 +93,35 @@
  * @base:		pointer to register struct
  * @dev:		device reference
  * @i2c_clk:		clock reference for i2c input clock
+ * @msg_queue:		pointer to the messages requiring sending
  * @buf:		pointer to msg buffer for easier use
  * @msg_complete:	xfer completion object
  * @adapter:		core i2c abstraction
  * @msg_err:		error code for completed message
  * @bus_clk_rate:	current i2c bus clock rate
  * @isr_status:		cached copy of local ISR status
+ * @total_num:		total number of messages to be sent/received
+ * @current_num:	index of the current message being sent/received
  * @msg_len:		number of bytes transferred in msg
  * @addr:		address of the current slave
+ * @restart_needed:	whether or not a repeated start is required after current message
  */
 struct mchp_corei2c_dev {
 	void __iomem *base;
 	struct device *dev;
 	struct clk *i2c_clk;
+	struct i2c_msg *msg_queue;
 	u8 *buf;
 	struct completion msg_complete;
 	struct i2c_adapter adapter;
 	int msg_err;
+	int total_num;
+	int current_num;
 	u32 bus_clk_rate;
 	u32 isr_status;
 	u16 msg_len;
 	u8 addr;
+	bool restart_needed;
 };
 
 static void mchp_corei2c_core_disable(struct mchp_corei2c_dev *idev)
@@ -222,6 +230,47 @@ static int mchp_corei2c_fill_tx(struct mchp_corei2c_dev *idev)
 	return 0;
 }
 
+static void mchp_corei2c_next_msg(struct mchp_corei2c_dev *idev)
+{
+	struct i2c_msg *this_msg;
+	u8 ctrl;
+
+	if (idev->current_num >= idev->total_num) {
+		complete(&idev->msg_complete);
+		return;
+	}
+
+	/*
+	 * If there's been an error, the isr needs to return control
+	 * to the "main" part of the driver, so as not to keep sending
+	 * messages once it completes and clears the SI bit.
+	 */
+	if (idev->msg_err) {
+		complete(&idev->msg_complete);
+		return;
+	}
+
+	this_msg = (idev->msg_queue)++;
+
+	if (idev->current_num < (idev->total_num - 1)) {
+		struct i2c_msg *next_msg = idev->msg_queue;
+
+		idev->restart_needed = next_msg->flags & I2C_M_RD;
+	} else {
+		idev->restart_needed = false;
+	}
+
+	idev->addr = i2c_8bit_addr_from_msg(this_msg);
+	idev->msg_len = this_msg->len;
+	idev->buf = this_msg->buf;
+
+	ctrl = readb(idev->base + CORE_I2C_CTRL);
+	ctrl |= CTRL_STA;
+	writeb(ctrl, idev->base + CORE_I2C_CTRL);
+
+	idev->current_num++;
+}
+
 static irqreturn_t mchp_corei2c_handle_isr(struct mchp_corei2c_dev *idev)
 {
 	u32 status = idev->isr_status;
@@ -247,10 +296,14 @@ static irqreturn_t mchp_corei2c_handle_isr(struct mchp_corei2c_dev *idev)
 		break;
 	case STATUS_M_SLAW_ACK:
 	case STATUS_M_TX_DATA_ACK:
-		if (idev->msg_len > 0)
+		if (idev->msg_len > 0) {
 			mchp_corei2c_fill_tx(idev);
-		else
-			last_byte = true;
+		} else {
+			if (idev->restart_needed)
+				finished = true;
+			else
+				last_byte = true;
+		}
 		break;
 	case STATUS_M_TX_DATA_NACK:
 	case STATUS_M_SLAR_NACK:
@@ -287,7 +340,7 @@ static irqreturn_t mchp_corei2c_handle_isr(struct mchp_corei2c_dev *idev)
 		mchp_corei2c_stop(idev);
 
 	if (last_byte || finished)
-		complete(&idev->msg_complete);
+		mchp_corei2c_next_msg(idev);
 
 	return IRQ_HANDLED;
 }
@@ -311,21 +364,48 @@ static irqreturn_t mchp_corei2c_isr(int irq, void *_dev)
 	return ret;
 }
 
-static int mchp_corei2c_xfer_msg(struct mchp_corei2c_dev *idev,
-				 struct i2c_msg *msg)
+static int mchp_corei2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
+			     int num)
 {
-	u8 ctrl;
+	struct mchp_corei2c_dev *idev = i2c_get_adapdata(adap);
+	struct i2c_msg *this_msg = msgs;
 	unsigned long time_left;
-
-	idev->addr = i2c_8bit_addr_from_msg(msg);
-	idev->msg_len = msg->len;
-	idev->buf = msg->buf;
-	idev->msg_err = 0;
-
-	reinit_completion(&idev->msg_complete);
+	u8 ctrl;
 
 	mchp_corei2c_core_enable(idev);
 
+	/*
+	 * The isr controls the flow of a transfer, this info needs to be saved
+	 * to a location that it can access the queue information from.
+	 */
+	idev->restart_needed = false;
+	idev->msg_queue = msgs;
+	idev->total_num = num;
+	idev->current_num = 0;
+
+	/*
+	 * But the first entry to the isr is triggered by the start in this
+	 * function, so the first message needs to be "dequeued".
+	 */
+	idev->addr = i2c_8bit_addr_from_msg(this_msg);
+	idev->msg_len = this_msg->len;
+	idev->buf = this_msg->buf;
+	idev->msg_err = 0;
+
+	if (idev->total_num > 1) {
+		struct i2c_msg *next_msg = msgs + 1;
+
+		idev->restart_needed = next_msg->flags & I2C_M_RD;
+	}
+
+	idev->current_num++;
+	idev->msg_queue++;
+
+	reinit_completion(&idev->msg_complete);
+
+	/*
+	 * Send the first start to pass control to the isr
+	 */
 	ctrl = readb(idev->base + CORE_I2C_CTRL);
 	ctrl |= CTRL_STA;
 	writeb(ctrl, idev->base + CORE_I2C_CTRL);
@@ -335,20 +415,8 @@ static int mchp_corei2c_xfer_msg(struct mchp_corei2c_dev *idev,
 	if (!time_left)
 		return -ETIMEDOUT;
 
-	return idev->msg_err;
-}
-
-static int mchp_corei2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
-			     int num)
-{
-	struct mchp_corei2c_dev *idev = i2c_get_adapdata(adap);
-	int i, ret;
-
-	for (i = 0; i < num; i++) {
-		ret = mchp_corei2c_xfer_msg(idev, msgs++);
-		if (ret)
-			return ret;
-	}
+	if (idev->msg_err)
+		return idev->msg_err;
 
 	return num;
 }
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
