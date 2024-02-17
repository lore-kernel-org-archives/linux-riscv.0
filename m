Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B40C48BC4
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Feb 2024 02:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0TXqu4Xa5A8LWuTghT9+6cxBzPZJs5sNtas+8rCO/UA=; b=GTyT/CuQGcw1nu
	d50cIRonVTp1LJOmBUPV+lzmclCaZ+AAGrafEmvAyIv7842EjBzOxBJz4qV4PIApagO76QHSPLlB3
	dwXvLQZY5j5OhKkAQbwKV/oPCYac4sKK+hi+0/CBtu4s6MjFgkIZWDgaEuai5oDuE457wDN2anuiC
	3LwjQ8kfzLQNszLQjf4g+dmgcgmN5WH/65G/3CkG6bTtsrwcnwv9NCbxkkf+oZ14vvLGriSS+Q+RC
	pDkW5u+B7hReU5zk+4uTRJsK6hEWebWJ3JeBXXZo5N/u6ruNXvHY+lg3ORbdaDU3e1jJlYQVygDha
	tPQ2v1LVWpmk6TpV88PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbA3U-00000004SBL-1dlK;
	Sat, 17 Feb 2024 02:03:52 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb92Z-00000004INT-3Ard
	for linux-riscv@lists.infradead.org;
	Sat, 17 Feb 2024 00:59:02 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3c0d59a219dso1574919b6e.0
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 16:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708131531; x=1708736331; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wzekTDmDm0BHWDBhHgdtQywPCZoHi4eTbi4rsPTxLsk=;
        b=RIj1oilGOUNHBuBFkfmjbwskA5XqvCgqDibjwZB8TIhSnaGrBThXImbmZQk9rCwoi2
         B4eVIr0dFKLjKEWk3SyX8HVo3kUc5mm4Dw+vvmDZjC8A0aYAcmw4RB9oXt/dIPf3J8Tp
         Q/AgHOFVPeJw7WeqJe2cujyDC/YN76+akEHJJxpaaj9VIhx3Ix6an+ZjhpvY8uPo2lgV
         C0N04E4TpTTqMfBTHgtfT+ot8h0RzwAZa0Ri2B68rCm2E9cFj9PpfQaAe/wtKfhlxOz1
         kvbZzDamE2istCm73Ie8zFIaWeLAwHUDNZCFOvoQKgIz0ZIhsQCUNM4vR/ONRAhiClKE
         8CGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708131531; x=1708736331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wzekTDmDm0BHWDBhHgdtQywPCZoHi4eTbi4rsPTxLsk=;
        b=gKsClJmUvNEHSTD69P6LQtarJluyMb/DnZ3+qLEeSCgE2MUTAAGu93XkgHG2IID0Eb
         eUtzn6XPjtpfkwVPitqZ4tV6R8vf0JJP9THALx24z9fSAviKkiDyY+dO+SO6/YWiOnq7
         3niiXCl3S24NuoG0Avg1CN9j0dOxF0iMFMt6GaOw4+09O5fORxfkOKo68ip+n2en3vIo
         JkxGassFIu5lXSikK4vRt/k16n4qF0VIB5d0eqzgfuvz7L/QR7hPAc9z25gmRw+GiUAQ
         UGARNEtqGIjjoYaDE849Zf8IqfaLrvIbVZxp+OzrbbwHeuYsHiyS7EzXZqc/kA4/UaUv
         M5qA==
X-Forwarded-Encrypted: i=1; AJvYcCVSQUEHcvF40gIhu+NRnbNbvSBgratMbcKaAcKnrCgaf53ogWl0jpU99L2VSyaHWlUI0lojMTYMswArHtzyaH2LMwN1pKfaHHoxlVBOGh4M
X-Gm-Message-State: AOJu0Yzc72EGSqLv/jG/YTlDk0IfImpTJNM282FnhJP0ikb50NvNzfdM
	5zY8Qj/rwL4WjdTI5tKzlrvZnZPBp9Qvb1+2qfYUZjb3LAA5EjWXq/fd/nMr8Ms=
X-Google-Smtp-Source: AGHT+IFh5z2qRfi3D9IkKas86nFROYWU3mPjDzUuW4T2X7wbUeQ8t61ZPYIlkMzVMiWXNbGIgenNww==
X-Received: by 2002:a05:6808:4d0:b0:3c1:347f:39d1 with SMTP id a16-20020a05680804d000b003c1347f39d1mr6306573oie.22.1708131530901;
        Fri, 16 Feb 2024 16:58:50 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d188-20020a6336c5000000b005dc89957e06sm487655pga.71.2024.02.16.16.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:58:50 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Atish Patra <atishp@atishpatra.org>,
	Christian Brauner <brauner@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor@kernel.org>,
	devicetree@vger.kernel.org,
	Evan Green <evan@rivosinc.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Ian Rogers <irogers@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	James Clark <james.clark@arm.com>,
	Jing Zhang <renyu.zj@linux.alibaba.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ji Sheng Teoh <jisheng.teoh@starfivetech.com>,
	John Garry <john.g.garry@oracle.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Kan Liang <kan.liang@linux.intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	linux-doc@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Rob Herring <robh+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Weilin Wang <weilin.wang@intel.com>,
	Will Deacon <will@kernel.org>,
	kaiwenxue1@gmail.com,
	Yang Jihong <yangjihong1@huawei.com>
