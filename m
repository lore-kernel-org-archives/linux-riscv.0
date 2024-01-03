Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E13BC3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 16:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I47OmT9Dg4qTTLJB9mflBXld1Bxeu1QcPv20V+r8bPk=; b=Si4W5Mfpn0PMFx
	7Nv/DZ0v1UP5DkEic72iONZsJOKSrosYhTIxWr4q9829gUH0p/pF/XfrUe6LHzGNlnk+gf0SuBeGi
	Hr2xnpA1FKm9QIE4hwn5uKgxc7ysS+A5Wj/6CZv9cLU1JTuGgFWWHmVERG+jxDMEOCUjNII1Y/d+W
	DjQCmk2k7zKlPZvqf4VCxSnUadjml8zTA47dD3K+0gdhyBa2wThkucSDSeoqaEjIfsuC6wePLtFFs
	AIa9+APPSWmOm4A515AvLsidG3Xn4bLkCGZTa1/VookYXGwQRLXUNNEMXh12d7GEPEbXrcyAtKLyu
	DjUF/zL/C2vt3RzjwfJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL4Vy-00BSb2-0s;
	Wed, 03 Jan 2024 16:54:46 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL4Vv-00BSZD-0C
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 16:54:44 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6d9b5c4f332so2522173b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jan 2024 08:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1704300881; x=1704905681; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=At4QHdwp3ZadpLBcNbgmNjMEMqeIcq9YtBwBsEfmi00=;
        b=JpEOBZ39IFDO9xOaOQKUE5+ICRMxsHE9VQOG9l2vhShOKpfS7GULUrL3oUhowuFmGs
         Sfy7eOYqTT7B9KTCXQSurvRG6ggK3lbDoEzsNbmjKoIRouFXWovArxCNQ9Rj4uJrMVEZ
         OE47KcJoExPQtr8eHF1YNLHkOqZTNCg1ghGdamlgpGroXIbCpdVGCpsv2JtlO7MztnDq
         usB1t0MsyIDGpfH+nbgSjwgYIeglZb9mhHtMg7VdBOrNC+oyN8XMm0X9Lm9LKH0FWQmD
         Jz6Ud1io0DiA4Q9pxj47CHPGD38ZDxJMnOmSS5O/uTKDXMLjMWx3HQHyoQAi51ewomNI
         OyjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704300881; x=1704905681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=At4QHdwp3ZadpLBcNbgmNjMEMqeIcq9YtBwBsEfmi00=;
        b=quzIjzFcTqeTu6IydBiYIE5HAARt7UT2mKkrWYSAOjlahr3jDths0jaaV/ldNs7FRb
         rchYWcxjmm9Ns9GfzscPKIx5qnVIoeb8811jorbD/udAIUNpTQhiyBVprv43Fw9dT8c7
         6K9izoW5D8YjzxOJEkqpFkoD4pyEomcX1P1+eVdwOTEka4hfyaOGhHSxK/Itkf1s8XIs
         XIXViYMnOX9Vir9IZ6GL0UA0P88KZom6N1eA2DHNc7fX3FIo4DSFij1Q/8WPVHm1KJtt
         ppCaMQxGdol1N7rC2GY8RQwqzCvThm6GmI3fd0MpG4zedCQOthusv7ACKuRjvcCAKYJT
         uL3g==
X-Gm-Message-State: AOJu0Yxg1k+NGv+KqN5CSv9/oq7RSbIf3qfrdnFGuXHQoACCIkLV2OtA
	Rmp6XVoni/xSMAp94hHsf7t1ldHGPVdpaQ==
X-Google-Smtp-Source: AGHT+IFphH96nvot+o6OJI+1Oefu5ZnyAS0PgflwFC1JcbKaoG4F36jfxfu5/7Zi+jYM28KFX7allg==
X-Received: by 2002:a05:6a20:1615:b0:198:ae17:6a86 with SMTP id l21-20020a056a20161500b00198ae176a86mr636668pzj.10.1704300881041;
        Wed, 03 Jan 2024 08:54:41 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id p7-20020a17090a930700b0028b89520c7asm1954805pjo.9.2024.01.03.08.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 08:54:40 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] perf: RISC-V: Check standard event availability
Date: Wed,  3 Jan 2024 08:53:48 -0800
Message-ID: <20240103165438.633054-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_085443_097114_0A50FBFA 
X-CRM114-Status: GOOD (  15.76  )
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

The RISC-V SBI PMU specification defines several standard hardware and
cache events. Currently, all of these events appear in the `perf list`
output, even if they are not actually implemented. Add logic to check
which events are supported by the hardware (i.e. can be mapped to some
counter), so only usable events are reported to userspace.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---
Before this patch:
$ perf list hw

List of pre-defined events (to be used in -e or -M):

  branch-instructions OR branches                    [Hardware event]
  branch-misses                                      [Hardware event]
  bus-cycles                                         [Hardware event]
  cache-misses                                       [Hardware event]
  cache-references                                   [Hardware event]
  cpu-cycles OR cycles                               [Hardware event]
  instructions                                       [Hardware event]
  ref-cycles                                         [Hardware event]
  stalled-cycles-backend OR idle-cycles-backend      [Hardware event]
  stalled-cycles-frontend OR idle-cycles-frontend    [Hardware event]

