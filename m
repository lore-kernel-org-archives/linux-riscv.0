Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7897C636CC
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Feb 2023 02:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a0s7NHrdR754UsMJW4goB+w2ar3UDTZFb9Adi/GL0n0=; b=WfsmtQx3IJgl+2
	e9EGJbR1m0Dt8Xy8UlL/P6LU9esPAoa5qSeKTvbUH9BQLGrWouXXZrVKWFcf9wVTANC5CiOVGKnmO
	n7G05vufNUTeUD96iocC7yl629K/+QpQWtwxV6vL9VaSVcxLRCR0DRkkBcEh5eRhCNQ7MU2CYg2jK
	NU89ACKL+pe2Ax0H/NmzKbPDApY47ylI/otamRzhOIik3tevwFKLaWf2lMeoEFZxgUuraNokL/fmS
	0DfEg8Iv1DlSPBq3rFOE8KikQ2WzmfEt0SED7q8iodLcxiNW5PzsGbuG8CZkIS4RV+JX7vrCUnD8J
	QE6nNFLh1/DAEztNZ1MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOUa3-005rc5-ID; Sun, 05 Feb 2023 02:16:35 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOTcs-005oCb-Co
	for linux-riscv@lists.infradead.org; Sun, 05 Feb 2023 01:15:30 +0000
Received: by mail-pl1-x62a.google.com with SMTP id r8so8898977pls.2
        for <linux-riscv@lists.infradead.org>; Sat, 04 Feb 2023 17:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=svX9QoI7+pu9KPeMOFBJn1yDl6Mnh/aSAvVAOGuYZfA=;
        b=UWWqvu8ePBkTP/f/Im+K0H/bNL/4zKa4o1kI6YLXeiV/XRHxhnq/UqlTohNKQYSFfd
         m2UxfODelUBj4tsTSem8Ta5Um6OpE9jup1MJsc1vyMgbmWEMWodnGydA9Npw8rqoB3Nr
         zyQQzmAj10eUlrfRefLVvB8HXB+CVmvso7lp1k8XGnFcDQxrESBPR5vMhiUPN7et66eC
         E0/TWd/Qbctc9NzaDESSuyCAIrC3vglE0+oE9UrDJ+wJi52VhxA/FwMQhCFh/a+LEHM/
         E+BC8uoYtypHLFQaNyX12aSHnxo1s5C9lt8NjtST+gBDTrBDiT59LguPB7YhM4WPOHAl
         rauQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=svX9QoI7+pu9KPeMOFBJn1yDl6Mnh/aSAvVAOGuYZfA=;
        b=CT83avPgiKGk7lcMQQ5l9Cxed+bsUfE7vcr1oUl9SzhL7SGVX36rMoHHA/DhiE5Wwi
         cAu89G5UGb4+OZMshw0ZNds9LXlhfC3woaXhdK24kSFWbDCFJSaImYcXZZa0dJv0xg9P
         GvhAqNdRj+KRw/z5Eq3y87zNiuoFgepqeIv7A22tsZv77GcMfHAW3HA+oW39tycuQEx2
         pw1DU8JHY5tqrtOIzo49/m4Uav1PC/+TyMc+Tnbdx/KHdWhLQEGi4YukEATNofBNw7f+
         v2BNtGDJR0o7L5ikjlTiRCFe26vl8eFsjHvFMtYBykrzjsm1s9faJOCPEoBmgg8e7ne8
         0l0A==
X-Gm-Message-State: AO0yUKXy3spx6VYZXAbsC2daee0jlX4Lykul88vP9p4aU4bq/MEw602g
	W6LoGyeEp4h1wpgbhkrEqlPjUw==
X-Google-Smtp-Source: AK7set+Xyt5S9nTOhNQhOx6D8ZIswnKXzhNJjKsuo14bbUAnnbqzHvHmwnIDP5qP1M47Lk99is8gOw==
X-Received: by 2002:a17:90b:4a4c:b0:226:c196:db55 with SMTP id lb12-20020a17090b4a4c00b00226c196db55mr16098855pjb.18.1675559723756;
        Sat, 04 Feb 2023 17:15:23 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id c7-20020a17090a020700b0023080c4c3bcsm2721917pjc.31.2023.02.04.17.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Feb 2023 17:15:23 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v5 01/14] perf: RISC-V: Define helper functions expose hpm counter width and count
