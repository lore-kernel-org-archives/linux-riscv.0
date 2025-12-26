Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5157EE7AD77
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Dec 2025 03:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F6DKSb1ncE/h3594izCREg1N1kWcLRnYrDByErTLq0Q=; b=J2zRAMD1ol4Vn8
	RW2I7c5drOhSiLZVw66QLfioZQwXXLTE0vElDQ1zWhRz4ROE3+Aibncrl6g6jnbxt0nTp5vEV2WeV
	VATwrKkSOLvdG40LiNKLOK7ryPrR2oIlja4im3uMHG6iRt6cWurl4TGRtXGFRWdddk663z15OLsvj
	cwBWElGGAIEeK+6TfSvIu8LhdDN7gVOnycDnXqvWrsByFRVPbXMqoJPV8R3F/OiMx+NsaMTQQrj65
	eCBt1CHAW0iZZljxMV4MkU7HTg3yA9qwCUUXV2lszDacMwncoS8mdinJoLSt2Si3ddP9x/UnItjhx
	v8oylrz0W1bCo5ujxnqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYyZ7-00000000rpU-20LN;
	Fri, 26 Dec 2025 03:32:33 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYyZ4-00000000rng-35ci
	for linux-riscv@lists.infradead.org;
	Fri, 26 Dec 2025 03:32:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766719885;
	bh=aJ4KbVwTm/UZYncrS6DVCR6Osl5S8qtsOk2euH2+xhY=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=ZkKV/BAQB2ZZ5dQcHgazjpthXnoOA6MoOMgyGq9wIgtSfZYvOOXC6waqXDm+c+7KG
	 5l08jfkmdAjXlouPQg9ltCqoDgQ7eRiyaCAnqhq4g6v+GoJ+b6v8mqzL3Vqxlvp3QM
	 yk5vE20hOSy9qO1tIFuIeCQr85g/kkZ9R5nCAmmo=
X-QQ-mid: zesmtpgz4t1766719876t2818b4a8
X-QQ-Originating-IP: GVqNnEgGVrWRpaQ4/MlqFmrkZBa9kRaQb1vTLZOCc6w=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 26 Dec 2025 11:31:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12577097459027577478
EX-QQ-RecipientCnt: 11
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Fri, 26 Dec 2025 11:31:10 +0800
Subject: [PATCH v5 1/2] i2c: spacemit: replace i2c_xfer_msg()
MIME-Version: 1.0
Message-Id: <20251226-k1-i2c-atomic-v5-1-023c798c5523@linux.spacemit.com>
References: <20251226-k1-i2c-atomic-v5-0-023c798c5523@linux.spacemit.com>
In-Reply-To: <20251226-k1-i2c-atomic-v5-0-023c798c5523@linux.spacemit.com>
To: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Aurelien Jarno <aurelien@aurel32.net>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766719870; l=2743;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=7T/fWidY7TkkLemcNsuF9cs4Hz0O2p7njuQWqHTQH3Y=;
 b=ySGLpplNpU1DqHIZZYg4EffVgVVbB/dARvPY/VsVZaZRFOUhoisKr2fvjG/LEcjKNS/3N/13C
 SAFUlo6pZprCN0pxWxqGUqCwbNNuVq7xITDieOnx37KsycNzPobBRd3
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OO7TVYz6O/WsNhlfMn4dOW1rJ3ap/PXzwoCEfRxCVSL9aGM70Jtupqw1
	KLDPv7auGvnEw36NDY1XgCtkehjqG/m7lF62DhinmTSJPvIflIXkKWu1LHsktt2Tt5FluQp
	EWJImm931aMbl79da2d4VAfQtwCwzIcVK17cMgHv67xbZno7+NEWal/Z5tJvBfNAA4Bv5/y
	NNW4hci1E45TkTRaTx9+fbLfqU3tjThJTXn0DpynOBHb5JI3ZkkXUd4JkVUbdkHg6Y85tUw
	O80HLi3ghhw7c76UK3gbJm78xCBndTV9KNrSittRaon2oZ1mAYHVLqhgwPxgzQLNW8Jkjea
	82QUxiuk7XJ5fd/p1oa8bauSvaEFBNMyY2DUi68ePSqZw5PtWc5ScF/w1r4rA1JCzkAnNxv
	OdycIQBerab6nv6/W+yg9sITDFv1kjpGil8IBJy2CMb/o9BnPVNy4nB00+NkeEClfD1rwbX
	XYAzNK5stxtTuKe6ghhcfIpXdQsFmoqsbvNotjS7PIwbdyqs6lqRxd9ZyCaxgdpdIVwyaYD
	6eF0jv1z0FGsfUYdEuUG1yBtNKNBZ+pI0AwVMALnUaFFxAGxdEqrQO0BqJDrsJImzC8vSPg
	xHrZUhICV1PWXtib3gM5KarImxnOdkLDQL1c0pRsQ2XaogONjyqgBMF9MOUC3lPekPZVSdj
	0U6frGUEf6BvAlC4fyk+wod3sOfwOrCeqpuptwuJZP7+QtlSeNf07VIUT3hnY1kcd1gHVC+
	d3wJc5vk5Z/BTTxDc7tleJnLpgUnpl+h0RsRHKK5eksEnip+Cwxhj98/Fw0nNWGKyUVCE22
	6GgZCMAGHslThqTdymbJ97aSQasbUXWwNO/RSJVAizxg7sIxRaagEMwopsE6Sn0+J4cfN3m
	pPi9mXfrbIZtlASI1c0+eUTVCLcE0M5kBL9nisGZSJ9JJMwZtfPjKs7AAyOWaOknWiYnX4g
	e35z3frOY/xr9nRgzRcfBampyzmTnYDVfqsPLepG2+9eBVcLaVR7bGz+I5Dsa+N2GV4YcL8
	HzUI7NgIOB7uhoZ40aL0awBAnSAjQIbTAS9mrTkNbve46N88O62fK3ArdK9OJAyt2hOkC62
	AHE5wxSjqdSIhpgGb3OsBCzD/7Zxdjky+dh6i2dzyv8kVYlEcue1dMsGjmO5loRcpvqoJzZ
	WBFi
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_193231_308761_E22DEF78 
X-CRM114-Status: GOOD (  12.92  )
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

