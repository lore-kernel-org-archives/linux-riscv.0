Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0886CC3600B
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 20:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ji6WCRx0ECyTE0oQ8wR7ucmsZv6+a6gbtIPlGvV8N3s=; b=yHmbz89tW7f8FG
	GrFHczJ/pO8qC9irLvr/9x8oOYo56ITXoUBlZbn2N0B/MaIwhM9hQ/+f56cR+mNUWqFmOP04XDqIn
	3CVkBEEbgC7W8U+KuK/XV+uDcoSbixdBykns2XUVY2PjsPrFAFq3yLzmlzKSeAH2UlSTvCelrlVHT
	ZTzmB01k0MfPMYXsjU/DN3LioyaKD7VmAzHfb+h6kFDM9i4IHPKPB5jV2qbEtodLxuy8sDuazdIGu
	WH7QmVwnS6hrSwmd4AgVCsVw82jVfd9uqX70UwPMO0fehq1t6PwmOqOzZUPALylWsdXhRoUo8clvX
	BJalwiXkrY4E/39peSAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txtTE-0000000BvV9-3bqX;
	Thu, 27 Mar 2025 20:04:56 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txt1s-0000000Bpq4-1CeB
	for linux-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 19:36:41 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3015001f862so1664188a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 27 Mar 2025 12:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743104200; x=1743709000; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KssINcBHG6V5nsmKK6p0ubimcU1BXEQtWDJ9ECnykV0=;
        b=Xsxcli3p4QXHyg5kFipIgiMBFC+oT6GdpgdSKOEsgcolkgu6hmUNqf9zQ10fyrmILn
         GNlDU7IyuohAhb5qpAhFCoIjzWiCuy8ZdIzMNvS3A3+1V7JoBlnBX+PFSWA8MGfR7eSd
         TiCTGm0S7Zr8plYOZxDYFXfPmIfHuGLXjy105ctW3OnLOHmm1zfFDeZxxDY0LzMOJyx6
         MKnihl9Q+4Pt+KjfOwXxlGnKrbK2gQvS0MJKtRbpbXHkgFMtmTiabQJ3vW2CNh+Qyuzj
         FOV+aviRuo4yOBmq9PCEcc/KDRdgL7AOfvzjmoce8annOifBwk20VnSlSQWyEYEzR1Sb
         9XRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104200; x=1743709000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KssINcBHG6V5nsmKK6p0ubimcU1BXEQtWDJ9ECnykV0=;
        b=Db9O8wmM/M4MuRn0rvsnK2+4GPIm3S8Kq63QSgjWfqsFMoU8nP1rjsH0BUVT+7dzyT
         KAuqU9nVPtZ0hevZnQV65Tqp7CFqonFqeiBk4HwH/tQmX1g/KfXqiY2nX6z+ngkbp03Z
         zb2NanwYcUzvk0o5PozYqg5IdRECQT9PN3R+2h4FZOVDSVSa0SRVwQXis5T/0k4F3aO0
         MaeP2TmpaoZVoZWGczIXIL4xXpx4DVXqd4Pm+JUsMGY31gcMP9SqoQqG8RYAOR6Zn7/9
         4jGhyeCKRjtsUG1uVyUx8V3Xg7z3FFKnoA4x/u+SG3e/weaYXGmJVdEPeji0nSDAbZAm
         ccaQ==
X-Gm-Message-State: AOJu0YyFIRNzDVRnsfaGxKoFiek6PK8+gtJDW62n7FxT9ssmBg02Zdqk
	yUmwGTp+DRy1l+QfJs5ewiybgdUtSPFlrfTC9DevqubLPxxRBsmHOiVxVyWpX7M=
X-Gm-Gg: ASbGnctImUe6UpMD8JfOxI+Jfg4gYLWzDNCnAIgIYeiv6Cy8Pcs8UX09t+Omfl+VxAh
	MsWAldSRy87Ols7KjxavFa0ze6V3Qy7cSVeShIoOuNUFVsLr2SyefIRVHU68PfytY32NkhAxsve
	FCv+9KH7zizJuDGDU2gzgTjmlLZNj11PKMXAikqquDdLslqkHFB/DtkLCMNeEWL/jBnp8FKgUJb
	1yuHVQytxDpBHrRt6R3wK+lx/oOmn+7HM3TL6SsGYuLNOftr+2CFT0tsmJNgOHDqk7yNakvXN+V
	Jf60TYa1kypc33Ir84xCF0ysLUljHZ4cGzVZDbdcnwTR9ELIwOUQLkngPQ==
