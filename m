Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F28C0219C
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 16:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WAnycvpwe7N2wAiGHeXhBXocRMSYTvcjyPSu6NS/PoM=; b=jPN/7gbPS9/+Zf
	jWwCNZjWg6Ty3pzIdr6k4P9yMtPwdlPbJsDcF7sox7cY8YwHaRntl/ifGBGv0ARSIlnJxC5D16L8X
	oDVOte1MSiloHkMn6nyipVA6HrxE3fbHgcG0fofQWJQdDgergus89KPXwCzSQIATe5TAcKxP7SPQB
	w0gFqREW4JMLWmpPA617Ef+S5vr6dDBI4ts5H/zqrqUAL01dPghTnuADa2U1oO2xHLiDIiVPJVNz3
	zjyNcO3pwZiv2y015LM95CiWP3E+nvr6dmbbKEUqNZk6a+8f4IFV/jdxroU8ydmtJe7XgacXmDrhM
	WbTTmrdDJRY2nQ9FZvXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgR53-0000000AFB4-1yn1;
	Fri, 07 Feb 2025 16:19:49 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgR51-0000000AFA1-0lR0
	for linux-riscv@lists.infradead.org;
	Fri, 07 Feb 2025 16:19:48 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-38dc5b8ed86so762251f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 07 Feb 2025 08:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738945186; x=1739549986; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IuJMR1N/b1qpsKDKcoeIqZx9TZLHFvG76FujKxOxlNs=;
        b=fEJvZk0XhgRCg7TyHHCbQXTx7vEitnCcXqwSLsVS9XG4kvnpAQI4td3oKCby49odZc
         Vr79eHSBR+ovnnRNN3qiUpvkPLNepOErtpGMoQDz+e7FDqnU/aTTs9O0X2rxMy0UCFsi
         AfgUfhJOTadxHtdtsKckh7KX3dUhZk+Yi9reTjv35y8rdSa9l7+092iaQmSlCbd5juga
         TpKBSp+aEwp+PUCduGpghiyAJP5yMDLXfG3HLdjckW3IfuQOmy1IskgH/XxAhHYL6Q0Z
         M3YDEAwGCySPWl9TA+Grw+MDEOco0Sou+cTD9OLL4KgzxQ7Eec8U5jv8qoyLYIQyvNKW
         yZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738945186; x=1739549986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IuJMR1N/b1qpsKDKcoeIqZx9TZLHFvG76FujKxOxlNs=;
        b=VRaVEBNS7ak4b2fL5/lNFzThhFiXGuDlBCYPlNofMcLPbjhzEvGoR9nE9uxml1EVJB
         6ZvAWpf8Ns0ADr+wr1MT6R/ZCTomyXBinE7afqtU709yahjY9t3FgaqDNw0Jd+iDdT0S
         DXZJ5lajJcGVZk7i2ZY39M3ATgvoN2tdRFZddYPhAabxpMv2PyejHZ0KvgiEJ0LPPH3i
         VKt5d2KcFXI20i7Zy7lCgmEyBZ/qwlDrucrxYP8BZT8WxELXz4o05RLuTqSP84Q1ccJp
         f6dG6Bud9hK3u/wKY57PXKmOV1wcgC7XfDSUMTpo+7mFxIDSaDLTsbm4WHL57C42A/pZ
         PhSg==
X-Gm-Message-State: AOJu0YylnaLPlstrCEXSYy/oqughzKXmKxA7yqoeb8+tevX74aE+ElFt
	VbXk7Yr4iH2PQA7yEcMUEt+mIoH/da3nBSUW6whsXZZDyjp3Fjyqvp1DF/97COWmVSjGFFY2uNr
	S7S4=
X-Gm-Gg: ASbGnctfgb7ViWmlqv09PzLfEpu8hJOpMfuup7+K/TDiFGBZemPza2b6G0GyfEuKyMk
	jsOP3BALp2qNUNid0B4IncNHaofb5hYRutGd7MtsKcoDbc3PFCeyiPyLAwl23E47ASRl3CYr1iW
	TFf5To6eotQDaFu0Am3cYAtqKVc76lE3b1VPFe/ylWNfZmPc/njqCC1yMR2rFKc/PhMq1ZL+hKh
	K7FlvtR247U2rR7OoDBp4c9VbBateP5c3rM4Cxxegf8cp+bO07BeGbJVoFeTo6L43oWjCCiW1J4
	6PBaXZq4qjk0YqL2l5DsSvCtht1P73ceSTSTn2rToXXR/Uw43vgCNd7yTQ==
X-Google-Smtp-Source: AGHT+IF2QBiK/6fJgHT5gF+3avImUBiADzRKV6TlV+pcR6wlIV7GNBKNVzGepoKdRql8iUw7eoyotg==
X-Received: by 2002:a05:6000:1787:b0:38d:a876:845a with SMTP id ffacd0b85a97d-38dc959fab9mr2553003f8f.47.1738945185782;
        Fri, 07 Feb 2025 08:19:45 -0800 (PST)
