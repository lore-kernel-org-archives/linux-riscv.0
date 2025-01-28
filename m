Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C703C0218D
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jan 2025 05:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/pIfe8jRip2HrMDlloAAtO5SGhBo5EEtcW4D/Fz0CMU=; b=S17erZJ0oZ+Jv9
	cgDX1cLnkAW0OFHT1SZkYK9bRsZve2+UZ9HkuGJKsjwVsUIty5moyn8cvYpeEns7oYg7IPJ/hnBiZ
	Pf7ddaM9CCMf5h3AfeIQy8N5/7haOyJvmlFAetBPT/QLapb2FPYmDay0jy8LF3xCRPJGG1ajgEPCK
	H2+XyTR1e/wJ4xNT/HTfu8fHF1LtcBblmpveaehm+sACx1eDwx9fL08dcjkeyp6fS7I8Aq9n66U86
	f6KEN0HShxSoHhUhKaqRpgg8g1NcelorM9fau5zDPOLq7TvENXMrt7iq1Ze7ShiqZKPoSHU1zNqZd
	mxwt6TQX/T9hRLY0rBcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tce3s-000000049Oo-3hgw;
	Tue, 28 Jan 2025 05:22:56 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcdhz-000000044nL-08xg
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jan 2025 05:00:21 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2f4409fc8fdso7986887a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jan 2025 21:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738040418; x=1738645218; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r5NF+IAT/KmspwMK0FGMQwrWJIha2MiTbZ1WzqIdfAY=;
        b=hVwySMqY16VfoL/yMJkbYpGkDHpMXRfiZl6qpXQs6BbHjaKszAZPqCU9X0ZzLOwAh0
         PJU9PsIgYes4ShscFI6AXez6/WwZrAzLpfKQN/4czCe8hRGa7K+JA3qVFGgU+B2gk4T2
         t/wPXFbK4yA+POsN4GIiE9ZXZMF0cpvMORRmjdyAOh3987ZHXSdLkn5iWgxh3n+3hjvy
         UVTEqT3OomneIM5zvS27P3QEYI0hDSZaq24o0C3ZIKpJB1Z/yAXVVj6jng98/Yb/VZCG
         rdtuO3yMzYSj3USaY5t7L/XxND4SHJkvbc8OfUbWINv5AU812yrMLF7DfqO7NJh6LYxr
         ckHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738040418; x=1738645218;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r5NF+IAT/KmspwMK0FGMQwrWJIha2MiTbZ1WzqIdfAY=;
        b=KxJzLnnLneJxyrYT++At/9+FRCaAvrRsZwGuLxLQ+VJKg1oIXGAtv25p9aJf/ds9UR
         e0o47ZiLc5gDAB/sdHFFMAwjdrwoj7AX6Oa0p3ARC+ruqsxtlKE0TEbLjt6L0v4gccz3
         A+A5d+3wC4iYTA/6Emipt8bedaPwAkjeH7DedyOvL0nDJxsE9+KlbnZec0nxm5W+nUeP
         k2mPrz2bboWeINpkbnI8kLpNUZjqe9hvBcRMbkwFsF6gEvDLZSjMaa8cdocg5jOjXHNu
         rN5QD1qPXhILCIU47mCPe/I+SJKsgS3Z5zltGge0tQz6XGblVnJMLcxOo5pSfR4xcAmY
         QOWg==
X-Gm-Message-State: AOJu0YzWVlLK73uGmpI6cuOnlo7HauOdw8hPAyOZYNVA3LeH071lHj2x
	L6k40WQLVleinZzy2BZ2VFnsM1iiafC6bBKTAbtf6TqIePwMFaX0WcpS6FqB5RU=
X-Gm-Gg: ASbGnctsGqp5cffLiPRJnXjQE4v5swqb3OHpqX9LH4vJbCnjLMZeNFTw4Umu3NNbaOJ
	gIUmS4hADQQVXF+Tas/USykaF8CMgWYzSmr6PW7LHolMVzg8/qnbwzN8Dhjlm1nQPuMzmqDTOM1
	jaHax/rM5ISy/r7UXuyhDI3hNSXkVMkXNPgjbsXqF5h7nfv1klg2dc7DCAsidj1p0beYFZyLKqC
	7Lc54JF7an6HF5IYsmM5cbR8OznfXTG+lLgWPEp+H4uYJk49sVyghgJO21D+SNMTw7KKkbGIhqq
	tiGymNMSYdZjtE/bRKqulHCWt82BWY9wp6FSJx4=
X-Google-Smtp-Source: AGHT+IH6k4v2G1ElxeZAZKnP2qHihpfZzn6nd2gCpEPf3NHDHrL/Cp1+5uWagHMGSZOAiqHrlZzQ2w==
X-Received: by 2002:a17:90a:f950:b0:2ee:c30f:33c9 with SMTP id 98e67ed59e1d1-2f82c076328mr3187299a91.14.1738040418390;
        Mon, 27 Jan 2025 21:00:18 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa5a7f7sm8212776a91.11.2025.01.27.21.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 21:00:18 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 27 Jan 2025 20:59:59 -0800