Date: Sat,  4 Feb 2023 17:15:02 -0800
Message-Id: <20230205011515.1284674-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230205011515.1284674-1-atishp@rivosinc.com>
References: <20230205011515.1284674-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230204_171526_465995_25390D13 
X-CRM114-Status: GOOD (  19.17  )
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

KVM module needs to know how many hardware counters and the counter
width that the platform supports. Otherwise, it will not be able to show
optimal value of virtual counters to the guest. The virtual hardware
counters also need to have the same width as the logical hardware
counters for simplicity. However, there shouldn't be mapping between
virtual hardware counters and logical hardware counters. As we don't
support hetergeneous harts or counters with different width as of now,
the implementation relies on the counter width of the first available
programmable counter.

Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c   | 37 ++++++++++++++++++++++++++++++++--
 include/linux/perf/riscv_pmu.h |  3 +++
 2 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index f6507ef..6b53adc 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -44,7 +44,7 @@ static const struct attribute_group *riscv_pmu_attr_groups[] = {
 };
 
 /*
- * RISC-V doesn't have hetergenous harts yet. This need to be part of
+ * RISC-V doesn't have heterogeneous harts yet. This need to be part of
  * per_cpu in case of harts with different pmu counters
  */
 static union sbi_pmu_ctr_info *pmu_ctr_list;
@@ -52,6 +52,9 @@ static bool riscv_pmu_use_irq;
 static unsigned int riscv_pmu_irq_num;
 static unsigned int riscv_pmu_irq;
 
+/* Cache the available counters in a bitmask */
+static unsigned long cmask;
+
 struct sbi_pmu_event_data {
 	union {
 		union {
@@ -267,6 +270,37 @@ static bool pmu_sbi_ctr_is_fw(int cidx)
 	return (info->type == SBI_PMU_CTR_TYPE_FW) ? true : false;
 }
 
+/*
+ * Returns the counter width of a programmable counter and number of hardware
+ * counters. As we don't support heterogeneous CPUs yet, it is okay to just
+ * return the counter width of the first programmable counter.
+ */
+int riscv_pmu_get_hpm_info(u32 *hw_ctr_width, u32 *num_hw_ctr)
+{
+	int i;
+	union sbi_pmu_ctr_info *info;
+	u32 hpm_width = 0, hpm_count = 0;
+
+	if (!cmask)
+		return -EINVAL;
+
+	for_each_set_bit(i, &cmask, RISCV_MAX_COUNTERS) {
+		info = &pmu_ctr_list[i];
+		if (!info)
+			continue;
+		if (!hpm_width && info->csr != CSR_CYCLE && info->csr != CSR_INSTRET)
+			hpm_width = info->width;
+		if (info->type == SBI_PMU_CTR_TYPE_HW)
+			hpm_count++;
+	}
+
+	*hw_ctr_width = hpm_width;
+	*num_hw_ctr = hpm_count;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(riscv_pmu_get_hpm_info);
+
 static int pmu_sbi_ctr_get_idx(struct perf_event *event)
 {
 	struct hw_perf_event *hwc = &event->hw;
@@ -812,7 +846,6 @@ static void riscv_pmu_destroy(struct riscv_pmu *pmu)
 static int pmu_sbi_device_probe(struct platform_device *pdev)
 {
 	struct riscv_pmu *pmu = NULL;
-	unsigned long cmask = 0;
 	int ret = -ENODEV;
 	int num_counters;
 
diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
index e17e86a..a1c3f77 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -73,6 +73,9 @@ void riscv_pmu_legacy_skip_init(void);
 static inline void riscv_pmu_legacy_skip_init(void) {};
 #endif
 struct riscv_pmu *riscv_pmu_alloc(void);
+#ifdef CONFIG_RISCV_PMU_SBI
+int riscv_pmu_get_hpm_info(u32 *hw_ctr_width, u32 *num_hw_ctr);
+#endif
 
 #endif /* CONFIG_RISCV_PMU */
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
