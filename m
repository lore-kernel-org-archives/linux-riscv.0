Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22137C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Dec 2021 01:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fLptuDxBhAzUZKnP5qOqs2tEh5B9vpxGLRKU0cB/4yw=; b=sU1geLV2lMCxtr
	VJIjhFAIZIjueZXmMo5aMWgdU6KbxvZvN2UKx6viC4jhye0baWI49ZBI3WmIkrUyjMDJMZZdMAnKd
	qrDvAZf2S9+J9cIcJParnEbdFZBcsZuyZFeG1sqcy8v1lG2dPoVd3OydoRPKQR5s2DUk7dxo/Qt36
	pr3tKag6QKaVIG16Z5uXZPLytj2GLCVZUTXSOcxqyJBkWeH4CBP+m+FKWTWlIVzbLdnFU+yELqqGr
	VFDdcm0qfp4hQMUUI2QaYdF1trwyNbjo6itPKEEc0uZNCTF0gbDgkZg8k27kdFUpoNwl1ByGJOI3M
	ef/m1EAc9U3A8uGBIOBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msb6B-00AYFi-2W; Thu, 02 Dec 2021 01:41:23 +0000
Received: from mail-sender-0.a4lg.com ([2401:2500:203:30b:4000:6bfe:4757:0])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msb67-00AYDi-C7
 for linux-riscv@lists.infradead.org; Thu, 02 Dec 2021 01:41:20 +0000
Received: by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id D1B4C30008A;
 Thu,  2 Dec 2021 01:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1638409278;
 bh=cl3Yajb8pHF7xTBnBrLc/N3QGlcY0whqHS4G6/ABpBg=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 Mime-Version:Content-Transfer-Encoding;
 b=IMoxL7ZuXiGlODj0OTQk+RbWUgBpWuHpLwJ1TCItKldE3TQv2xt7Z/wgyhxmMvQks
 lliqGoWETAe8dVKHJ75tzKTFbRbxEprkd12xI6VJdhIod4IETygze3WB9cnKBHRAAc
 GJB3KTDZWXfMPNrgxisyCXqL3qRVCWvwCE99dNBw=
From: Tsukasa OI <research_trasio@irq.a4lg.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Cc: Tsukasa OI <research_trasio@irq.a4lg.com>, linux-riscv@lists.infradead.org
Subject: [RFC PATCH v3 1/4] riscv: cpufeature: Correctly print supported
 extensions
Date: Thu,  2 Dec 2021 10:41:10 +0900
Message-Id: <4baf931a4f00679b4a2256cc970e733dbd35878a.1638408984.git.research_trasio@irq.a4lg.com>
In-Reply-To: <cover.1638408984.git.research_trasio@irq.a4lg.com>
References: <cover.1638408984.git.research_trasio@irq.a4lg.com>
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_174119_587340_8133B197 
X-CRM114-Status: GOOD (  11.02  )
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

This commit replaces BITS_PER_LONG with number of alphabet letters.

Current ISA pretty-printing code expects extension 'a' (bit 0) through
'z' (bit 25).  Although bit 26 and higher is not currently used (thus never
cause an issue in practice), it will be an annoying problem if we start to
use those in the future.

This commit disables printing high bits for now.

Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
---
 arch/riscv/kernel/cpufeature.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index d959d207a40d..dd3d57eb4eea 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -13,6 +13,8 @@
 #include <asm/smp.h>
 #include <asm/switch_to.h>
 
+#define NUM_ALPHA_EXTS ('z' - 'a' + 1)
+
 unsigned long elf_hwcap __read_mostly;
 
 /* Host ISA bitmap */
@@ -63,7 +65,7 @@ void __init riscv_fill_hwcap(void)
 {
 	struct device_node *node;
 	const char *isa;
-	char print_str[BITS_PER_LONG + 1];
+	char print_str[NUM_ALPHA_EXTS + 1];
 	size_t i, j, isa_len;
 	static unsigned long isa2hwcap[256] = {0};
 
@@ -133,13 +135,13 @@ void __init riscv_fill_hwcap(void)
 	}
 
 	memset(print_str, 0, sizeof(print_str));
-	for (i = 0, j = 0; i < BITS_PER_LONG; i++)
+	for (i = 0, j = 0; i < NUM_ALPHA_EXTS; i++)
 		if (riscv_isa[0] & BIT_MASK(i))
 			print_str[j++] = (char)('a' + i);
 	pr_info("riscv: ISA extensions %s\n", print_str);
 
 	memset(print_str, 0, sizeof(print_str));
-	for (i = 0, j = 0; i < BITS_PER_LONG; i++)
+	for (i = 0, j = 0; i < NUM_ALPHA_EXTS; i++)
 		if (elf_hwcap & BIT_MASK(i))
 			print_str[j++] = (char)('a' + i);
 	pr_info("riscv: ELF capabilities %s\n", print_str);
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
