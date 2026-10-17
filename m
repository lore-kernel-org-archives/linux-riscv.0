Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C978CCF2C7
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Oct 2026 14:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zrAVjJrzsgmFw5n8Ev/2hAcFzt/husmR0OiKtL/ueYs=; b=Aa70VwS6v1OPlL
	eSxrXK7Hw/96nT9WkEWMxtaxofZEUj9e+A+HCv2IPC2u3iz9K711PeArQ7nSnGbjYF7l6QXSgHS6Y
	q7SZF08hktnqTo70+zc+J+sd5QBUK/IaD8Pzmc3cExNPaPcMCv2QduBwWvBsXJexC/UunSZ/BSMpT
	5335fPwv4tQGy9eQYawg8+T22CJKjzuNEOdRUURfHGDnTiicTxaJwY5Ui5ckMlFjByedjU7nhYskW
	4kf/qDm/JtJLDY+a1T3MBxMLgi8luLkMrAFzzTzKBMnj9g53J99326PUuUQREX0uxfxcxuTM7EGW+
	w6XxEvAsPGJBCjz/05qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI554-00000004oXN-2uok;
	Sat, 17 Oct 2026 14:08:14 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI552-00000004oX2-2mg8
	for linux-riscv@lists.infradead.org;
	Sat, 17 Oct 2026 14:08:13 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-35ef6b49813so1562109eec.0
        for <linux-riscv@lists.infradead.org>; Sat, 17 Oct 2026 07:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792246091; x=1792850891; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6GqqVEdUv42zaBEqCnBmiwK+siq8auSXn02n9bIP0WE=;
        b=VEVS1YnfJV+r0FH38xUD7kwSkdWZbGQDWZK5QUxvq2XQDYju0YdKGssq+ySz7DRzHM
         qMq6NKF4eOFsOojXUvqMMeN4F9Cf3PhrSM8RELjl7W9laeojVg+0ALwFjyFAfcvMONi9
         IM2ev8jKd3Ah6QaJnJzgRU1xvkfCmWhbOmKmM6klwmaq9VRozUIC1VHV2THr1XErlB/8
         P+gkdunUEVmetU2R94M26qm1+tyiDm+pMNtem+ZekOA7hdshUS/UsLHXyXvSpxGx9rl8
         DqM0QjNqfWDixvLPA9CKRXxxGEob2UXltQKq3tvSqVEulJNILwQYRgCJFX2oxgVdm5BI
         aOVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792246091; x=1792850891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6GqqVEdUv42zaBEqCnBmiwK+siq8auSXn02n9bIP0WE=;
        b=tQQmn5OV9Yx/L9LmeDhmoh820QCXyKcmB0f/o5I0/T3aFhC1wbVhwZm7fHhx3+/lN8
         AttVc4+bDxnMzOwJzNnpy8RPlIPdURvE2LbhVS3w2/WGirUg28UxrVmUBAereTCXAGLJ
         by/mNp2Sb/T6ee1RcmHdD0c+jKHWKTw0yQmvb3qFqXNpgQW6WF5jGoTBecBliGVg1ECr
         YtJqN4koaLB4MfZMKXygBR33K9uee7TWu1uNe5RAd9ujiAX4R2ijyWS1EUpyth2mxTZ6
         cB241mQVAqKkDx/JwN+EVWw/pg7mKCFgmTme4W2uMT7TK7rIIb3jr28rz8QYuqauMVYZ
         mrBA==
X-Forwarded-Encrypted: i=1; AKwUvBxmMIyTRLTvfiTL2hWxjUZDKhGt/3siWBrLd+jSRntITCx8+qoe53IddX0+jFB3nI+OLYv6G3VafFnJKQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYJ53WbnjD8Gil+ieiNUUPeeTMFnwLjvt4ZAMWuFYQHrTNLaNXg1
	T3ay7Ch16Bp5cXNgRuPpaqnjnVDpfi1orsn1qP8Z8utkrZAEImVwRSZo
