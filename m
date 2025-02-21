Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E885C021B5
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 14:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C0+VCgio1tUjlLnBhjdP1KU//uFP0aIvLX5Mxj6nLmk=; b=PGQ6uCe73FxKeq
	bI0WdWqpB2WLkkHKjv8XB+yoWATbTLu0U/PsHVi+c/0Aw0LrhztVmxauJdMyOSjyNL3rRx+MaVsvW
	hiaCmRn4RERhhON6BG7M9ITLuzK7FVJIwhzjCvg6/MUQDXyrkjdj2jJKW8IEG05GqOFvwYdV8kff5
	HIvw59GUABunCqnShhvltFEbx9IKaMHpSNtVkAs1buHSvArAUNRS0/U6Qrlg00zv1Iuaz1i5tH19d
	RDOzAwUFmfIDyIefCsiuGJUuVUBc1NbducFaTgwUVPvvA+aixyH5lNArZLRow4UxTO7rrNijeR+66
	Eva1oqxHstxBiYarp84A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlUT3-00000005tug-2UjV;
	Fri, 21 Feb 2025 14:57:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlUT1-00000005tsk-10xJ
	for linux-riscv@bombadil.infradead.org;
	Fri, 21 Feb 2025 14:57:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=dsOXXT+GJOZQxfHaJbyOnCfiUI8BUwrK26GnKW4Oj7U=; b=p8mgNwIKFJvzOfAlqCZZ91rf0n
	hbwyhvebgWu/6WGd2nIr54Up4dIqTjCaB8EpAZU21r3KkFMMHxsF9dcATXCNvkerh24BT5AcPyWyi
	19DV2vIZEPvPkWVQhqxoT1D7kh++siXqTEqkCX4wh6f30HoWjBDTNp6utTs15Als7IbC1yuA+KZWh
	peM1PJdT2rPR+TnhOJe7V8bQhq6yyo8S4Gyblh0KOA2MU3AwiOeLsoFa5/QMT5HTyxuwSNYyApV3h
	NzDL2xzFRIhv1zv24GTVdgdCb8Fe1flq/YKdC2tw15GQhN+1DfZC/ctQf8RLrH9FM/DnrXicQ+HAk
	bKWsU62w==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlUSy-00000002em3-0Rlu
	for linux-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 14:57:26 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43937cf2131so15376775e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 21 Feb 2025 06:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1740149841; x=1740754641; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dsOXXT+GJOZQxfHaJbyOnCfiUI8BUwrK26GnKW4Oj7U=;
        b=m7nEiHhC8Gz9QsJGVo0T3Q0zMLNVA7oH+dxD4zpcbfl7e1b6GK+XjZJFzbMwN++S9X
         ruEq338gbaceDWrsDRVXNlHtWgQHOAfdGQBfA6wwe7OdHCfKNO49L8Qe6jBVTdlU6ddK
         hDHI3qSIsRNR/Shm6M6yKXhXbnuWn6wvarTKOj8pl+yiNu3exYtt+V/+KH2y5zqaiHuR
         2vAbvPdi+lIYAm3/zOnHO/5YcEgpYKoYYO/1e9Fk+Nyt0njCPECnO3DLdHZPVRyrrqfy
         jOidxl6jq3WRfSxuqf8iwGftv2028eysNdWllQwpHex7uM2Is/Itc96lE2exvoxiDXpd
         7fnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740149841; x=1740754641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dsOXXT+GJOZQxfHaJbyOnCfiUI8BUwrK26GnKW4Oj7U=;
        b=mCpIbSv5UInqdcIYYBuVKxyX3Zb3rtyZ4Qg2uWCI900xasZuqPTBVpxyng6ZdSrqak
         aXJ8ZaXMXJHvW8GB2+HDi5kXMifah6nEWAn2R4nNnjDinMvMo29TB88m5OzMpa/QVlSU
         mURHGPoxRwql6xHy+Zb/Hffk/n43o6feW7x8hMN3CnCC0Te4qUpo+lpRlEb/IrGrCpMh
         HmmBUz2VfkjiWUjn2e2vhJXcTNOUbiH87qvwTAdLhb6qXTZlbvY/Z6TEma3/HJZHPbLu
         PUB+PbfaEb3Gs1pfo9mUfYI8fbSt4WaiJrzVKFaTH1KrtEXb01w0xMK9AIS/Xk5OPK1e
         2RQQ==
X-Gm-Message-State: AOJu0Yx8nkA17hvpeflGGi/HGlTI9Vfdr/sfStY0SSnazgW1/Aj0S30Z
	51PCM3BNJwaTKuMt/T94SNqLaXcYMJiKstqvr3IuyvOBbKvro43LkkbhmNOMv+GF4tE43iDZ8nK
	8
X-Gm-Gg: ASbGnctCSobuF8nM+34jg/2p78aJv/f6Btz7l49FjW+S6dfRCNrzqcA+TWQBevikOFo
	tX12bL7t6qz5CWcbjCuD7TYjylHqkLamOSjj027P603R2ahzflnzFy12YzOY26pfPu2jOy+o99A
	bIrg/i4RiN4YBFe9CJwLwdfe3G9RxK3UI+ymvadUKXPoMHwTiDGACE4XaiRIH6tT1NZ5R574oLl
	aT9WAVIijwBnrt0SDG6Et9Q+Eso/VkraEpk/G1AjJAXORC0S/c2HsCNJBYGkRgGY0RsHRkI5hyB
	3NHeS7gZClJuKA==
X-Google-Smtp-Source: AGHT+IEUliwq1ZDyhNRp6iD5CU1s2Dr/5eTi3CQW3MEFV44buTgl2XlBAKDpdOkuwjiNC2NjVPRKIA==
X-Received: by 2002:a5d:584f:0:b0:38f:1e87:cc6e with SMTP id ffacd0b85a97d-38f6e74f270mr3231891f8f.9.1740149840969;
        Fri, 21 Feb 2025 06:57:20 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::766e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f74817cbdsm1344912f8f.68.2025.02.21.06.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 06:57:20 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	charlie@rivosinc.com,
	cleger@rivosinc.com,
	alex@ghiti.fr,
	Anup Patel <apatel@ventanamicro.com>,
	corbet@lwn.net,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 1/8] riscv: Annotate unaligned access init functions
Date: Fri, 21 Feb 2025 15:57:20 +0100
Message-ID: <20250221145718.115076-11-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250221145718.115076-10-ajones@ventanamicro.com>
References: <20250221145718.115076-10-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_145724_365024_786FF308 
X-CRM114-Status: GOOD (  10.19  )
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
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
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
