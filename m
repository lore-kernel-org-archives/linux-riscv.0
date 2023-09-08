Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A346AEE57C0
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Sep 2023 05:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wThghyUeNxxCnQCLa6Cn7kObsY3IWIWby4TZwMx+c9g=; b=HPvhEbDb35EmL9
	ZIPSAMBvTAJAlXuPfEEM+MpVgBZY7jX2bFWk+jUwWkLUmS9LSUGcsbKmjN27CNxkhqqX2dCC74dtJ
	Tol6YMEfuP8RUDCGkstFDiexXR3Z/ofX5CSdktTKPoFIZCzkKJwVOYbmoL5hfxo+WBKxvknwMjkAD
	L2CZTC4NRBA2IPHdeiQwrrFHWcmo73Qa+XwH9uWvxBm3X32Flf+1Kig8cB/DY/8zTdbPZg8qCmTeA
	oBnJa7mzEkuWvpSemjEerigIC0lBfmvMmeSLYwL+PDGQ2YMnwDdHse4gP3r+hqvhNRU8bXtqj+k8l
	5OTZJRr3fSRRvS3yC46A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeTp4-00D567-0K;
	Fri, 08 Sep 2023 05:14:26 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeToz-00D53s-2F
	for linux-riscv@lists.infradead.org;
	Fri, 08 Sep 2023 05:14:23 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1bdf4752c3cso13311705ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 07 Sep 2023 22:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694150059; x=1694754859; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yAPQF3AIxfJJMuNhHMSqprX+We7Y3OynQxSaHAD1HDU=;
        b=W6Tr5seneG4GyAtCf2TcWKKz+d2UmtssbycXZwVnJ5gUFMUVz992jGGUO2bRW2pDyN
         cfv19nlaFM89sh74RROsr8rrkz5cuBsFHU552q5FszXvRBmQU5P69KJ8izSY64ydbNfc
         AB8+OwSLRLYYs7Be+SYMdBSMDcAp/uQtRHvfpMzSfuFvHeZXCve9d/r8viwLL2GP8mZ+
         +RrN6qlyMAyopfhDQO75uHpjiLGPVhHG9yxTEGl43KvWFeP7d/nYq5eFKDr8P2hs3Js6
         lx+xKfnG355mllxtgB6Lw602my2BKRcmTTPp8sL7Hhn9/XA75kAdU8WKvaqHFf3GsANA
         7ykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694150059; x=1694754859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yAPQF3AIxfJJMuNhHMSqprX+We7Y3OynQxSaHAD1HDU=;
        b=O6oyDjtx/avl5MyoRjNCGIZ/qQshv3piq6Zmh1yeLq4J3LDQrJ7NQERS9TqV6UULev
         11RUzOkvjH4CyHfu5v4A6n7ZecHhklidHZv208+JUsxSHzSBV0XrV/OP+RRETgJ5cBNl
         naSKBGaM9LTKD+BYS36n4O7i9ELDQwVSLInFa3QkutJYM5GZlqrpLlbVmfBlvrBOeuFP
         UXRD6UsRiPNpAjbHAX3XBjqE7pPeimEX6FVt8/lXE8sq5s/gw5EW6MbBITXvmSp14GkM
         Ph64kZ+byoY1ZUeRhh0dtpsUh9l1PkD0391eChflZsfOmvxmf//zsIOEITj4znvH7nD+
         uixQ==
X-Gm-Message-State: AOJu0YwhIpho9U7LqcTYrIx2cfDwoD1yq9zR9pu3YgT3uLYdqV5dSOl1
	Oa/fRMUETcEK2iN0yacyj/gqig==
X-Google-Smtp-Source: AGHT+IHy7GkNs8U+4q0Hv5tz6kPg8Ph8HBLXgUXU2m+5HmcZxobqeSlNyK2YC1YdejSfPfIHRa0L6g==
X-Received: by 2002:a17:903:2789:b0:1b6:af1a:7dd3 with SMTP id jw9-20020a170903278900b001b6af1a7dd3mr1625686plb.23.1694150059689;
        Thu, 07 Sep 2023 22:14:19 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id f5-20020a17090274c500b001a5fccab02dsm616482plt.177.2023.09.07.22.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 22:14:19 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 07 Sep 2023 22:14:07 -0700
Subject: [PATCH v3 4/5] riscv: Vector checksum library
MIME-Version: 1.0
Message-Id: <20230907-optimize_checksum-v3-4-c502d34d9d73@rivosinc.com>
References: <20230907-optimize_checksum-v3-0-c502d34d9d73@rivosinc.com>
In-Reply-To: <20230907-optimize_checksum-v3-0-c502d34d9d73@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_221421_736095_BA1CA29A 
X-CRM114-Status: GOOD (  14.25  )
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

This patch is not ready for merge as vector support in the kernel is
limited. However, the code has been tested in QEMU so the algorithms
do work. This code requires the kernel to be compiled with C vector
support, but that is not yet possible. It is written in assembly
rather than using the GCC vector instrinsics because they did not
provide optimal code.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/lib/csum.c | 92 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/arch/riscv/lib/csum.c b/arch/riscv/lib/csum.c
index 1402da888bb4..58dd44f7c6f9 100644
--- a/arch/riscv/lib/csum.c
+++ b/arch/riscv/lib/csum.c
@@ -12,6 +12,10 @@
 
 #include <net/checksum.h>
 
