Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD71C54EAA
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jan 2023 19:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E+KmheogaFBYBN6TSGs9lVryr81sKeFDJT54YZ9pm24=; b=eoeHrq5Njba5TB
	r9D9Hql0EfgzD/BOkLa+QUUJn7BOrFBk0WRNsJzhGcW4okrroyMlV6rpOrnXvLdzn1iz0mWOp8A5R
	vGii2nIiUCU9yVKty++AIPph+6FALoZcmTbYcVcSKn/Use4S7Z711ovmAIC3DmLJaG0rLMMLLTLrb
	au9lVLkTfBd0OlDsKv7VzS4VeJ0FFwTAERObXbfBfrgYXn5QZfQIIo1KHKARKlmDYExHUqOOI4QFc
	G9KJ586YmDwNowhlD76Ebu/BUFOXPKsmA0GZ4fg8XrpyHmdwBwRnZccSwKq+CLOVuKLn0k43Me2Vi
	Wo7QGGRAcyHGCHJVzvsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLURZ-00G7FM-Uy; Fri, 27 Jan 2023 19:31:25 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLTQX-00G2aQ-N1
	for linux-riscv@lists.infradead.org; Fri, 27 Jan 2023 18:26:21 +0000
Received: by mail-pl1-x62c.google.com with SMTP id jl3so5859352plb.8
        for <linux-riscv@lists.infradead.org>; Fri, 27 Jan 2023 10:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iGqgvezQ/AlpTuqgVROWAp2lac08ioX9ghbgFT6R5zs=;
        b=IoRffA7eaBKD5TnGEAMzpERUl+R39LOxAlgfDLhDNga+rN9SbFYLfdz9WFRgJCTeRN
         9Updpbd1OZtc//enWU826k0AachdF3yKioeNtgxkt9/kIfGqMeggP3NJkMHCVrn38zEt
         o0ySxQgMwR7DstBzrONN9sUSnnkIYSCZmjlPUaPZycJTqTBIKNAj0Y+IKQKTWXZUV/g1
         Hbr1Yw2D00RYz6wcO9p7KP1dPScebiMdJ1Wz7lqeW/m8MLImzr1r9OBpSxBUtGPDMeaU
         EKmOy6JcaGBPxAZXqtqvKGClyDQ4IZH3V1Pgrky1d4NUmTsNJDKgHZ/O9226Ve6thdSn
         TZ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iGqgvezQ/AlpTuqgVROWAp2lac08ioX9ghbgFT6R5zs=;
        b=QoUUTu6gpiTmVsYK8y3Ijg4SzstiLmNA5ujIjlHodJotRp5Uc0gTloUR2xb+x91bP/
         b0BdkmLMPjwV19wWc+hXrvaF5Zt3oOZ7t85BeaxAYF3nlwv0ToCqmvvdvJwCJaAkf0rm
         64ikb+s93t86tHm3xXunNlMmK+VLh9mizRbU6vrQ2li/Jz1xh24aphbTwBsVEswZXYaA
         XpG+GhpreRGZx5mSArPouS+4JHVKSIT/E0iTSr+5APumqTHSQZxlF1cidHRivmH9SWjF
         C4gOXAHRRWPCEZrIlBlXTn/QLJd/N3uCpTBh3j73hXjLEEzQXz4+2HAQpwcaTngPeMNB
         /oMQ==
X-Gm-Message-State: AO0yUKWlGl4lfdZN5+/PccnuEAZ69M8z3d0ePAIqGYhNlgU4TGNwkpPo
	UOmLps/pSnwdD7Uk2AwMLeU4xA==
X-Google-Smtp-Source: AK7set+cnIlp7JbMlNK7BW+W2Y23IVQIWZv8DFzQh9nYmsI7NrsZq7emEqdZjMsHA/iQQGK1DvKKNA==
X-Received: by 2002:a17:902:f54c:b0:196:f82:14c9 with SMTP id h12-20020a170902f54c00b001960f8214c9mr17447443plf.57.1674843974605;
        Fri, 27 Jan 2023 10:26:14 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jc5-20020a17090325c500b00189d4c666c8sm3195219plb.153.2023.01.27.10.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 10:26:14 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v3 01/14] perf: RISC-V: Define helper functions expose hpm counter width and count
Date: Fri, 27 Jan 2023 10:25:45 -0800
Message-Id: <20230127182558.2416400-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230127182558.2416400-1-atishp@rivosinc.com>
References: <20230127182558.2416400-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_102617_801254_33802298 
X-CRM114-Status: GOOD (  19.71  )
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
