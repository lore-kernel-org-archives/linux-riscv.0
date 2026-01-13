Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB2ED29DEB
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jan 2026 08:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NQ++aamXJMMtc0TnCNz63x6Ofv7vGTecSUm3HfJq/qA=; b=VRQz4oqZ1cM4f3
	EMB4sFmfOHhc/cIfqKOSdNfwZgKDO4+IUf8LIuNQb262lT9W3MoZj+x8gp9tg9/CIhGyrQ/fCffnl
	1V5UGmV4ik+JD98nLtD3Lr0VDouKtgakfkOcBiHZaMLMBZvO7qG8bLwS5TF4ezW3oXy5ERWLE3cmR
	kVi54jYlLgYbHibdZ1cQLvxm36Fl0Zmv9gR/e3huJmy+LJn65+og6fomOOOPkMlOhpenXv5DFjp6J
	S2F97IZD1pTnOkWXDnLmLNbBWCfk6NeibxWp4KZCaoGfAJ685OFlce4IPmTNZ8i8+nKf2fJdNqGA2
	77b4borsa/FpzUcuilvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZlH-00000006jgy-0mqT;
	Tue, 13 Jan 2026 08:28:23 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZl4-00000006je1-0o4d
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jan 2026 08:28:21 +0000
X-UUID: c5e11412f05911f0a38c85956e01ac42-20260113
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:5ab30080-ae50-45b0-aff3-7a6bef4d9733,IP:0,UR
	L:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:20
X-CID-META: VersionHash:a9d874c,CLOUDID:03724828cc3a3bcdb5f4d61e365e7909,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c5e11412f05911f0a38c85956e01ac42-20260113
X-User: jiangfeng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1982222664; Tue, 13 Jan 2026 16:28:01 +0800
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
Subject: [PATCH v2 03/14] lib/string: extract generic strchr() into __generic_strchr()
Date: Tue, 13 Jan 2026 16:27:37 +0800
Message-Id: <20260113082748.250916-4-jiangfeng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260113082748.250916-1-jiangfeng@kylinos.cn>
References: <20260113082748.250916-1-jiangfeng@kylinos.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_002810_558381_AF3C67BA 
X-CRM114-Status: UNSURE (   8.82  )
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
generic C implementation of strchr() into a standalone function
__generic_strchr(). This allows tests to compare architecture-optimized
versions against the generic baseline without duplicating code.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
---
 include/linux/string.h |  1 +
 lib/string.c           | 14 ++++++++++----
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/include/linux/string.h b/include/linux/string.h
index 04b5fef7a4ec..57f8bf543891 100644
--- a/include/linux/string.h
+++ b/include/linux/string.h
@@ -169,6 +169,7 @@ extern int strcasecmp(const char *s1, const char *s2);
 #ifndef __HAVE_ARCH_STRNCASECMP
 extern int strncasecmp(const char *s1, const char *s2, size_t n);
 #endif
+extern char *__generic_strchr(const char *, int);
 #ifndef __HAVE_ARCH_STRCHR
 extern char * strchr(const char *,int);
 #endif
diff --git a/lib/string.c b/lib/string.c
index 9dfe7177e290..8ad9b73ffe4e 100644
--- a/lib/string.c
+++ b/lib/string.c
@@ -317,6 +317,15 @@ int strncmp(const char *cs, const char *ct, size_t count)
 EXPORT_SYMBOL(strncmp);
 #endif
 
+char *__generic_strchr(const char *s, int c)
+{
+	for (; *s != (char)c; ++s)
+		if (*s == '\0')
+			return NULL;
+	return (char *)s;
+}
+EXPORT_SYMBOL(__generic_strchr);
+
 #ifndef __HAVE_ARCH_STRCHR
 /**
  * strchr - Find the first occurrence of a character in a string
@@ -328,10 +337,7 @@ EXPORT_SYMBOL(strncmp);
  */
 char *strchr(const char *s, int c)
 {
-	for (; *s != (char)c; ++s)
-		if (*s == '\0')
-			return NULL;
-	return (char *)s;
+	return __generic_strchr(s, c);
 }
 EXPORT_SYMBOL(strchr);
 #endif
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
