Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9696EC001B5
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 22:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dO8RDnCrzm9/9r2gVfnhHxWOnoXPcJt98Kfy+5YOvPI=; b=dvbpDu2o67QtHS
	KpPGgJwhBvE3EjhZePVDObYn0yXnUtsp/UjyXdyMC1EI42FItm9Ve1G2JZqHy6sI7P0yzgEYbpoHw
	P6zotSSj3Rgc3b6PXnRrzy6c7mDg+89sfDYsottgth0oTxrbWcJOmDaK0ignIul49YrDVd66zjQ3O
	qvvxExyWq9iG4eC8uOuqDNfVqpN4fMk1KyVOV+TuJj8M2oiNhYlAtVXbb3BaFv6aIbcsX5ySpWSQF
	0SRYzQtbqDs+MRLtOUDvpWztYn6W67KYHfkgVl8ZW8mh4T1u4SEbgY/HLnjb3MVXWq9ZKLYdxb8sF
	Q1w2kSDCAGi+W8+IyLTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyK0b-008ErM-2X;
	Wed, 01 Nov 2023 22:48:21 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyK0Z-008EpB-1Y
	for linux-riscv@lists.infradead.org;
	Wed, 01 Nov 2023 22:48:20 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3b2e22f1937so189629b6e.1
        for <linux-riscv@lists.infradead.org>; Wed, 01 Nov 2023 15:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698878898; x=1699483698; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ed3AceHMZkBHW3Y7G0fWRXKUFOz+aro++Yp4kYAVXuk=;
        b=pHjBAZCimXD3tvlHsdyQWZvbIenbUE5mbKSuXNFlxEDGt5Z4xWnzxF2tqzZUf6VtiE
         1+al4VUVkNXI6OK/JZ40Zt8ckSLud9z5nIZAsaDQqCi6jCvZehllrkqNjxLef3ygVE4y
         rmAT8fw2+nzJy313gKqN8D+fyChCHzk6p1QIjsYOt5DcqfFSaCj1Fjj0IjZYSGnyF+gx
         cr9LPVUHzo2KxnNu4Nv4S6Q4LxB7uRLMXDERJnXpZMu14roJELLDdurkZSgnM6vG2VRI
         hHit24Vl1l9WKWbHjTPaAP6E/u08Thw/ChG428F8PTIvvYgGqnNNnGPmsL78/L62fgZe
         +UWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698878898; x=1699483698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ed3AceHMZkBHW3Y7G0fWRXKUFOz+aro++Yp4kYAVXuk=;
        b=V3IlXLop6xMY0saH2wPHB7g99r8dGiwgtvA+4YMJzowSaQ93FUMqty41hya1qO+T2s
         AT+T0/sxFiRY8BDxjZe92ZKv/eVcQ0hXYiLE7af2fioczsDkh/dk5wafxXJk7LNTC8Sv
         z0ccaMBn8LJ59Oi7ogOERsKfJ6aLCnBBluEnAk0wsMf6JaWV2W2koBtuvUwpjJ28JMuk
         GrV1nojFRY6IqEVMlu0yYgpJ9u3CFvlqJpMe5nAHrG+ymWy9JIU3Sa+Ae9vaYw8Ihj19
         pDS83QuwSPP26L4GDOcniNocSvfOHHVZpeyxFT5IxlbMNS7sX2b44Yw9JMuk8ixytKqA
         w7SA==
X-Gm-Message-State: AOJu0YxgNqyTfVNs73wdCu8VLAJ6qD0r9HiL4aGv9rlGmak8t6k2+Sgj
	u8bqdka7Yl2sUeSDm7/VNtozNw==
X-Google-Smtp-Source: AGHT+IHopUzoXmnmWd14ia19E+/4HILvhDaQ9lTPnrMCLKpAh1AzG9vNZBvySp5as5cAaQjvBxPEhQ==
X-Received: by 2002:a05:6808:1920:b0:3b5:64c9:5146 with SMTP id bf32-20020a056808192000b003b564c95146mr7234179oib.42.1698878898191;
        Wed, 01 Nov 2023 15:48:18 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id be24-20020a056808219800b003b274008e46sm376580oib.0.2023.11.01.15.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 15:48:17 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 01 Nov 2023 15:48:13 -0700
Subject: [PATCH v10 3/5] riscv: Checksum header
MIME-Version: 1.0
Message-Id: <20231101-optimize_checksum-v10-3-a498577bb969@rivosinc.com>
References: <20231101-optimize_checksum-v10-0-a498577bb969@rivosinc.com>
In-Reply-To: <20231101-optimize_checksum-v10-0-a498577bb969@rivosinc.com>
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
X-CRM114-CacheID: sfid-20231101_154819_521150_22FF2649 
X-CRM114-Status: GOOD (  15.63  )
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
 arch/riscv/include/asm/checksum.h | 81 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/arch/riscv/include/asm/checksum.h b/arch/riscv/include/asm/checksum.h
new file mode 100644
index 000000000000..3d77cac338fe
--- /dev/null
+++ b/arch/riscv/include/asm/checksum.h
@@ -0,0 +1,81 @@
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
+/*
+ * Quickly compute an IP checksum with the assumption that IPv4 headers will
+ * always be in multiples of 32-bits, and have an ihl of at least 5.
+ * @ihl is the number of 32 bit segments and must be greater than or equal to 5.
+ * @iph is assumed to be word aligned given that NET_IP_ALIGN is set to 2 on
+ *	riscv, defining IP headers to be aligned.
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
