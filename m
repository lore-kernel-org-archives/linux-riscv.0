Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06358CA0FFD
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Aug 2025 07:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Z0V3UR3IuYuDifKkkPTVDBr5GWzvII7CHjQoaDBUZ0=; b=MrVVRmiyIwg6Zq
	ghFGpicFPl3/Ca5Sr3tjyrqMho1fd5xOuUTgwRIII0CbezbdbTPlq4OMhh5d8cqAHQ4ZK43iJN5+I
	xkmbLqVLRlgUf3mNX2VC1IGevhlvgqySvn97er2z8rCWbT77SoNDRYa2vbdX8lCOZCLzPXZzxn2iI
	BhlfQN5ItcvAcRcKwzuavJVO3PIhYPnyP82XKsJC7CEu60vp7uRzKeDRM8P8GGD8yZFApWSM1bkxy
	PpsX73XkaOjv8eJBQ5gUdoAjHEgVwAIc7VyDTgms/aVgf3Gvm1nwse7sw+hgWB/C9xwKGQXPJHjJn
	MLCqsMJS/7rho19tL2xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urAq0-0000000ETbs-3ZLs;
	Wed, 27 Aug 2025 07:44:56 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urAlY-0000000ESjM-3PVC
	for linux-riscv@lists.infradead.org;
	Wed, 27 Aug 2025 07:40:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1756280373;
	bh=nKPBFDqV4arLHxi9pnW8A0Xaua5oHEAMsVmNRknIIhU=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=KnA0Opp0Y2oPPj2kRutvUvQQwpR7MQdNwQxA7S0Q5TS1jkAG18e9fkAP0+YO9jpfo
	 6UlOvnNn9wrl99dveSLPXm8aPoxvKFTcUl7S8pV6V14N3OwTeGeIekhpyqlevVni/a
	 urxwiWJIw0V08IHDu/QgHGi9sLAVnV9ZSmTDewnQ=
X-QQ-mid: esmtpgz13t1756280367t3f9802a7
X-QQ-Originating-IP: Gt/FPg+zJdLaLf1gU3G30sXjbP02MyYwIclFs2aVKNY=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 27 Aug 2025 15:39:25 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2985033504381610877
EX-QQ-RecipientCnt: 9
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 27 Aug 2025 15:39:10 +0800
Subject: [PATCH 3/6] i2c: spacemit: disable SDA glitch fix to avoid restart
 delay
MIME-Version: 1.0
Message-Id: <20250827-k1-i2c-atomic-v1-3-e59bea02d680@linux.spacemit.com>
References: <20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com>
In-Reply-To: <20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com>
To: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756280357; l=2255;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=XOadE6q3hu9FC4+hTj5B4E1CAH50HQ7DCsTZxRN6P5w=;
 b=Y9zQihml6SFgzLnNFvIYUCpA939k2Lzx7ML2GodAd0uKVXap/b6Ez47Q1y4B/U9tU8+wDNoK2
 aTOGsgN494GCFus4VUCGlCjGEwRSQHzOsUm10u3OjlutLh+l17Xn7T4
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: OW4JKxETGMY2QhaCakBTCB0FjQaqcoMM1c7I9ZPm44zlRnzzVP87jDti
	VUKuVVXZVX0C6OGD2Ghkl+2xAZY+XuE/QUYxJRgXCEuqtM+RRv1/dzSND8Bk5O0LsyDIUdG
	iWpuzWj+/bhVKu5biftADdtHD8RMRflttEV+rfwuHf1cwrb9MHSWbD6/0bUyYkwXL/kpu9w
	RlnIb00jfsChiJt5+j3Q3rULDkFTIrNFqvDoO6msmDJ8ydUiP1kPKAqcpSxHW4Ng3hQMV7N
	/DauvBnxT2isMHGzXHddt4zGU7UaLgACaxUa2fmJSXlzKcy3LCw1KsdeDJxIm0oy1uicXLM
	E5/JRfZRGRvm8Ia1yrCkCm8nNfaMbS2DAHAQN2L+yMyeDEQ6BklgF/HkJh3SJVSPxJKPVqX
	sLItFZG78YHYSdy6jAt/675dBNyTP4UszOVpxPhXyODek5ALmDWXDRtRmQjpsP3f4WbMvcx
	uBBTk3agLCFae8DRvAGJ5BScmoUfJMaDw0BggxWs20VNc1/0ULsXzpLSxj8fxL+F3gN6O9L
	mjklHjZ1djI/jJfVW8rMzX3HmgBC3rZNofUapSbe6278zfBKg0iOK5tOl9iDt1cMcglZlO2
	rKJnMXMhdD2f+wp/6gP2fgnGoGr8QbnUx36W/+lXOwCZgGBh+YRuz0Hkbs3dNx0+Dl/vp2i
	+/W3F5rc8Nh3MiIKZyjMJDMdyWG5J/9+bcH0ujqMovyL8kr08TArOHbLTNyTEgPSHRflMFR
	0vqywq2pKX4ButIbKvDTV4xK8j4R04KWQK+XqgvvNSgkoGs7MHQRwJdL7nqQMozsLTQRGu5
	Geh3c0XJZoutQ+V1XDpG8x/aSdPvms99AHlQ6wU89hig0o1mIxOwQaY3gQq0+F4HlJ9bsHK
	0V+OAjNZh2Xw1zpodKlpr+L5+a31MWRxHnhV6XbRMv37REFoJfcnrJN4l1EbWd0y5bYrvgz
	TuFYwb1xpIAFKY8zWTGrHqY1RVTE4y3uCqV3n3V4eTqJYGLL1QpUbEo84FVQLt+1J2C1MV5
	W1pxAM0EAQxvhWlPxjRVR/PU5BlvCuP15kMDou3w2f7rYW2xQwPAGh//AKyUZVxyumzJkLI
	uWbRcg4LrPZwNt5i13AjkaHLy166NB7Dg==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_004021_160424_EE74589B 
X-CRM114-Status: GOOD (  11.36  )
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

Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/i2c/busses/i2c-k1.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index d342752030d077953adf84a2886211de96e843c4..c1656b78f1681729ccc2ebca6e290259d14889d9 100644
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
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
