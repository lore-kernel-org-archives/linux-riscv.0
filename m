Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018EFE92FE5
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Dec 2025 22:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ccg3jU7nYmDd4bLAiYx6UN1Ok3z9H0t/N869MlLQSv0=; b=Ep43ry6uGvs2vt
	4eGoNgY0I6XT3sIMzR+D6Le+giUABVrmK8uHf9ytCBk8UoMnp2VckxdV4pKz929igMFWQXubi5Nl2
	Z7K/7mywXV4g7/dTMv1Ug87zgJacJDyoEiTKY2hHVK49O0rEahQMm+onhdR2XODfgbc9TqcDFyI1X
	ZKcGD+VaDFs/bP0N2u1EC+M+9ekr9HNIEEYHVdz/kkWPsPjXTIpRuHa0qYSt3Bc48UYfslIa2o7Ck
	0OS0L5TzvHs+FGUukKCGVyKTKRPo9Y1f/yAY4oWTKfP+vbQnErZ+bzp4SOFfIndqRh2lHndiBQQEz
	AZbVqp6s6O4q7paHc3GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaLtO-000000047a4-0IMR;
	Mon, 29 Dec 2025 22:39:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaLtM-000000047Zt-2Kcz
	for linux-riscv@lists.infradead.org;
	Mon, 29 Dec 2025 22:39:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AA91E6000A;
	Mon, 29 Dec 2025 22:39:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 338F1C4CEF7;
	Mon, 29 Dec 2025 22:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767047947;
	bh=G9tQ0hkFSi73XXtRzgVQUNRUaxJUsQu73ITJfWZswWI=;
	h=From:To:Cc:Subject:Date:From;
	b=loI30cCvRXDdija63qGpBf6jdiWTTQes9pMyumpng4P/dbw61ZpvjYJ4rq0RoZowf
	 Z6YAgMalwlkoYsR6R0/FbXBWJuUPejONQrm3vrdj/ZZgaivNDzFGER6WFXxnlxoJGT
	 Clo9JPNd6SpBGBKDiNtdGeItv1w3Z0S1aEVTTQHCESH9qB7Bp4s7sPJrurWuByP1HW
	 4xgXeh9XKUMu1YdJqzEm5Kg8UJfZthYrfX+IYrTJeW3Xa+MMweDAClNANJW491iy48
	 c9JB9Agz6ixnvqKv+cMEvWM+CM3UjEWaJXTZRbH8m0cCTQZM3R3vBY1eS8dS8t8uPQ
	 ggfweNn/n7Mng==
From: Eric Biggers <ebiggers@kernel.org>
To: stable@vger.kernel.org
Cc: linux-crypto@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 6.12] lib/crypto: riscv/chacha: Avoid s0/fp register
Date: Mon, 29 Dec 2025 14:37:29 -0800
Message-ID: <20251229223729.99861-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
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

From: Vivian Wang <wangruikang@iscas.ac.cn>

commit 43169328c7b4623b54b7713ec68479cebda5465f upstream.

In chacha_zvkb, avoid using the s0 register, which is the frame pointer,
by reallocating KEY0 to t5. This makes stack traces available if e.g. a
crash happens in chacha_zvkb.

No frame pointer maintenance is otherwise required since this is a leaf
function.

Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
Fixes: bb54668837a0 ("crypto: riscv - add vector crypto accelerated ChaCha20")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/20251202-riscv-chacha_zvkb-fp-v2-1-7bd00098c9dc@iscas.ac.cn
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/riscv/crypto/chacha-riscv64-zvkb.S | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/crypto/chacha-riscv64-zvkb.S b/arch/riscv/crypto/chacha-riscv64-zvkb.S
index bf057737ac69..fbef93503571 100644
--- a/arch/riscv/crypto/chacha-riscv64-zvkb.S
+++ b/arch/riscv/crypto/chacha-riscv64-zvkb.S
@@ -58,11 +58,12 @@
 #define CONSTS3		t0
 #define TMP		t1
 #define VL		t2
 #define STRIDE		t3
 #define NROUNDS		t4
-#define KEY0		s0
+#define KEY0		t5
+// Avoid s0/fp to allow for unwinding
 #define KEY1		s1
 #define KEY2		s2
 #define KEY3		s3
 #define KEY4		s4
 #define KEY5		s5
@@ -139,11 +140,10 @@
 // The counter is treated as 32-bit, following the RFC7539 convention.
 SYM_FUNC_START(chacha20_zvkb)
 	srli		LEN, LEN, 6	// Bytes to blocks
 
 	addi		sp, sp, -96
-	sd		s0, 0(sp)
 	sd		s1, 8(sp)
 	sd		s2, 16(sp)
 	sd		s3, 24(sp)
 	sd		s4, 32(sp)
 	sd		s5, 40(sp)
@@ -275,11 +275,10 @@ SYM_FUNC_START(chacha20_zvkb)
 	slli		TMP, VL, 6
 	add		OUTP, OUTP, TMP
 	add		INP, INP, TMP
 	bnez		LEN, .Lblock_loop
 
-	ld		s0, 0(sp)
 	ld		s1, 8(sp)
 	ld		s2, 16(sp)
 	ld		s3, 24(sp)
 	ld		s4, 32(sp)
 	ld		s5, 40(sp)

base-commit: 567bd8cbc2fe6b28b78864cbbbc41b0d405eb83c
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
