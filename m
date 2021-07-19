Return-Path: <SRS0=/Tun=ML=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8426C07E9D
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jul 2021 12:53:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FDC560FF3
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jul 2021 12:53:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FDC560FF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kPbrzjx+9n07VflabEg11ylznJ+/f9xn6Bqx6aao7Co=; b=i70axwUfSd2lpd8IoeJSbZiZhk
	NhwJ8Jnsb0JwrvuUOKz5g2XrYYgwkrw/akhFp7/ljt+Dfb6byMv0JqnQURpcNImmpukJ+CsLabGDx
	3nalsr9E8SiBznFA+3ik9jLpqhP6UBk9bzQgk5ceZAV9SO0Yk1LUOu9ZeH4sZkqiWMn03FVSwV2yy
	RMvdBL63RStJw6Gps2kpHwDs/H4YlbrWarOnCJnU0SiW0XdaBGpAhBqN/DKrWoTbjQ0238MQ4og/v
	bj9YYdcd+lnq3i0NT0Btl6fJjGdh+LgY2PLY0OWrhlPKefZ5Lyq47nl/n9k9O4gwLMx3IZJvQw/jz
	r9S8/RJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5Sll-009gvq-OE; Mon, 19 Jul 2021 12:53:13 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5Slh-009guX-P5
 for linux-riscv@lists.infradead.org; Mon, 19 Jul 2021 12:53:11 +0000
Received: by mail-pj1-x102f.google.com with SMTP id my10so11324688pjb.1
 for <linux-riscv@lists.infradead.org>; Mon, 19 Jul 2021 05:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=XlSoGkIuyJcxF1V+EC6oJ6oOS0yXbA9OP0oK4bBTH38=;
 b=GNOlApTNT/GGLz9woIk9Ba8832D467FEBwyLUXmhDqrYVWSbzFNV65oscoWo52Orgz
 mC1KJg/atESyf+JOLaPycCm4EmyyXiK0Yt+K3FADKHr53WblwkCcaiKMUQBDt745x7+r
 knXaXWSgTrVpB7ubpBYz3PH9OvmtxfztKWBUCw5q+dbbEgpE2yDNTRy046l5RAL0Dhjx
 tP2nS1GfW8pF5KG87P7MeBRyT6bs/CMyNA2BLEi/wIV2J0Hp8GR2Xrtqw/G0N1eSv+Jo
 KY2aunnSbW9XCe0jdLHg4/Mux29/yok3sErH1su3U3nx2dr0VwUp/IEIyUFiyHBtw0aZ
 J7xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XlSoGkIuyJcxF1V+EC6oJ6oOS0yXbA9OP0oK4bBTH38=;
 b=XlsDAJewZ0J4+e2GRjvJMg2RxMUcV9mj7pT+32tAbzuZOxcO6Wl1ntXT20MD0WdhHI
 bBqOCifA0MnRRTQV9WoNuouwrkyN/vrNOsGQCKh5dIOp5F3VLpuMX8uIDnc3Oa1QQD3j
 dvqsgC55aVkQYfzzzOex8K7GZbF3G5wYQPWkB/ApkTnoFN1Cz0YTcH0iw/mByPbjU+NT
 f23d4LGXZ/ejf70eOngIq96VyFTeDW0EKP294T/tGrl2k16sHmfr9vlTQ51d3zYSFzVn
 i/4iP+9E413GPYVbeWtUbm8cOBwfWB+bXosrjmSP0f7jBt9LWZCQac/kJySPn/phltOI
 YSqQ==
X-Gm-Message-State: AOAM530kN/3rkAH/i4UpvUr0g/9h93PYp6w8suuwTeSAfPfv192ovaKt
 70TYJw8iENgD3NQUmPYYeMs0ftIPGUEwVA==
X-Google-Smtp-Source: ABdhPJypFT0sl9qt1D5usdb49lHo+UQ/nL2DCt9qQxCrQeSoS6yK/d02UZoDJEFlQe4gSMCqYt1A5w==
X-Received: by 2002:a17:90b:d8f:: with SMTP id
 bg15mr29839451pjb.152.1626699188643; 
 Mon, 19 Jul 2021 05:53:08 -0700 (PDT)
Received: from [192.168.1.153] (M106072041033.v4.enabler.ne.jp. [106.72.41.33])
 by smtp.gmail.com with ESMTPSA id a13sm20902502pfl.92.2021.07.19.05.53.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jul 2021 05:53:08 -0700 (PDT)
