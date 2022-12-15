Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A0F1C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Dec 2022 18:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vvCsuj3ViEWLBNXdZsVQ+XciuIhHkWz4Zmmb+YT1fwU=; b=zAL5vpgPf9z9Lh
	Qy/UBM4QTd1/Z1rIB/azbw/P7Aef/IjLGYsS5AfyZS6Nkz0JDq04pkdTh314rQTd4AQa7/RWISudt
	5lH8V9ooSTYJjlU2efGI3SrisgGx3qUanQQoIuhbgCwP7GTYZoltA9f7slsV+8Ru+ECiP+GzczSFF
	7S7eFHk5J6Mfnz953GpmWGhw60nwH6mLx4YVh/7auZwuRzUWboooi03hYylei2WhMtNkZi1TKbU/h
	EhMoNlP+d5nF0eeXtigwLFQKWEuWJ8EITtjmKdmveqA0rvwGGgCMobBQGFAepMn0nf5aucU9xdrP2
	iwjpATw6Jdgmkft/XQhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5smH-00An5a-DQ; Thu, 15 Dec 2022 18:16:17 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5rbj-00ARTt-D1
	for linux-riscv@lists.infradead.org; Thu, 15 Dec 2022 17:01:22 +0000
Received: by mail-pl1-x62e.google.com with SMTP id n4so3844037plp.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Dec 2022 09:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TA398QcoRw04Vi1tCToQyhK2GccVMIkF9itdIbQrjzg=;
        b=iCBFE98jjH1B+jWMupgkTrrpBiqryRet5vyKfU7xYz2IrRVevL7rN4/R8A1XGxSdrD
         S7lP75oLwz8r/CmXjPNMEcn116Bp8Pph6YlSIDoJD9xM/0Y5fCGJ7RDpT5PS4h43v3Az
         sUmCxrLeGrYguKN7cGHsUksEb4w8uhufJikxuzvkuL7Jhdbrlz/I0lAFSnrI5/aNNVF7
         tDv74BKoI3m1btLXcPGMdCgjwWFcXVingmbKafWVyv6c4LUftSPSXRnkHh87ucAMEApM
         ijBLm3eRnw77G8KAHXEW91Fcfhvz+E/HTZKoachHXH/vKtbBaoUYsA3VwkLs26TGRH2j
         nexw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TA398QcoRw04Vi1tCToQyhK2GccVMIkF9itdIbQrjzg=;
        b=lfgD7AY0b/y1ONNuJ72MKCyPrl3HQfmQtWnYAqo4uHMySKYze7jMBIe7PbwKOVXyT/
         rxMsQwNLAm23louBFdYxuUhu7/CGON50sI/d9TbkwvT4Eno/PdWdHTfumgAAOUCj1bpZ
         JX6TDhrUkf6yag9RrWuKINLBZGnrx32elRjMgR9yCd/4K1h4eSA2AAR4nbLoG/oD087x
         gt5brlAaJsjJPEX45eJvPLOLWGJmeBLM7VgWAKwuEyy3RAu6Hb3XcKoI9C8lwia0kxsg
         bq+5wL+8KNNjxKIbw+X/ATNH+3RqpUWOBjXJIIaWUlxCvmstcyolLb3n17IPJDRaHUn4
         LDSg==
X-Gm-Message-State: ANoB5pkAQX60aFqjge0PwdmHk6nWQ+Ceg1vQMVlZlFRepbrBl9tKSa92
	uCAvYPj6/eLgbFBg2uokHzyWCg==
X-Google-Smtp-Source: AA0mqf47OVooaAtiLeQdMDJXJiy7Bs5Hr2tNJlG8coYqXqFyYi7GgQGyDqsU+jYbG5rwf3pgYZ6MqQ==
X-Received: by 2002:a17:903:2448:b0:189:f277:3830 with SMTP id l8-20020a170903244800b00189f2773830mr43509522pls.68.1671123677816;
        Thu, 15 Dec 2022 09:01:17 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id p10-20020a170902780a00b001897bfc9800sm4067449pll.53.2022.12.15.09.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 09:01:17 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
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
Subject: [PATCH v2 05/11] RISC-V: KVM: Improve privilege mode filtering for perf
Date: Thu, 15 Dec 2022 09:00:40 -0800
Message-Id: <20221215170046.2010255-6-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221215170046.2010255-1-atishp@rivosinc.com>
References: <20221215170046.2010255-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_090119_463157_65E15B77 
X-CRM114-Status: GOOD (  14.63  )
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

Currently, the host driver doesn't have any method to identify if the
requested perf event is from kvm or bare metal. As KVM runs in HS
mode, there are no separate hypervisor privilege mode to distinguish
between the attributes for guest/host.

Improve the privilege mode filtering by using the event specific
config1 field.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c   | 27 ++++++++++++++++++++++-----
 include/linux/perf/riscv_pmu.h |  2 ++
 2 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 65d4aa4..df795b7 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -298,6 +298,27 @@ int riscv_pmu_get_hpm_info(u32 *hw_ctr_width, u32 *num_hw_ctr)
 }
 EXPORT_SYMBOL(riscv_pmu_get_hpm_info);
 
+static unsigned long pmu_sbi_get_filter_flags(struct perf_event *event)
+{
+	unsigned long cflags = 0;
+	bool guest_events = false;
+
+	if (event->attr.config1 & RISCV_KVM_PMU_CONFIG1_GUEST_EVENTS)
+		guest_events = true;
+	if (event->attr.exclude_kernel)
+		cflags |= guest_events ? SBI_PMU_CFG_FLAG_SET_VSINH : SBI_PMU_CFG_FLAG_SET_SINH;
+	if (event->attr.exclude_user)
+		cflags |= guest_events ? SBI_PMU_CFG_FLAG_SET_VUINH : SBI_PMU_CFG_FLAG_SET_UINH;
+	if (guest_events && event->attr.exclude_hv)
+		cflags |= SBI_PMU_CFG_FLAG_SET_SINH;
+	if (event->attr.exclude_host)
+		cflags |= SBI_PMU_CFG_FLAG_SET_UINH | SBI_PMU_CFG_FLAG_SET_SINH;
+	if (event->attr.exclude_guest)
+		cflags |= SBI_PMU_CFG_FLAG_SET_VSINH | SBI_PMU_CFG_FLAG_SET_VUINH;
+
+	return cflags;
+}
+
 static int pmu_sbi_ctr_get_idx(struct perf_event *event)
 {
 	struct hw_perf_event *hwc = &event->hw;
@@ -308,11 +329,7 @@ static int pmu_sbi_ctr_get_idx(struct perf_event *event)
 	uint64_t cbase = 0;
 	unsigned long cflags = 0;
 
-	if (event->attr.exclude_kernel)
-		cflags |= SBI_PMU_CFG_FLAG_SET_SINH;
-	if (event->attr.exclude_user)
-		cflags |= SBI_PMU_CFG_FLAG_SET_UINH;
-
+	cflags = pmu_sbi_get_filter_flags(event);
 	/* retrieve the available counter index */
 #if defined(CONFIG_32BIT)
 	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH, cbase,
diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
index a1c3f77..1c42146 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -26,6 +26,8 @@
 
 #define RISCV_PMU_STOP_FLAG_RESET 1
 
+#define RISCV_KVM_PMU_CONFIG1_GUEST_EVENTS 0x1
+
 struct cpu_hw_events {
 	/* currently enabled events */
 	int			n_events;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
