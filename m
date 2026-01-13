Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9ACD29DE2
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jan 2026 08:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zpU9uCD3FC1azvwb4KwDoX+Lno/z6DXCucjoqSBxAIE=; b=b2mVMrzRfgYxOB
	WCRl/WTEI/B1FneX111pEMJSU9aRFHS8eSYMh/hDgH9DITFfjsmgjBd7Qo3hcAox3eLdUmquFkKZt
	bYphLV2TZ/BI/w6bY9gvlbwYmU610Ti7QW3SuoKajtTvHmTa75OS5aH98cVtOCuf4Zdu5tdwD1fS4
	n9cXYMgkhDH4dHmVNnuV4sPhC9USqkHKyW/N6rJuuBNEBxjHV25VH0BdLAZG03YwE9l+DSjjWLwCl
	L2Rcj4P5m8840V1wrydvQ9nER1Oq/8lQT0IGoKGj4uSUyKQbQtkCHkoGY3QrZswVci2r9e2AxpIcj
	6O08Vpr87sj2Q4qkRJ/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZlF-00000006jfm-0zwV;
	Tue, 13 Jan 2026 08:28:21 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZl2-00000006jdy-1vBq
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jan 2026 08:28:19 +0000
X-UUID: c4e7f422f05911f0a38c85956e01ac42-20260113
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:cbb74efb-63c1-4bb7-a8f0-49e301156545,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:a9d874c,CLOUDID:c8f361b3fbd1107a830e3721ae491ec1,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c4e7f422f05911f0a38c85956e01ac42-20260113
X-User: jiangfeng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1597642201; Tue, 13 Jan 2026 16:27:59 +0800
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
Subject: [PATCH v2 02/14] lib/string: extract generic strnlen() into __generic_strnlen()
Date: Tue, 13 Jan 2026 16:27:36 +0800
Message-Id: <20260113082748.250916-3-jiangfeng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260113082748.250916-1-jiangfeng@kylinos.cn>
References: <20260113082748.250916-1-jiangfeng@kylinos.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_002808_829018_5F3E4BF7 
X-CRM114-Status: UNSURE (   8.11  )
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
generic C implementation of strnlen() into a standalone function
__generic_strnlen(). This allows tests to compare architecture-optimized
versions against the generic baseline without duplicating code.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
---
 include/linux/string.h |  1 +
 lib/string.c           | 10 ++++++++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/linux/string.h b/include/linux/string.h
index 961645633b4d..04b5fef7a4ec 100644
--- a/include/linux/string.h
+++ b/include/linux/string.h
@@ -201,6 +201,7 @@ extern __kernel_size_t __generic_strlen(const char *);
 #ifndef __HAVE_ARCH_STRLEN
 extern __kernel_size_t strlen(const char *);
 #endif
+extern __kernel_size_t __generic_strnlen(const char *, __kernel_size_t);
 #ifndef __HAVE_ARCH_STRNLEN
 extern __kernel_size_t strnlen(const char *,__kernel_size_t);
 #endif
diff --git a/lib/string.c b/lib/string.c
index 047ecb38e09b..9dfe7177e290 100644
--- a/lib/string.c
+++ b/lib/string.c
@@ -430,8 +430,7 @@ size_t strlen(const char *s)
 EXPORT_SYMBOL(strlen);
 #endif
 
-#ifndef __HAVE_ARCH_STRNLEN
-size_t strnlen(const char *s, size_t count)
+size_t __generic_strnlen(const char *s, size_t count)
 {
 	const char *sc;
 
@@ -439,6 +438,13 @@ size_t strnlen(const char *s, size_t count)
 		/* nothing */;
 	return sc - s;
 }
+EXPORT_SYMBOL(__generic_strnlen);
+
+#ifndef __HAVE_ARCH_STRNLEN
+size_t strnlen(const char *s, size_t count)
+{
+	return __generic_strnlen(s, count);
+}
 EXPORT_SYMBOL(strnlen);
 #endif
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
