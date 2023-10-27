Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500C4C27C47
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 22:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qSM30MCQkPRdBaXS+pwqGM9BhG11eOjOVOqPn43ehFk=; b=3gWCtplS6DEga6
	jrWwsmHnlEglt6X6T0YMN8lPmcvkTcmkxcj8UBkk6/VsinpTACLDECf1dns6BJb+fKqUq2cmAt7DJ
	n/udRtMPp+LSYyrzJRaLORS7Sjv7/SA17Lo17wurlgEKs6GVT7kAo/jyze3zN1/CjC8OspD4FBK/n
	6eQ92BVDlHkviIBKVnxa9EpTJ4Dg1PsGwr245JWN5KlGy6vDeR0Ylp+oeDOHwFkqrWoieg1ToEg/r
	ZRFOnuMsD8vBpneAylZ2rXzvZP0+o710IcGxkcAufPQJOrOq9AbobBTld5KszjpTCPMKVke/TBSSI
	AgS9PX6W1jeCSAFQJe3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwVYo-00HJRY-36;
	Fri, 27 Oct 2023 22:44:10 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwVYi-00HJOf-22
	for linux-riscv@lists.infradead.org;
	Fri, 27 Oct 2023 22:44:06 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-6cf65093780so1656020a34.0
        for <linux-riscv@lists.infradead.org>; Fri, 27 Oct 2023 15:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698446643; x=1699051443; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8BafBaWBWsOb19tamkke5Dj16vu64sm5n6mJ/bBKmhE=;
        b=O+BamGujnecH34VPHe5FwWOSPPeRCFT6HCDl72TqQ8clMS6N85AhmjMzql2Tymbgp+
         NSndegD9MaQ5ZroZ0xCsMfw8qg9eeLMfIQTOuho5TZT+TV2O4CDp5Bbd48yfXKfT+dkD
         InHuwLXZhqDDc+2FRguRWbZ9z4Ndp52FAn1qxpluJ9ir01pdcbXyZqLOMZucgpmoz819
         9NF8eA15LuqnbNXJ9m6UPIL0CDtfq/INtfwJJLlDxLqjnq2btpgr+8YAkHu/8gMr6Cxm
         O5vRKJTs3I2aGiUINe9yzYhwZxk2A52++82X09KVDVw+0Sr52adAyzX6xo9/UMcJ19eA
         Bk5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698446643; x=1699051443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8BafBaWBWsOb19tamkke5Dj16vu64sm5n6mJ/bBKmhE=;
        b=evl9IJ1/8eRMpRn3CxmTYgGNI57FYWXRDBK3YWn8lpbTqmW1UCOivMZj1YKJIVffzG
         JZN5sQb6aBgG96hW+V6y2giWm0etCYrJBla8dq3Ar0ydJvW8rOXJVp8o7ag7QKSMbwoF
         82VYBXfLK4vRl1vr69sdrVR6lj5AObN7ip22pabi4D+2p2HdOjEss49J/tpABln/Cw/G
         6ImuWKz58zaBTxanGmIzRwd7DLUAJb5jp10+H1FmP8sVpnraM4mbvs7+bgbC+OqUx2zp
         SyE2pDl3E770ZYIrWMf5XLDAnlidqnYQwMdiA7k55Gp4iiXJu9X357Z4h5w21M5ctYg6
         cJEg==
X-Gm-Message-State: AOJu0YwytMNcFF+qmmdizMHOazK2sZ9X/mzgxJXMjQQrAHVyYiuZwnfE
	C6KoRBUMzP1HsCww0JQI4srKFw==
X-Google-Smtp-Source: AGHT+IEPbxJRpeWOtruPaR4gtsoYOSkyXUjTp4UCIDh0rJAvuI4jazlUIen6Q8F8ILANAMxvX1lBQA==
X-Received: by 2002:a05:6830:925:b0:6bf:1444:966d with SMTP id v37-20020a056830092500b006bf1444966dmr4123246ott.1.1698446643442;
        Fri, 27 Oct 2023 15:44:03 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id t15-20020a9d748f000000b006c61c098d38sm448564otk.21.2023.10.27.15.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 15:44:02 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 27 Oct 2023 15:43:53 -0700
Subject: [PATCH v8 3/5] riscv: Checksum header
MIME-Version: 1.0
Message-Id: <20231027-optimize_checksum-v8-3-feb7101d128d@rivosinc.com>
References: <20231027-optimize_checksum-v8-0-feb7101d128d@rivosinc.com>
In-Reply-To: <20231027-optimize_checksum-v8-0-feb7101d128d@rivosinc.com>
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
X-CRM114-CacheID: sfid-20231027_154404_674259_0183A9C5 
X-CRM114-Status: GOOD (  15.99  )
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
 arch/riscv/include/asm/checksum.h | 92 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/arch/riscv/include/asm/checksum.h b/arch/riscv/include/asm/checksum.h
new file mode 100644
index 000000000000..9fd4b1b80641
--- /dev/null
+++ b/arch/riscv/include/asm/checksum.h
@@ -0,0 +1,92 @@
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
+extern unsigned int do_csum(const unsigned char *buff, int len);
+#define do_csum do_csum
+
+/* Default version is sufficient for 32 bit */
+#ifdef CONFIG_64BIT
+#define _HAVE_ARCH_IPV6_CSUM
+__sum16 csum_ipv6_magic(const struct in6_addr *saddr,
+			const struct in6_addr *daddr,
+			__u32 len, __u8 proto, __wsum sum);
+#endif
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
+	csum += (csum >> 32) | (csum << 32);
+	csum >>= 32;
+#endif
+	return csum_fold((__force __wsum)csum);
+}
+
+#endif /* __ASM_RISCV_CHECKSUM_H */

-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
