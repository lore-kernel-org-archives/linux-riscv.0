Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E47C2EB8FAF
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 04:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3wfKm3Ed1/27nKYdE4SvVyb1sO53f81/ymKbBmra6/Y=; b=K7jJQe2u9Ch4KT
	N/UpMELnDrD3KFW5AXW5xe5W9DE0gUkK1Q4Xih/OptYH0N3D99e0D5EnC+ZJYmKuHRWgOHXoKaS0Y
	66XF9hq8nOlU03aDuPYHYCmGeRBleqlWmJTzXaNZOa+5k25rytWU77LbMWEKL5Zo/p1LkB/uigPSs
	nKRBzhyMThanJmFRdv/dXkAE+QlPWNoxM1azavATTMPewAj5LJbkk7Zelcc1LUpZCYIzVM+tcu79v
	YOXN+Q0DRQAu3Z8DoCA7YNBRs7+3hGOcI42vzUy6xoxg9x4NQB9f3njbDQzVuxXoxi26zWr1E8zrs
	0Sv7oBI+FxlJvewruEWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdkRo-007Fbl-1G;
	Wed, 06 Sep 2023 04:47:24 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdkRj-007FYs-1I
	for linux-riscv@lists.infradead.org;
	Wed, 06 Sep 2023 04:47:22 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1bf11b1c7d0so3955465ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 05 Sep 2023 21:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1693975634; x=1694580434; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gKepWMR7L/st0e7dK85RxCwPDS5lGnT9CeWsgI7Pxpk=;
        b=Oeal5mzaY3YIqYeoSjiH29uMtPLYYE7mmxhXizRezUpM1R/EemHKZeXUhPCCCtH13k
         bvH5mM20vIAGpX9q2qWDm7QjPKBqgcgXd2KH3TwhkhLNtwZ8ljzQQGjLC7QP/FNXbKxX
         62KeCqm/GVWii5gQ7BSqjMJOd6C5Hz3OhxRUZB0IXVsSQQ4BfPf0Kee0ctwsvAhqgtbh
         yJpoUX7WqRlcbXLlzRxWLzshJ8bJVW3CPdxdEVvxi0Hm//LdMkIOH6H2O2vfFfWHvRWz
         B4o05vJJjcc+8vNvfAuycLXjNe0GORPY3XauhkdiKKo5J7bjeJuksAFwAEt1furZDKjH
         4iwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693975634; x=1694580434;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gKepWMR7L/st0e7dK85RxCwPDS5lGnT9CeWsgI7Pxpk=;
        b=R1d6crSM8DDcMTj+A/aART3D7wB+dQr4Xhmjs4YOvnpA1PEpOYNPcHU/By6iOV/8yw
         tn2kv6wv9+C1SaYFhWJxE6YuDV0TSa+x0g9X6UVH6O2zkTe1MTEjjNko8WfHP0IDU3C+
         B9Z3Zc4Z9Zb0aHcoWlFKGTjJrc5mQ0mKpy/XJ6pfFXxeFC2FxtVrnipq0j0XkOkgv4tL
         cSlIzlHiitIapFe+0RLl9qZYdr5S4HpstPATJ53FmrTueqgfc3msvKyjSWXamobLHnEa
         jCLTuAW7DTwd34IIwQx9WWRniB5EYe5fpIU/IIEliHETmzaO8AizmQlKaexdD+VhxH9i
         /WiA==
X-Gm-Message-State: AOJu0YzIt17U12OuaFkEK7I4qvO3Sgog+Ls7f2OBzSykMjX8Q5glEE8k
	/ooNY33bgk1yJybveWVZuaRLkg==
X-Google-Smtp-Source: AGHT+IEnVGL6EVCHtqmJQZd9MBj+H77yMjPJYr2OukkM1ehZQOTYrTZwBtUMkgrC914b6Pa5BB/iPg==
X-Received: by 2002:a17:902:d510:b0:1c3:22a9:8643 with SMTP id b16-20020a170902d51000b001c322a98643mr15387341plg.31.1693975634686;
        Tue, 05 Sep 2023 21:47:14 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id g11-20020a1709026b4b00b001bc56c1a384sm10087313plt.277.2023.09.05.21.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 21:47:14 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 05 Sep 2023 21:46:52 -0700
