Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A2EC47074
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Dec 2023 17:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LZJrL16mpe1K7PWCBtn/zm8dalC0juVh7Mwzic0oObo=; b=XnsiRWbsjmECSm
	zI7ncmovFZ9mfz6jHKPCg9dk4NhLC1cLMS8F9wdn3G5jCrypNR68xhBZZj6lhWuWGaH+m8+hpA37u
	1L0jr57WbT24xj6DKo4EIu2PwdeyBREk5kOB8JQyJTMimzB+sTs00I6JlBz0N7l8U4N0irVCy85AB
	DZyCiB5ecLOrbqC6mN1lhf8r4PePQRqFPh38qmMk6Z+xIpdT9sQEt3G6pZWrZjVxEHI+4wuhsVKoa
	TPic/sMO4v/fgZw+NTp3NF6o9dDRLY2xYj2avqd6yR0oR5aCBPfoqqadR4EXtKrSJxMxhU71SZHQs
	ifD1ojxH17F1Uqh3Zomw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIXrN-00FDSc-3B;
	Wed, 27 Dec 2023 17:38:25 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIXrK-00FDPb-0y
	for linux-riscv@lists.infradead.org;
	Wed, 27 Dec 2023 17:38:24 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-20400d5b54eso3996466fac.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Dec 2023 09:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1703698699; x=1704303499; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AlBR54Ho+Y1o3mIpBCBVXs2u+7/gciH5xwmXB5mwVNU=;
        b=rTwG8ol85yOYGVM2B48KRdfi+JE4JhRUFY1QqlC1NEklDvMoc3PJ+ltxLiThKOuraz
         YUy1hJUpjS90BapPzChhtP58EXdXiiZPYZTuZLijjlOuFEXT+4nzBCIGDrF9haqRfFt4
         WKDqlSRzk4RcPoYTLIDQOE0N3qtYRDqpHY4lsEM871M4vtRK5yfZbZm3r35UIxqVbRld
         TFn1InKkjHJQhk5Cw6MdWfIPTKiW3hM7YT41l3GkEcxRLEJvPy2vRK7swASyAO/B9XG4
         gSqk5O6xOfz1YiSMn3eVoG2UQnZPy5HgrL5X0acLNbqhLGNcNmufLsxIgHfsHI+Sx1tX
         F6dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703698699; x=1704303499;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AlBR54Ho+Y1o3mIpBCBVXs2u+7/gciH5xwmXB5mwVNU=;
        b=wE5g/fY45HwwXBcfWxSviL3HTUsN1iIITYC3iE64pHGqUn+nTyYVmqF+6gwUQBUzHZ
         e2fdGJBZw3Wnnoh78Oird/02RS0ghzbMnXfnkjw3IMTZAdajcSDH+NF5n3o5nubLRgdc
         O1Ul5tU2aChXuZEelNbpUb1OcBooxmp3bl2nFsQlWlRfadez7VCeEjP2bVW8omC2/wVe
         cfkCjB29kXJwZsfgGUrI3yp4huO0t1zKedbfts9dTt5l01q05lOmgDz4vuh+bZUFsQvh
         rpbO9Ahw9Ww7OwSu9RBmZpqpQuAxRgXhVXaIewjcabi2k/g6+bNC5E2DEYCuZnuyC66V
         LjeQ==
X-Gm-Message-State: AOJu0YxgUCphb8OHW3wL6BsR2CN1iBJm51ykB9HTvpgY9lIFbWX/Zut/
	PqY3VuE9/FOBRCb/0YRahese+dpQNfvryg==
X-Google-Smtp-Source: AGHT+IHczMMzH5Cn/QQoEKkSMMw5EFDLZJOpZnee5RpHBMsp4qHZ0VZY8kIAUCAOz7amU68R78p+EA==
X-Received: by 2002:a05:6870:5249:b0:203:eb66:3bab with SMTP id o9-20020a056870524900b00203eb663babmr9774414oai.54.1703698699564;
        Wed, 27 Dec 2023 09:38:19 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id rl15-20020a056871650f00b002049c207104sm1337173oab.27.2023.12.27.09.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 09:38:19 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 27 Dec 2023 09:38:02 -0800
Subject: [PATCH v14 3/5] riscv: Add checksum header
MIME-Version: 1.0
Message-Id: <20231227-optimize_checksum-v14-3-ddfd48016566@rivosinc.com>
References: <20231227-optimize_checksum-v14-0-ddfd48016566@rivosinc.com>
In-Reply-To: <20231227-optimize_checksum-v14-0-ddfd48016566@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 David Laight <David.Laight@aculab.com>, Xiao Wang <xiao.w.wang@intel.com>, 
 Evan Green <evan@rivosinc.com>, Guo Ren <guoren@kernel.org>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703698692; l=3093;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=5kLrZ5pIGOixKzGlevacL81yKd58H4/jGvyu52ss5bM=;
 b=3U9itHHqS9xaCdluBkJYwsc1am00JcT/biurx7FiRMdr90d9yE4HTjBnrQeNRpbdA51oMB9S5
 DbdrJtJ8v0oD7Y5u/gxJQC8ATbj1SXcEttVfdfOu/fIFZjnsXHx4hFQ
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_093822_339098_9DB256D5 
X-CRM114-Status: GOOD (  14.98  )
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
index 000000000000..5a810126aac7
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
+		return (__force __sum16)(csum >> 16);
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
