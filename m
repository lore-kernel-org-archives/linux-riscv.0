Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D92CA5FFF
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2026 00:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ODKw2I4SEifV7f16jdOnTfETt21HQggoiQpbHAxFqos=; b=4pmArOXcO/LRay
	O5hboB4dWE1fG/JJVjQZp7BQGZ9+m2hIzqsdzXelJ6jXZl/mjhNc+/7bDVYLMaMj9oLBSh+CKSaJy
	T8G1sHMcd3CXmBl/GsFGJP0rhHmC6cfbjYqak19YhCc3V680+xZlBVhWWapWEgRRqIlsab4nDo+lN
	7Ly+ShzUbufSb0IFzS9I1sTbL1KZwklbNOR4XoWDJo67evxWxzzRNiT4SsipcDYDs1rJLNj1v900Q
	3RcZ1xjjeDeAea8znSHDWPq13i0I+AteJ+r5DY/WL5ho5NF20lgXRmt8Hb0zsJZ8bGSiSwuwDO+r+
	lAywqcw+qfxPVifntcRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDtA3-0000000HOaO-0JYE;
	Tue, 06 Oct 2026 00:36:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDtA1-0000000HOa5-35HH
	for linux-riscv@lists.infradead.org;
	Tue, 06 Oct 2026 00:36:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2E1DB4334B;
	Tue,  6 Oct 2026 00:36:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F2F80C4AF64;
	Tue,  6 Oct 2026 00:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791246961;
	bh=BMbO745xygl9ggB8O2ERB9kFSsHTnyHqyyPpSoSdJd0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YBXpVnmPhLROSKDwNLzmvtqCxw3g7Y1nfKx1mvyx+cRN+3Dlyo2OQJpVss6Qkc4v9
	 bgtU/eSXV5H7X882BevM1YNFN7Mw1YPbpt72sfJ4REYgdcxXUINMdjw1Nc2f6wEena
	 mpsHHld5drhqaMQLtaCXT2+XYC0SVHG87ngBqlZDcjsvlJPt4Ejd8EyMwM/doA/sJR
	 Gl4DDrbCyC5sK+UU907mHl5p38OT/8jYBZW8cZO3OEKQmOpNCr405iu0F+4axHjjYG
	 23jk5QEZKBkwSmDoYVLK4IlA5Q9qmJJoKrnQEqDlptKTY6gsII2CaXVm1R9JqzBXgL
	 v7kO4x6cpNHkg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E30F9CA6001;
	Tue,  6 Oct 2026 00:36:00 +0000 (UTC)
From: Gleb Pesin via B4 Relay <devnull+dormancygrace.gmail.com@kernel.org>
Date: Tue, 06 Oct 2026 03:35:56 +0300
Subject: [PATCH 3/3] riscv: Disable the xtheadvector unit on kernel entry
MIME-Version: 1.0
Message-Id: <20261006-riscv-xtheadvector-vs-v1-3-b00e5abc9f7a@gmail.com>
References: <20261006-riscv-xtheadvector-vs-v1-0-b00e5abc9f7a@gmail.com>
In-Reply-To: <20261006-riscv-xtheadvector-vs-v1-0-b00e5abc9f7a@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Andy Chiu <tchiu@tenstorrent.com>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, stable@vger.kernel.org, 
 Gleb Pesin <dormancygrace@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791246959; l=2161;
 i=dormancygrace@gmail.com; s=20261006; h=from:subject:message-id;
 bh=QQB545Y5GthJc3aps7t7217QNuC1lzUjs760uVslRWU=;
 b=pBklWC8ABOaDr3+tT9E9nKkIEvVnsrT62W428b1i7o5ARYAGv/Qe9xtflZQYjkx7ZnqLgS6kj
 feKzM8Be0AkBfMmsEnLSuVlAt0QHg1W7ulhLorjvdn86iEBSThdjL2B
X-Developer-Key: i=dormancygrace@gmail.com; a=ed25519;
 pk=Ha8pk6XE0bhPh/mNtu1MKWgYqiX+CxZdhLyDR1rgD/M=
X-Endpoint-Received: by B4 Relay for dormancygrace@gmail.com/20261006 with
 auth_id=1121
X-Original-From: Gleb Pesin <dormancygrace@gmail.com>
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
Reply-To: dormancygrace@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Gleb Pesin <dormancygrace@gmail.com>

handle_exception clears SR_FS_VS on entry so that stray floating-point
or vector instructions in the kernel raise an illegal-instruction
exception. xtheadvector keeps its vector status in SR_VS_THEAD
(sstatus bits 24:23), which that mask does not cover. On 64-bit kernels
bit 23 happens to be cleared as SR_SPELP, so the T-Head field is only
partly reset: DIRTY becomes CLEAN, and the vector unit stays enabled in
the kernel after a trap from a context that used it.

Clear the whole SR_VS_THEAD field on cores with xtheadvector. The status
saved in pt_regs still holds the interrupted value, so the vector state
is restored on return exactly as before. Other cores keep the current
mask, because bit 24 is not part of the vector status there.

Fixes: d863910eabaf ("riscv: vector: Support xtheadvector save/restore")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Gleb Pesin <dormancygrace@gmail.com>
---
 arch/riscv/kernel/entry.S | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index d799c4e56..aeb99c20b 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -16,6 +16,8 @@
 #include <asm/thread_info.h>
 #include <asm/asm-offsets.h>
 #include <asm/errata_list.h>
+#include <asm/vendor_extensions.h>
+#include <asm/vendor_extensions/thead.h>
 #include <linux/sizes.h>
 
 	.section .irqentry.text, "ax"
@@ -176,9 +178,14 @@ SYM_CODE_START(handle_exception)
 	 * actual user copy routines.
 	 *
 	 * Disable the FPU/Vector to detect illegal usage of floating point
-	 * or vector in kernel space.
+	 * or vector in kernel space. xtheadvector keeps its vector status in
+	 * a different sstatus field; those bits are reserved elsewhere.
 	 */
-	li t0, SR_SUM | SR_FS_VS
+	ALTERNATIVE(__stringify(li t0, SR_SUM | SR_FS_VS),
+		    __stringify(li t0, SR_SUM | SR_FS_VS | SR_VS_THEAD),
+		    THEAD_VENDOR_ID,
+		    RISCV_VENDOR_EXT_ALTERNATIVES_BASE + RISCV_ISA_VENDOR_EXT_XTHEADVECTOR,
+		    CONFIG_RISCV_ISA_XTHEADVECTOR)
 #ifdef CONFIG_64BIT
 	li t1, SR_ELP
 	or t0, t0, t1

-- 
2.53.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
