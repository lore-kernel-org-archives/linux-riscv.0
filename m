Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CE0C00140
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Aug 2022 13:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nT4uEyW8t4bII66EnhSyCXqQTe+RPD9aoqPSXRMJems=; b=c90TFJ386uyD6y
	fhbV7uExTsPXmCL6tW4hcAFSDhm3XHn2zaMDQmh/DY3/0lxy5YENpIwlrP/inFAzjgWa9VuYPAhG4
	vGisykLWSrEh5wFoQsQn9jKfK+M6qnH3NHlnj6iSWCCEalDlOpnjBsB3kiJXFseQvaoQ9Y3jxAaN5
	eAKrOyzcH8tkppL3TBawJzng2ODerrCzjQduv0D7HuIiRzjRo8izEe/qA6J255+aQW9SCI8NcnjG3
	NWo8ooOgqCyXkEP2SwEIfLfhmC4QNfeL5ybw7oPAeb+PCJg3AGpakhsxzPqoAidHyPmLb2FacrI9d
	jz+cnJYOXOITzjYIEhhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNa9i-00GoaG-IY; Mon, 15 Aug 2022 13:29:22 +0000
Received: from forward108j.mail.yandex.net ([2a02:6b8:0:801:2::253])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNa3l-00Gk4u-CM
	for linux-riscv@lists.infradead.org; Mon, 15 Aug 2022 13:23:16 +0000
Received: from forward502p.mail.yandex.net (forward502p.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:121])
	by forward108j.mail.yandex.net (Yandex) with ESMTP id 1E2DE3F1FC33;
	Mon, 15 Aug 2022 16:23:09 +0300 (MSK)
Received: from iva1-dcde80888020.qloud-c.yandex.net (iva1-dcde80888020.qloud-c.yandex.net [IPv6:2a02:6b8:c0c:7695:0:640:dcde:8088])
	by forward502p.mail.yandex.net (Yandex) with ESMTP id E0917B80F79;
	Mon, 15 Aug 2022 16:23:05 +0300 (MSK)
Received: by iva1-dcde80888020.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id BL0XdiM9S6-N3i4TfZ0;
	Mon, 15 Aug 2022 16:23:04 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1660569784;
	bh=LGRYFPPAmfj8X4XSMNybmhYCQW3I5BPKT7pd/kdr0YI=;
	h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=Tw1DOz6d2T+nxlwDX/gXFgupKtLHGpCTcjTvOfe6K/0knM3EKAVwWaCcmfXFNCWaU
	 s038K6Si9EPQ6YZRZmaL2xq+3S45L3PKVD3oiHz2DY2HvQxF4gIXCq4OQXRrnGR00r
	 l+0Dql6Ce86KitGq9HGA/RKTkDK1R29+vhQKtfck=
Authentication-Results: iva1-dcde80888020.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: 
Cc: linux@yadro.com,
	Anup Patel <anup@brainfault.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Nikita Shubin <n.shubin@yadro.com>,
	Kautuk Consul <kconsul@ventanamicro.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v6 2/3] perf arch events: riscv sbi firmware std event files
Date: Mon, 15 Aug 2022 16:22:39 +0300
Message-Id: <20220815132251.25702-3-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220815132251.25702-1-nikita.shubin@maquefel.me>
References: <20220815132251.25702-1-nikita.shubin@maquefel.me>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_062313_835369_58EAE0EB 
X-CRM114-Status: GOOD (  11.51  )
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

From: Nikita Shubin <n.shubin@yadro.com>

Firmware events are defined by "RISC-V Supervisor Binary Interface
Specification", which means they should be always available as long as
firmware supports >= 0.3.0 SBI.

Expose them to arch std events, so they can be reused by particular
PMU bindings.

Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
Tested-by: Kautuk Consul <kconsul@ventanamicro.com>
---
v5->v6:
Mayuresh Chitale:
	- fixed FW_SFENCE_VMA_SENT event code
---
 .../arch/riscv/riscv-sbi-firmware.json        | 134 ++++++++++++++++++
 1 file changed, 134 insertions(+)
 create mode 100644 tools/perf/pmu-events/arch/riscv/riscv-sbi-firmware.json

