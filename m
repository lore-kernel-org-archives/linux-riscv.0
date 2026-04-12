Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC62BE937EE
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Apr 2026 19:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FIux4e3VZjOrr0snDdwWyxTnw1Z9OjTYVwgZioAxV5M=; b=gpEkhLwStfNi++
	rjcNS/1ThjLaO00zlzln2OaSX0/ZEVDLNL2hsgxcS0rOBPPU4AXkDIFXExPlr/lS2VALbR/eTtkIe
	AbweeOBHnVDhbcvWDB3+fZCgaGyv67d8uqTkTOFa2dU5tbiYrbJjMRPd9DGax5Tp9zyUVYiHeRAjH
	MkVWlvj9/Z0lOXj2kl5sAmu8jFFWUYccLaz/7Q0vXl/+9Wrhllsz/8C+JsxGHh5HDX0bFU5jatbFB
	WPtkXcxIDYkXo7n7RtDnl25QpwBHsh3vc5hc8Hb//EejwaAlJfPYXL2boHbGpkw/2TkIld0tzTans
	i49MOSKW67BqoT/cxWTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC0hP-0000000EdlB-0t4r;
	Sun, 12 Apr 2026 19:42:27 +0000
Received: from out-180.mta0.migadu.com ([2001:41d0:1004:224b::b4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC0hL-0000000Edkr-3UM5
	for linux-riscv@lists.infradead.org;
	Sun, 12 Apr 2026 19:42:25 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776022939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IvoGuPSpwla1RHAl1U8V7E6i8CVr6Fu/69QlhrzLoA4=;
	b=aTLqxri8lSyTkL9a1bis7NmvFerHKBfwmPv+MvwaELjyNuNoSaGGvDkUpnPnwBmiG9L1sL
	YYmfBlL6EANeshD0hmZJRnCvz1/yib6ZPMHWfMf5pAOMYdKRKUO704idsKS0kXPBGBbWbr
	f1qcz+cNRnFdbkzUdcb4a6u/6Wav0YY=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Eric Biggers <ebiggers@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] riscv/purgatory: return bool from verify_sha256_digest
Date: Sun, 12 Apr 2026 21:41:14 +0200
Message-ID: <20260412194113.228703-4-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1508; i=thorsten.blum@linux.dev; h=from:subject; bh=zV4hfU38HPXgefG3ua5/+P1VbvLku9DJirIeEEEnM8s=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJm3v0aeOXm2dXvY/bZN15dpRd2Quf7OrjNln9m0Bdenr vc7U9bK0FHKwiDGxSArpsjyYNaPGb6lNZWbTCJ2wsxhZQIZwsDFKQATcXzP8E9zoZLx3ILHcdde Njsc7mzMCzZ05X6RoP0tJeACj2CAbRAjQ8u+n1sWdAkfvhEQNzu8jv1Z1bVdrhWqW2b83uaVUPB nHR8A
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_124224_080202_A884B41F 
X-CRM114-Status: UNSURE (   8.43  )
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