$ perf stat -ddd true

 Performance counter stats for 'true':

              4.36 msec task-clock                       #    0.744 CPUs utilized
                 1      context-switches                 #  229.325 /sec
                 0      cpu-migrations                   #    0.000 /sec
                38      page-faults                      #    8.714 K/sec
         4,375,694      cycles                           #    1.003 GHz                         (60.64%)
           728,945      instructions                     #    0.17  insn per cycle
            79,199      branches                         #   18.162 M/sec
            17,709      branch-misses                    #   22.36% of all branches
           181,734      L1-dcache-loads                  #   41.676 M/sec
             5,547      L1-dcache-load-misses            #    3.05% of all L1-dcache accesses
     <not counted>      LLC-loads                                                               (0.00%)
     <not counted>      LLC-load-misses                                                         (0.00%)
     <not counted>      L1-icache-loads                                                         (0.00%)
     <not counted>      L1-icache-load-misses                                                   (0.00%)
     <not counted>      dTLB-loads                                                              (0.00%)
     <not counted>      dTLB-load-misses                                                        (0.00%)
     <not counted>      iTLB-loads                                                              (0.00%)
     <not counted>      iTLB-load-misses                                                        (0.00%)
     <not counted>      L1-dcache-prefetches                                                    (0.00%)
     <not counted>      L1-dcache-prefetch-misses                                               (0.00%)

       0.005860375 seconds time elapsed

       0.000000000 seconds user
       0.010383000 seconds sys

After this patch:
$ perf list hw

List of pre-defined events (to be used in -e or -M):

  branch-instructions OR branches                    [Hardware event]
  branch-misses                                      [Hardware event]
  cache-misses                                       [Hardware event]
  cache-references                                   [Hardware event]
  cpu-cycles OR cycles                               [Hardware event]
  instructions                                       [Hardware event]

$ perf stat -ddd true

 Performance counter stats for 'true':

              5.16 msec task-clock                       #    0.848 CPUs utilized
                 1      context-switches                 #  193.817 /sec
                 0      cpu-migrations                   #    0.000 /sec
                37      page-faults                      #    7.171 K/sec
         5,183,625      cycles                           #    1.005 GHz
           961,696      instructions                     #    0.19  insn per cycle
            85,853      branches                         #   16.640 M/sec
            20,462      branch-misses                    #   23.83% of all branches
           243,545      L1-dcache-loads                  #   47.203 M/sec
             5,974      L1-dcache-load-misses            #    2.45% of all L1-dcache accesses
   <not supported>      LLC-loads
   <not supported>      LLC-load-misses
   <not supported>      L1-icache-loads
   <not supported>      L1-icache-load-misses
   <not supported>      dTLB-loads
            19,619      dTLB-load-misses
   <not supported>      iTLB-loads
             6,831      iTLB-load-misses
   <not supported>      L1-dcache-prefetches
   <not supported>      L1-dcache-prefetch-misses

       0.006085625 seconds time elapsed

       0.000000000 seconds user
       0.013022000 seconds sys


 drivers/perf/riscv_pmu_sbi.c | 37 ++++++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 16acd4dcdb96..b58a70ee8317 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -86,7 +86,7 @@ struct sbi_pmu_event_data {
 	};
 };
 
-static const struct sbi_pmu_event_data pmu_hw_event_map[] = {
+static struct sbi_pmu_event_data pmu_hw_event_map[] = {
 	[PERF_COUNT_HW_CPU_CYCLES]		= {.hw_gen_event = {
 							SBI_PMU_HW_CPU_CYCLES,
 							SBI_PMU_EVENT_TYPE_HW, 0}},
@@ -120,7 +120,7 @@ static const struct sbi_pmu_event_data pmu_hw_event_map[] = {
 };
 
 #define C(x) PERF_COUNT_HW_CACHE_##x
-static const struct sbi_pmu_event_data pmu_cache_event_map[PERF_COUNT_HW_CACHE_MAX]
+static struct sbi_pmu_event_data pmu_cache_event_map[PERF_COUNT_HW_CACHE_MAX]
 [PERF_COUNT_HW_CACHE_OP_MAX]
 [PERF_COUNT_HW_CACHE_RESULT_MAX] = {
 	[C(L1D)] = {
@@ -265,6 +265,36 @@ static const struct sbi_pmu_event_data pmu_cache_event_map[PERF_COUNT_HW_CACHE_M
 	},
 };
 
+static void pmu_sbi_check_event(struct sbi_pmu_event_data *edata)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH,
+			0, cmask, 0, edata->event_idx, 0, 0);
+	if (!ret.error) {
+		sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP,
+			  ret.value, 0x1, SBI_PMU_STOP_FLAG_RESET, 0, 0, 0);
+	} else if (ret.error == SBI_ERR_NOT_SUPPORTED) {
+		/* This event cannot be monitored by any counter */
+		edata->event_idx = -EINVAL;
+	}
+}
+
+static void pmu_sbi_update_events(void)
+{
+	/* Ensure events are not already mapped to a counter */
+	sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP,
+		  0, cmask, SBI_PMU_STOP_FLAG_RESET, 0, 0, 0);
+
+	for (int i = 0; i < ARRAY_SIZE(pmu_hw_event_map); i++)
+		pmu_sbi_check_event(&pmu_hw_event_map[i]);
+
+	for (int i = 0; i < ARRAY_SIZE(pmu_cache_event_map); i++)
+		for (int j = 0; j < ARRAY_SIZE(pmu_cache_event_map[i]); j++)
+			for (int k = 0; k < ARRAY_SIZE(pmu_cache_event_map[i][j]); k++)
+				pmu_sbi_check_event(&pmu_cache_event_map[i][j][k]);
+}
+
 static int pmu_sbi_ctr_get_width(int idx)
 {
 	return pmu_ctr_list[idx].width;
@@ -1046,6 +1076,9 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 	if (pmu_sbi_get_ctrinfo(num_counters, &cmask))
 		goto out_free;
 
+	/* Check which standard events are available */
+	pmu_sbi_update_events();
+
 	ret = pmu_sbi_setup_irqs(pmu, pdev);
 	if (ret < 0) {
 		pr_info("Perf sampling/filtering is not supported as sscof extension is not available\n");
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
