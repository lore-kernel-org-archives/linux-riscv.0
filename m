Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4391D29DE2
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jan 2026 08:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oD/Eof3aQcrYRizHQexX4BxpPLv8bjoBuVdUesNmyxI=; b=lpcBJcfLRmCLzL
	lFuu+fNKd4gP865W9InTAkwX58S+BzJp7/9SInZr9aSCgnYF8uvN0QFYO4fBASAISSBkXLR3NGmwL
	bdyZdRRByp9z066TgNIfjVI7qIOfH+aWmbBmkN/uXBMT8rXUWHsc1EYufR7NMbL+3Tzd/YgbNvhNd
	lXteXFHMM3/JspV79cIiWOpIEn44nh+apaxhwCW1CazOl9wBM/HyAdJeeN3JoFvUevGXcy5rZsDgr
	hlLKtgUXI75d1NJmYiKsxxOlcISXWIDqareGLD837kh1bQEG2yno2EWxpYPWPxsi9RSrR8yWQnsnu
	J/sM8ptkkj+JfxcgrBoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZlG-00000006jg4-2Lmp;
	Tue, 13 Jan 2026 08:28:22 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZl3-00000006jdt-2OBR
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jan 2026 08:28:20 +0000
X-UUID: c4320040f05911f0a38c85956e01ac42-20260113
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:e346155f-0f91-4c2e-a8a1-5393a154b924,IP:0,UR
	L:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:20
X-CID-META: VersionHash:a9d874c,CLOUDID:1ac8a1be40bd3ada1e363909550e78e0,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c4320040f05911f0a38c85956e01ac42-20260113
X-User: jiangfeng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 659851752; Tue, 13 Jan 2026 16:27:58 +0800
From: Feng Jiang <jiangfeng@kylinos.cn>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	kees@kernel.org,
	andy@kernel.org,
	akpm@linux-foundation.org,
	jiangfeng@kylinos.cn,
	ebiggers@kernel.org,
	martin.petersen@oracle.com,
	ardb@kernel.org,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	samuel.holland@sifive.com,
	linus.walleij@linaro.org,
	nathan@kernel.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2 01/14] lib/string: extract generic strlen() into __generic_strlen()
Date: Tue, 13 Jan 2026 16:27:35 +0800
Message-Id: <20260113082748.250916-2-jiangfeng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260113082748.250916-1-jiangfeng@kylinos.cn>
References: <20260113082748.250916-1-jiangfeng@kylinos.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_002809_940742_27810F74 
X-CRM114-Status: UNSURE (   8.40  )
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

To support performance benchmarking in KUnit tests, extract the
generic C implementation of strlen() into a standalone function
__generic_strlen(). This allows tests to compare architecture-optimized
versions against the generic baseline without duplicating code.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
---
 include/linux/string.h |  1 +
 lib/string.c           | 10 ++++++++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/linux/string.h b/include/linux/string.h
index 1b564c36d721..961645633b4d 100644
--- a/include/linux/string.h
+++ b/include/linux/string.h
@@ -197,6 +197,7 @@ extern char * strstr(const char *, const char *);
 #ifndef __HAVE_ARCH_STRNSTR
 extern char * strnstr(const char *, const char *, size_t);
 #endif
+extern __kernel_size_t __generic_strlen(const char *);
 #ifndef __HAVE_ARCH_STRLEN
 extern __kernel_size_t strlen(const char *);
 #endif
diff --git a/lib/string.c b/lib/string.c
index b632c71df1a5..047ecb38e09b 100644
--- a/lib/string.c
+++ b/lib/string.c
@@ -412,8 +412,7 @@ char *strnchr(const char *s, size_t count, int c)
 EXPORT_SYMBOL(strnchr);
 #endif
 
-#ifndef __HAVE_ARCH_STRLEN
-size_t strlen(const char *s)
+size_t __generic_strlen(const char *s)
 {
 	const char *sc;
 
@@ -421,6 +420,13 @@ size_t strlen(const char *s)
 		/* nothing */;
 	return sc - s;
 }
+EXPORT_SYMBOL(__generic_strlen);
+
+#ifndef __HAVE_ARCH_STRLEN
+size_t strlen(const char *s)
+{
+	return __generic_strlen(s);
+}
 EXPORT_SYMBOL(strlen);
 #endif
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
