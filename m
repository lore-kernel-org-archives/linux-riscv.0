Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B80CCAC5AA
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Sep 2025 08:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R129ERxXJsJawbLOL/nxqtF2VQfUunCOJF5peYACHxw=; b=UMzPWkt7o1tKru
	Kus/4i8JepnUxpaogToahGx44bpc57HNnvWBwESfPMd5guyYGB6Cz/50jlh+IZiKPcCxNzdAgTM6W
	j0+5k+ZEaA/upjeyDKVf2vngWF6Zui/UZJ8ieJ1fmI6KIvur6CdiXbTbi1Gguj3PsuH07va0TxsA1
	rng1Uewwc/3NW0h+6qH1mX25n9GjD8B8myvOpCNcJ2dw032oyIX4OQKH7zRoTQeMymGEwC5LzMf3k
	D3tZAaYt/hm79hDa/ScuCur8NrxzzjdF32TxYHrplIzWDVc1SEiUsfbWVCRPDjvtVx7zswnLAMybf
	sTyoqGKv1VaaYMyN2STw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1heg-00000007HMm-2vsB;
	Thu, 25 Sep 2025 08:48:46 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1hec-00000007HH9-3FCg
	for linux-riscv@lists.infradead.org;
	Thu, 25 Sep 2025 08:48:45 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-77f207d0891so757919b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 25 Sep 2025 01:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758790122; x=1759394922; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Ub+joKWJDAfsvLrnMb0mGFn8U6flakDwqgSsOBFKpo=;
        b=hTpPumyHXXC4QOydA58LkYQDav1Hi/0QDP2zDBEPc5BcvfSEVOEo4zJDYFj1BFEgyj
         2eOz2RuhT1fTbI6QyWv+namA63Fz6zXZQ8En80uQH1jKduPONWj5RqOXLYsCmUcWghQw
         RdNNPBBkd3CStS8Yn7+HUQTJSQklesMX67ZeAg9SiJdSUoyrq406aCPGx524mSzCRnc2
         dmnKqegARemCG4eEY5M1T1BBxFkLrRYM9ef+XJJSZKRkjfuct9iFhI4jMX+DIUfbzoKi
         qt3HeAfP7Eo/2xAkf8o8aWZs4PjKp5rpj09KqU8k68K+/m40EYKxO3HeM89vxV8O7KE9
         1m3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758790122; x=1759394922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Ub+joKWJDAfsvLrnMb0mGFn8U6flakDwqgSsOBFKpo=;
        b=sVvRZBXQvj4J5X/jYs2gsRU/ugGk4qkA+ze0gry2hCOKRfI67C2mN+ytjquK9tm/Sw
         g8MoQngx8Vu2dluzsaD33Bb/whODzCPsJU3SQUuOFOXRNmkMrITVECqZF+K1fK4vJopF
         jZvbmK6UyX0Emnuc9fbMZEDMoVkBY92/6g+O5gi7gRyyPVrvbPOV1cTKjJJLdbmNQUNY
         9JO798ODo+S/cQgDBlI1xa4l6S3MwWDjaJ8EJovGxhav8VF0EseWkWZiOt1cr28IZN9N
         PTmvnFB1thuxJ+iFDU/RDLJb+lTMrQjtOlkLC3KMeoQi413znS+4U8jg9rV+P8qiWHmo
         nrLg==
X-Forwarded-Encrypted: i=1; AJvYcCX0ihEZ8uap2ef+ipUD9DOBwtPBxKW+nldXpHPsagoaRS3fyQD/gnUkvioumKIuk874vr1TghTywRE/ZA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+8P8Nof6SITYSromOiSl/gUfShxi/oGzIM7VR8Kuy5+feemK2
	IwJSuPi383RXDsjxUs+NvR0KjdDKxe/iL/gy1uUCHhi01gtkMK4b/kqsR9bgsIgVh3o=