Subject: [PATCH v4 1/1] riscv: __asm_copy_to-from_user: Optimize unaligned
 memory access and pipeline stall
To: Palmer Dabbelt <palmer@dabbelt.com>, Guenter Roeck <linux@roeck-us.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Qiu Wenbo <qiuwenbo@kylinos.com.cn>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <a7a801d2-13d2-7b5b-66a5-98e7c95b00cc@gmail.com>
From: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Message-ID: <5e1b5d90-5a1e-5e9f-7b92-6c53b8589c2a@gmail.com>
Date: Mon, 19 Jul 2021 21:53:04 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <a7a801d2-13d2-7b5b-66a5-98e7c95b00cc@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_055309_879941_DE0F9BA0 
X-CRM114-Status: GOOD (  24.95  )
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


This patch will reduce cpu usage dramatically in kernel space especially
for application which use sys-call with large buffer size, such as
network applications. The main reason behind this is that every
unaligned memory access will raise exceptions and switch between s-mode
and m-mode causing large overhead.

First copy in bytes until reaches the first word aligned boundary in
destination memory address. This is the preparation before the bulk
aligned word copy.

The destination address is aligned now, but oftentimes the source
address is not in an aligned boundary. To reduce the unaligned memory
access, it reads the data from source in aligned boundaries, which will
cause the data to have an offset, and then combines the data in the next
iteration by fixing offset with shifting before writing to destination.
The majority of the improving copy speed comes from this shift copy.

In the lucky situation that the both source and destination address are
on the aligned boundary, perform load and store with register size to
copy the data. Without the unrolling, it will reduce the speed since the
next store instruction for the same register using from the load will
stall the pipeline. If the size of copy is too small for unrolled copy
perform regular word copy.

At last, copying the remainder in one byte at a time.


The motivation to create the patch was to improve network performance on
beaglev beta board. By observing with perf, the memcpy and
__asm_copy_to_user had heavy cpu usage and the network speed was limited
at around 680Mbps on 1Gbps lan.

Typical network applications use system calls with a large buffer on
send/recv() and sendto/recvfrom() for the optimization.

The bench result, when patching only copy_user. The memcpy is without
Matteo's patches but listing the both since they are the top two largest
overhead.

All results are from the same base kernel, same rootfs and same BeagleV
beta board.

Results of iperf3 have speedup on UDP with the copy_user patch alone.

--- UDP send ---
306 Mbits/sec      362 Mbits/sec
305 Mbits/sec      362 Mbits/sec

--- UDP recv ---
772 Mbits/sec      787 Mbits/sec
773 Mbits/sec      784 Mbits/sec

Comparison by "perf top -Ue task-clock" while running iperf3.

--- TCP recv ---
 * Before
  40.40%  [kernel]  [k] memcpy
  33.09%  [kernel]  [k] __asm_copy_to_user
 * With patch
  50.35%  [kernel]  [k] memcpy
  13.76%  [kernel]  [k] __asm_copy_to_user

--- TCP send ---
 * Before
  19.96%  [kernel]  [k] memcpy
   9.84%  [kernel]  [k] __asm_copy_to_user
 * With patch
  14.27%  [kernel]  [k] memcpy
   7.37%  [kernel]  [k] __asm_copy_to_user

--- UDP recv ---
 * Before
  44.45%  [kernel]  [k] memcpy
  31.04%  [kernel]  [k] __asm_copy_to_user
 * With patch
  55.62%  [kernel]  [k] memcpy
  11.22%  [kernel]  [k] __asm_copy_to_user

--- UDP send ---
 * Before
  25.18%  [kernel]  [k] memcpy
  22.50%  [kernel]  [k] __asm_copy_to_user
 * With patch
  28.90%  [kernel]  [k] memcpy
   9.49%  [kernel]  [k] __asm_copy_to_user


Signed-off-by: Akira Tsukamoto <akira.tsukamoto@gmail.com>
---
 arch/riscv/lib/uaccess.S | 218 ++++++++++++++++++++++++++++++++-------
 1 file changed, 183 insertions(+), 35 deletions(-)

diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index fceaeb18cc64..f1518fd3be99 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -19,50 +19,198 @@ ENTRY(__asm_copy_from_user)
 	li t6, SR_SUM
 	csrs CSR_STATUS, t6
 
