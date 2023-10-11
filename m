Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B75E0CD6115
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 08:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kbRaKIgA1/W3ezwpCGEqHBULpyYbpVR4TL+hrI3HAkk=; b=ACVOj7zK8vza/b
	LdSos0YgKtAp8plCB/2ZN6H+ocgHy302wPQA6bMxG72+nm+sNjctnvY+fBdUhnrLa2pUWzGxGSAJc
	bKZrdcL/uAGnWf1JF3EPb2hWhB30Pq9Xn7JtNxciXGxyDX2GrPE5aKQzFzKIMU51qCM9UmiBmUZuM
	VVluJS+cz/hBGz7MZUHJP/u0gbkb5sTZYg+T10d2A2xFZ0SpsvF2jTLzSVZTPIZ+Cs8Ap3igqE8Uq
	h2gN5Qcpd3ytUBB7V2DEyEOISrogq5OOLy+R8wWrqcxFrwqKb2fpAyDI43JV2dZxLRg39Fok3bcf0
	DI0C/pw6XEMVPnKBV4kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqUfP-00FEXE-1k;
	Wed, 11 Oct 2023 08:34:07 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqUfN-00FEWX-0L
	for linux-riscv@lists.infradead.org;
	Wed, 11 Oct 2023 08:34:06 +0000
X-QQ-mid: bizesmtp86t1697013186tw7nlhwm
Received: from localhost.localdomain ( [58.240.82.166])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 11 Oct 2023 16:33:04 +0800 (CST)
X-QQ-SSF: 01200000000000B0B000000A0000000
X-QQ-FEAT: DpiahrQ8wyJg9GMX+5CGpkVkHTz8Lz+LJrrpYtf7D73/ry6DrR747E+FghQW5
	oRfhUKD/daG8ib41PZLKypfiA15MjMNzpNJcN7b9TeoNlyAsjLntA3SiTG/Aegv2eu46FYQ
	ML+3IzlgjZJzeHFxNOx6fpFv+6OuY2ANQffMIsToUB3sW0RlgKkwD5ufbiVmJeIfJ0wTzBf
	hXoA8IWPnZ/q/GVVT7ZaXYE/e7769qWdhciPKxZ/5TtYfGSXCHHQgsscy6BCzN19bAlOIcT
	4+poDAX0vDzH1UEnYJ+3Ck1UYh8nancQhSqDqGzTN7yqikEH8t577Rrzg5m2FtRiQ4ECeOO
	jUIVdSkjNfCWRiZwQzGyw9PBJoaI8bDUrbUrkmpBe22KYXSDDppoRtcfqNtAw==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18166619308426436661
From: Song Shuai <songshuaishuai@tinylab.org>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	conor.dooley@microchip.com,
	lihuafei1@huawei.com,
	songshuaishuai@tinylab.org,
	petr.tesarik.ext@huawei.com,
	duwe@suse.de,
	ribalda@chromium.org,
	akpm@linux-foundation.org,
	keescook@chromium.org,
	hi@alyssa.is,
	heiko@sntech.de,
	alexghiti@rivosinc.com,
	schwab@suse.de
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kexec@lists.infradead.org
Subject: [PATCH 1/2] riscv: kexec: Cleanup riscv_kexec_relocate
Date: Wed, 11 Oct 2023 16:31:31 +0800
Message-Id: <20231011083132.2428720-2-songshuaishuai@tinylab.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20231011083132.2428720-1-songshuaishuai@tinylab.org>
References: <20231011083132.2428720-1-songshuaishuai@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz4a-0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_013405_472751_AE4A0256 
X-CRM114-Status: UNSURE (   9.91  )
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

For readability and simplicity, cleanup the riscv_kexec_relocate code:

- Re-sort the first 4 `mv` instructions against `riscv_kexec_method()`
- Eliminate registers for debugging (s9,s10,s11) and storing const-value (s5,s6)
- Replace `jalr` with `jr` for no-link jump

I tested this on Qemu virt machine and works as it was.

Signed-off-by: Song Shuai <songshuaishuai@tinylab.org>
---
 arch/riscv/kernel/kexec_relocate.S | 54 +++++++++++++-----------------
 1 file changed, 24 insertions(+), 30 deletions(-)

