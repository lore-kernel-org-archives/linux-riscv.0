Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FBF1C43334
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jul 2022 09:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5VzkgiQXaoJEpxPRGeF6M/bbPnKHHng0Jk7thQfMqh0=; b=Yw1wOf7I0wVcqL
	MyAJeOvwZwV3esva5+kQMCusbqoYd3tBYraI9hdiMQKvXrbFrZLv7TbSA7zjNQAT4VEdlmMpKy3mS
	YnGhYYlZkho0hiaoI7AfcToL+0VDlimrZqpQPjJ9FPRRRRI08ozrApSMz74MYzT0ltvsDxkXofEN4
	XB4b4Xk12XbPPpMcqlC/JndsPzN8QFRacFWwSuDa6WFoDIZ7zbrcgYAWXS+Hdxp9NcbCIpLh79zqh
	53OnKSwrh4IwcgSij2iWJSoesAsVM8qhQc9XvaY+tBLyksF6PHNFSmoYYTapLL91u17UvB0yur+W3
	HczYhDR9VVVI6DKUYvHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE69v-003Oho-Ky; Wed, 20 Jul 2022 09:38:23 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE69m-003O4U-8J
	for linux-riscv@lists.infradead.org; Wed, 20 Jul 2022 09:38:16 +0000
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Lnr9y4nypzWf1R;
	Wed, 20 Jul 2022 17:33:58 +0800 (CST)
Received: from dggpemm500016.china.huawei.com (7.185.36.25) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 20 Jul 2022 17:37:31 +0800
Received: from huawei.com (10.67.175.41) by dggpemm500016.china.huawei.com
 (7.185.36.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 20 Jul
 2022 17:37:31 +0800
From: Yipeng Zou <zouyipeng@huawei.com>
To: <linux-riscv@lists.infradead.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <guoren@kernel.org>,
	<penberg@kernel.org>
CC: <zouyipeng@huawei.com>
Subject: [PATCH -next v2] riscv:uprobe remove set/clear SR_SPIE in arch_uprobe_pre/post/abort_xol
Date: Wed, 20 Jul 2022 17:34:47 +0800
Message-ID: <20220720093447.245585-1-zouyipeng@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.175.41]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_023814_552290_62A6BDDE 
X-CRM114-Status: UNSURE (   5.22  )
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

In riscv the process of uprobe going to clear spie before exec
the origin insn,and set spie after that.But When access the page
which origin insn has been placed a page fault may happen and
irq was disabled in arch_uprobe_pre_xol function,It cause a WARN
as follows.
There is no need to clear/set spie in arch_uprobe_pre/post/abort_xol.
We can just remove it.

[   31.684157] BUG: sleeping function called from invalid context at kernel/locking/rwsem.c:1488
[   31.684677] in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 76, name: work
[   31.684929] preempt_count: 0, expected: 0
[   31.685969] CPU: 2 PID: 76 Comm: work Tainted: G
[   31.686542] Hardware name: riscv-virtio,qemu (DT)
[   31.686797] Call Trace:
[   31.687053] [<ffffffff80006442>] dump_backtrace+0x30/0x38
[   31.687699] [<ffffffff80812118>] show_stack+0x40/0x4c
[   31.688141] [<ffffffff8081817a>] dump_stack_lvl+0x44/0x5c
[   31.688396] [<ffffffff808181aa>] dump_stack+0x18/0x20
[   31.688653] [<ffffffff8003e454>] __might_resched+0x114/0x122
[   31.688948] [<ffffffff8003e4b2>] __might_sleep+0x50/0x7a
[   31.689435] [<ffffffff80822676>] down_read+0x30/0x130
[   31.689728] [<ffffffff8000b650>] do_page_fault+0x166/x446
[   31.689997] [<ffffffff80003c0c>] ret_from_exception+0x0/0xc

Fixes: 74784081aac8 ("riscv: Add uprobes supported")
Signed-off-by: Yipeng Zou <zouyipeng@huawei.com>
---
v2: Add Fixes tag

 arch/riscv/kernel/probes/uprobes.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/riscv/kernel/probes/uprobes.c b/arch/riscv/kernel/probes/uprobes.c
index 7a057b5f0adc..c976a21cd4bd 100644
--- a/arch/riscv/kernel/probes/uprobes.c
+++ b/arch/riscv/kernel/probes/uprobes.c
@@ -59,8 +59,6 @@ int arch_uprobe_pre_xol(struct arch_uprobe *auprobe, struct pt_regs *regs)
 
 	instruction_pointer_set(regs, utask->xol_vaddr);
 
-	regs->status &= ~SR_SPIE;
-
 	return 0;
 }
 
@@ -72,8 +70,6 @@ int arch_uprobe_post_xol(struct arch_uprobe *auprobe, struct pt_regs *regs)
 
 	instruction_pointer_set(regs, utask->vaddr + auprobe->insn_size);
 
-	regs->status |= SR_SPIE;
-
 	return 0;
 }
 
@@ -111,8 +107,6 @@ void arch_uprobe_abort_xol(struct arch_uprobe *auprobe, struct pt_regs *regs)
 	 * address.
 	 */
 	instruction_pointer_set(regs, utask->vaddr);
-
-	regs->status &= ~SR_SPIE;
 }
 
 bool arch_uretprobe_is_alive(struct return_instance *ret, enum rp_check ctx,
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
