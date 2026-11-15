Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C37D606A8A5
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Nov 2026 12:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wwk+W7Op;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=Cq1uOvPn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5W+hnSAD1YAEan3OpfF8nT5TWJCGNAUsfmeogfZDKPI=; b=wwk+W7OpFumQXp31xAt5XMumhA
	4jaZvcpHgzf/NkWERxT3K1ZlB2V9OavCPbhEhAsvvuuATMKSM1HYhioLFX2L3QtdHTF9suTq47CAi
	ZgoXR89G1KUOPFABm/REqrliD3zmP6WFchULpWohXTjILqaD9RP3lRs+8fAURV5Y8nFfJ1N/KkPOg
	G9PmYS9UofxWQ0ht9QIHIYpAsLJYoJDB2zoeW/O2Ll1nP6QJ4fvMl0Szo8RBAgfwWs2V9+Gi8MbJH
	tRjXx4siAmuKPmJ059MhLg3Wv1uJlsLK23k3jMRzW9Qj9AO1+aGmWTwznG3SOudzIdTLdzmGDBF/c
	hd9b2oOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSZVU-0000000HWSc-1fPg;
	Sun, 15 Nov 2026 12:38:52 +0000
Received: from esa2.hc555-34.eu.iphmx.com ([23.90.104.147])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSZVP-0000000HWQn-2w8z
	for linux-riscv@lists.infradead.org;
	Sun, 15 Nov 2026 12:38:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1794746327; x=1826282327;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=hBFiaxNAO8+/OHuQPaW+LpZx9mtSCVvvtreXstWnX98=;
  b=Cq1uOvPnF6JLyb9EQOpv5uXVUpOqlwUNc35AMlWaTUIva0pzP80H+Rab
   zoi47MYe+iTjxdb4CXwNxHpLhsqvpsWhNoRJhWrXCAF9B+8poS7MshF8j
   wcburfcuU3/7OiykGS1QBdxCMdEYO7hyDXw+bLdZnB6AQAoyeSnFVtD+L
   U1WrxZkAwbHpIhl6oS4pTvfxGSDjt2KKqnd+fO0Qqp8JP++N/f4/ygOa8
   0ZBzownT4Qj2mhKSwSplS+oc8GFGOVjUIZehkq3d8vZp/yTG8mQKzRiVB
   ksNlheZlIBWYf3kVoDoKNv+f95hm8vjo4pPQ7YJfI1eBzFIlr9EepCJSk
   Q==;
X-CSE-ConnectionGUID: 3BkzRWWSR9WnNDjsf36bxg==
X-CSE-MsgGUID: BAF5/DGiSjmgv0JPvFibyw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 14:38:43 +0200
X-CSE-ConnectionGUID: CN9K0/jSSsmsMsC8BT6mwg==
X-CSE-MsgGUID: lXu0cJM9ShWVr2HvNxaj5Q==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.3])
  by ces03_data.me-corp.lan with SMTP; 15 Nov 2026 14:46:44 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Sun, 15 Nov 2026 14:38:42 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Sun, 15 Nov 2026 14:37:33 +0200
Subject: [PATCH v4 1/3] riscv: kprobes: fix out-of-bounds read in
 riscv_probe_decode_insn
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-probes-in-lrsc-v4-1-48b9b036bd1d@mobileye.com>
References: <20261115-probes-in-lrsc-v4-0-48b9b036bd1d@mobileye.com>
In-Reply-To: <20261115-probes-in-lrsc-v4-0-48b9b036bd1d@mobileye.com>
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
X-CRM114-CacheID: sfid-20261115_043848_227232_BC48216A 
X-CRM114-Status: GOOD (  13.60  )
X-Spam-Score: -4.0 (----)
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
