Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F67010775EA
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 16:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	References:In-Reply-To:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n3B3vzBuXnwsLW9TCxp1wTe3sF88CpGDlNEwyRVqO8g=; b=tHAKHIOEs6MC4L
	R6dWdpMz5Hw8cCmli+hXr0TG1o7oPrzcjzdUzyhUI1QSftL0ZIYNwwi3LwnyirzhaaTRvS0x+5RbY
	QYkhtRWtD2YJ0dB9JUacGTvVxlWpjxVP+CSwaGzsDOYxHM6MLEUdIEATh6o6tNA6EswL+Sx1JaAvx
	QxvI5uBsPXfyS1l/KruPJyA5yutbtou3Gmr5cFUKqW3h2dpgPJNwQcRQEMB2+PZEKGVWl+fh7hgxg
	DhoN0gVXP7IcmIy+4g3y67GfP0jCEcdxB27H0+xNV2QjAurwEDtLn5tRQFNFtD2t59qYImuyEijXC
	qVxfYdrsiBoHw6RYk/IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tki-00000008vKf-2dYU;
	Wed, 18 Mar 2026 16:28:12 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzqPc-00000008mbU-1qk7
	for linux-riscv@lists.infradead.org;
	Tue, 10 Mar 2026 06:17:49 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4fVNwB3MQ7z8Xs6v;
	Tue, 10 Mar 2026 14:17:46 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl2.zte.com.cn with SMTP id 62A6HT5x005013;
	Tue, 10 Mar 2026 14:17:29 +0800 (+08)
	(envelope-from liu.xuemei1@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Tue, 10 Mar 2026 14:17:31 +0800 (CST)
X-Zmail-TransId: 2afb69afb77b311-b4eab
X-Mailer: Zmail v1.0
Message-ID: <20260310141731145xMwLsyvXl9Gw-m6A4VRYj@zte.com.cn>
In-Reply-To: <20260310141349432DBRJJclgnBHYWu8it0geX@zte.com.cn>
References: 20260310141349432DBRJJclgnBHYWu8it0geX@zte.com.cn
Date: Tue, 10 Mar 2026 14:17:31 +0800 (CST)
Mime-Version: 1.0
From: <liu.xuemei1@zte.com.cn>
To: <anup@brainfault.org>, <tglx@kernel.org>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
        <sunilvl@ventanamicro.com>, <rafael.j.wysocki@intel.com>,
        <liujingqi@lanxincomputing.com>, <cyan.yang@sifive.com>,
        <nick.hu@sifive.com>
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <liu.xuemei1@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIHYyIDIvMl0gaXJxY2hpcC9yaXNjdi1hcGxpYzogUmVnaXN0ZXIgc3lzY29yZSBvcGVyYXRpb25zIG9ubHkgb25jZQ==?=
X-MAIL: mse-fl2.zte.com.cn 62A6HT5x005013
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: liu.xuemei1@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.133 unknown Tue, 10 Mar 2026 14:17:46 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 69AFB78A.000/4fVNwB3MQ7z8Xs6v
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_231748_799013_682663BF 
X-CRM114-Status: GOOD (  12.25  )
X-Mailman-Approved-At: Wed, 18 Mar 2026 09:28:11 -0700
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

From: Jessica Liu <liu.xuemei1@zte.com.cn>

Since commit 95a8ddde3660 ("irqchip/riscv-aplic: Preserve APLIC
states across suspend/resume"), when multiple NUMA nodes exist
and AIA is not configured as "none", aplic_probe() is called
multiple times. This leads to register_syscore(&aplic_syscore)
being invoked repeatedly, causing the following Oops:

[    1.188071] list_add double add: new=ffffffffb91461f0, prev=ffffffffb91461f0, next=ffffffffb915c408.
[    1.189839] ------------[ cut here ]------------
[    1.190080] kernel BUG at lib/list_debug.c:35!
[    1.190403] Kernel BUG [#1]
[    1.190438] Modules linked in:
[    1.191173] CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.0.0-rc2+ #1 PREEMPT(full)
[    1.191363] Hardware name: QEMU QEMU Virtual Machine, BIOS edk2-202402-20.an23 02/14/2024
[    1.191495] epc : __list_add_valid_or_report+0x60/0xc0
[    1.192103]  ra : __list_add_valid_or_report+0x60/0xc0
[    1.192143] epc : ffffffffb7b5c8ca ra : ffffffffb7b5c8ca sp : ffffffc600103ad0
[    1.192166]  gp : ffffffffb91feb60 tp : ffffffd680a1eac0 t0 : 2000000000000000
[    1.192188]  t1 : 000000000000006c t2 : 206464615f747369 s0 : ffffffc600103b00
[    1.192209]  s1 : ffffffffb915c408 a0 : 0000000000000058 a1 : ffffffe23ef7b0c0
[    1.192229]  a2 : 0000000000000010 a3 : 0000000000000000 a4 : 0000000000000000
[    1.192249]  a5 : 0000000000000000 a6 : c0000000ffffdfff a7 : ffffffffb93da948
[    1.192271]  s2 : ffffffffb91461f0 s3 : ffffffffb91461f0 s4 : ffffffffb915c408
[    1.192292]  s5 : ffffffd681254890 s6 : ffffffffb8c40410 s7 : ffffffffb84361c8
[    1.192313]  s8 : 0000000000000000 s9 : 0000000000000000 s10: 0000000000000000
[    1.192333]  s11: 0000000000000000 t3 : ffffffffb93da9e7 t4 : ffffffffb93da9e7
[    1.192352]  t5 : ffffffffb93da9e8 t6 : ffffffc6001038d8 ssp : 0000000000000000
[    1.192373] status: 0000000200000120 badaddr: ffffffffb7b5c8ca cause: 0000000000000003
[    1.192508] [<ffffffffb7b5c8ca>] __list_add_valid_or_report+0x60/0xc0
[    1.192606] [<ffffffffb7cc3236>] register_syscore+0x3e/0x70
[    1.192630] [<ffffffffb7b8d61c>] aplic_probe+0xc6/0x112
[    1.192649] [<ffffffffb7cc5014>] platform_probe+0x46/0x76
[    1.192669] [<ffffffffb7cc19c6>] call_driver_probe+0x1a/0x108
[    1.192687] [<ffffffffb7cc23e2>] really_probe+0x82/0x288
[    1.192707] [<ffffffffb7cc2654>] __driver_probe_device+0x6c/0x11e
[    1.192727] [<ffffffffb7cc27c8>] driver_probe_device+0x2c/0xa0
[    1.192746] [<ffffffffb7cc2a08>] __driver_attach+0xce/0x1ee
[    1.192763] [<ffffffffb7cc00e6>] bus_for_each_dev+0x5a/0xa6
[    1.192781] [<ffffffffb7cc1cf4>] driver_attach+0x1a/0x22
[    1.192798] [<ffffffffb7cc148a>] bus_add_driver+0x10e/0x1fc
[    1.192817] [<ffffffffb7cc3ab2>] driver_register+0x3e/0xd8
[    1.192837] [<ffffffffb7cc4c7c>] __platform_driver_register+0x1c/0x24
[    1.192887] [<ffffffffb8236e4c>] aplic_driver_init+0x1a/0x22
[    1.192909] [<ffffffffb76179a6>] do_one_initcall+0x36/0x2b4
[    1.192935] [<ffffffffb82013b2>] do_initcalls+0xfe/0x12c
[    1.192958] [<ffffffffb82015a4>] kernel_init_freeable+0x15c/0x1c8
[    1.192979] [<ffffffffb80894ea>] kernel_init+0x20/0x152
[    1.193001] [<ffffffffb76194c6>] ret_from_fork_kernel+0x12/0x1f6
[    1.193020] [<ffffffffb80943e6>] ret_from_fork_kernel_asm+0x16/0x18
[    1.193190] Code: 86a6 85aa 4517 00fc 0513 7765 8097 ffaa 80e7 9940 (9002) 854a
[    1.193665] ---[ end trace 0000000000000000 ]---
[    1.194254] Kernel panic - not syncing: Fatal exception in interrupt
[    1.194627] SMP: stopping secondary CPUs
[    1.195436] Kernel Offset: 0x37600000 from 0xffffffff80000000

Fix by registering syscore operations only once, using a static
variable aplic_syscore_registered to track registration.

Fixes: 95a8ddde3660 ("irqchip/riscv-aplic: Preserve APLIC states across suspend/resume")
Signed-off-by: Jessica Liu <liu.xuemei1@zte.com.cn>
---
 drivers/irqchip/irq-riscv-aplic-main.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-riscv-aplic-main.c b/drivers/irqchip/irq-riscv-aplic-main.c
index 8775f188ea4f..9f53979b6962 100644
--- a/drivers/irqchip/irq-riscv-aplic-main.c
+++ b/drivers/irqchip/irq-riscv-aplic-main.c
@@ -116,6 +116,16 @@ static struct syscore aplic_syscore = {
 	.ops = &aplic_syscore_ops,
 };

+static bool aplic_syscore_registered __ro_after_init;
+
+static void aplic_syscore_init(void)
+{
+	if (!aplic_syscore_registered) {
+		register_syscore(&aplic_syscore);
+		aplic_syscore_registered = true;
+	}
+}
+
 static int aplic_pm_notifier(struct notifier_block *nb, unsigned long action, void *data)
 {
 	struct aplic_priv *priv = container_of(nb, struct aplic_priv, genpd_nb);
@@ -379,7 +389,7 @@ static int aplic_probe(struct platform_device *pdev)
 		return rc;
 	}

-	register_syscore(&aplic_syscore);
+	aplic_syscore_init();

 #ifdef CONFIG_ACPI
 	if (!acpi_disabled)
-- 
2.27.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
