Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE4DC4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Nov 2022 06:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A4k8RWzWbLvIX6EPh6Y23TtZUHwdXs2Qg9q0K167OKI=; b=JbjcGynwznuckY
	EB+BtL3T07xeYu0jrcu2LrDfHzelQrJW1Cexm4YHBGpnmu4VHJThUJlwrUZibQvO9Kzi7kOaxZWCc
	0f6FfJebNh20PPwOU3QFSrV8w9yIQ64Yj6FjgrY/rkBh+Oo5P5aH+RcdFp++XnKQsYGyLMfeuGZlO
	CQkzkDzqL6xM9qW2QwDmF8K1x2/7ruQBdyZduGkM4KzNxMgJttMJGGb6TtJkPBAFoHvL2S5GNbON6
	cEoQ6Yn5GZ/Zt8ERzXCyvPE9MBhE+V0/exV8pUN9yLq0JqPEMeuArjxjd4D/Xt2LnxwO5gUKouLp8
	x30juwA2+WgTYWcAdDtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oseuS-00BMen-SD; Wed, 09 Nov 2022 06:50:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oseuQ-00BMdL-LI
	for linux-riscv@lists.infradead.org; Wed, 09 Nov 2022 06:50:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EE991618B9;
	Wed,  9 Nov 2022 06:50:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A875C43470;
	Wed,  9 Nov 2022 06:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667976601;
	bh=DwVEaVj4L6g3T9BDJpJF+Y6rdkgMq0eaBMuAtX/lkSY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TeF4RhteKOWuXuKRiJsMMup1NYGJlKSOB0M8riRuaSJ9l1KjDZexIIra2gr/DeioW
	 GveugXwtOp3eOgr7ELI9Jc9G5moMoT+lxavZb9T8sWa2OVnUF4o2oY6IJQTrS44yF9
	 REsxjvMBCeR+uE7W376P2ZdV4oPA3QmzQD9bIEbsM6WRHwSRjxjHt0TK9c3RYzEO+D
	 /CZGS2NRO+SymjGNQQa4fhJ2bvzxpGc8EzZCaEl8h78oHyNw035IpqefXPX+SDSFg8
	 FJvjvPA+scgY++BQiHeEWG+U9i2K33uHnrQcgIFVx9AEZWtDlmAkS7Uy5sFzxj38qP
	 24Le0jfL2r1sA==
From: guoren@kernel.org
To: anup@brainfault.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	peterz@infradead.org,
	arnd@arndb.de,
	linux-arch@vger.kernel.org,
	keescook@chromium.org,
	paulmck@kernel.org,
	frederic@kernel.org,
	nsaenzju@redhat.com,
	changbin.du@intel.com,
	vincent.chen@sifive.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>,
	Alan Kao <alankao@andestech.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH 1/2] riscv: stacktrace: Fixup ftrace_graph_ret_addr retp argument
Date: Wed,  9 Nov 2022 01:49:36 -0500
Message-Id: <20221109064937.3643993-2-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221109064937.3643993-1-guoren@kernel.org>
References: <20221109064937.3643993-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_225002_762888_F608F64A 
X-CRM114-Status: GOOD (  12.05  )
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

From: Guo Ren <guoren@linux.alibaba.com>

The 'retp' is a pointer to the return address on the stack, so we
must pass the current return address pointer as the 'retp'
argument to ftrace_push_return_trace(). Not parent function's
return address on the stack.

Fixes: b785ec129bd9 ("riscv/ftrace: Add HAVE_FUNCTION_GRAPH_RET_ADDR_PTR support")
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Alan Kao <alankao@andestech.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/kernel/stacktrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index 08d11a53f39e..bcfe9eb55f80 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -58,7 +58,7 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 		} else {
 			fp = frame->fp;
 			pc = ftrace_graph_ret_addr(current, NULL, frame->ra,
-						   (unsigned long *)(fp - 8));
+						   &frame->ra);
 		}
 
 	}
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
