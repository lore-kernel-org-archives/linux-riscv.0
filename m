Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D8D2C021BE
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 11:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uhs3f/Ts5QwP1dFvrv1UCNe9u1IOL/9rKaYjB8ty7Sk=; b=Tq47ZRHTzC4FGr
	BXOPGDgVG/IwzKMmJWlIDXKfvc/mSgBwCG1MNvWSZwJNwJh2U2NeLCrPfla7uzv/CmEX7yWmVJwjj
	U9tyIe2Q7bj8Y6uGcCsaA5A6YrY9xNLBcZiOpr6SDdkV7XvCy321yyJkuoDjH5Q8AjGkP9oW3oEhz
	8/7TxDmlw3UBZpIy7zFbPs4wMTqrFLXZySU9PzKdaFwe7SgnhlKix4sYUzHekZAW6QHzKaJhf3jKX
	JQiMl+I43j/jBoevw1eXbOhXXZFuouy1blVPN6luIKllckh4sdU8DBRnuzrWH9t1uesIQFgFj31YZ
	u76mmBoIvVaQQOCpmbsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tncYC-00000007GVy-28NN;
	Thu, 27 Feb 2025 11:59:36 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnc15-00000007AhC-3Heu
	for linux-riscv@lists.infradead.org;
	Thu, 27 Feb 2025 11:25:24 +0000
Received: from [127.0.0.1] (unknown [116.232.55.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 6A629340DE6;
	Thu, 27 Feb 2025 11:25:20 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Thu, 27 Feb 2025 19:24:59 +0800
Subject: [PATCH 1/2] irqdomain: support three-cell scheme interrupts
MIME-Version: 1.0
Message-Id: <20250227-04-gpio-irq-threecell-v1-1-4ae4d91baadc@gentoo.org>
References: <20250227-04-gpio-irq-threecell-v1-0-4ae4d91baadc@gentoo.org>
In-Reply-To: <20250227-04-gpio-irq-threecell-v1-0-4ae4d91baadc@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>
Cc: Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1139; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=UZeskF50AAVW4VIGzve81+WsAxXVC9xLTtHgwD9uLs8=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnwEuV0jaUFEhkEP6ug87op1aJ2zrrksR0O4/U8
 RKhyaKWORWJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ8BLlV8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277UX0EACSHmw0dzvqhyKnH9
 rMgv7118nywDJl0Y6Gk4xDkHfe2vMbGXesc+/1KJydfcUdp0VoWk27zqB1h8PibvL1D67EiztH8
 lH8sRPHJO+OxcLX2B+xrAmVNIRcpvGrQ/gc5NLrpN1NFiurr/Y3NJXk3egkqaWc4fq0m262vBuH
 FelcyQvaGmKVxBwa6iiQmbpUht5FtW2dUKGdjVyQ9TxclBag2YTBP1Gju5KvbY9Dv01PD9h0xl2
 cJF4jSde2/L+7IEzRGVqhk6jLR48EwLl9fFXOfUC8l2CfnfH6XSmYtC4T5UtcB4P3e1EKmYMWzw
 Ne1shUaasajMhePQOXx2v0xeGAfpDMvF3i3oTiibBHkbufWtlNFzYaGIOPNOL3fNeJvTS0AYz3N
 wK2fd4517J5RoUfYfXiN42a/hz2fLT/uKku+QwUOwIRWffEAV8NgmQMsAunat661FUMszCiJRfb
 9SITGMdlzp8e/QkyAk15Qb/abS2ClSqBvRkEwi3Jt8TjBoeIl2YEfMb8rvMXVdrjDfRXHxDCn/2
 Xi/qed2jBPi8rnXzaSSozsWctOQH/aRoUXieECzwjq2vb4BtPkK22SNFKkUEQjwFqVHyh58TXE7
 A6Il0VonnwBEt7ykP0OYKrHobSM485ZWplM/UliXEIlrqYs0ZOYB0IhVCTqFRFqOZT3Q==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_032523_849337_9773600F 
X-CRM114-Status: UNSURE (   9.58  )
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

The is a prerequisite patch to support parsing three-cell
interrupts which encoded as <instance hwirq irqflag>,
the translate function will always retrieve irq number and
flag from last two cells.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 kernel/irq/irqdomain.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index ec6d8e72d980f604ded2bfa2143420e0e0095920..cb874ab5e54a4763d601122becd63b6d759e55d2 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -1208,10 +1208,17 @@ int irq_domain_translate_twocell(struct irq_domain *d,
 				 unsigned long *out_hwirq,
 				 unsigned int *out_type)
 {
+	u32 irq, type;
+
 	if (WARN_ON(fwspec->param_count < 2))
 		return -EINVAL;
-	*out_hwirq = fwspec->param[0];
-	*out_type = fwspec->param[1] & IRQ_TYPE_SENSE_MASK;
+
+	irq = fwspec->param_count - 2;
+	type = fwspec->param_count - 1;
+
+	*out_hwirq = fwspec->param[irq];
+	*out_type = fwspec->param[type] & IRQ_TYPE_SENSE_MASK;
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(irq_domain_translate_twocell);

-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
