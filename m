Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C894CA0EC3
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Sep 2023 22:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sr0++f2WA2olfK6q5b70renCjFaDw5aBKV7VRYZMQbE=; b=M7LcaAlDc56LFL
	ypG3UmTFxOLuozhps2z3gdphUWbgoCdpmHDzvTlS6e6Fmrim3DqMChM4QAgdKiUkHf309zM3H6hnf
	GxcLAqa9cajXniYv8SP3DXs+JfdhrMw3BHM7G2gjCpWUfx9l4QmGCRDMxPHYUDCvgfX8u1H5zoVsa
	buUvYMpwTtagE0ZTqdOOxmdDVH4HhKUu2iYhCukPtY0A07r5d9RYe1/vCF0W9Tx0fNgqFQqLU3GFz
	grDMAOreCv7TUVDLTQStnJm31D0Rl9iAf02J7VybrBDTJNC07on2H32NpO/ityBWbTUp+p5AD0J1d
	RoH3fKBfh8pt+pWROsfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfpqt-001YdZ-0w;
	Mon, 11 Sep 2023 22:57:55 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfpqp-001YaI-3D
	for linux-riscv@lists.infradead.org;
	Mon, 11 Sep 2023 22:57:53 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-68fbd31d9ddso1259113b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 11 Sep 2023 15:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694473069; x=1695077869; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p1/9rWZq+Bz8bqbMD7n5D6gvh0p+ptD4nkWef/+7XvE=;
        b=zNzT+zfxhOoa5rBGykZZsKI4Fik45fYcsvPxkHCahO5rLE5TJ1jDjhdbmhYtuOIbxS
         oBQZ77yNFrKHcNLtrdsB72zSmpitNo+7SWPRTy41v6s5c5xcJNLeyWZn2rM8NUt+jIcM
         iLSYGRCNDnk1m1HUmhkYmF+rMwIFSck/+PGroRH/jI9C2oF3DrLzJsmryvyR7LoCTJv3
         +j4wzkhouyo8yKCxxr7tXhSwvgscVlWbifgxClcTAxsPDOwzDgEsqmp1pctu31D1Qcbc
         3/8LT1v5/8vDguOhSiDgHGlXKH2DuW1JVwyiGk+fcJmAxTnC7Mr6AFRSVhYGqsOclCBY
         1DoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694473069; x=1695077869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p1/9rWZq+Bz8bqbMD7n5D6gvh0p+ptD4nkWef/+7XvE=;
        b=BIOB7IgzWNyurAOQu/L9ZsHoBT4pWj/epCvUF2/8tLDuTg4DWf4xLKs4JYRFnGeH6p
         PqKFT1PvdYAxFqLyOFW935luMRVChzhlQzuCNEqct6WZ/0el8OKYniIgE5rp3hgpImHQ
         c/fUHKfmBMZ9+BBmt0nIDjVojDp9+YJ6onlfQ+M173mNY1dBCVKnOVLuEIPYzOprvSHd
         cGXJ1dwCfownf58dwoKe2q69kAya4+e/BRpQjDdu3AnWCuP5n7Y2NVos8dTRm09BAVLL
         ws+LbvXtlgpuiY9h5vh07kJtB4XnfO1p23pO/FcLDb10uwXrehz+7VmF265FsMtGFyYk
         KoyA==
X-Gm-Message-State: AOJu0YxiVyxWU3pnEs8RgwKOyC6T33f2cRoH1bB355F6kOjTsBMwTFIB
	hAgfoZosGmtyuOOD0eg0L1BQFA==
X-Google-Smtp-Source: AGHT+IH9b/ozwTjgQhCw7xCT5ZfrUMoO4nxNvFOMRsrmE7SzH6JdFZfOC9Osg8zJbgUzFL6Dkp49HA==
X-Received: by 2002:a05:6a00:1d0c:b0:68f:da2a:637b with SMTP id a12-20020a056a001d0c00b0068fda2a637bmr1830560pfx.19.1694473069047;
        Mon, 11 Sep 2023 15:57:49 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id y18-20020aa78052000000b0066a2e8431a0sm6021038pfm.183.2023.09.11.15.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 15:57:48 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 11 Sep 2023 15:57:14 -0700
Subject: [PATCH v4 4/5] riscv: Vector checksum library
MIME-Version: 1.0
Message-Id: <20230911-optimize_checksum-v4-4-77cc2ad9e9d7@rivosinc.com>
References: <20230911-optimize_checksum-v4-0-77cc2ad9e9d7@rivosinc.com>
In-Reply-To: <20230911-optimize_checksum-v4-0-77cc2ad9e9d7@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 David Laight <David.Laight@aculab.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_155752_034120_E983A519 
X-CRM114-Status: GOOD (  13.96  )
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
index 47d98c51bab2..eb4596fc7f5b 100644
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
@@ -115,6 +119,94 @@ unsigned int __no_sanitize_address do_csum(const unsigned char *buff, int len)
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
