Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428BCCE79A8
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 18:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eHmhAWhVmI5F+R43TLivDTESK5+Izkjel7ldd4uUwNU=; b=Z0vHuHfTk3X4DR
	GK2UsUjke2Ibbk7hNVqX7qZ/VCv7CJ3OQntXGa/hqM8MMrIInGcvUCnKXw9bcg2DbWZLgaRw06Ef1
	BejaUZQm3byV/8cYO3DNBCKjOfT7A1VF9vzOpcns91KkzGRTq3K59OpjTuUvrvM2h4beAE1GLRLrF
	OOw3ZjPYwMGwLHaLCseFlLZqdW+IWbUjZV9572VzQ3FM/Ny2ExXsnYaThFrlnvlKDEp/r7GYLfTN+
	tu1Z9+99JeoUD8x4UcKHHs/v8GYB7O73hq/Ty157Pw7ZcHGR6jIT2FDKq1QeZG3KEtbVj02dJ4qnO
	rbXGDepruCJPCDEcmiqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qifie-0015jo-1J;
	Tue, 19 Sep 2023 18:45:08 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qifiX-0015h4-0H
	for linux-riscv@lists.infradead.org;
	Tue, 19 Sep 2023 18:45:03 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2746889aa89so4143119a91.2
        for <linux-riscv@lists.infradead.org>; Tue, 19 Sep 2023 11:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1695149100; x=1695753900; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1k75qxIvoyjoXO7i5f1b9o5ew6JdXdHy21zFkpaW4Nc=;
        b=MppQGWFymqSNK1p1vhmlElpKy8nvYTWT+iy4FB0l3XhbOZ06oOLl+5T/2vpTq3JEbn
         i1hfz+PcIdkXt8E//ycL2e7ZcoAh2V2dg1FAq6s9e2yAnOPxvvdOaXZIcvgXevleHrbT
         DSTemv/zoQTuFF94gTgZwPdEUr4Hq+bVNP+0kaSmt98Ja+ggKnjMun8A/PEpT9kljm05
         S8W02ytyljTtALJkbT2kw6OLDtVAT4HlB2pMu+uZcLYbhILwMjZgNqJju6D6tv+rLiFJ
         jIMjxT7hXVkxuote4d9Ml9wAKdvfRAUmvo/jgRI8vdx4AyFP62WLcxShIngA2sfx/NWJ
         ueFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695149100; x=1695753900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1k75qxIvoyjoXO7i5f1b9o5ew6JdXdHy21zFkpaW4Nc=;
        b=pbhopVrF/IfMb0RPy7vfAFLyJMNJAu2iPPUcthTF83yBVtPOLdYdC7ggIs3P/+BWJm
         YgGHMe9gn1gOiomEBBqea/5I/8f046KKTalvw/IejU4XHGcr+t/ozWNriSvju4//cxoa
         Rwb8Ttv2CmDFia2DrGRAPlAZYkZuZd3OBUbPDuj/QS8PB0pdGok+j+Kjjd84J1wYuT/7
         kXf8hdyMkKQGLZslDHadwbEVot2IYNBV3ucON8xgGLPh3fEgSYbeb4juhiQkC15UZlvm
         JB3trVBjE/ZOVBEdbH+D73qlxuhoErhEiicsrwmDoz9oLKmAIkyrT+X0SzlDVxD8WUmp
         7Jdw==
X-Gm-Message-State: AOJu0Ywh+tQFadIYIc/m2c1/2hZbvl6/LRRGpmfhWyGOM19t1Wv/m3QT
	HSldphf4uHLzli25xcx5bqbFcg==
X-Google-Smtp-Source: AGHT+IHIuMItP7ki+ND8LtZC/i6RDtB9Ixd4YfHGOBLKB5Sa0nuvQmvXL4zokBHV2JLJM1FVxjK1Yg==
X-Received: by 2002:a17:90a:f308:b0:26f:4685:5b69 with SMTP id ca8-20020a17090af30800b0026f46855b69mr617613pjb.7.1695149100481;
        Tue, 19 Sep 2023 11:45:00 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id m5-20020a17090b068500b0026309d57724sm3876846pjz.39.2023.09.19.11.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 11:45:00 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 19 Sep 2023 11:44:31 -0700
