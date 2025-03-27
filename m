Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3727DC36013
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 19:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UzKKBqEDxabJ5cmL0DOGRmzk122v5vI4Zai7SqXz9yU=; b=IjdlwdQjp6OMay
	w0kkQn5s59ZRKSt/AO8DAgfnhzgDBl9K+K+hWtqiA2ekGn6IA2GM0l0buq9IVb4yuks2gYyVloLtH
	+L7nJYjCU3Ub83z4hjJhRD+yI14MM68vK8hb25oLJEmM6AHYykGrvV7BgQF5Xww0E2g2me8Z0gKkv
	irqkrTbHjq0MxxdGZ9iGKzMoMmqwEweXMrv3i2VGyNwwLHQerytS2Y6RdAYRekpc+fTPzSy/4g01Y
	VJhN0i6Ped0qiLnIsRmpf3gZMG0vcR7v/akg+gPrxsZL2Z0TxesFiGcuqrzedH3oX9yqk0Ns+07DA
	4R0wr6iMbj3bYy8QynVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txt8P-0000000BrTX-3xxE;
	Thu, 27 Mar 2025 19:43:25 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txt1V-0000000BpUQ-1A9j
	for linux-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 19:36:23 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-301493f45aeso2158557a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 27 Mar 2025 12:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743104176; x=1743708976; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KwDPeMXJfPX+eaLbjuVCFPuV2SZpHciR7qaWH3I9ArU=;
        b=dn46TYXrBpfqwTNS+5IX7rvf8x7GGj2YN92Gx5z3rCw0wqJBJgA4ErBThBv/xW9KZT
         G6lIktsbMEcPu/Uy+upErULbDLLSYn+9TFmxrJ8mpkry6U1w8H1Brc4w2KoN+Me0lxQ0
         prfeIDbVVOfRGQHx4vaHiiFCKQRtI28yMxAcKtnLV2nEzC32TFqoahO7F4vsAq1er6oZ
         Va6Kl6TCcM6HMWapQpsGzp0j0EzXQUn7FzcoJdhJk008tmwbHPLqsAJyGBJJT70iyF4v
         9Yr7wc0DQ52PC8CD5QEzIxtx9bYcMakx1fDbX2mguUpTBDMMrKwIqlU7J2594UHqrfOc
         640Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104176; x=1743708976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KwDPeMXJfPX+eaLbjuVCFPuV2SZpHciR7qaWH3I9ArU=;
        b=R5Og3B7xwJKwtu5jGCLiDw+76S5kTe8XqQ/TgbEZ3fsvpF0HtVd7XfBVwRbHp2nmyU
         nLKwVsMxIR2o48U44eBNgxOwS/BRDcc1tXu0oZOSG/AYD191/AhZxB1qOFcmGW/FNdTw
         LZA01Bv33DWQqVX2dLJcyqeJYVQsL+4r7BKpvrlENSY/oU6kiqjfxz77UeA16IpYIxtJ
         R952dHNjfVWLS7/VcdRmLh7J8W/DrN6j6nYGjJBv9RGd3Nl3FVssuFGII7wUj86fmbey
         79geCp3owBUQnzai4DFi/uu4jt+ctHmh22wUhdQEzUpaC2izG1Aiw+laIQoK364CpHy+
         pGqw==
X-Gm-Message-State: AOJu0Yx9RNsqj9Y0y8Tbx65BI7mWevIZb+qPPH5VSd9kceT2N4wUKElA
	Ai2Jv1ot8xuGA8J0nm++Nqc3vdXFtqFvZRJzRP4cPeUXK5QMAtZXwe5V5DNxB6k=
X-Gm-Gg: ASbGncthXh8UQBA1aZDxzdeLxUhKHVN6Pp4pWhTbYkNTWVj3GeUKabs0R+p1IlnmayV
	fd1USCGG6PlMy5nYugH1EwS5w23zQRC7Lz3jXZ6X9OxW2mvt9f/UQK8gulLcELkDy6xcA0zAyzm
	oCkq8kLCvZWSEKPgR+2hqsur5WOuWufyPzOla2mIZ9eu8p7ivOFviX2oLiXUKr4Vpka9BQmiMWu
	86ZkLPPU76H5eFd7/QuAltOKoSmJRJvCgAjk/0mxNZ9bgB8JzpVjLaJWaCxrLXOKKLvDdHi6QiV
	Mkkm8pTojlePJlMcUk1FW2LIq6XNVp8rvsmsGLYjmceeph8D7lBXEBcul76hVsffCKnE
X-Google-Smtp-Source: AGHT+IGz75Wx8Bt7QWuszatV2VM9mkY8/YUQoqlctkJAiAm8Pl5r9TqAJ39Hb6cqblaB+y3PgjrXrw==
X-Received: by 2002:a17:90b:38c4:b0:2ee:9b2c:3253 with SMTP id 98e67ed59e1d1-303a9192f68mr5197278a91.30.1743104176455;
        Thu, 27 Mar 2025 12:36:16 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f6b638csm2624220a91.44.2025.03.27.12.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:36:16 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 27 Mar 2025 12:35:44 -0700
Subject: [PATCH v5 03/21] RISC-V: Add Sxcsrind ISA extension definition and
 parsing
MIME-Version: 1.0
Message-Id: <20250327-counter_delegation-v5-3-1ee538468d1b@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250327_123617_330059_D9389620 
X-CRM114-Status: GOOD (  10.94  )
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

The S[m|s]csrind extension extends the indirect CSR access mechanism
defined in Smaia/Ssaia extensions.

This patch just enables the definition and parsing.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 5 +++++
 arch/riscv/kernel/cpufeature.c | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 869da082252a..3d6e706fc5b2 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -100,6 +100,8 @@
 #define RISCV_ISA_EXT_ZICCRSE		91
 #define RISCV_ISA_EXT_SVADE		92
 #define RISCV_ISA_EXT_SVADU		93
+#define RISCV_ISA_EXT_SSCSRIND		94
+#define RISCV_ISA_EXT_SMCSRIND		95
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
@@ -109,9 +111,12 @@
 #ifdef CONFIG_RISCV_M_MODE
 #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SMAIA
 #define RISCV_ISA_EXT_SUPM		RISCV_ISA_EXT_SMNPM
+#define RISCV_ISA_EXT_SxCSRIND		RISCV_ISA_EXT_SMCSRIND
 #else
 #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SSAIA
 #define RISCV_ISA_EXT_SUPM		RISCV_ISA_EXT_SSNPM
+#define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SSAIA
+#define RISCV_ISA_EXT_SxCSRIND		RISCV_ISA_EXT_SSCSRIND
 #endif
 
 #endif /* _ASM_RISCV_HWCAP_H */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 40ac72e407b6..eddbab038301 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -394,11 +394,13 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_BUNDLE(zvksg, riscv_zvksg_bundled_exts),
 	__RISCV_ISA_EXT_DATA(zvkt, RISCV_ISA_EXT_ZVKT),
 	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
+	__RISCV_ISA_EXT_DATA(smcsrind, RISCV_ISA_EXT_SMCSRIND),
 	__RISCV_ISA_EXT_DATA(smmpm, RISCV_ISA_EXT_SMMPM),
 	__RISCV_ISA_EXT_SUPERSET(smnpm, RISCV_ISA_EXT_SMNPM, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
 	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
+	__RISCV_ISA_EXT_DATA(sscsrind, RISCV_ISA_EXT_SSCSRIND),
 	__RISCV_ISA_EXT_SUPERSET(ssnpm, RISCV_ISA_EXT_SSNPM, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA(svade, RISCV_ISA_EXT_SVADE),

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
