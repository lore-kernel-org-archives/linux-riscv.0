Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3ADBCA0FF6
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Aug 2025 07:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fTTRQKbNyBno64bb88+NVbOQQDHl0GocqMblk5s5gME=; b=doats99kqlO6if
	Jolum1aGDRN+kIXEqwbPsFUQR4qTpaU9XFjgV6ffnnAX7z1v/cwCQtXUE3+cJHDqxGkbhV+TvN/yx
	7aodoxHgtARnik7CYvOJri1WCQI07JveX8I57ldwfWaTpMQFylJrFq8hGzXQP4vcwzcTDID6nybhT
	INDb9y9/doIZ/AZfSf3lOYT+kLhk0W4oQPNst8vGOXttWYFZEYcbv9Y+5BWH8D6ffZEnwEEOe9aZJ
	Ipn6110381vHXww/Hk3/tGf6NZGWZv5v5pEiFqDM9SwUflYU8u8IQJfw0MOqudu6NEAigXKWufAxK
	yThhAbPOPQOe8WQuvFtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urAq1-0000000ETcQ-2Iuo;
	Wed, 27 Aug 2025 07:44:57 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urAlY-0000000ESjD-3O1D
	for linux-riscv@lists.infradead.org;
	Wed, 27 Aug 2025 07:40:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1756280371;
	bh=r62LRLONQ4ixRFoVK2WGOsYnOv0IReYh5Qvofm9lB8o=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=eXO7hR97dfNyuHfagG6Sme/Y+/BgxMc6gHADJ+NopsfYGu07SdoZtlzZim7pI6mGV
	 k39H8YGRpo/Dt6MCmsM053l6fYRAf6NQvibMOU0mIj7vYmEH+1CA6IOwWmkpO1xNAZ
	 8QIbMYDz4bu3FaqN9nYFqIKnfPQrzdXSvaavIr6M=
X-QQ-mid: esmtpgz13t1756280364td1fd4c27
X-QQ-Originating-IP: j6HUiQphb1uXSips00AFbpxD2qsvOt6geCUe1Vnr4+k=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 27 Aug 2025 15:39:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11585140463096144350
EX-QQ-RecipientCnt: 9
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 27 Aug 2025 15:39:09 +0800
Subject: [PATCH 2/6] i2c: spacemit: remove stop function to avoid bus error
MIME-Version: 1.0
Message-Id: <20250827-k1-i2c-atomic-v1-2-e59bea02d680@linux.spacemit.com>
References: <20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com>
In-Reply-To: <20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com>
To: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756280357; l=2481;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=rXhS9GnD2Dk1OWu3Ph2ZYZuY8+SqPjIYTr2qGnagdnI=;
 b=WjcgZ/94u/DDSuZGRjbfrpgiUdbLCUQAsF2f0B2SWZN1q1ipHqnMJeIr0+TDv3zdanCvKGmZm
 Krc4FIjj4ruDxLP6/O11VP0NuJv7Z2atZ+pGFldHiGepX8jonw7iQPP
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NK5b7h72e0qHzF2QF+s7kSizN3qr3KH08pr9thEkI/GKZIq1wBj0pqHM
	HnWdP1V9zIbASO5vN5h6hi1KrD6HRwkFzuokDgqRR2Vz4cydhSGtNaLgOg4xdodjbqXuoPO
	jLZfVoU20sbmuMbBxF6GDZTdgE1Ceh7L+4qk92tXkfoRTY2lmZ9nDESy/tu/gv8QqsNevou
	T7kmihZf/94cHpZ3UTXYET2wBwD5+NNqejgzUIY1HLKUrt7aeUvDWiyRK6U5TU/iBmg9xMH
	D/WpuEjQzWNDcUxUJIOtwCfHnXId9XpwLz8J+xUjH7RtXHU0inardZnqTjK4d5PXeNo6uj8
	xWylVFU8OLW+cORclKYuetCOJoUm5Q6jNvuJjLRd3gPOD/8eYW63SDe2/O2FdeMSD2LlvSt
	sD6GXYI3W8uoZe7NOPibumqfYegrKU6De91CsSP2O8518+DfobfwTpFHhsgK9SbUt1b/BhG
	0jH1egX7DNIeTgRLs3080wfiqpd1NnoJzE4stMWrLKjo4tFpjpoI6AaDyKHo9CmLuxkdjQg
	ouBEjb7OKeB7LfnXzSfdgmtsMMggZA2BYp42HtLMb8pUV4Xoa1yyBIEPwApp2o2tIMKuqIu
	Nhr0x9Z5PLKrbAUglaoL6z5r3myW7MxHJF9pzIU8VjhudJ430jpMcNyQyty8eTRjQm7K2Jn
	UnNlNhqzYOJGTI6AjMhfrHbjrNrNommAzY7CJ/+56jdY4bjmBTHkUkt9HuuiL0QFBwZZg3t
	EaYjjlQSCRzA4aiw+HYuYWSjNuWcsBR6rJcfvDnouPeFu8cYczmH4IpN8iGs5sSWN0y5rF0
	cFVMAteyMHe8cTCsOkrcO+21kyCePLbExqZfo6kE18vBwymXqCeX0ORPyaNPw6JAmYauJSc
	RCov2jpayGmVJL7/7FNQa1OJEm7HvPq1+qY2ltW70+5KZt6fOVk0N0WSsTNKSSyfzgGPzVd
	4xcZojwPRvo4jYwAddDLfWGApgBppP0oS2ld+zpOMuVd2vK6eYzCu87f3CHShlu2Unwes9a
	vzz4uDAEK4wKIrGhV9+1eVz05kUMM029jaXhFsDfRtwB7VFopXEjBUc6w8aMXecsOMB/r6Z
	GNc787BP9qJELOm03eK24qP8J5NZJg+3c3lIQgQBvWcVaCUIKVVeobAdm5hhowexxNI/yL3
	/U7J
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_004021_398397_579B7C72 
X-CRM114-Status: GOOD (  11.07  )
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

