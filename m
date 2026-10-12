Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E1FCA9ED0
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 12:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UtyNvF6zQMUzk/7z37CQyOqgkO/tAnqvuZVXtAnmrUM=; b=O67B2oPOOVBTUg
	NjVeBQmzYXFCxRPK8XsQZkv+mrLikb/Df1KzArwO9PDgE3dMs7nf57oteIL42fFqlP67gyvNYyBNh
	Z17yN4eI86kq5a9ovczWIQtJwd44pXL+p7fSMTeEMfka9KuETU+nEJJkwUfO0OO2oD4MTryS5EVx6
	Gej79WoiMtudTwAh8BXK8hkXKR8CP5JzzQCsR3sCWLyipAr38f78LlVsORN+6KN88W4jVDe2PYaKB
	p5nKF1jLnr8aSYl+HWzF4JxGR8RjBiVlX757hd3BPZgj53cIY65UpbdLWJ9ClypNlWnMblDrjWA5a
	f8i+U/KuE0r6R/aQVorA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGF6K-0000000ARsC-0wEp;
	Mon, 12 Oct 2026 12:25:56 +0000
Received: from akranes.kaiser.cx ([2a0a:4cc0:1:11ef:4484:ccff:febf:ddfa])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGF6G-0000000ARrc-3ubV
	for linux-riscv@lists.infradead.org;
	Mon, 12 Oct 2026 12:25:55 +0000
Received: from ipservice-092-209-185-035.092.209.pools.vodafone-ip.de ([92.209.185.35] helo=nb282.user.codasip.com)
	by akranes.kaiser.cx with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <martin@kaiser.cx>)
	id 1xGF66-00000001gj8-0tXr;
	Mon, 12 Oct 2026 14:25:42 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Martin Kaiser <martin@kaiser.cx>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] ftrace: remove unused make_call_t0
Date: Mon, 12 Oct 2026 14:24:40 +0200
Message-ID: <20261012122516.90961-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.43.7
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_052553_841914_D7DD3D72 
X-CRM114-Status: UNSURE (   8.18  )
X-CRM114-Notice: Please train this message.
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

The make_call_t0 macro has been unused since commit b21cdb9523e5
("riscv: ftrace: support direct call using call_ops"). Remove it.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 arch/riscv/include/asm/ftrace.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
index e5026cd8f022..61849c1d71f5 100644
--- a/arch/riscv/include/asm/ftrace.h
+++ b/arch/riscv/include/asm/ftrace.h
@@ -95,14 +95,6 @@ struct dyn_arch_ftrace {
 	(((offset & AUIPC_OFFSET_MASK) + AUIPC_PAD) | AUIPC_T0) :	\
 	((offset & AUIPC_OFFSET_MASK) | AUIPC_T0))
 
-#define make_call_t0(caller, callee, call)				\
-do {									\
-	unsigned int offset =						\
-		(unsigned long) (callee) - (unsigned long) (caller);	\
-	call[0] = to_auipc_t0(offset);					\
-	call[1] = to_jalr_t0(offset);					\
-} while (0)
-
 /*
  * Only the jalr insn in the auipc+jalr is patched, so we make it 4
  * bytes here.
-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
