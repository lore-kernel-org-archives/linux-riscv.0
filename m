Return-Path: <SRS0=jthF=ID=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B1B3C433E0
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Mar 2021 11:03:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4CCD64FF0
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Mar 2021 11:03:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4CCD64FF0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zVzDm0V9vt4zMUbmXfQkZiTqzDeGSfZ0eItgYIJve+A=; b=It/1pH8Ow9R1IEpYFt9TIB8AS
	AVvW04XzqieSlC4AQkgpyz2h0cyubfYfz3K/SXMUPmvW97Au+1975chYIQ6ukKjV4MnvQu2wIjxny
	KEbjVkURGthfCX4BiloH//R3HB6Nd4TKQJ1N/Jt6KWnOlNnHTSIzfZ3j1Rxhqm6Z7YViKA816r6Wa
	JPRPX+PCPOkxvKPYz+GFJJk+XleohaHGmZPnuHDIPiJE9rlBs8WpVXsP3kjb8wskSygrDvwW8PHRp
	zUsKw2SgGILjvGbDEYqaY3+AVSHXqbkY0ca5abj2qIomZq+gMPxAfBfu3re6GwdMoVd7s8e1g8XGC
	Bu+Bv4dmw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lI8Eq-00Efwe-6A; Fri, 05 Mar 2021 11:03:20 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lI8EZ-00Efoe-IB
 for linux-riscv@lists.infradead.org; Fri, 05 Mar 2021 11:03:07 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DsPtd69zrzjVjh;
 Fri,  5 Mar 2021 19:01:29 +0800 (CST)
Received: from huawei.com (10.175.113.32) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.498.0; Fri, 5 Mar 2021
 19:02:46 +0800
From: Nanyong Sun <sunnanyong@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <palmerdabbelt@google.com>, <atish.patra@wdc.com>,
 <wangkefeng.wang@huawei.com>, <sunnanyong@huawei.com>
Subject: [PATCH 8/9] riscv: ftrace: Use ftrace_get_regs helper
Date: Fri, 5 Mar 2021 19:33:31 +0800
Message-ID: <20210305113332.428048-9-sunnanyong@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210305113332.428048-1-sunnanyong@huawei.com>
References: <20210305113332.428048-1-sunnanyong@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.32]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210305_110304_687589_6876A742 
X-CRM114-Status: UNSURE (   9.27  )
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

Use ftrace_get_regs() helper call to get pt_regs from ftrace_regs struct,
this makes the code simpler.

Signed-off-by: Nanyong Sun <sunnanyong@huawei.com>
---
 arch/riscv/kernel/probes/ftrace.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/kernel/probes/ftrace.c b/arch/riscv/kernel/probes/ftrace.c
index e6372490aa0b..2dfb33fdac74 100644
--- a/arch/riscv/kernel/probes/ftrace.c
+++ b/arch/riscv/kernel/probes/ftrace.c
@@ -4,37 +4,39 @@
 
 /* Ftrace callback handler for kprobes -- called under preepmt disabed */
 void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
-			   struct ftrace_ops *ops, struct ftrace_regs *regs)
+			   struct ftrace_ops *ops, struct ftrace_regs *fregs)
 {
 	struct kprobe *p;
+	struct pt_regs *regs;
 	struct kprobe_ctlblk *kcb;
 
 	p = get_kprobe((kprobe_opcode_t *)ip);
 	if (unlikely(!p) || kprobe_disabled(p))
 		return;
 
+	regs = ftrace_get_regs(fregs);
 	kcb = get_kprobe_ctlblk();
 	if (kprobe_running()) {
 		kprobes_inc_nmissed_count(p);
 	} else {
-		unsigned long orig_ip = instruction_pointer(&(regs->regs));
+		unsigned long orig_ip = instruction_pointer(regs);
 
-		instruction_pointer_set(&(regs->regs), ip);
+		instruction_pointer_set(regs, ip);
 
 		__this_cpu_write(current_kprobe, p);
 		kcb->kprobe_status = KPROBE_HIT_ACTIVE;
-		if (!p->pre_handler || !p->pre_handler(p, &(regs->regs))) {
+		if (!p->pre_handler || !p->pre_handler(p, regs)) {
 			/*
 			 * Emulate singlestep (and also recover regs->pc)
 			 * as if there is a nop
 			 */
-			instruction_pointer_set(&(regs->regs),
+			instruction_pointer_set(regs,
 				(unsigned long)p->addr + MCOUNT_INSN_SIZE);
 			if (unlikely(p->post_handler)) {
 				kcb->kprobe_status = KPROBE_HIT_SSDONE;
-				p->post_handler(p, &(regs->regs), 0);
+				p->post_handler(p, regs, 0);
 			}
-			instruction_pointer_set(&(regs->regs), orig_ip);
+			instruction_pointer_set(regs, orig_ip);
 		}
 
 		/*
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
