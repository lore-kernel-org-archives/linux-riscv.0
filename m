Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B46A8CA0EC3
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Sep 2023 22:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dpKTAjayrJ2pkUOSYdVAijXSaBKzAhrT3OUTFCNukPI=; b=bdcX2+F4+Ivpas
	GnH6vJh7o94FrHUitPSi89cvbj5AQs03Btuwn6Nem6l0e+33vCrcj3KY518bAgR5KboDuDpRHPqbV
	VveK9Q+Gd/Rxeq+d9Iakf8+AMC25EMEsXGsFxU4IF5kSnBn4D2ciP1NPEtMxTaZoFEc0u9gaf0C44
	aPyOiIM1g2AgqcvSGAiTm1Opv3GCVNG2Hz+kGgTCfMtvRofGbEMeVr+Iyv422xc9zRs3Dz953i9aK
	zV1Mmc1Je1+9vf4uBeEhG1JhgdVn2pJsHk7TovJRmNx4oWh/r+Xjx9AJHrs5VQDa85uQ9HBDQ4S+X
	jhQ1Kv7G/UUp3H04dYDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfpqq-001Yck-22;
	Mon, 11 Sep 2023 22:57:52 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfpqn-001YZe-1t
	for linux-riscv@lists.infradead.org;
	Mon, 11 Sep 2023 22:57:51 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-573d52030fbso3313631a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 11 Sep 2023 15:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694473068; x=1695077868; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FeGuOibt2OS/It6GbdxOqwbldEV/5WEBCr8BGa7QoJw=;
        b=V6yag6vGCWnFEvL1j7KlhmuEHd7LJ7F4XUUZxfAXqfHg++sv7EYG/RciVDo0ehLqSi
         cRij5Dp7fYc8sEh0VYwSSiQfOOX13tjMRYHLKCD4o8T9ycJGlOu555vvT9VhUaNmVmlv
         yEMLw0iaF44eOVKYgC326fWdFq67t7lqftRtP44A9SNrE6EH8PKm9GGPzb9nl7Gt5R2l
         CcjTYCuH3r2KOnjb1ej7i3gwL1bGUkbBwUCrK1j7ubBq/V3w99UAYrYRQ6L4QLBziHVS
         khvZFCBDNDyK3d0zuyBjvlhOmLUZIJK9x7TFIMMU4sLhZ0j4IV4geAt7ufwbjefC7016
         uYMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694473068; x=1695077868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FeGuOibt2OS/It6GbdxOqwbldEV/5WEBCr8BGa7QoJw=;
        b=fFsoZjjZ9+uW3QeyKzwYqfSZn5ZYp1mLFZmrHVCayGbf7uV8hxvediS2ggQ6H0k39g
         3wHuioZsd1k1ciYvpqJfUbBRAeleugqMiqH0WAs3ZUgTE6CWrZHwulUUlKXLxeo53hoc
         Mhw+Y9LDlygFOvP0BJk/ND3cBOJoqVimpqi5QiG5kfuAMmxskfNepr56HahvPMoXLCsT
         ans8g7SDP2dSqLhxi9KlqJD9idztFyyYuoza9Z4OqU6lenWdjpaHq8j1qh6qWODrivXq
         m+KC5kQxAjwEiLQShJ/UO4Q2ayL76qto23BvM34OGW8sCGOClDS+E9SoB7bzNacs7CAc
         dRzg==
X-Gm-Message-State: AOJu0YxExer+tjBWHnSs6YvlfI1S3EypGcRoEfT4ANyBC6mWkIRvy1Aq
	ggNXO0Ns1+uJxDIBeum53t2nGQ==
X-Google-Smtp-Source: AGHT+IGDbksywbMagPGWzl+7dENygL3I/FG+niWbl9mvxgcV6ss9ETkcm+Z7EzsigG2LQOmTdh97eg==
X-Received: by 2002:a05:6a20:3d24:b0:14b:d28e:e947 with SMTP id y36-20020a056a203d2400b0014bd28ee947mr10640767pzi.48.1694473067801;
        Mon, 11 Sep 2023 15:57:47 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id y18-20020aa78052000000b0066a2e8431a0sm6021038pfm.183.2023.09.11.15.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 15:57:47 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 11 Sep 2023 15:57:13 -0700
Subject: [PATCH v4 3/5] riscv: Vector checksum header
MIME-Version: 1.0
Message-Id: <20230911-optimize_checksum-v4-3-77cc2ad9e9d7@rivosinc.com>
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
X-CRM114-CacheID: sfid-20230911_155749_622171_BC277B71 
X-CRM114-Status: GOOD (  11.28  )
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

