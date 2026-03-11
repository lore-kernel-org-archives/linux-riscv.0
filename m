Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82DC3112583A
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Mar 2026 14:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yZR+YslJhX2bBfOWcSYqqJRblkDWc39H9wkOoCiOYg4=; b=wOFmdkzkB8M/wW
	62J5iMzoW3aAYPHHVH+XQ3wzLREao+hpMAETdYeU5kc4FW2parhTs6aAPqfxllTPegIzWbOwFpRAA
	7hX5uEXiJ172PY/GfH97PZW1JOHPxLCM4nxjdKFKzdUvM1hdxglBAMN1Hnr9PZ4mywB4iuD6CW4xQ
	yEulAk4/dBpDjnStmZ+HEFxQHhpOHEn490VSejyZUAundv+ovBhOpKmxNK5SA7NTTS6/CTxcEeMBD
	yP48cv1YuW6KCSMHNoMqFBu+ZpuFhjsQKqObLMGF35KhFOosJ+5b1GPdtFI3VyiKTxJSi9uYgROkJ
	pWAceVlpzcwrpxUFPhFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0KhI-0000000BigG-3ebL;
	Wed, 11 Mar 2026 14:38:04 +0000
Received: from esa2.hc555-34.eu.iphmx.com ([23.90.104.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0KhE-0000000Bifi-1B6e
	for linux-riscv@lists.infradead.org;
	Wed, 11 Mar 2026 14:38:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1773239880; x=1804775880;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2Q4lRreYXrbQLEk5poRcazVjqCd3Eq8mJOpK+7xvryY=;
  b=d/5oRTIAwa7NtnBBijCVRRaCmvGztM5Wm+6lTEEvutoQkFshPrYILqnl
   TuFuKh+v+ZU519zj7sCDDUo8+wQ0ianXCSJ+3DdZIETBP3upzCnVx8TXu
   cn63qteF8z6+hjfk57VOvl6csDddACFRc1cpHEz4DwDpaknzxNi4vrD5B
   lqcFYuS4Bnmuvn//nuGs4w3DlisJ76NVcHcHXnZTomEI4sHXwNBwO7AIx
   kGwxHFBv0MmXHwsY/JY8qJJGWFQAFss4rv32G6aeG+exgnBfpbYpfjlbm
   KQri2sefciIqGIJ84htuCg1I4IePjalR9sVqrc1td8G+FnBsH3A6s4xpm
   w==;
X-CSE-ConnectionGUID: jyCXNiQdSjeXIscvlSxHDw==
X-CSE-MsgGUID: QijWz08pSsCPUBnOuFaNAg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 16:37:54 +0200
X-CSE-ConnectionGUID: PN3dHWWWShm/pJENbpQy+A==
X-CSE-MsgGUID: sstmYQVjQhqz/vVW3j9OwA==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.3])
  by ces04_data.me-crop.lan with SMTP; 11 Mar 2026 16:40:49 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Wed, 11 Mar 2026 16:37:52 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: Nick Hu <nick.hu@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH] irqchip/riscv-aplic: fix PM for multi-aplic system
Date: Wed, 11 Mar 2026 16:37:49 +0200
Message-ID: <20260311143749.4058818-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_073800_843195_79893F6B 
X-CRM114-Status: GOOD (  13.94  )
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

The aplic_syscore is a singleton and should be registered once.
If it is registered from the driver probe, register_syscore()
called multiple times for the system having multiple aplic instances.
This results in double registration of the same syscore. Warning
triggered:

