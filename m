Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D9E8CAC5A5
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Sep 2025 02:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LwULypKlqCwEsLOCwzVs716X6lykaWWd9At3BoheuVo=; b=XJy2Ls5xUHGLgv
	e4nzRyF9rDoRpcfiidX+AquKhgug/W3OSx7nZgEPja6cTxWDbz66HtUYkZB4ajkIn1NkRCgu2RoQx
	/qzsDNeAqcnsXgvFAYNXVFBusDL9FRH2Ux1O3XIwFWQBj6w5tuxpwbCnqj92bR1BkNPMTTPFEm9FN
	EeZYBaUlq1Vq8oYe/ShsT3PPD5Bwuz9zn2Of/uzd6Z9y4XuwSvpYHSXf1GfXit7a0BR+3E0O9wuKw
	ugI+KEahqX7zT2u56rgWpoDgajskBO59ElnepUga4oGRrUjINTRiqII52OAVjnXZJp0JS5rFWVgy/
	zzBnFSl0uzwNdXvDW6lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1bKi-00000005EvG-0nFi;
	Thu, 25 Sep 2025 02:03:44 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1bKe-00000005EtZ-2JKn
	for linux-riscv@lists.infradead.org;
	Thu, 25 Sep 2025 02:03:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758765766;
	bh=6HiClnou0nH6C3uh9A5W6JJdfMjsorNR8TwVlwrmpiI=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=o/zX0XCPkfI7q9OW2VpbdDK4vWM8l0IlWl0cD8TyJMnqqKPnAUTc3hvrI99c9fS1n
	 tsqfy3EY8IAkdcKAcoypo1MYXr98DSDnxWU3xxG5r58Q1MFTe75EHpOxtV7ISfGuV0
	 vT/5mqh3vAWNObQfyNvJjLx0qpUqdCkDN8K04V14=
X-QQ-mid: esmtpgz10t1758765765t5102a920
X-QQ-Originating-IP: Z7YqWUUkcsKFSs6xAN7RT58+TlKj3vGC/pMbOsWnz6c=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 25 Sep 2025 10:02:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11634990285186739956
EX-QQ-RecipientCnt: 10
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 25 Sep 2025 10:02:27 +0800
Subject: [PATCH v2 3/6] i2c: spacemit: disable SDA glitch fix to avoid
 restart delay
MIME-Version: 1.0
Message-Id: <20250925-k1-i2c-atomic-v2-3-46dc13311cda@linux.spacemit.com>
References: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
In-Reply-To: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
To: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Aurelien Jarno <aurelien@aurel32.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758765753; l=2454;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=/fqMb32wsVo9/6JmtmD4yszqbt0NSqRc/0EKOr4c+p4=;
 b=jiUE8EP+MWVQPxo7jJUbbQ6aP+ZcLjlh/v6BRMezRH0J5Pr03xLCE+8cgrFLkwzQ7yBVp9ssV
 jNTD0XFi7EHAwSkz54ET6BxMqNQJ11WcpWXHJWdvtIyB8ULzXV5P8iN
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MW5S8H8h8jGb339dTgarddnbb+99hEByb8I7kqns+RefRunh1n8jY1dy
	YEtE+WzN6plvs8dsnPzgP9dHjBBd33RaMHRHXEBz3oc6oEX5UjZLg+Oe6X4rP9vD45pF7rq
	tk1QL5GJJrxGzScVgXqaykkbW2GAnQA6IGCvJ1aBdfnYvs7uLn03hPssam2oBN8XttabW8r
	0/kUVwc/QKMEgujyXvWL4LkeTq/yAj00RpJBL44Ztjwmjl4mM+LfRaq2jfu7hrFJOyNGAGL
	JIHk4E+UOs30EPiyJ+GaFP7a1p5Z2u3ljwEKKKWhVQiDnC6K9oWOND0EHw5+kFr7xOSuv+1
	WZD9UHZ8CMybXUacCWgBiAUwglBIJ4xJlk2usPD/VpxIbpz7bT/iQqoCKF1rj8kdPbihxh8
	dxsahjS2XF2zA8KEZ1DZ96UG8ReRK7df8rDIR/pZaBmUerv9FWByun4lMz3cCjMftGPewre
	zmfZj1tooc5wPHicqQfRgo6DX5w8s6sHZhAVtBA8axq7lSEusGO+tE1YPOj1Mbvyy8YUjID
	ngePVU/89wJ5AMuL5WykYB0jg6kaBA1jwIJ9ibHqmjx0AD5VZi513m0roil0DollOVQz2ac
	Y24Ps4PreiWI+mn2Aday43W2qLzlvO2//UoStBN88zLsL4DtKFR9ddEOHTlwrubDp3FT1tO
	lQcS42EXJnuYf0O1CvOMA1+9V6//ZUAVBw3+2639gg8gYiHP/ceyqqoW5T+xbg6XNHiHc1n
	LT9FOTrxOl6daXWglHz3HDfeZn7iZ6UctjrFzLeB2zwa+Z9XdRBcEUUndmmdD7o58G46EJx
	DPigqLNraaQDkoR4Sd3R0guIsRw1HwmudhCaB5z4NxHfUsK1YG81DGYGmtiV+5bqgmndRu3
	va1jblRden8Ji9YXspjZEA0Z79BR9cS/OYGtAN+qSFFU0WLen3bY5pvUnWixRAcIMWT2bU4
	2Gl2TboL+KwowGo9g1SusezzVh6rsZay+otBejZ/35OMBbEFkkmY/V88TwT9vF6/Kra1WSg
	YrNnFYK48ahfWRmv7/gGXOI4fEy0LoRt1zrSAVtszUZthVVu3YMDN5rYF4STy0eT8bVfAXu
	5pKHCNNPYRyAvl5z+0nAgdANGhZoer2tRTMoSeYtPHOgWtQvHXblTHtAFsg3iUt+nVyWQE1
	MbVdYKKbu0QULTs=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_190341_307769_46D5E78E 
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

