Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C815A1125854
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Mar 2026 17:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tlIvmVRXojeOXnRhPHfPuaVmP3WsOtV8gF7PESMs0GQ=; b=XeDc5YMdKJwz47
	lzvuU8KE63X5sn7lhBs9hLH5rltwvQ6od9NXLJGm1LM8Zh6vQqLrCRTYxl6X8IgHlyTndLX1t0CEG
	Bqbfj2cI7YOEQv8Mw/VkGhku3gFQ7jKbC7PHEZfU6Jqwmw9PtTVRCyZe2ltf7P/UlHisewQ3iVMaX
	+zGjbEzCAH9f6OaiMtU0//yL0Bz/6XEJKZVYoAYeeWFoBmvLUDELb+0cF8EbzYMLIJOkLGDGmxD5U
	EBh0iLr6CYaBSoBrE8XS7KqAQco52A4VGIDSPNYi7v7jRuvhYF0BFl9+TvJjOAtu41QB6rIDAZYOG
	0dDb8S4leGFWhZgG3OFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0NPP-0000000C2D9-0xR5;
	Wed, 11 Mar 2026 17:31:47 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0NPN-0000000C2CQ-0yVc
	for linux-riscv@lists.infradead.org;
	Wed, 11 Mar 2026 17:31:46 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-48541edecf9so1102415e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 11 Mar 2026 10:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773250303; x=1773855103; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cq/zfyOGI1UhA1JJnslrSZjKnQT3mMB2hM6EdxiCDT8=;
        b=FOWaFErRhh8nSR89Gf4am9LrG1kNx4NotYvL9UDHszzR6H116BFrpZzSEXHLdQHJUE
         UDQmUio2GJyw70Qb6aTeR9xw3g5Lv2F9s2P6Lnf+LfVYIB+aqeJq+vHbZYizpnNqrF9e
         5HnX0qwn0/adyzfHZ07lWBgwLUkdBElj7LLYGaa8kiTb/oGN1pLq+8O2sokXSxttoq4Z
         Q6+6RJoJcKLWhIHAVpBNa3yHcahLrE30hqqxuGDcRnjqjyP3t8nABPRqQqJl/Q7Wum3c
         eLfCplXGc56IYf4PfC04DOgy16DsrIGxFoeOe00mERXHuO5ngnp0/Fu3slA1gcvyzR1o
         scEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773250303; x=1773855103;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cq/zfyOGI1UhA1JJnslrSZjKnQT3mMB2hM6EdxiCDT8=;
        b=Pm9iZiK9hi562OXmRT67TkD6s/vh7Fb3HBdDEXJSZg/jV6b0oRYtsmGPx1Ung+iKz0
         nJzGpB9xSClzg36RJMmHMg0YaTudtBwgnyUGlOcrcssfk+MiqXVJthOrKdthJdO1P6yR
         3Kj7Zx28Wa7MeohDy9vwmrEJFCZTb1PAFBGkh9b4DrMJByrMX8ZZPwkgQroVQiBlqIuZ
         cjDxaLEUkE15wfBL346ixBmIuGuiS4v6kEnCAeHrqSgHMKjK5eRbXR0mT/FYjiqTZnYg
         sFiCOzUQQFAEI0ihLCwBwPF4tIChD1T1PWqlhDr25P4RKMBvXuJDbnWa+5aReUQwi8il
         0ggA==
X-Gm-Message-State: AOJu0YzQ80+8kwifcRmCQOIBhsH7TBYjH6i5fD+6Pbhpv71HZkcNkUCq
	vZM/M/zFPZyxVGPWyiTwRQlSELMMi8N9cqJRBoYfBwDLwzR4AoQkGYW5
