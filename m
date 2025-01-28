Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48DC5C0218D
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jan 2025 05:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Jaqs6iOA2oEKG5NDVEPiT5ub+9Ih0dnGhdDJTScO9U=; b=YpdSAa6uHpXCE+
	SQqo5m6ET1nScjgTQJYXvASMsjuA4YIEXy8gbL4jitmINDsnA5Eq1LxYmOzizFa0mZryKcMBzXyIZ
	62sOklXcRPxFXJZrCp2XAx+efAmMe9rDgU/OeqrPNOWwbKT5NZb8hw7hQACH80foFNWQKWUvWPuBo
	ECLWp4u89SSiX36iguZqma/1vuE+TEm3F8wvI1eZKb9Kc6IWjhi8Kna1ruvsLi0dNGQZvIMQ3au45
	oF+0cAx3YFPkZNRGAL5hTF8qf+QwcMkQogedenaS7VJlT2cdTDWLDUoKiFJYPP4atPh94CLqqYXQG
	fIPP1lqbiIlH/mT2duIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcdqg-000000047Dx-0LuA;
	Tue, 28 Jan 2025 05:09:18 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcdhf-000000044Qd-2ZvG
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jan 2025 05:00:01 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2ef87d24c2dso6874764a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jan 2025 20:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738040399; x=1738645199; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qaBtUmcc8yUuB4kb43/yPbo3SeenY+DY+wt99rutmtE=;
        b=BLl0w0u+Rgg2Pe8VByR9MEq67LxHIKU/63faSH8as4v5TEv9zvBEPirLCl5rkUQ9lR
         CkLez/LMZq+usBV+eYiuJoYDPBzunqATkMrTqjEbD4w2hy4Id1FTDjR4UJekLsl4pAXl
         kMXQ0MdgztEvp/VJS+CvNFCTw93dA2UVIeaUs7u1wza3JI8zLQo1TKfip9O+cqLyHNcl
         XJrCqqcmZfklvYjJqX019drzcOegJB/KxI4/aKjE9k/J5+pEFS83zdc1yM0rYioe0Q6t
         uDmnuPEB2O9G1jzi3e/BVLd/mWj6JWNMvKBAW9OC1MhloB3SBAliI4s1WAJ62ZbRm2s3
         mLPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738040399; x=1738645199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qaBtUmcc8yUuB4kb43/yPbo3SeenY+DY+wt99rutmtE=;
        b=aT29qnTjCQCciHyLuzk41E+xGCiu0gRj7MjnrqAOVfOL+rq+SZKix9V0Q+4/A4gFfL
         xXdL12Mb3sj3RhqCMie11udZo6AgbhTUFIDEaGjVOjEGxmyLh5BOINWddwhPDMhkYuzg
         70MaOg5W/jX4MkgKhhSQK6IQGP/PkuvOw9aV5KW7iEOb2HfXEvj07SsdUtPrhfFwXgHz
         Cbvd/9+f7uOi0tLAu8PQRQl4jE6EJV0zvnIh9gwaV094+2Iua/WEkx4OT0ZoTIky6GfW
         07LXQAJPB7fBMtEFr5e673j1qlhVgVAn3cceajvXs73EON57TCE8cyuw80t4vGZJLQuL
         lK/w==
X-Gm-Message-State: AOJu0Yy7cvaoYiiPaezJ5af+v1qrOi57Y69pfOd/Ni+LZ42/o5d9AZzV
	fvvBlv3uhNzwXwy8ZMoX0G3cM3WkUZVbCqT1QMXLd1gdcvYhAMbtKvzBf9qdxFk=
X-Gm-Gg: ASbGncukF6tocgj7WQiLq3sSfFMqOdwD1RpZwL+Kyo3yQrIbce8hnDc8BP4fRRVSshn
	QEvdFOymFxydc6ixEwDdMV3I7l77dFDk6NT/5SvddH1qiAbB2j4pGxNjQM5y9X8qTPHwWDbx/D+
	LjgCVjrh0/pO/WGcfb9eWRfEyXZKLW4L2I+2TBxOOA1avaufVSw7hxcgj9TwykQyEmdP31jYgUr
	9SGxVVta+CwjJdwYqXq8iO3VvlV+QvlQNjmfJ67vNViLzTZopdJ2u9D1wTYDp2IPZh/7X3hBcAR
	njFCal6CjHkWq97wU+N9WQFs7eqM