Subject: [PATCH v2 3/5] riscv: Vector checksum header
MIME-Version: 1.0
Message-Id: <20230905-optimize_checksum-v2-3-ccd658db743b@rivosinc.com>
References: <20230905-optimize_checksum-v2-0-ccd658db743b@rivosinc.com>
In-Reply-To: <20230905-optimize_checksum-v2-0-ccd658db743b@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_214719_440390_63E0AB24 
X-CRM114-Status: GOOD (  13.30  )
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
 arch/riscv/include/asm/checksum.h | 87 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/arch/riscv/include/asm/checksum.h b/arch/riscv/include/asm/checksum.h
index 3f9d5a202e95..1d6c23cd1221 100644
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
@@ -43,6 +47,89 @@ static inline __sum16 csum_fold(__wsum sum)
  */
 static inline __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
 {
+#ifdef CONFIG_RISCV_ISA_V
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
+		/*
+		 * Vector is likely available when the kernel is compiled with
+		 * vector support, so nop when vector is available and jump when
+		 * vector is not available.
+		 */
+		asm_volatile_goto(ALTERNATIVE("j %l[no_vector]", "nop", 0,
+					      RISCV_ISA_EXT_v, 1)
+				  :
+				  :
+				  :
+				  : no_vector);
+	} else {
+		if (!__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_v))
+			goto no_vector;
+	}
+
+	vuint64m1_t prev_buffer;
+	vuint32m1_t curr_buffer;
+	unsigned int vl;
+#ifdef CONFIG_32_BIT
+	csum_t high_result, low_result;
+
+	riscv_v_enable();
+	asm(".option push						\n\
+	.option arch, +v						\n\
+	vsetivli x0, 1, e64, ta, ma					\n\
+	vmv.v.i %[prev_buffer], 0					\n\
+	1:								\n\
+	vsetvli %[vl], %[ihl], e32, m1, ta, ma				\n\
+	vle32.v %[curr_buffer], (%[iph])				\n\
+	vwredsumu.vs %[prev_buffer], %[curr_buffer], %[prev_buffer]	\n\
+	sub %[ihl], %[ihl], %[vl]					\n\
+	slli %[vl], %[vl], 2						\n\
+	add %[iph], %[vl], %[iph]					\n\
+	# If not all of iph could fit into vector reg, do another sum	\n\
+	bne %[ihl], zero, 1b						\n\
+	vsetivli x0, 1, e64, m1, ta, ma					\n\
+	vmv.x.s %[low_result], %[prev_buffer]				\n\
+	addi %[vl], x0, 32						\n\
+	vsrl.vx %[prev_buffer], %[prev_buffer], %[vl]			\n\
+	vmv.x.s %[high_result], %[prev_buffer]				\n\
+	.option pop"
+	: [vl] "=&r" (vl), [prev_buffer] "=&vd" (prev_buffer),
+		[curr_buffer] "=&vd" (curr_buffer),
+		[high_result] "=&r" (high_result),
+		[low_result] "=&r" (low_result)
+	: [iph] "r" (iph), [ihl] "r" (ihl));
+	riscv_v_disable();
+
+	high_result += low_result;
+	high_result += high_result < low_result;
+#else // !CONFIG_32_BIT
+	csum_t result;
+
+	riscv_v_enable();
+	asm(".option push						\n\
+	.option arch, +v						\n\
+	vsetivli x0, 1, e64, ta, ma					\n\
+	vmv.v.i %[prev_buffer], 0					\n\
+	1:								\n\
+	# Setup 32-bit sum of iph					\n\
+	vsetvli %[vl], %[ihl], e32, m1, ta, ma				\n\
+	vle32.v %[curr_buffer], (%[iph])				\n\
+	# Sum each 32-bit segment of iph that can fit into a vector reg	\n\
+	vwredsumu.vs %[prev_buffer], %[curr_buffer], %[prev_buffer]     \n\
+	subw %[ihl], %[ihl], %[vl]					\n\
+	slli %[vl], %[vl], 2						\n\
+	addw %[iph], %[vl], %[iph]					\n\
+	# If not all of iph could fit into vector reg, do another sum	\n\
+	bne %[ihl], zero, 1b						\n\
+	vsetvli x0, x0, e64, m1, ta, ma					\n\
+	vmv.x.s %[result], %[prev_buffer]				\n\
+	.option pop"
+	: [vl] "=&r" (vl), [prev_buffer] "=&vd" (prev_buffer),
+		[curr_buffer] "=&vd" (curr_buffer), [result] "=&r" (result)
+	: [iph] "r" (iph), [ihl] "r" (ihl));
+	riscv_v_disable();
+#endif // !CONFIG_32_BIT
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
