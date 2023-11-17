Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD231C072A2
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Nov 2023 21:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X0bBznhp/BtO5nJyfCAAByMAWNHOs4IDC8ewHqCSOzU=; b=UJ5FmWV6f+36mn
	KAM7y8rL+xZsxJKbaATF6ysU+oTANW6PXxnnsCoOKxS5HY41pHnMrzxA0yTvqF+EsiNSKf3li5LPi
	4diVw5Mabu/9Ehz9SzIX+1Pdt96vIkbzbajpgfAwUSIsu7azPELnqlysCWoT1Uj1k7V5ORFA6n53z
	yEuBhPMvOM+Oiery1Z63AtWIUiwyW+VT0fOrhHMbda/KBGBPsfbIlhIrdTiUz9/65CZ4skdVlkMaV
	AN7MWen10E1ohw+A/s3o1iXY4f3tW8X9TwOgOM/VKAL+jLkmNUlOg+uEHK4x2NfYbzbWyjQ2mN7JQ
	RWzGJHydukNxzUVPYHPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r46Nu-007NL2-0L;
	Fri, 17 Nov 2023 21:28:18 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r46Nq-007NHK-0G
	for linux-riscv@lists.infradead.org;
	Fri, 17 Nov 2023 21:28:15 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-6ce532451c7so1370755a34.2
        for <linux-riscv@lists.infradead.org>; Fri, 17 Nov 2023 13:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1700256492; x=1700861292; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AIPzAeBpfFKCf/gy5vzaJ56BSGUsbLFdz2SU2WRo3X0=;
        b=d7wvv7r26Dy+yM7bcodpRcB906RWH4pKUXhflhqAmgLfjjNVJ7MDaPFhfV1M6oBXkn
         mYfG5Lm8WAYSE98xLMC/Eq5ZfaGgmv1elk/lP6mpiWgCiio9r41VbyQwhUFstAoKFjUK
         Xxhqf+EGIWG2UFXyQ7t6dAWKpfqzSlW/5N5m1/q22ACdgC3qwXkKPs/60vq58He0EIPG
         lJoufFfRJIqw+LdNTWgfPLlAcjw8yWFjkC7ljVRb+C8P6rLwPSv9gEVxSJNy0XfHIWXB
         XhAgr5/s0+BWEcQVJlzLIby0MxvzfIAmus5Jw+WGev/jlvEM25S3Se2wqwqKdG1UWcOc
         GmuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700256492; x=1700861292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AIPzAeBpfFKCf/gy5vzaJ56BSGUsbLFdz2SU2WRo3X0=;
        b=Cof2MKJs5ybDiV3G5/Wt/hlzGPqcMOHoVdhmaOpa1Pg4ELg7VuHByFJ+sVfTi+NT13
         tjgZtjhAdLPrxSyg2jLdOYSeypzU+Op/zCvaMatZ/JZl1PGp4WTiRlm43hKIL1Ehxq/k
         GEcDiiGwg7KVSbJsanL2XZpJ4ucbXMMdWxpoGlte5yLo0aP+1+PWKwhocfd5Ohi5aaNV
         PKazamI+GwANtKA5hJUNFqtO7GqNKHVZNGy6RVCAhPZK9vSo2R9KECFK2YGkAO4Rab5v
         0bhyEuupFFMfRmxJ8yrh3D9oMmDgxhLsj+tFd62BHyL5TB+0EcLJOk2ujbDYZq0xaxsn
         O51A==
X-Gm-Message-State: AOJu0Yyex31esNsd72ipZxlyRzx+vlcOVzkNeYNzEl5G2EzwT4AlDoKk
	Hgikl7skeAvJP2mQQRUgNLFLwg==
X-Google-Smtp-Source: AGHT+IFIIBVAsV+kXtymjmu0UMkaBI6XOoR2jmWzVQU/FDClYBpgbgiDERNrQVZezxkwjW1wgE724A==
X-Received: by 2002:a9d:6310:0:b0:6d6:54ce:cad with SMTP id q16-20020a9d6310000000b006d654ce0cadmr434912otk.5.1700256492772;
        Fri, 17 Nov 2023 13:28:12 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id e2-20020a05683013c200b006d3127234d7sm365677otq.8.2023.11.17.13.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 13:28:12 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 17 Nov 2023 13:28:01 -0800
Subject: [PATCH v11 3/5] riscv: Add checksum header
MIME-Version: 1.0
Message-Id: <20231117-optimize_checksum-v11-3-7d9d954fe361@rivosinc.com>
References: <20231117-optimize_checksum-v11-0-7d9d954fe361@rivosinc.com>
In-Reply-To: <20231117-optimize_checksum-v11-0-7d9d954fe361@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 David Laight <David.Laight@aculab.com>, Xiao Wang <xiao.w.wang@intel.com>, 
 Evan Green <evan@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_132814_130278_1A5A6AA0 
X-CRM114-Status: GOOD (  14.93  )
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
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/checksum.h | 82 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/riscv/include/asm/checksum.h b/arch/riscv/include/asm/checksum.h
new file mode 100644
index 000000000000..2fcf864186e7
--- /dev/null
+++ b/arch/riscv/include/asm/checksum.h
@@ -0,0 +1,82 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Checksum routines
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
+/* Define riscv versions of functions before importing asm-generic/checksum.h */
+#include <asm-generic/checksum.h>
+
+/**
+ * Quickly compute an IP checksum with the assumption that IPv4 headers will
+ * always be in multiples of 32-bits, and have an ihl of at least 5.
+ *
+ * @ihl: the number of 32 bit segments and must be greater than or equal to 5.
+ * @iph: assumed to be word aligned given that NET_IP_ALIGN is set to 2 on
+ *  riscv, defining IP headers to be aligned.
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
+	csum += ror64(csum, 32);
+	csum >>= 32;
+#endif
+	return csum_fold((__force __wsum)csum);
+}
+
+#endif /* __ASM_RISCV_CHECKSUM_H */

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
