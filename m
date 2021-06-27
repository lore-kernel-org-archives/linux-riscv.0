Return-Path: <SRS0=W22O=LV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5053CC48BC2
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Jun 2021 09:27:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04E5B61C32
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Jun 2021 09:27:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04E5B61C32
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9VQOC7CCjibLfBCLloInLCPXQzOGX8/xdaptT41RplE=; b=WApM02iR7gMlP2
	hiRajWAhbYFMj/wzApnqLrelxZTmZobHQl1VXCoAFm8TZd11ZMk9hkdIZ8o1EIEGVxV7Cu1On/LiY
	RUwcC7c8kWBimGBpVahYKrtrhee01mDYOxGVjjQou5WFDW2YNz9PJLiXOdjx1QSM2rmyRKCZMp8rb
	a5KBTSfsGcyILB5Upd+hk1mhrtSXb3emnE26Inx0Mifw9Z/fj1hzLYHDNl/GUfSWBcTeJvurPinIc
	65DOJw429qmxwYwaRnp0BnhNJ3aIEOb7pdkZAgdMbbBPoqNrwAMgAlxs4LbT/ZJUm1IJTZK1n0NaX
	BsbXZcJovY+TxMMtwbSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxR4O-005P0s-1F; Sun, 27 Jun 2021 09:27:16 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxR4K-005P0Q-If
 for linux-riscv@lists.infradead.org; Sun, 27 Jun 2021 09:27:14 +0000
Received: by mail-pj1-x102c.google.com with SMTP id g4so8155796pjk.0
 for <linux-riscv@lists.infradead.org>; Sun, 27 Jun 2021 02:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rWCDYW209iwqGBaTcBu1cWNJOi/oleQfwRCVNcyXwRs=;
 b=ho+BYmsdeIGTq/y3Pdh+cFWW2Z/0rnk5GafoPQu/TEKHXVDDmr88GidoFg6Mm/3KGe
 IQ5dD9LGdyo3gQWVXhk11l729thUFWT2yVg9WvMsPACkQ0LuQXfCUmMheMhtBJJG8nlE
 IuqEWw5esiCEMvdnwT4hZe5Kxr77pNmMCYX+CueLZOuNrKPAzJSxYGel7kdO9upLrfXG
 9rDMIgyTkK5ydyRL8Pmxp2Daz0I4jLkBWBtOVJygUkyP7zO70MJy347kTvgYlninvoEq
 Md50iLYYuEFnc4kerNwqxmm+H4+zLIlG8fHsUVuBLEK9yqenaFGxwCFb58CA4GbY9EFE
 3peA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rWCDYW209iwqGBaTcBu1cWNJOi/oleQfwRCVNcyXwRs=;
 b=i+dYjstLu/jBl9345ulzcnTMS2DFdTw4JSe+o1XdZ2q0y+nEML+0SA/kY4jeHcSZo5
 rYac/amnaKhCJmEPR/dBt2bfXN19lBIVNB5+r/BoDG5n7cJ5McUCwKG2TLwOyZh/uQlJ
 eiyXQolHSOSR+NJSDKygBndw5H48SWDi+Hti8undBtw2f4WVXic22qJINASvb2qNkF4K
 Vqdd32Jv525jS2Tdk2KkF3m3M9pN60myIN7Yo+37TGHv0nCD+pXrphg3KvSUFEwaGoER
 9Z4H1jzy1jpFUXbaFD1Opou7oP3TBYAohOV/riqZDXpwEjl7e1/AGZJuzCOZZkHubL1W
 M2BQ==
X-Gm-Message-State: AOAM531UAgsae7+68pFZC9SoDdiJmAbQxxyBv1GCQVgw8csAV+rS9nL1
 KW8nMAStVcLSqkgzL0vhi2w=
X-Google-Smtp-Source: ABdhPJyq2suc/QqEbkIurkgn5OlzC2b9olqRGaNuGsLiX3F5EJWJjot5YZQRaQ6X9G6GSio1oIEs7A==
X-Received: by 2002:a17:902:7c94:b029:fc:5e8b:e645 with SMTP id
 y20-20020a1709027c94b02900fc5e8be645mr17333678pll.18.1624786029965; 
 Sun, 27 Jun 2021 02:27:09 -0700 (PDT)
Received: from WRT-WX9.. ([141.164.41.4])
 by smtp.gmail.com with ESMTPSA id u20sm10756398pfn.189.2021.06.27.02.27.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jun 2021 02:27:09 -0700 (PDT)
From: Changbin Du <changbin.du@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Changbin Du <changbin.du@gmail.com>
Subject: [PATCH] riscv: stacktrace: fix dump_backtrace/walk_stackframe with
 NULL task