-	add a3, a1, a2
-	/* Use word-oriented copy only if low-order bits match */
-	andi t0, a0, SZREG-1
-	andi t1, a1, SZREG-1
-	bne t0, t1, 2f
+	/* Save for return value */
+	mv	t5, a2
 
-	addi t0, a1, SZREG-1
-	andi t1, a3, ~(SZREG-1)
-	andi t0, t0, ~(SZREG-1)
 	/*
-	 * a3: terminal address of source region
-	 * t0: lowest XLEN-aligned address in source
-	 * t1: highest XLEN-aligned address in source
+	 * Register allocation for code below:
+	 * a0 - start of uncopied dst
+	 * a1 - start of uncopied src
+	 * a2 - size
+	 * t0 - end of uncopied dst
 	 */
-	bgeu t0, t1, 2f
-	bltu a1, t0, 4f
+	add	t0, a0, a2
+
+	/*
+	 * Use byte copy only if too small.
+	 * SZREG holds 4 for RV32 and 8 for RV64
+	 * a3 - 2*SZREG is minimum size for word_copy
+	 *      SZREG for aligning dst + SZREG for word_copy
+	 */
+	li	a3, 2*SZREG
+	bltu	a2, a3, .Lbyte_copy_tail
+
+	/*
+	 * Copy first bytes until dst is aligned to word boundary.
+	 * a0 - start of dst
+	 * t1 - start of aligned dst
+	 */
+	addi	t1, a0, SZREG-1
+	andi	t1, t1, ~(SZREG-1)
+	/* dst is already aligned, skip */
+	beq	a0, t1, .Lskip_align_dst
 1:
-	fixup REG_L, t2, (a1), 10f
-	fixup REG_S, t2, (a0), 10f
-	addi a1, a1, SZREG
-	addi a0, a0, SZREG
-	bltu a1, t1, 1b
+	/* a5 - one byte for copying data */
+	fixup lb      a5, 0(a1), 10f
+	addi	a1, a1, 1	/* src */
+	fixup sb      a5, 0(a0), 10f
+	addi	a0, a0, 1	/* dst */
+	bltu	a0, t1, 1b	/* t1 - start of aligned dst */
+
+.Lskip_align_dst:
+	/*
+	 * Now dst is aligned.
+	 * Use shift-copy if src is misaligned.
+	 * Use word-copy if both src and dst are aligned because
+	 * can not use shift-copy which do not require shifting
+	 */
+	/* a1 - start of src */
+	andi	a3, a1, SZREG-1
+	bnez	a3, .Lshift_copy
+
+.Lcheck_size_bulk:
+	/*
+	 * Evaluate the size to choose word_copy or word_copy_unlrolled
+	 * The word_copy_unlrolled requires larger than 8*SZREG
+	 */
+	li	a3, 8*SZREG
+	add	a4, a0, a3
+	bltu	a4, t0, .Lword_copy_unlrolled
+
+.Lword_copy:
+	/*
+	 * Both src and dst are aligned
+	 * word copy with every SZREG iteration
+	 *
+	 * a0 - start of aligned dst
+	 * a1 - start of aligned src
+	 * t0 - end of aligned dst
+	 */
+	bgeu	a0, t0, .Lbyte_copy_tail /* check if end of copy */
+	addi	t0, t0, -(SZREG) /* not to over run */
+1:
+	REG_L	a5, 0(a1)
+	addi	a1, a1, SZREG
+	REG_S	a5, 0(a0)
+	addi	a0, a0, SZREG
+	bltu	a0, t0, 1b
+
+	addi	t0, t0, SZREG /* revert to original value */
+	j	.Lbyte_copy_tail
+
+.Lword_copy_unlrolled:
+	/*
+	 * Both src and dst are aligned
+	 * unrolled word copy with every 8*SZREG iteration
+	 *
+	 * a0 - start of aligned dst
+	 * a1 - start of aligned src
+	 * t0 - end of aligned dst
+	 */
+	addi	t0, t0, -(8*SZREG) /* not to over run */
 2:
