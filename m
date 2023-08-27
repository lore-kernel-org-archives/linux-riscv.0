Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41130C71153
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Aug 2023 01:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nr/cEK7UoCqzF1VrhNK9NMHAmfl/rOZPX054NEFVnyA=; b=OGHpOdXJiqO4P6
	wQ5L1K5jzXuUQ2Y0jZsrFP+t4f4lAVYjHOuS6A/pB2v0w9zaD22WheLPSocszhknmvIv6hwisw9Ql
	no06hm7qIFmbHPjlvXJthxp3QFCBHTABOYhW3Ah57PvKbPP8Yx1pSU/rCa9cHHl86/6ral9hBkkeB
	C/U75LLHuwihNa3VD63KOVmtrW9TNkjGfLSJsLFkdRvHoVPXUbNDpIYrzwUqFawyCM1ggoiE1/xfh
	PARX2pyPrI5N+ps6Zq666RsEqrNBqvHNAJWjjo6lJ5fYZP+vYLAC1jHsK3yvzU+j0DSzg8DBeGXrg
	qRbyRZDgNsKAAm1aVIEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qa4YL-007MbR-17;
	Sun, 27 Aug 2023 01:26:57 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qa4YF-007MZb-1h
	for linux-riscv@lists.infradead.org;
	Sun, 27 Aug 2023 01:26:53 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-5712b68dbc0so1445197eaf.1
        for <linux-riscv@lists.infradead.org>; Sat, 26 Aug 2023 18:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1693099610; x=1693704410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ExZs/Ozc5l4bbPGNHrfkcofcGWcAaQ7sfcQyuY4JEts=;
        b=mENLkbVNQcciD80loVn0MQJWYsOKvy3JwwwlPSEIvInRWvoIsBRPy7a/ERxr32CN41
         dE5XWQgAbSdsVxrMaGxqmyHw5iKPyNf7QfCKohtIu3BMNW/3iH6Fd3s4o2sOGS5w+IrI
         73aSoP63Wf02tG9CDg3Mj/0a6z3vsLsuqrXz9AgfxBL3gRNfRgfeBybbtlyXJO+NIYW5
         Gf+GHn+aM6hDzQV0QNd+pflAy8kGBGDq3Vfu6SH+nRY58BZxl4xbFEGA3SRSVpm6yweq
         j4lbOvWCf1ReWiljEiMGnJ2stpC9FJYC9V60H5Fcc5vZiPvXSWYjRLZu1Qo49er9FCsP
         cS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693099610; x=1693704410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ExZs/Ozc5l4bbPGNHrfkcofcGWcAaQ7sfcQyuY4JEts=;
        b=VLDsQfpUN/G1vt85+69sSKoUo3qwaeLERS12/jcfFEZ66rDFcxkMb573zSy/cQ33lF
         R52CZucZKe19saNPbxp+lQFl3jmkGa6dIKrye5btDH+vRHW5xFnukSjp/5ceND6vm8CL
         Go0cJFnZdXn82HeVg9kh56+9BN9S04csdKLxTbVzh5B0M4oUmPyYnjlDk9FKELxns03A
         UAdlFNTQ4eqROeglRdTivFuDlAuwaUiiXcOHdKrWB8Wkno6IUH/LG/ebwYEbUB1R1d8u
         yiu9tCfH/ri1clUXVVPLbQ6R2+z7Lsza5DmHne/1nwlzyLO95AYn49IBHSPVvAxrkrTf
         agYg==
X-Gm-Message-State: AOJu0Yxybd8zzx67u/VnnzunAcBkPZPP0FoAhLjl2cTBR4cm6eE13pAT
	y0+BFo21F/p8pBcAMXds3jvvRA==
X-Google-Smtp-Source: AGHT+IEGHUp91K/R5AJzws7m5jTW/0V4MOrwdiKfnAZq2vc5gFCk+yTLxuLR2FbxrnzWKQCy61yFdQ==
X-Received: by 2002:a05:6358:281d:b0:135:ae78:56c9 with SMTP id k29-20020a056358281d00b00135ae7856c9mr24257121rwb.6.1693099610119;
        Sat, 26 Aug 2023 18:26:50 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jf6-20020a170903268600b001b869410ed2sm4357404plb.72.2023.08.26.18.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 18:26:49 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Sat, 26 Aug 2023 18:26:08 -0700
Subject: [PATCH 3/5] riscv: Vector checksum header
MIME-Version: 1.0
Message-Id: <20230826-optimize_checksum-v1-3-937501b4522a@rivosinc.com>
References: <20230826-optimize_checksum-v1-0-937501b4522a@rivosinc.com>
In-Reply-To: <20230826-optimize_checksum-v1-0-937501b4522a@rivosinc.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230826_182651_560230_26E16F40 
X-CRM114-Status: GOOD (  12.52  )
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
do work. It is written in assembly rather than using the GCC vector
instrinsics because they did not provide optimal code.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/checksum.h | 81 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/arch/riscv/include/asm/checksum.h b/arch/riscv/include/asm/checksum.h
index af49b3409576..7e31c0ad6346 100644
--- a/arch/riscv/include/asm/checksum.h
+++ b/arch/riscv/include/asm/checksum.h
@@ -10,6 +10,10 @@
 #include <linux/in6.h>
 #include <linux/uaccess.h>
 