X-Google-Smtp-Source: AGHT+IE2krN6Iazwz2/u7kYznnPmcB0AT0QBtnSPpGlLXmbNzMbs0M2bltPDrqZDoRjoQ9cuAJeaHg==
X-Received: by 2002:a17:90b:278c:b0:2fe:b77a:2eab with SMTP id 98e67ed59e1d1-303a8e7653bmr6347831a91.32.1743104199626;
        Thu, 27 Mar 2025 12:36:39 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f6b638csm2624220a91.44.2025.03.27.12.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:36:39 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 27 Mar 2025 12:35:58 -0700
Subject: [PATCH v5 17/21] RISC-V: perf: Add legacy event encodings via
 sysfs
MIME-Version: 1.0
Message-Id: <20250327-counter_delegation-v5-17-1ee538468d1b@rivosinc.com>
References: <20250327-counter_delegation-v5-0-1ee538468d1b@rivosinc.com>
In-Reply-To: <20250327-counter_delegation-v5-0-1ee538468d1b@rivosinc.com>
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
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_123640_356950_0641F5EE 
X-CRM114-Status: GOOD (  14.88  )
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

Define sysfs details for the legacy events so that any tool can
parse these to understand the minimum set of legacy events
supported by the platform. The sysfs entry will describe both event
encoding and corresponding counter map so that an perf event can be
programmed accordingly.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_dev.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/riscv_pmu_dev.c b/drivers/perf/riscv_pmu_dev.c
index 92ff42aca44b..8a079949e3a4 100644
--- a/drivers/perf/riscv_pmu_dev.c
+++ b/drivers/perf/riscv_pmu_dev.c
@@ -129,7 +129,20 @@ static struct attribute_group riscv_cdeleg_pmu_format_group = {
 	.attrs = riscv_cdeleg_pmu_formats_attr,
 };
 
+#define RVPMU_EVENT_ATTR_RESOLVE(m) #m
+#define RVPMU_EVENT_CMASK_ATTR(_name, _var, config, mask) \
+	PMU_EVENT_ATTR_STRING(_name, rvpmu_event_attr_##_var, \
+			      "event=" RVPMU_EVENT_ATTR_RESOLVE(config) \
+			      ",counterid_mask=" RVPMU_EVENT_ATTR_RESOLVE(mask) "\n")
+
+#define RVPMU_EVENT_ATTR_PTR(name) (&rvpmu_event_attr_##name.attr.attr)
+
+static struct attribute_group riscv_cdeleg_pmu_event_group __ro_after_init = {
+	.name = "events",
+};
+
 static const struct attribute_group *riscv_cdeleg_pmu_attr_groups[] = {
+	&riscv_cdeleg_pmu_event_group,
 	&riscv_cdeleg_pmu_format_group,
 	NULL,
 };
@@ -369,11 +382,14 @@ struct riscv_vendor_pmu_events {
 	const struct riscv_pmu_event *hw_event_map;
 	const struct riscv_pmu_event (*cache_event_map)[PERF_COUNT_HW_CACHE_OP_MAX]
 						       [PERF_COUNT_HW_CACHE_RESULT_MAX];
+	struct attribute **attrs_events;
 };
 
-#define RISCV_VENDOR_PMU_EVENTS(_vendorid, _archid, _implid, _hw_event_map, _cache_event_map) \
+#define RISCV_VENDOR_PMU_EVENTS(_vendorid, _archid, _implid, _hw_event_map, \
+				_cache_event_map, _attrs) \
 	{ .vendorid = _vendorid, .archid = _archid, .implid = _implid, \
-	  .hw_event_map = _hw_event_map, .cache_event_map = _cache_event_map },
+	  .hw_event_map = _hw_event_map, .cache_event_map = _cache_event_map, \
+	  .attrs_events = _attrs },
 
 static struct riscv_vendor_pmu_events pmu_vendor_events_table[] = {
 };
@@ -395,6 +411,8 @@ static void rvpmu_vendor_register_events(void)
 		    pmu_vendor_events_table[i].archid == arch_id) {
 			current_pmu_hw_event_map = pmu_vendor_events_table[i].hw_event_map;
 			current_pmu_cache_event_map = pmu_vendor_events_table[i].cache_event_map;
+			riscv_cdeleg_pmu_event_group.attrs =
+							pmu_vendor_events_table[i].attrs_events;
 			break;
 		}
 	}

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
