Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2EE5C43334
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jun 2022 16:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cmRG0O7lX6YQnyOEgZJv1LAUvZoVgaSP2F4z+yAm1Gc=; b=BaMzUtuTbEjYAG
	gq7ok9pA9wBZEsyq+C/nXctLyXSWY6aKd4FUD458UL/7qkgnWhFUe78CGxvvbfGBD7vfxq5UJp+lq
	XyknxguLfCHmqu9OS6mjKwhOPZq07av6ZsLrFCsze7aH2Loh9kCcjG2yQWdvQPtMvJ8v1vX+7T8su
	jWNEdrWOvj0pfeBCN7VfkWxwLvQg3UKWsH3Mf+C8BehsrWLqh32w/UPPORj3KiDbcq/77/j69q3zF
	8mJG4koDrX+oyJBsVT2jjU4kkOQGOWiHjuuGPCTlZOSoXaCIhbrKFe1gfPAYQw6Php1UERup/K5M+
	iVr1+rs//P70Z7wodKaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4llS-002wlT-IV; Fri, 24 Jun 2022 16:02:34 +0000
Received: from forward500j.mail.yandex.net ([5.45.198.250])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4llP-002wim-24
	for linux-riscv@lists.infradead.org; Fri, 24 Jun 2022 16:02:33 +0000
Received: from myt6-9503d8936a58.qloud-c.yandex.net (myt6-9503d8936a58.qloud-c.yandex.net [IPv6:2a02:6b8:c12:4684:0:640:9503:d893])
	by forward500j.mail.yandex.net (Yandex) with ESMTP id A544B6CB8372;
	Fri, 24 Jun 2022 19:01:41 +0300 (MSK)
Received: from myt5-ca5ec8faf378.qloud-c.yandex.net (myt5-ca5ec8faf378.qloud-c.yandex.net [2a02:6b8:c12:2514:0:640:ca5e:c8fa])
	by myt6-9503d8936a58.qloud-c.yandex.net (mxback/Yandex) with ESMTP id 86JPym46TO-1ffSsmEq;
	Fri, 24 Jun 2022 19:01:41 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1656086501;
	bh=qfYFwSd6zhJPXDppEJzFmsfoBlq0uAMta4BnC0i2seI=;
	h=In-Reply-To:References:Date:Subject:Cc:To:From:Message-Id;
	b=MlL1W4WTbDu39xNkTLR1Uj5l2gYFnTxBC0BQygKpttxeRS78tjAzX2dPWZ3AGqPEG
	 bpKRteWYMnWpbZQlOO9NwN9iVGqaA3SpNI/spW9iNdgHDdT9an/sh4drx59egqt0jV
	 6msH57zzfWdrGRFcUot+M4pkRqe6I3eTBh1FcjSY=
Authentication-Results: myt6-9503d8936a58.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by myt5-ca5ec8faf378.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id iVUkuL8Azf-1eMKkS5t;
	Fri, 24 Jun 2022 19:01:40 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>
Cc: =?UTF-8?q?Jo=C3=A3o=20M=C3=A1rio=20Domingos?= <joao.mario@tecnico.ulisboa.pt>,
	linux@yadro.com,
	Nikita Shubin <n.shubin@yadro.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
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
Subject: [PATCH v4 4/5] perf arch events: riscv sbi firmware std event files
Date: Fri, 24 Jun 2022 19:00:54 +0300
Message-Id: <20220624160117.3206-5-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220624160117.3206-1-nikita.shubin@maquefel.me>
References: <20220624160117.3206-1-nikita.shubin@maquefel.me>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_090231_543832_3E98114B 
X-CRM114-Status: GOOD (  11.11  )
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
---
 .../arch/riscv/riscv-sbi-firmware.json        | 134 ++++++++++++++++++
 1 file changed, 134 insertions(+)
 create mode 100644 tools/perf/pmu-events/arch/riscv/riscv-sbi-firmware.json

