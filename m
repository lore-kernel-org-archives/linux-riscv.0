Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31DD3CD37B2
	for <linux-riscv@archiver.kernel.org>; Sat,  9 May 2026 07:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+QUWZxcltA2gBWCXpM+gtd9Cx+lca2EUs3uaRZbpHc8=; b=UuBEUu0bIHdPcX
	Bv8fe3XpRIzUUS35q+Vq7uOeRPGjXQsTaGHIGSH22ojWlVwfkj8Gego5ZzcKIywZVKIEhBcLtkJnw
	Lum7ifqsYOsS6JyIuSaUMo7wE8IvcSOvFs2khOGLps7kbRmwboEPssFBsMc290xENJO7UdaehpAY6
	pw1656ADE8fBwKgHrtGFwPvf5baUiOOZnpcjIHfOqDIo5VCFxr/4rnDWGtCNBaCzIT3jCw4GdOqLH
	KGvRZAjAVNTYwC2iXBEN0oUwUZ52jo884S3rvRe4lsPNu9a8kH8D5liiwFIcRoyGZclMX2gksCyz0
	ZfQmULyLTW8njiL0XVJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLcHR-00000008VDa-23n0;
	Sat, 09 May 2026 07:39:21 +0000
Received: from out-183.mta0.migadu.com ([91.218.175.183])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLcHO-00000008VCk-2IEa
	for linux-riscv@lists.infradead.org;
	Sat, 09 May 2026 07:39:20 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778312354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ALn5vWljU/fPoLd3GB3xTWUGvCIhsExGeZzm58DpKd8=;
	b=niXtNgIb1fwJv67QgDcBsYweRVno2efsohmmToE/zL5hB6/hVCFaU0ScPUkugzVXypjhdh
	04N/WxNVPPE1+o5Hk1S5efQ2aU37IBdeQRzhWz0zeUykjqvzyxcMMq2wYTMZeQNNFjN6OC
	QOKN49K6vEiEtjDQipcuo9jjHGLh34Y=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] riscv/purgatory: return bool from verify_sha256_digest
Date: Sat,  9 May 2026 09:38:50 +0200
Message-ID: <20260509073850.44595-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1854; i=thorsten.blum@linux.dev; h=from:subject; bh=dOLgFJTy8JLvzmSFaoqYz9sOLYJWoxubaDRMCBGo53o=; b=kA0DAAoWXqtxINjMdS4ByyZiAGn+5Iqi3Xr1UsOQUCDC7zLRW87jrBcNtohW3o0Kf6QLGaeKY Yh1BAAWCgAdFiEE4Jr4mE11fHmyNFi5XqtxINjMdS4FAmn+5IoACgkQXqtxINjMdS5qsgD/TFGy wUNyXrSnEtJQq9svFIJlxL6+nq0bbyx2OgRIohIBAIYwKUfk8DNN30v4QcQnqUafZQhWZtn39sX MCB5uc4wJ
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_003919_003886_D91925B3 
X-CRM114-Status: GOOD (  10.52  )
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

Change the function's return type from int to bool and return the result
of memcmp() directly to simplify the code.  While at it, cast ->start to
'const u8 *' to better match the expected type.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
Changes in v2:
- Return true on success and false on failure (Eric)
- v1: https://lore.kernel.org/lkml/20260412194113.228703-4-thorsten.blum@linux.dev/
---
 arch/riscv/purgatory/purgatory.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/purgatory/purgatory.c b/arch/riscv/purgatory/purgatory.c
index bbd5cfa4d741..745deeb6e3a5 100644
--- a/arch/riscv/purgatory/purgatory.c
+++ b/arch/riscv/purgatory/purgatory.c
@@ -17,7 +17,7 @@ u8 purgatory_sha256_digest[SHA256_DIGEST_SIZE] __section(".kexec-purgatory");
 
 struct kexec_sha_region purgatory_sha_regions[KEXEC_SEGMENT_MAX] __section(".kexec-purgatory");
 
-static int verify_sha256_digest(void)
+static bool verify_sha256_digest(void)
 {
 	struct kexec_sha_region *ptr, *end;
 	struct sha256_ctx sctx;
@@ -26,11 +26,10 @@ static int verify_sha256_digest(void)
 	sha256_init(&sctx);
 	end = purgatory_sha_regions + ARRAY_SIZE(purgatory_sha_regions);
 	for (ptr = purgatory_sha_regions; ptr < end; ptr++)
-		sha256_update(&sctx, (uint8_t *)(ptr->start), ptr->len);
+		sha256_update(&sctx, (const u8 *)(ptr->start), ptr->len);
 	sha256_final(&sctx, digest);
-	if (memcmp(digest, purgatory_sha256_digest, sizeof(digest)) != 0)
-		return 1;
-	return 0;
+
+	return memcmp(digest, purgatory_sha256_digest, sizeof(digest)) == 0;
 }
 
 /* workaround for a warning with -Wmissing-prototypes */
@@ -38,7 +37,7 @@ void purgatory(void);
 
 void purgatory(void)
 {
-	if (verify_sha256_digest())
+	if (!verify_sha256_digest())
 		for (;;)
 			/* loop forever */
 			;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