diff --git a/arch/riscv/kernel/kexec_relocate.S b/arch/riscv/kernel/kexec_relocate.S
index 059c5e216ae7..ece5591abc4e 100644
--- a/arch/riscv/kernel/kexec_relocate.S
+++ b/arch/riscv/kernel/kexec_relocate.S
@@ -17,27 +17,17 @@ SYM_CODE_START(riscv_kexec_relocate)
 	 * s1: (const) Phys address to jump to after relocation
 	 * s2: (const) Phys address of the FDT image
 	 * s3: (const) The hartid of the current hart
-	 * s4: Pointer to the destination address for the relocation
-	 * s5: (const) Number of words per page
-	 * s6: (const) 1, used for subtraction
-	 * s7: (const) kernel_map.va_pa_offset, used when switching MMU off
-	 * s8: (const) Physical address of the main loop
-	 * s9: (debug) indirection page counter
-	 * s10: (debug) entry counter
-	 * s11: (debug) copied words counter
+	 * s4: (const) kernel_map.va_pa_offset, used when switching MMU off
+	 * s5: Pointer to the destination address for the relocation
+	 * s6: (const) Physical address of the main loop
 	 */
 	mv	s0, a0
 	mv	s1, a1
 	mv	s2, a2
 	mv	s3, a3
-	mv	s4, zero
-	li	s5, (PAGE_SIZE / RISCV_SZPTR)
-	li	s6, 1
-	mv	s7, a4
-	mv	s8, zero
-	mv	s9, zero
-	mv	s10, zero
-	mv	s11, zero
+	mv	s4, a4
+	mv	s5, zero
+	mv	s6, zero
 
 	/* Disable / cleanup interrupts */
 	csrw	CSR_SIE, zero
@@ -52,21 +42,27 @@ SYM_CODE_START(riscv_kexec_relocate)
 	 * the start of the loop below so that we jump there in
 	 * any case.
 	 */
-	la	s8, 1f
-	sub	s8, s8, s7
-	csrw	CSR_STVEC, s8
+	la	s6, 1f
+	sub	s6, s6, s4
+	csrw	CSR_STVEC, s6
+
+	/*
+	 * With C-extension, here we get 42 Bytes and the next
+	 * .balign directive would pad zeros here up to 44 Bytes.
+	 * So manually put a nop here to avoid zeros padding.
+	*/
+	nop
 
 	/* Process entries in a loop */
-.align 2
+.balign 4
 1:
-	addi	s10, s10, 1
 	REG_L	t0, 0(s0)		/* t0 = *image->entry */
 	addi	s0, s0, RISCV_SZPTR	/* image->entry++ */
 
 	/* IND_DESTINATION entry ? -> save destination address */
 	andi	t1, t0, 0x1
 	beqz	t1, 2f
-	andi	s4, t0, ~0x1
+	andi	s5, t0, ~0x1
 	j	1b
 
 2:
@@ -74,9 +70,8 @@ SYM_CODE_START(riscv_kexec_relocate)
 	andi	t1, t0, 0x2
 	beqz	t1, 2f
 	andi	s0, t0, ~0x2
-	addi	s9, s9, 1
 	csrw	CSR_SATP, zero
-	jalr	zero, s8, 0
+	jr	s6
 
 2:
 	/* IND_DONE entry ? -> jump to done label */
@@ -92,14 +87,13 @@ SYM_CODE_START(riscv_kexec_relocate)
 	andi	t1, t0, 0x8
 	beqz	t1, 1b		/* Unknown entry type, ignore it */
 	andi	t0, t0, ~0x8
-	mv	t3, s5		/* i = num words per page */
+	li	t3, (PAGE_SIZE / RISCV_SZPTR)	/* i = num words per page */
 3:	/* copy loop */
 	REG_L	t1, (t0)	/* t1 = *src_ptr */
-	REG_S	t1, (s4)	/* *dst_ptr = *src_ptr */
+	REG_S	t1, (s5)	/* *dst_ptr = *src_ptr */
 	addi	t0, t0, RISCV_SZPTR /* stc_ptr++ */
-	addi	s4, s4, RISCV_SZPTR /* dst_ptr++ */
-	sub	t3, t3, s6	/* i-- */
-	addi	s11, s11, 1	/* c++ */
+	addi	s5, s5, RISCV_SZPTR /* dst_ptr++ */
+	addi	t3, t3, -0x1	/* i-- */
 	beqz	t3, 1b		/* copy done ? */
 	j	3b
 
@@ -146,7 +140,7 @@ SYM_CODE_START(riscv_kexec_relocate)
 	 */
 	fence.i
 
-	jalr	zero, a2, 0
+	jr	a2
 
 SYM_CODE_END(riscv_kexec_relocate)
 riscv_kexec_relocate_end:
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