Subject: [PATCH v3 18/21] RISC-V: perf: Add Qemu virt machine events
MIME-Version: 1.0
Message-Id: <20250127-counter_delegation-v3-18-64894d7e16d5@rivosinc.com>
References: <20250127-counter_delegation-v3-0-64894d7e16d5@rivosinc.com>
In-Reply-To: <20250127-counter_delegation-v3-0-64894d7e16d5@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atishp@atishpatra.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, weilin.wang@intel.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_210019_198437_CD5F6EF3 
X-CRM114-Status: GOOD (  13.19  )
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

Qemu virt machine supports a very minimal set of legacy perf events.
Add them to the vendor table so that users can use them when
counter delegation is enabled.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/vendorid_list.h |  4 ++++
 drivers/perf/riscv_pmu_dev.c           | 36 ++++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/include/asm/vendorid_list.h
index 2f2bb0c84f9a..ef22b03552bc 100644
--- a/arch/riscv/include/asm/vendorid_list.h
+++ b/arch/riscv/include/asm/vendorid_list.h
@@ -9,4 +9,8 @@
 #define SIFIVE_VENDOR_ID	0x489
 #define THEAD_VENDOR_ID		0x5b7
 
+#define QEMU_VIRT_VENDOR_ID		0x000
+#define QEMU_VIRT_IMPL_ID		0x000
+#define QEMU_VIRT_ARCH_ID		0x000
+
 #endif
diff --git a/drivers/perf/riscv_pmu_dev.c b/drivers/perf/riscv_pmu_dev.c
index 055011f07759..db4a61fac838 100644
--- a/drivers/perf/riscv_pmu_dev.c
+++ b/drivers/perf/riscv_pmu_dev.c
@@ -26,6 +26,7 @@
 #include <asm/sbi.h>
 #include <asm/cpufeature.h>
 #include <asm/vendor_extensions.h>
+#include <asm/vendorid_list.h>
 #include <asm/vendor_extensions/andes.h>
 #include <asm/hwcap.h>
 #include <asm/csr_ind.h>
@@ -384,7 +385,42 @@ struct riscv_vendor_pmu_events {
 	  .hw_event_map = _hw_event_map, .cache_event_map = _cache_event_map, \
 	  .attrs_events = _attrs },
 
+/* QEMU virt PMU events */
+static const struct riscv_pmu_event qemu_virt_hw_event_map[PERF_COUNT_HW_MAX] = {
+	PERF_MAP_ALL_UNSUPPORTED,
+	[PERF_COUNT_HW_CPU_CYCLES]		= {0x01, 0xFFFFFFF8},
+	[PERF_COUNT_HW_INSTRUCTIONS]		= {0x02, 0xFFFFFFF8}
+};
+
+static const struct riscv_pmu_event qemu_virt_cache_event_map[PERF_COUNT_HW_CACHE_MAX]
+						[PERF_COUNT_HW_CACHE_OP_MAX]
+						[PERF_COUNT_HW_CACHE_RESULT_MAX] = {
+	PERF_CACHE_MAP_ALL_UNSUPPORTED,
+	[C(DTLB)][C(OP_READ)][C(RESULT_MISS)]	= {0x10019, 0xFFFFFFF8},
+	[C(DTLB)][C(OP_WRITE)][C(RESULT_MISS)]	= {0x1001B, 0xFFFFFFF8},
+
+	[C(ITLB)][C(OP_READ)][C(RESULT_MISS)]	= {0x10021, 0xFFFFFFF8},
+};
+
+RVPMU_EVENT_CMASK_ATTR(cycles, cycles, 0x01, 0xFFFFFFF8);
+RVPMU_EVENT_CMASK_ATTR(instructions, instructions, 0x02, 0xFFFFFFF8);
+RVPMU_EVENT_CMASK_ATTR(dTLB-load-misses, dTLB_load_miss, 0x10019, 0xFFFFFFF8);
+RVPMU_EVENT_CMASK_ATTR(dTLB-store-misses, dTLB_store_miss, 0x1001B, 0xFFFFFFF8);
+RVPMU_EVENT_CMASK_ATTR(iTLB-load-misses, iTLB_load_miss, 0x10021, 0xFFFFFFF8);
+
+static struct attribute *qemu_virt_event_group[] = {
+	RVPMU_EVENT_ATTR_PTR(cycles),
+	RVPMU_EVENT_ATTR_PTR(instructions),
+	RVPMU_EVENT_ATTR_PTR(dTLB_load_miss),
+	RVPMU_EVENT_ATTR_PTR(dTLB_store_miss),
+	RVPMU_EVENT_ATTR_PTR(iTLB_load_miss),
+	NULL,
+};
+
 static struct riscv_vendor_pmu_events pmu_vendor_events_table[] = {
+	RISCV_VENDOR_PMU_EVENTS(QEMU_VIRT_VENDOR_ID, QEMU_VIRT_ARCH_ID, QEMU_VIRT_IMPL_ID,
+				qemu_virt_hw_event_map, qemu_virt_cache_event_map,
+				qemu_virt_event_group)
 };
 
 const struct riscv_pmu_event *current_pmu_hw_event_map;

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
