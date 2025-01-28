Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE98FC0218D
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jan 2025 05:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IyC3DkrG+B+gKDKsYxELXAq+N3CA6yCgpMMHVhRTKgc=; b=iUzu4b5RQFTExJ
	apiuG0UJcZigmZdgO0BwP9v9Eyg8UO8jxDY7ghI3Zm8jvG9VDtjZLkWe82P8ZbpY0dC5OCSS/tXaJ
	5Cdn6coSwitzaUAgMwfk+K/oZq2vqr4yGuLrtb0JlWYcOgVhPlpIwksC6iXHZoInznwYmn9mRztk1
	NEeOXCvAYwFNoE05ks0vW49DbcBPviOTug2o27YtfZChvGjHP0BEiAfghZ8RfFYUk7Zci2JyUztlS
	Fkx//vlp9dLpg2e4UFc1oKEEyo7TlhvLtSH5eHWjespV1yE6t6nZdHXf8XjYPHgg5sQbsGEAc1Bif
	B/M7Iy+PfmnjOEkbOIRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tce2X-000000049Dq-3RL4;
	Tue, 28 Jan 2025 05:21:33 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcdhx-000000044lW-1o3p
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jan 2025 05:00:20 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2efded08c79so7214125a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jan 2025 21:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738040417; x=1738645217; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QcgV78ON7bQjbj8rz+m5AxTl8xJOToNes7SYHJXciAs=;
        b=P3tQzYDsLZ3oEzhEc3dopSglHdtx3Lmzw4Zk/eOuPx4CY20kD58oIRbrK3c4tVkVBQ
         a+qRifkjv1vNKQ06dGq2yESptaKtcwgiwa5C49W9U4dV5fhSl/Q68EnqF2fPTTr9nrqW
         7mc43NY1faDezQ4Oj1BYzffWU2XSMWefHD1oDDgqIDCheyD0j/RtE3NSPFttMZJ4LzKr
         k9Pc2ST36k/AdO1fspxuNDVXmyvM7OQrD2jRsbdPyxErM3buq9rk1p3XPuOGB2NNt4JX
         qUXPFSOVzclXzQ5tQxBOJUSbrMFB5dLkgimljRlDlUVPKDIJdcvwDwLnbmiXt/aT9nkK
         7mmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738040417; x=1738645217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QcgV78ON7bQjbj8rz+m5AxTl8xJOToNes7SYHJXciAs=;
        b=LKXqgCWCGsSyas/OawHBpl6fWB9IiALLeZxQ6/tcr0kuebdJ5H77IlkEmSfP/BoyHd
         5yTV5Ade5FnG6bvnW7tb+W2auyv6zGl56tjFY5GmB5vCgER1BGFZkaSGoKWZts0ZooBA
         2sNA02klUDh7eqQfwwNod+XmImOlM0GBLRl7H5TITOkabB11jvq6BtP/QonbElt+KdTo
         pywbwjzqTKu5SFrK9vKPtHd5R9KQ6vLs+YPB5oPUIW3JgVE2+O+kWOnWzKYhI4qwAH+w
         trwFAxHyO1K0oZqSctpXLHEB/n4kp0JvwQjrOyyrQylKkgHrY3QuNxPlVbBwo9nASohz
         xDGg==
X-Gm-Message-State: AOJu0YxerZB5BS/dFWM4PcIvQGCOYZuV8iSGB6QRMWgDIFYgCT+XEXCK
	4V75syVo4bQ9ZjO/XLkZArUFOigxHAAzFVXmKcrDcQ2FPAKPUkXACaquFXcxFG4=
X-Gm-Gg: ASbGncslmsx5uTJMiH/6YoCJ6ghfSSbnEPSSQY15v3jhdHPhoZakewmOHbfascBTJX0
	BMue4qXzg1PSEIUaf+AQbv2sb7V06IJZJhU18XYEVNy//TOTPryXeIA1uEMMuc8oPn8T+RFj3ES
	twyv+xU5ZetMPVK8nba48ndBEHhf4/Ouok1oeVApjXAJyCv3yloNY5YQH1erBnW64CC3emmU4hd
	jNkVEetp+QFxfkJiMOwW5UJKyMPwaWmyHUxMuW5Xhd3bjbgoH05DFP2hdQuv3BVGslvtPevPoDj
	WThv1dS4lP4h8eNl+RKRiEDdTkEa
X-Google-Smtp-Source: AGHT+IGCm7GMS3VNtxEaZyWfkLMPbe+hI7KXpym5HHPhVJQX2ASsOYeeTikT15JA57Prj6Ttz9V96w==
X-Received: by 2002:a17:90b:524b:b0:2ee:a583:e616 with SMTP id 98e67ed59e1d1-2f782c8fd41mr65998400a91.9.1738040416850;
        Mon, 27 Jan 2025 21:00:16 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa5a7f7sm8212776a91.11.2025.01.27.21.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 21:00:16 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 27 Jan 2025 20:59:58 -0800
Subject: [PATCH v3 17/21] RISC-V: perf: Add legacy event encodings via
 sysfs
MIME-Version: 1.0
Message-Id: <20250127-counter_delegation-v3-17-64894d7e16d5@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250127_210017_581426_D6041E53 
X-CRM114-Status: GOOD (  15.37  )
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
index ab84f83df5e1..055011f07759 100644
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
