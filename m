Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A2ACCA482
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jul 2022 17:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/rjudCctmRN47tvBAQZmeAyzaXIqEMywAmOzpc0BIkg=; b=h12W47y0kGDRzI
	Vxoh7FgEW6BqaT0hQ3G0+CgUmF8Un+X1vb21g6oDwuK4FiUtSNN+w0LVSR61jBH+wqf2LgsSgbrqk
	psI9DIsvuFFxJPRB8nmhCHYCW708Cn2XrmVxG47uZ9I450QTjP49JtRUL8d8K4G2jw/UZfobWuo96
	BN9KM3fYiLbXIeCnMojwjDDlD8jigaXfSH3EPh1tlXv8CbC/FjtmnvExKJa1VHdOEIDkqKjZLjjCi
	5ZNbbXjNvtV0iHkJNW5+stjr0F5BR4JKEMZhQOqflX9xVrjZPziPa/1CcZHhxk2B+AxsmdFmFTrsk
	uQYLG0joe2DsvFNBJlWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDUBt-00Gzme-QH; Mon, 18 Jul 2022 17:05:53 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDUBn-00GzfL-EJ
	for linux-riscv@lists.infradead.org; Mon, 18 Jul 2022 17:05:49 +0000
Received: by mail-pl1-x633.google.com with SMTP id f11so9585528plr.4
        for <linux-riscv@lists.infradead.org>; Mon, 18 Jul 2022 10:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H7ChdRBKS+9A003EiQbM2SMDrKCCYQePnInXhSsyMB0=;
        b=2V7H54kc+3zNv1TcuveEZhkWNgIt1ocwR1qZtOLzfciyvULmAUYAVdSYvDM/LMqPW7
         B2K1L+wSiEDZFuMDMucw3/YkGg89OijRh8dtnIplDxavoLr+HLhF1RSyQXxCnRG/72Tf
         KHeNwRoBhGw0rXQdnYIWadk5aSrZwLj7I/0cV0ZkgQrHx0ezw5iLQkZg1Uak7Z5I0sqE
         qFLiHdxohtP+MR29CMLuGTlZRid3ndTvwyv2IFhPeeJPuBbWKdNqbpz4KKb8bRDh9SWd
         v8nTz6wqG+l9bP6qNs15D6dX6qH+nOrr4SmzAUcKI22h5JluwKsyWFI5ud4IQSpY+eeR
         W4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H7ChdRBKS+9A003EiQbM2SMDrKCCYQePnInXhSsyMB0=;
        b=6O2udeKiJ7Eb83LtJtyxugFa/vmdTd/OgrkDyJlWG8MB0rfOng4Zb3TtjkPOeroF/P
         u4mrvVGRJCm6A9dJRuzGvXVmxciTGLnbzp5Gzjr+dO00Xeb4GUnfIJ1mFONOwuuWpN22
         IBmOg07rtrga5gYjXA2B83zIYcSdEdUb0YTIR65HJ6qYJh4x4Rw/dHNnT/Tu+tFtqHCl
         Jko74s6cAcFJh9+u+O+Xjb792nVrg3U6LSv7tnrDZSmsBMXY0m1t4xzpHyQYW5asBzh/
         2y7sgmKT9nth0QH0b72IqmhhS1/2zPB0v043ywqKutmuu92RdBOtcKWTeAbMTQX+VCEL
         gRjg==
X-Gm-Message-State: AJIora9iB1hul2clU/ALd+uSYIxmaUsGLuAE6ieClvy277bzBOu3uMc4
	S1n30U+n4KgmYgK8Yk8lKDERyA==
X-Google-Smtp-Source: AGRyM1uvFkWFiSwIv2bxiYnsB/Me0O2umAIdMXnBAJupJyduccoZ2CTvIm6kzqVVu3DQdq7Cn7s+hQ==
X-Received: by 2002:a17:902:a413:b0:156:15b:524a with SMTP id p19-20020a170902a41300b00156015b524amr30012463plq.106.1658163945893;
        Mon, 18 Jul 2022 10:05:45 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id r10-20020a170902be0a00b0016bc947c5b7sm9733402pls.38.2022.07.18.10.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 10:05:45 -0700 (PDT)
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
Subject: [RFC  2/9] RISC-V: Define a helper function to return counter width
Date: Mon, 18 Jul 2022 10:01:58 -0700
Message-Id: <20220718170205.2972215-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220718170205.2972215-1-atishp@rivosinc.com>
References: <20220718170205.2972215-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_100547_534562_F1AE7379 
X-CRM114-Status: GOOD (  15.00  )
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

The virtual hardware counters need to have the same width as the
logical hardware counters for simplicity.  However, there shouldn't
be mapping between virtual hardware counters and logical hardware
counters. As we don't support hetergeneous harts or counters with
different width as of now, the implementation relies on the counter
width of the first available programmable counter.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c   | 25 +++++++++++++++++++++++++
 include/linux/perf/riscv_pmu.h |  1 +
 2 files changed, 26 insertions(+)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 1723af68ffa1..5d0eef3ef136 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -250,6 +250,31 @@ static bool pmu_sbi_ctr_is_fw(int cidx)
 	return (info->type == SBI_PMU_CTR_TYPE_FW) ? true : false;
 }
 
+/*
+ * Returns the counter width of a programmable counter
+ * As we don't support heterneous CPUs yet, it is okay to just
+ * return the counter width of the first programmable counter.
+ */
+int riscv_pmu_sbi_hpmc_width(void)
+{
+	int i;
+	union sbi_pmu_ctr_info *info;
+
+	if (!rvpmu)
+		return -EINVAL;
+
+	for (i = 0; i < rvpmu->num_counters; i++) {
+		info = &pmu_ctr_list[i];
+		if (!info)
+			continue;
+		if (info->type == SBI_PMU_CTR_TYPE_HW)
+			return info->width;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(riscv_pmu_sbi_hpmc_width);
+
 static int pmu_sbi_ctr_get_idx(struct perf_event *event)
 {
 	struct hw_perf_event *hwc = &event->hw;
diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
index fc47167e000c..6fee211c27b5 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -72,6 +72,7 @@ static inline void riscv_pmu_legacy_skip_init(void) {};
 struct riscv_pmu *riscv_pmu_alloc(void);
 #ifdef CONFIG_RISCV_PMU_SBI
 int riscv_pmu_sbi_get_num_hw_ctrs(void);
+int riscv_pmu_sbi_hpmc_width(void);
 #endif
 
 #endif /* CONFIG_RISCV_PMU */
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