Date: Sun, 27 Jun 2021 17:26:59 +0800
Message-Id: <20210627092659.46193-1-changbin.du@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210627_022712_664149_E4D76428 
X-CRM114-Status: GOOD (  12.97  )
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

Some places try to show backtrace with NULL task, and expect the task is
'current'. For example, dump_stack()->show_stack(NULL,...). So the
stacktrace code should take care of this case.

Here is an oops caused by this issue when accessing the NULL task.

[   15.180813] Kernel panic - not syncing: No working init found.  Try passing init= option to kernel. See Linux Documentation/admin-guide/init.rst for guidance.
[   15.182382] CPU: 3 PID: 1 Comm: swapper/0 Not tainted 5.13.0-rc7-00111-g625acffd7ae2-dirty #18
[   15.183431] Hardware name: riscv-virtio,qemu (DT)
[   15.184253] Call Trace:
[   15.223617] Unable to handle kernel paging request at virtual address 0000000000001590
[   15.267378] Oops [#1]
[   15.268215] Modules linked in:
[   15.272027] CPU: 3 PID: 1 Comm: swapper/0 Not tainted 5.13.0-rc7-00111-g625acffd7ae2-dirty #18
[   15.273997] Hardware name: riscv-virtio,qemu (DT)
[   15.275134] epc : walk_stackframe+0xc4/0xdc
[   15.280146]  ra : dump_backtrace+0x30/0x38
[   15.280799] epc : ffffffff8000597e ra : ffffffff800059c6 sp : ffffffe002383d60
[   15.281622]  gp : ffffffff8179ad18 tp : ffffffe002378000 t0 : ffffffff81bc1a3f
[   15.282574]  t1 : 0000000000000001 t2 : 0000000000000000 s0 : ffffffe002383dc0
[   15.283782]  s1 : ffffffff812b7d18 a0 : 0000000000001000 a1 : 0000000000000000
[   15.285115]  a2 : ffffffff807ec668 a3 : ffffffff812b7d18 a4 : c76c00cabf08b500
[   15.286213]  a5 : 0000000000001000 a6 : 000000001a9ef260 a7 : 0000000000000000
[   15.287317]  s2 : 0000000000000000 s3 : 0000000000000000 s4 : 0000000000000000
[   15.288323]  s5 : ffffffff807ec668 s6 : ffffffff812b7d18 s7 : 0000000000000000
[   15.289530]  s8 : 0000000000000000 s9 : 0000000000000000 s10: 0000000000000000
[   15.290995]  s11: 0000000000000000 t3 : 0000000000000001 t4 : 0000000000000000
[   15.292465]  t5 : 206f74206e6f6974 t6 : ffffffe002383b28
[   15.293859] status: 0000000000000100 badaddr: 0000000000001590 cause: 000000000000000d
[   15.296035] [<ffffffff8000597e>] walk_stackframe+0xc4/0xdc
[   15.297342] [<ffffffff800059c6>] dump_backtrace+0x30/0x38
[   15.298333] [<ffffffff807ec6e0>] show_stack+0x40/0x4c
[   15.299765] [<ffffffff807f07ac>] dump_stack+0x7c/0x96
[   15.300553] [<ffffffff807ec8be>] panic+0x118/0x300
[   15.301147] [<ffffffff807f61e8>] kernel_init+0x12c/0x138
[   15.302056] [<ffffffff80003a22>] ret_from_exception+0x0/0xc
[   15.338628] ---[ end trace 0a3fa0cc7f3393cd ]---
[   15.339919] note: swapper/0[1] exited with preempt_count 1
[   15.341995] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
[   15.343889] SMP: stopping secondary CPUs
[   16.802836] SMP: failed to stop secondary CPUs 0-3
[   16.806264] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---

This patch fixes it by setting the task to current if it's NULL before
accessing it.

Signed-off-by: Changbin Du <changbin.du@gmail.com>
Fixes: 5d8544e2d0 ("RISC-V: Generic library routines and assembly")
---
 arch/riscv/kernel/stacktrace.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index bde85fc53357..788b65eba965 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -23,6 +23,9 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 {
 	unsigned long fp, sp, pc;
 
+	if (!task)
+		task = current;
+
 	if (regs) {
 		fp = frame_pointer(regs);
 		sp = user_stack_pointer(regs);
@@ -73,6 +76,9 @@ void notrace walk_stackframe(struct task_struct *task,
 	unsigned long sp, pc;
 	unsigned long *ksp;
 
+	if (!task)
+		task = current;
+
 	if (regs) {
 		sp = user_stack_pointer(regs);
 		pc = instruction_pointer(regs);
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
