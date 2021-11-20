Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88B7C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Nov 2021 08:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:Mime-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2hhJv8U4V3JbTdD96tDvCVJIrd3RPg4zoervVZ0quwQ=; b=H1ZhQ3K5RQOr6W
	bqmIZQAlcl4yr1cVxJN5z5lJmfWSs+f2gL2d4Fkker7WKAhOk4LiY9b3vO8hcnHsFHLlo2HQEB25q
	7HQW+NapNFeL5PpQKMpwSSVpyuUQT5DYoAbJGPahmUYPUo+OujGWJbPh6CSkOFiY1UKKeP4D1xGlQ
	sGwRn2HQKlPz0J55DQSy2IN3AkuOOc1QSpXjSq8V4CV4g3xOnvwBHt/4Hr4r+ToBhPHnW1W8a5x+U
	pJMj3meJZwLv2NrdFkoz1AdRJYEnVwPYHudE5Y8Zr79BXNE60QrRTFBH52dIEBGInbbTVpwNZwqd+
	+a/V91BR0RHNAQMhALDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1moM8P-00CCx4-Hv; Sat, 20 Nov 2021 08:54:09 +0000
Received: from mail-sender-0.a4lg.com ([2401:2500:203:30b:4000:6bfe:4757:0])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moM8M-00CCvj-S7
 for linux-riscv@lists.infradead.org; Sat, 20 Nov 2021 08:54:08 +0000
Message-ID: <2d536b65-e6fd-873f-ed34-4aab7cca4771@irq.a4lg.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1637398431;
 bh=czgyQFHR9/xiTMmJD9prCeQv3aFJRHv2xUZubw9E+SQ=;
 h=Date:Mime-Version:From:Subject:To:Cc:Content-Type:
 Content-Transfer-Encoding;
 b=E3Xt7jxbr1wjbwsBouGmkWYki7kvXi1GAs/BV2504+0W67B1urQ4KWszNMpsOwAVS
 wbLN+bXylc/g+zQ4x3rvpNvtX5Wrg+x6HtYYdY4wE2XjwRuPkpXnB/wUgqm3IJOl4O
 30pTG+RRukjIIAOu5aYerxn4fxw5Xwxd97oYbsG0=
Date: Sat, 20 Nov 2021 17:53:50 +0900
Mime-Version: 1.0
From: Tsukasa OI <research_trasio@irq.a4lg.com>
Subject: [RFC PATCH 1/3] riscv: Correctly print supported extensions
Content-Language: en-US
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211120_005407_197887_724E635D 
X-CRM114-Status: UNSURE (   9.28  )
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

This commit replaces BITS_PER_LONG with magic number 26.

Current ISA pretty-printing code expects extension 'a' (bit 0) through
'z' (bit 25).  Although bit 26 and higher is not currently used (thus never
cause an issue in practice), it will be an annoying problem if we start to
use those in the future.

This commit disables printing high bits for now.

Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
---
 arch/riscv/kernel/cpufeature.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index d959d207a40d..6f2bf6ae4ae2 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -63,7 +63,7 @@ void __init riscv_fill_hwcap(void)
 {
 	struct device_node *node;
 	const char *isa;
-	char print_str[BITS_PER_LONG + 1];
+	char print_str[26 + 1];
 	size_t i, j, isa_len;
 	static unsigned long isa2hwcap[256] = {0};
 
@@ -133,13 +133,13 @@ void __init riscv_fill_hwcap(void)
 	}
 
 	memset(print_str, 0, sizeof(print_str));
-	for (i = 0, j = 0; i < BITS_PER_LONG; i++)
+	for (i = 0, j = 0; i < 26; i++)
 		if (riscv_isa[0] & BIT_MASK(i))
 			print_str[j++] = (char)('a' + i);
 	pr_info("riscv: ISA extensions %s\n", print_str);
 
 	memset(print_str, 0, sizeof(print_str));
-	for (i = 0, j = 0; i < BITS_PER_LONG; i++)
+	for (i = 0, j = 0; i < 26; i++)
 		if (elf_hwcap & BIT_MASK(i))
 			print_str[j++] = (char)('a' + i);
 	pr_info("riscv: ELF capabilities %s\n", print_str);
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
