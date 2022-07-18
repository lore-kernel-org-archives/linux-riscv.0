Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BD7C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jul 2022 17:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/fEf/Zne+z+2IEoCK2CPUMlHTXwg162TyXSbR03/BjA=; b=oNke8Lh3YyTVdp
	twyAfa+rHOtIwK2dPJWDHRFJ+vb7zPBzefhuGRH0l0Q+mOm/HTHR5DjCQOEV6CactfJdYyO+4+t9b
	pE5thtCibhXXCc0iJgYYLHvuAVqeeQ10N7FjY297FZU6oJ/vWJE293Mn3hWl7ZrvrqdLmszl3l3rA
	eGUTmFNYpXUsJm6LWKE3KUcsuZMb6sUtmSFwcQYq7XnwTtm3h8JH8dElZnhZpy8Bk6LcaZmGdEGQy
	00b0dWOjW1Oq/dE03CIFF9a0tIsxIATxlMto4Nf41e0TTNT+J14pt8an9On9h1xARSljiHeEd5dik
	alkjwlxLUmCad+JLzo9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDUBw-00GzoV-Dk; Mon, 18 Jul 2022 17:05:56 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDUBm-00Gzdy-7Q
	for linux-riscv@lists.infradead.org; Mon, 18 Jul 2022 17:05:49 +0000
Received: by mail-pg1-x52b.google.com with SMTP id q16so8039419pgq.6
        for <linux-riscv@lists.infradead.org>; Mon, 18 Jul 2022 10:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8D/oi8qgxVglaE+KkXtnFYaHMrc21lTodlCKwN8q0IQ=;
        b=6NTHNWDkGfN7I+U3W+qmMcN0LlUVIhzQVfmatvueYDhm8xc3F4XrNe3HMFoK47IaeP
         wezuL4aRYBbBQbfcTX6JLbwTLYCb6mq25SW67gKOZRSMVOOn9ugx9Du/yLIya1jEXiGa
         VaLqwovf483nx9vII+fm0YIOZKj3Je/TzzINbqEZBo+KvLTzAQ79d3DtpvrydepRM+i5
         YsD2Eidv3FO5D50/wsetAe86PBnZdrehL4o2bdHfVEgSmy+pVZKLQ4n4yt4wPXyejx2Q
         yZkNzkd/0jDcSycMCWUv6lNEvloqo4BB9asMOgTq7RRA5XOLGZGz8j+W2LKSmBcQCAU9
         k4aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8D/oi8qgxVglaE+KkXtnFYaHMrc21lTodlCKwN8q0IQ=;
        b=jy+mdoAtHFvdJKvtce2A9kGA3zigr4RHTabIXhGGmFtUzg7JLyfegc5lzUXudPLJUy
         FvTHlNgNtehK2Rjj9B/nbPDMskRXFnV0jl7SvAO+ze0qHga+NDCHzresYJtGc31u9cC7
         swtEotwdUU5/EasAiJ0N7mQEeQ/xWRwwfFvViKPcKzSXIXZ3TXca7Xi274bijRMquGOg
         B+ElWOs+NpTtIqCHvVJfaM/kCLYMmoa/7mk7SGLBg8HSkBiVkTS8PZZn3lsKv75LnY8w
         VYYtJlJ2BbvwFU9Mo4j1aIDD4ND9aeMDzZpX4jGL7s7Zp1m73er7qDT1lRtLJQG6D1i6
         wrBw==
X-Gm-Message-State: AJIora976Yr04VldaR/21nlvBzxPw/fLTBhaAKpkENwioP/l1KN7ZJBD
	DOXEow2ZdYShvHKCvLwPoCUbpQ==
X-Google-Smtp-Source: AGRyM1vFaRliljxiyhBObWT8RV5lv8cN9afUQtCB8wCNEDbktpQqD63FFaGhCAEBugkoEzCPluKhgw==
X-Received: by 2002:a63:ec15:0:b0:412:6fb4:88fb with SMTP id j21-20020a63ec15000000b004126fb488fbmr24847293pgh.49.1658163944724;
        Mon, 18 Jul 2022 10:05:44 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id r10-20020a170902be0a00b0016bc947c5b7sm9733402pls.38.2022.07.18.10.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 10:05:44 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Guo Ren <guoren@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [RFC  1/9] RISC-V: Define a helper function to probe number of hardware counters
Date: Mon, 18 Jul 2022 10:01:57 -0700
Message-Id: <20220718170205.2972215-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220718170205.2972215-1-atishp@rivosinc.com>
References: <20220718170205.2972215-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_100546_275088_8D5CB383 
X-CRM114-Status: GOOD (  19.68  )
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

