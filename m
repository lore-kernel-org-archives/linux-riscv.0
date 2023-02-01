Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4DC8C05027
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 00:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VFBxC+ZBj1jPyJtM4/GWyESohdT/5Dvjzxkr/HQHgik=; b=arABzHlda202Vi
	qBWR0onCUabhw7WSjYRyUu4G0hiw8VQKDGtrtkf8w25I+inHruHDnVPFEheXwQ/Kdtn8GaMxk4nx7
	8ab9J94V89aGK0F/haY58leCPAm/cutYNfVvz24RfJR4fpyTx7WyjnzrxgO+dD5opSjuYOvwTgXdx
	H/HkCX8t0MNsalIpjJXV3UCxFzf6kesVb461oY92difjvQKifChwKlQeyrHGbgK4UqPt+MfY5M3F6
	vCpcA4cIANRFvp/B1tJPcFoyGpG2oPqn3RTURIdR8WAoOQqOi05F0tdahN2k4Ua6yeMYeWSvHtyYl
	P/kWQORQluowtM2ylwSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNNGh-00Dwjn-67; Thu, 02 Feb 2023 00:15:59 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNMHs-00DrKl-GR
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 23:13:11 +0000
Received: by mail-pj1-x1030.google.com with SMTP id ha3-20020a17090af3c300b00230222051a6so149288pjb.2
        for <linux-riscv@lists.infradead.org>; Wed, 01 Feb 2023 15:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=onmGdXrnry2vzffi8Nhu5Xp1RppTFZNrejjmetcLTEs=;
        b=mwaH9OwJ6npnyit++cTrdcB7gWWmafNtH0mV16h6tJ9HLeouQJLd2FzqMcs04z5/8/
         pEs99izSSLF03rf2tVL6ghwFMiP0RsH9AylohFlJZJ5VHvaV/BrCbVotfozeKfaEEQrV
         hJe0/LIvqVwKCSxb6kiUNLeOUpggEzMrXYmMZ3asoKVqSXRXL+Ouu1uSklM4rlvwUFWN
         VJKB3Y780Ur9bjNwCjDDQD9ubKiFOermULTKn+kGdN+p57Bc0QA3lb45NtAgS+ICsw93
         wug/Wu+IEwWeDBD13IFMh3qzaS4y83QLZifn7LWKEq1nl6m5NkcKyc68fkSvA1Cy4kPV
         lW1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=onmGdXrnry2vzffi8Nhu5Xp1RppTFZNrejjmetcLTEs=;
        b=W9LR64kPmfvyxOYeguQOX6lyZw2Xvpn8Z7JyKk8nreQEzSCTE1AYMRPVxXFn60R/NB
         Jb2jdJpKaYHU8KYKz+UTS626yUL4cC7z+tUrPqf4JZ9TvV5GCV3o24GhwMHyhprPH6mr
         M4VObunh1EgjwFvGkT6zbhEdcAM1ORiJUfVAnYLkjY6sMW7Q5jy1+ncZJAeUVm4GpmQX
         ive23fyEC+nPdFUJY3hXy8JlYb/2D7DxcjnTlz2hZJPHaSzxH3CpUSu+5sq0DjGFMno1
         Ct4SGC8pTXErDhX55bHvoa4E8GRFmf9gJP020Q8Kbfv228PDzchnltFX0poazgofa1JY
         YmIw==
X-Gm-Message-State: AO0yUKXAtyiXRm4a0RwtWTVVXGl4Ks+ixmdCj2wQT4TLiNad+dqiCh0F
	A3+srY1ofewmzJGHtx2ko7+OCA==
X-Google-Smtp-Source: AK7set+jo5+wHuuLA5aFbnELNbEvc0p590K2fazE0b1l14XbgxMtPKXok8+umitAQcALi0t1abpc7w==
X-Received: by 2002:a17:90a:312:b0:225:d450:2ccc with SMTP id 18-20020a17090a031200b00225d4502cccmr3995336pje.30.1675293173726;
        Wed, 01 Feb 2023 15:12:53 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id t3-20020a17090a510300b0022bf0b0e1b7sm1861774pjh.10.2023.02.01.15.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 15:12:53 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Eric Lin <eric.lin@sifive.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v4 01/14] perf: RISC-V: Define helper functions expose hpm counter width and count
Date: Wed,  1 Feb 2023 15:12:37 -0800
Message-Id: <20230201231250.3806412-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230201231250.3806412-1-atishp@rivosinc.com>
References: <20230201231250.3806412-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_151308_610285_21C65925 
X-CRM114-Status: GOOD (  20.06  )
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
