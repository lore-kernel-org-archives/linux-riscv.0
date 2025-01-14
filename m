Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73138E77188
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 23:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fRRxUcBJ8kOFVeehLKeaBp5QLtXWNgFOknsDxQ1V+m4=; b=IPp9fCi0ieOPOu
	kftG0eyNAx0u0c0OU4Xs70ESXuAy7RtxmvuWUZhJaC1vA2Wuq3R5/r/pL/RRiObhh7XYnkhyvSeRA
	ztDe0qDe352EZm+2CZq2oJ39BR5+6/MZr/IgT9KozZFmnpIyhW11+DshJYSLixpKM7iVw73neBzWo
	15GoWD1WfBASU7+8xTzUHXuLa+e/qe5booYINxD9+c8CW/bYioEzRw8BUx/f9oAi08fHAPOpTquYo
	L/45KE82EUNAL1kR1Dd6wL/cv3oN6A4frpqOKb8m2fxQH8pFHNwnR6e2XG8qk6XjlFEJWspzf6+bH
	fuQYQsegcAJGLi9UwF1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXqDX-0000000A5LJ-2mvj;
	Tue, 14 Jan 2025 23:21:03 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXps0-0000000A09i-2oam
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 22:58:50 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-216634dd574so71291325ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jan 2025 14:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736895528; x=1737500328; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lFaqQYFa0i4Hi1540ZaNWub9sunz3Nl340tvz0aVjzo=;
        b=W3qo/sSJEC763jbmA+dzv3Tz0POilV+qubzTuN/Mh8UDzNyk/y00f7CE+OvflJET9X
         lTfp8ha23XIY+aveuIs2DOZOqdcUjljkYmBtMG/iqPa5fkGOmv6UtsKrQBIP72HirhU2
         SrHY/JVFE3iS9ohVbuKYSIRG5NWR2FIFd4niMcP9Gr4MK3EmQaDTJv2FxIbZKRXYrpOi
         yz5x6307ycqwan60o7mwx/3+X5TCr2qCEEq7C7UHApubpX7oMFhYYVtLHwLzUgOQ2aJS
         IvcaFDmRh/A1AX4exJZMPfz9tcIcNAmjqRbgLIZSMf5nMID7rDQWFY6L+aM+KveckUc+
         2B1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736895528; x=1737500328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lFaqQYFa0i4Hi1540ZaNWub9sunz3Nl340tvz0aVjzo=;
        b=qzDqmyukDaHraCbe1qKxeJYm8Xc5W4hPEYt+csVu9O1UqeD9MNI4i+2aF5BBhWrDnv
         rhDzclEqT1O1yJRV5HtTVzZNk1uG9wHZWXUZeGjWzUeHjBwqIaubftkHUF05+D2j1vaV
         ez+FgWiC/WuF3ZlB5MujnK431R9v9L6H8aE85UUl6YHWwnaTbQ7ssmUKZpXRoVi2N83A
         2+1xw87k6C69qGajtsk/p+kGIUVIAxD3Ubr1GXZE67Puh6KEPZDvGTATxXTFBgp7XEut
         eqMsyT+ogKzflFk54b0psvv85DooJarVeQes3FCIKoDC/nsZBZQrwP4t4nzgqg0dnenp
         OFAw==
X-Gm-Message-State: AOJu0YzVuo/S80Yf+VNbpkLK5Hwsd73066TRJ5+r9riD5WtoZN84kZ4Q
	Kw4fk6BVIAd3d6h49+qoYd8iAinNdIRCPVIRpvDDLatJ5aHjTOLI9urCKU6BLqk=
X-Gm-Gg: ASbGnctsFFY25PDbCKF4xUGBneeQ8L/JrACR1QuvXfrDLatyVsCKeZHjFam8/IQRYPa
	2u9chEnKY/M9V2chWk27k14bSt+TV731nuW7ASI6kAdgWmH7tOqh8Xzm7Bg/IZQca3FA5IB0dS+
	qWpaMsV9El94lqL1ImXCm6shSJKG6mymjTvdnVsqWzxHx0zvJuRD44mZEX7A6n0oBrsN8mgUsJ/
	wkWkTjSx/O//dl9mssvRZ2Iv7D/IcPZITUX+DVPYwifUp8yLmmXjDV0soknVSG6OKvoWQ==
X-Google-Smtp-Source: AGHT+IHCQ6qV+IZREHZOksM8g070R45gqC24v2Ey2b78fnINPv3h7b/5YKzuEF3OHMLV4KVWpbWi3w==
X-Received: by 2002:a17:902:c941:b0:216:7cbf:951f with SMTP id d9443c01a7336-21a83f4f096mr419065225ad.21.1736895528131;
        Tue, 14 Jan 2025 14:58:48 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10df7asm71746105ad.47.2025.01.14.14.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 14:58:47 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 14 Jan 2025 14:57:42 -0800
Subject: [PATCH v2 17/21] RISC-V: perf: Add legacy event encodings via
 sysfs
MIME-Version: 1.0
Message-Id: <20250114-counter_delegation-v2-17-8ba74cdb851b@rivosinc.com>
References: <20250114-counter_delegation-v2-0-8ba74cdb851b@rivosinc.com>
In-Reply-To: <20250114-counter_delegation-v2-0-8ba74cdb851b@rivosinc.com>
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
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_145848_722436_78353479 
X-CRM114-Status: GOOD (  15.29  )
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
index 8c5e2474fb7d..8c5598253af0 100644
--- a/drivers/perf/riscv_pmu_dev.c
+++ b/drivers/perf/riscv_pmu_dev.c
@@ -122,7 +122,20 @@ static struct attribute_group riscv_cdeleg_pmu_format_group = {
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
@@ -362,11 +375,14 @@ struct riscv_vendor_pmu_events {
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
@@ -388,6 +404,8 @@ static void rvpmu_vendor_register_events(void)
 		    pmu_vendor_events_table[i].archid == arch_id) {
 			current_pmu_hw_event_map = pmu_vendor_events_table[i].hw_event_map;
 			current_pmu_cache_event_map = pmu_vendor_events_table[i].cache_event_map;
+			riscv_cdeleg_pmu_event_group.attrs =
+							pmu_vendor_events_table[i].attrs_events;
 			break;
 		}
 	}

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
