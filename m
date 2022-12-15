Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C2EBC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Dec 2022 17:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NJy+8pD+KiOU+oPxJ+k5fWyvoO/oa/fb+UbOLN/rRis=; b=Ij51VfMOgu+vwX
	mktplBfaqEyRkhNHXBOaGWDwv1A7atr5JVPTB8t2xYDqiH8oJw97GMwsL0r0oyNdPJYMm+UclV5UR
	i6XrHdzJavyIJsffzMkDvq0HqJfLRB9kshpA+FfiOwZeklHs3oJU3pO9hkBkl9YpStp+9l7+NsK6C
	U441E7Tb479wPRMt2apYFT6k4VSN5FEk6JpMajGqfQji4j231wQyP9s2IYu4+ywfbMdxjMoJTzOwk
	TnrvjGMSPyUB5ISxGomjDMlUvKGkGHHGdG/F/rSvBmsBTYcy1P5FBiBXEQndR6/rDiSpJtkeVbqZc
	+KiTsGns/kZF2Ox5sZfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5rbr-00ARZ3-LU; Thu, 15 Dec 2022 17:01:27 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5rbf-00ARQY-Ot
	for linux-riscv@lists.infradead.org; Thu, 15 Dec 2022 17:01:19 +0000
Received: by mail-pj1-x1035.google.com with SMTP id t17so11117491pjo.3
        for <linux-riscv@lists.infradead.org>; Thu, 15 Dec 2022 09:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8UQoyiEMzZayNPrzOS74SA9Pd1KLiR2v7Duf4rg8J3g=;
        b=UAgSXYLuvbe///7YzrpECjJchZRf3ZJZwA/r4+GphgGaI9L5qrog/0ptTEi4FipTCq
         8oyERWkfNJNO0+ifqqfWSpsQ4VyO12DU7QFG4rxK17vvfXQuH/bBx2l0JMklzKm4dPJc
         0x7Ml6eLQQD2KGtoYrBAXhzsWJYvwUdw5EL4qFli/S4dC7YX6TcPKRU92VxngtG8ZaRt
         pLiHdJLyeEfciNiI4NKkKgVdvnhW5tiAXcqlQXK2QAL/ri+nHE37JQHF9AOKEuFOyPfi
         1ATBIsvJjpRIyP9aoqoA6Xl7jYupO8S1OcnEVISz7vDYlnxIYTCmRdtkxhZG6k9Pgiiq
         gzNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8UQoyiEMzZayNPrzOS74SA9Pd1KLiR2v7Duf4rg8J3g=;
        b=AhSveQ9ydUmMspnikfMYYvsO1HSuy1pjzTDox/aBjbNDI7bpR9fTBrE1Z8MZBrYa+L
         OmDCDNPmNI4AHMm0I1jywlHKHDitNwY4ItEvvuSNPH1GkmViEeN9SOn61xgFV6uyIbna
         6VHQcoIStB1LuooaSAD05wgNusEXOJ6F1E4CGH3y6NyLmP40W/VIseEh5e21GG+dSocT
         llP1f3JxZr6rKaALZkjtuHnqKL33jRKZVauv+L1QXMVjR0J4Zp9i5rZTOwrg3PPB1vPT
         MFRH8l1nkZ+4RPpD7qstElU/aweHqQx2jVqkWaGvOnyn1IKQInJtPOSM2xUgjR0tnOfj
         ZvZQ==
X-Gm-Message-State: ANoB5pmjAN6YbgUoo3VAooz/NS8LtT4fuulTVg4mgmzolnXfWtvJSAb7
	oSSbnFkIi8K41PKKkvumCGRDFA==
X-Google-Smtp-Source: AA0mqf6UHWoIuoaWq9x/mAhH0wEv9S4WHB2b/UkNzG/XUxl1VI7WMWM/ERSSUoFGbDBrX5NU1f6TnQ==
X-Received: by 2002:a17:902:ce06:b0:188:bc62:276f with SMTP id k6-20020a170902ce0600b00188bc62276fmr33227103plg.3.1671123674146;
        Thu, 15 Dec 2022 09:01:14 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id p10-20020a170902780a00b001897bfc9800sm4067449pll.53.2022.12.15.09.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 09:01:13 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Guo Ren <guoren@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>,
	Eric Lin <eric.lin@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v2 01/11] RISC-V: Define helper functions expose hpm counter width and count
Date: Thu, 15 Dec 2022 09:00:36 -0800
Message-Id: <20221215170046.2010255-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221215170046.2010255-1-atishp@rivosinc.com>
References: <20221215170046.2010255-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_090115_844571_B2819A94 
X-CRM114-Status: GOOD (  18.52  )
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
 drivers/perf/riscv_pmu_sbi.c   | 35 +++++++++++++++++++++++++++++++++-
 include/linux/perf/riscv_pmu.h |  3 +++
 2 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 3852c18..65d4aa4 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -49,6 +49,9 @@ static const struct attribute_group *riscv_pmu_attr_groups[] = {
 static union sbi_pmu_ctr_info *pmu_ctr_list;
 static unsigned int riscv_pmu_irq;
 
+/* Cache the available counters in a bitmask */
+unsigned long cmask;
+
 struct sbi_pmu_event_data {
 	union {
 		union {
@@ -264,6 +267,37 @@ static bool pmu_sbi_ctr_is_fw(int cidx)
 	return (info->type == SBI_PMU_CTR_TYPE_FW) ? true : false;
 }
 
+/*
+ * Returns the counter width of a programmable counter and number of hardware
+ * counters. As we don't support heterneous CPUs yet, it is okay to just
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
+		if (!hpm_width && (info->csr != CSR_CYCLE) && (info->csr != CSR_INSTRET))
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
+EXPORT_SYMBOL(riscv_pmu_get_hpm_info);
+
 static int pmu_sbi_ctr_get_idx(struct perf_event *event)
 {
 	struct hw_perf_event *hwc = &event->hw;
@@ -798,7 +832,6 @@ static void riscv_pmu_destroy(struct riscv_pmu *pmu)
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