X-Gm-Gg: ATEYQzwEdCtr3yFi6rtSuIixwK+gZbYBYiA6fHcoUKv03ILUtWwQp4ZsCU3FMdBmkHM
	USBSx7oLPWMPBJqqpw6g4UTbmenTAU6s2RPHHsN22qOxsdMBH425Ns6Jky3n0mp9Tb5FFInvf8n
	4Rgnlck/7rmte9c4M2EzISOufG2mrOgrVrAaGLzthw0/5iT/Hl0fnnMl8t5OjpjLrgycsUXuGAZ
	hPFb3SL4zv/81svhCG0lIEmPmG9x0a0uGEZZeSKNz39tkC8cJtPCXu3LyKvsdHlvzRSYLC9tFOR
	TkWgQOk0f0XenmUOiWJBckonsrrf2iotnBCprPa+uJXmFw3DgVBZkDZ0n1YEz3t1JNP64LC3P0g
	tOtupRfPR36O46BGnZ0cXT5f5hl58RZ/OMVtDYefxyYYpOFAfMLzTmktD1Jhwc/31oYlaKSmOL0
	yNKnb2pc1VSr+krkTOyklI5JbfLeS5IwPNfDl6tKnAEq9aTO8J/5qLOE7FqoCQZNAVVIRnxDTS
X-Received: by 2002:a05:600c:19cf:b0:485:3c2d:d02b with SMTP id 5b1f17b1804b1-4854b0fe9e4mr59456535e9.22.1773250302532;
        Wed, 11 Mar 2026 10:31:42 -0700 (PDT)
