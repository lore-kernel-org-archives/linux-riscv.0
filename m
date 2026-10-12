Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A71CECA9ED2
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 07:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2xVRqrZIvNRAh0dWUKf6AsT7X/QzbS3g1YV7MfFy5IU=; b=OSzpCY6O78cZs9
	NGTWlwIWmvblFTXub6C60gG1fiRU/Procvcq6L+EsohzMCoLVWw8BrFbyfx48axo8rKWoDiShVVAD
	WWH465WKK1FFic9KD62uwQDvEAEGSVgRIvgjmEsCMqjX6gnG3tyU2HhW1yNCSrT1mEE5K9e/9Uq7e
	nGJx4vEy5+hjosjqpnKgq6ySC1bSV5FpdahooPzY0Z8AanjQ3g/R55zA7W5cqeWe+B1ISBmy8mViz
	aD0/pIuCfk3QUCmp2iDCFMVSRa7sPAM8JhZ1waLFRgiE57DUookUW2fIJOmjvODEDsQ+98/2W5BFx
	yvwIIXNB4rsJenFUm+2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGAYL-00000009qiP-2Ld0;
	Mon, 12 Oct 2026 07:34:33 +0000
Received: from esa1.hc555-34.eu.iphmx.com ([23.90.104.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGAYG-00000009qgK-3A1l
	for linux-riscv@lists.infradead.org;
	Mon, 12 Oct 2026 07:34:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1791790474; x=1823326474;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=rro3Q103tON6YF9EYmKQjD31tul/1auJiy4JtB4uR94=;
  b=GV1kgPhhzJxnFf0VjjCeCCfAzDRaz9Ntf5QfY2RmtUGVRGwGFUyPesyW
   KHPGiVcyoJHSfWd3SC+dHDNsqHKxjV6RY90PzW0dn4HlQ+9XhXnMfyH2u
   VtN5qgRc0YdinKgOgVG8Z3cODOsAG1J4icX0pAX2/Ckey524+twxWXdnj
   qITI2mseRbaQRZpz4Pg/y4ARyuaXhjeY0FTr+3KdUECD1TAXQ8nwKTdab
   gvvpy4U8XGf4k0STxoZUKeJyZ2TU+3ttWEHbVKsjeLjVp6NckYQmlSBAc
   QDXLz9nbFYh5CuzJX3SaXGKMfKYAXmeSKgnQ6uBZVpw5OhvIWBEE39eBf
   w==;
X-CSE-ConnectionGUID: VRLyttlrSD2skgLvYylueg==
X-CSE-MsgGUID: ycQCHdkoST28VSsiXQyFHQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 10:34:30 +0300
X-CSE-ConnectionGUID: WKqFf3OrRsG/pIgJKAMBiQ==
X-CSE-MsgGUID: 3rYXRc34TNGXk5O6BHvSzw==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces02_data.me-corp.lan with SMTP; 12 Oct 2026 10:41:51 +0300
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Mon, 12 Oct 2026 10:34:22 +0300
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Mon, 12 Oct 2026 10:34:08 +0300
Subject: [PATCH] irqchip/riscv-aplic: fix asynchronous probing
MIME-Version: 1.0
Message-Id: <20261012-aplic-async-probe-v1-1-4c2c4f5b0916@mobileye.com>
X-B4-Tracking: v=1; b=H4sIAHCNzGoC/x3MQQqAIBBA0avErBtQK4uuEi3MphoIFYUopLsnL
 d/i/wyJIlOCscoQ6eLE3hXIugJ7GLcT8loMSigthVRowskWTXqcxRD9QjhIrVoSTadFD6ULkTa
 +/+c0v+8HcUftPWMAAAA=
X-Change-ID: 20261012-aplic-async-probe-81624e035607
To: Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Jessica Liu <liu.xuemei1@zte.com.cn>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rt-devel@lists.linux.dev, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_003429_255093_252C8B96 
X-CRM114-Status: GOOD (  11.83  )
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

boolean flag don't protect from race when probing several instances
asynchronously. On system with multiple APLICs, if probed asynchronously,
warning triggered as below.

[    0.227210] riscv-aplic 67560000.interrupt-controller: 257 interrupts directly connected to 8 CPUs
[    0.227210] riscv-aplic 674e0000.interrupt-controller: 257 interrupts directly connected to 8 CPUs
[    0.227224] ------------[ cut here ]------------
[    0.227227] list_add double add: new=ffffffff8130ced0, prev=ffffffff8130ced0, next=ffffffff81316d40.
[    0.227302] WARNING: lib/list_debug.c:35 at __list_add_valid_or_report+0xe0/0xe6, CPU#4: kworker/u97:0/211
[    0.227322] Modules linked in:
[    0.227333] CPU: 4 UID: 0 PID: 211 Comm: kworker/u97:0 Not tainted 7.3.0-rc6 #1 PREEMPT_RT
[    0.227341] Hardware name: EyeQ7H evaluation board (DT)
[    0.227346] Workqueue: async async_run_entry_fn
[    0.227358] epc : __list_add_valid_or_report+0xe0/0xe6
[    0.227366]  ra : __list_add_valid_or_report+0xe0/0xe6
[    0.227375] epc : ffffffff804a08a0 ra : ffffffff804a08a0 sp : ffffffc600823b90
[    0.227379]  gp : ffffffff81389e70 tp : ffffffd60135ee00 t0 : 0000000000000000
[    0.227383]  t1 : 3fffffffffffffff t2 : 0000000000000000 s0 : ffffffc600823bb0
[    0.227387]  s1 : ffffffff8130ced0 a0 : 0000000000000058 a1 : ffffffd9efc9e5c0
[    0.227391]  a2 : ffffffd9efd5c510 a3 : 0000000000000000 a4 : 0000000000000000
[    0.227395]  a5 : 0000000000000000 a6 : ffffffd9efc6e5c0 a7 : bfffffffffffe000
[    0.227399]  s2 : 0000000000000000 s3 : ffffffff8130ce28 s4 : 0000000000000000
[    0.227402]  s5 : ffffffd6018b65c8 s6 : 0000000000000000 s7 : ffffffd6012fd605
[    0.227406]  s8 : ffffffd6010c3400 s9 : 0000000000000000 s10: 0000000000000000
[    0.227409]  s11: 0000000000000000 t3 : 3fffffffffffe000 t4 : 0000000000000020
[    0.227413]  t5 : 0000000000000000 t6 : ffffffc6008238f8 ssp : 0000000000000000
[    0.227417] status: 0000000200000120 badaddr: ffffffff804a08a0 cause: 0000000000000003
[    0.227422] [<ffffffff804a08a0>] __list_add_valid_or_report+0xe0/0xe6
[    0.227432] [<ffffffff80558226>] register_syscore+0x30/0x60
[    0.227444] [<ffffffff804ca0fe>] aplic_probe+0xd2/0xfa
[    0.227453] [<ffffffff80559b2e>] platform_probe+0x3e/0x7a
[    0.227461] [<ffffffff8055731a>] really_probe+0x88/0x35c
[    0.227469] [<ffffffff805576ae>] __driver_probe_device+0xc0/0x13a
[    0.227478] [<ffffffff805577f4>] driver_probe_device+0x38/0xb2
[    0.227486] [<ffffffff80557ba6>] __driver_attach_async_helper+0x3c/0xc4
[    0.227493] [<ffffffff80054a0e>] async_run_entry_fn+0x28/0x154
[    0.227500] [<ffffffff8004482a>] process_one_work+0x14e/0x3d2
[    0.227509] [<ffffffff800452fe>] worker_thread+0x144/0x286
[    0.227516] [<ffffffff8004ca3e>] kthread+0xee/0x10e
[    0.227524] [<ffffffff8001050a>] ret_from_fork_kernel+0x18/0x14e
[    0.227532] [<ffffffff807bef36>] ret_from_fork_kernel_asm+0x16/0x18
[    0.227542] ---[ end trace 0000000000000000 ]---
[    0.228475] pinctrl-single 48508000.pinctrl: 512 pins, size 2048
[    0.228500] pinctrl-single 53838000.pinctrl: 512 pins, size 2048
[    0.228723] pinctrl-single 67107000.pinctrl: 512 pins, size 2048
[    0.227210] riscv-aplic 674e0000.interrupt-controller: 257 interrupts directly connected to 8 CPUs
[    0.227224] ------------[ cut here ]------------
[    0.227227] list_add double add: new=ffffffff8130ced0, prev=ffffffff8130ced0, next=ffffffff81316d40.
[    0.227302] WARNING: lib/list_debug.c:35 at __list_add_valid_or_report+0xe0/0xe6, CPU#4: kworker/u97:0/211
[    0.227322] Modules linked in:
[    0.227333] CPU: 4 UID: 0 PID: 211 Comm: kworker/u97:0 Not tainted 7.3.0-rc6 #1 PREEMPT_RT
[    0.227341] Hardware name: EyeQ7H evaluation board (DT)
[    0.227346] Workqueue: async async_run_entry_fn
[    0.227358] epc : __list_add_valid_or_report+0xe0/0xe6
[    0.227366]  ra : __list_add_valid_or_report+0xe0/0xe6
[    0.227375] epc : ffffffff804a08a0 ra : ffffffff804a08a0 sp : ffffffc600823b90
[    0.227379]  gp : ffffffff81389e70 tp : ffffffd60135ee00 t0 : 0000000000000000
[    0.227383]  t1 : 3fffffffffffffff t2 : 0000000000000000 s0 : ffffffc600823bb0
[    0.227387]  s1 : ffffffff8130ced0 a0 : 0000000000000058 a1 : ffffffd9efc9e5c0
[    0.227391]  a2 : ffffffd9efd5c510 a3 : 0000000000000000 a4 : 0000000000000000
[    0.227395]  a5 : 0000000000000000 a6 : ffffffd9efc6e5c0 a7 : bfffffffffffe000
[    0.227399]  s2 : 0000000000000000 s3 : ffffffff8130ce28 s4 : 0000000000000000
[    0.227402]  s5 : ffffffd6018b65c8 s6 : 0000000000000000 s7 : ffffffd6012fd605
[    0.227406]  s8 : ffffffd6010c3400 s9 : 0000000000000000 s10: 0000000000000000
[    0.227409]  s11: 0000000000000000 t3 : 3fffffffffffe000 t4 : 0000000000000020
[    0.227413]  t5 : 0000000000000000 t6 : ffffffc6008238f8 ssp : 0000000000000000
[    0.227417] status: 0000000200000120 badaddr: ffffffff804a08a0 cause: 0000000000000003
[    0.227422] [<ffffffff804a08a0>] __list_add_valid_or_report+0xe0/0xe6
[    0.227432] [<ffffffff80558226>] register_syscore+0x30/0x60
[    0.227444] [<ffffffff804ca0fe>] aplic_probe+0xd2/0xfa
[    0.227453] [<ffffffff80559b2e>] platform_probe+0x3e/0x7a
[    0.227461] [<ffffffff8055731a>] really_probe+0x88/0x35c
[    0.227469] [<ffffffff805576ae>] __driver_probe_device+0xc0/0x13a
[    0.227478] [<ffffffff805577f4>] driver_probe_device+0x38/0xb2
[    0.227486] [<ffffffff80557ba6>] __driver_attach_async_helper+0x3c/0xc4
[    0.227493] [<ffffffff80054a0e>] async_run_entry_fn+0x28/0x154
[    0.227500] [<ffffffff8004482a>] process_one_work+0x14e/0x3d2
[    0.227509] [<ffffffff800452fe>] worker_thread+0x144/0x286
[    0.227516] [<ffffffff8004ca3e>] kthread+0xee/0x10e
[    0.227524] [<ffffffff8001050a>] ret_from_fork_kernel+0x18/0x14e
[    0.227532] [<ffffffff807bef36>] ret_from_fork_kernel_asm+0x16/0x18
[    0.227542] ---[ end trace 0000000000000000 ]---

Fixes: b330fbfd34d7 ("irqchip/riscv-aplic: Register syscore operations only once")
Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 drivers/irqchip/irq-riscv-aplic-main.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-aplic-main.c b/drivers/irqchip/irq-riscv-aplic-main.c
index d9afb6ae98cf56d6fd9f858c31a3d23546c3b450..db15ec8a2d3462f6c911c1e5b7446b05b47bd127 100644
--- a/drivers/irqchip/irq-riscv-aplic-main.c
+++ b/drivers/irqchip/irq-riscv-aplic-main.c
@@ -116,14 +116,12 @@ static struct syscore aplic_syscore = {
 	.ops = &aplic_syscore_ops,
 };
 
-static bool aplic_syscore_registered __ro_after_init;
+static atomic_t aplic_syscore_registered = ATOMIC_INIT(0) __ro_after_init;
 
 static void aplic_syscore_init(void)
 {
-	if (!aplic_syscore_registered) {
+	if (!atomic_fetch_inc(&aplic_syscore_registered))
 		register_syscore(&aplic_syscore);
-		aplic_syscore_registered = true;
-	}
 }
 
 static int aplic_pm_notifier(struct notifier_block *nb, unsigned long action, void *data)

---
base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
change-id: 20261012-aplic-async-probe-81624e035607

Best regards,
-- 
Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
