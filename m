Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122C0C48BF5
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Feb 2024 00:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3MhqTlEqHwr7Ig/1xEQC3A8p23AfeF0bSq02P1U3nW4=; b=u3j91tjaLl2MDc
	o+0is0X9Gp91U/VtMoh9Afh/zxMZ54/OeRH6lZv5gzALrf0bM0EmDweTG3mNF3gc9Pt0orPVXXCYt
	QIGsc0gB0a1hJhm0wfVm/mEQwiEy6bGVz0mmutwW8f7r5exy91Fzuukn4esPvs/n8+et7KRay6YmZ
	3+Y3el/btxn+ggenZu7ptJyJOb1P6nSGJPv1L3C8hS2VA5ogV9svAxLiz5XwY9vuh0pCIRFgXyoGJ
	bNTVY8RvxMH378FSgWiMYPNnieuR/tY7RM0vmzh2qt3kJu2k1ujPIFhUcjXK3Bllq3HwtdCHD8yWW
	FyvJBsSIEo7QSiTxOuMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb93P-00000004J89-2EM3;
	Sat, 17 Feb 2024 00:59:43 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb92n-00000004IYG-03Jh
	for linux-riscv@lists.infradead.org;
	Sat, 17 Feb 2024 00:59:17 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-21e3c16880fso1312128fac.2
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 16:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708131544; x=1708736344; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5vDBckQYWb4Du0H7yzxJq6wilfl8k4fp2vqlUJD6o0E=;
        b=ewmB9M0wcrETYjIrCIsn85VMEI1Eoxj8AOoLb4iaGTCdfAJPqmZrqX5z/AUrbCtsWi
         LyglXhuKKDFepAaDB94l1NtIsvSQTQ6/g8b+6x31O9rS1DMMG3sDQv+1XN3ECUK7+6Ug
         RXrq/IDvpnd4tWOSWj++PUmV75/vsnUKd+8g2emdijgTrmkyKL3O2M9Gup7+EAGPtLz0
         TNg9u9VINFK/E+gU1ncc06DyOSNLjObyQX1O1uratPVO34HNS8e97EpQaLPbREtEOSKy
         vrOZFGWKMDNfmUO4lWEm6Cqbkn9gAI+c7i2x1v92UeVtdWnq1n8Voc/grCAGmEpcjwlC
         HyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708131544; x=1708736344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5vDBckQYWb4Du0H7yzxJq6wilfl8k4fp2vqlUJD6o0E=;
        b=k9QN2AhyGW89aq+lv65JKyGCTfnJYjoupTVJo3eiWSq7KgVfCSm5+kLEmMB77as67H
         EkL8ZcT0k0sdo+hAP7uhbX30X0x6r2vbvKFCfcjCjWGHD1bmc1g0uu4wmjT9yvpdKWXk
         ikClVuDAyS9CtZyQLA6dXow8BMYvI5YQBwzOnoY8Zv1r1R0iJxG86I3Jj4/GJee1Vc52
         N0kXj6rh1sz7vW37YCmc7nXZQ7HGx+1K/7vvmPaZQgwTqSMxKbAIjdKD4VwRAiMLwCEm
         ngMq7F8NyT8WtvN/nnDJY9VJ3GizzZqFpv437ow4R1F594nEJr0ijlF+XHpJIc5roFqB
         6NPw==
X-Forwarded-Encrypted: i=1; AJvYcCVMDqBCdt85SPuhqU7n6yLx1pSaQ6PUQMZI15xNP2Q0IFLKPcxBwk8NB5fVQcf7TyEgmO/y2G1QyybEsT1LWMg4Kke1E4ncN7RogFaIsviX
X-Gm-Message-State: AOJu0Yw0uhAk3CWE5YeWkA8DFWzgrbP8pI6CxRIOnMhktvgris7p2tEq
	u3Zixe6T/H+pAx38aIcaiQCsXiqemb8QMfXfpwtFcljHP0RK6vI4BONDUM4z7qM=
X-Google-Smtp-Source: AGHT+IHqkQqjQYTImWOgjE8Z+USH8QzipcCkOvNcsVcXAj1JgydRRCEivR2TUgJmzC2SDHg1vvWlZA==
X-Received: by 2002:a05:6870:478a:b0:21e:698f:5c91 with SMTP id c10-20020a056870478a00b0021e698f5c91mr3327913oaq.41.1708131544105;
        Fri, 16 Feb 2024 16:59:04 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d188-20020a6336c5000000b005dc89957e06sm487655pga.71.2024.02.16.16.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:59:03 -0800 (PST)
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
Subject: [PATCH RFC 19/20] RISC-V: Add hwprobe support for Counter delegation extensions
Date: Fri, 16 Feb 2024 16:57:37 -0800
Message-Id: <20240217005738.3744121-20-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240217005738.3744121-1-atishp@rivosinc.com>
References: <20240217005738.3744121-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_165905_395696_A07FB58E 
X-CRM114-Status: GOOD (  13.68  )
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

Even though the counter delegation extensions are all S-mode extension,
perf tool can use it decide whether it wants to map standard events
or not. Remapping is not required for if SBI PMU is being used
for hardware events.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 10 ++++++++++
 arch/riscv/include/uapi/asm/hwprobe.h |  4 ++++
 arch/riscv/kernel/sys_hwprobe.c       |  3 +++
 3 files changed, 17 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index b2bcc9eed9aa..77fa0ed09366 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -188,6 +188,16 @@ The following keys are defined:
        manual starting from commit 95cf1f9 ("Add changes requested by Ved
        during signoff")
 
+  * :c:macro:`RISCV_HWPROBE_EXT_SMCDELEG`: The Smcdeleg extension is supported as
+       defined in the RISC-V Counter Delegation extension manual starting from
+       commit ff61c1f ("switch to v1.0.0 and frozen")
+  * :c:macro:`RISCV_HWPROBE_EXT_SSCCFG`: The Ssccfg extension is supported as
+       defined in the RISC-V Counter Delegation extension manual starting from
+       commit ff61c1f ("switch to v1.0.0 and frozen")
+  * :c:macro:`RISCV_HWPROBE_EXT_SSCSRIND`: The Sscsrind extension is supported as
+       defined in the RISC-V Indirect CSR extension manual starting from
+       commit a28625c ("mark spec as frozen")
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
   information about the selected set of processors.
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 9f2a8e3ff204..fb7c6bd6822a 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -59,6 +59,10 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZTSO		(1ULL << 33)
 #define		RISCV_HWPROBE_EXT_ZACAS		(1ULL << 34)
 #define		RISCV_HWPROBE_EXT_ZICOND	(1ULL << 35)
+#define		RISCV_HWPROBE_EXT_SSCSRIND	(1ULL << 36)
+#define		RISCV_HWPROBE_EXT_SMCDELEG	(1ULL << 37)
+#define		RISCV_HWPROBE_EXT_SSCCFG	(1ULL << 38)
+
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index a7c56b41efd2..befb6582b1ce 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -111,6 +111,9 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZTSO);
 		EXT_KEY(ZACAS);
 		EXT_KEY(ZICOND);
+		EXT_KEY(SSCSRIND);
+		EXT_KEY(SMCDELEG);
+		EXT_KEY(SSCCFG);
 
 		if (has_vector()) {
 			EXT_KEY(ZVBB);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