diff --git a/tools/perf/pmu-events/arch/riscv/riscv-sbi-firmware.json b/tools/perf/pmu-events/arch/riscv/riscv-sbi-firmware.json
new file mode 100644
index 000000000000..bcaa9891e595
--- /dev/null
+++ b/tools/perf/pmu-events/arch/riscv/riscv-sbi-firmware.json
@@ -0,0 +1,134 @@
+[
+  {
+    "PublicDescription": "Misaligned load trap",
+    "EventCode": "0x8000000000000000",
+    "EventName": "FW_MISALIGNED_LOAD",
+    "BriefDescription": "Misaligned load trap event"
+  },
+  {
+    "PublicDescription": "Misaligned store trap",
+    "EventCode": "0x8000000000000001",
+    "EventName": "FW_MISALIGNED_STORE",
+    "BriefDescription": "Misaligned store trap event"
+  },
+  {
+    "PublicDescription": "Load access trap",
+    "EventCode": "0x8000000000000002",
+    "EventName": "FW_ACCESS_LOAD",
+    "BriefDescription": "Load access trap event"
+  },
+  {
+    "PublicDescription": "Store access trap",
+    "EventCode": "0x8000000000000003",
+    "EventName": "FW_ACCESS_STORE",
+    "BriefDescription": "Store access trap event"
+  },
+  {
+    "PublicDescription": "Illegal instruction trap",
+    "EventCode": "0x8000000000000004",
+    "EventName": "FW_ILLEGAL_INSN",
+    "BriefDescription": "Illegal instruction trap event"
+  },
+  {
+    "PublicDescription": "Set timer event",
+    "EventCode": "0x8000000000000005",
+    "EventName": "FW_SET_TIMER",
+    "BriefDescription": "Set timer event"
+  },
+  {
+    "PublicDescription": "Sent IPI to other HART event",
+    "EventCode": "0x8000000000000006",
+    "EventName": "FW_IPI_SENT",
+    "BriefDescription": "Sent IPI to other HART event"
+  },
+  {
+    "PublicDescription": "Received IPI from other HART event",
+    "EventCode": "0x8000000000000007",
+    "EventName": "FW_IPI_RECEIVED",
+    "BriefDescription": "Received IPI from other HART event"
+  },
+  {
+    "PublicDescription": "Sent FENCE.I request to other HART event",
+    "EventCode": "0x8000000000000008",
+    "EventName": "FW_FENCE_I_SENT",
+    "BriefDescription": "Sent FENCE.I request to other HART event"
+  },
+  {
+    "PublicDescription": "Received FENCE.I request from other HART event",
+    "EventCode": "0x8000000000000009",
+    "EventName": "FW_FENCE_I_RECEIVED",
+    "BriefDescription": "Received FENCE.I request from other HART event"
+  },
+  {
+    "PublicDescription": "Sent SFENCE.VMA request to other HART event",
+    "EventCode": "0x80000000000000a",
+    "EventName": "FW_SFENCE_VMA_SENT",
+    "BriefDescription": "Sent SFENCE.VMA request to other HART event"
+  },
+  {
+    "PublicDescription": "Received SFENCE.VMA request from other HART event",
+    "EventCode": "0x800000000000000b",
+    "EventName": "FW_SFENCE_VMA_RECEIVED",
+    "BriefDescription": "Received SFENCE.VMA request from other HART event"
+  },
+  {
+    "PublicDescription": "Sent SFENCE.VMA with ASID request to other HART event",
+    "EventCode": "0x800000000000000c",
+    "EventName": "FW_SFENCE_VMA_RECEIVED",
+    "BriefDescription": "Sent SFENCE.VMA with ASID request to other HART event"
+  },
+  {
+    "PublicDescription": "Received SFENCE.VMA with ASID request from other HART event",
+    "EventCode": "0x800000000000000d",
+    "EventName": "FW_SFENCE_VMA_ASID_RECEIVED",
+    "BriefDescription": "Received SFENCE.VMA with ASID request from other HART event"
+  },
+  {
+    "PublicDescription": "Sent HFENCE.GVMA request to other HART event",
+    "EventCode": "0x800000000000000e",
+    "EventName": "FW_HFENCE_GVMA_SENT",
+    "BriefDescription": "Sent HFENCE.GVMA request to other HART event"
+  },
+  {
+    "PublicDescription": "Received HFENCE.GVMA request from other HART event",
+    "EventCode": "0x800000000000000f",
+    "EventName": "FW_HFENCE_GVMA_RECEIVED",
+    "BriefDescription": "Received HFENCE.GVMA request from other HART event"
+  },
+  {
+    "PublicDescription": "Sent HFENCE.GVMA with VMID request to other HART event",
+    "EventCode": "0x8000000000000010",
+    "EventName": "FW_HFENCE_GVMA_VMID_SENT",
+    "BriefDescription": "Sent HFENCE.GVMA with VMID request to other HART event"
+  },
+  {
+    "PublicDescription": "Received HFENCE.GVMA with VMID request from other HART event",
+    "EventCode": "0x8000000000000011",
+    "EventName": "FW_HFENCE_GVMA_VMID_RECEIVED",
+    "BriefDescription": "Received HFENCE.GVMA with VMID request from other HART event"
+  },
+  {
+    "PublicDescription": "Sent HFENCE.VVMA request to other HART event",
+    "EventCode": "0x8000000000000012",
+    "EventName": "FW_HFENCE_VVMA_SENT",
+    "BriefDescription": "Sent HFENCE.VVMA request to other HART event"
+  },
+  {
+    "PublicDescription": "Received HFENCE.VVMA request from other HART event",
+    "EventCode": "0x8000000000000013",
+    "EventName": "FW_HFENCE_VVMA_RECEIVED",
+    "BriefDescription": "Received HFENCE.VVMA request from other HART event"
+  },
+  {
+    "PublicDescription": "Sent HFENCE.VVMA with ASID request to other HART event",
+    "EventCode": "0x8000000000000014",
+    "EventName": "FW_HFENCE_VVMA_ASID_SENT",
+    "BriefDescription": "Sent HFENCE.VVMA with ASID request to other HART event"
+  },
+  {
+    "PublicDescription": "Received HFENCE.VVMA with ASID request from other HART event",
+    "EventCode": "0x8000000000000015",
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
