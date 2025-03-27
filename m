Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2399C36014
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 19:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W8YQJjvBNrfIHs98gIR7STfTJGc7uQSo41bg6vm+cbU=; b=AFfUOQDl6JLkDH
	5qe9mFa1IIDbYRpXZK2ngK88HsJ3GfugZJYzcEHzaLvgz7tx16+ZOHzPtu8rzXfRl/cf8Qzam11PK
	ezZ7OW4Fmcj/QUb0u1cXMT/WxFPuzoHeqSGkbJK2VaQcds/nSnOfNEB+d2F61emLPBtaE42lBt64c
	LSu7saQ7KgLvNnxrvzGO5gxXbIeYaQsFZsX8cAPAMAATSXoGwO0B8ioJe+nAOXklSdHJvCTACgo7S
	J/Qee5x+6aGJi5kxTYjdhh7HsPZaS8t7k7ybVwNBAYF6Nqm0nGhuCEhmyI0uLl71N5W1wGPYE55YO
	XTteW4Sjjaz+IVOqlq3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txt8R-0000000BrUi-227Y;
	Thu, 27 Mar 2025 19:43:27 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txt1Y-0000000BpX0-23RC
	for linux-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 19:36:23 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-22423adf751so28525145ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 27 Mar 2025 12:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743104180; x=1743708980; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zw3zbGTAqHMsJs8YvOYpRy60tVdSbXNH77zwDO4GVCI=;
        b=WqaO09dzopwtBwzm74EUFgPm1VUqcyiBpaowUVFqZj7s8BKRy5NRjpsEwaqVs4uJ0z
         eHNFxfZFxS6zVM8e/1YMK3q1gGShosbDmYMkoD2Jf679PFfVgD+SL76PU/py0rsOhD2P
         OtJH3IwibQRcGGZpzedEmlJlyZQpdibekcF3i8C3mf82YJvd3UpTH0m5UFQKWfLaEiYR
         SZOFIYfolyE5FZ8a63iixz3yO7foSXEwPMU5DujISgFft4hb5G/QdvrgIZPj0dcsCRld
         VRFeoEIT89MclMHzlljnYzFJ4kxzEWdwj59jFMBq53E4Y32G+w0Q3+j9S4mZbSgUxzuB
         8rlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104180; x=1743708980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zw3zbGTAqHMsJs8YvOYpRy60tVdSbXNH77zwDO4GVCI=;
        b=VwCm2rA2EXtuphJ34D9vi+Qh3Rz6puprdTphoz5ApFZFxDhCJdSab7sHXSfU7qhXLA
         3hiCSC9vErvzEVHLVEgoKcocCLY2YDVXHlsAlVdL4gWCRs/avH4aUdDgJKGlK27ScsbT
         G+yrregXS6RGQrAJbNaujPHpVWP0sUA69ssHte+pcCmCifc0Dhw/SSS0oJOEkx2KyH/8
         ATuPD+bEWO0ppiRlfpAfSgMN4NtbwnUvgQC3Ytp+ES7Z6ZBZkuMf+xxwvQei/VxZkkvb
         8+DFDddWtBDlfdU2J4pxOAEOx83tGPGKnq410jXnajtcMcwdmHoUsjUCyb73m6r2OwsT
         lY9A==
X-Gm-Message-State: AOJu0YwqoWlovMhOQ6CYW8Zg0CScUgOyy+gVp0CpdA2qC6mAVWDkLkDC
	KVIiSYXCZDGrViEXI11NsOdDZ7wKvOKZ8uaSGmjFZvpK82tHHwKfLwPtXCW0y6M=
X-Gm-Gg: ASbGnctKYVG2RkigFVARGf7qwFQJTD1uMRtrj9o0o3mt6Fse0wT5sBq8FvAh07uInj7
	cgsMJcszJYSROah4gIViTGp47Ue6I9DosoDwunEyWan+zpvSKlHJIQNZrL7KHW7g1429HKCeS2+
	33wbxW8fgiGGlYdajBld57+G2O0UV5KYVRNL4hABF1bsMBeei2Q8jihjkAj7BZvRHKefVPsqeCd
	gflFOlkKETPZqeJSA4NAuZLKzjmjb33k/iPNNlg4J93s6OIUuSeUVatAjGj0hgMy1pu1Uh53lgv
	2SXW8UAdK2H9P5Lx11rCIrRX0W1XWrVR52tF31lbch70s1P29mJRke+FQA==
X-Google-Smtp-Source: AGHT+IHpWwO+ALT63AnEQfROc0MsU9HJIU94/2wnOwykaqK6qJLji7kuLw7H0FVEp+QuB62Asb9xXA==
X-Received: by 2002:a17:90b:5827:b0:2fe:a336:fe65 with SMTP id 98e67ed59e1d1-303a7d64066mr7195102a91.10.1743104179797;
        Thu, 27 Mar 2025 12:36:19 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f6b638csm2624220a91.44.2025.03.27.12.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:36:19 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 27 Mar 2025 12:35:46 -0700
Subject: [PATCH v5 05/21] RISC-V: Define indirect CSR access helpers
MIME-Version: 1.0
Message-Id: <20250327-counter_delegation-v5-5-1ee538468d1b@rivosinc.com>
References: <20250327-counter_delegation-v5-0-1ee538468d1b@rivosinc.com>
In-Reply-To: <20250327-counter_delegation-v5-0-1ee538468d1b@rivosinc.com>
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
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_123620_597791_92DD1E94 
X-CRM114-Status: GOOD (  11.04  )
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
