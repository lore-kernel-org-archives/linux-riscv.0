Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB63CEE021D
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 03:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gQWYVXZ26y9urUDe9a5J/y5te7eH3RzhVZhQRNW5lpU=; b=tqf7zxGEVC3Vof
	dYS/g3lUmY8Nt3x3b1tUbfbgUtZzhbOxaQVW82jYE4+RT0YTs0yBilFVZDC5VJvIAFimPU22Z2Bs2
	/oNxpwT9aiJmM3F27vYjv+3BqT04bQjc9MlAl/wb8FPBlqeBsY2kLMJbZkAIfkxwZ0l5TteF4XLAV
	Bie5O/cs7u7azj+bKvdtjiEe7j3gjioJEmheJnhwxctBxXIJAOoMG0fmhNoszlmf0b/mHI6hhh685
	G4KtxDYv/TCIsu4opht7hqs+gn6HoOHAn9DGAA959F4QPxL7NzVUT0QrcLsU0tW5RP8JHwkC9CtYH
	RdgemCohY/7Xjjpi0lTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgzq0-009h1O-29;
	Fri, 15 Sep 2023 03:49:48 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgzpw-009gzZ-36
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 03:49:46 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-68fba57030fso1611261b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 14 Sep 2023 20:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694749784; x=1695354584; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=loF04Ge9lKLb+XrqXIoFKE9WVQmjWi5jnw1M425dhYA=;
        b=efLOnJ0MkwRIaUXP7FoX4x+15YajSdfXcOoU62If3TrT9zryKqaTRZapFfB3ufPYmc
         IeYe9PpeXszNFt8NupxjhEzb4DjxF41zX6cnH3YqJRzPrdOAkcAvtHHHUMFv1tkY6EJ7
         yfsxoKY6DHTjkikRQKiN6EssL5XLHIf0aZnS5eniji2XN3YRu1PSDdiQOqu8g27Ycu/d
         37ROU1HBqNXAkntW2dlLXOOrtO4rn2uEb4CX4dpwwR2PB8ta3UhOFCUvt+2n91E/L3gG
         IQoGBxmKZNg2pvz9/IOxWg/uUXbLvFa68eOC7CK66U3ds5+r/vwY+IObnATd7EL9J3ZH
         AQBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694749784; x=1695354584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=loF04Ge9lKLb+XrqXIoFKE9WVQmjWi5jnw1M425dhYA=;
        b=uz9P9w5oLWrccaZRIi/w6sbStz3y9leWX9g1NyKWOHJELJGbb2pxEZJeMFn5/gHRTV
         NVgL+8RttOKFSYTVu1cJIb0UWqfNMxEemywRFq+EoZqg0oST+tm5H70/oUrJMFXdjKES
         Yy7wrGWw9aymdbm31CSn/TiF0DESi9VqHzIbqsVtBfL8j1kROgEPhPQP9gsjZMDseAc1
         Pr+VG71lL75YDATHQfhKvJRttpAm4Rql+Vhn3YiG76zM3bo71n1YtURzyi0goSe0BvyF
         A2BszJGLfefxEkxiwfubXy3ptHg51BbBsMo+ibefaTj7+OklHsAH4hcPkp91i2jYDGjj
         j08Q==
X-Gm-Message-State: AOJu0Yxi302adsA/HlifHW7dG0uwolDZv1NCykdDwkLDokz65AREIQis
	kabcgjnwpJUFyOqAGhtgyhTe/iCE0RTFyO8d5ic=
X-Google-Smtp-Source: AGHT+IFbAxds1ogYAZNnrFhtnRIySDzg/EjsBxuqHF6okLHp2Hbgj4q11UlBPAqmzFrKZN6TGlO9nQ==
X-Received: by 2002:a05:6a20:244e:b0:137:e595:830f with SMTP id t14-20020a056a20244e00b00137e595830fmr740531pzc.57.1694749783712;
        Thu, 14 Sep 2023 20:49:43 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id g5-20020a17090adac500b002739282db53sm3881409pjx.32.2023.09.14.20.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 20:49:43 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 14 Sep 2023 20:49:38 -0700
Subject: [PATCH v5 2/4] riscv: Checksum header
MIME-Version: 1.0
Message-Id: <20230914-optimize_checksum-v5-2-c95b82a2757e@rivosinc.com>
References: <20230914-optimize_checksum-v5-0-c95b82a2757e@rivosinc.com>
In-Reply-To: <20230914-optimize_checksum-v5-0-c95b82a2757e@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 David Laight <David.Laight@aculab.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_204945_000625_650E5820 
X-CRM114-Status: GOOD (  14.19  )
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
index 000000000000..2f0f224682bd
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
+		csum += (csum >> 32) | (csum << 32);
+		csum >>= 32;
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