X-Google-Smtp-Source: AGHT+IGvdsN2QjvjEdbxBM8fo2c3ojaIC5oAQTKaWVxAx/Vzcck7YYYeeDIBW3vl6CdvOvXnZUnWVw==
X-Received: by 2002:a17:90b:3a05:b0:2ee:c9b6:4c42 with SMTP id 98e67ed59e1d1-2f782cb68fbmr68628638a91.16.1738040399051;
        Mon, 27 Jan 2025 20:59:59 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa5a7f7sm8212776a91.11.2025.01.27.20.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 20:59:58 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 27 Jan 2025 20:59:47 -0800
Subject: [PATCH v3 06/21] RISC-V: Add Sscfg extension CSR definition
MIME-Version: 1.0
Message-Id: <20250127-counter_delegation-v3-6-64894d7e16d5@rivosinc.com>
References: <20250127-counter_delegation-v3-0-64894d7e16d5@rivosinc.com>
In-Reply-To: <20250127-counter_delegation-v3-0-64894d7e16d5@rivosinc.com>
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
 Atish Patra <atishp@rivosinc.com>, Kaiwen Xue <kaiwenx@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_205959_782126_A0324C57 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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

From: Kaiwen Xue <kaiwenx@rivosinc.com>

This adds the scountinhibit CSR definition and S-mode accessible hpmevent
bits defined by smcdeleg/ssccfg. scountinhibit allows S-mode to start/stop
counters directly from S-mode without invoking SBI calls to M-mode. It is
also used to figure out the counters delegated to S-mode by the M-mode as
well.

Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 2ad2d492e6b4..42b7f4f7ec0f 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -224,6 +224,31 @@
 #define SMSTATEEN0_HSENVCFG		(_ULL(1) << SMSTATEEN0_HSENVCFG_SHIFT)
 #define SMSTATEEN0_SSTATEEN0_SHIFT	63
 #define SMSTATEEN0_SSTATEEN0		(_ULL(1) << SMSTATEEN0_SSTATEEN0_SHIFT)
+/* HPMEVENT bits. These are accessible in S-mode via Smcdeleg/Ssccfg */
+#ifdef CONFIG_64BIT
+#define HPMEVENT_OF			(_UL(1) << 63)
+#define HPMEVENT_MINH			(_UL(1) << 62)
+#define HPMEVENT_SINH			(_UL(1) << 61)
+#define HPMEVENT_UINH			(_UL(1) << 60)
+#define HPMEVENT_VSINH			(_UL(1) << 59)
+#define HPMEVENT_VUINH			(_UL(1) << 58)
+#else
+#define HPMEVENTH_OF			(_ULL(1) << 31)
+#define HPMEVENTH_MINH			(_ULL(1) << 30)
+#define HPMEVENTH_SINH			(_ULL(1) << 29)
+#define HPMEVENTH_UINH			(_ULL(1) << 28)
+#define HPMEVENTH_VSINH			(_ULL(1) << 27)
+#define HPMEVENTH_VUINH			(_ULL(1) << 26)
+
+#define HPMEVENT_OF			(HPMEVENTH_OF << 32)
+#define HPMEVENT_MINH			(HPMEVENTH_MINH << 32)
+#define HPMEVENT_SINH			(HPMEVENTH_SINH << 32)
+#define HPMEVENT_UINH			(HPMEVENTH_UINH << 32)
+#define HPMEVENT_VSINH			(HPMEVENTH_VSINH << 32)
+#define HPMEVENT_VUINH			(HPMEVENTH_VUINH << 32)
+#endif
+
+#define SISELECT_SSCCFG_BASE		0x40
 
 /* mseccfg bits */
 #define MSECCFG_PMM			ENVCFG_PMM
@@ -305,6 +330,7 @@
 #define CSR_SCOUNTEREN		0x106
 #define CSR_SENVCFG		0x10a
 #define CSR_SSTATEEN0		0x10c
+#define CSR_SCOUNTINHIBIT	0x120
 #define CSR_SSCRATCH		0x140
 #define CSR_SEPC		0x141
 #define CSR_SCAUSE		0x142

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
