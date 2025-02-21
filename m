Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38206C021B3
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 14:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A4SDhEzFReJxYBAatnlb+d6HWOuH1ybaHSxyWdRWTMM=; b=oZqvUdfAbYulJD
	Yw9wV1/UXk4G4qVba7NPg6zf1Ay3+UwTXtxS9jFEYHWpM+KO9lX9dV+Sa7IaPimTlafxphFj2CfDT
	p9w/Kb51TyIBLdFIAEc14V6jLDde5Lakq/7AafioILLXVNCFnG23VC/IrYHSEkbFjT7bT8xo2/FYV
	hUmW6afHl2yzHg2PFer/Ygt0qMRdDb5Wka7kxifetR7lLxam/bANIsKI1au+MZmLy5abIkDGdmwxH
	BQUmmoVgcPBDiuyvN8VfTzFizKpuK9p7YGEkayI8JKJ5ub+xgkG78TAbOSEBdSXKKSfOnALICKYNd
	gpyKPpELTR3IQ0e1EICQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlUT8-00000005tyP-2BWo;
	Fri, 21 Feb 2025 14:57:34 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlUT3-00000005tu7-2meM
	for linux-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 14:57:30 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4394a823036so21685685e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Feb 2025 06:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1740149848; x=1740754648; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qKhFFnzXyWbQAGhMWM6ZzS3r16qIjR6tEgWbgaYi/y8=;
        b=hgwHCXjFG3qCShvo573KuOD+fz6aE3JvDtf4RqFoRdbOkWRhlR8G22DsiY6hJC2Rh2
         N6ewwNmg9Pf9nxKGRXFBwCEMEN65MtT8oR6hQvNMwgoiea/S0qn13XWuysa3FivYlZBB
         fbcCYwsL3t2mCrbAVDMXj9gjTsJYNQM2YttCHRaGJ138/IaiItDEw2J8S7L4O2k3XzE0
         OqiyTzCjauLdOG4hINRRgff/dGLgXO1FAKVaTZXAEtA1FqyjsxPT8PKul/9te3cZf3Ur
         gdUgbBW/PzIza061LzlCXitiXy8GJFD3weWrN9rVO0ND20TstY9Cp7Itz/joIHpPk6BH
         vQ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740149848; x=1740754648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qKhFFnzXyWbQAGhMWM6ZzS3r16qIjR6tEgWbgaYi/y8=;
        b=v2KYsUKeLqZdD7suK5FmJDeLt9wC9yDhGU+3BTIFwCTUZ7/b3N5hZUGt04bHWBo24b
         O/sB1S3tVtzmlSGrt+f5ylxKCTT5mE2v4UNdPPYW6XzEfoBfK2qcNhLOo/S0zRAHBbhj
         8JCQ+qE3ozBYgwKbimWBASDUSlrDzJo+W9Pl7vYYj5gRB5sDR736+ArmBoDxlZ3YaoHN
         QYQSTlneaPfBHe3rXd/DANNjaXHeqacv23SSMRqUYE6QQJgLFdfSwispDcJZXuosDQKS
         xqSoC3juvemYbbGaIoYJUo3CsvXjsSelEKh63//mB3JEBO5oG+lkeI19H3zYZCfX65gv
         B7Yw==
X-Gm-Message-State: AOJu0Yz/Vwxryv3XvemtXZIK9kXtwU7ELeqGF7BWrGe/ce7QfUudn9/r
	FjRENhzXnfs9SyTZ7otl5eysA1TSGKyoeK18UVjvxM0mAafMqRXbqz506ds502od+ruVK9BYwpJ
	k
X-Gm-Gg: ASbGnctjklBJNgqY5CKQddFUXzSvRiu5AuI1d8S9tclJj9WsbBHaUmLh0WmsOeuD5E5
	NUeRjEylCjDTj3st2tEYJzwckScQ8YSyWnbxrn4q4XNV32L3UU5Gwy420doKrQ679pDkTnQZwc7
	SviZdzyELFuL11Xw+df5uPXUikzZn3EbQPaW/DLCPFWX4Rw7IBpErCZRV5njfcVXUWAL40MNreT
	nt7zWQwh3PZJdcRrmPFF4maFn2xZXvPW9DnRM02WC/8V2riuns9EvIMDEpTD8NWIxbrrhLLIjue
	fIZegxPrUFUlFQ==
X-Google-Smtp-Source: AGHT+IEkXpICcfr44M3mVSGYGMJpSIpS61Nr1K7aTqNzeXftVjarUfFAfjEfBCRs4wT7c1ZnFz5qtA==
X-Received: by 2002:a05:600c:470a:b0:439:a139:7a19 with SMTP id 5b1f17b1804b1-439aebb3155mr25569025e9.23.1740149848034;
        Fri, 21 Feb 2025 06:57:28 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::766e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b030b2c8sm19891515e9.25.2025.02.21.06.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 06:57:27 -0800 (PST)
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
Subject: [PATCH v2 6/8] riscv: Fix set up of vector cpu hotplug callback
Date: Fri, 21 Feb 2025 15:57:25 +0100
Message-ID: <20250221145718.115076-16-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250221145718.115076-10-ajones@ventanamicro.com>
References: <20250221145718.115076-10-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_065729_712082_F307AFA5 
X-CRM114-Status: GOOD (  11.15  )
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

Whether or not we have RISCV_PROBE_VECTOR_UNALIGNED_ACCESS we need to
set up a cpu hotplug callback to check if we have vector at all,
since, when we don't have vector, we need to set
vector_misaligned_access to unsupported rather than leave it the
default of unknown.

Fixes: e7c9d66e313b ("RISC-V: Report vector unaligned access speed hwprobe")
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/unaligned_access_speed.c | 31 +++++++++++-----------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index c9d3237649bb..d9d4ca1fadc7 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -356,6 +356,20 @@ static void check_vector_unaligned_access(struct work_struct *work __always_unus
 	per_cpu(vector_misaligned_access, cpu) = speed;
 }
 
+/* Measure unaligned access speed on all CPUs present at boot in parallel. */
+static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
+{
+	schedule_on_each_cpu(check_vector_unaligned_access);
+
+	return 0;
+}
+#else /* CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS */
+static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
+{
+	return 0;
+}
+#endif
+
 static int riscv_online_cpu_vec(unsigned int cpu)
 {
 	if (!has_vector()) {
@@ -363,27 +377,16 @@ static int riscv_online_cpu_vec(unsigned int cpu)
 		return 0;
 	}
 
+#ifdef CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
 	if (per_cpu(vector_misaligned_access, cpu) != RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN)
 		return 0;
 
 	check_vector_unaligned_access_emulated(NULL);
 	check_vector_unaligned_access(NULL);
-	return 0;
-}
-
-/* Measure unaligned access speed on all CPUs present at boot in parallel. */
-static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
-{
-	schedule_on_each_cpu(check_vector_unaligned_access);
+#endif
 
 	return 0;
 }
-#else /* CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS */
-static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
-{
-	return 0;
-}
-#endif
 
 static int __init check_unaligned_access_all_cpus(void)
 {
@@ -409,10 +412,8 @@ static int __init check_unaligned_access_all_cpus(void)
 	cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "riscv:online",
 				  riscv_online_cpu, riscv_offline_cpu);
 #endif
-#ifdef CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
 	cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "riscv:online",
 				  riscv_online_cpu_vec, NULL);
-#endif
 
 	return 0;
 }
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
