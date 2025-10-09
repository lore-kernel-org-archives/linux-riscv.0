Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F630CCA470
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 03:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bvlsrymxAUrTnK4lZgibzV0q9MFRvSMBSGh3S8Jt2gs=; b=uhljrpTVF3mzwQ
	LHKtX87pecTFiHvFoPp/9gH6YDAIC0kFul2OEN/YQpSSPCyEv7ppZhAj3xO2wVLnkxdaSMvxqkM7M
	6ph1ErHVZfz785ISLeiMGNAwpxvMSTmBeLnY3W1PjCB6fDvYX+gwcszXz/FDnHNs8Wp0cuKQGUYQS
	RZffvF8hz3+dihTWc/QbIOAwahEJoxgunYHFv1Iqsf2hqu4CNjI0T/1PDrY20z/znXCYHScXsVky+
	A+SWg46UUOFEk+vu2yiTL6pu/o8FO/ChpUMmqiepBxPlTHgy+EuCjUg816xOQ7Sx2HAdBR8EUccWi
	Tbfa2UAYevhYju07Op8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6hLm-000000056Di-3kEt;
	Thu, 09 Oct 2025 03:29:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6hLl-000000056Cm-222n
	for linux-riscv@bombadil.infradead.org;
	Thu, 09 Oct 2025 03:29:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=jnXMECOikkNGPVLHGk2/W+70TGvv+oQ3PJ6DV32z1EM=; b=Ei6L8UzDq4WZpAJYQ/sZVpNb+0
	4vHRAaIxsnW71Jy5Jrv2BjgLG7F5r6AMkn6tkqGb2NMONwaiDOqQ1/4hEnExIU67WApitH8jE+taA
	/6Hu7mUkGltMGrNgVEjCdiDkHGgekUaugqW6bgxasvs0AUg+01LRtGjpq1TxTVoGFFkIjHYa8PfFa
	rHVlS1Ukdd2RkO68G6G+vm5YY6JPVi82OE09DW1kTNXDt0pW6X+Zs2s0y4aTCtqvIb57dNs9WLCRZ
	ud6LpMuZSLqVwMrHdTMzzLksTQHZQZ+HmGQ6B4yi0G95OQcQ3suxxtXgeK6nsXSotKjVrlHAPb9Vn
	myVborwA==;
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6hLh-000000018bv-1Ujn
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 03:29:51 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-796f9a8a088so139317b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 08 Oct 2025 20:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1759980582; x=1760585382; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jnXMECOikkNGPVLHGk2/W+70TGvv+oQ3PJ6DV32z1EM=;
        b=I5H0tXhb/hDmxE/YHhD2DjHmz+lPfVKqA/NSWC0Ot7XLiuOP/i5p0AoMBqex8MU9Vs
         wnOg/d4+ByBKeWZofzkQQ4KrkUZbsFXJ57iGvav9ld2nEhW0AJd0zZUeOwxh0vVk1hmw
         T4U7TGJ/fNbuzpxlevLiyB6R0FtDW+LYJQvASXIle2aUG7pkgx0SScuP3YyAWF25LKKR
         JeHHpXKs1NSCclysmsk/LFValNMh2O05IskHT4gtB7FOjkU+qyekeb2ASPiYxPErTaK8
         fcm3q8q7BsEPnqlAJWG5TtnaJrbEF7hDOPFWYW5m6OuibQCreFvj+NmESBF1Z6/1uPcU
         X0wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759980582; x=1760585382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jnXMECOikkNGPVLHGk2/W+70TGvv+oQ3PJ6DV32z1EM=;
        b=GOZB4tsoukUnpaf4HTsZCTH50cnpF3Ov1Up2mitmgjv86ngc1DaBiOB0/b2+eExT7b
         N5kRGn1VA45bP8ElrJozTCn1zqDI80YAOsToM2n6sLIlfQq+l5kcGtlhbuNjP7g2w4Ou
         o6YTdGhm/dZRUgQ8UrIw98wFUwrizxMrJFCLYEn2bQiLG+QfWi14ImcvkDcM28Bwt/IC
         xcGMdn1DkEs/kcIP5+RFbJx1po+p3uEseavTh0+XTWFxnIGJDfYO875vewpAIH08w6DU
         yIjKWmvwpox7ECmGauLSXiEaFovaTvJLgTlE520XhFzd7FHrOHgXUEtg8/k1KGjvJwfa
         e5QA==
