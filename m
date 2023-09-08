Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D648EE57C0
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Sep 2023 05:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hA5yh9hfPoK9chkIGpsCq28nIZlMIO8fZmiA+yGAs8U=; b=z8J5Upce4Lvrn1
	5OjjrjYKTbojAQGnGVCFvkNmEgp7WuegHS04LLC1yiJHIofWJJoIx9NVVQptgyyW+oYg9dtzuNulW
	NpfLMekSRzDNJGf7l9mt3diPuquPvsaA06Ie8D2gS3pVl1IbwYd5KZBz09ygntLcvQdSOgrClya2C
	pi+JuZUskZCJpDKuaDTIYIjgje1Z8NXVt6ESpk0SovCLszQG1WF5RVcz8lKNayciW67dcS/RQF1gA
	fKlraPK+Wd5BSlgSifu9hbSkDHftHAKNgESazLwPCtCj5Y5ZMANvpOXUB+REJAn3CpZLhh4T7VaXY
	mDRw0s8Ued3+EYfq47ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeTp1-00D552-18;
	Fri, 08 Sep 2023 05:14:23 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeTow-00D53N-1b
	for linux-riscv@lists.infradead.org;
	Fri, 08 Sep 2023 05:14:21 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1c0db66af1bso12395475ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 07 Sep 2023 22:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694150055; x=1694754855; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fe+25j0FlfcBEBJLM6tn940z0gL7txI9g8Ukkd+3JzY=;
        b=SYA+thn+4nSm0aejuyoUMcXpIamPmGVmUd2keXJGhAkj+bQdSepUVG+xPqphttMYUR
         QKnK1SFOF6+0YXmVxMozGN3UMbhQe1ai8qSC/OtjP2jotlmDcqza3E97i8N7mOQHJ4KR
         NDDL87Eh1TFNI3qX45ZRZcrrx9AeZD3u3+doSKVgm2syYkzeuZ5xhDNbp8HfrytDqrpp
         CJpN843BHB/gpFiNIFy8qxR+YFGahfdshI4KV3fvK33/Q1LCEhh58xkxuA8wBykjT4Yt
         a/yN/Yk8Ou2sYB93/q2A/E5N47s2NwCd3wBFFncXKnnok8qwmHVTQYG0stSE8fxJkjsr
         RpOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694150055; x=1694754855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fe+25j0FlfcBEBJLM6tn940z0gL7txI9g8Ukkd+3JzY=;
        b=IeL17Kq9kdGC9scAbsLnTxdcHvnTIpPhTy97MCgk8AKsekl8K5TfEu0UbvxXVbSV4z
         1t/dHZzCfvkheN7XB+CqYu26OlIHKr0HpFYhvVH1BspF8AvWqJ+x08ILy4RXMvILDAI/
         D1mcPf9AJsLV/GKYzWgCkNZYVtsxNcso/rpw0PSE3ES0kZMH2R00SO2zl5GFEdVmvTq4
         Gs1SZF7zAyBuI/yYWbOlUFi9va+MrdyiripWSNRHYgEcwIetBe96UbvvFmBq+7MQ8iIO
         tMfV2p+Tl5/RymQIykk5yqMFF6Y0vQgvQLYTT/KRubUa3jzFvVBc+m2+POUdnMM5RwPg
         xw8Q==
X-Gm-Message-State: AOJu0Yy8MHJitoTsoc6LVSZKtS5hLxyKiIZOLNMSb/YIRNrzOf3yn7OO
	fHMg8PNDmPu931XNWX7azq3YEw==
X-Google-Smtp-Source: AGHT+IFWbgY1Hxyt2+Y2+Zlz+3d2qFtQqnOR1On5xLS0tR1B5QSJEZ1a87MvoIQu6JS8NbWMhhA1DQ==
X-Received: by 2002:a17:903:124c:b0:1bf:66c3:d4d4 with SMTP id u12-20020a170903124c00b001bf66c3d4d4mr1894945plh.16.1694150055603;
        Thu, 07 Sep 2023 22:14:15 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id f5-20020a17090274c500b001a5fccab02dsm616482plt.177.2023.09.07.22.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 22:14:15 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 07 Sep 2023 22:14:04 -0700
Subject: [PATCH v3 1/5] riscv: Checksum header
MIME-Version: 1.0
Message-Id: <20230907-optimize_checksum-v3-1-c502d34d9d73@rivosinc.com>
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
X-CRM114-CacheID: sfid-20230907_221418_533064_03BD7F1A 
X-CRM114-Status: GOOD (  15.26  )
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
 arch/riscv/include/asm/checksum.h | 94 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/arch/riscv/include/asm/checksum.h b/arch/riscv/include/asm/checksum.h
new file mode 100644
index 000000000000..bddfc571f93f
--- /dev/null
+++ b/arch/riscv/include/asm/checksum.h
@@ -0,0 +1,94 @@
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
+#ifdef CONFIG_32BIT
+typedef unsigned int csum_t;
+#else
+typedef unsigned long csum_t;
+#endif
+
+/*
+ *	Fold a partial checksum without adding pseudo headers
+ */
+static inline __sum16 csum_fold(__wsum sum)
+{
+	sum += (sum >> 16) | (sum << 16);
+	return (__force __sum16)(~(sum >> 16));
+}
+
+#define csum_fold csum_fold
+
+/*
+ * Quickly compute an IP checksum with the assumption that IPv4 headers will
+ * always be in multiples of 32-bits, and have an ihl of at least 5.
+ * @ihl is the number of 32 bit segments and must be greater than or equal to 5.
+ * @iph is assumed to be word aligned.
+ */
+static inline __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
+{
+	csum_t csum = 0;
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
+		csum_t fold_temp;
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
+				rori	%[fold_temp],%[csum],16		\n\
+				add	%[csum],%[fold_temp],%[csum]	\n\
+			.option pop"
+			: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp));
+		} else {
+			asm(".option push				\n\
+			.option arch,+zbb				\n\
+				rori	%[fold_temp], %[csum], 32	\n\
+				add	%[csum], %[fold_temp], %[csum]	\n\
+				srli	%[csum], %[csum], 32		\n\
+				roriw	%[fold_temp], %[csum], 16	\n\
+				addw	%[csum], %[fold_temp], %[csum]	\n\
+			.option pop"
+			: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp));
+		}
+		return ~(csum >> 16);
+	}
+no_zbb:
+#ifndef CONFIG_32BIT
+		csum += (csum >> 32) | (csum << 32);
+		csum >>= 32;
+#endif
+	return csum_fold((__force __wsum)csum);
+}
+
+#define ip_fast_csum ip_fast_csum
+
+#include <asm-generic/checksum.h>
+
+#endif // __ASM_RISCV_CHECKSUM_H

-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
