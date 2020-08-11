Return-Path: <SRS0=5c4l=BV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40D6DC433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2020 06:38:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB66020774
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2020 06:38:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m15Y6REz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB66020774
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=phytium.com.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=COVIFLQSDY0xHeATLe4BaIVpbT1ZhzZRFFNv59SI18Y=; b=m15Y6REzJT+GCuyo6Gmqdx/77D
	5Uy0X9uCg5gfI6qLno4B+COy3CG7T6qJ6SlwACg3FH4diwg94WGTNS9rlorhxevrdOtdtq8NhGhSw
	tzXM/dExX/T7gb3zcREAc7xwlrtpozG2JJIkhQLFlsOyzi/Xg/3aVE1B8qKdbXPU0E9vJMiSjW3sq
	fPfyyG9D0gILldJ1cy+9Q4svkJyQv1v0hEc8eSgB3/UEVbmeKMQ4RyfkXBfjtfyNGC11r985QBF77
	BXdpgnu2QdooTdomaseAZorLQr4uze1Pf8PFCAW8oihYA0TjCYd948vl4MrD/+pB4fSQuvLPK4XwL
	m6QOt3jQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5NvG-0005gU-PR; Tue, 11 Aug 2020 06:38:10 +0000
Received: from lonlinode-sdnproxy-1.icoremail.net ([139.162.193.133])
 by merlin.infradead.org with smtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5NvE-0005f2-Mk
 for linux-riscv@lists.infradead.org; Tue, 11 Aug 2020 06:38:09 +0000
Received: from localhost.localdomain (unknown [106.19.114.17])
 by c1app6 (Coremail) with SMTP id BgINCgAnL_+0PDJfrfP+Aw--.3669S2;
 Tue, 11 Aug 2020 14:37:42 +0800 (CST)
From: Qiu Wenbo <qiuwenbo@phytium.com.cn>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: Setup exception vector for K210 properly
Date: Tue, 11 Aug 2020 14:36:56 +0800
Message-Id: <20200811063659.284088-1-qiuwenbo@phytium.com.cn>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CM-TRANSID: BgINCgAnL_+0PDJfrfP+Aw--.3669S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KrWxGFyDCw4DXw1kXw45trb_yoW8XFy3pr
 W8Crn5GrWFg3Z7t3y3Aw4kurW3Jrs8G343GF4ktayFqF4ft3y5X3saga4UXr1YqFyYva9Y
 9F9Y9ryI9w4DZ37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
 4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
 628vn2kIc2xKxwCY02Avz4vE14v_GF1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
 v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
 1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
 AIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0D
 MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
 VFxhVjvjDU0xZFpf9x0JU-J5rUUUUU=
X-CM-SenderInfo: 5tlx4vhqerq15k1wx33pof0zgofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200811_023808_930701_DD1A2018 
X-CRM114-Status: GOOD (  10.40  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Damien Le Moal <damien.lemoal@wdc.com>, Guo Ren <guoren@linux.alibaba.com>,
 Vincent Chen <vincent.chen@sifive.com>, Qiu Wenbo <qiuwenbo@phytium.com.cn>,
 linux-kernel@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Zong Li <zong.li@sifive.com>,
 Anup Patel <anup@brainfault.org>, Greentime Hu <greentime.hu@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Exception vector is missing on nommu platform and it is a big issue.
This patch is tested in Sipeed MAIX Bit Dev Board.

Fixes: 79b1feba5455 ("RISC-V: Setup exception vector early")
Signed-off-by: Qiu Wenbo <qiuwenbo@phytium.com.cn>
---
 arch/riscv/kernel/smpboot.c |  1 +
 arch/riscv/kernel/traps.c   | 11 ++++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 356825a57551..23cde0ceb39d 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -154,6 +154,7 @@ asmlinkage __visible void smp_callin(void)
 	mmgrab(mm);
 	current->active_mm = mm;
 
+	trap_init();
 	notify_cpu_starting(curr_cpuid);
 	update_siblings_masks(curr_cpuid);
 	set_cpu_online(curr_cpuid, 1);
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index ad14f4466d92..a390239818ae 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -174,7 +174,16 @@ int is_valid_bugaddr(unsigned long pc)
 }
 #endif /* CONFIG_GENERIC_BUG */
 
-/* stvec & scratch is already set from head.S */
+/* stvec & scratch is already set from head.S when mmu is enabled */
 void trap_init(void)
 {
+#ifndef CONFIG_MMU
+	/*
+	 * Set sup0 scratch register to 0, indicating to exception vector
+	 * that we are presently executing in the kernel
+	 */
+	csr_write(CSR_SCRATCH, 0);
+	/* Set the exception vector address */
+	csr_write(CSR_TVEC, &handle_exception);
+#endif
 }
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
