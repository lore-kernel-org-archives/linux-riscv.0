Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B3BFC00140
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Aug 2022 03:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QZlI+zIk8EY406IfDmvFsuaGAZ5R8XnFrFpGI4+3MgU=; b=VJgHiPe09hA3qZ
	S83OPbG1t1Kv8EELvbFmd4+dUZTAeanlb/wJGlb6060eBkLOVwo4QnM3atArikdgOniLohGyIwT/2
	aigAwS9EtP3KYQSTLfAT1o89H7YcegNKALQ9Vsln8EZ2HqMTIbciRjY1wbe7w+zVjjmZFyGecMzAe
	7hGnXzjXzoz/K2Y4TxsIVBh6aLh/afZxehno3kAq6JerrkhnUEhWhfKxzhIVQtlKS6D98TsPCjuKS
	MJIirBFnxYGYF+g0H5ztaCra/5iHOdyYorMjdgEmS+MNJ6XClHPno51xXTYoY7wJwNMUZRQcZvvi5
	b/GBFk1Kz8iqc69ONdDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPxkA-004H3C-JI; Mon, 22 Aug 2022 03:04:50 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPxk4-004GvG-2k
	for linux-riscv@lists.infradead.org; Mon, 22 Aug 2022 03:04:46 +0000
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4M9xwh2XvFznTVh;
	Mon, 22 Aug 2022 11:02:12 +0800 (CST)
Received: from dggpemm500016.china.huawei.com (7.185.36.25) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 22 Aug 2022 11:04:29 +0800
Received: from huawei.com (10.67.175.41) by dggpemm500016.china.huawei.com
 (7.185.36.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 22 Aug
 2022 11:04:28 +0800
From: Yipeng Zou <zouyipeng@huawei.com>
To: <linux-riscv@lists.infradead.org>, <oleg@redhat.com>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<guoren@kernel.org>
CC: <zouyipeng@huawei.com>
Subject: [PATCH -next 1/2] riscv: ptrace: Implement PTRACE_{PEEK,POKE}USR
Date: Mon, 22 Aug 2022 11:01:04 +0800
Message-ID: <20220822030105.16053-2-zouyipeng@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220822030105.16053-1-zouyipeng@huawei.com>
References: <20220822030105.16053-1-zouyipeng@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.175.41]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220821_200444_578553_46EE3345 
X-CRM114-Status: GOOD (  12.11  )
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

Implement PTRACE_{PEEK,POKE}USR for RV64 user app to peek/poke tracee's
space register.

As the Linux manual page say: the addr is define to a word offset in
the tracee's USER area.In riscv it's defined in:

struct user {
	struct user_regs {
		ulong pc;	// addr 0
		ulong ra;	// addr 8
		...
		...
		ulong t6;	// addr 248
	}
	struct d_ext_state {
		u64 f[0];	// addr 256
		...
		...
		u64 f[31];	// addr 504
		u32 fcsr;	// addr 512 read-only
	}
}

Signed-off-by: Yipeng Zou <zouyipeng@huawei.com>
---
 arch/riscv/kernel/ptrace.c | 66 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 2ae8280ae475..6dc0687e419f 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -215,12 +215,78 @@ void ptrace_disable(struct task_struct *child)
 	clear_tsk_thread_flag(child, TIF_SYSCALL_TRACE);
 }
 
+static inline unsigned long ptrace_get_gpr_reg(struct task_struct *child, unsigned long offset)
+{
+	struct pt_regs *regs = task_pt_regs(child);
+
+	return *((unsigned long *)regs + offset / sizeof(regs->a0));
+}
+
+static inline int ptrace_set_gpr_reg(struct task_struct *child, unsigned long offset,
+				     unsigned long data)
+{
+	struct pt_regs *regs = task_pt_regs(child);
+
+	*((unsigned long *)regs + offset / sizeof(regs->a0)) = data;
+	return 0;
+}
+
+#ifdef CONFIG_FPU
+static inline unsigned long ptrace_get_fpr_reg(struct task_struct *child, unsigned long offset)
+{
+	struct __riscv_d_ext_state *fstate = &child->thread.fstate;
+
+	if (offset <= offsetof(struct __riscv_d_ext_state, f[31]))
+		return fstate->f[offset / sizeof(fstate->f[0])];
+	else if (offset == offsetof(struct __riscv_d_ext_state, fcsr))
+		return fstate->fcsr;
+	return -EIO;
+}
+
+static inline int ptrace_set_fpr_reg(struct task_struct *child, unsigned long offset,
+				     unsigned long data)
+{
+	struct __riscv_d_ext_state *fstate = &child->thread.fstate;
+
+	if (offset <= offsetof(struct __riscv_d_ext_state, f[31]))
+		fstate->f[offset / sizeof(fstate->f[0])] = data;
+	else /* Only f[0] ~ f[31] can write by PTRACE_POKEUSR */
+		return -EIO;
+	return 0;
+}
+#endif
+
 long arch_ptrace(struct task_struct *child, long request,
 		 unsigned long addr, unsigned long data)
 {
 	long ret = -EIO;
+	unsigned long __user *datap = (unsigned long __user *)data;
 
 	switch (request) {
+	case PTRACE_PEEKUSR:
+	case PTRACE_POKEUSR:
+		/* addr must be aligned to register size */
+		if (addr & (sizeof(addr) - 1))
+			break;
+
+		if (addr < sizeof(struct user_regs_struct)) {
+			if (request == PTRACE_PEEKUSR)
+				ret = put_user(ptrace_get_gpr_reg(child, addr), datap);
+			else	// PTRACE_POKEUSR
+				ret = ptrace_set_gpr_reg(child, addr, data);
+#ifdef CONFIG_FPU
+		} else if (addr < (sizeof(struct user_regs_struct) +
+				   sizeof(struct __riscv_d_ext_state))) {
+			addr -= sizeof(struct user_regs_struct);
+			if (request == PTRACE_PEEKUSR)
+				ret = put_user(ptrace_get_fpr_reg(child, addr), datap);
+			else	// PTRACE_POKEUSR
+				ret = ptrace_set_fpr_reg(child, addr, data);
+#endif
+		} else {
+			// addr invalid
+		}
+		break;
 	default:
 		ret = ptrace_request(child, request, addr, data);
 		break;
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
