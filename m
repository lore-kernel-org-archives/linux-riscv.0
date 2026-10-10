Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA348CA601E
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Oct 2026 00:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=21hmNDie+i6zL1M72ZEQrnJ10TJ5iQ/qwKpw4362lEE=; b=B46lqcroNk/GPl
	QFa2Yfz/4dlqjr/ypAe7f3ZNwGMkBZJrBCqKOu5zZgD6U+gvNo8bRmRQ5Q0ytXALSgapELMn0AieA
	s6doDZRmrJD3afz/hGkwldsiwAe71oU+LS4Yw2beUWT3R8OTdUob11DMstfX3B7WqDFkFejitXrXZ
	jZxohap7/ndszaMW1mAHTM5sJJTiQot369L4So/QQOp6BATcrA3EDXV6sK2IB4NZTDprMg1n2l2DO
	LubHW1VqK0xaeeRIT73AQUdmhDkH0xMvvXpd3PP9H3+4TaWU63Estv4tvQDTxb7UUT257titnz0eM
	m91PdQ5r5TmdG0GRrJbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFKp8-00000007MVL-2uRK;
	Sat, 10 Oct 2026 00:20:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFKp7-00000007MVF-0QGy
	for linux-riscv@lists.infradead.org;
	Sat, 10 Oct 2026 00:20:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 05E8E60211;
	Sat, 10 Oct 2026 00:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43E041F000FF;
	Sat, 10 Oct 2026 00:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791591623;
	bh=IyxiWgY/OresKPmRcZQ5FzYMHN44S+1AZllFk55N12c=;
	h=From:To:Cc:Subject:Date;
	b=doApGa7rp7sj1yczpm7FjD7fsDVyhJJlZpp5q69fSQvACQ1iJ9neXiupMIhxznLfu
	 bIVSF4OxA6XFM3Kp/4pWDZvFRNwWG7KaS86deLDAOXlEBzePeRHNCmveGlaTMR400V
	 H2+tRLP6dZqUBHyY7ipvvZGjfDk3r3yn985jxL5WCz7BR/4tXsxHGjxPZcD2X3ZBtG
	 LlhoKCNUVmWRZcnRx/k00K6W2rjVNsjO5Kf7rGpKEfeRopt/lvpW6NaEmYo4b5eeHZ
	 K0FNnkptcZszjRuByI36tSeZvAmbDLxUTQAvS52Fl9vRBJTEp2ykQ0hCnLNQTRlZ9s
	 28uKKnzpH0TGQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: make thread_info smaller for RV64
Date: Sat, 10 Oct 2026 08:00:25 +0800
Message-ID: <20261010000025.29569-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
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

On RV64 platforms, the thread_info structure is non-necessary bigger
due to padding. Move the "cpu" member to "preempt_count" to remove
the padding.

when !SHADOW_CALL_STACK and !RISCV_USER_CFI
Before the patch, sizeof(struct thread_info) == 72
After the patch, sizeof(struct thread_info) == 64

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/thread_info.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 55019fdfa9ec..9f358c3ddeb0 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -53,6 +53,7 @@
 struct thread_info {
 	unsigned long		flags;		/* low level flags */
 	int                     preempt_count;  /* 0=>preemptible, <0=>BUG */
+	int			cpu;
 	/*
 	 * These stack pointers are overwritten on every system call or
 	 * exception.  SP is also saved to the stack it can be recovered when
@@ -60,7 +61,6 @@ struct thread_info {
 	 */
 	long			kernel_sp;	/* Kernel stack pointer */
 	long			user_sp;	/* User stack pointer */
-	int			cpu;
 	unsigned long		syscall_work;	/* SYSCALL_WORK_ flags */
 #ifdef CONFIG_SHADOW_CALL_STACK
 	void			*scs_base;
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
