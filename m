Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6162AD5CCB6
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Oct 2024 15:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ie4NV3AJCKBz6fR0Reppfu5isoE5g+8ZNA6FE9CGk8=; b=YyQhBbHGPwyHhv
	0UO284npbJki0oM03uZh30SzwYmljhjy/fDLiqUoRMMq2F1/ftmCuYGDRg1pnO52xelrVYh/w1zfw
	6m2uwXEm/axRq5CgjuBLAgCOs2NUlGFMX358pWgdYioyO8M45O7e/76f44L1Kr7VnQ2aFCHevybOZ
	nOxWWou6DlNs2lBC85e8MjzZ8RkVLXhWkPWSIi8PKJxfaOTBTdWwX/2j81OLGYz76pryS/zaoyWin
	GNc/3VyEEL3N6minGbrMjyD0R/Mfjb/uDmijQ2ib/mtSjWejlni8RApQ6Jz3vaqsFGBvJ+wV5ZP5Z
	ilVDcSam7Ztd/d2iVrLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ABs-00000000l8m-2c1Z;
	Wed, 30 Oct 2024 15:00:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t695l-00000000XtK-0QAP;
	Wed, 30 Oct 2024 13:50:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=k/QSX0mI8qQz8W316WTJxbTS4bB3Lyue/iJHbqNfB18=; b=SHRXxI13D0ji02DVnBA+S2vAWG
	075oe+6UZFaPWSjZC8HtDJhB3p6eXmMzQwYPMtlPTID5rQSlCfXRP5YAroHgHg8vKQJeo3/Drq/Z6
	3ycYhUivybiWoLOpTWXRyGrDHNIxTuMPrkwc3hI/RVmRBX1KtcjxEQ/E4vD+dyXq8cQE7kdfl8dFS
	wDO2wrE1rxjOBl0+QjcU8LiKsREf+Nw77Ah36NV4I/o/nNDSVS8N5bltk/Hf0igen/IK3xBPZptFb
	pGoDqi2bhjwVcXYA8wpP8gR1C9pRAtG1LnkJpU1WXwxU1DY06MRInV8u0s7J1Gxu1Jj2y56p5Jw1m
	RJI1ox/A==;
Received: from smtp-fw-80009.amazon.com ([99.78.197.220])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t695h-0000000AFoi-0pin;
	Wed, 30 Oct 2024 13:50:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazon201209; t=1730296229; x=1761832229;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=k/QSX0mI8qQz8W316WTJxbTS4bB3Lyue/iJHbqNfB18=;
  b=Q2vVFiG8cQn0RugB/GF2zlj6k/7HeQNrZJV54Q6JaVyaJ2SuN90f0SQf
   T4NyllQM4wPQFt91heMlrkp9RTGtifENyOGQeMx5PwzC+X0+FTlioAamm
   e6bOM2ZG2Qe/crqfqVENN2iXtGzmDSppgJjtPmLnd+2+bgwzqHgO8zxtY
   g=;
X-IronPort-AV: E=Sophos;i="6.11,245,1725321600"; 
   d="scan'208";a="142980689"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-80009.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 13:50:27 +0000
Received: from EX19MTAEUB001.ant.amazon.com [10.0.43.254:32764]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.20.52:2525] with esmtp (Farcaster)
 id cb6221e8-e82a-4b95-aff9-f29080c6cf67; Wed, 30 Oct 2024 13:50:26 +0000 (UTC)