Received: from turbo.teknoraver.net (net-5-95-156-124.cust.vodafonedsl.it. [5.95.156.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b0c3a10sm22829495e9.12.2026.03.11.10.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 10:31:42 -0700 (PDT)
From: Matteo Croce <technoboy85@gmail.com>
X-Google-Original-From: Matteo Croce <teknoraver@meta.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] riscv: memcpy: fast copy for unaligned buffers
Date: Wed, 11 Mar 2026 18:31:38 +0100
Message-ID: <20260311173138.1820-1-teknoraver@meta.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_103145_319747_CC0454FD 
X-CRM114-Status: GOOD (  15.76  )
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

From: Matteo Croce <technoboy85@gmail.com>

The RISC-V memcpy() does an 8 byte wide copy when the two buffers have
the same alignment, and fallbacks to a single byte copy otherwise.

Implement a unaligned aware 8 byte copy when buffers are unaligned
which copies 8 bytes at time by doing proper shifting.

Synthetic benchmarks[1] show that the aligned code path is unaffected,
while the unaligned one gets a ~2.3x boost:

  Before:
      memcpy: aligned copy of 400 MBytes in 429 msecs (931 MB/s)
      memcpy: unaligned copy of 400 MBytes in 1202 msecs (332 MB/s)

  After:
      memcpy: aligned copy of 400 MBytes in 428 msecs (933 MB/s)
      memcpy: unaligned copy of 400 MBytes in 519 msecs (770 MB/s)

Network RX benchmarks on a Milk-V Megrez (ESWIN EIC7700X) with a
1 Gbps NIC (stmmac driver) confirm the improvement in a real-world
scenario. UDP RX flood with varying frame sizes:

  Frame size    stock memcpy     optimized memcpy     Improvement
  ----------    ------------     ----------------     -----------
   64 bytes      242.6 Kpps        246.9 Kpps           +1.8%
  128 bytes      225.3 Kpps        243.0 Kpps           +7.9%
  256 bytes      200.8 Kpps        227.8 Kpps          +13.4%
  512 bytes      165.4 Kpps        203.6 Kpps          +23.1%

Throughput at 512-byte frames improved from 672 Mbps to 827 Mbps.
The improvement scales with frame size as larger frames copy more
bytes per packet. Larger frame sizes were not tested as they would
saturate the 1 Gbps link.

[1] https://lore.kernel.org/lkml/20260301011209.4160-1-teknoraver@meta.com/

Signed-off-by: Matteo Croce <teknoraver@meta.com>
---
v2: add network benchmarks and link to synthetic benchmark

 arch/riscv/lib/memcpy.S | 84 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 79 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/lib/memcpy.S b/arch/riscv/lib/memcpy.S
index 44e009ec5fef..293f8a348cfd 100644
--- a/arch/riscv/lib/memcpy.S
+++ b/arch/riscv/lib/memcpy.S
@@ -10,13 +10,14 @@
 SYM_FUNC_START(__memcpy)
 	move t6, a0  /* Preserve return value */
 
-	/* Defer to byte-oriented copy for small sizes */
-	sltiu a3, a2, 128
-	bnez a3, 4f
-	/* Use word-oriented copy only if low-order bits match */
+	/* Check alignment first */
 	andi a3, t6, SZREG-1
 	andi a4, a1, SZREG-1
-	bne a3, a4, 4f
+	bne a3, a4, .Lshifted_copy
+
+	/* Aligned path: defer to byte-oriented copy for small sizes */
+	sltiu a5, a2, 128
+	bnez a5, 4f
 
 	beqz a3, 2f  /* Skip if already aligned */
 	/*
@@ -76,6 +77,79 @@ SYM_FUNC_START(__memcpy)
 	addi t6, t6, 16*SZREG
 	bltu a1, a3, 3b
 	andi a2, a2, (16*SZREG)-1  /* Update count */
+	j 4f			/* Skip shifted copy section */
+
+.Lshifted_copy:
+	/*
+	 * Source and dest have different alignments.
+	 * a3 = dest & (SZREG-1), a4 = src & (SZREG-1)
+	 * Align destination first, then use shifted word copy.
+	 */
+
+	/* For small sizes, just use byte copy */
+	sltiu a5, a2, 16
+	bnez a5, 4f
+
+	/* If dest is already aligned, skip to shifted loop setup */
+	beqz a3, .Ldest_aligned
+
+	/* Calculate bytes needed to align dest: SZREG - a3 */
+	neg a5, a3
+	addi a5, a5, SZREG
+	sub a2, a2, a5		/* Update count */
+
+.Lalign_dest_loop:
+	lb a4, 0(a1)
+	addi a1, a1, 1
+	sb a4, 0(t6)
+	addi t6, t6, 1
+	addi a5, a5, -1
+	bnez a5, .Lalign_dest_loop
+
+.Ldest_aligned:
+	/*
+	 * Dest is now aligned. Check if we have enough bytes
+	 * remaining for word-oriented copy.
+	 */
+	sltiu a3, a2, SZREG
+	bnez a3, 4f
+
+	/*
+	 * Calculate shift amounts based on source alignment (distance).
+	 * distance = src & (SZREG-1), guaranteed non-zero since we only
+	 * reach here when src and dest had different alignments.
+	 */
+	andi a3, a1, SZREG-1	/* a3 = distance */
+	slli a4, a3, 3		/* a4 = distance * 8 (right shift amount) */
+	li a5, SZREG*8
+	sub a5, a5, a4		/* a5 = SZREG*8 - distance*8 (left shift) */
+
+	/* Align src backwards to word boundary */
+	sub a1, a1, a3
+
+	/* Calculate end address: dest + (count rounded down to words) */
+	andi a6, a2, ~(SZREG-1)
+	add a6, t6, a6		/* a6 = loop end address for dest */
+
+	/* Load first aligned word from source */
+	REG_L t0, 0(a1)
+
+.Lshifted_loop:
+	REG_L t1, SZREG(a1)	/* Load next aligned word */
+	srl t2, t0, a4		/* Shift right: low part from current word */
+	mv t0, t1		/* Current = next for next iteration */
+	addi a1, a1, SZREG
+	addi t6, t6, SZREG
+	sll t3, t0, a5		/* Shift left: high part from next word */
+	or t2, t2, t3		/* Combine to form output word */
+	REG_S t2, -SZREG(t6)	/* Store to aligned dest */
+	bltu t6, a6, .Lshifted_loop
+
+	/* Restore src to correct unaligned position */
+	add a1, a1, a3
+	/* Calculate remaining byte count */
+	andi a2, a2, SZREG-1
+	/* Fall through to label 4 for remaining bytes */
 
 4:
 	/* Handle trailing misalignment */
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
