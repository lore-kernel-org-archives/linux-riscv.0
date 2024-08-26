Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05630C5321E
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2024 16:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ff+De+4yJMjonZOe4h80atb0oZQjmO2PV+vDnOk4jwU=; b=NJg80ovoT1nhFt
	K0ve295tCkYdO66ICPMPqeseBzeXIaGQ6Oycn2HS5W98RqEBhGcTp7ak9HaE8HwQ14C5eB1Uc3Ur5
	yZw4EcfOspzPbvbjnjbSLiDT2/HFGt2nSpxpkNy39Du0j0ZTsGN40e8SXBYKjyrmkYHOWYzeeIbNZ
	+BVOclOLsSXvfHP3OMz/e5ARNEbDAEFSauWCIy1trO6vn9ikI4hhJa+ZT44lm74Ysey3ssK2kx5bE
	Dd8xfvYmXemMp99WmJUOYz3l2ZFjM0BKcUgH7xYNxoIICBoZx7OsAofWkEi/EC74y5Q7pyLNDDI+l
	yMgmKhbJ6MHoevTafBRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sicxk-000000085j2-3Hdp;
	Mon, 26 Aug 2024 16:53:04 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sicww-000000085an-3aE9
	for linux-riscv@lists.infradead.org;
	Mon, 26 Aug 2024 16:52:16 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-36d2a601c31so2736232f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 26 Aug 2024 09:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724691133; x=1725295933; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BL9JjpcnqKHeua2e3XbD0fdD08HoTxgLl7O829TDGu4=;
        b=z3lkgDA0MwA1oXGSXsdLLW2HRdCY8TYXQ3er+LosT2l8jJPKrX0lZeH1cAI/PjA+Hp
         l3WPOAJmW2wJa1xsW4OmwnJbh2p3xxyFpsv0E9W5Ng39AONulBjjsfa4JsI0Ahu6EKkt
         CHwmYWS9sFivHF320peRZJPvJmXx/ZSgj3UB3p1+yvHPzozUVbM9Jw7a0uxdj97fSTDG
         U3uHEfo8+Ms7Et5Osl3FOUie4IWrwXk+g88y+JneGGFQHl2P/fj91N7ADy4mLbXT+N4H
         0efjbnQos9wrugeKYk/5Habn7rY52ritaWpJDHj6P+X+bYtRabfIQ612CiDEd4yOTAx9
         jmzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724691133; x=1725295933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BL9JjpcnqKHeua2e3XbD0fdD08HoTxgLl7O829TDGu4=;
        b=JvEXi0HdqvmwxQqR8udmwkuBbd3rfZ/Rth9Eoegbso2pVMlFnug/7Yipco3BpR4DZE
         X9ZSHk/WkPSQRpybtMvsd8epjKfy+zPEIz1hz18AkWN7OaqCqjaUZsLxCEMUl58vDRBP
         dlWXklyWwhJudZBU+9UKEueYWGQc6wAP5P1KL0KNZ4YxRYKquIOZMVRDXl/A9TK7Jb8y
         KvdbitJSTngNFzUPoDNFBDoz2plin9RcE/2FjpQh+0SG13JDwhIRIjgtV4Dvbkmgxjxf
         j9LaO/KWwOZn1F38myfiQ2yJRV+RzqJN+TIfEBo5n6negDfH4XTLnbyWfZUfdBCAbcGR
         aD7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVmXZ5OdSt+Bd99vvfmNFdqaIsAE9aL53FeA9FhxMdaFmOZSweCzW9OIE7Ddw4wW6JLJ0aptU7P7v+smA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxahuxl/WH28gjhSw0BjVMCzhIXCWP6cF9sLQHnfnHrEc2OtJq7
	52oZaZivLJrmpyUp4f6BzlXT6/gV4UibAK1jlFVWeaocONaZvP1LXyWr+a98MOs=
X-Google-Smtp-Source: AGHT+IHgPww2vGsUStPy4YUKa5Ssz7uxojN5Zc8AsHlLup59YaFfKd8Gz+nUHC6X++d8ON3xrClYDw==
X-Received: by 2002:a5d:6885:0:b0:371:8bc9:1682 with SMTP id ffacd0b85a97d-3748c7dcc10mr183591f8f.33.1724691132518;
        Mon, 26 Aug 2024 09:52:12 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730811044bsm11137226f8f.23.2024.08.26.09.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 09:52:12 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Nam Cao <namcao@linutronix.de>
Subject: [PATCH -fixes] drivers: perf: Fix smp_processor_id() use in preemptible code
Date: Mon, 26 Aug 2024 18:52:10 +0200
Message-Id: <20240826165210.124696-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_095214_898134_3B86C28D 
X-CRM114-Status: GOOD (  11.78  )
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

As reported in [1], the use of smp_processor_id() in
pmu_sbi_device_probe() must be protected by disabling the preemption, so
simple use get_cpu()/put_cpu() instead.

Reported-by: Nam Cao <namcao@linutronix.de>
Closes: https://lore.kernel.org/linux-riscv/20240820074925.ReMKUPP3@linutronix.de/ [1]
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 31a17a56eb3b..25b1b699b3e2 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -1373,11 +1373,15 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 
 	/* SBI PMU Snapsphot is only available in SBI v2.0 */
 	if (sbi_v2_available) {
+		int cpu;
+
 		ret = pmu_sbi_snapshot_alloc(pmu);
 		if (ret)
 			goto out_unregister;
 
-		ret = pmu_sbi_snapshot_setup(pmu, smp_processor_id());
+		cpu = get_cpu();
+
+		ret = pmu_sbi_snapshot_setup(pmu, cpu);
 		if (ret) {
 			/* Snapshot is an optional feature. Continue if not available */
 			pmu_sbi_snapshot_free(pmu);
@@ -1391,6 +1395,7 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 			 */
 			static_branch_enable(&sbi_pmu_snapshot_available);
 		}
+		put_cpu();
 	}
 
 	register_sysctl("kernel", sbi_pmu_sysctl_table);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