+#ifdef CONFIG_RISCV_ISA_V
+#include <riscv_vector.h>
+#endif
+
 /* Default version is sufficient for 32 bit */
 #ifndef CONFIG_32BIT
 __sum16 csum_ipv6_magic(const struct in6_addr *saddr,
@@ -114,6 +118,94 @@ unsigned int __no_sanitize_address do_csum(const unsigned char *buff, int len)
 	offset = (csum_t)buff & OFFSET_MASK;
 	kasan_check_read(buff, len);
 	ptr = (const csum_t *)(buff - offset);
+#ifdef CONFIG_RISCV_ISA_V
+	if (!has_vector())
+		goto no_vector;
+
+	len += offset;
+
+	vuint64m1_t prev_buffer;
+	vuint32m1_t curr_buffer;
+	unsigned int shift, cl, tail_seg;
+	csum_t vl, csum;
+	const csum_t *ptr;
+
+#ifdef CONFIG_32BIT
+	csum_t high_result, low_result;
+#else
+	csum_t result;
+#endif
+
+	// Read the tail segment
+	tail_seg = len % 4;
+	csum = 0;
+	if (tail_seg) {
+		shift = (4 - tail_seg) * 8;
+		csum = *(unsigned int *)((const unsigned char *)ptr + len - tail_seg);
+		csum = ((unsigned int)csum << shift) >> shift;
+		len -= tail_seg;
+	}
+
+	unsigned int start_mask = (unsigned int)(~(~0U << offset));
+
+	kernel_vector_begin();
+	asm(".option push						\n\
+	.option arch, +v						\n\
+	vsetvli	 %[vl], %[len], e8, m1, ta, ma				\n\
+	# clear out mask and vector registers since we switch up sizes	\n\
+	vmclr.m	 v0							\n\
+	vmclr.m	 %[prev_buffer]						\n\
+	vmclr.m  %[curr_buffer]						\n\
+	# Mask out the leading bits of a misaligned address		\n\
+	vsetivli x0, 1, e64, m1, ta, ma					\n\
+	vmv.s.x	 %[prev_buffer], %[csum]				\n\
+	vmv.s.x	 v0, %[start_mask]					\n\
+	vsetvli	 %[vl], %[len], e8, m1, ta, ma				\n\
+	vmnot.m	 v0, v0							\n\
+	vle8.v	 %[curr_buffer], (%[buff]), v0.t			\n\
+	j	 2f							\n\
+	# Iterate through the buff and sum all words			\n\
+	1:								\n\
+	vsetvli	 %[vl], %[len], e8, m1, ta, ma				\n\
+	vle8.v	 %[curr_buffer], (%[buff])				\n\
+	2:								\n\
+	vsetvli x0, x0, e32, m1, ta, ma					\n\
+	vwredsumu.vs	%[prev_buffer], %[curr_buffer], %[prev_buffer]	\n\t"
+#ifdef CONFIG_32BIT
+	"sub	 %[len], %[len], %[vl]					\n\
+	slli	 %[vl], %[vl], 2					\n\
+	add	 %[buff], %[vl], %[buff]				\n\
+	bnez	 %[len], 1b						\n\
+	vsetvli	 x0, x0, e64, m1, ta, ma				\n\
+	vmv.x.s	 %[result], %[prev_buffer]				\n\
+	addi	 %[vl], x0, 32						\n\
+	vsrl.vx	 %[prev_buffer], %[prev_buffer], %[vl]			\n\
+	vmv.x.s	 %[high_result], %[prev_buffer]				\n\
+	.option  pop"
+	    : [vl] "=&r"(vl), [prev_buffer] "=&vd"(prev_buffer),
+	      [curr_buffer] "=&vd"(curr_buffer),
+	      [high_result] "=&r"(high_result), [low_result] "=&r"(low_result)
+	    : [buff] "r"(ptr), [len] "r"(len), [start_mask] "r"(start_mask),
+	      [csum] "r"(csum));
+
+	high_result += low_result;
+	high_result += high_result < low_result;
+#else // !CONFIG_32BIT
+	"subw	 %[len], %[len], %[vl]					\n\
+	slli	 %[vl], %[vl], 2					\n\
+	addw	 %[buff], %[vl], %[buff]				\n\
+	bnez	 %[len], 1b						\n\
+	vsetvli  x0, x0, e64, m1, ta, ma				\n\
+	vmv.x.s  %[result], %[prev_buffer]				\n\
+	.option pop"
+	    : [vl] "=&r"(vl), [prev_buffer] "=&vd"(prev_buffer),
+	      [curr_buffer] "=&vd"(curr_buffer), [result] "=&r"(result)
+	    : [buff] "r"(ptr), [len] "r"(len), [start_mask] "r"(start_mask),
+	      [csum] "r"(csum));
+#endif // !CONFIG_32BIT
+	kernel_vector_end();
+no_vector:
+#endif // CONFIG_RISCV_ISA_V
 	len = len + offset - sizeof(csum_t);
 
 	/*

-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