The K1 I2C controller has an SDA glitch fix that introduces a small
delay on restart signals. While this feature can suppress glitches
on SDA when SCL = 0, it also delays the restart signal, which may
cause unexpected behavior in some transfers.

The glitch itself does not affect normal I2C operation, because
the I2C specification allows SDA to change while SCL is low.

To ensure correct transmission for every message, we disable the
SDA glitch fix by setting the RCR.SDA_GLITCH_NOFIX bit during
initialization.

This guarantees that restarts are issued promptly without
unintended delays.
---
There are the restart waveforms before [1] and after [2] disabling the fix.

Link:
https://psce.pw/839rzq [1]
https://psce.pw/839s4q [2]

Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/i2c/busses/i2c-k1.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index 84f132d0504dc992f2f961253b011b86afcc2bbc..9bf9f01aa68bde6460e50c6983edc3f705b12eea 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -14,6 +14,7 @@
 #define SPACEMIT_ICR		 0x0		/* Control register */
 #define SPACEMIT_ISR		 0x4		/* Status register */
 #define SPACEMIT_IDBR		 0xc		/* Data buffer register */
+#define SPACEMIT_IRCR		 0x18		/* Reset cycle counter */
 #define SPACEMIT_IBMR		 0x1c		/* Bus monitor register */
 
 /* SPACEMIT_ICR register fields */
@@ -76,6 +77,8 @@
 					SPACEMIT_SR_GCAD | SPACEMIT_SR_IRF | SPACEMIT_SR_ITE | \
 					SPACEMIT_SR_ALD)
 
+#define SPACEMIT_RCR_SDA_GLITCH_NOFIX		BIT(7)		/* bypass the SDA glitch fix */
+
 /* SPACEMIT_IBMR register fields */
 #define SPACEMIT_BMR_SDA         BIT(0)		/* SDA line level */
 #define SPACEMIT_BMR_SCL         BIT(1)		/* SCL line level */
@@ -237,6 +240,14 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
 	val |= SPACEMIT_CR_MSDE | SPACEMIT_CR_MSDIE;
 
 	writel(val, i2c->base + SPACEMIT_ICR);
+
+	/*
+	 * The glitch fix in the K1 I2C controller introduces a delay
+	 * on restart signals, so we disable the fix here.
+	 */
+	val = readl(i2c->base + SPACEMIT_IRCR);
+	val |= SPACEMIT_RCR_SDA_GLITCH_NOFIX;
+	writel(val, i2c->base + SPACEMIT_IRCR);
 }
 
 static inline void

-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