[    0.553569] ------------[ cut here ]------------
[    0.553572] list_add double add: new=ffffffff81314a68, prev=ffffffff81314a68, next=ffffffff8131f588.
[    0.553643] WARNING: lib/list_debug.c:35 at __list_add_valid_or_report+0x4e/0xe8, CPU#23: swapper/0/1
[    0.553660] Modules linked in:
[    0.553668] CPU: 23 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.0.0-rc1 #2 PREEMPT_RT
[    0.553675] Hardware name: EyeQ7 evaluation board (DT)
[    0.553679] epc : __list_add_valid_or_report+0x4e/0xe8
[    0.553685]  ra : __list_add_valid_or_report+0x4e/0xe8
[    0.553691] epc : ffffffff80443e72 ra : ffffffff80443e72 sp : ffffffc6000dbaf0
[    0.553696]  gp : ffffffff81391b48 tp : ffffffd6007d9b00 t0 : ffffffd9efbc4318
[    0.553700]  t1 : 0000000000000004 t2 : 2d2d2d2d2d2d2d2d s0 : ffffffc6000dbb20
[    0.553704]  s1 : ffffffff8131f588 a0 : 0000000000000058 a1 : ffffffff80089b9a
[    0.553708]  a2 : ffffffd9effab4d0 a3 : 0000000000000000 a4 : 0000000000000000
[    0.553711]  a5 : 0000000000000000 a6 : ffffffff80da4889 a7 : ffffffffffffffff
[    0.553715]  s2 : ffffffff8131f558 s3 : ffffffff81314a68 s4 : ffffffff8131f588
[    0.553719]  s5 : ffffffff81367d40 s6 : ffffffff80a00db8 s7 : ffffffff80a00d78
[    0.553722]  s8 : ffffffff80e4ac38 s9 : ffffffff80a1c430 s10: 0000000000000008
[    0.553726]  s11: ffffffff808000c4 t3 : 0000000000000002 t4 : ffffffd9efca3bfc
[    0.553730]  t5 : ffffffd9efca3bd8 t6 : ffffffc6000db828 ssp : 0000000000000000
[    0.553734] status: 0000000200000120 badaddr: ffffffff80443e72 cause: 0000000000000003
[    0.553738] [<ffffffff80443e72>] __list_add_valid_or_report+0x4e/0xe8
[    0.553745] [<ffffffff804f1c3a>] register_syscore+0x3a/0x6c
[    0.553754] [<ffffffff80009cd8>] aplic_probe+0xd8/0xe8
[    0.553765] [<ffffffff804f350e>] platform_probe+0x3e/0x7c
[    0.553772] [<ffffffff804f0d5e>] really_probe+0x98/0x34a
[    0.553779] [<ffffffff804f10ba>] __driver_probe_device+0xaa/0xf6
[    0.553785] [<ffffffff804f11d0>] driver_probe_device+0x36/0xc4
[    0.553791] [<ffffffff804f1470>] __driver_attach+0x108/0x1ec
[    0.553797] [<ffffffff804eebde>] bus_for_each_dev+0x58/0xa4
[    0.553803] [<ffffffff804f0608>] driver_attach+0x1a/0x22
[    0.553809] [<ffffffff804eff32>] bus_add_driver+0xe2/0x204
[    0.553814] [<ffffffff804f1f82>] driver_register+0x3e/0xd8
[    0.553820] [<ffffffff804f3204>] __platform_driver_register+0x1e/0x26
[    0.553827] [<ffffffff8082be50>] aplic_driver_init+0x1a/0x22
[    0.553837] [<ffffffff8000e910>] do_one_initcall+0x44/0x286
[    0.553843] [<ffffffff8080171c>] kernel_init_freeable+0x262/0x2e8
[    0.553853] [<ffffffff8073cd98>] kernel_init+0x28/0x14c
[    0.553863] [<ffffffff800101fa>] ret_from_fork_kernel+0x1a/0x15c
[    0.553870] [<ffffffff807493ae>] ret_from_fork_kernel_asm+0x16/0x18
[    0.553877] ---[ end trace 0000000000000000 ]---

Move syscore registration to the driver init

Fixes: 95a8ddde3660 ("irqchip/riscv-aplic: Preserve APLIC states across suspend/resume")
Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 drivers/irqchip/irq-riscv-aplic-main.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-aplic-main.c b/drivers/irqchip/irq-riscv-aplic-main.c
index 8fe4dc5cfdae..12d22b9d65cb 100644
--- a/drivers/irqchip/irq-riscv-aplic-main.c
+++ b/drivers/irqchip/irq-riscv-aplic-main.c
@@ -376,8 +376,6 @@ static int aplic_probe(struct platform_device *pdev)
 	if (rc)
 		dev_err_probe(dev, rc, "failed to setup APLIC in %s mode\n",
 			      msi_mode ? "MSI" : "direct");
-	else
-		register_syscore(&aplic_syscore);
 
 #ifdef CONFIG_ACPI
 	if (!acpi_disabled)
@@ -400,4 +398,10 @@ static struct platform_driver aplic_driver = {
 	},
 	.probe = aplic_probe,
 };
-builtin_platform_driver(aplic_driver);
+
+static int __init aplic_driver_init(void)
+{
+	register_syscore(&aplic_syscore);
+	return platform_driver_register(&aplic_driver);
+}
+device_initcall(aplic_driver_init);

base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
