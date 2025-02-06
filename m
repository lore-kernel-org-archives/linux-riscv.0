Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76993C0219B
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 07:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+4BWsVQNiB35+JhqIjjs2TnXwmRHTjT75W3+2MiKbCI=; b=adfWVhSAv+/6B7
	ai/fwRfx0JD2n+BTdVmWuyp3lbjiXW/Ngc0UcyI/MNjcpQI1NNJTIOTsCX4d85TYxya31hQcSTfV4
	ip8oRB5pkOs53R4AyPDjm6hbGaAAd8FSicAMA+GYouQq5QHqG5/ICqJNt402gzSXLyaS2XtOoM1q0
	RNHv/W6sbVKuiw4fsITjgQRihREC8Iwa61YrSagHDueBd6uLv96ZLJbV8+gNMqbs7wFk5LQNybblr
	533qxhuqAzzRuWgKDZeLl2KyjrS6jVULTwWxNP72boYBQr/FBI9Rbj9kOWKhveob7N9D+RWDx7CVs
	ClOmELWCqrlTF0Rhopkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwL5-00000005aT9-0jiE;
	Thu, 06 Feb 2025 07:30:19 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwEP-00000005Y0S-40nQ
	for linux-riscv@lists.infradead.org;
	Thu, 06 Feb 2025 07:23:27 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-21f3c119fe6so3452765ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 05 Feb 2025 23:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738826605; x=1739431405; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5jEaYEVzjt3yKFEUjA3mSdxHjzs+ekk92pc880MhBaw=;
        b=aYwR7zKrgKnDm91al2EfnhvrOlsOJFd7Pr+usjUIFS7D4sz8js2aiCTyp2mkkQcfJF
         Kb30e58qc/9/u66Ni9fmXVDTJQs2fmtTO91rvJ5WxwavrmMK5Qe/Xhr7pGObblYkHQWU
         y8sHwJtMMyCDz4iqwMifwQ38bgx42JUOSmfQic/QtVHh41vu7jcpFd4xYDL/sTJ/gkXl
         kTWUA5Gh5q4y3NcPIPsrXm3LHCZK199QFVeCgA+/OEyFFEeb4PwHLF2yiloQmrqYfPCe
         fg1qn2kivbhY+oB9+xeTMtT9JKK4llItZ3VSUOEPXFFbdW/qbZGebDrOA8nHsZ6n9SWX
         tAtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738826605; x=1739431405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5jEaYEVzjt3yKFEUjA3mSdxHjzs+ekk92pc880MhBaw=;
        b=VJsRtMpkcbDkSNcvFt+rq15DUN/cy1WhYUJgOdHcYLoVtWPS5vzooAE+WRa4CuUWKF
         cCebpiBRNdEs+lyWnpguj+jgZRgXIt4vJuydcVzMTifEaYh8zHuuko8wBYEKBlNXF1tx
         qziqx4A8lThjl57EUbWWhuDOFNjaF6Zt5ni1rUpnD3CHYHXppHN+VehyWf25DdRLDhYh
         Zx67g8/itTUIjXk5Fb3dJXZokEP5pfuyNyDW1mw5zPO/hiHt0Ca2EeQ/JdTp4LEhMbpv
         PSUNij1OfYBbba+71IcATJ0PhPXPbe0sVqEkTl5z4bgCppiaGBMqFh1DJcPAmif4o4yz
         95zA==
X-Gm-Message-State: AOJu0YweHBXmND/QL5U3kamBKjLfGH/587n6ic9iCukeAWDIc279c1Dq
	UhM0UBevE6TOvFNOqR4WPq40ntX2Le0+fZh6e6lmNzkF0pWNmjuaHtG9bfgxKIo=
X-Gm-Gg: ASbGncvBh3CT1UduVQ4ciPY8fZsyAIN/ua8ZhayM7YtKxG8Rz7w/wFbStm4fIAICh6B
	x/k84CwMJlSZ7MPifdHSdwCddQSTdf1nnu7Q14b2pe/JOC/M/PRVFDCxOvg8SISR+be8qCdm7Gk
	iaMrchJ/YoU96wBt2tNLKTxhMBBhLyKH0uCu9uPl+Af6myy8ePdK5cdbFagk108Mubyk1RqavZZ
	31FFe7XZZ3orYh0aQ8jn9WTKgykDAcuSdDLpjmCYTgfiLZw3IwGoB85ARS7AzM2vsmo70iJhpua
	KMqhRthEdTD8Hzj/t/IIremFlUDC
X-Google-Smtp-Source: AGHT+IHzp0J+mwXj/o4qdyn5Yi/oH9R23yiqLBnusAGlaJls5faLTlCjx6NHAGuTvmvHDO4dBQO+Rg==
X-Received: by 2002:a17:903:2f92:b0:215:b190:de6 with SMTP id d9443c01a7336-21f17e2c950mr98353905ad.3.1738826605265;
        Wed, 05 Feb 2025 23:23:25 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09a72292sm630883a91.27.2025.02.05.23.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 23:23:25 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 05 Feb 2025 23:23:11 -0800
Subject: [PATCH v4 06/21] RISC-V: Add Smcntrpmf extension parsing
MIME-Version: 1.0
Message-Id: <20250205-counter_delegation-v4-6-835cfa88e3b1@rivosinc.com>
References: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
In-Reply-To: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
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
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_232326_002859_B2E28A2C 
X-CRM114-Status: GOOD (  11.26  )
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

Smcntrpmf extension allows M-mode to enable privilege mode filtering
for cycle/instret counters. However, the cyclecfg/instretcfg CSRs are
only available only in Ssccfg only Smcntrpmf is present.

That's why, kernel needs to detect presence of Smcntrpmf extension and
enable privilege mode filtering for cycle/instret counters.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 3d6e706fc5b2..b4eddcb57842 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -102,6 +102,7 @@
 #define RISCV_ISA_EXT_SVADU		93
 #define RISCV_ISA_EXT_SSCSRIND		94
 #define RISCV_ISA_EXT_SMCSRIND		95
+#define RISCV_ISA_EXT_SMCNTRPMF         96
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index c6da81aa48aa..8f225c9c3055 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -390,6 +390,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_BUNDLE(zvksg, riscv_zvksg_bundled_exts),
 	__RISCV_ISA_EXT_DATA(zvkt, RISCV_ISA_EXT_ZVKT),
 	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
+	__RISCV_ISA_EXT_DATA(smcntrpmf, RISCV_ISA_EXT_SMCNTRPMF),
 	__RISCV_ISA_EXT_DATA(smcsrind, RISCV_ISA_EXT_SMCSRIND),
 	__RISCV_ISA_EXT_DATA(smmpm, RISCV_ISA_EXT_SMMPM),
 	__RISCV_ISA_EXT_SUPERSET(smnpm, RISCV_ISA_EXT_SMNPM, riscv_xlinuxenvcfg_exts),

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
