Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C38C02183
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 00:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oeVIzNSPZmA2fNgWgqUHeaXkn7W1jxmdbFnvOlWyRaU=; b=dt8SFrTgxsm5hb
	5M2xCIze1Qukpe4UUElR04nURI0oRkI6wYri9SJ/dH2XYYjc9ivH2oAHQZwhgYIOy1RujwMJgFEFA
	IYT6OQGW3AH+BQzzlB/YbiXbEaLZ9Jr7+ouapmWUbG6IIK9Ag1ppaGWZpzIf5vUbGZ5VhtRkYJYIl
	6D7Xy7tgPb/ycBDmWztRkwhyF9l0uQtkVOXLa7H8lDCcjf28rz7lcbpViBc55WM4TW51wvFpp1evQ
	2Ugutn3rH1r0AmTmX9HZ4c59bCZpF14SdXCWl6iDkJht1h51nptpuujaktdxx2hI907hMFhxOH2rU
	EtuqxKFSOuVttlHlgtSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXr6B-0000000ABU2-1DET;
	Wed, 15 Jan 2025 00:17:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXprq-00000009zzK-3lkS
	for linux-riscv@bombadil.infradead.org;
	Tue, 14 Jan 2025 22:58:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=vL7HY0dEKrWKEMn+BoWLtPifTt6hhf+Eo5KcPrG96mI=; b=HmORDVxOmfy3+IRD7uyRRlIIsu
	1Keqfj+eZ4xxytzj0MVKrTnqH0PDEfVmvZeG7O0V95D12wM7zH9sgNF/e8ivD6Qd7NbCToFAciGWI
	fxWiQ2pQnKy5XNnjLi/ov2iRlseeeLWNDecdKE96Nzv+VlXPF6bdU5vvmpauruvvRhz+lOMIIB2Yh
	KskkifShDoxFhhmYUZPXPFlTnzkrLPRG3KRC9SHIWAVWfzdhkQyL8MSFkE5g+JI6+RKJhVSfCFx6O
	dx1+9gO54Nv8ypvrewoaYjfmmqybaucRttVZB6LSxVhcQeUMOf9KkA3YwXDC/2xyWKgq3+TPzTTYU
	zBOQwC3g==;
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXpri-0000000Afog-21Ts
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 22:58:32 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2166651f752so136852225ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jan 2025 14:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736895506; x=1737500306; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vL7HY0dEKrWKEMn+BoWLtPifTt6hhf+Eo5KcPrG96mI=;
        b=jKgh3h73U3ueJBE13exDcdzjWZ06tuQQ9lFkbVtonpgn+qNqxG+YoYdg5LeoibpJ0x
         dpZhcbAtUxasBitF4sCJCPEzLaxJbC+6epS3ktbbIzCQK1u7pljMA5ceEPbOtQ2c6F8E
         BlPzhGu4ESzidXswryvWM7dm2XzM7KfL5J9EoyL+01Pvarpz18FPFepObgEwNgRsb7Ef
         HQOOmv9XHwZuUC3rcCuIAH0Kjq583Uq5OdV8M8lm31rWwbdIWAVZkAlac+8YGOZTpo7F
         MTpNvtxCu6UUXGn1pMZfzl8LWdIey+z0b0PukDP5zP9MhWPL+h127Vb8s3ehYX0Fl+Zn
         MFsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736895506; x=1737500306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vL7HY0dEKrWKEMn+BoWLtPifTt6hhf+Eo5KcPrG96mI=;
        b=fW26e9PXORvBs+U+ZI+MfUi7QH/6O3RY2+4w6MirrfpifKUutFuHxWUs2UsAoYkk2C
         Cvaig2JBX4r3G5fxhkECJO7eMDQoJStcliYCDZI9mdaZCIcacPAcghG5LHKdY8iB0H0n
         vflsQe1jC/XWqIpymgMUzfl17pRBiPLRC0OFBiL2vv48VjPyKr4zOflt+HVSK8JY/MCa
         b6nqdGnwUsOgHJXXOTTTHeQoEGka25f8uAsloncJ3LxjOz8VwH9ICUSAz9+2L978Dgmv
         vCpcsxKh1LoHpZCpmo60NvSgRTalNXcdpGS4mKPun513CcyktdOZWeiLEsENQetQ4QrE
         AeXQ==
