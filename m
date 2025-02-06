Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCCD7C02196
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 08:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sb5FYFUwu/mEbGrCOObyvJ6Pa10MuSqyG5/mlf02gW0=; b=e8dyeF5lVS2h8v
	PDDiudSepBCrkYDUPeZhRSYs84wOR+LKLR5qdE/KhfIaWSfwEJGvFdxzSKi7/1+z9xbEcPfkqjDQM
	FHEFTy4UeL3xRr7DgMmywFlnGmaZdD/2NIV/cbJox8l3H1/DtWxS1tm2apw+69BtwiJXbzgz1stfC
	aHb8Hftd0THMkeUES0R1eH1Z0ba4SvOIER6pYb4uWcxujZz39t76v2rroZAGJbUwDWnD15asvpnHM
	I8hwURIc0a53+BSypS7vVjWFjdWJH7aXkYI7+zFYm0pQ9TUXeAhwSYTQtGGAD1yJXXS8qQqBI0KY6
	IhEMwiXMz0U96+NwdlVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfxWf-00000005k9W-2zjk;
	Thu, 06 Feb 2025 08:46:21 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwEh-00000005YJr-2p5o
	for linux-riscv@lists.infradead.org;
	Thu, 06 Feb 2025 07:23:45 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2f9f5caa37cso1712812a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 05 Feb 2025 23:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738826623; x=1739431423; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mLt3uQ+5mVFCD4CpzivJzFeQzs8sYQp9bQK+aL0eLxQ=;
        b=JkUd2FdA3e9SzRPPqk/w7/7jTtDFwUqlM/ITm6MoJqu9onSIOxn9FhjA4d/AO0XfMc
         AegqM7zrKkkXHoO6CElsFLypPkOZsFczSRvdDu5QfGRn+o4NrtplqlxnZq2WY2zxdWi4
         pHm+rY55dUJt8SLuPKQ26lT5BwAyo8eMkEhWmHdEG4SpNV4vvGlTbiTV1yCzKc3KDQR5
         ILyoygiso7wd6U08YofzYWdzwejJO3MSbEzK7C2aIHdrEsSXRw/4jD81d2kk/XdhKI2B
         RdOUao3LI3vO/0yXqtQ8CCbYKhhj1NFA27mpocp4C3BYgvKz9uiXh7fDRHpT2GrCL5Kk
         7LKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738826623; x=1739431423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mLt3uQ+5mVFCD4CpzivJzFeQzs8sYQp9bQK+aL0eLxQ=;
        b=aXHgNWlpQ48++wnnSvNtWUcWIvOsU7QGviE1+vwqNykx193gU41kV70BO1rEb52aPy
         p0stAXdbbxfYBOeZVDmZxcAgnESINWOOQR284RiNzLB2zmk/hMkGxsQFUxISW/ZOhAxH
         xsYBXhJ4LhXyl3pSK1PLnY0Cmltvhe4ueWHgduJp9ykadViS1H2wUF+p/M9eiaI/uBw9
         c5UzVMDNreh4AhkHcWEtfc7qTRbxc0n7HiYGhRw0ChBbw52GuTYdFUss0E2qa7iw4CZT
         GbCA4+bv1ydOZ5Z49UvelcCB0ecVqqZnfh2vdQunHAyxqNlKEk6nUwPYITUedpJyvHpA
         Eitg==
X-Gm-Message-State: AOJu0YxV8BdsthY9Oo3H5Umbv/uNhgXhNHJJfqc6CKuxVQFsvG+uv3PW
	J7+RJczbxzuub9ZkTlSvV2+aa3DIdsjFSRcCOtZkPIDuReRo7B+687qb98IwAmg=
X-Gm-Gg: ASbGncuwHgU6+kHEQwD68uk/KjpTeTaEwZYRiLdaHUvNNmlMMDFviTAADMJxsFXR1l8
	VBUksi22loS/JxhjxHBjHMRPRUy0JPYyVu0v+S5a/HN+06nUFkPws2W5vNJennQP5QSoFDXqnqJ
	86sU3V1FEXaUuSPbMq7vACa/NUyI6QYRQOxfJecBkUmdUPbke4S05DIV5l9KD4RWCrDYYhtWHp7
	qaLPSxsv3vD6zcLIrDeLUPW3n1Nu2xGYlsredVy4cJsvopsbVZSlZC/4GhQk58c13GO5sYhd0sn
	qlMdMfM7poAMs/BnVSL50tl+yGGx
X-Google-Smtp-Source: AGHT+IE+zm5bTYTXugTwpHU711moyOZkgKemcMPApk5i6Nyzgk504/702jQ6OsU4eVbUvVfR2YHglw==
X-Received: by 2002:a17:90b:4fd1:b0:2f9:e730:1601 with SMTP id 98e67ed59e1d1-2f9ff8a1befmr4045975a91.7.1738826623101;
        Wed, 05 Feb 2025 23:23:43 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09a72292sm630883a91.27.2025.02.05.23.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 23:23:42 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 05 Feb 2025 23:23:22 -0800
Subject: [PATCH v4 17/21] RISC-V: perf: Add legacy event encodings via
 sysfs
MIME-Version: 1.0
Message-Id: <20250205-counter_delegation-v4-17-835cfa88e3b1@rivosinc.com>
References: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
In-Reply-To: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250205_232343_792100_462BF081 
X-CRM114-Status: GOOD (  14.87  )
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
index bbf5bcff51fc..dd4627055e7a 100644
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