Received: from localhost (089144193052.atnat0002.highway.a1.net. [89.144.193.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc6c80df2sm3037899f8f.18.2025.02.07.08.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 08:19:45 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	charlie@rivosinc.com,
	jesse@rivosinc.com,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 1/9] riscv: Annotate unaligned access init functions
Date: Fri,  7 Feb 2025 17:19:41 +0100
Message-ID: <20250207161939.46139-12-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207161939.46139-11-ajones@ventanamicro.com>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_081947_239043_B144A112 
X-CRM114-Status: GOOD (  10.07  )
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

Several functions used in unaligned access probing are only run at
init time. Annotate them appropriately.

Fixes: f413aae96cda ("riscv: Set unaligned access speed at compile time")
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/cpufeature.h        |  4 ++--
 arch/riscv/kernel/traps_misaligned.c       |  8 ++++----
 arch/riscv/kernel/unaligned_access_speed.c | 14 +++++++-------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 569140d6e639..19defdc2002d 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -63,7 +63,7 @@ void __init riscv_user_isa_enable(void);
 #define __RISCV_ISA_EXT_SUPERSET_VALIDATE(_name, _id, _sub_exts, _validate) \
 	_RISCV_ISA_EXT_DATA(_name, _id, _sub_exts, ARRAY_SIZE(_sub_exts), _validate)
 
-bool check_unaligned_access_emulated_all_cpus(void);
+bool __init check_unaligned_access_emulated_all_cpus(void);
 #if defined(CONFIG_RISCV_SCALAR_MISALIGNED)
 void check_unaligned_access_emulated(struct work_struct *work __always_unused);
 void unaligned_emulation_finish(void);
@@ -76,7 +76,7 @@ static inline bool unaligned_ctl_available(void)
 }
 #endif
 
-bool check_vector_unaligned_access_emulated_all_cpus(void);
+bool __init check_vector_unaligned_access_emulated_all_cpus(void);
 #if defined(CONFIG_RISCV_VECTOR_MISALIGNED)
 void check_vector_unaligned_access_emulated(struct work_struct *work __always_unused);
 DECLARE_PER_CPU(long, vector_misaligned_access);
diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 7cc108aed74e..aacbd9d7196e 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -605,7 +605,7 @@ void check_vector_unaligned_access_emulated(struct work_struct *work __always_un
 	kernel_vector_end();
 }
 
-bool check_vector_unaligned_access_emulated_all_cpus(void)
+bool __init check_vector_unaligned_access_emulated_all_cpus(void)
 {
 	int cpu;
 
@@ -625,7 +625,7 @@ bool check_vector_unaligned_access_emulated_all_cpus(void)
 	return true;
 }
 #else
-bool check_vector_unaligned_access_emulated_all_cpus(void)
+bool __init check_vector_unaligned_access_emulated_all_cpus(void)
 {
 	return false;
 }
@@ -659,7 +659,7 @@ void check_unaligned_access_emulated(struct work_struct *work __always_unused)
 	}
 }
 
-bool check_unaligned_access_emulated_all_cpus(void)
+bool __init check_unaligned_access_emulated_all_cpus(void)
 {
 	int cpu;
 
@@ -684,7 +684,7 @@ bool unaligned_ctl_available(void)
 	return unaligned_ctl;
 }
 #else
-bool check_unaligned_access_emulated_all_cpus(void)
+bool __init check_unaligned_access_emulated_all_cpus(void)
 {
 	return false;
 }
diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index 91f189cf1611..b7a8ff7ba6df 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -121,7 +121,7 @@ static int check_unaligned_access(void *param)
 	return 0;
 }
 
-static void check_unaligned_access_nonboot_cpu(void *param)
+static void __init check_unaligned_access_nonboot_cpu(void *param)
 {
 	unsigned int cpu = smp_processor_id();
 	struct page **pages = param;
@@ -175,7 +175,7 @@ static void set_unaligned_access_static_branches(void)
 	modify_unaligned_access_branches(&fast_and_online, num_online_cpus());
 }
 
-static int lock_and_set_unaligned_access_static_branch(void)
+static int __init lock_and_set_unaligned_access_static_branch(void)
 {
 	cpus_read_lock();
 	set_unaligned_access_static_branches();
@@ -218,7 +218,7 @@ static int riscv_offline_cpu(unsigned int cpu)
 }
 
 /* Measure unaligned access speed on all CPUs present at boot in parallel. */
-static int check_unaligned_access_speed_all_cpus(void)
+static int __init check_unaligned_access_speed_all_cpus(void)
 {
 	unsigned int cpu;
 	unsigned int cpu_count = num_possible_cpus();
@@ -264,7 +264,7 @@ static int check_unaligned_access_speed_all_cpus(void)
 	return 0;
 }
 #else /* CONFIG_RISCV_PROBE_UNALIGNED_ACCESS */
-static int check_unaligned_access_speed_all_cpus(void)
+static int __init check_unaligned_access_speed_all_cpus(void)
 {
 	return 0;
 }
@@ -379,7 +379,7 @@ static int riscv_online_cpu_vec(unsigned int cpu)
 }
 
 /* Measure unaligned access speed on all CPUs present at boot in parallel. */
-static int vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
+static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
 {
 	schedule_on_each_cpu(check_vector_unaligned_access);
 
@@ -393,13 +393,13 @@ static int vec_check_unaligned_access_speed_all_cpus(void *unused __always_unuse
 	return 0;
 }
 #else /* CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS */
-static int vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
+static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
 {
 	return 0;
 }
 #endif
 
-static int check_unaligned_access_all_cpus(void)
+static int __init check_unaligned_access_all_cpus(void)
 {
 	bool all_cpus_emulated, all_cpus_vec_unsupported;
 
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
