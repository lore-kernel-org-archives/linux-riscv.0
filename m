Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A02B0EB8FAD
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 04:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UIVgPqSxrlDeK//OGMg0jcWc+GEwKWQRVjbrMHCawV0=; b=c7ZPiuSRrAMB6t
	x1KVwoIBLCTB+NtAWSuBnY7Vdr7QBMyBUsaoDSw+U3wjQP2e0kFSLsBefHzwv7JJwPvjawhcaCSl5
	8XMPfBpwFXaLHtJTztHRgzVuqClg4gfsJGthQfoiDiBLjbN0Nj2y5vqhChS1Iytozhl+mB5ZRahWs
	9xmV6gYYHlbYBWDF43AFJMUEPcuFZhyZ9UF7TQya06hJBKWUjLQqRrvcYqXWsrn1BUWyX8+q+wRWx
	YsYWiRCbAeLnxSp06fv1lZIRdSjiHmmWC5ZLLC3WsWupnZr+M4EwLhF5rs/0GlwN3xbD9wk5Lt8KU
	kMH/6DVZm8Mdshvgg53Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdkRn-007FbY-0Z;
	Wed, 06 Sep 2023 04:47:23 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdkRi-007FYo-2m
	for linux-riscv@lists.infradead.org;
	Wed, 06 Sep 2023 04:47:20 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-68a41035828so2155274b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 05 Sep 2023 21:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1693975632; x=1694580432; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hFV9eKDRL/UI9X8ku3j8I3nR0nMSzd2mz74uOzTK7yw=;
        b=uO4yNLFQrNJLWpsRcSYO+CK3l8ubMboOn0VmbbvnLCG4t+0UiXPfv/fF8UZYe87xed
         Djs1D2TkpdeBWkIjvtFrDgjoDtDTDoDSEI6+NeAEjC+z+a+UaSuTYutjRLAeSwCCUjnc
         hwwyN4rw5V5Cfii3r2MQj4Xv/l1IPJ7lnSPbxkSAJR0OIr0ZGV699cxg1G2ZRFX7eU+g
         718qOyxDFhzD2N4e839cgZUb1G3KGBp4wq2fkW9gqi8bDbX4S838w4AuBvF5k56ttEVD
         PqwTzDTPTCzvYn+JbWYBIBIcjyDIE/L+T0Tabe+oZDVXt5USgbL9rR8ifCRCAhFPg+MK
         Hsng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693975632; x=1694580432;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hFV9eKDRL/UI9X8ku3j8I3nR0nMSzd2mz74uOzTK7yw=;
        b=WX7iEO7GCA5BwNRxxbV1tewTjaWVD5MBYJTDlMo+drOjIYrre0ENVPzQheCnd9PF69
         DV8z1TcAfYEOy6nkv1nT4cN0yQvYcwgzYfnR/mNUMWQV6C+X9r/QPjL7ScNyNRWO3CgP
         Xma6D6+2hk0Tg1niun5mf5GWt7SMnCk74UskefIC75ZtZB5cmom/WH0XOwSdLZNJbCk5
         M0YrnMNwOV70KlHnVY2HF7x19pUhT1IrNQEhPmNU471ywC73oOKBW50QA5HOSwsXXaw3
         2npfz4GVzmr440j5hNDYbPEcoc05dQIcxTZFQkDPvKN9O4MBxK+WdJOMZYzfKrVJeZ8B
         /tHQ==
X-Gm-Message-State: AOJu0YyHJRuAIGnEwkiUFHMbdxgpLtlQNFOfNhAYjhcQuCqAkX0DnG9c
	7lnEbh8DNtfQxudEeK8y5W9Cow==
X-Google-Smtp-Source: AGHT+IGS9NkG+PXPovJpK4ZJ8/CvYTRAdbGX2XNpOJgee0lGFdDcWjhDajvCdKdYrutdpTp/c4tHpQ==
X-Received: by 2002:a05:6a20:158e:b0:13e:9dba:ea52 with SMTP id h14-20020a056a20158e00b0013e9dbaea52mr15423327pzj.13.1693975632238;
        Tue, 05 Sep 2023 21:47:12 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id g11-20020a1709026b4b00b001bc56c1a384sm10087313plt.277.2023.09.05.21.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 21:47:11 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 05 Sep 2023 21:46:50 -0700
Subject: [PATCH v2 1/5] riscv: Checksum header
MIME-Version: 1.0
Message-Id: <20230905-optimize_checksum-v2-1-ccd658db743b@rivosinc.com>
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
X-CRM114-CacheID: sfid-20230905_214718_899977_46A78BE7 
X-CRM114-Status: GOOD (  14.63  )
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
 arch/riscv/include/asm/checksum.h | 96 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/arch/riscv/include/asm/checksum.h b/arch/riscv/include/asm/checksum.h
new file mode 100644
index 000000000000..573714b9ea15
--- /dev/null
+++ b/arch/riscv/include/asm/checksum.h
@@ -0,0 +1,96 @@
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
+#ifdef CONFIG_32BIT
+		csum += csum < ((const unsigned int *)iph)[pos];
+#endif // !CONFIG_32BIT
+	} while (++pos < ihl);
+
+#ifdef CONFIG_RISCV_ISA_ZBB
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
+		csum_t fold_temp;
+
+		asm_volatile_goto(ALTERNATIVE("j %l[no_zbb]", "nop", 0,
+					      RISCV_ISA_EXT_ZBB, 1)
+		    :
+		    :
+		    :
+		    : no_zbb);
+#ifdef CONFIG_32BIT
+		asm(".option push				\n\
+		.option arch,+zbb				\n\
+			rori %[fold_temp],%[csum],16		\n\
+			add %[csum],%[fold_temp],%[csum]	\n\
+		.option pop"
+		: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp));
+#else // !CONFIG_32BIT
+		asm(".option push				\n\
+		.option arch,+zbb				\n\
+		    rori %[fold_temp], %[csum], 32		\n\
+		    add %[csum], %[fold_temp], %[csum]		\n\
+		    srli %[csum], %[csum], 32			\n\
+		    roriw %[fold_temp], %[csum], 16		\n\
+		    addw %[csum], %[fold_temp], %[csum]		\n\
+		.option pop"
+		: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp));
+#endif // !CONFIG_32BIT
+		return ~(csum >> 16);
+	}
+	/*
+	 * ZBB only saves three instructions on 32-bit and five on 64-bit so not
+	 * worth checking if supported without Alternatives.
+	 */
+no_zbb:
+#endif // CONFIG_RISCV_ISA_ZBB
+#ifdef CONFIG_32BIT
+#else // !CONFIG_32BIT
+	csum += (csum >> 32) | (csum << 32);
+	csum >>= 16;
+#endif // !CONFIG_32BIT
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
