Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72ECBCA0EC7
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Sep 2023 22:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iU9/iW5MyjQepp/HueQJ6Daha39aiEoX64FgFUEH8fA=; b=qSgESFLpPqbDl3
	cmgptszjQnvtD27JvACg3TA5EGhQT2qF+ptzhmNy0Wm2NOwulKfIzlLDiAjfB1uyRI13Jx23ykvty
	mB9pbDCe+6NPT/7ATqLF9k8S4EkNWFaxeVzXFMpImOb9rLNi5pkxCL3OZd8X7NDgAgojgvDYUKzHP
	nVW6yL/NNN0uA9/eTT0+dJ8nhZliWQC63ce2a6VtOyK/YiIX3NrkBJ3WpsNk7HIhM9+0HeVZcoJx6
	SEodXKIC8IhZs2iNMDN8RIrReLhnpvIZVBgPnu6LEWRO4y+PVzucXHp2/IH4Im77hYrmc00spj5yU
	IoE1H8BY/dRyHcAcYOnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfpqn-001YaW-2O;
	Mon, 11 Sep 2023 22:57:49 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfpqk-001YYk-2m
	for linux-riscv@lists.infradead.org;
	Mon, 11 Sep 2023 22:57:48 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-68fc081cd46so1397237b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 11 Sep 2023 15:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694473065; x=1695077865; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VWK2rC7AH/5QC0BAtsZIFXgYiFb16S6BYTYadGvqcj4=;
        b=BS7O8S6BLOdScL+Y77X73elHPtxDhTLv6IP1238N3W52AlA+Z82/bQlGQljZmElNQ3
         V9T/7LHFZBx3Yu+eDzn08Jx3PpnycYim3ZcqCapzYPM8h14BeLLl6nB6eN3AOq3rcus9
         R5B/t7rK4ZzVfB4FhGM2e9XEBLvmD+iFiY6iVBQBeE6G9XU33hwBRzznrzA7s1pzE+jK
         f0snK6UIImK6W1OfRqF2cneotHQFUt31moRPDowPeno/tq1CoL1DFxPAArGvprJ8R/Ky
         yS1QN6uymbvMXfJGQtGnVLNNY8dXxEMCMUOFd42ctBGTRnVtae26LgATUhnboN1I6tQA
         qSnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694473065; x=1695077865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VWK2rC7AH/5QC0BAtsZIFXgYiFb16S6BYTYadGvqcj4=;
        b=V7VpVGUqu0L3aU0IYn77MGATng03S4LMlo5JTclQ34bgq9Ai5F81FuDbSl2LJFqfBm
         LXGDCHuWoGn/GDoCaLiRwv4cPuXQJMZdyJlfC9YRX+6vp3bjVSvfPV4A31QT7BhOi+QN
         jQN1hj8odIwNvYUXC0abSunDu5LS+EWfiDTHcwr3ELZ3jIQkRJGzkHMc/BgNi+Drzwpq
         FEAIutZ8JO6ANZc8syicxUv4o5FJKlDp0MoEdxo7tvkYQNKodONut/QAlu3rcIIjXM1L
         eXc4ltf9cxqq/xx1/T1aqULYTJ7KhE+LVWggQKZYv2OBa515GDfjHzlbJ952N1xaBLVj
         p2dQ==
X-Gm-Message-State: AOJu0YwsyUd7IyUfoBs9K/gxLh4qruKA/mgY2XQMeyrWsuxhGkeHBEss
	aa3NqPAPq7sBi64vVlt23L1Wzw==
X-Google-Smtp-Source: AGHT+IFnYLoSY71pjx795OD72WJm3LoOlQc659rJWf9PZ/mVw1d/FuaAEl4qKAGzcfIok62Oq6t2dQ==
X-Received: by 2002:a05:6a00:194c:b0:682:4ef7:9b17 with SMTP id s12-20020a056a00194c00b006824ef79b17mr9868013pfk.32.1694473065340;
        Mon, 11 Sep 2023 15:57:45 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id y18-20020aa78052000000b0066a2e8431a0sm6021038pfm.183.2023.09.11.15.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 15:57:44 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 11 Sep 2023 15:57:11 -0700
Subject: [PATCH v4 1/5] riscv: Checksum header
MIME-Version: 1.0
Message-Id: <20230911-optimize_checksum-v4-1-77cc2ad9e9d7@rivosinc.com>
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
X-CRM114-CacheID: sfid-20230911_155746_905144_6F20B01E 
X-CRM114-Status: GOOD (  14.79  )
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
 arch/riscv/include/asm/checksum.h | 95 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/arch/riscv/include/asm/checksum.h b/arch/riscv/include/asm/checksum.h
new file mode 100644
index 000000000000..0d7fc8275a5e
--- /dev/null
+++ b/arch/riscv/include/asm/checksum.h
@@ -0,0 +1,95 @@
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
+	return (~sum - ror32(sum, 16)) >> 16;
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