diff --git a/tools/perf/pmu-events/arch/riscv/riscv-sbi-firmware.json b/tools/perf/pmu-events/arch/riscv/riscv-sbi-firmware.json
new file mode 100644
index 000000000000..a9939823b14b
--- /dev/null
+++ b/tools/perf/pmu-events/arch/riscv/riscv-sbi-firmware.json
@@ -0,0 +1,134 @@
+[
+  {
+    "PublicDescription": "Misaligned load trap",
+    "ConfigCode": "0x8000000000000000",
+    "EventName": "FW_MISALIGNED_LOAD",
+    "BriefDescription": "Misaligned load trap event"
+  },
+  {
+    "PublicDescription": "Misaligned store trap",
+    "ConfigCode": "0x8000000000000001",
+    "EventName": "FW_MISALIGNED_STORE",
+    "BriefDescription": "Misaligned store trap event"
+  },
+  {
+    "PublicDescription": "Load access trap",
+    "ConfigCode": "0x8000000000000002",
+    "EventName": "FW_ACCESS_LOAD",
+    "BriefDescription": "Load access trap event"
+  },
+  {
+    "PublicDescription": "Store access trap",
+    "ConfigCode": "0x8000000000000003",
+    "EventName": "FW_ACCESS_STORE",
+    "BriefDescription": "Store access trap event"
+  },
+  {
+    "PublicDescription": "Illegal instruction trap",
+    "ConfigCode": "0x8000000000000004",
+    "EventName": "FW_ILLEGAL_INSN",
+    "BriefDescription": "Illegal instruction trap event"
+  },
+  {
+    "PublicDescription": "Set timer event",
+    "ConfigCode": "0x8000000000000005",
+    "EventName": "FW_SET_TIMER",
+    "BriefDescription": "Set timer event"
+  },
+  {
+    "PublicDescription": "Sent IPI to other HART event",
+    "ConfigCode": "0x8000000000000006",
+    "EventName": "FW_IPI_SENT",
+    "BriefDescription": "Sent IPI to other HART event"
+  },
+  {
+    "PublicDescription": "Received IPI from other HART event",
+    "ConfigCode": "0x8000000000000007",
+    "EventName": "FW_IPI_RECEIVED",
+    "BriefDescription": "Received IPI from other HART event"
+  },
+  {
+    "PublicDescription": "Sent FENCE.I request to other HART event",
+    "ConfigCode": "0x8000000000000008",
+    "EventName": "FW_FENCE_I_SENT",
+    "BriefDescription": "Sent FENCE.I request to other HART event"
+  },
+  {
+    "PublicDescription": "Received FENCE.I request from other HART event",
+    "ConfigCode": "0x8000000000000009",
+    "EventName": "FW_FENCE_I_RECEIVED",
+    "BriefDescription": "Received FENCE.I request from other HART event"
+  },
+  {
+    "PublicDescription": "Sent SFENCE.VMA request to other HART event",
+    "ConfigCode": "0x800000000000000a",
+    "EventName": "FW_SFENCE_VMA_SENT",
+    "BriefDescription": "Sent SFENCE.VMA request to other HART event"
+  },
+  {
+    "PublicDescription": "Received SFENCE.VMA request from other HART event",
+    "ConfigCode": "0x800000000000000b",
+    "EventName": "FW_SFENCE_VMA_RECEIVED",
+    "BriefDescription": "Received SFENCE.VMA request from other HART event"
+  },
+  {
+    "PublicDescription": "Sent SFENCE.VMA with ASID request to other HART event",
+    "ConfigCode": "0x800000000000000c",
+    "EventName": "FW_SFENCE_VMA_RECEIVED",
+    "BriefDescription": "Sent SFENCE.VMA with ASID request to other HART event"
+  },
+  {
+    "PublicDescription": "Received SFENCE.VMA with ASID request from other HART event",
+    "ConfigCode": "0x800000000000000d",
+    "EventName": "FW_SFENCE_VMA_ASID_RECEIVED",
+    "BriefDescription": "Received SFENCE.VMA with ASID request from other HART event"
+  },
+  {
+    "PublicDescription": "Sent HFENCE.GVMA request to other HART event",
+    "ConfigCode": "0x800000000000000e",
+    "EventName": "FW_HFENCE_GVMA_SENT",
+    "BriefDescription": "Sent HFENCE.GVMA request to other HART event"
+  },
+  {
+    "PublicDescription": "Received HFENCE.GVMA request from other HART event",
+    "ConfigCode": "0x800000000000000f",
+    "EventName": "FW_HFENCE_GVMA_RECEIVED",
+    "BriefDescription": "Received HFENCE.GVMA request from other HART event"
+  },
+  {
+    "PublicDescription": "Sent HFENCE.GVMA with VMID request to other HART event",
+    "ConfigCode": "0x8000000000000010",
+    "EventName": "FW_HFENCE_GVMA_VMID_SENT",
+    "BriefDescription": "Sent HFENCE.GVMA with VMID request to other HART event"
+  },
+  {
+    "PublicDescription": "Received HFENCE.GVMA with VMID request from other HART event",
+    "ConfigCode": "0x8000000000000011",
+    "EventName": "FW_HFENCE_GVMA_VMID_RECEIVED",
+    "BriefDescription": "Received HFENCE.GVMA with VMID request from other HART event"
+  },
+  {
+    "PublicDescription": "Sent HFENCE.VVMA request to other HART event",
+    "ConfigCode": "0x8000000000000012",
+    "EventName": "FW_HFENCE_VVMA_SENT",
+    "BriefDescription": "Sent HFENCE.VVMA request to other HART event"
+  },
+  {
+    "PublicDescription": "Received HFENCE.VVMA request from other HART event",
+    "ConfigCode": "0x8000000000000013",
+    "EventName": "FW_HFENCE_VVMA_RECEIVED",
+    "BriefDescription": "Received HFENCE.VVMA request from other HART event"
+  },
+  {
+    "PublicDescription": "Sent HFENCE.VVMA with ASID request to other HART event",
+    "ConfigCode": "0x8000000000000014",
+    "EventName": "FW_HFENCE_VVMA_ASID_SENT",
+    "BriefDescription": "Sent HFENCE.VVMA with ASID request to other HART event"
+  },
+  {
+    "PublicDescription": "Received HFENCE.VVMA with ASID request from other HART event",
+    "ConfigCode": "0x8000000000000015",
+    "EventName": "FW_HFENCE_VVMA_ASID_RECEIVED",
+    "BriefDescription": "Received HFENCE.VVMA with ASID request from other HART event"
+  }
+]
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
