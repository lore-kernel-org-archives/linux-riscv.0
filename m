Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D1B9C48BF8
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Feb 2024 02:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+1nhtA8+SCejgMJDqIwLxkMt4ET2IwKwl0ebup2ik2M=; b=OrWcuf+uQQRq3K
	Zj4l5t7UGGQA14ZlMzK+BAOGxKfTL+gnONtR0vtFgS9HbaxAad2KVkxo5armOgRqnI0xK0X42R/Ct
	0q+ENjK2oHfZMErGX8A7ScYvf8km27hkh6xzx584ccphMbXO95GYqVU3PS8t/CTnP5foSJelnQ2IM
	/qjEXDxBRahLoxJTtdpY2HCAxKxtGuBd/VIJWSCDFW7U0SNFq7+T7oBD+mlMpCo/fOI1Tvnjo01fE
	L8MMUYsE4Ksdf5hwbMHgTLGiW1TojxQhmMn2ohhzIryXyegFJ4QDp09ErynzMQ4iyn1FEwJzmZ8s3
	OVgGz7TrVhrz5Ks1gMDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbA3Q-00000004S9B-1jAa;
	Sat, 17 Feb 2024 02:03:48 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb92C-00000004I0M-0J29
	for linux-riscv@lists.infradead.org;
	Sat, 17 Feb 2024 00:58:31 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3642281e4a6so4021815ab.2
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 16:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708131507; x=1708736307; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tZxqoC10roX3FmWShwLO5FF28+Cew6bJztG9VlJd1gc=;
        b=u/zSz6bJHk27jnF5mQpkUrvxyM6QTwmz/5hmQASitAd1FAiuIvTYPLoT1Uv2zHxWsE
         EGcNZX2vWtofuxCViOWvKoGv4Zd6VCjfmm7wHayAw8Y8xLakluFp/tiXyGQNfWLipBf4
         vfV/a5SuC86CxcmHoiPJmu0Egej7vxwwDUuW2aYHBHgrYVJXa1lU3I4JuwvLCH6Zi5Hi
         ZLE8J+YqgwOCXdLk9WagCUHN3yonSa9oFRj3oGQmRpguXN1ZDOeMKWfT8Vwumc4e4v6w
         x4vBM0SHEHiztxnG6+OwdeE01vNsDj65GFyAP7pZVmju0xE0KIbLgQzNmOgVeNHhfRaY
         hMcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708131507; x=1708736307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tZxqoC10roX3FmWShwLO5FF28+Cew6bJztG9VlJd1gc=;
        b=ww3IT+Tg3EZNKB8UPhP7gCJVV2907ywNWYer9TwJraLlEy03DgLsRThR4LeX8kprEu
         te6PSPQkOSlcTrCeXUBmmpq4jYkQfW9rScYocZRttPWmIvSjWsITxnU49m7v4pnEV26m
         CPthbpxyrrboUAUm0RiACsQPRcvVKrunAwJvlTOPqJ2cQUaZ7jvcXC7BHggW6lFC7saA
         vQWYWqdvHn4E34hOB/fcS7/QipreWwV/Lmw/UiO+0QY6k4CKR+rteilqXDVqZerFXuiY
         a9bMc8gsEoINot0fPWSYM/UnKuWikCNIvbGMtor84sCIapaKMZSI/wbwfRHK/HMvQ7C1
         m5IA==
X-Forwarded-Encrypted: i=1; AJvYcCVTpi7Hq18rcPFGWpjtisLYtLt61eVFM+zJBjci4LRurJsNVjRJQF/3rnsrkm673TmETIGrkL43U47Tw7ItYaudqKROT9Zb7XygdDErx7nL
X-Gm-Message-State: AOJu0YxQv0ZA9EOTbzjNK7kJxoLJHHYyNno2mnieXub7VcanGhy6o0KF
	SAqmlyoTnZHH0hiJUCX7QfX5PwrcTFvdkfZjvvKS6G+o7bfu47P+WGl53oaFHho=
X-Google-Smtp-Source: AGHT+IEz0+A9x0GTcr1tO8p0VDE5KRpFc1BbSQ5HWLqCdx+AJgXr1jki3q4ZnbUMgc8MM5i0wwekUQ==
X-Received: by 2002:a92:c54d:0:b0:365:1563:c4e5 with SMTP id a13-20020a92c54d000000b003651563c4e5mr2552537ilj.9.1708131506838;
        Fri, 16 Feb 2024 16:58:26 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d188-20020a6336c5000000b005dc89957e06sm487655pga.71.2024.02.16.16.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:58:26 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
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
Subject: [PATCH RFC 05/20] RISC-V: Define indirect CSR access helpers
Date: Fri, 16 Feb 2024 16:57:23 -0800
Message-Id: <20240217005738.3744121-6-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240217005738.3744121-1-atishp@rivosinc.com>
References: <20240217005738.3744121-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_165828_283593_ADAF24C8 
X-CRM114-Status: GOOD (  13.06  )
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
 arch/riscv/include/asm/csr_ind.h | 42 ++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 arch/riscv/include/asm/csr_ind.h

diff --git a/arch/riscv/include/asm/csr_ind.h b/arch/riscv/include/asm/csr_ind.h
new file mode 100644
index 000000000000..9611c221eb6f
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
+	csr_write(iregcsr, value);				\
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
