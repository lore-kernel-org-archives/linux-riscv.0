Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B95BC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Nov 2021 10:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K7AHkou1vpX2Ma/SkMwXncxWcD0QjLnD4c8xodBQats=; b=ZWs9lO9R78ScKt
	CjdXSx4CCE4gmHl+Jyz/IrSGEO/Z1uJ+d8GHoExrP/8iaXd4qpWuwaWq3qAvZtnDyO8ko/6FOZ+OI
	1sDY+0ckQP/fhtjWnwC55WazBUr8aREWGs2pjk1FLE6Ie6HUEqrvOzb9A6XsSrIimwPiQmCsNE8fU
	zOtI1ZS79MQ/qQiDvUUK62O3E+l9KMUV7YyTVvnkOXA91mc3gscCWvKaQUkUgEJ2hyKS7ppIicqN4
	3SwkSVSUF3U66qV67Hop2N3yC0IdBmrhbyEyw/+GdWHY24o/wNsBBVuJseUyJDdfvoUrASPtZc+yi
	/jZ6UT/0bDaf6pplz8AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqBiZ-0072IV-0v; Thu, 25 Nov 2021 10:11:03 +0000
Received: from mail-sender-0.a4lg.com ([2401:2500:203:30b:4000:6bfe:4757:0])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqBiR-0072E1-Oi
 for linux-riscv@lists.infradead.org; Thu, 25 Nov 2021 10:10:58 +0000
From: Tsukasa OI <research_trasio@irq.a4lg.com>
Authentication-Results: mail-sender-0.a4lg.com;
 dkim=permerror (bad message/signature format)
To: Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Tsukasa OI <research_trasio@irq.a4lg.com>, linux-riscv@lists.infradead.org
Subject: [RFC PATCH v2 4/4] riscv: cpufeature: Full parser for "riscv,
 isa" strings
Date: Thu, 25 Nov 2021 19:02:55 +0900
Message-Id: <c2e68e66303142d0ad6c682e22f6e07bc7b62232.1637834060.git.research_trasio@irq.a4lg.com>
In-Reply-To: <cover.1637834060.git.research_trasio@irq.a4lg.com>
References: <cover.1637834060.git.research_trasio@irq.a4lg.com>
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_021056_078341_E52F7E93 
X-CRM114-Status: GOOD (  13.47  )
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

This commit implements full parser for "riscv,isa" strings.

We haven't determined how do we represent multi-letter and/or versioned
extensions in the ISA bitmap yet.  So, this commit handles only single-
letter extensions with no respect to version numbers (as before).

Nevertheless, it can be a foundation for our future work.

Note that major version of UINT_MAX represents non-versioned extension
(in many cases, they should be handled as 1 with some exceptions).

Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
---
 arch/riscv/kernel/cpufeature.c | 44 ++++++++++++++++++++++++++++++----
 1 file changed, 39 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 61bc326d15b0..8c64f63a686c 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -62,6 +62,22 @@ bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, int bit)
 }
 EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
 
+static inline int _decimal_part_to_uint(const char *s, unsigned int *res)
+{
+	unsigned int value = 0, d;
+
+	if (!isdigit(*s))
+		return -EINVAL;
+	do {
+		d = *s - '0';
+		if (value > (UINT_MAX - d) / 10)
+			return -ERANGE;
+		value = value * 10 + d;
+	} while (isdigit(*++s));
+	*res = value;
+	return 0;
+}
+
 void __init riscv_fill_hwcap(void)
 {
 	struct device_node *node;
@@ -103,8 +119,10 @@ void __init riscv_fill_hwcap(void)
 		for (; *isa; ++isa) {
 			const char *ext = isa++;
 			const char *ext_end = isa;
+			unsigned int ext_major = UINT_MAX; /* default */
+			unsigned int ext_minor = 0;
 			unsigned short ext_err = 0;
-			bool ext_long;
+			bool ext_long, ext_vpair;
 
 			switch (*ext) {
 			case 'h':
@@ -116,7 +134,7 @@ void __init riscv_fill_hwcap(void)
 				for (; *isa && *isa != '_'; ++isa)
 					if (!islower(*isa) && !isdigit(*isa))
 						ext_err = 1;
-				/* Find end of the extension name backwards */
+				/* Parse backwards */
 				ext_end = isa;
 				if (ext_err)
 					break;
@@ -124,13 +142,23 @@ void __init riscv_fill_hwcap(void)
 					break;
 				while (isdigit(*--ext_end))
 					;
-				if (ext_end[0] != 'p'
-				    || !isdigit(ext_end[-1])) {
+				ext_vpair = (ext_end[0] == 'p')
+					    && isdigit(ext_end[-1]);
+				if (_decimal_part_to_uint(ext_end + 1,
+							  &ext_major))
+					ext_err = ext_vpair ? 3 : 2;
+				if (!ext_vpair) {
 					++ext_end;
+					if (ext_major == UINT_MAX)
+						ext_err = 2;
 					break;
 				}
+				ext_minor = ext_major;
 				while (isdigit(*--ext_end))
 					;
+				if (_decimal_part_to_uint(++ext_end, &ext_major)
+				    || ext_major == UINT_MAX)
+					ext_err = 2;
 				break;
 			default:
 				ext_long = false;
@@ -138,9 +166,12 @@ void __init riscv_fill_hwcap(void)
 					ext_err = 1;
 					break;
 				}
-				/* Find next extension */
+				/* Parse forwards finding next extension */
 				if (!isdigit(*isa))
 					break;
+				_decimal_part_to_uint(isa, &ext_major);
+				if (ext_major == UINT_MAX)
+					ext_err = 2;
 				while (isdigit(*++isa))
 					;
 				if (*isa != 'p')
@@ -149,6 +180,9 @@ void __init riscv_fill_hwcap(void)
 					--isa;
 					break;
 				}
+				if (!ext_err &&
+				    _decimal_part_to_uint(isa, &ext_minor))
+					ext_err = 3;
 				while (isdigit(*++isa))
 					;
 				break;
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