X-Gm-Gg: ASbGncsUP7YJu+pz/itTsN4TT10HTYOi27QFaQads75jqxXlcjBJaP6UvYlQY7qKMfY
	2QwSv66YreO47csHT/ZyKQIg7XiiP9XNzih7TBvO05j3WN5vE/na9xfCqTgFSUblRcXX5w7JrWi
	Yw9Rw3588EPhAQTJF76PU3sn6fBpdhGgv305ng/8T2qSzlOmKX8LrSIgu3RAcRbsc6unImW/F6m
	cLDQBd8FgSrCRnoLKl2MchwNgp60eCKywdzRZ8W9tbDacy2oiuDPN53f+dwELxNj/N5Qi/MP/Dx
	xeC1qLyeTJaYIQRmfCDIUJlaQR0Dtb6v8GiipVDzT1U7Qum7Ao+lDas9sOIY3aOedppqZ7PIhaZ
	yPxrc9g0hepUdHEXT5+8jjpSh2UWS685nfUGCEpOLlbEsbU4yjNuE+bg/KNbY
X-Google-Smtp-Source: AGHT+IEGSkHjuRa7OGjamv0g/2mmAckOVuB2U/CUDAe2j089bjTc0cZKoTa5Cf1LNp+M5twG0RcAdQ==
X-Received: by 2002:a05:6a20:a127:b0:220:10e5:825d with SMTP id adf61e73a8af0-2e7bfc1d570mr3624129637.8.1758790121907;
        Thu, 25 Sep 2025 01:48:41 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-781023ec6aasm1321867b3a.46.2025.09.25.01.48.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 25 Sep 2025 01:48:41 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: akpm@linux-foundation.org,
	alex@ghiti.fr,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	catalin.marinas@arm.com,
	cuiyunhui@bytedance.com,
	dianders@chromium.org,
	johannes@sipsolutions.net,
	lihuafei1@huawei.com,
	mark.rutland@arm.com,
	masahiroy@kernel.org,
	maz@kernel.org,
	mingo@kernel.org,
	nicolas.schier@linux.dev,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	suzuki.poulose@arm.com,
	thorsten.blum@linux.dev,
	wangjinchao600@gmail.com,
	will@kernel.org,
	yangyicong@hisilicon.com,
	zhanjie9@hisilicon.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 2/2] riscv: add HARDLOCKUP_DETECTOR_PERF support
Date: Thu, 25 Sep 2025 16:48:06 +0800
Message-Id: <20250925084806.89715-3-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20250925084806.89715-1-cuiyunhui@bytedance.com>
References: <20250925084806.89715-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_014842_891593_77609F67 
X-CRM114-Status: GOOD (  10.33  )
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

Enable the HARDLOCKUP_DETECTOR_PERF function based on RISC-V SSE.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/Kconfig           |  3 +++
 drivers/perf/riscv_pmu_sbi.c | 10 ++++++++++
 2 files changed, 13 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index badbb2b366946..bb4e8c5a18717 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -186,6 +186,9 @@ config RISCV
 	select HAVE_PAGE_SIZE_4KB
 	select HAVE_PCI
 	select HAVE_PERF_EVENTS
+	select PERF_EVENTS
+	select HAVE_PERF_EVENTS_NMI if RISCV_PMU_SBI_SSE
+	select HAVE_HARDLOCKUP_DETECTOR_PERF if PERF_EVENTS && HAVE_PERF_EVENTS_NMI
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
 	select HAVE_POSIX_CPU_TIMERS_TASK_WORK
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index c852f64a50221..0c7c5924687c9 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -22,6 +22,7 @@
 #include <linux/sched/clock.h>
 #include <linux/soc/andes/irq.h>
 #include <linux/workqueue.h>
+#include <linux/nmi.h>
 
 #include <asm/errata_list.h>
 #include <asm/sbi.h>
@@ -1192,6 +1193,13 @@ static int pmu_sbi_setup_sse(struct riscv_pmu *pmu)
 }
 #endif
 
+#ifdef CONFIG_HARDLOCKUP_DETECTOR_PERF
+bool arch_perf_nmi_is_available(void)
+{
+	return IS_ENABLED(CONFIG_RISCV_PMU_SBI_SSE);
+}
+#endif
+
 static int pmu_sbi_starting_cpu(unsigned int cpu, struct hlist_node *node)
 {
 	struct riscv_pmu *pmu = hlist_entry_safe(node, struct riscv_pmu, node);
@@ -1618,6 +1626,8 @@ static int __init pmu_sbi_devinit(void)
 	/* Notify legacy implementation that SBI pmu is available*/
 	riscv_pmu_legacy_skip_init();
 
+	lockup_detector_retry_init();
+
 	return ret;
 }
 device_initcall(pmu_sbi_devinit)
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
