Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09EA4EED61A
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 17:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eHmhAWhVmI5F+R43TLivDTESK5+Izkjel7ldd4uUwNU=; b=p3JCDaGYZVGpNn
	6DI8QS0q63D8D4Ho8Wd1wjtJB633YLQBl4gDWJrfx5x0KV9TDeXHOVIHhnxszWBtHLWy72BurV//n
	NLV74SLVHppYAT908dOHmjPCK4iWg9BSAJHcY4muCWB4QsCAIenF+wCj3xWr1umD7+CdUZjzzhMY9
	6n9r1VM1UsyoEHdV3gzMJX0CHxzTdzRtpzlY85COWbNyKxa2aAmuCENPX6geyoqkDjVQ7YVm9D+8v
	fqH/psALUtnP0XtXVIYm686BPiBhL2RVtLuOd2xjHdExW4Vxmfzt8b69JmLw3l+FJhVOU62QynWYq
	TThfq7uHguyKw0Ba25cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhCDJ-00B6B5-0z;
	Fri, 15 Sep 2023 17:02:41 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhCDC-00B68Z-2g
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 17:02:36 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1c3d8fb23d9so20065875ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 10:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694797352; x=1695402152; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1k75qxIvoyjoXO7i5f1b9o5ew6JdXdHy21zFkpaW4Nc=;
        b=M4dKpzqzgWj8rhI8djFG7u0eEWUZkUDeu4w48J4wxppz6qEclMp7rJm379iC+/myBb
         3V5EKOsX2kUME+GMVEbovwL7abI6yM54b2SfXjrPAMgmO6IejfScaFf37xZiPEfxnrv+
         7rskJClR+ovoAFy5yIvQTpcZ5GDvFsDkOQf7ioILjh/aNGHodlm3qFOEo4bSGdTtPulj
         p5cTvmLFd+NogZhgXm1sHCLVfcRnlkF4DqopUi5Nu9K3Pl9ECFAaQDWADg6qXsNJFBYf
         NAfo0ScnTzpMmuDOreBRKg/fbRKMtlXdVHi618NWvJhchvnahk/1oHm2PLGA83TwCL0q
         L1ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694797352; x=1695402152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1k75qxIvoyjoXO7i5f1b9o5ew6JdXdHy21zFkpaW4Nc=;
        b=Bug33Fs+F4enCQYlEdTUEPJyN/U/jusKS6tDrMkAtMKkCaMz9j9yPBbQdcjHHmtFeS
         xSretqeUvi3J4N/+id8zLIbItLfAkDHnKF5MEZYsNTmB9P62ZtO7nqbfca132BFagnWL
         i/qud84uZZeGgAjFq6Zo7wnOUUQJLh0qGfwSGEjYK3gNJ6mQxgmK6rLGtwSMiW0FSsgg
         Tskd4NXuhyzxRS0au1jxk5AFZfIs2c57+Pt6EdXGKBTSbzRcf5LIQ/m4RMdnAaYxl5yh
         SKBz1yV4xOIFxc66QWkdlbZ83SjkRgpJd78l8n68PSM6+/DD4AfPEUupdUV9dFNWnuWo
         H0JQ==
X-Gm-Message-State: AOJu0Yw684/BFfDQUpjP8Wj9z4urezIXMbsy+GnJS/ielzReEDl+GE1R
	7rcR0eorPxAz4SeoOaa/JxYkN5iWxbMp+K+/scQ=
X-Google-Smtp-Source: AGHT+IH1jPn04soXbAnfI7sIsWevrTzCm19sW4JGO/9RBel+0bsUazXseS8iwam4Uk1qhMvvhuehhw==
X-Received: by 2002:a17:902:ab5d:b0:1c3:8679:6ed4 with SMTP id ij29-20020a170902ab5d00b001c386796ed4mr2424521plb.8.1694797352279;
        Fri, 15 Sep 2023 10:02:32 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id g22-20020a1709029f9600b001c44c8d857esm34299plq.120.2023.09.15.10.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 10:02:31 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 15 Sep 2023 10:01:18 -0700
Subject: [PATCH v6 2/4] riscv: Checksum header
MIME-Version: 1.0
Message-Id: <20230915-optimize_checksum-v6-2-14a6cf61c618@rivosinc.com>
References: <20230915-optimize_checksum-v6-0-14a6cf61c618@rivosinc.com>
In-Reply-To: <20230915-optimize_checksum-v6-0-14a6cf61c618@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 David Laight <David.Laight@aculab.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_100234_887553_81A568AF 
X-CRM114-Status: GOOD (  14.54  )
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
