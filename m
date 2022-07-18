Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D8CC43334
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jul 2022 17:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Au9HNYeHqrW7SP+Jk2fF8P4+95YHmVGVj+Agij8Wxh8=; b=mdpbQB7F9nrqFx
	H9G6UbsJYsUickP3WCv1bGrAzzKwRDaXmIaYzkgLyE1TnlXdJ4eUhahShPUNRTFfTltbUp/LqHHRZ
	PkhN8ClFzGoOWjKC4QOo7c7z2vlmFjHRg/xafReYzZAWq5gZarX5zuOwijhysIJTKl+0cxiC8/Kvr
	yEJl+8HXd2GevFg8JumxeLOFvtgFFX9LWdkGTRWko8EP4qpsS0wSen6POfTXdaMaKLqzg7DjJDeW+
	ipcNJb8q97bQH/gLUUqOBKve9QFfjYUBJpT4/8mIeDRo67cn1O4+ETMh3HwzjCysEUQbTcUMtlNAZ
	XKcAHpqA9jQTeujhbDNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDUC1-00Gzsr-9y; Mon, 18 Jul 2022 17:06:01 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDUBq-00Gzi7-1S
	for linux-riscv@lists.infradead.org; Mon, 18 Jul 2022 17:05:51 +0000
Received: by mail-pl1-x635.google.com with SMTP id 5so9580069plk.9
        for <linux-riscv@lists.infradead.org>; Mon, 18 Jul 2022 10:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/3vtOzL7H/3FhOEqt+TCzYFt3aLP8b6PmqU5Yxo7Fj8=;
        b=4uEa5LBy0DKcY8uwawFXfJDcyP2Fi+jae6+kTt2b2wiPbEE7wbhzRSXq/FBGMgOi/f
         hw86VLNxjdNtEI0yE51+u//XmslDWbju8DkFTny20OYQvzxqBoeGLkiEKPgITsrsNH0h
         qQRnpeE8Hwj4q3l6kiYjSyvG3r9D1tENLERXnC58erWdoBU1yy9KVWDXVVuCJbNyZVMu
         sq8BZOG2Ng3wxgfDGCyKf5yxkMdcvfdb+2Bf7FYJ4fM5MEmBHRL43SS/HZ+TFCiGQNl/
         eungSt9TWAodD9oHT7M2KCyNnNMMLzfGz5/ts/D2ADF68OzVyKx2zafdBTLeTq5jeMw+
         oYUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/3vtOzL7H/3FhOEqt+TCzYFt3aLP8b6PmqU5Yxo7Fj8=;
        b=yohqnVBL9neuf4p9p3uv9YCIkdhnapuCFgqycAuv/nfVlFg1c/+VDvirFnvGGC+6/Y
         +p4lX+W69RzZlHgmSAvIiKw89JrUQ7gE4QDLK6u9f81M54HmOA2UqJO5zeQfWb8kTp4Z
         I0IZwFmCMlMhuLmdCk6xscVCmxOeEpKPX2JimEWTIzRXGhydQGorc8DWnS9PD0B2wfek
         mfBTfKDiGePcJ+AoVg1IhZKaBFcNYbwjZTVi9gbjB0o4H30J5eKGBQ5kwtJMXLmj8y3k
         5Va8FX0Ly4wtMxROXRG3P4T5vyZ/sULDOaiG5PmEQFimQULdE45qs1f8AmN9Dxs0BWwm
         fTKw==
X-Gm-Message-State: AJIora+P5ErqDwtoHS3yi1B/Elt37vZskPMnDgQ2cfJ7IA6bN3ytiZJ/
	5ibPBqge/jL2IC5tN3R6rmg4Hg==
X-Google-Smtp-Source: AGRyM1uSWzV58VCzHYwLZkTFFYZNxcIXLVpIo0ybe2iNKjofq3fVvwFRP5hLtK6LTf38a8cYPsHKQw==
X-Received: by 2002:a17:90b:388e:b0:1f0:3d7f:e620 with SMTP id mu14-20020a17090b388e00b001f03d7fe620mr34153286pjb.31.1658163948380;
        Mon, 18 Jul 2022 10:05:48 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id r10-20020a170902be0a00b0016bc947c5b7sm9733402pls.38.2022.07.18.10.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 10:05:48 -0700 (PDT)
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
Subject: [RFC  4/9] RISC-V: KVM: Improve privilege mode filtering for perf
Date: Mon, 18 Jul 2022 10:02:00 -0700
Message-Id: <20220718170205.2972215-5-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220718170205.2972215-1-atishp@rivosinc.com>
References: <20220718170205.2972215-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_100550_139599_994DE4E1 
X-CRM114-Status: GOOD (  14.94  )
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

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c   | 27 ++++++++++++++++++++++-----
 include/linux/perf/riscv_pmu.h |  2 ++
 2 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 5d0eef3ef136..34f9fcc221a8 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -275,6 +275,27 @@ int riscv_pmu_sbi_hpmc_width(void)
 }
 EXPORT_SYMBOL(riscv_pmu_sbi_hpmc_width);
 
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
@@ -286,11 +307,7 @@ static int pmu_sbi_ctr_get_idx(struct perf_event *event)
 	uint64_t cmask = GENMASK_ULL(rvpmu->num_counters - 1, 0);
 	unsigned long cflags = 0;
 
-	if (event->attr.exclude_kernel)
-		cflags |= SBI_PMU_CFG_FLAG_SET_SINH;
-	if (event->attr.exclude_user)
-		cflags |= SBI_PMU_CFG_FLAG_SET_UINH;
-
+	cflags = pmu_sbi_get_filter_flags(event);
 	/* retrieve the available counter index */
 #if defined(CONFIG_32BIT)
 	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH, cbase, cmask,
diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
index 6fee211c27b5..825b95253bc5 100644
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
