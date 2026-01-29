Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B0E4D46BED
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jan 2026 01:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S+g7bESuhUeNLRH+Lhd8F5ILaFKjNK4S+qiPEV3oaj0=; b=dje2Ot3+gSuD4g
	WGgRZGeAiF9Zduv9OjM4+ABv/N9UeFdW04b+gAuhQtLiEpjpEwVt5pjeNhcRVcaTgzyZHHEPwa0wl
	rz0FiowrWVz0/CasPPYS3LCHy3FQ1uBsJRH/e57z0qa7rtlMpCujVo2hKYUeXwhc5ftorrRufFine
	VeLmqC3BX0CHbzHQbirRzGEUYfDgSX4eLBYC/VKSB+K71BoKDPx/9Q1RaExYE6VpzQkfzonaZUcka
	Iy+OOOdk/Vo94VDWRdJr/VZ8F/nhLLAa9YidQqXo0OtdRLKXRVbtAZXHWnNgFdgSuQLOx4Ti7K44T
	g7EBDNaM6wjxsJWJmz1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlGQP-0000000H1en-2xxU;
	Thu, 29 Jan 2026 01:02:21 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlGQN-0000000H1eR-2YCZ
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jan 2026 01:02:20 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso3431295e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 28 Jan 2026 17:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769648537; x=1770253337; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h4iBj8KyUyTe6sipZIufqWbKIe7HfRCC1Q1VoGen0RU=;
        b=eK2WjwxJuHx049ic7JxOz1jlkme+esxEHyXUoR6AfbT04Aju8yoCXoE18DIAarsp7Q
         D0omkSFK6TQdcYCEzhhGPvZdFqXpYr+5q5vtBm0YLe9tLJ41AhAXWFhDv8iWD717X38b
         wmAwk7kj+/x9m7AWOgbFJG9qw5St22CQodIX7gjkoEkW3uc1kflVqaHBlEcJWvHDGWMj
         TNgr2LP4FWVOlm4p2yPj36ghulVWv0DvDi6oHfw8hOlD3lsZqCMAx7xph370bSd1jMVU
         xTDwEp+6VAkjxVKSot302dBUbVKxOY1dZbeaoiOQE9TmbyO+lanKxcdO1nx0m+k51Imk
         jWQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769648537; x=1770253337;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4iBj8KyUyTe6sipZIufqWbKIe7HfRCC1Q1VoGen0RU=;
        b=QC2+ooM/VM5lQukyF7gDrR8F8IbJDxZRpBwSCcMTOIZ/ZVEhFKRTCRTjlU2d5uvQM0
         Gc3xus2FunZA47nQUsxMFskGfzpspQQ5cephT9UGK0LBu6YHtqo4KpXYsgmWq9YLs8NS
         8tot0L3IS0+mGO2F62q2A+41Qk/CaY7ZO82LkXPJ0ekIi5KTE669hiKOGvNRH4LjAsdj
         Xq7t6n/Y2ukRRefvcT5Z/exjo+Snh8V4x8gvuzxUxncEI7dZNZsJTI4Uqx/eft+2eUGv
         EXO4u4CX/PHxXrhYRLOXxqcCyl9KYwoNT29XEYGa7bCq7rCilvOdvG5EKhDYha2gAm0p
         cs7Q==
X-Gm-Message-State: AOJu0YyKMWQwJhedoTGj4X+OKXao574V/VCw6uVHDWIeNjzx0bs25m+W
	+fgVZu1OQuNX0ckDSTe2XUTCFWS9MaHcaAAxSLAzdh4V3CN8aNQJS5rXSfRsZKg8IXM=
X-Gm-Gg: AZuq6aJCcykPlCjJuHVpMooxCHMESw8csMO1F98puz48PVIWQzqCq2iHNp4U+VyVhBb
	8a74vCI1zWIhNAzFHRwEh5iRqvj8iyN4hp8LEfszNPz6VFwKl08GR1T1ODH4qtEbhJHdQlHemZE
	acp9euy1kNAGWRAVII8JIJRS70rsfzu3+5i1rWKkf75yNHPkMgiHvexrWuxt5XFBHoFhhXhCoWg
	6/kdCbfWp0Hov20OOrZOFqQa3gImTYy5r+FoXOhMKod0UXow6tuHNF0PTiJmBnYjhJY+89C6Nce
	M9irpv4JgZKyhhuA4LCjLUl92bkozIZSgJzYHQ7nIMr4eZlgNxcHNjAdj3/4QHmExm0vUKAiPTJ
	su/x98dSFKl8RzBTKszV7oCdhNs3GIlf1A5ZJTL2LDW0Jw73g0grqW3MzS52LUGJsvCHltu50OG
	8p6aM1f75dYJbbVRZf2leMW0GCrPdzmaGgw+SRdl+staYwBeRgjqmc6WSpZPqjmR/wMcHeTapZs
	Q==
X-Received: by 2002:a05:600c:35cb:b0:471:700:f281 with SMTP id 5b1f17b1804b1-48069c7c492mr96027775e9.25.1769648536595;
        Wed, 28 Jan 2026 17:02:16 -0800 (PST)
Received: from turbo.teknoraver.net (net-37-117-189-76.cust.vodafonedsl.it. [37.117.189.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066bee7d0sm172742115e9.4.2026.01.28.17.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 17:02:16 -0800 (PST)
From: Matteo Croce <technoboy85@gmail.com>
X-Google-Original-From: Matteo Croce <teknoraver@meta.com>
To: linux-riscv@lists.infradead.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: memcpy: fast copy for unaligned buffers
Date: Thu, 29 Jan 2026 02:02:11 +0100
Message-ID: <20260129010211.103615-1-teknoraver@meta.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_170219_666577_EFF71574 
X-CRM114-Status: GOOD (  14.69  )
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

The RISC-V memcpy() does an 8 byte wide copy when the two buffers have
the same alignment, and fallbacks to a single byte copy otherwise.

Implement a unaligned aware 8 byte copy when buffers are unaligned
which copies 8 bytes at time by doing proper shifting.

Benchmarks shows that the aligned code path is unaffected, while the
unaligned one gets a ~2.3x boost.

Benchmark with the current implementation:
    memcpy: aligned copy of 400 MBytes in 429 msecs (931 MB/s)
    memcpy: unaligned copy of 400 MBytes in 1202 msecs (332 MB/s)

Benchmark with the new unaligned copy:
    memcpy: aligned copy of 400 MBytes in 428 msecs (933 MB/s)
    memcpy: unaligned copy of 400 MBytes in 519 msecs (770 MB/s)

These numbers are calculated on a 1.8 GHz SiFive P550 CPU
with this custom unit test:
https://lore.kernel.org/lkml/20260129004328.102770-1-teknoraver@meta.com/T/

Signed-off-by: Matteo Croce <teknoraver@meta.com>
---
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
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
