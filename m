Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95084CD37A7
	for <linux-riscv@archiver.kernel.org>; Fri,  8 May 2026 14:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FIux4e3VZjOrr0snDdwWyxTnw1Z9OjTYVwgZioAxV5M=; b=V76ZNuvr4ZEg87
	SdNFmm0aV6rXO1TtfV62GQ9VNjQKZ85Fg1B5GTomgJFggBB+XTIvZLbTtDq2gQLwPKe7J9FQ5w4/Y
	kk+tOqRa6KPSWl839v3F6TKpa6YkyEEABaPMsMilF2pp4tnhbhF86JARpIj2XVx5LiEFXvppP5duU
	e0z6LgG9Q2S9z+GFnOsUAtLKBHFW/Bz0Y3J3bvm1OZsUtsiomS2OdAPPncfYmQlD9v+4dbpNLGrHg
	uPpCGpf8qK7awgJ8mW6u6WIMe8YU3UY8xlDoLQGLvzxndUzbF9JqrcTZpWPcKVOtoWz4LxcQDCQrm
	jV4muMYDbELiQ7lZRjgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLMJP-00000006gSY-1RKq;
	Fri, 08 May 2026 14:36:19 +0000
Received: from out-183.mta0.migadu.com ([91.218.175.183])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLMJL-00000006gRJ-3wl2
	for linux-riscv@lists.infradead.org;
	Fri, 08 May 2026 14:36:18 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778250968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IvoGuPSpwla1RHAl1U8V7E6i8CVr6Fu/69QlhrzLoA4=;
	b=Q+SzSz903A0m+gJWvWamazwfoCVOWmwwVAWbRkiGsAYa/ffs3QLRykL4gHplrbTtatOQt9
	3gTAw2MZe4JlZ7RP4BUBmANBTaZn8VwVH/xXf7j0vzqLk8sCvJRV+yKq6VyLj1J+p9Pr6M
	aG8rr9FQjzBmw9BS+0YtLtnfnCRmucA=
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
Subject: [PATCH RESEND 1/2] riscv/purgatory: return bool from verify_sha256_digest
Date: Fri,  8 May 2026 16:35:44 +0200
Message-ID: <20260508143544.2484-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1508; i=thorsten.blum@linux.dev; h=from:subject; bh=zV4hfU38HPXgefG3ua5/+P1VbvLku9DJirIeEEEnM8s=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJl/vxw4c/Js6/aw+22bri/Tirohc/2dXWfKPrNpC65PX e93pqyVoaOUhUGMi0FWTJHlwawfM3xLayo3mUTshJnDygQyhIGLUwAm8oCX4Z/tVCmbNzyxBR7s v2af5T6/k/1W2E2GrByrI2brXW5JnDRmZFidu39Gw7Wbp5leTpdn7bjM9y/Kz/+KYEf1tfdMZ52 mpPABAA==
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_073616_266537_318C43AC 
X-CRM114-Status: UNSURE (   8.80  )
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

Change the function's return type from int to bool and return the result
of memcmp() directly to simplify the code.  While at it, cast ->start to
'const u8 *' to better match the expected type.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/riscv/purgatory/purgatory.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/purgatory/purgatory.c b/arch/riscv/purgatory/purgatory.c
index bbd5cfa4d741..15c72dafa3d8 100644
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
+	return memcmp(digest, purgatory_sha256_digest, sizeof(digest));
 }
 
 /* workaround for a warning with -Wmissing-prototypes */

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
