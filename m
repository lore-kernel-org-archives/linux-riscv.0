Return-Path: <SRS0=kiTD=LR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDDCBC48BC2
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jun 2021 12:41:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5E1A61075
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jun 2021 12:41:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5E1A61075
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=a+BAg81R1CbMiG8umO4JAOq1n6IdrfFIHvIcqF7GdsQ=; b=URHgHJ+g/kWxNzbbDelTsz5P+N
	FRGT1i4lDEZavWdjm9p0wvaT+cO0jYoRkDrYrYG3glwseJwFJovVM/URQd3WbKBUnpT8sc4KRkWYn
	gfqHMTpZP27Ce0O70NXOXkoTdVIvZdKMvo8rHv7fMFopE82oo49BmizpizKMpIuCTBAxMSl6rj2rZ
	AxGO1b+XLflXFHmYowe5brHtIvsPgrU0Uz8hBS7PqysX+PU0Ymg9GxH/cAYG/V+Ou7mXgqgF3L1Kx
	9fFg86dS9xlxyTpx4Ik3bhF1MfrWSa8RARItSjzoROaj5JLu0tN30Q+yLhU/RxthpAufrepe6m8NA
	ftI8D+mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lw2BS-00AdWN-HN; Wed, 23 Jun 2021 12:40:46 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lw2BP-00AdVC-GK
 for linux-riscv@lists.infradead.org; Wed, 23 Jun 2021 12:40:45 +0000
Received: by mail-pj1-x1034.google.com with SMTP id bb20so1431292pjb.3
 for <linux-riscv@lists.infradead.org>; Wed, 23 Jun 2021 05:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=I/4YCRBKsnY6Xv/PITeXD+BVMi9fYXi3CxxBamZ8trc=;
 b=QycPtinCevIScLZg3OclfMDLsXEwgCuHdFzogGqicU5E1W+rFhe6A9JxQQAMzJHXsE
 QYQcYuC8Cctjt+cHej37HVSFv3D6nmFNVbyOElL6Hj5lz5PD3KNys358FyDGCiBcq8Xu
 vCyT+XYADAdSTxR+vRbyWDErDOGVG1L2xjaqUTxWO4uxuY4t9b8cdqqR70DHFJHZRCZW
 25ZKgxS3KDgMnUHK9xfzS0lMdXHnViTYPEJUifpW6bNjvOxNynC1VDzCQNIoY9bxfKvg
 dfdgaCY2QOxvbXed2acEjJv7nvpjq7+aMcOMThKC5owba+pG/ZgXU//9RuqA8Y14Yk0i
 m9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I/4YCRBKsnY6Xv/PITeXD+BVMi9fYXi3CxxBamZ8trc=;
 b=pEsQSamJeRAVMQ81DjRd+uVt1FXfeePozfwx5qI1W+8lquvJDZJnh7Yh8uDskj341N
 RLXUinM1lKZGOAOK3M23MgDiiVGLmvxF//nSFtD64z/ev9UokBAeNKZ1jGQ2dVwi6Vuq
 vk6AfX0jBpNBjNxA3r2sdKoQp8/zXv5ci1n1ePKzaAI5+MaPN+OegI9MpffGli7IjO9h
 DyWuVgd9S7AaujM10Q/alTdmEQES8uj4cNdHOuPr5DF4REuMnbIqnbqWA3oq02C1zz9N
 pyuNSpeYcbAGE4071PcYGaOUNJVMHvLiSixcVozv8t1ZV7AvoUFQtwlAFQ8xj/PjxmyR
 rPYQ==
X-Gm-Message-State: AOAM531fgHjzkLj+YpaQ93rC/Wu0c5VtU3ZiYYREORj6VaQIBs0GBMvo
 lZcyGw8jIibBk9zXWjpMdeodOWgaFKKaUw==
X-Google-Smtp-Source: ABdhPJxZHD4YSxgws8T8l0wHWuXLOSVf9Ae23dz5YfXfIUuAVG2ChaMKkxYwW2yGuwzK5WCotOxT/A==
X-Received: by 2002:a17:90a:8a95:: with SMTP id
 x21mr9370137pjn.154.1624452042517; 
 Wed, 23 Jun 2021 05:40:42 -0700 (PDT)