X-Farcaster-Flow-ID: cb6221e8-e82a-4b95-aff9-f29080c6cf67
Received: from EX19D014EUA004.ant.amazon.com (10.252.50.41) by
 EX19MTAEUB001.ant.amazon.com (10.252.51.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Wed, 30 Oct 2024 13:50:23 +0000
Received: from EX19MTAUEA002.ant.amazon.com (10.252.134.9) by
 EX19D014EUA004.ant.amazon.com (10.252.50.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Wed, 30 Oct 2024 13:50:23 +0000
Received: from email-imr-corp-prod-pdx-all-2c-8a67eb17.us-west-2.amazon.com
 (10.43.8.2) by mail-relay.amazon.com (10.252.134.34) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1258.34 via Frontend Transport; Wed, 30 Oct 2024 13:50:22 +0000
Received: from ua2d7e1a6107c5b.home (dev-dsk-roypat-1c-dbe2a224.eu-west-1.amazon.com [172.19.88.180])
	by email-imr-corp-prod-pdx-all-2c-8a67eb17.us-west-2.amazon.com (Postfix) with ESMTPS id 93E2B41303;
	Wed, 30 Oct 2024 13:50:13 +0000 (UTC)
From: Patrick Roy <roypat@amazon.co.uk>
To: <tabba@google.com>, <quic_eberman@quicinc.com>, <david@redhat.com>,
	<seanjc@google.com>, <pbonzini@redhat.com>, <jthoughton@google.com>,
	<ackerleytng@google.com>, <vannapurve@google.com>, <rppt@kernel.org>
CC: Patrick Roy <roypat@amazon.co.uk>, <graf@amazon.com>,
	<jgowans@amazon.com>, <derekmn@amazon.com>, <kalyazin@amazon.com>,
	<xmarcalx@amazon.com>, <linux-mm@kvack.org>, <corbet@lwn.net>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <chenhuacai@kernel.org>,
	<kernel@xen0n.name>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <hca@linux.ibm.com>, <gor@linux.ibm.com>,
	<agordeev@linux.ibm.com>, <borntraeger@linux.ibm.com>, <svens@linux.ibm.com>,
	<gerald.schaefer@linux.ibm.com>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	<hpa@zytor.com>, <luto@kernel.org>, <peterz@infradead.org>,
	<rostedt@goodmis.org>, <mhiramat@kernel.org>,
	<mathieu.desnoyers@efficios.com>, <shuah@kernel.org>, <kvm@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <loongarch@lists.linux.dev>,
	<linux-riscv@lists.infradead.org>, <linux-s390@vger.kernel.org>,
	<linux-trace-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: [RFC PATCH v3 4/6] kvm: gmem: add trace point for direct map state changes
Date: Wed, 30 Oct 2024 13:49:08 +0000
Message-ID: <20241030134912.515725-5-roypat@amazon.co.uk>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241030134912.515725-1-roypat@amazon.co.uk>
References: <20241030134912.515725-1-roypat@amazon.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_135029_654200_6DC9633A 
X-CRM114-Status: GOOD (  12.77  )
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

Add tracepoints to kvm_gmem_set_direct_map and
kvm_gmem_folio_set_direct_map.

The above operations can cause folios to be insert/removed into/from the
direct map. We want to be able to make sure that only those gmem folios
that we expect KVM to access are ever reinserted into the direct map,
and that all folios that are temporarily reinserted are also removed
again at a later point. Processing ftrace output is one way to verify
this.

Signed-off-by: Patrick Roy <roypat@amazon.co.uk>
---
 include/trace/events/kvm.h | 22 ++++++++++++++++++++++
 virt/kvm/guest_memfd.c     |  5 +++++
 2 files changed, 27 insertions(+)

diff --git a/include/trace/events/kvm.h b/include/trace/events/kvm.h
index 74e40d5d4af42..f3d852c18fa08 100644
--- a/include/trace/events/kvm.h
+++ b/include/trace/events/kvm.h
@@ -489,6 +489,28 @@ TRACE_EVENT(kvm_test_age_hva,
 	TP_printk("mmu notifier test age hva: %#016lx", __entry->hva)
 );
 
+#ifdef CONFIG_KVM_PRIVATE_MEM
+TRACE_EVENT(kvm_gmem_direct_map_state_change,
+	TP_PROTO(pgoff_t start, pgoff_t end, bool state),
+	TP_ARGS(start, end, state),
+
+	TP_STRUCT__entry(
+		__field(pgoff_t, start)
+		__field(pgoff_t, end)
+		__field(bool, state)
+	),
+
+	TP_fast_assign(
+		__entry->start = start;
+		__entry->end = end;
+		__entry->state = state;
+	),
+
+	TP_printk("changed direct map state of guest_memfd range %lu to %lu to %s",
+		  __entry->start, __entry->end, __entry->state ? "present" : "not present")
+);
+#endif
+
 #endif /* _TRACE_KVM_MAIN_H */
 
 /* This part must be outside protection */
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 54387828dcc6a..a0b3b9cacd361 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -7,6 +7,7 @@
 #include <linux/set_memory.h>
 
 #include "kvm_mm.h"
+#include "trace/events/kvm.h"
 
 struct kvm_gmem {
 	struct kvm *kvm;
@@ -169,6 +170,8 @@ static __always_unused int kvm_gmem_folio_set_direct_map(struct folio *folio, pg
 	r = __kvm_gmem_folio_set_direct_map(folio, start, end, state);
 	folio_unlock(folio);
 
+	trace_kvm_gmem_direct_map_state_change(start, end, state);
+
 unlock_xa:
 	xa_unlock(&gmem_priv->direct_map_state);
 out:
@@ -216,6 +219,8 @@ static __always_unused int kvm_gmem_set_direct_map(struct inode *inode, pgoff_t
 		folio_batch_release(&fbatch);
 	}
 
+	trace_kvm_gmem_direct_map_state_change(start, end, state);
+
 	xa_unlock(&gmem_priv->direct_map_state);
 out:
 	return r;
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
