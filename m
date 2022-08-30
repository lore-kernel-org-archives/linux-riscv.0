Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AFB8ECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 06:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P5icRoS/2eDrD+a2hIRLwWtzmK75byOFY5FVq+YDP+w=; b=Z+1LrLFz31uj4G
	sw4oU6OPB3VD1Zk1GRMxOEeQ6wepTMo5b7Sg9msiQ8bu9niei1/ZLaLQ580OJefensyn1B2SDZtdH
	76FsLTQqugZm2YijSYAdZVkxZfqzgUM07FROXAVZFtCqIh/Y4+BIPTQGOBZNmAIzZTFX2GmAZXkch
	ieRe8r/z3ujq3gvaHJTqXoNot1GTEu7o/rerOuW9s9lK20imMuMTdorgph+jkGwowvXfAekJmEf/f
	QXJlvfJPL3YrzQiwOJy1s4RvcSlDYKpHB9Z0z9Y/Zq28qYqj23TPQu/nhrCvjfDXVZgai6vI23sOl
	qJv4XaTnBZ0MabHlv/Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSv9S-00EZw3-Ei; Tue, 30 Aug 2022 06:55:10 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSv85-00EZDt-R6; Tue, 30 Aug 2022 06:53:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 689E9B815D1;
	Tue, 30 Aug 2022 06:53:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95177C43141;
	Tue, 30 Aug 2022 06:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661842423;
	bh=6jVazXBqfWdKpxDWhL1vnDZxpkMfN57CDtGrBVFvRs4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F5PrLREEw9ieJXHk2T6r8fNSMm4hqpEggsRJrXPWuFPl7+oJKfH/xBCo0A6FJO0y2
	 t9K5uxEE398h542YOD7o2yTfT4WHu83D6O1abG132Tc4bQAupCKANNBSa193HMsikz
	 4M3nENDu9L/3n8h3C0uJfXqbSAkKm+orfEcMHOgDUj056bJn4i+7AKEbgu317hT+U3
	 3aqhj2tDhdw86//1qF+BA6svknF5okzAHkY4nNxbm4KxsHyWfDR9AJ+3fwLF8hBKQj
	 DIDDu38CXvQN9Ac3hF/lVAAzTDYfnjIUHHuFPh1gUncCU4gVLx3CzOPt9r0MIDKxVd
	 ZacRoVho/xM/A==
From: guoren@kernel.org
To: oleg@redhat.com,
	vgupta@kernel.org,
	linux@armlinux.org.uk,
	monstr@monstr.eu,
	dinguyen@kernel.org,
	palmer@dabbelt.com,
	davem@davemloft.net,
	arnd@arndb.de,
	shorne@gmail.com,
	guoren@kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-snps-arc@lists.infradead.org,
	sparclinux@vger.kernel.org,
	openrisc@lists.librecores.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH 2/3] openrisc: ptrace: Remove duplicate operation
Date: Tue, 30 Aug 2022 02:53:15 -0400
Message-Id: <20220830065316.3924938-3-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220830065316.3924938-1-guoren@kernel.org>
References: <20220830065316.3924938-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_235346_076772_AF524F2A 
X-CRM114-Status: UNSURE (   9.14  )
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

From: Guo Ren <guoren@linux.alibaba.com>

The TIF_SYSCALL_TRACE is controlled by a common code, see
kernel/ptrace.c and include/linux/thread.h.

clear_task_syscall_work(child, SYSCALL_TRACE);

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/openrisc/kernel/ptrace.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/openrisc/kernel/ptrace.c b/arch/openrisc/kernel/ptrace.c
index b971740fc2aa..cc53fa676706 100644
--- a/arch/openrisc/kernel/ptrace.c
+++ b/arch/openrisc/kernel/ptrace.c
@@ -132,7 +132,6 @@ void ptrace_disable(struct task_struct *child)
 	pr_debug("ptrace_disable(): TODO\n");
 
 	user_disable_single_step(child);
-	clear_tsk_thread_flag(child, TIF_SYSCALL_TRACE);
 }
 
 long arch_ptrace(struct task_struct *child, long request, unsigned long addr,
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