X-Gm-Gg: AYBFou0ZcwVBKPJ+KpQhUOBzsOpBSoLEijiPIQk4oUkAa7lYBpU8sP9KLPjcB1M8iad
	NgwtGekD7JsZ32mO6K8S0DrqlArLXfYH/oBUPX7kEaw7KscI6FzVy0HYX73i8rN6+OPJq8upKid
	mo8Ds/UrnC6pEtjonf9ojBDlc0D3kmQOZszs48GxuGfu0VyYjN53McimsuSSK3m7BWSpdcEtNWg
	rEFzw85XEYPeSnkfzDLcq7AkYQDmVe7iMh5jUDLPHwJCJfnUJ6xG2JrPTiafPAz1qkkMdeC9SUv
	z7pQ/6G3kWBv9nMJ8d+qgyRwjrq8O5oKn0eqzxzx1AyiXtWTXPDtM5DT8PPxaYirDw5OFu2IjJz
	bDtxXNPuxkgTcyZpt2qeOGBVtfQpBYgsQ+F27eRiXszh1zPnEj8w8Q/4FEZscdaVj7wR4L/upC3
	pb9SNm4fCc7ERUCkfwKgWVxQaE7nzJGUa9l67hwqPWya8+kw9VdyNmxX0urzjkdHk50l68wQ8gs
	eJuO8Mj51Gnb2xJvrV8b3thwm6tjICkB2d6Uiw1Q4+A0qP9NXO8ms8ibxtghH/YCg0CU5U9dqg8
	DQZo95HmHOOvWEpLaeDGibQPbf5ZWiFaiisK6H2n1mk0cLSadM8Q6w==
X-Received: by 2002:a05:693c:8943:10b0:351:4a80:d94c with SMTP id 5a478bee46e88-361a2054e07mr4084483eec.21.1792246090528;
        Sat, 17 Oct 2026 07:08:10 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360820a02b8sm17766277eec.17.2026.10.17.07.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 07:08:09 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Guodong Xu <docular.xu@gmail.com>,
	Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Alex Elder <elder@riscstar.com>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] reset: spacemit: Fix the RCPU2 PWM reset registers
Date: Sat, 17 Oct 2026 22:08:05 +0800
Message-ID: <20261017140805.3278709-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_070812_750645_2CB0A866 
X-CRM114-Status: GOOD (  10.60  )
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

Every entry in k1_rcpu2_resets[] uses RCPU2_PWM9_CLK_RST, so asserting
or deasserting the reset of any RCPU2 PWM from 0 to 8 acts on PWM9
instead. Each PWM has its own register, RCPU2_PWMn_CLK_RST at offset
4 * n, as k1-syscon.h already defines.

On a Milk-V Jupiter running the vendor kernel, which uses RCPU2 PWM2
for the fan, the RCPU2 registers read:

  0x00: 0x4  0x04: 0x4  0x08: 0x1  0x0c: 0x4  ...  0x24: 0x4

Only PWM2's register has its reset deasserted, which matches one
register per PWM.

Use the matching register for each reset. No in-tree device tree uses
the RCPU2 PWMs yet, so this has no effect on current boards, but it
would break the first one that does.

Build-tested only (riscv defconfig, W=1); the fix could not be tested
at runtime, as mainline has no RCPU2 PWM node to exercise it.

Fixes: c479d7cf06c3 ("reset: spacemit: add support for SpacemiT CCU resets")
Assisted-by: claude-opus-5-5
Signed-off-by: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
---
 drivers/reset/spacemit/reset-spacemit-k1.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/reset/spacemit/reset-spacemit-k1.c b/drivers/reset/spacemit/reset-spacemit-k1.c
index 8f3b5329e..dbd783c13 100644
--- a/drivers/reset/spacemit/reset-spacemit-k1.c
+++ b/drivers/reset/spacemit/reset-spacemit-k1.c
@@ -154,15 +154,15 @@ static const struct ccu_reset_controller_data k1_rcpu_reset_data = {
 };
 
 static const struct ccu_reset_data k1_rcpu2_resets[] = {
-	[RESET_RCPU2_PWM0]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
-	[RESET_RCPU2_PWM1]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
-	[RESET_RCPU2_PWM2]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
-	[RESET_RCPU2_PWM3]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
-	[RESET_RCPU2_PWM4]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
-	[RESET_RCPU2_PWM5]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
-	[RESET_RCPU2_PWM6]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
-	[RESET_RCPU2_PWM7]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
-	[RESET_RCPU2_PWM8]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM0]	= RESET_DATA(RCPU2_PWM0_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM1]	= RESET_DATA(RCPU2_PWM1_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM2]	= RESET_DATA(RCPU2_PWM2_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM3]	= RESET_DATA(RCPU2_PWM3_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM4]	= RESET_DATA(RCPU2_PWM4_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM5]	= RESET_DATA(RCPU2_PWM5_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM6]	= RESET_DATA(RCPU2_PWM6_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM7]	= RESET_DATA(RCPU2_PWM7_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM8]	= RESET_DATA(RCPU2_PWM8_CLK_RST, BIT(2), BIT(0)),
 	[RESET_RCPU2_PWM9]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
 };
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
