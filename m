Return-Path: <SRS0=npMT=E7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CD43C5519F
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2020 11:40:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77D46206D4
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2020 11:40:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Kbpfbw2y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77D46206D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ROncHKEz0OglMddapcaT8XxDV1jrHyBwWrBvD4ArqP4=; b=Kbpfbw2yoj9yfcSDy/YXYV1A0r
	gmKTS1t8zlVUWugXwAfUXUxhzwiBg1p1/wea+e0fmfnpr3QoXL+EJG9ScPZtWL7+SMsq27pqfj//s
	Uqpd9P3zZKo4Vjyp6360ERKdycK5tZSWnxkxOMlILM8R7f7Ha2lB0NM0cXmnxbVA9AGWPXsTO+gkh
	mFXBkm5g0aqsntDTaZ7ESZRBGacMHiUyVlDsRb+ea6I+jR4rRAy+uwCslj3AZiVp9ychciCw12wgV
	GhXU4BZD2E4rhgNMzbSRcSBhzXp6BbK5RQLaLOcPrgFUSbqbHfRQHtmeH79J4h7auEO+T+6q26vKL
	25yc3c9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kht9t-0002Lg-0j; Wed, 25 Nov 2020 11:40:25 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kht9o-0002KK-4K
 for linux-riscv@lists.infradead.org; Wed, 25 Nov 2020 11:40:21 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CgzSr6MLwz15S7n;
 Wed, 25 Nov 2020 19:39:40 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Wed, 25 Nov 2020 19:39:55 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 <linux-riscv@lists.infradead.org>
Subject: [PATCH] riscv: Add machine name to kernel boot log and stack dump
 output
Date: Wed, 25 Nov 2020 19:44:15 +0800
Message-ID: <20201125114415.94912-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_064020_423625_46BD6B57 
X-CRM114-Status: GOOD (  12.56  )
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add the machine name to kernel boot-up log, and install
the machine name to stack dump for DT boot mode.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---

Here is the message after patched,

root@(none):~# dmesg |grep "Machine model"
[    0.000000] Machine model: riscv-virtio,qemu

root@(none):~# echo c > /proc/sysrq-trigger 
[ 1519.475346] sysrq: Trigger a crash
[ 1519.476004] Kernel panic - not syncing: sysrq triggered crash
[ 1519.476480] CPU: 0 PID: 64 Comm: sh Not tainted 5.10.0-rc5 #246
[ 1519.476877] Hardware name: riscv-virtio,qemu (DT)
[ 1519.477169] Call Trace:
...

 arch/riscv/kernel/setup.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index c424cc6dd833..901ac0c680dd 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -54,8 +54,15 @@ static DEFINE_PER_CPU(struct cpu, cpu_devices);
 static void __init parse_dtb(void)
 {
 	/* Early scan of device tree from init memory */
-	if (early_init_dt_scan(dtb_early_va))
+	if (early_init_dt_scan(dtb_early_va)) {
+		const char *name = of_flat_dt_get_machine_name();
+
+		if (name) {
+			pr_info("Machine model: %s\n", name);
+			dump_stack_set_arch_desc("%s (DT)", name);
+		}
 		return;
+	}
 
 	pr_err("No DTB passed to the kernel\n");
 #ifdef CONFIG_CMDLINE_FORCE
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