Subject: [PATCH v7 2/4] riscv: Checksum header
MIME-Version: 1.0
Message-Id: <20230919-optimize_checksum-v7-2-06c7d0ddd5d6@rivosinc.com>
References: <20230919-optimize_checksum-v7-0-06c7d0ddd5d6@rivosinc.com>
In-Reply-To: <20230919-optimize_checksum-v7-0-06c7d0ddd5d6@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 David Laight <David.Laight@aculab.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_114501_124353_FCD272AE 
X-CRM114-Status: GOOD (  15.05  )
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

Provide checksum algorithms that have been designed to leverage riscv
instructions such as rotate. In 64-bit, can take advantage of the larger
register to avoid some overflow checking.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/checksum.h | 79 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/arch/riscv/include/asm/checksum.h b/arch/riscv/include/asm/checksum.h
new file mode 100644
index 000000000000..dc0dd89f2a13
--- /dev/null
+++ b/arch/riscv/include/asm/checksum.h
@@ -0,0 +1,79 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * IP checksum routines
+ *
+ * Copyright (C) 2023 Rivos Inc.
+ */
+#ifndef __ASM_RISCV_CHECKSUM_H
+#define __ASM_RISCV_CHECKSUM_H
+
+#include <linux/in6.h>
+#include <linux/uaccess.h>
+
+#define ip_fast_csum ip_fast_csum
+
+#include <asm-generic/checksum.h>
+
+/*
+ * Quickly compute an IP checksum with the assumption that IPv4 headers will
+ * always be in multiples of 32-bits, and have an ihl of at least 5.
+ * @ihl is the number of 32 bit segments and must be greater than or equal to 5.
+ * @iph is assumed to be word aligned.
+ */
+static inline __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
+{
+	unsigned long csum = 0;
+	int pos = 0;
+
+	do {
+		csum += ((const unsigned int *)iph)[pos];
+		if (IS_ENABLED(CONFIG_32BIT))
+			csum += csum < ((const unsigned int *)iph)[pos];
+	} while (++pos < ihl);
+
+	/*
+	 * ZBB only saves three instructions on 32-bit and five on 64-bit so not
+	 * worth checking if supported without Alternatives.
+	 */
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
+	    IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
+		unsigned long fold_temp;
+
+		asm_volatile_goto(ALTERNATIVE("j %l[no_zbb]", "nop", 0,
+					      RISCV_ISA_EXT_ZBB, 1)
+		    :
+		    :
+		    :
+		    : no_zbb);
+
+		if (IS_ENABLED(CONFIG_32BIT)) {
+			asm(".option push				\n\
+			.option arch,+zbb				\n\
+				not	%[fold_temp], %[csum]		\n\
+				rori	%[csum], %[csum], 16		\n\
+				sub	%[csum], %[fold_temp], %[csum]	\n\
+			.option pop"
+			: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp));
+		} else {
+			asm(".option push				\n\
+			.option arch,+zbb				\n\
+				rori	%[fold_temp], %[csum], 32	\n\
+				add	%[csum], %[fold_temp], %[csum]	\n\
+				srli	%[csum], %[csum], 32		\n\
+				not	%[fold_temp], %[csum]		\n\
+				roriw	%[csum], %[csum], 16		\n\
+				subw	%[csum], %[fold_temp], %[csum]	\n\
+			.option pop"
+			: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp));
+		}
+		return csum >> 16;
+	}
+no_zbb:
+#ifndef CONFIG_32BIT
+	csum += (csum >> 32) | (csum << 32);
+	csum >>= 32;
+#endif
+	return csum_fold((__force __wsum)csum);
+}
+
+#endif // __ASM_RISCV_CHECKSUM_H

-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