Vector code is written in assembly rather than using the GCC vector
instrinsics because they did not provide optimal code. Vector
instrinsic types are still used so the inline assembly can
appropriately select vector registers. However, this code cannot be
merged yet because it is currently not possible to use vector
instrinsics in the kernel because vector support needs to be directly
enabled by assembly.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/checksum.h | 75 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/riscv/include/asm/checksum.h b/arch/riscv/include/asm/checksum.h
index a09a4053fb87..a99c1f61e795 100644
--- a/arch/riscv/include/asm/checksum.h
+++ b/arch/riscv/include/asm/checksum.h
@@ -10,6 +10,10 @@
 #include <linux/in6.h>
 #include <linux/uaccess.h>
 
+#ifdef CONFIG_RISCV_ISA_V
+#include <riscv_vector.h>
+#endif
+
 #ifdef CONFIG_32BIT
 typedef unsigned int csum_t;
 #else
@@ -42,6 +46,77 @@ static inline __sum16 csum_fold(__wsum sum)
  */
 static inline __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
 {
+#ifdef CONFIG_RISCV_ISA_V
+	if (!has_vector())
+		goto no_vector;
+
+	vuint64m1_t prev_buffer;
+	vuint32m1_t curr_buffer;
+	unsigned int vl;
+
+	if (IS_ENABLED(CONFIG_32BIT)) {
+		csum_t high_result, low_result;
+
+		kernel_vector_begin();
+		asm(".option push						\n\
+		.option arch, +v						\n\
+		vsetivli	x0, 1, e64, ta, ma				\n\
+		vmv.v.i		%[prev_buffer], 0				\n\
+		1:								\n\
+		vsetvli		%[vl], %[ihl], e32, m1, ta, ma			\n\
+		vle32.v		%[curr_buffer], (%[iph])			\n\
+		vwredsumu.vs	%[prev_buffer], %[curr_buffer], %[prev_buffer]	\n\
+		sub %[ihl],	%[ihl], %[vl]					\n\
+		slli %[vl],	%[vl], 2					\n\
+		add %[iph],	%[vl], %[iph]					\n\
+		# If not all of iph could fit into vector reg, do another sum	\n\
+		bne		%[ihl], zero, 1b				\n\
+		vsetivli	x0, 1, e64, m1, ta, ma				\n\
+		vmv.x.s		%[low_result], %[prev_buffer]			\n\
+		addi		%[vl], x0, 32					\n\
+		vsrl.vx		%[prev_buffer], %[prev_buffer], %[vl]		\n\
+		vmv.x.s		%[high_result], %[prev_buffer]			\n\
+		.option pop"
+		: [vl] "=&r" (vl), [prev_buffer] "=&vd" (prev_buffer),
+			[curr_buffer] "=&vd" (curr_buffer),
+			[high_result] "=&r" (high_result),
+			[low_result] "=&r" (low_result)
+		: [iph] "r" (iph), [ihl] "r" (ihl));
+		kernel_vector_end();
+
+		high_result += low_result;
+		high_result += high_result < low_result;
+	} else {
+		csum_t result;
+
+		kernel_vector_begin();
+		asm(".option push						\n\
+		.option arch, +v						\n\
+		vsetivli	x0, 1, e64, ta, ma				\n\
+		vmv.v.i		%[prev_buffer], 0				\n\
+		1:								\n\
+		# Setup 32-bit sum of iph					\n\
+		vsetvli		%[vl], %[ihl], e32, m1, ta, ma			\n\
+		vle32.v		%[curr_buffer], (%[iph])			\n\
+		# Sum each 32-bit segment of iph that can fit into a vector reg	\n\
+		vwredsumu.vs	%[prev_buffer], %[curr_buffer], %[prev_buffer]	\n\
+		subw %[ihl],	%[ihl], %[vl]					\n\
+		slli %[vl],	%[vl], 2					\n\
+		addw %[iph],	%[vl], %[iph]					\n\
+		# If not all of iph could fit into vector reg, do another sum	\n\
+		bne		%[ihl], zero, 1b				\n\
+		vsetvli	x0, x0, e64, m1, ta, ma					\n\
+		vmv.x.s	%[result], %[prev_buffer]				\n\
+		.option pop"
+		: [vl] "=&r" (vl), [prev_buffer] "=&vd" (prev_buffer),
+			[curr_buffer] "=&vd" (curr_buffer),
+			[result] "=&r" (result)
+		: [iph] "r" (iph), [ihl] "r" (ihl));
+		kernel_vector_end();
+	}
+no_vector:
+#endif // !CONFIG_RISCV_ISA_V
+
 	csum_t csum = 0;
 	int pos = 0;
 

-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
