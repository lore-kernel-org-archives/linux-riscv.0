Return-Path: <SRS0=/EkZ=I3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E282BC433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Mar 2021 23:58:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D6A061878
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Mar 2021 23:58:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D6A061878
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XN0GxsHmFmSmGLWb2vyfQKhJ92tWIaem2xxjdpZW8zE=; b=B1dtgWr5kHGlHHoVTI1p8APW9y
	6HU/5d89LiDrvvw2R0YHZ2bfOsoyY8D8ZvOnZX9ZeZxai57W+xjX5gCBcmHfOUmWCMScR50WHKTzx
	Ujqme1NXaAETTEpcsxzxcJjH+hIBNr46nei1FQgGc9DOYIfu0JNuj61IV2GIQaSo/hlOIHTgLLFRy
	C3OlrgW/Tnk+HxzXeT5UqD6GLzqiDGT82nw73/RsIiz0II3gPzTIM32yr4SSPPYTFFFAGkQDHbGdH
	GMuwVqEeIVwSUVhk85GPvh9ppGgmcpwkttyJ6HgdTT2dWNferW8lQtvnjmfU0u+FDgCaSbVePj17K
	b24fsuZA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR1m7-00254X-9C; Mon, 29 Mar 2021 23:58:27 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lQwKa-000zTF-QQ
 for linux-riscv@lists.infradead.org; Mon, 29 Mar 2021 18:09:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=ZS4sNHYnf4mHchiCAeNyrhMnw8aw/DbuimEBHiZWFHA=; b=mA+AQziL9xSex
 kDHbf1VpmhuJxP0QQg2H8fwLSMAG6/L4iHtHbjeD12wB/iyMZlQYA5GljBg8gmbt
 gDqI44Zq1IIn5tjXfHDEj2WkF5S0GqriCAjMSw2Lvi9byEISnkQyx5APhhJip8Zd
 fKkvShgKYjP9I4sT+t1GKBwDqbJQdg=
Received: from xhacker (unknown [101.86.19.180])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygAXHkrQF2Jgo9tpAA--.35554S2; 
 Tue, 30 Mar 2021 02:09:22 +0800 (CST)
Date: Tue, 30 Mar 2021 02:04:16 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet
 <corbet@lwn.net>, Masami Hiramatsu <mhiramat@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [PATCH] samples/kprobes: Add riscv support
Message-ID: <20210330020416.129505e6@xhacker>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygAXHkrQF2Jgo9tpAA--.35554S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFy3CryfuF43KF4xZw48Crg_yoW8Wr18p3
 Z0y3W5Aa1rtr1Y9ayavF4vgryjkryq93yrurZ2k34Yya4Ivr45AF1F93W0y395uryrXw43
 tryFvr9rJ3WfArUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyIb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
 C2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
 F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
 4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCFx2Iq
 xVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r
 106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AK
 xVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7
 xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWU
 JVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7GYLDUUUU
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_190942_149387_9C8757A8 
X-CRM114-Status: UNSURE (   7.85  )
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

From: Jisheng Zhang <jszhang@kernel.org>

Add riscv specific info dump in both handler_pre() and handler_post().

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 samples/kprobes/kprobe_example.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/samples/kprobes/kprobe_example.c b/samples/kprobes/kprobe_example.c
index 331dcf151532..c495664c0a9b 100644
--- a/samples/kprobes/kprobe_example.c
+++ b/samples/kprobes/kprobe_example.c
@@ -47,6 +47,10 @@ static int __kprobes handler_pre(struct kprobe *p, struct pt_regs *regs)
 	pr_info("<%s> pre_handler: p->addr = 0x%p, pc = 0x%lx, cpsr = 0x%lx\n",
 		p->symbol_name, p->addr, (long)regs->ARM_pc, (long)regs->ARM_cpsr);
 #endif
+#ifdef CONFIG_RISCV
+	pr_info("<%s> pre_handler: p->addr = 0x%p, pc = 0x%lx, status = 0x%lx\n",
+		p->symbol_name, p->addr, regs->epc, regs->status);
+#endif
 #ifdef CONFIG_S390
 	pr_info("<%s> pre_handler: p->addr, 0x%p, ip = 0x%lx, flags = 0x%lx\n",
 		p->symbol_name, p->addr, regs->psw.addr, regs->flags);
@@ -80,6 +84,10 @@ static void __kprobes handler_post(struct kprobe *p, struct pt_regs *regs,
 	pr_info("<%s> post_handler: p->addr = 0x%p, cpsr = 0x%lx\n",
 		p->symbol_name, p->addr, (long)regs->ARM_cpsr);
 #endif
+#ifdef CONFIG_RISCV
+	pr_info("<%s> post_handler: p->addr = 0x%p, status = 0x%lx\n",
+		p->symbol_name, p->addr, regs->status);
+#endif
 #ifdef CONFIG_S390
 	pr_info("<%s> pre_handler: p->addr, 0x%p, flags = 0x%lx\n",
 		p->symbol_name, p->addr, regs->flags);
-- 
2.31.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
