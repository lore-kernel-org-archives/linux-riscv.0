Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E3A2C61DA4
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jan 2023 19:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oJcXk2WfWzHIYz60jzo/m6uuesMARcWMYKjFwDSVHi8=; b=UoB7/3QGIpTXrs
	audsxJWNU0Iv8KWFGHay3UunEnZApBTVFOAekF5Bwlvo5dE981FxU0mZh1sMNdmpuOnrb3H7EPZMn
	gmToMTQJuQ2fVmZD+MxTZ0uXeAxHat1mqtpbm4HY7EvtI1UipkfVMzkUMtBnDIJK2QQkSTGERhI9+
	z6z+e1qir7lOM54NzjH9FGyHNcqv5JCIUVYry1q7Ohdta6AqgogENcxR7E/891ff9UAhKWB/8Dapi
	vRsGH58BDIaprNERNkI3Kc4Uf9J0iGWWsQfWdAxnN7vF6cCrEyljHhgm7HBOhHiFmlHM27xAK8JhG
	bl5xNBk145e5tFB9+4IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLURY-00G7Eq-EJ; Fri, 27 Jan 2023 19:31:24 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLTQX-00G2aR-N9
	for linux-riscv@lists.infradead.org; Fri, 27 Jan 2023 18:26:21 +0000
Received: by mail-pl1-x631.google.com with SMTP id jl3so5859401plb.8
        for <linux-riscv@lists.infradead.org>; Fri, 27 Jan 2023 10:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KYWMw/n0BP2d3D/fZxV/dnS4sydraPBd1hVs+eTWwR0=;
        b=5SsgMGoBXHhIzD23Jk2Wrz+EZw8bMtxXJLNk0wFmsOJBSWE7hahtcntSP1xluks06q
         F4tpREigjqJsBQUZsoDI0Fp/bMW5RTjXukaW7hdzjzL0MuyLhW7Jj91PTJ33Y+Op6Cq3
         YaFCkgVMTVfM3UAp/CxpiOJX28RufdzQ8BFAh/P4zkQhBZdFsQc7LSy7eQOmm0W5tcVn
         mQyCpzl66nFnLyhVaXR8gRnQ+qnIOUjheSOJ+TWasvJvxcNsLJrTagTVV5e3TtFCkiAO
         QRkPrt4gPmKNuWt4IJ1Zpidq8ApG+FbV/pS9F/NdjeQuWwVOQNizjoqWj/5jh3B4rpDD
         hjOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KYWMw/n0BP2d3D/fZxV/dnS4sydraPBd1hVs+eTWwR0=;
        b=jPRCRiuArw1lnEp/UWI6bUkGwsaEIHpe1uOlcvUixgUCWCIR1K72xFO9FCLhxD9//x
         yuclizJykpUruDp0PjszbaZTm0oEzIvtozoHtsRLgYEwQQdSjCnFhJ2UHCwbdZl+4sPn
         ktlhtNhtXnmuDnN+1ETo2WoklN6jTF3QyD6X6DcUlmNIWye1ueIymjKYz13rHsj0TwYF
         lVQBO1/qWz1LiW7TR657FlfVwZcWLeTd6rXsspYwTyE8YUfsQD/o2gwr0/I4ytPAv+xG
         waqK68QfAI38+o9hAE1MKiLQKs/tx4FtQXv4pozBjanJr8z3AH4gUk4BZXzxmfYWBrr1
         /v0g==
X-Gm-Message-State: AO0yUKWpovgi8kqASu8qzbe9rLJugIdm3/LyKM4U67vInAjE1Baq/+to
	YhQZLJjiCKab9bw8JOdNHbTDJA==
X-Google-Smtp-Source: AK7set+80tZlWEazZJQny1V/H72lavqxOnKlR5PW19ig21vuw4w5xUFIWAyoQtK6XmA8YOeUdGzgiQ==
X-Received: by 2002:a17:902:d2cc:b0:196:5cfe:70b2 with SMTP id n12-20020a170902d2cc00b001965cfe70b2mr1873451plc.52.1674843975472;
        Fri, 27 Jan 2023 10:26:15 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jc5-20020a17090325c500b00189d4c666c8sm3195219plb.153.2023.01.27.10.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 10:26:15 -0800 (PST)
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
Subject: [PATCH v3 02/14] perf: RISC-V: Improve privilege mode filtering for perf
Date: Fri, 27 Jan 2023 10:25:46 -0800
Message-Id: <20230127182558.2416400-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230127182558.2416400-1-atishp@rivosinc.com>
References: <20230127182558.2416400-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_102617_801599_915CB17A 
X-CRM114-Status: GOOD (  14.91  )
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
index 6b53adc..e862b13 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -301,6 +301,27 @@ int riscv_pmu_get_hpm_info(u32 *hw_ctr_width, u32 *num_hw_ctr)
 }
 EXPORT_SYMBOL_GPL(riscv_pmu_get_hpm_info);
 
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
@@ -311,11 +332,7 @@ static int pmu_sbi_ctr_get_idx(struct perf_event *event)
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
