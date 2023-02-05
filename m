Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5112C61DA4
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Feb 2023 02:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=whG77X5aKWHaNTQftbeKKO0wdqCoZype10YOoLDoYss=; b=x81b66E0N8F+O+
	+AneKcn0M+YpgeRFSroBiZ9LBFtolycCnU5lZu/04KQ8OgGNKsfr09MxHlKEdNGcpNuUeM96jHkgI
	P/0WV0y97jlbe266sw04GpDKRiGtqRxIcVISfb48bV815+quRdfk4LbZXbviEEuE7Og4mTRXeGjwa
	pp1NIcOE2/uLRKjgn5N3tkVr7rz1qcKEq3iNbLb56ZbvDFVy6drK92bI0naII7wKnvueL4kmEAmXe
	a2ys86FtZZ+v64e6f7/5gt2cnd0WwGceklI1Vpryt58fXN7vbiCrJP8x02HSKIipoeanZdyyRi+4a
	6keYuu5tUnJY1vd74zzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOUaM-005rpH-So; Sun, 05 Feb 2023 02:16:55 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOTd8-005oCf-0F
	for linux-riscv@lists.infradead.org; Sun, 05 Feb 2023 01:15:45 +0000
Received: by mail-pl1-x633.google.com with SMTP id g13so4085495ple.10
        for <linux-riscv@lists.infradead.org>; Sat, 04 Feb 2023 17:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zPkrRraxSxPO8Bas1c93CWcZiwYxt6lnwNFP5o7eW+0=;
        b=PnGxq0Ksntq7Itg+YeOS+4xtHTpJRfRn2qVKZXOSX9aCT1nDbSCO8tSNH3Ss9Z6RYJ
         rMHRuCxYPNEAWYlW0U4uPOHGt9f9N01MNHKtkemgQlgRmL3SvhjxWZ7rlGBlRSPmLVIB
         ugtYUzXjgSiiTjJeOvco4hm35WuvFfwTZuOQ/RUOtloUVpB2gH+7k52WMi+p1BOtS/dl
         92QlI6l5gjud3L4agFG4BGQBIrP6DJVlekXnjHkoSsAOSXFvRUPj13p5nAehIXxicszg
         2Z6cvzHr6ouSB+nfLlG72leoJAsSfoMSaPA843qFsqgWGIyV1tlzqeJHre4+3NKVhRN0
         wYHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zPkrRraxSxPO8Bas1c93CWcZiwYxt6lnwNFP5o7eW+0=;
        b=x1GIrjzoXUeHfwMT83qxrL3xX17BZZ3zzT2rX4yaL1H+CmYZzCvy+x3K+9egiAn0zU
         eWiZPpaxbzxibCai650QuAVUf7coJ5IHgKnInkR9oSXLxFmKYhAiWYb0FIqfRJP9MLjQ
         ub932we2iR8l64+elDAPxmG4uDIbOsAJWwGozHEK4ESgD4/YFdMo+HQzE35Lael5lcTa
         RaAZxiFZCFUOQe5FldELQBC3pBNSv90Ro31xeDZgs0W9X0SIrYIpjuKp0A0GFweBYEtS
         ZTOdUlNfIQkw8AdfpxSfgfkvIA5kznAJavSNkGwoTVGoN0xyZlIZIR3bdKZ6tiyY1Z1g
         CKVQ==
X-Gm-Message-State: AO0yUKUb9ZIfwxFVb57glBXh8dyX/EQgUVtrlf+i79CqaEj9AY5P4rsB
	l9oOVgibUWjIYuEjhsyRoNYrJA==
X-Google-Smtp-Source: AK7set+y355g8GXNv7L+yDXV6nynKVR2hWweLQHKUUCN1zPTxPUe/D4Kdpqr4IkICqzkOYVxiR7GGg==
X-Received: by 2002:a17:90a:e7c2:b0:230:1acb:191c with SMTP id kb2-20020a17090ae7c200b002301acb191cmr15877237pjb.14.1675559724666;
        Sat, 04 Feb 2023 17:15:24 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id c7-20020a17090a020700b0023080c4c3bcsm2721917pjc.31.2023.02.04.17.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Feb 2023 17:15:24 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
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
Subject: [PATCH v5 02/14] perf: RISC-V: Improve privilege mode filtering for perf
Date: Sat,  4 Feb 2023 17:15:03 -0800
Message-Id: <20230205011515.1284674-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230205011515.1284674-1-atishp@rivosinc.com>
References: <20230205011515.1284674-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230204_171542_193202_6DB3B627 
X-CRM114-Status: GOOD (  14.41  )
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
Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c   | 27 ++++++++++++++++++++++-----
 include/linux/perf/riscv_pmu.h |  2 ++
 2 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 6b53adc..71174fa 100644
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
+	if (event->attr.config1 & RISCV_PMU_CONFIG1_GUEST_EVENTS)
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
index a1c3f77..43fc892 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -26,6 +26,8 @@
 
 #define RISCV_PMU_STOP_FLAG_RESET 1
 
+#define RISCV_PMU_CONFIG1_GUEST_EVENTS 0x1
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
