Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0045D262B0
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jan 2026 05:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s+ypPal5TVik0HXL6o8NTWRZ0uDXi8zys4xfbbuqHpI=; b=IA97ugd+hf0KmE
	shZZkd9zlm/lVma8cgNVe9uv+5GR6oq8lBoVpfx4A+yHwB6Vo9UTU3u1HjaLeugXNzjFlipJ80Bsw
	frhiNKK8bBEH/ORuiS0eGcPbwN7axp7gvB93XzPgS10Q3kIjQgoneJl3KHVUxVtrNjENTMuXGzGj/
	catjmyuuOwCNXvxTlMj/gD1R3ZHPUNOdvUFTLF8E3uD3v5n0MIm0W5B3o0JNU4Lq2Fk57BOkPu663
	cy6cTFHxYghjHOMy9gjEtaux/HzsJDhUalC3bcP7GOpCDQ5VBNdVaDUlwDxp2t32gfqX4N77fI1Cz
	U2RPC46fn/+2oXkTqywQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viR2Q-00000004ugu-19SB;
	Wed, 21 Jan 2026 05:45:54 +0000
Received: from out203-205-221-233.mail.qq.com ([203.205.221.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viR2N-00000004ug7-1x60
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jan 2026 05:45:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1768974344; bh=2hfAdrr6Ey5DyT/MRw7XElyPJvDe8wPUBa8s2u/6NnM=;
	h=From:To:Cc:Subject:Date;
	b=ygGnTWCfcImv06QmhsyP6n2vs1sQda8e3dKfz+KMdMuTHTYi799GmTLWkvNV5+AVH
	 WwtcbmmRFbb+2hLKzG+fPnXSTI0cNjqdMC4ElNm4+npAWP50l8ZUNKJI9vNCstrt8n
	 74e5N9I0vj1vx0wV+O3swJzChYK1V/Uwm5X8BXRk=
Received: from cyy-pc.lan ([240e:379:2268:a400:43ad:678c:aeb3:355d])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id B6898CAC; Wed, 21 Jan 2026 13:45:40 +0800
X-QQ-mid: xmsmtpt1768974340t77ckc9c4
Message-ID: <tencent_A697393AE256C4288768342AF245099A690A@qq.com>
X-QQ-XMAILINFO: MRMtjO3A6C9XTS8vhvmawojs2BQVngzqTotK+QHmdsr2PLG21iw9vmyDJhIEFd
	 bkWg/G3wSW3HrbsDFH6cyhO7d9ZJeWvRhsWa8n9NIGQuPqeqzWGuLXoe9PkaujxE6cGdFHAfLAh5
	 J6SJf5ivp9uAAEWufIX10Eq/qb3NeOMH3usomK+SRVt7oniSpdaj0z9EbrphitjiWJSfjH/DEQmk
	 N49bu4+JRb4jh1RmxvtIUiTiGkQfcvJ9BJ9rVB/QlwrgLaDXkckG0vIsDE3I5Lo8cF2xFymuzg7p
	 dtNEbPAkZHhiK6jLpBPniyepET9bPS4UegOUeYaWiA8/3T9MPADCdD1bF8YBHZUsYAaYGfRFuGIb
	 L60vUqGdRfHCqg4p4+vX9Aq0IAnUbRFwLL/rrmHso/bV63Lfur1PZZrxpxCLTKA6qGDj0j4UNNv5
	 1LaqSIQwCSZsQtb7hDxoA3GZ8b9tA+T5cILInW6S9YS5F3Z+4su8LBoty5As5VgMTi2JJ3mwFDDP
	 m2WZTGiJCQC249lsY/ttlnFNwT94z3/8UCsxTf3KxQ75KnepAGDMYSt6f/m2yuFHxsvz5UtqEj39
	 5Lk9Fl3VwDhhFlgyQUBrYKGrJSET/P+I1FrNUlBr0XuzoYl5hxb5LuAQU5gNAiaf7gtkC2bwolv+
	 r2w3/Et9652A5zeWqzGPnDOPZzC2YCziRsfB6Ey7BDWx+NP2IKQLIysYRqyXOcYQf6kNG6M9rJFy
	 Pua0jigjkUF74KKgZ30hmOz/dM3VExq3itLnYPrT6AzJA82/yWOX6YUbCPT2XwX9ueI1V/36R7Vm
	 hS6Y8UDnECH2DpjmD0t9ZAE99ga3MPY0O4KvjFefKRJseDaKkvIlndECOXukSRfxVR6In5l7F5z+
	 eJdyKazZwNaSVkvL5dP3Ukiv1BLsRNvGVWN1aGgyu4YdCI7RpVoWzM58m7dIuceB1ckdMJuE93yZ
	 AMZRQ4wHAbFZQOd+qgSZ03lMMc5sUl7nIYEc57a8PMow4p6+9tpMgPxyN0GJI8oP98m/LJ0/IxMI
	 XDjJ9T5McrP6exRC9yuwugJuFHwCM=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Anup Patel <anup.patel@oss.qualcomm.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Charles Mirabile <cmirabil@redhat.com>,
	Lucas Zampieri <lzampier@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Mason Huo <mason.huo@starfivetech.com>,
	Zhang Xincheng <zhangxincheng@ultrarisc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Marc Zyngier <maz@kernel.org>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH v2] irqchip/sifive-plic: Fix insufficient irq_groups allocation
Date: Wed, 21 Jan 2026 13:45:26 +0800
X-OQ-MSGID: <20260121054526.3576962-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_214551_888833_BA3B16BF 
X-CRM114-Status: GOOD (  17.96  )
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

Since the first irq source is 1 instead of 0, when the number of
irqs is multiple of 32, the last irq group will be ignored during
allocation, saving, and restoring. This lead to memory corruption
when accessing enable_save beyond allocated memory after commit
14ff9e54dd14 ("irqchip/sifive-plic: Cache the interrupt enable state")
which will access enable_save for all sources during plic_probe.
Thus, we should allocate irq_groups based on (nr_irqs + 1) instead of
nr_irqs to avoid this issue.

This is an long standing bug since Linux v6.4 but since the last irq
source is rarely used, it may not be triggered in practice until commit
14ff9e54dd14 ("irqchip/sifive-plic: Cache the interrupt enable state").

Fixes: e80f0b6a2cf3 ("irqchip/irq-sifive-plic: Add syscore callbacks for hibernation")
Fixes: 4d936f10ff80 ("irqchip/sifive-plic: Probe plic driver early for Allwinner D1 platform")
Fixes: 539d147ef69c ("irqchip/sifive-plic: Add support for UltraRISC DP1000 PLIC")
Fixes: 14ff9e54dd14 ("irqchip/sifive-plic: Cache the interrupt enable state")
Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
Changes since v1:
- Add more Fixes tags for earlier commits that are also affected by this
  bug.
- Add more explanation about the bug's history.

This can be reproduced by modifying the PLIC node in DT to have ndev as
exactly multiple of 32, e.g., 32, 64, etc., then triggering some interrupts
and checking dmesg for memory corruption:

plic: plic@3c000000 {
	compatible = "riscv,plic0";
	reg = <0x0 0x3c000000 0x0 0x4000000>;
	#interrupt-cells = <1>;
	interrupt-controller;
	interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
	riscv,max-priority = <7>;
	riscv,ndev = <64>;
};

Here is an example dmesg log when ndev is 64:
[    0.077196] Unable to handle kernel paging request at virtual address ffffaf8000000000
[    0.077205] Current swapper/0 pgtable: 4K pagesize, 48-bit VAs, pgdp=0x0000000081c2d000
[    0.077215] [ffffaf8000000000] pgd=000000009ffffc01, p4d=000000009ffffc01, pud=000000009ffff801, pmd=000000009ffff401, pte=0000000000000000
[    0.077240] Oops [#1]
[    0.077246] Modules linked in:
[    0.077254] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.19.0-rc6 #36 NONE 
[    0.077266] Hardware name: XiangShan (DT)
[    0.077273] epc : __kmalloc_node_track_caller_noprof+0x1a0/0x524
[    0.077284]  ra : kstrdup+0x32/0x60
[    0.077293] epc : ffffffff80253c70 ra : ffffffff801fa70e sp : ffff8f800000b700
[    0.077304]  gp : ffffffff81a1b580 tp : ffffaf8080158000 t0 : 0000000000000264
[    0.077313]  t1 : 0000000000000003 t2 : 0000000000000000 s0 : ffff8f800000b750
[    0.077323]  s1 : 0000000000000002 a0 : ffffaf8000000000 a1 : 0000000000000cc0
[    0.077332]  a2 : ffff8d800200bfc0 a3 : ffffffff81a5c5e0 a4 : ffffaf8000000000
[    0.077342]  a5 : 0000000000000003 a6 : ffffffffffffffff a7 : ffffaf8080001400
[    0.077352]  s2 : ffffaf80802ff178 s3 : ffffffff810107f0 s4 : 0000000000000000
[    0.077362]  s5 : 0000000000000000 s6 : ffff8f800000b9c0 s7 : ffffaf8080823200
[    0.077372]  s8 : ffffffff81a20580 s9 : ffffaf808012c990 s10: ffffffffffffffff
[    0.077382]  s11: 0000000000000000 t3 : 0000000000000cc0 t4 : ffffffff801fa764
[    0.077391]  t5 : 0000000000000000 t6 : 0000000000000263
[    0.077399] status: 0000000200000120 badaddr: ffffaf8000000000 cause: 000000000000000d
[    0.077409] [<ffffffff80253c70>] __kmalloc_node_track_caller_noprof+0x1a0/0x524
[    0.077422] [<ffffffff801fa70e>] kstrdup+0x32/0x60
[    0.077433] [<ffffffff801fa764>] kstrdup_const+0x28/0x34
[    0.077444] [<ffffffff80318438>] __kernfs_new_node+0x3c/0x274
[    0.077457] [<ffffffff80318a90>] kernfs_new_node+0x44/0x6c
[    0.077470] [<ffffffff80318f40>] kernfs_create_dir_ns+0x20/0x7c
[    0.077483] [<ffffffff8031b8f8>] sysfs_create_dir_ns+0x60/0xcc
[    0.077497] [<ffffffff80b41bea>] kobject_add_internal+0xae/0x2d8
[    0.077509] [<ffffffff80b422d6>] kobject_add+0x52/0xb8
[    0.077520] [<ffffffff80b6401c>] __irq_alloc_descs+0x190/0x328
[    0.077534] [<ffffffff800976de>] irq_domain_alloc_descs.part.0+0x46/0x78
[    0.077549] [<ffffffff8009827a>] irq_create_mapping_affinity+0x72/0xcc
[    0.077561] [<ffffffff805d27d2>] plic_probe+0x2e2/0x6c8
[    0.077573] [<ffffffff805d2bc8>] plic_platform_probe+0x10/0x18
[    0.077586] [<ffffffff80723aca>] platform_probe+0x46/0x80
[    0.077600] [<ffffffff807212ec>] really_probe+0x84/0x22c
[    0.077612] [<ffffffff807214f0>] __driver_probe_device+0x5c/0xd4
[    0.077625] [<ffffffff8072162e>] driver_probe_device+0x2e/0xf4
[    0.077639] [<ffffffff80721856>] __driver_attach+0x6e/0x14c
[    0.077652] [<ffffffff8071f434>] bus_for_each_dev+0x60/0xb0
[    0.077664] [<ffffffff80720e22>] driver_attach+0x1a/0x24
[    0.077676] [<ffffffff8072068a>] bus_add_driver+0xca/0x1d8
[    0.077689] [<ffffffff80722622>] driver_register+0x3e/0xdc
[    0.077702] [<ffffffff80723810>] __platform_driver_register+0x1c/0x24
[    0.077716] [<ffffffff80c2946e>] plic_driver_init+0x1a/0x24
[    0.077728] [<ffffffff800108aa>] do_one_initcall+0x4e/0x1b8
[    0.077740] [<ffffffff80c01358>] kernel_init_freeable+0x25c/0x2dc
[    0.077754] [<ffffffff80b639cc>] kernel_init+0x1c/0x144
[    0.077768] [<ffffffff8001239a>] ret_from_fork_kernel+0xe/0xf4
[    0.077781] [<ffffffff80b6e4ee>] ret_from_fork_kernel_asm+0x16/0x18
[    0.077800] Code: 6308 0c63 2a06 0a63 2a05 e703 0308 8293 001f 972a (630c) 7f73 
[    0.077809] ---[ end trace 0000000000000000 ]---
[    0.077817] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
[    0.077827] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---
---
 drivers/irqchip/irq-sifive-plic.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 210a57959637..d6515bf76444 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -293,7 +293,7 @@ static void plic_irq_resume(void *data)
 			continue;
 
 		raw_spin_lock_irqsave(&handler->enable_lock, flags);
-		for (i = 0; i < DIV_ROUND_UP(priv->nr_irqs, 32); i++) {
+		for (i = 0; i < DIV_ROUND_UP(priv->nr_irqs + 1, 32); i++) {
 			reg = handler->enable_base + i * sizeof(u32);
 			writel(handler->enable_save[i], reg);
 		}
@@ -431,7 +431,7 @@ static u32 cp100_isolate_pending_irq(int nr_irq_groups, struct plic_handler *han
 
 static irq_hw_number_t cp100_get_hwirq(struct plic_handler *handler, void __iomem *claim)
 {
-	int nr_irq_groups = DIV_ROUND_UP(handler->priv->nr_irqs, 32);
+	int nr_irq_groups = DIV_ROUND_UP(handler->priv->nr_irqs + 1, 32);
 	u32 __iomem *enable = handler->enable_base;
 	irq_hw_number_t hwirq = 0;
 	u32 iso_mask;
@@ -718,7 +718,7 @@ static int plic_probe(struct fwnode_handle *fwnode)
 			context_id * CONTEXT_ENABLE_SIZE;
 		handler->priv = priv;
 
-		handler->enable_save = kcalloc(DIV_ROUND_UP(nr_irqs, 32),
+		handler->enable_save = kcalloc(DIV_ROUND_UP(nr_irqs + 1, 32),
 					       sizeof(*handler->enable_save), GFP_KERNEL);
 		if (!handler->enable_save) {
 			error = -ENOMEM;
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
