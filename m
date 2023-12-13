Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61EDEC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 01:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AoaMBDmcoeJhZE4zuZjJV7Wr7uRff5HnghtuuiEc58k=; b=lt0i9PzbH9OxGj
	c0CE1pdz0rL4DMvN4DsXZ6p4TJAuKkbDRHf2H8N9IqFJC9A/YjWsSrs21/J+pvdL3CirtEFVg8zUH
	J8bXsmF2x4ZEy+qmeMJu3wZD+suL3ICFatEE8jXcZfM6QYmJIXmso+oy/rZ42aE8BOuLE2CigLKtS
	Nl2An2QmEaRF+W7dCFPjWFXecLQPv60ka5Y6mHjlDFjJM3Betf0Ns3wgv27PbjqBxu3PbGh5IQLES
	HRTh4cMYKd0Wuqn7SHY/YTqDY8UTP7EKMlQUhm4L77De/xBObWTvD91SjsIG/9vwa/J0b/J5WHUyP
	DZVVdYdkyVX4CH5tcoRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDDtk-00DIHP-2f;
	Wed, 13 Dec 2023 01:18:52 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDDtg-00DIEt-2H
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 01:18:50 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-6d8029dae41so4865968a34.0
        for <linux-riscv@lists.infradead.org>; Tue, 12 Dec 2023 17:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702430325; x=1703035125; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qa7K/oxZt25h94PBFoFutl7qSG1BTlKxow4+QMuXCwE=;
        b=DFrOvJ/GPv9tP603EGadkhqbv7RiimJY/XUPUb1Mq7Xy3NNW2kBSBejkh6sfrLXZKl
         ym53Ywnik+OXQUjIYtGEKL/JpIa8R6W3t/oC7FNNkBVJOeTrfU1g+e+Fl7tc4G1Af9wZ
         EhehJ5WTGUAFVMS3Me4NLsduI2KP06qxcAe1jv3qZAF99VoFmiEASR6pRwZfUocXggVS
         /wwt6St2Vwl6IMcyzB6wrwvQLTXVQuqpZQOm0Tilc8Y/sDfG0Z/5MEiBm94LsrG81tIu
         9nSJVLyvmYkxrq7TlAoHrklebbvp/ixhMDANj3OZ9YwBr1uWU8OO3aWSegbXVmU6RiOw
         HgIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702430325; x=1703035125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qa7K/oxZt25h94PBFoFutl7qSG1BTlKxow4+QMuXCwE=;
        b=Y4GoWjajviaB5dHKN813LhQVMmY26nSN99v9vM/mXrSxzPSNDRvAmXvJpPlKwpgWvH
         S5S1PYpkCj2MDIZYl6EjjskrAWJEoMACvjRKD9gxaTlchySQSn+EMMA93u8NSDL+lvbg
         1QwtyjA+VnfVwruNAqxoh+aB6LIQBbFNadOUj46GgoXje+u6RElQvvjT0daYPRN5iafs
         aqfk3hIVyPUExURSBXIIFljXqqlE0NnFE6XKNA8WnM2dfLK4qNl6E6WkEjUfWIU9YEXn
         /3hMQprdHUFOuSpphVzlC6y+jSPbcLWlSGiw0wBJ1PAKW3FnIE2pZj8+kjLJfNmDHmK4
         1vWg==
X-Gm-Message-State: AOJu0YyVj3c1RUhZmtkHqLtNvlgMMTpLzAPxvYzHIpOq9ykpwRQBuGuK
	I9qBY/rKQKU9NK4C/czjKxf5aA==
X-Google-Smtp-Source: AGHT+IGUifEiBrI94UV6VOlOXiYP5d8umLFsp21qF3BeVhm5H9xbMNi+1ScQ8UHQjpGy45tus138oQ==
X-Received: by 2002:a9d:6c56:0:b0:6d9:e15c:79bc with SMTP id g22-20020a9d6c56000000b006d9e15c79bcmr7215551otq.68.1702430325687;
        Tue, 12 Dec 2023 17:18:45 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id cy26-20020a056830699a00b006d9a339773csm172548otb.27.2023.12.12.17.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 17:18:45 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 12 Dec 2023 17:18:40 -0800
Subject: [PATCH v12 3/5] riscv: Add checksum header
MIME-Version: 1.0
Message-Id: <20231212-optimize_checksum-v12-3-419a4ba6d666@rivosinc.com>
References: <20231212-optimize_checksum-v12-0-419a4ba6d666@rivosinc.com>
In-Reply-To: <20231212-optimize_checksum-v12-0-419a4ba6d666@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1702430319; l=3074;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=adYqZ1MwkI2tixiO6Vqw0pA42pYvaEcycoXrFZjPpmw=;
 b=4z6EVBErljGKcQ6ywUy9p67X640GJzGAFaxbGt7gS99Jj7/mlk/GsHCbAxkR6srBT0KNEL31G
 eknW7cffrFTCzO5tfzpRKWsA02wygpgNME7+EVpuGtD9DRR31izxRFl
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_171848_741095_7462AAB8 
X-CRM114-Status: GOOD (  14.88  )
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
Reviewed-by: Xiao Wang <xiao.w.wang@intel.com>
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