KVM module needs to know how many hardware counters the platform supports.
Otherwise, it will not be able to show optimal value of virtual
counters to the guest.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c   | 23 +++++++++++++++++------
 include/linux/perf/riscv_pmu.h |  4 ++++
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 24124546844c..1723af68ffa1 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -27,6 +27,7 @@
  */
 static union sbi_pmu_ctr_info *pmu_ctr_list;
 static unsigned int riscv_pmu_irq;
+static struct riscv_pmu *rvpmu;
 
 struct sbi_pmu_event_data {
 	union {
@@ -227,6 +228,12 @@ static const struct sbi_pmu_event_data pmu_cache_event_map[PERF_COUNT_HW_CACHE_M
 	},
 };
 
+int riscv_pmu_sbi_get_num_hw_ctrs(void)
+{
+	return rvpmu ? rvpmu->num_hw_counters : 0;
+}
+EXPORT_SYMBOL(riscv_pmu_sbi_get_num_hw_ctrs);
+
 static int pmu_sbi_ctr_get_width(int idx)
 {
 	return pmu_ctr_list[idx].width;
@@ -443,7 +450,7 @@ static int pmu_sbi_find_num_ctrs(void)
 		return sbi_err_map_linux_errno(ret.error);
 }
 
-static int pmu_sbi_get_ctrinfo(int nctr)
+static int pmu_sbi_get_ctrinfo(int nctr, int *num_hw_ctrs)
 {
 	struct sbiret ret;
 	int i, num_hw_ctr = 0, num_fw_ctr = 0;
@@ -453,7 +460,7 @@ static int pmu_sbi_get_ctrinfo(int nctr)
 	if (!pmu_ctr_list)
 		return -ENOMEM;
 
-	for (i = 0; i <= nctr; i++) {
+	for (i = 0; i < nctr; i++) {
 		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_GET_INFO, i, 0, 0, 0, 0, 0);
 		if (ret.error)
 			/* The logical counter ids are not expected to be contiguous */
@@ -466,6 +473,7 @@ static int pmu_sbi_get_ctrinfo(int nctr)
 		pmu_ctr_list[i].value = cinfo.value;
 	}
 
+	*num_hw_ctrs = num_hw_ctr;
 	pr_info("%d firmware and %d hardware counters\n", num_fw_ctr, num_hw_ctr);
 
 	return 0;
@@ -698,7 +706,7 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, struct platform_device *pde
 static int pmu_sbi_device_probe(struct platform_device *pdev)
 {
 	struct riscv_pmu *pmu = NULL;
-	int num_counters;
+	int num_counters, num_hw_ctrs = 0;
 	int ret = -ENODEV;
 
 	pr_info("SBI PMU extension is available\n");
@@ -713,7 +721,7 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 	}
 
 	/* cache all the information about counters now */
-	if (pmu_sbi_get_ctrinfo(num_counters))
+	if (pmu_sbi_get_ctrinfo(num_counters, &num_hw_ctrs))
 		goto out_free;
 
 	ret = pmu_sbi_setup_irqs(pmu, pdev);
@@ -723,6 +731,7 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 		pmu->pmu.capabilities |= PERF_PMU_CAP_NO_EXCLUDE;
 	}
 	pmu->num_counters = num_counters;
+	pmu->num_hw_counters = num_hw_ctrs;
 	pmu->ctr_start = pmu_sbi_ctr_start;
 	pmu->ctr_stop = pmu_sbi_ctr_stop;
 	pmu->event_map = pmu_sbi_event_map;
@@ -733,14 +742,16 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 
 	ret = cpuhp_state_add_instance(CPUHP_AP_PERF_RISCV_STARTING, &pmu->node);
 	if (ret)
-		return ret;
+		goto out_free;
 
 	ret = perf_pmu_register(&pmu->pmu, "cpu", PERF_TYPE_RAW);
 	if (ret) {
 		cpuhp_state_remove_instance(CPUHP_AP_PERF_RISCV_STARTING, &pmu->node);
-		return ret;
+		goto out_free;
 	}
 
+	rvpmu = pmu;
+
 	return 0;
 
 out_free:
diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
index 46f9b6fe306e..fc47167e000c 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -46,6 +46,7 @@ struct riscv_pmu {
 	irqreturn_t	(*handle_irq)(int irq_num, void *dev);
 
 	int		num_counters;
+	int		num_hw_counters;
 	u64		(*ctr_read)(struct perf_event *event);
 	int		(*ctr_get_idx)(struct perf_event *event);
 	int		(*ctr_get_width)(int idx);
@@ -69,6 +70,9 @@ void riscv_pmu_legacy_skip_init(void);
 static inline void riscv_pmu_legacy_skip_init(void) {};
 #endif
 struct riscv_pmu *riscv_pmu_alloc(void);
+#ifdef CONFIG_RISCV_PMU_SBI
+int riscv_pmu_sbi_get_num_hw_ctrs(void);
+#endif
 
 #endif /* CONFIG_RISCV_PMU */
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
