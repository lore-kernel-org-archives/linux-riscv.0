Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D49E5CCD185
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 03:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sAVeQvKqYx+VDz3Y4YVPcAu7m6JksvMu3DNPJDQnxS8=; b=3B51S3P+L8BxSw
	2aTxzrkW+lwOo9Ap2M4fE3DzrryAJ7zjgdzu5c3zH4fd04Zp9vy69fZkataM/7+QKpCxr8Sywfz82
	yM2cUp4i3awVkGwGEPp6kCgjUVEUqox0XhEFwS0aVqCgCs+cIJWtGFCMyvdg1Atm/3gkaXnHVTv9w
	qoISp9DXNTUMe2vp3Udl6vIc32mUO2PB6DDG//tAOVyYaJjDsRpIU2PiTkctt0FL/HmaHkkQxYC+G
	Dk7WGLAhP8xso8PeQaY9tu8jwJJk/JGAvp7r24Zr8umGapVffviC9IeHRZzEWNptjbxg0UDtADQMs
	xhOG4ekmkonMrZvUZiyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8VVL-0000000F2PJ-0Bkr;
	Tue, 14 Oct 2025 03:15:15 +0000
Received: from mail-pg1-f178.google.com ([209.85.215.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8VVH-0000000F2M3-2rQd
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 03:15:13 +0000
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b62e7221351so3967134a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 13 Oct 2025 20:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1760411711; x=1761016511; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6P8xZEQeIO5H4AzeXprUKU3oEf9nN+exJfE8nbRaRqY=;
        b=j8T6oRZ4e/EEadN2F8EaAkreA/jyJqoVuJdmlLtyoy/dgqGAWsYWjTfzz5EH8LqQ42
         183uNoi/f7YgsmShkDMkqmcEdt1tBtLtFWR2sWmnVAirVdYv4rBFsT+HMUxqKkxQNZXz
         hExacsO+pjYFybT410m9kFSLsIA1gng87V3YETyCnpJRPCu69lftB6bTqAmLTrUKOO1k
         iyw8emOnDEizEvzyKAiyt3sMWbMcuNGFW+YO5/75vjQ1j9nVWUrFWbIQSao1+iL2Xll+
         DkH0LuJdinr33UKWt5PoUiS/QBKtK7dK+S0ViB4iJH8b9su3M/cdPQmaq8zZ2W6cJC/E
         azPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760411711; x=1761016511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6P8xZEQeIO5H4AzeXprUKU3oEf9nN+exJfE8nbRaRqY=;
        b=e+NDbLhfoFaBcrq2UpCFo29v5EpiBP2UQQkF9a1Tmivgc8ldUOTaohxEPhyxfA2IV8
         SP1ldtbxmMm+VTlxB2OxCC/Ex+BL7pzCcp8CulRbPhC7ppU5a3K+UVuXXYCyqSYRmyaN
         MF150r6VE4ncNA0CEtbjMjehFm1+8vRuovVAIv9H/AY3tb+laWZmpkSF5728m1GkbG9s
         SMFzfIBl7jJZnsk2naDGCHPIHynTQWOX9tNURRiYlVAeyWU7FdoPPK2m+IEAQERlhvDM
         2Ea6a3E0pHnVZuhW5OMeCHh2U+wxotMJ/1baAi70d/zqYcRviBN0xaM3oe062glaZVXg
         s3Gw==
X-Forwarded-Encrypted: i=1; AJvYcCV3GYrUq3TJhxyt6SnlBu23LsgE/evjvXeLwjgOM9g2AVFNBEMI4s6st0RuQGkF9hwfWr8GTOus+9Kl/A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3uyHOXF9xcV8uypFmILSxtVfsIkxRQmVuaMmaeXzdk7Kdrpg5
	9PwOvP2bKJc2A5oU/3U6nyuxPkj/d7TPV1FC/d2pBnm+BG2Eb1GeUoZyDBSX3S2+HaE=
X-Gm-Gg: ASbGncvTiTvmQx5o5idGIywkeC/9+u0LdJMeJ6YkDQseHA2GLp9Yzi43Qga/Yr2v8yg
	HSbiMRhl9O5Ox7dRmuo5SA6p5C3sCpx8CAaONfoTWH7P+UIuSLgTyjmWI7Ir97qt7BBTRzkbqoz
	RgMH6hP6A/BGpMyKx4rBAk6/1W4TYwCa6j/d4nq1nNDXkvvXmaU8leMZqkz80X8sn8mbSQ74DmU
	hbQqP1n0JlsZpqUx5+HXckjZyX2xRUawtTHcw9rU70IKW/LwGscBMLQyyOI0JqVU1y1IB5wC2+t
	roY8mcQbQus7rs29STs8jxr5/dJJmprg7WUfeznfmOqAR8F6suw9fhmKfsHRiXr6lthpT6eNJmi
	/JF4kcgibMjuepj0+Tccen7nbaClw24T90ksQpX3yY0b4dTNvFecL43CaargAs7zTuI7AFcSJr9
	9HfZa6bBQnICmvSWQxPW6izKiF26I=
X-Google-Smtp-Source: AGHT+IEnhbhgD5wvfXgKIYQpP+Lfyce302o3Owp60kynW6BbE9VY04c0yKjSZIvlB5ornO/n4cUtAg==
X-Received: by 2002:a17:902:ef07:b0:269:82a5:fa19 with SMTP id d9443c01a7336-290272e3adcmr281603745ad.45.1760411710696;
        Mon, 13 Oct 2025 20:15:10 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f3de4asm148315845ad.92.2025.10.13.20.15.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Oct 2025 20:15:10 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: akpm@linux-foundation.org,
	alex@ghiti.fr,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	catalin.marinas@arm.com,
	cuiyunhui@bytedance.com,
	dianders@chromium.org,
	johannes@sipsolutions.net,
	lihuafei1@huawei.com,
	mark.rutland@arm.com,
	masahiroy@kernel.org,
	maz@kernel.org,
	mingo@kernel.org,
	nicolas.schier@linux.dev,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	suzuki.poulose@arm.com,
	thorsten.blum@linux.dev,
	wangjinchao600@gmail.com,
	will@kernel.org,
	yangyicong@hisilicon.com,
	zhanjie9@hisilicon.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Paul Walmsley <pjw@kernel.org>
Subject: [PATCH v4 2/2] riscv: add HARDLOCKUP_DETECTOR_PERF support
Date: Tue, 14 Oct 2025 11:14:25 +0800
Message-Id: <20251014031425.93284-3-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20251014031425.93284-1-cuiyunhui@bytedance.com>
References: <20251014031425.93284-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_201511_724188_8C524BA4 
X-CRM114-Status: GOOD (  10.12  )
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

Enable the HARDLOCKUP_DETECTOR_PERF function based on RISC-V SSE.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Acked-by: Paul Walmsley <pjw@kernel.org>
---
 arch/riscv/Kconfig           |  3 +++
 drivers/perf/riscv_pmu_sbi.c | 10 ++++++++++
 2 files changed, 13 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index badbb2b366946..0ae3291b303f9 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -186,6 +186,9 @@ config RISCV
 	select HAVE_PAGE_SIZE_4KB
 	select HAVE_PCI
 	select HAVE_PERF_EVENTS
+	select HAVE_PERF_EVENTS_NMI if RISCV_PMU_SBI_SSE
+	select HAVE_HARDLOCKUP_DETECTOR_PERF if PERF_EVENTS && HAVE_PERF_EVENTS_NMI
+	select WATCHDOG_PERF_ADJUST_PERIOD if HARDLOCKUP_DETECTOR_PERF && CPU_FREQ
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
 	select HAVE_POSIX_CPU_TIMERS_TASK_WORK
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index c852f64a50221..0c7c5924687c9 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -22,6 +22,7 @@
 #include <linux/sched/clock.h>
 #include <linux/soc/andes/irq.h>
 #include <linux/workqueue.h>
+#include <linux/nmi.h>
 
 #include <asm/errata_list.h>
 #include <asm/sbi.h>
@@ -1192,6 +1193,13 @@ static int pmu_sbi_setup_sse(struct riscv_pmu *pmu)
 }
 #endif
 
+#ifdef CONFIG_HARDLOCKUP_DETECTOR_PERF
+bool arch_perf_nmi_is_available(void)
+{
+	return IS_ENABLED(CONFIG_RISCV_PMU_SBI_SSE);
+}
+#endif
+
 static int pmu_sbi_starting_cpu(unsigned int cpu, struct hlist_node *node)
 {
 	struct riscv_pmu *pmu = hlist_entry_safe(node, struct riscv_pmu, node);
@@ -1618,6 +1626,8 @@ static int __init pmu_sbi_devinit(void)
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