+#ifdef CONFIG_RISCV_ISA_V
+#include <riscv_vector.h>
+#endif
+
 /* Default version is sufficient for 32 bit */
 #ifdef CONFIG_64BIT
 #define _HAVE_ARCH_IPV6_CSUM
@@ -36,6 +40,46 @@ static inline __sum16 csum_fold(__wsum sum)
  *	without the bitmanip extensions zba/zbb.
  */
 #ifdef CONFIG_32BIT
+#ifdef CONFIG_RISCV_ISA_V
+static inline __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
+{
+	vuint64m1_t prev_buffer;
+	vuint32m1_t curr_buffer;
+	unsigned int vl;
+	unsigned int high_result;
+	unsigned int low_result;
+
+	asm("vsetivli x0, 1, e64, ta, ma				\n\t\
+	vmv.v.i %[prev_buffer], 0					\n\t\
+	1:								\n\t\
+	vsetvli %[vl], %[ihl], e32, m1, ta, ma				\n\t\
+	vle32.v %[curr_buffer], (%[iph])				\n\t\
+	vwredsumu.vs %[prev_buffer], %[curr_buffer], %[prev_buffer]	\n\t\
+	sub %[ihl], %[ihl], %[vl]					\n\t"
+#ifdef CONFIG_RISCV_ISA_ZBA
+	"sh2add %[iph], %[vl], %[iph]					\n\t"
+#else
+	"slli %[vl], %[vl], 2						\n\
+	add %[iph], %[vl], %[iph]					\n\t"
+#endif
+	"bnez %[ihl], 1b						\n\
+	vsetivli x0, 1, e64, m1, ta, ma					\n\
+	vmv.x.s %[low_result], %[prev_buffer]				\n\
+	addi %[vl], x0, 32						\n\
+	vsrl.vx %[prev_buffer], %[prev_buffer], %[vl]			\n\
+	vmv.x.s %[high_result], %[prev_buffer]"
+	: [vl] "=&r" (vl), [prev_buffer] "=&vd" (prev_buffer),
+		[curr_buffer] "=&vd" (curr_buffer),
+		[high_result] "=&r" (high_result),
+		[low_result] "=&r" (low_result)
+	: [iph] "r" (iph), [ihl] "r" (ihl));
+
+	high_result += low_result;
+	high_result += high_result < low_result;
+	return csum_fold((__force __wsum)(high_result));
+}
+
+#else
 static inline __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
 {
 	__wsum csum = 0;
@@ -47,8 +91,44 @@ static inline __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
 	} while (++pos < ihl);
 	return csum_fold(csum);
 }
+#endif
+#else
+
+#ifdef CONFIG_RISCV_ISA_V
+static inline __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
+{
+	vuint64m1_t prev_buffer;
+	vuint32m1_t curr_buffer;
+	unsigned long vl;
+	unsigned long result;
+
+	asm("vsetivli x0, 1, e64, ta, ma				\n\
+	vmv.v.i %[prev_buffer], 0					\n\
+	1:								\n\
+	# Setup 32-bit sum of iph					\n\
+	vsetvli %[vl], %[ihl], e32, m1, ta, ma				\n\
+	vle32.v %[curr_buffer], (%[iph])				\n\
+	# Sum each 32-bit segment of iph that can fit into a vector reg	\n\
+	vwredsumu.vs %[prev_buffer], %[curr_buffer], %[prev_buffer]     \n\
+	subw %[ihl], %[ihl], %[vl]					\n\t"
+#ifdef CONFIG_RISCV_ISA_ZBA
+	"sh2add %[iph], %[vl], %[iph]					\n\t"
 #else
+	"slli %[vl], %[vl], 2						\n\
+	addw %[iph], %[vl], %[iph]					\n\t"
+#endif
+	"# If not all of iph could fit into vector reg, do another sum	\n\
+	bnez %[ihl], 1b							\n\
+	vsetvli x0, x0, e64, m1, ta, ma					\n\
+	vmv.x.s %[result], %[prev_buffer]"
+	: [vl] "=&r" (vl), [prev_buffer] "=&vd" (prev_buffer),
+		[curr_buffer] "=&vd" (curr_buffer), [result] "=&r" (result)
+	: [iph] "r" (iph), [ihl] "r" (ihl));
 
+	result += (result >> 32) | (result << 32);
+	return csum_fold((__force __wsum)(result >> 32));
+}
+#else
 /*
  * Quickly compute an IP checksum with the assumption that IPv4 headers will
  * always be in multiples of 32-bits, and have an ihl of at least 5.
@@ -74,6 +154,7 @@ static inline __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
 	return csum_fold((__force __wsum)(csum >> 32));
 }
 #endif
+#endif
 #define ip_fast_csum ip_fast_csum
 
 extern unsigned int do_csum(const unsigned char *buff, int len);

-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