X-Forwarded-Encrypted: i=1; AJvYcCVbIXe7d2Qi2pcuHkeY6LK2rP2h78nU7QQJFIdzMTL/hOEZika4q+o0xqWfcwRAzLAxoCJDmRZdBOLNWQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyv2F0OoWlKEiJqjbS1CTYF5WtBKIJM77gD2Og2e3B3l0o2pwlT
	fzKN6ZNatrpI3fcqHA0nDZzr8x5dkY+Yw7HhpMgz8bDD4SfiUPw+X2VDGoLHrhmaRB4=
X-Gm-Gg: ASbGnctTpztu3tAO544gPeo1N+RNaB/7PeMhBFVdIJ3qfzkC+evQnopaC5IVYyoMVQv
	yezuRXgJQHLcbKLQI/lkI5+23ge7EmqmfOb72BpYGccFi/GqAxj1IZH5ruBEVG6p1mGHlZXj/C3
	mAHM+wLdSR34TlQzDnQdINUl6iGpD7SHDczsUOG363SCj2eI/WK3I9VE1tLewpbxrPZobCpYOmO
	FOjK5rpdCaI6spL0a2PSDgVnYftfXi8cltFSwVqGxzJeS5iAgjz+Auu56I4osfJc7FIIBjJ3kZB
	1WfDbo8912IeyT2ypgSprqSS56WDS7sTpEDEk4QsQ9ABt9quDclToB+IXteBC2ZCTJwdeZu95PR
	AKdam/2QRloskX9PyPwD56rIw7nLzX0ui673UBzC+DiQHbsN+bh3wD4g/Lfzx1CF79neN8B2YK2
	2wXR6SMcR3mrQ=
X-Google-Smtp-Source: AGHT+IHbZEm5frc8fvTXu54yWtTCugs4CwZJHmN7TKBRMpR5Iwopkp0MBjhRhFZXa74I0jkchu8wVA==
X-Received: by 2002:a05:6a00:3cca:b0:77e:9ae8:c7d0 with SMTP id d2e1a72fcca58-79384f48886mr7305182b3a.1.1759980582231;
        Wed, 08 Oct 2025 20:29:42 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.226])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-794d4b39400sm1271306b3a.15.2025.10.08.20.29.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 08 Oct 2025 20:29:41 -0700 (PDT)
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
Subject: [PATCH v3 2/2] riscv: add HARDLOCKUP_DETECTOR_PERF support
Date: Thu,  9 Oct 2025 11:28:38 +0800
Message-Id: <20251009032838.63060-3-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20251009032838.63060-1-cuiyunhui@bytedance.com>
References: <20251009032838.63060-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_042949_764311_AEECD990 
X-CRM114-Status: GOOD (  10.09  )
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
 arch/riscv/Kconfig           |  4 ++++
 drivers/perf/riscv_pmu_sbi.c | 10 ++++++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index badbb2b366946..6a7b4d2517c4b 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -186,6 +186,10 @@ config RISCV
 	select HAVE_PAGE_SIZE_4KB
 	select HAVE_PCI
 	select HAVE_PERF_EVENTS
+	select HAVE_PERF_EVENTS_NMI if RISCV_PMU_SBI_SSE
+	select HAVE_HARDLOCKUP_DETECTOR_PERF if PERF_EVENTS && HAVE_PERF_EVENTS_NMI
+	select WATCHDOG_PERF_ADJUST_PERIOD if HARDLOCKUP_DETECTOR_PERF && \
+	CPU_FREQ
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
