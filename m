Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C44CC4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Nov 2021 08:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:Mime-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=haYwkaYRphUm1PFZ8xq6OTl81XgWuo9/LYm21xTQ+B4=; b=CRthhL81xVKz6i
	eOw8OEI94AOpMh+thtBLhFkfb9CRKNJ6pXtFoFEWG1OXzdddy7KYljvJMb39owK276+XJUWlXPkpL
	xcU/dN7EcxhtrLvFwP7AmkrhkMRuxzttysnjslAAtmhX1eEOn6z3iq6ah+gbhGrcSFoUtnxnddoua
	18nHpwfrm/b9+xIaZQKHfa5f1ZJFx3eRUBSsLnSZFIju3GbWPZvWBdfEr8wj2dKqJdYqlPMlAp/ek
	XSxWWvzc76EQbmybDNkX9hFtVw/0o7YYTV+Tr2PtOdEKjRA6VCNfIC8Sh3EULJ/oQlpRaXJMFjiks
	uyth16Y0Sh2yGiiqU1AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1moM8R-00CCxN-7A; Sat, 20 Nov 2021 08:54:11 +0000
Received: from mail-sender.a4lg.com ([153.120.152.154]
 helo=mail-sender-0.a4lg.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moM8M-00CCvv-Vq
 for linux-riscv@lists.infradead.org; Sat, 20 Nov 2021 08:54:08 +0000
Message-ID: <3f320d5a-c7c6-abf4-3047-cf8f0a089a42@irq.a4lg.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1637398441;
 bh=HqAt0FyYMgnAvZ1uw5UCxfW80Qi6T7x5TwxDWpXDW54=;
 h=Date:Mime-Version:From:Subject:To:Cc:Content-Type:
 Content-Transfer-Encoding;
 b=TY7POxygjJDZgMecxF+C/6XTaPYhNQzU4jgYC4Vo1/S6sjM7nDr87I6mXdIpcfx/B
 uVztc7z0BQhNTS2N3vDZ26GtlG2sdmXSH2r7OsFZG49V8GecGnOQluEhuNnkkn3E4Z
 isjA1Zgh9AQgcM7CdDq7KE1gwkW+n6Ykzz3HxT4M=
Date: Sat, 20 Nov 2021 17:54:00 +0900
Mime-Version: 1.0
From: Tsukasa OI <research_trasio@irq.a4lg.com>
Subject: [RFC PATCH 3/3] riscv: Full parser for "riscv,isa" strings
Content-Language: en-US
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211120_005407_205602_572EB974 
X-CRM114-Status: UNSURE (   9.94  )
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

This commit implements full parser for "riscv,isa" strings.

We haven't determined how do we represent multi-letter and/or versioned
extensions in the ISA bitmap yet.  So, this commit handles only single-
letter extensions with no respect to version numbers (as before).

Nevertheless, it can be a foundation for our future work.

Note that major version of -1 represents non-versioned extension
(in many cases, they should be handled as 1 with some exceptions).

Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
---
 arch/riscv/kernel/cpufeature.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index e0d051516746..6012a1bb1d20 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -60,6 +60,22 @@ bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, int bit)
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
@@ -100,6 +116,10 @@ void __init riscv_fill_hwcap(void)
 #endif
 		for (; *isa; ++isa) {
 			const char *ext = isa;
+			const char *ext_end = isa + 1;
+			const char *ext_nstr;
+			unsigned int ext_major = -1; /* default */
+			unsigned int ext_minor = 0;
 			int ext_err = 0;
 			bool ext_long = false;
 
@@ -113,6 +133,7 @@ void __init riscv_fill_hwcap(void)
 				ext_long = true;
 				while ('a' <= *isa && *isa <= 'z')
 					++isa;
+				ext_end = isa;
 				break;
 			}
 			if (isdigit(*isa)) {
@@ -120,14 +141,25 @@ void __init riscv_fill_hwcap(void)
 				do {
 					while (isdigit(*++isa))
 						;
+					if (_decimal_part_to_uint(ext_nstr,
+						&ext_major) || ext_major == -1) {
+						ext_err = 1;
+						break;
+					}
 					if (*isa != 'p')
 						break;
 					if (!isdigit(*++isa)) {
 						ext_err = 2;
 						break;
 					}
+					ext_nstr = isa;
 					while (isdigit(*++isa))
 						;
+					if (_decimal_part_to_uint(ext_nstr,
+					    &ext_minor)) {
+						ext_err = 3;
+						break;
+					}
 				} while (0);
 			}
 			if (*isa != '_')
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
