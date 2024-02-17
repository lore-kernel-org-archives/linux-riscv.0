Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12306C48260
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Feb 2024 00:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2QmU7sIWUgC7wcwdxEOMNMgVFP8qs9Ws/kZwkKe+4VE=; b=hC199+UYMJRVCe
	UQH/cKZUX4OwbUDVLKd3j1U058yvG4LuMF4tngdGStUFXUPSzFgeoKa7hxNM8dlh5R0ZmuFdigQRw
	mVmzQ9SDoZJ09OrjO831AHfqw6Qsq0uDErAt7OFDbKtnN8WyOmH0DhQgpBz1iUAJ9DnldbdkAoUq6
	MEEwBD6vpQCR49quZhl7ScD2qVgJkeVqmbHDoM2+nNEVpeG+aU5R8QI54LAGcKGGUdgQ8qWExCFJU
	FZOX/85S1csEjkcuM6KVbsyTLpH64yJxIuNrBgSwxB34VdXywu57xJT2Fnwx0+R5pMhXlwQUIz7W1
	ku1HUP+k1mlE5BAhjWqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb92R-00000004IGG-0bNy;
	Sat, 17 Feb 2024 00:58:43 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb92E-00000004I3U-3YoP
	for linux-riscv@lists.infradead.org;
	Sat, 17 Feb 2024 00:58:34 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3c0a36077a5so1519009b6e.0
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 16:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708131509; x=1708736309; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a2xIx7YE6DTpyA9iQ0shuXDu9l/GTuR0ZUSu2bmZ4Gw=;
        b=Zx7hGco7HJyT9EbOsOL+Of8TzGgVeqNCqNwcjJhceGPPyXPEN5qWVpQ/r1c+ysUMl0
         BrhVe2knlyBPwYfOO1+CXKERn0C/uxWiAZcG+SP516PzkZr0qPDk0QqqWQmJ2OYVSgND
         vFKcc3aUyKOCC3u2oiPKhfj0lXJhZGPu73H3rUDWdX0BLyIaWWeJhBvBPrb2WmaUXfkq
         e6VzYr9dqJKcW7OjKDGxgb95KqpKb8Tdhnm+4+hRfdg1PNFfmAYkRQbZuUjwFEMWa8ei
         SjXrpz4CYNUr6j0XWwHJaelm8t5CG447kPDPxSS6ebfu/DRfWpzVFD/X3yrdCkSPLOeA
         VUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708131509; x=1708736309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a2xIx7YE6DTpyA9iQ0shuXDu9l/GTuR0ZUSu2bmZ4Gw=;
        b=JLglF3huaUCLWZ+6R0l7qd3OmXrKpvbRS0KPC9Zu6UKadZB0q8WDJnRHkqiQ1urNdV
         9g4YeK5X17Ks1adinxuu6dk/WT2B6NOmemfzg0/o9gzj4jLz4xoim4ZCVaHdp0r4jdp6
         zgRY6MSefCKceLh7pDCK2NUgR2ux8dN8QiT6btWP7/k9Xn7qs6VFepL2+Ysn/rAal20u
         wOgSFzAqR9CGwo+BiTOhs5m/51pxaFX9YheKb3ni7rNFGTeLRL7YoUjEPvCDKY99X4b0
         T1nRq98yIEpY9ePYud7cRQKyhHGeaOBn9vCzLbbd5mAbTtAm64+kEXD6wmPU1B/uzbyP
         t1Qw==
X-Forwarded-Encrypted: i=1; AJvYcCUDA/LvovM61o2O/e4gCspFd2aYncCajk/72ue/XZy+eWkeNG954dydH6TRvSFsJlXnQZZGgx1XmwTv+cKpYT/x/3wnFccpvnNk6nrVXUyY
X-Gm-Message-State: AOJu0YybsFG5CxXpXUk5U+bNBQQHkaIjLRlNQYH6pfl44XOJY9VTCDju
	u7/S6x5a2yapc1b/EtWocArt/FT9pCtSwNSGPoonkKk5qW/hwmG1N26mLjCCaFU=
X-Google-Smtp-Source: AGHT+IFGR2TLppjaVLhGvXb9veJUkvHq4g2Z43QZBpJsKyF4ul3TY6Njmk1X1f97l7rCNISjLsOStA==
X-Received: by 2002:a05:6808:2392:b0:3c0:4357:1d20 with SMTP id bp18-20020a056808239200b003c043571d20mr7982453oib.47.1708131509393;
        Fri, 16 Feb 2024 16:58:29 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d188-20020a6336c5000000b005dc89957e06sm487655pga.71.2024.02.16.16.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:58:29 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Atish Patra <atishp@atishpatra.org>,
	Christian Brauner <brauner@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor@kernel.org>,
	devicetree@vger.kernel.org,
	Evan Green <evan@rivosinc.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Ian Rogers <irogers@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	James Clark <james.clark@arm.com>,
	Jing Zhang <renyu.zj@linux.alibaba.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ji Sheng Teoh <jisheng.teoh@starfivetech.com>,
	John Garry <john.g.garry@oracle.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Kan Liang <kan.liang@linux.intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	linux-doc@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Rob Herring <robh+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Weilin Wang <weilin.wang@intel.com>,
	Will Deacon <will@kernel.org>,
	kaiwenxue1@gmail.com,
	Yang Jihong <yangjihong1@huawei.com>
Subject: [PATCH RFC 06/20] RISC-V: Add Sscfg extension CSR definition
Date: Fri, 16 Feb 2024 16:57:24 -0800
Message-Id: <20240217005738.3744121-7-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240217005738.3744121-1-atishp@rivosinc.com>
References: <20240217005738.3744121-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_165831_084485_27BF9253 
X-CRM114-Status: GOOD (  10.75  )
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
index 0a54856fd807..e1bf1466f32e 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -214,6 +214,31 @@
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
 
 /* symbolic CSR names: */
 #define CSR_CYCLE		0xc00
@@ -289,6 +314,7 @@
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