X-Gm-Message-State: AOJu0YwPWRHMUkyXYVAkzMqcxd8i9s+kZrWAAYf1l+0AzPapJVC5RPY7
	sVx9RBxbwumT4aEEBhNg6mcwQnHuVdZSY5OhRMvVzqiPnN+/hkYmgj/J9NiRjZs=
X-Gm-Gg: ASbGncuR7rMYXFCa++yhRWjnnfzlhXRaRl7nni7NVlzpYR+gq7mdPdA1+NgR9m9XVS7
	tuRNXCrhAlI//eU0GrWNiDlK7iZZrEyua7syRt+STKuKLUAwtgD0PfSV0GIkvb7aMMiwuYMRX7I
	wf6KyoQSMWn+SeUodv6avLGC5yPeM9gtsLdIphQ36AAI9gs5eEEB0F4cKU9FrhKDumP2Kaysg1o
	WsiB23wkbBgJa3dxfN7/8g8BRItic86EIvtykrp0uDkR24K2QGtIBcYz/3aUbKPsxUsGQ==
X-Google-Smtp-Source: AGHT+IGcOgG1DqtPgRuq87OenfYeI7iqhHkrnix8fM+hMVbZ5ICFTggWxOV4+kwRFEcps2WSmP9bRg==
X-Received: by 2002:a17:902:f685:b0:216:7761:cc36 with SMTP id d9443c01a7336-21a83fe4b6fmr435625665ad.43.1736895506247;
        Tue, 14 Jan 2025 14:58:26 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10df7asm71746105ad.47.2025.01.14.14.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 14:58:25 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 14 Jan 2025 14:57:30 -0800
Subject: [PATCH v2 05/21] RISC-V: Define indirect CSR access helpers
MIME-Version: 1.0
Message-Id: <20250114-counter_delegation-v2-5-8ba74cdb851b@rivosinc.com>
References: <20250114-counter_delegation-v2-0-8ba74cdb851b@rivosinc.com>
In-Reply-To: <20250114-counter_delegation-v2-0-8ba74cdb851b@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atishp@atishpatra.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, weilin.wang@intel.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_225831_163609_969B1EFB 
X-CRM114-Status: GOOD (  11.31  )
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

The indriect CSR requires multiple instructions to read/write CSR.
Add a few helper functions for ease of usage.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/csr_ind.h | 42 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/riscv/include/asm/csr_ind.h b/arch/riscv/include/asm/csr_ind.h
new file mode 100644
index 000000000000..d36e1e06ed2b
--- /dev/null
+++ b/arch/riscv/include/asm/csr_ind.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2024 Rivos Inc.
+ */
+
+#ifndef _ASM_RISCV_CSR_IND_H
+#define _ASM_RISCV_CSR_IND_H
+
+#include <asm/csr.h>
+
+#define csr_ind_read(iregcsr, iselbase, iseloff) ({	\
+	unsigned long value = 0;			\
+	unsigned long flags;				\
+	local_irq_save(flags);				\
+	csr_write(CSR_ISELECT, iselbase + iseloff);	\
+	value = csr_read(iregcsr);			\
+	local_irq_restore(flags);			\
+	value;						\
+})
+
+#define csr_ind_write(iregcsr, iselbase, iseloff, value) ({	\
+	unsigned long flags;					\
+	local_irq_save(flags);					\
+	csr_write(CSR_ISELECT, iselbase + iseloff);		\
+	csr_write(iregcsr, value);				\
+	local_irq_restore(flags);				\
+})
+
+#define csr_ind_warl(iregcsr, iselbase, iseloff, warl_val) ({	\
+	unsigned long old_val = 0, value = 0;			\
+	unsigned long flags;					\
+	local_irq_save(flags);					\
+	csr_write(CSR_ISELECT, iselbase + iseloff);		\
+	old_val = csr_read(iregcsr);				\
+	csr_write(iregcsr, warl_val);				\
+	value = csr_read(iregcsr);				\
+	csr_write(iregcsr, old_val);				\
+	local_irq_restore(flags);				\
+	value;							\
+})
+
+#endif

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
