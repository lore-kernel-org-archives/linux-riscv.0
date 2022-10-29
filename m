Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E780ECAAA1
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Oct 2022 11:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=APke/yHmwZQpIDRiTV9E8GLyPf3Og4FzW7UqM1pMpjM=; b=r9Pw9xcb2+qN5Q
	0e5/DTio0CLsY5iiRmlQv5Y9xPzb+5Ih5cTCgglUvvwiBX2IpHW/4A32+3fX1IcUrBeqajTyOcEVc
	B+Ttv9eXzlCLvv7xXzaV1N/5/apI6XGTwHl/OCKAj9CfS9txTvDOCpwvIbFmxeuq+o+muOuoTA+Yk
	MqaWlY5RtA/Rsua4aBWGW4XY7SU9pU5MPug6OcXyA0ev3dG6OIgyAI0gyurQJ6dn2pnA0rimDt52a
	Rexo7lsdS6PremXS4zhHBTvfHXwN0BK8Qk7niaXctvWhksh4LLJA2afCgmGga9j2tZaiMxzscbJF7
	lvpgs9LY4GhNMrXQnAJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ookGT-005zcy-A4; Sat, 29 Oct 2022 11:44:37 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ookGQ-005zcI-M4
	for linux-riscv@lists.infradead.org; Sat, 29 Oct 2022 11:44:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 605C3B80B30;
	Sat, 29 Oct 2022 11:44:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 964CFC433C1;
	Sat, 29 Oct 2022 11:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667043871;
	bh=J28JdYpCrFXzwuwKWXs/vDRdRU6kc34gc/wpq/7Yrq8=;
	h=From:To:Cc:Subject:Date:From;
	b=lJQCVzoSRltfxdwtmLMUMk60jyAIBldT+rATXalj1lD5A5fdYS8ez64sIMxWGpJdX
	 5HV08QwiLSVQVzjLC55XS3hzSrmfzWOIhpoYVQxeyPHn1ZDllNA7f6oP3hF8AGzmuy
	 CCAmBvlilfgvUeUZsPYNb1Yk/RqYWqRLcDSV4Cj5n2DU6VIzZp05LYmO2Gw/m+6GPk
	 W5vqpciI8BDDspbmGhZDRmjrlqd6ELaWZcV8t6t6z1E7HG6C07tmfmfYAwhLK6GgUH
	 mZlOX30ktd2RmODr8Px4kWDSGXuO8G8O8yol2yAg1ZOyYtJhWFAlskOIL5I2qzCCSK
	 ISn6ycpXNsiaQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: process: fix kernel info leakage
Date: Sat, 29 Oct 2022 19:34:50 +0800
Message-Id: <20221029113450.4027-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221029_044434_911959_9F6545F7 
X-CRM114-Status: GOOD (  10.34  )
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

thread_struct's s[12] may contain random kernel memory content, which
may be finally leaked to userspace. This is a security hole. Fix it
by clearing the s[12] array in thread_struct when fork.

As for kthread case, it's better to clear the s[12] array as well.

Fixes: 7db91e57a0ac ("RISC-V: Task implementation")
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---

Previously, it's one of the series of "riscv: entry: further clean up
and VMAP_STACK fix". This is a fix, so I move it out of the series and
send it separately

 arch/riscv/kernel/process.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index ceb9ebab6558..52002d54b163 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -164,6 +164,8 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 	unsigned long tls = args->tls;
 	struct pt_regs *childregs = task_pt_regs(p);
 
+	memset(&p->thread.s, 0, sizeof(p->thread.s));
+
 	/* p->thread holds context to be restored by __switch_to() */
 	if (unlikely(args->fn)) {
 		/* Kernel thread */
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