Previously, STOP handling was split into two separate steps:
  1) clear TB/STOP/START/ACK bits
  2) issue STOP by calling spacemit_i2c_stop()

This left a small window where the control register was updated
twice, which can confuse the controller. While this race has not
been observed with interrupt-driven transfers, it reliably causes
bus errors in PIO mode.

Inline the STOP sequence into the IRQ handler and ensure that
control register bits are updated atomically in a single writel().

Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/i2c/busses/i2c-k1.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index ee08811f4087c8e709d25dd314854ed643cc5a47..d342752030d077953adf84a2886211de96e843c4 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -267,19 +267,6 @@ static void spacemit_i2c_start(struct spacemit_i2c_dev *i2c)
 	writel(val, i2c->base + SPACEMIT_ICR);
 }
 
-static void spacemit_i2c_stop(struct spacemit_i2c_dev *i2c)
-{
-	u32 val;
-
-	val = readl(i2c->base + SPACEMIT_ICR);
-	val |= SPACEMIT_CR_STOP | SPACEMIT_CR_ALDIE | SPACEMIT_CR_TB;
-
-	if (i2c->read)
-		val |= SPACEMIT_CR_ACKNAK;
-
-	writel(val, i2c->base + SPACEMIT_ICR);
-}
-
 static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
 {
 	unsigned long time_left;
@@ -412,7 +399,6 @@ static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
 
 	val = readl(i2c->base + SPACEMIT_ICR);
 	val &= ~(SPACEMIT_CR_TB | SPACEMIT_CR_ACKNAK | SPACEMIT_CR_STOP | SPACEMIT_CR_START);
-	writel(val, i2c->base + SPACEMIT_ICR);
 
 	switch (i2c->state) {
 	case SPACEMIT_STATE_START:
@@ -429,14 +415,18 @@ static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
 	}
 
 	if (i2c->state != SPACEMIT_STATE_IDLE) {
+		val |= SPACEMIT_CR_TB;
+		if (i2c->is_pio)
+			val |= SPACEMIT_CR_ALDIE;
+
 		if (spacemit_i2c_is_last_msg(i2c)) {
 			/* trigger next byte with stop */
-			spacemit_i2c_stop(i2c);
-		} else {
-			/* trigger next byte */
-			val |= SPACEMIT_CR_ALDIE | SPACEMIT_CR_TB;
-			writel(val, i2c->base + SPACEMIT_ICR);
+			val |= SPACEMIT_CR_STOP;
+
+			if (i2c->read)
+				val |= SPACEMIT_CR_ACKNAK;
 		}
+		writel(val, i2c->base + SPACEMIT_ICR);
 	}
 
 err_out:

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