Received: from [192.168.1.153] (163.128.178.217.shared.user.transix.jp.
 [217.178.128.163])
 by smtp.gmail.com with ESMTPSA id c18sm2435620pfo.143.2021.06.23.05.40.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jun 2021 05:40:42 -0700 (PDT)
Subject: [PATCH v3 1/1] riscv: __asm_copy_to-from_user: Optimize unaligned
 memory access and pipeline stall
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <3e1dbea4-3b0f-de32-5447-2e23c6d4652a@gmail.com>
From: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Message-ID: <60c1f087-1e8b-8f22-7d25-86f5f3dcee3f@gmail.com>
Date: Wed, 23 Jun 2021 21:40:39 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <3e1dbea4-3b0f-de32-5447-2e23c6d4652a@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_054043_622378_D1CFCEB2 
X-CRM114-Status: GOOD (  20.16  )
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
for application which use sys-call with large buffer size, such as network
applications. The main reason behind this is that every unaligned memory
access will raise exceptions and switch between s-mode and m-mode causing
large overhead.

First copy in bytes until reaches the first word aligned boundary in
destination memory address. This is the preparation before the bulk
aligned word copy.

The destination address is aligned now, but oftentimes the source address
is not in an aligned boundary. To reduce the unaligned memory access, it
reads the data from source in aligned boundaries, which will cause the
data to have an offset, and then combines the data in the next iteration
by fixing offset with shifting before writing to destination. The majority
of the improving copy speed comes from this shift copy.

In the lucky situation that the both source and destination address are on
the aligned boundary, perform load and store with register size to copy the
data. Without the unrolling, it will reduce the speed since the next store
instruction for the same register using from the load will stall the
pipeline.

At last, copying the remainder in one byte at a time.

Signed-off-by: Akira Tsukamoto <akira.tsukamoto@gmail.com>
---
 arch/riscv/lib/uaccess.S | 181 +++++++++++++++++++++++++++++++--------
 1 file changed, 146 insertions(+), 35 deletions(-)

diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index fceaeb18cc64..bceb0629e440 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -19,50 +19,161 @@ ENTRY(__asm_copy_from_user)
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
+	bgtu	a0, t0, 5f
+
+	/*
+	 * Use byte copy only if too small.
+	 */
+	li	a3, 8*SZREG /* size must be larger than size in word_copy */
+	bltu	a2, a3, .Lbyte_copy_tail
+
+	/*
+	 * Copy first bytes until dst is align to word boundary.
+	 * a0 - start of dst
+	 * t1 - start of aligned dst
+	 */
+	addi	t1, a0, SZREG-1
+	andi	t1, t1, ~(SZREG-1)
+	/* dst is already aligned, skip */
+	beq	a0, t1, .Lskip_first_bytes
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
+.Lskip_first_bytes:
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
+.Lword_copy:
+        /*
+	 * Both src and dst are aligned, unrolled word copy
+	 *
+	 * a0 - start of aligned dst
+	 * a1 - start of aligned src
+	 * a3 - a1 & mask:(SZREG-1)
+	 * t0 - end of aligned dst
+	 */
+	addi	t0, t0, -(8*SZREG-1) /* not to over run */
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
+	addi	t0, t0, 8*SZREG-1 /* revert to original value */
+	j	.Lbyte_copy_tail
+
+.Lshift_copy:
+
+	/*
+	 * Word copy with shifting.
+	 * For misaligned copy we still perform aligned word copy, but
+	 * we need to use the value fetched from the previous iteration and
+	 * do some shifts.
+	 * This is safe because reading less than a word size.
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
+	/* Load the first word to combine with seceond word */
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
+	bgeu	a0, t0, 5f
+4:
+	fixup lb      a5, 0(a1), 10f
+	addi	a1, a1, 1	/* src */
+	fixup sb      a5, 0(a0), 10f
+	addi	a0, a0, 1	/* dst */
+	bltu	a0, t0, 4b	/* t0 - end of dst */
+
+5:
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
@@ -117,7 +228,7 @@ EXPORT_SYMBOL(__clear_user)
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
