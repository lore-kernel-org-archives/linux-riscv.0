Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E82DCA0FED
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Aug 2025 14:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o5NVAXZbIei/wutVy75r+IYcR4hk8tD113UikRTHNwo=; b=wAK9SPbi0JoEq8
	SZwtIwYzT3ph9/wzs+XqqjdlvwHp3s7lZtK0evh2AWsupX1+6L8KEm5VajnQN1eRwfQ4rwFy7H/6v
	Q2ymSrcFJpXnzqPokWK2N5hosF8P9xpn7/4540zrEb97vN3W/LZvl0uij316oJ9EZ8C/44DRja2kr
	SsYqJ2xfYEtBV3bPU8PqEWDsyMO8gp6nLplb7P5w02rzh+eJMZ1w6z2u1FsjS5uNqsUei0G/5fFmE
	0zjoFPV+a/kwqiXA2NNcPG0uKcUrx7HJJFqR4bCb7sa49+ikoUwux+30Bz1guig6s2XSJTECghH3m
	ySuJUE6Fc4qlQL6IkI1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urGpC-0000000Fgot-46LD;
	Wed, 27 Aug 2025 14:08:31 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urD72-0000000EzzJ-0YVA
	for linux-riscv@lists.infradead.org;
	Wed, 27 Aug 2025 10:10:41 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-771f3f89952so652020b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Aug 2025 03:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1756289439; x=1756894239; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JM7gSlpkCi+0kyKyklIFOqWTnKhlvxmA1qdlwzNde30=;
        b=Xb/KHsgQf4s8x4NrV9LYKIQqwAO2CQ4890nSB7tLcw/hMqywlq9/7CwVFhLxhpYbd9
         K0RfcbPpLjIgItJr1Auwqk/O7fpD3Lacf53tvxsCo8G0EdSyhIZquStK8vcKRK82hQNN
         g7K9zhI3JOzsMB7+Y6pT1P5LR0B3D1adUHlSVmeBXuSdYlHKhoPyFN+bO1+sNKoPuTMj
         bWwfJkGtkK5zZvMrwk9QoMvruwwmEkaa9py/JX1MoXUZ8EzGPLFAa0Ig9hqWUj4rw8sf
         aW9m6S1AcUisGx8Z4DY54/0SObLJucv9OuzE5JwBv4Tzk9HizeOyppUbQQUN6ztGRS7j
         Ikfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756289439; x=1756894239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JM7gSlpkCi+0kyKyklIFOqWTnKhlvxmA1qdlwzNde30=;
        b=BwG/MAAWpkUmMXwNlwvGZnCvNgqe+nt5qWt4YDDFJydCBC4HEKqzqtc3fxv6Wu8eMP
         Eh9jeap0pKlnlkvc76fF0ACQoeTCDhaFV5XL718sxY5DqzFC/ueiMLugnUPUMOy9+Fa7
         UpFtPFqfa61CCLWCmWmTpTWz2BL+7giBQbX7NcZBmPAYVDM498cYQpmC4vbIYRThlmtq
         HPoErf6/er2RT/dis7ZQvD1pvyUp/3wrjX3Tlk2CSLRHNa4bVCpM3KCN/HBPmxJNTwt2
         DmZwKeodnV9syaBdMceOyCYn/YWLmZ5CSqiuLCWkq02Zh/NT78x8C5KMPW3bbW2tzNL5
         5yew==
X-Forwarded-Encrypted: i=1; AJvYcCXE7DC+6xqrW4oshnZJu2MfgvIoKVYTkLPMgptUEeoKGHT3b2vORuxchEOTt6yB1SB3UB1zb5ywAQBgtA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz557UvEnqo2dbZlK0W10taEU09qclPgljPzSfLbQDn+3HGS/d0
	xm+YfzUAW+6zU3eh+wrM4Ud6aiGrLPQ2pawiVUFzGTG/22Ros0rciO4mj3eyRaqSDkg=