Subject: [PATCH RFC 14/20] RISC-V: perf: Use config2 for event to counter mapping
Date: Fri, 16 Feb 2024 16:57:32 -0800
Message-Id: <20240217005738.3744121-15-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240217005738.3744121-1-atishp@rivosinc.com>
References: <20240217005738.3744121-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_165852_095778_047BC0D0 
X-CRM114-Status: GOOD (  24.97  )
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

The counter restriction specified in the json file is passed to
the drivers via config2 paarameter in perf attributes. This allows
any platform vendor to define their custom mapping between event and
hpmcounters without any rules defined in the ISA.

However, the cycle and instruction counters are fixed (0 and 2
respectively) by the ISA. The platform vendor must specify this
in the json file if intended to be used while profiling. Otherwise,
they can just specify the alternate hpmcounters that may monitor
and/or sample the cycle/instruction counts.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_dev.c   | 36 +++++++++++++++++++++++-----------
 include/linux/perf/riscv_pmu.h |  2 ++
 2 files changed, 27 insertions(+), 11 deletions(-)

diff --git a/drivers/perf/riscv_pmu_dev.c b/drivers/perf/riscv_pmu_dev.c
index 0cdad0dafb71..5bad4131e920 100644
--- a/drivers/perf/riscv_pmu_dev.c
+++ b/drivers/perf/riscv_pmu_dev.c
@@ -49,6 +49,7 @@ static ssize_t __maybe_unused rvpmu_format_show(struct device *dev,
 	RVPMU_ATTR_ENTRY(_name, rvpmu_format_show, (char *)_config)
 
 PMU_FORMAT_ATTR(firmware, "config:63");
+PMU_FORMAT_ATTR(counterid_mask, "config2:0-31");
 
 static DEFINE_STATIC_KEY_FALSE(riscv_pmu_sbi_available);
 static DEFINE_STATIC_KEY_FALSE(riscv_pmu_cdeleg_available);
@@ -74,6 +75,7 @@ static const struct attribute_group *riscv_sbi_pmu_attr_groups[] = {
 static struct attribute *riscv_cdeleg_pmu_formats_attr[] = {
 	RVPMU_FORMAT_ATTR_ENTRY(event, RVPMU_CDELEG_PMU_FORMAT_ATTR),
 	&format_attr_firmware.attr,
+	&format_attr_counterid_mask.attr,
 	NULL,
 };
 
@@ -974,23 +976,39 @@ static int rvpmu_deleg_find_ctrs(void)
 	return num_hw_ctr;
 }
 
+/* The json file must correctly specify counter 0 or counter 2 is available
+ * in the counter lists for cycle/instret events. Otherwise, the drivers have
+ * no way to figure out if a fixed counter must be used and pick a programmable
+ * counter if available.
+ */
 static int get_deleg_fixed_hw_idx(struct cpu_hw_events *cpuc, struct perf_event *event)
 {
-	return -EINVAL;
+	if (!event->attr.config2)
+		return -EINVAL;
+
+	if (event->attr.config2 & RISCV_PMU_CYCLE_FIXED_CTR_MASK)
+		return 0; /* CY counter */
+	else if (event->attr.config2 & RISCV_PMU_INSTRUCTION_FIXED_CTR_MASK)
+		return 2; /* IR counter */
+	else
+		return -EINVAL;
 }
 
 static int get_deleg_next_hpm_hw_idx(struct cpu_hw_events *cpuc, struct perf_event *event)
 {
 	unsigned long hw_ctr_mask = 0;
 
-	/*
-	 * TODO: Treat every hpmcounter can monitor every event for now.
-	 * The event to counter mapping should come from the json file.
-	 * The mapping should also tell if sampling is supported or not.
-	 */
-
 	/* Select only hpmcounters */
 	hw_ctr_mask = cmask & (~0x7);
+
+	/*
+	 * Mask off the counters that can't monitor this event (specified via json)
+	 * The counter mask for this event is set in config2 via the property 'Counter'
+	 * in the json file or manual configuration of config2. If the config2 is not set, it
+	 * is assumed all the available hpmcounters can monitor this event.
+	 */
+	if (event->attr.config2)
+		hw_ctr_mask = hw_ctr_mask & event->attr.config2;
 	hw_ctr_mask &= ~(cpuc->used_hw_ctrs[0]);
 	return __ffs(hw_ctr_mask);
 }
@@ -1020,10 +1038,6 @@ static int rvpmu_deleg_ctr_get_idx(struct perf_event *event)
 	uint64_t priv_filter;
 	int idx;
 
-	/*
-	 * TODO: We should not rely on SBI Perf encoding to check if the event
-	 * is a fixed one or not.
-	 */
 	if (!is_sampling_event(event)) {
 		idx = get_deleg_fixed_hw_idx(cpuc, event);
 		if (idx == 0 || idx == 2) {
diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
index f878369fecc8..425edd6685a9 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -30,6 +30,8 @@
 #define RISCV_PMU_CONFIG1_GUEST_EVENTS 0x1
 
 #define RISCV_PMU_DELEG_RAW_EVENT_MASK GENMASK_ULL(55, 0)
+#define RISCV_PMU_CYCLE_FIXED_CTR_MASK 0x01
+#define RISCV_PMU_INSTRUCTION_FIXED_CTR_MASK 0x04
 
 struct cpu_hw_events {
 	/* currently enabled events */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