The upcoming PIO support requires a wait_pio_xfer() helper, which is
invoked from xfer_msg().

Since wait_pio_xfer() depends on err_check(), move the definition of
xfer_msg() after err_check() to avoid a forward declaration of
err_check().

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/i2c/busses/i2c-k1.c | 62 ++++++++++++++++++++++-----------------------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index d42c03ef5db5984ea8e06b3d7eb485b4f899e616..accef6653b56bd3505770328af17e441fad613a7 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -304,37 +304,6 @@ static void spacemit_i2c_start(struct spacemit_i2c_dev *i2c)
 	writel(val, i2c->base + SPACEMIT_ICR);
 }
 
-static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
-{
-	unsigned long time_left;
-	struct i2c_msg *msg;
-
-	for (i2c->msg_idx = 0; i2c->msg_idx < i2c->msg_num; i2c->msg_idx++) {
-		msg = &i2c->msgs[i2c->msg_idx];
-		i2c->msg_buf = msg->buf;
-		i2c->unprocessed = msg->len;
-		i2c->status = 0;
-
-		reinit_completion(&i2c->complete);
-
-		spacemit_i2c_start(i2c);
-
-		time_left = wait_for_completion_timeout(&i2c->complete,
-							i2c->adapt.timeout);
-		if (!time_left) {
-			dev_err(i2c->dev, "msg completion timeout\n");
-			spacemit_i2c_conditionally_reset_bus(i2c);
-			spacemit_i2c_reset(i2c);
-			return -ETIMEDOUT;
-		}
-
-		if (i2c->status & SPACEMIT_SR_ERR)
-			return spacemit_i2c_handle_err(i2c);
-	}
-
-	return 0;
-}
-
 static bool spacemit_i2c_is_last_msg(struct spacemit_i2c_dev *i2c)
 {
 	if (i2c->msg_idx != i2c->msg_num - 1)
@@ -418,6 +387,37 @@ static void spacemit_i2c_err_check(struct spacemit_i2c_dev *i2c)
 	complete(&i2c->complete);
 }
 
+static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
+{
+	unsigned long time_left;
+	struct i2c_msg *msg;
+
+	for (i2c->msg_idx = 0; i2c->msg_idx < i2c->msg_num; i2c->msg_idx++) {
+		msg = &i2c->msgs[i2c->msg_idx];
+		i2c->msg_buf = msg->buf;
+		i2c->unprocessed = msg->len;
+		i2c->status = 0;
+
+		reinit_completion(&i2c->complete);
+
+		spacemit_i2c_start(i2c);
+
+		time_left = wait_for_completion_timeout(&i2c->complete,
+							i2c->adapt.timeout);
+		if (!time_left) {
+			dev_err(i2c->dev, "msg completion timeout\n");
+			spacemit_i2c_conditionally_reset_bus(i2c);
+			spacemit_i2c_reset(i2c);
+			return -ETIMEDOUT;
+		}
+
+		if (i2c->status & SPACEMIT_SR_ERR)
+			return spacemit_i2c_handle_err(i2c);
+	}
+
+	return 0;
+}
+
 static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
 {
 	struct spacemit_i2c_dev *i2c = devid;

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