X-Gm-Gg: ASbGncu2lfOLdBH67qaHUb3f3h0U3xPODDI+BX92ztFg/iXLZfx7Dovj1n5MUgNZ2Vr
	hrMYPDmJULWyifcBx4pzVSHeBqKmfZHkh8RvMDAeCJBtE3IpYk/d/gxEMjQc2lW0fEhUEUJxLDF
	X42yl/oZl95xjyaStSPyOiW3ktrjWRmyeIdqysrbIRYIDOUrG6FZD8Sd8ZcE1CAifO6S7Q4A8At
	4g5Dk2IJv+xHTPdo7LpdXmKhi8dUfdRElFml6sOXGTT9TPdizcG+X7FiCYTzcQw+PSz3gGovQuy
	o4bZTJqEPemfC9RCqLf0UdG6C+MN0WzYphwsO5AG6gtqbK3YJLr4+1wihGRO4zN830LxW4OfBRo
	zNABTuxCRnsc0tumZHavxu9qlgnYYhHe1ZcdPeFuCk00PXho716izzQQEgAjyZwk=
X-Google-Smtp-Source: AGHT+IGdtKUBscgA9xYMmV3962XLu6gCj63wXPK/4bKpP1nVTjXzqxHi4UVk2L8ckDMtXKsc3B7ldA==
X-Received: by 2002:aa7:88c2:0:b0:771:e341:ce68 with SMTP id d2e1a72fcca58-771fc292e89mr6337778b3a.5.1756289439091;
        Wed, 27 Aug 2025 03:10:39 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.229])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401eb20dsm12813462b3a.79.2025.08.27.03.10.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 27 Aug 2025 03:10:38 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	atish.patra@linux.dev,
	anup@brainfault.org,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	catalin.marinas@arm.com,
	masahiroy@kernel.org,
	suzuki.poulose@arm.com,
	cuiyunhui@bytedance.com,
	maz@kernel.org,
	zhanjie9@hisilicon.com,
	yangyicong@hisilicon.com,
	dianders@chromium.org,
	mingo@kernel.org,
	lihuafei1@huawei.com,
	akpm@linux-foundation.org,
	jpoimboe@kernel.org,
	rppt@kernel.org,
	kees@kernel.org,
	thomas.weissschuh@linutronix.de
Subject: [PATCH 2/2] riscv: add HARDLOCKUP_DETECTOR_PERF support
Date: Wed, 27 Aug 2025 18:09:59 +0800
Message-Id: <20250827100959.83023-3-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20250827100959.83023-1-cuiyunhui@bytedance.com>
References: <20250827100959.83023-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_031040_187759_821436CD 
X-CRM114-Status: GOOD (  10.47  )
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

Reuse watchdog_hld.c to enable HARDLOCKUP_DETECTOR_PERF and
add Kconfig selections for RISC-V.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/Kconfig           | 3 +++
 drivers/perf/riscv_pmu_sbi.c | 8 ++++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 451eb23d86c96..214b1ead5781a 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -184,6 +184,9 @@ config RISCV
 	select HAVE_PAGE_SIZE_4KB
 	select HAVE_PCI
 	select HAVE_PERF_EVENTS
+	select PERF_EVENTS
+	select HAVE_PERF_EVENTS_NMI if RISCV_SSE && RISCV_PMU_SSE
+	select HAVE_HARDLOCKUP_DETECTOR_PERF if PERF_EVENTS && HAVE_PERF_EVENTS_NMI
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
 	select HAVE_POSIX_CPU_TIMERS_TASK_WORK
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 8c1ac7985df6c..c5423a046d016 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -22,6 +22,7 @@
 #include <linux/sched/clock.h>
 #include <linux/soc/andes/irq.h>
 #include <linux/workqueue.h>
+#include <linux/nmi.h>
 
 #include <asm/errata_list.h>
 #include <asm/sbi.h>
@@ -1102,6 +1103,11 @@ static int pmu_sbi_setup_sse(struct riscv_pmu *pmu)
 }
 #endif
 
+bool arch_pmu_irq_is_nmi(void)
+{
+	return IS_ENABLED(CONFIG_RISCV_PMU_SSE);
+}
+
 static int pmu_sbi_starting_cpu(unsigned int cpu, struct hlist_node *node)
 {
 	struct riscv_pmu *pmu = hlist_entry_safe(node, struct riscv_pmu, node);
@@ -1525,6 +1531,8 @@ static int __init pmu_sbi_devinit(void)
 	/* Notify legacy implementation that SBI pmu is available*/
 	riscv_pmu_legacy_skip_init();
 
+	lockup_detector_retry_init();
+
 	return ret;
 }
 device_initcall(pmu_sbi_devinit)
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
