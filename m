Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D41EC0218D
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jan 2025 05:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AXrgis3YcPmVANcO8tyrFggDKSo975Wd34cKZcYKKvQ=; b=rRcotF6t61MlqE
	umy3VHQbFoR5FEPPNw8Cogoc7pVxsKDGoxBip4n22dBaqqQrPkoifMJiv0WHNsJw8++cbIUXKDjNt
	vjPlWYAdNbZCbqQxtykB6RmJTUVGWQTlISiFqHhYzCXD45wK3Dsfev1DnBqgPy0gX6yRRVpUwdwqK
	C0/mXwso0GmMgp6kbJmNMrya0Aj3gk4+OsuTob280K8ch3nJVVHHW79COeCx8YYGgGwjesowhV3Ct
	P772G8CJm9Gg1mBCckSU0/hmxEK5W+2fedBjiU6bBAM6oAekyngtHmCnkBfZll1N6lECw/+p8I0K2
	O/ngnXAYKsGZgZ8fplKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcdtD-000000047eW-3xwO;
	Tue, 28 Jan 2025 05:11:55 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcdhk-000000044WA-1jyU
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jan 2025 05:00:05 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2f43da61ba9so6861947a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jan 2025 21:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738040404; x=1738645204; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nWIGDLFCubHBSCVyRujLDRmHtXnqwdBi6tbEZKWPh8g=;
        b=bffQlaJDk1dcCkky3p9Afw8aOodZXFijADd5ZuBDdhOHghtkouvn1uBbo1LiyBcqnx
         choCgyOw+oTdji/L1JDECH1VFQi4BqCQcspCn9ilHFhJEq9fffrxgcoW6+cfxhD5MpVC
         Jd616mNzzwqbYtEMSKmIdIxbFCwtY3nzuyyxOmF/HkXus9kn1UFCRLhsxtyFD3QGnoeK
         +VsTWNVmd1GykwPICNwnZq1iPasBuAl4I/veKwKpoCOApCf20xvmfTStxpldq7oxlC8l
         P5Jj9mG+Cv3DTP9uQtwsRG3pjE2gcBh6BjTSVnWUq0N4hUO5Wk6i2YX1SyH8X1saLGmg
         OUwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738040404; x=1738645204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nWIGDLFCubHBSCVyRujLDRmHtXnqwdBi6tbEZKWPh8g=;
        b=BXO4JPVwgnWZGwYfaKz/8uWEBu0q7KaaH2TGZhndEFnSCBK31BNAgrB0ZpLm4Lm0NJ
         pyyooc4NLl3R9K9jVOkN0H+9AxG+U23HNy3NYUnBkB0f9k1nwjnh4QmAFFAmxFAEat8c
         bHQMswv08gB1c+gFYjbujTkpJ040KNfB/0D2GF8DmcYMhHRo354XRpRlMiP6FLgdO9iL
         RRVB/ES3JZnhC6JdDm3s0dOfARLwKCOhLnvecu3CcJn9eFaTapqrFfFJ9Rt4cfTzC2Jf
         JkmrB0PDkjygxaTNjp5wlZG8Zf60JOosngWC1iTv1eHKckDQpiCosP+eTKC5rzbcY3Mm
         NNsw==
X-Gm-Message-State: AOJu0Yxq0cBDr6l0DUK4Hnd/fHHPEKlaVdXsJMOolCHXeap2c/2rEKHJ
	Fy8ycli6tGx6NtOTv0SCEENYTbrIx4Peoo0iIIKdksHmharfqpQ1Qe9+a1Naemg=
X-Gm-Gg: ASbGncuEqOeSCvcagQcCDlDujaMrZ9UCtJW3ND4oNqgVSZjgMlEhiVzCZ5HIDCYOpDC
	ykwN57cGZLt+7RfAkMAG/b+AhIN3KCutNn5qni/B5uIhof9DRuINIiawABam9+bzH775aqp3al5
	eZ67CVw+lzD4Adu/rJp3iDcdqgs+FS4PgK3VzMHTQiRS492ASmyCsmps7t3ctF4giyXUrM3PTpu
	51NT3UwNh81jO4C3tX0cxY236T+vCQZDrEYC7DM6GWsZWZ8Np8KNaIJhf7H7XTtR+cQUu/GB2SU
	ejHZwUjFk6s7b/+/Cc+NnkbFr+pY
X-Google-Smtp-Source: AGHT+IF6z2gLBaxXEkT5T0gtB5dB8hKkZBHYBvrUyOYQ2AWcmEN76E95Mjw0gLw3wzxwSkAZ6LwcMQ==
X-Received: by 2002:a17:90b:2c85:b0:2ee:c9d8:d01a with SMTP id 98e67ed59e1d1-2f782c92ce0mr63874654a91.11.1738040403855;
        Mon, 27 Jan 2025 21:00:03 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa5a7f7sm8212776a91.11.2025.01.27.21.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 21:00:03 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 27 Jan 2025 20:59:50 -0800
Subject: [PATCH v3 09/21] RISC-V: Add Smcntrpmf extension parsing
MIME-Version: 1.0
Message-Id: <20250127-counter_delegation-v3-9-64894d7e16d5@rivosinc.com>
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
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_210004_458331_875ADA90 
X-CRM114-Status: GOOD (  11.55  )
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
index 2f5ef1dee7ac..42b34e2f80e8 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -104,6 +104,7 @@
 #define RISCV_ISA_EXT_SMCSRIND		95
 #define RISCV_ISA_EXT_SSCCFG            96
 #define RISCV_ISA_EXT_SMCDELEG          97
+#define RISCV_ISA_EXT_SMCNTRPMF         98
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index b584aa2d5bc3..ec068c9130e5 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -394,6 +394,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(smmpm, RISCV_ISA_EXT_SMMPM),
 	__RISCV_ISA_EXT_SUPERSET(smnpm, RISCV_ISA_EXT_SMNPM, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
+	__RISCV_ISA_EXT_DATA(smcntrpmf, RISCV_ISA_EXT_SMCNTRPMF),
 	__RISCV_ISA_EXT_DATA(smcsrind, RISCV_ISA_EXT_SMCSRIND),
 	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
 	__RISCV_ISA_EXT_DATA(sscsrind, RISCV_ISA_EXT_SSCSRIND),

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
