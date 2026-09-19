Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F6D7C982CC
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Sep 2026 03:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:Message-Id:Date:Cc:Subject:To:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cDcVDCwyKO5PfugI/fFieBrjuJ7Qrv50/OEbqKTaPMA=; b=3D4Zt4bYbxiZ+3
	fYV/q1tCUueUI3lHviPGGBkYN/ErpIAG+r8pvvn27+Ah6N3H1v3TTGEKONZtXmCL5KVyp84Pp3f3L
	NIWFWqEQfWbT22rn71Tg9AmySCIxajEZ8wnUAmFrIALDBH2gQNhfP+OnDi39rBLQAIygVQj/gYpiV
	qWKU2+pTb0dGbl/fFzx5G2AlDgTSLlYdv9rk7kjXvbct7Mz7XLAVrkeQjrPjNNAKzKsGrsPGinQCZ
	uGTN5huK4LKkYMrJukry9RXxV9/zEunwWSAyFIIQSL8wg4g5fXDLo9wPEyJowdVsolujR5zxtzAWy
	CgjMjMnKg7U/rlxZNRKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ltn-0000000Fv7x-3BdR;
	Sat, 19 Sep 2026 03:38:00 +0000
Received: from va-1-113.ptr.blmpb.com ([209.127.230.113])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ltj-0000000Fv7d-33up
	for linux-riscv@lists.infradead.org;
	Sat, 19 Sep 2026 03:37:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1789789067; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=tITefMGqaFRIFOyQ8G6JxHpJ8JHWEXlXUu5h2s/nSBo=;
 b=CTyfb2m7IkMzLj27iHtTKxQq3349EKzYBps+tEpHqDioDL7pZyMurycIqyK8o5f+o9xrJj
 Aeb+P3F2HhO+vSss4wKnkzb9aCRBb7bKrFlF3jF9vhi2xS47TypmmlWsdERiYharekfajb
 W7IMDAIIrYvc+WSdE6einjD6EoYOxQDx6T+N4AqzkwtON6Y8et/697q8WxW54MocWsSWIG
 x9IdxmJIWT6ZZ+9Gc0XpJvaHarFLsxQw4RmcTezABrXRP+avDWPKtjQ6E1FWspuCvUmjVu
 8rzLPNz6lQjOOYVxzEW7XwajukcmzMncR2AS2vz8F13Ov319ESgAp0aP3OWGmg==
Mime-Version: 1.0
To: <rostedt@goodmis.org>
X-Lms-Return-Path: <lba+26aae0389+c611ea+lists.infradead.org+qirui.001@bytedance.com>
X-Mailer: git-send-email 2.20.1
X-Original-From: Rui Qi <qirui.001@bytedance.com>
Subject: [PATCH 0/2] riscv: ftrace: use frame CFA as the function graph retp identity
Cc: "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	=?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>, 
	"Chunyan Zhang" <zhangchunyan@iscas.ac.cn>, 
	"Guo Ren" <guoren@kernel.org>, "Jiakai Xu" <xujiakai2025@iscas.ac.cn>, 
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	<linux-trace-kernel@vger.kernel.org>, 
	"Mark Rutland" <mark.rutland@arm.com>, 
	"Masami Hiramatsu" <mhiramat@kernel.org>, 
	"Mathieu Desnoyers" <mathieu.desnoyers@efficios.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, "Paul Walmsley" <pjw@kernel.org>, 
	"Song Shuai" <suagrfillet@gmail.com>
Date: Sat, 19 Sep 2026 11:37:24 +0800
Message-Id: <20260919033726.1361382-1-qirui.001@bytedance.com>
From: "Rui Qi" <qirui.001@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_203756_034193_0EB6EA9F 
X-CRM114-Status: UNSURE (   6.80  )
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

RISC-V dynamic function graph tracing currently saves &fregs->ra as the
graph retp -- the lookup key that ftrace_graph_ret_addr() matches against
shadow stack entries. That address points into ftrace_caller's temporary
fregs frame, which disappears once ftrace_caller returns. Later stack
unwinding finds return_to_handler in the traced function's own frame and
looks it up with the frame CFA, so the saved entry can never match. The
same mismatch breaks function_get_true_parent_ip(), which looks up the
original parent with the saved entry SP rather than &fregs->ra.

Patch 1 clarifies the ftrace_graph_ret_addr() documentation: retp is
compared, not dereferenced, and may be any stable frame identity as long
as the graph entry path and the unwinder use the same value. 

Patch 2 makes RISC-V use the frame CFA for that identity: the static _mcount
path derives it from &frame->ra, the dynamic ftrace path uses the saved
entry SP, and the frame-pointer unwinder tracks the same CFA when
recovering graph return addresses.

Build-tested for rv64 with gcc and clang (full vmlinux).

Rui Qi (2):
  ftrace: Clarify function graph retp identity
  riscv: ftrace: Use frame CFA for function graph retp

 arch/riscv/kernel/ftrace.c     | 10 ++++++++--
 arch/riscv/kernel/stacktrace.c |  2 +-
 kernel/trace/fgraph.c          |  7 +++++--
 3 files changed, 14 insertions(+), 5 deletions(-)

-- 
2.20.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