-	bltu a1, a3, 5f
+	fixup REG_L   a4,        0(a1), 10f
+	fixup REG_L   a5,    SZREG(a1), 10f
+	fixup REG_L   a6,  2*SZREG(a1), 10f
+	fixup REG_L   a7,  3*SZREG(a1), 10f
+	fixup REG_L   t1,  4*SZREG(a1), 10f
+	fixup REG_L   t2,  5*SZREG(a1), 10f
+	fixup REG_L   t3,  6*SZREG(a1), 10f
+	fixup REG_L   t4,  7*SZREG(a1), 10f
+	fixup REG_S   a4,        0(a0), 10f
+	fixup REG_S   a5,    SZREG(a0), 10f
+	fixup REG_S   a6,  2*SZREG(a0), 10f
+	fixup REG_S   a7,  3*SZREG(a0), 10f
+	fixup REG_S   t1,  4*SZREG(a0), 10f
+	fixup REG_S   t2,  5*SZREG(a0), 10f
+	fixup REG_S   t3,  6*SZREG(a0), 10f
+	fixup REG_S   t4,  7*SZREG(a0), 10f
+	addi	a0, a0, 8*SZREG
+	addi	a1, a1, 8*SZREG
+	bltu	a0, t0, 2b
+
+	addi	t0, t0, 8*SZREG /* revert to original value */
+
+	/*
+	 * Remaining might large enough for word_copy to reduce slow byte
+	 * copy
+	 */
+	j	.Lcheck_size_bulk
+
+.Lshift_copy:
+
+	/*
+	 * Word copy with shifting.
+	 * For misaligned copy we still perform aligned word copy, but
+	 * we need to use the value fetched from the previous iteration and
+	 * do some shifts.
+	 * This is safe because reading is less than a word size.
+	 *
+	 * a0 - start of aligned dst
+	 * a1 - start of src
+	 * a3 - a1 & mask:(SZREG-1)
+	 * t0 - end of uncopied dst
+	 * t1 - end of aligned dst
+	 */
+	/* calculating aligned word boundary for dst */
+	andi	t1, t0, ~(SZREG-1)
+	/* Converting unaligned src to aligned arc */
+	andi	a1, a1, ~(SZREG-1)
+
+	/*
+	 * Calculate shifts
+	 * t3 - prev shift
+	 * t4 - current shift
+	 */
+	slli	t3, a3, LGREG
+	li	a5, SZREG*8
+	sub	t4, a5, t3
+
+	/* Load the first word to combine with second word */
+	fixup REG_L   a5, 0(a1), 10f
 
 3:
+	/* Main shifting copy
+	 *
+	 * a0 - start of aligned dst
+	 * a1 - start of aligned src
+	 * t1 - end of aligned dst
+	 */
+
+	/* At least one iteration will be executed */
+	srl	a4, a5, t3
+	fixup REG_L   a5, SZREG(a1), 10f
+	addi	a1, a1, SZREG
+	sll	a2, a5, t4
+	or	a2, a2, a4
+	fixup REG_S   a2, 0(a0), 10f
+	addi	a0, a0, SZREG
+	bltu	a0, t1, 3b
+
+	/* Revert src to original unaligned value  */
+	add	a1, a1, a3
+
+.Lbyte_copy_tail:
+	/*
+	 * Byte copy anything left.
+	 *
+	 * a0 - start of remaining dst
+	 * a1 - start of remaining src
+	 * t0 - end of remaining dst
+	 */
+	bgeu	a0, t0, .Lend_copy_user  /* check if end of copy */
+4:
+	fixup lb      a5, 0(a1), 10f
+	addi	a1, a1, 1	/* src */
+	fixup sb      a5, 0(a0), 10f
+	addi	a0, a0, 1	/* dst */
+	bltu	a0, t0, 4b	/* t0 - end of dst */
+
+.Lend_copy_user:
 	/* Disable access to user memory */
 	csrc CSR_STATUS, t6
-	li a0, 0
+	li	a0, 0
 	ret
-4: /* Edge case: unalignment */
-	fixup lbu, t2, (a1), 10f
-	fixup sb, t2, (a0), 10f
-	addi a1, a1, 1
-	addi a0, a0, 1
-	bltu a1, t0, 4b
-	j 1b
-5: /* Edge case: remainder */
-	fixup lbu, t2, (a1), 10f
-	fixup sb, t2, (a0), 10f
-	addi a1, a1, 1
-	addi a0, a0, 1
-	bltu a1, a3, 5b
-	j 3b
 ENDPROC(__asm_copy_to_user)
 ENDPROC(__asm_copy_from_user)
 EXPORT_SYMBOL(__asm_copy_to_user)
@@ -117,7 +265,7 @@ EXPORT_SYMBOL(__clear_user)
 10:
 	/* Disable access to user memory */
 	csrs CSR_STATUS, t6
-	mv a0, a2
+	mv a0, t5
 	ret
 11:
 	csrs CSR_STATUS, t6
-- 
2.17.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
