Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B490DC4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 00:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dO8RDnCrzm9/9r2gVfnhHxWOnoXPcJt98Kfy+5YOvPI=; b=tFyctHGQW8gI7X
	SX/qEGL7zsE5Z+A6Q49ndeecLMEir/w7wZSTmNy0VYLja6sTFtT9a/7XoSV4U3YKRFXVk+0Mshu8+
	HjC/xu9m2ia843MKUhYLHsS2eJQurNWht8RoX/pXf/EylTEtwqf0NrgBgBjQX2HGFn0rTFwoRQ4Nw
	ObPNOq33fqeStgZAC05X6OkRi5xEf5llTx2rtACqZVXinMda/xdZlCu9XproGjUvRY9B8YnhYco8w
	XDx+v8UzhqLVuyZ5MQz6cqEy5fGndwDFGczbJoDFmMEY5/Aa/mQQklTKj4Jv6+/qiSCHOW4bxwboN
	XmH1j/ZooFx0uebbGtCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxyx6-006NXD-2D;
	Wed, 01 Nov 2023 00:19:20 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxyx3-006NUP-1h
	for linux-riscv@lists.infradead.org;
	Wed, 01 Nov 2023 00:19:18 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3b2ec9a79bdso4299760b6e.3
        for <linux-riscv@lists.infradead.org>; Tue, 31 Oct 2023 17:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698797952; x=1699402752; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ed3AceHMZkBHW3Y7G0fWRXKUFOz+aro++Yp4kYAVXuk=;
        b=cwT/or+XSgLnH6Ax9hxUUlmUEYAd19a/PwAd4uWsXPthhlCy1Qev53Of866AHzZcgY
         ZpmAXaX7E2qm0DAfdzl66IBPl01a6ouz8nXdBzLB9G71OldvdUn8dj1lNBYsc8xy30Ya
         EVcMHCHrIkUI9OuZFfLBAUUH8L5YeqSW6Ai9z/SbWeFk9bZnGGgkHgHrOSt6nwj9D9uj
         GDLU5kTmx/GEsRdsybtGdAvhitq68pQBG67boU35w+TvtMBGXf/riADUtRgkdjimGIeX
         YEaW+iGxRFlC78QiE46mAKQXZVWFOOdLb3q+FILYOYDSoACBLTzOni/owL/yjjmIYgyz
         xQ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698797952; x=1699402752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ed3AceHMZkBHW3Y7G0fWRXKUFOz+aro++Yp4kYAVXuk=;
        b=QQDh/ddFQ1VnaziIzDZ6KadvDEdtlBgBueEjaTO9wr4Lrfe4s3bgjotGMKALEuOV7D
         mWuGpFOcqjGpapDdLtoqGY8FZrcXuZ6nf+W/aAluRwmM3qQHXXp+fnNx8HhU1iQajIzI
         9KED5CF9jHixgPfuknNS9JLkkXHceJGti5MhLwfFaKVnnC6C7kVGdpowv2Q79xKczhqx
         auPRnHtIN9gX9COz1xLfBZ1Ua5Ay+Cgpm0wK+/9KIWsp+sQ+jQm2FCuhoECghk94aTGK
         Ucbibf8GpnT6ilxHxNZ5sUgKb7e9dsveATUzUb86Qfmkb+fuKhzPgJFEAjAigWh+ddjD
         TSLQ==
X-Gm-Message-State: AOJu0YyQOjqqKOYVqcxUhyHJaizk1FV+PpMMcN1kQbZ3WJ2vnQkA3Qxl
	QGNWvqtaI2AU/y9SfM/cAXMFLCRLPkctM3WJUYw=
X-Google-Smtp-Source: AGHT+IEB78/S9W6MdSMygN0kmC+MuUDJddUs0YHy5/K3oMHwNtqdO89EEGoqfKE4JXDSmVHIACKBbg==
X-Received: by 2002:a05:6808:1293:b0:3b0:daf8:954 with SMTP id a19-20020a056808129300b003b0daf80954mr20274613oiw.49.1698797952751;
        Tue, 31 Oct 2023 17:19:12 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id n21-20020aca2415000000b003af638fd8e4sm65309oic.55.2023.10.31.17.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 17:19:12 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 31 Oct 2023 17:18:53 -0700
Subject: [PATCH v9 3/5] riscv: Checksum header
MIME-Version: 1.0
Message-Id: <20231031-optimize_checksum-v9-3-ea018e69b229@rivosinc.com>
References: <20231031-optimize_checksum-v9-0-ea018e69b229@rivosinc.com>
In-Reply-To: <20231031-optimize_checksum-v9-0-ea018e69b229@rivosinc.com>
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
X-CRM114-CacheID: sfid-20231031_171917_563657_1B7E7039 
X-CRM114-Status: GOOD (  15.48  )
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
