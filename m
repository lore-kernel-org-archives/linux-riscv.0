Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB730C433FE
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Nov 2021 08:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:Mime-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i1oMu1e2Q855PIC3ok+OYjlzV334wBH6/TBREXBAhv0=; b=oBLaUpM9jf0HVw
	2LDHgsEftbsS76+Kt6ZHokzyETWtb9qn4jUMJqZ2y4/eORJE8Xf/Ed34LHHGDmuhFbdqU2s2/2+wE
	iYCKoOlwJwO++lq1/6BzkjApaLdc2d9GQn7+/7VoDDfTOPhht6HK7SpJIaU9v3AtC/zKl2jwHaHzN
	3nIIukP/i6YHbFBJEwLvRgoQpa5xL76YNWuGSz5uH5CVoT/t4jLkknu2DSH2a4enYp/+B0TfZ452M
	xrD7IuZmCcx01+2psLO3PboogbGx4S5JsFutE0uvf96nD6AX7DfqfjlXeXZrFiNa523Hke3MzKTK/
	RtUMtDXcMxN1l8mmbHug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1moM8S-00CCxa-Rk; Sat, 20 Nov 2021 08:54:12 +0000
Received: from mail-sender-0.a4lg.com ([2401:2500:203:30b:4000:6bfe:4757:0])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moM8N-00CCvu-6b
 for linux-riscv@lists.infradead.org; Sat, 20 Nov 2021 08:54:09 +0000
Message-ID: <f512665a-a44a-fbc0-0e12-d1c6442a36d8@irq.a4lg.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1637398437;
 bh=XC+Bf8skcAPdUzc9K3K36aEUUJgqfxegbnm7hKZ8cEE=;
 h=Date:Mime-Version:From:Subject:To:Cc:Content-Type:
 Content-Transfer-Encoding;
 b=owE6zLmLKH1/1Db8LCrLYzLLvOhl8Z7h1HkHCK6i05dxVPkD0FsHSoPiqEEJfR2aj
 lVQZa2lsuKjw+twebCN+FgDn4Ga/x7YP327Pydhde3utU6WPWHdja/jYgokGVQ6fMP
 h3IjGF9X5/3U+eeKA+TkQkWGGU50F+gEqvztdoYk=
Date: Sat, 20 Nov 2021 17:53:56 +0900
Mime-Version: 1.0
From: Tsukasa OI <research_trasio@irq.a4lg.com>
Subject: [RFC PATCH 2/3] riscv: Minimal parser for "riscv,isa" strings
Content-Language: en-US
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211120_005407_425821_5DA62945 
X-CRM114-Status: GOOD (  13.13  )
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

Current hart ISA ("riscv,isa") parser don't correctly parse:

1. Multi-letter extensions
2. Version numbers

If we don't have those in "riscv,isa", that's fine.  However, many of
standardized multi-letter extensions are being frozen and ratified.
The current "riscv,isa" parser that is easily confused by multi-letter
extensions and "p" in version numbers can be a huge problem for adding
new extensions through the device tree.

Leaving it would create incompatible hacks and would make "riscv,isa"
value unreliable.

This commit implements minimal parser for "riscv,isa" strings.  With this,
we can safely ignore multi-letter extensions and version numbers.

Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
---
 arch/riscv/kernel/cpufeature.c | 56 +++++++++++++++++++++++++++-------
 1 file changed, 45 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 6f2bf6ae4ae2..e0d051516746 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/bitmap.h>
+#include <linux/ctype.h>
 #include <linux/of.h>
 #include <asm/processor.h>
 #include <asm/hwcap.h>
@@ -64,7 +65,7 @@ void __init riscv_fill_hwcap(void)
 	struct device_node *node;
 	const char *isa;
 	char print_str[26 + 1];
-	size_t i, j, isa_len;
+	int i, j;
 	static unsigned long isa2hwcap[256] = {0};
 
 	isa2hwcap['i'] = isa2hwcap['I'] = COMPAT_HWCAP_ISA_I;
@@ -90,23 +91,56 @@ void __init riscv_fill_hwcap(void)
 			continue;
 		}
 
-		i = 0;
-		isa_len = strlen(isa);
 #if IS_ENABLED(CONFIG_32BIT)
 		if (!strncmp(isa, "rv32", 4))
-			i += 4;
+			isa += 4;
 #elif IS_ENABLED(CONFIG_64BIT)
 		if (!strncmp(isa, "rv64", 4))
-			i += 4;
+			isa += 4;
 #endif
-		for (; i < isa_len; ++i) {
-			this_hwcap |= isa2hwcap[(unsigned char)(isa[i])];
+		for (; *isa; ++isa) {
+			const char *ext = isa;
+			int ext_err = 0;
+			bool ext_long = false;
+
+			if (!('a' <= *isa && *isa <= 'z'))
+				continue; /* invalid character */
+			switch (*isa++) {
+			case 'h':
+			case 's':
+			case 'x':
+			case 'z':
+				ext_long = true;
+				while ('a' <= *isa && *isa <= 'z')
+					++isa;
+				break;
+			}
+			if (isdigit(*isa)) {
+				ext_nstr = isa;
+				do {
+					while (isdigit(*++isa))
+						;
+					if (*isa != 'p')
+						break;
+					if (!isdigit(*++isa)) {
+						ext_err = 2;
+						break;
+					}
+					while (isdigit(*++isa))
+						;
+				} while (0);
+			}
+			if (*isa != '_')
+				--isa;
 			/*
-			 * TODO: X, Y and Z extension parsing for Host ISA
-			 * bitmap will be added in-future.
+			 * TODO: Full version-aware handling including
+			 * multi-letter extensions will be added in-future.
 			 */
-			if ('a' <= isa[i] && isa[i] < 'x')
-				this_isa |= (1UL << (isa[i] - 'a'));
+			if (!ext_err) {
+				this_hwcap |= isa2hwcap[(unsigned char)*ext];
+				if (!ext_long)
+					this_isa |= (1UL << (*ext - 'a'));
+			}
 		}
 
 		/*
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
