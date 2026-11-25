Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EC6606A326
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 16:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A+YcSiUu;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=R/Otpqdf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5W+hnSAD1YAEan3OpfF8nT5TWJCGNAUsfmeogfZDKPI=; b=A+YcSiUuqW49YzjGoRU77PRsUG
	brZCQgVdUtQkxsnCeQVpbb+TnRZtwN2rP4/wIXjeb0Jnj6I8S07ZkooKdyrF/ci4fAyDBGKacCSAy
	iJMulIrGk0bNqRhuvc90WrkDklPVKQevgxwSKpPuKcBvXxTf5N1kZdzaJaJ/EyQixXudYcD7ZXvDg
	gFJrDPYxMPWGl4gg4bCFbba0i5pGLbw9kJYjkMnnFW5Ar0zAl4xL2QUVNyzwWSBRa/korer9rJcmS
	+aJQmTLecX9nbET1BmtPII7Kiwf262gkaNxH3SMNBAv8hv5oUEG4x8ytChTBlXoUv7kzyKDFeUGbh
	5lxHKhRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFc1-0000000AVRz-3c4j;
	Wed, 25 Nov 2026 16:12:49 +0000
Received: from esa4.hc555-34.eu.iphmx.com ([207.54.77.171])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFbu-0000000AVNP-3zkK
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 16:12:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1795623163; x=1827159163;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=hBFiaxNAO8+/OHuQPaW+LpZx9mtSCVvvtreXstWnX98=;
  b=R/OtpqdfJQPwCx3rbI7xRGTJu/rjQutHkpb9iSse+JYSHez+c5KqmCsy
   5obPfeeeycck3R482j5olkCgD2YLfjYPbESC9HTpjwpiexURypqU2XezP
   gZ6CYUrUrWZog0XF4BpGtcMEYqnMmO6aL29JajnY7AHfZeWqA3WDsLNJk
   1LfsC3tysV0C6g37StRz1IUa/qFZxWGlEKK4JS5B5kJcmgv93G5buetix
   yVhTNczUZfPvVrWtKyT1DK0eKkvK5HfvvEzEy0FjCQUYrnQqtq5fR3YpV
   Gq4yOXHD7dXeh0zvgG2sLmDOvRxD5yKdEtDniKzoSbOS0Wmk/v5ltXkUT
   g==;
X-CSE-ConnectionGUID: oPj5FK7mSXq0/qMkICZeWg==
X-CSE-MsgGUID: Zh1wlovJRF+Xhw68H0dkfg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 18:12:34 +0200
X-CSE-ConnectionGUID: oJMcifliQjW9YKQBlxbgrQ==
X-CSE-MsgGUID: cBrXRjMLR0OGTKib8Uh/Ng==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces02_data.me-corp.lan with SMTP; 25 Nov 2026 18:20:57 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Wed, 25 Nov 2026 18:12:33 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Wed, 25 Nov 2026 18:12:17 +0200
Subject: [PATCH v5 1/3] riscv: kprobes: fix out-of-bounds read in
 riscv_probe_decode_insn
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261125-probes-in-lrsc-v5-1-38a32e53fcc2@mobileye.com>
References: <20261125-probes-in-lrsc-v5-0-38a32e53fcc2@mobileye.com>
In-Reply-To: <20261125-probes-in-lrsc-v5-0-38a32e53fcc2@mobileye.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, Guo Ren <guoren@kernel.org>, 
 Pekka Enberg <penberg@kernel.org>, 
 =?utf-8?q?Patrick_St=C3=A4hlin?= <me@packi.ch>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_081243_621054_129506D3 
X-CRM114-Status: GOOD (  13.92  )
X-Spam-Score: -2.4 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

riscv_probe_decode_insn() can trigger an out-of-bounds page fault
when probing a 16-bit compressed instruction at the end of a page.

arch_prepare_kprobe() safely reads 16-bit parcels into p->opcode, but then
passes p->addr to riscv_probe_decode_insn(), which unconditionally
dereferences *addr as a 32-bit probe_opcode_t

If a 16-bit instruction sits in the last two bytes of a mapped page next
to an unmapped page, the 32-bit read of *addr crosses the page boundary
and faults.

Passing &p->opcode instead of p->addr to riscv_probe_decode_insn()
(as arch_uprobe_analyze_insn() already does) avoid reading past the
instruction.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-812af091-20d1-4915-97a6-741f51e07022
Fixes: c22b0bcb1dd0 ("riscv: Add kprobes supported")
Reviewed-by: GUO Ren (XuanTie) <guoren@kernel.org>
Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 arch/riscv/kernel/probes/kprobes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
index 9e2afabf94e8..63ee5066def5 100644
--- a/arch/riscv/kernel/probes/kprobes.c
+++ b/arch/riscv/kernel/probes/kprobes.c
@@ -85,7 +85,7 @@ int __kprobes arch_prepare_kprobe(struct kprobe *p)
 		p->opcode |= (kprobe_opcode_t)(*insn) << 16;
 
 	/* decode instruction */
-	switch (riscv_probe_decode_insn(p->addr, &p->ainsn.api)) {
+	switch (riscv_probe_decode_insn(&p->opcode, &p->ainsn.api)) {
 	case INSN_REJECTED:	/* insn not supported */
 		return -EINVAL;
 

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
