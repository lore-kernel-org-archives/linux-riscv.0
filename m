Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2AB8CF258E
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Oct 2024 00:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1veSqbADon7QcuOpxCoZ4B+xcBJFU+f7tDT1LRG65Ik=; b=APMGDHTR11Ocxe
	lUd9rf9UW88pPoVXtubGTX2Ei5IR+H/49H5q6OimllO6Jj7BzeNn9DgVjt6aYu49Bb9VKvFowxHJ3
	Bjs2rjDWn5V7H6EgfDvv0fS8EMyvyBNPFpxfY3/NpBvWmb9jLEQPgnDcp72ZDy2b/jU+iPvkYLguY
	l3z99YOK/EARUjd1UNPxBtHz5vH08rP4185scOzqBsWV8hY94vxfGP5LGfnKSj/gpX7Yitb1D3U6g
	9LETy7/kF+osF0lNs8pGeDUtBpaBUXYBj0BQ6oqXZyn44DOHhbBZA/nncG+MMTFjcAsBCv/jLaA57
	bW5rlaxOtpvdR3Ia1e+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t08sX-00000003QNG-0mZW;
	Mon, 14 Oct 2024 00:24:05 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t08sU-00000003QMu-3xRE
	for linux-riscv@lists.infradead.org;
	Mon, 14 Oct 2024 00:24:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B74AEA400C3;
	Mon, 14 Oct 2024 00:23:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AB7FC4CEC5;
	Mon, 14 Oct 2024 00:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728865441;
	bh=XBA2lRucLBPpWkMjO2VOWMYeRT+1cy4biQFRbLH41Yo=;
	h=From:To:Cc:Subject:Date:From;
	b=pZOhFITtIdwiQajF702TjukbYHq5I+EqHaLsOmmhzdw7G4XUtV2L/c1Oa65JRv44e
	 PHrWCLlxGEOUsXCWynkPynV3XYx+tiDbn0X97w4YzGaJhlVBpbfBWQ4mEIvyNw/qYb
	 jD6/lDef1qhFdw0oo48CEQktfq7DaxSTxBc/QDM29+xclZWT6wR+QjcMCsXoptLQKc
	 ppwEdTduJuIACNKFv1pDLojBPGT7dpK1ItuvzT2NYZKi9brg12ocJ3vudhKxXyC5Qu
	 FsHm0xqgjrm5w2NQbI/+I5lsfwUAwvRBVg5owkQ/+6VyrbOOY1wk2Pdaw5bKZk16Tv
	 mDfhkzxA2h1Xg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] tty: hvc: riscv_sbi: instantiate the legcay console earlier
Date: Mon, 14 Oct 2024 08:08:57 +0800
Message-ID: <20241014000857.3032-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241013_172403_068773_C43092BC 
X-CRM114-Status: GOOD (  13.16  )
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

The hvc_instantiate() is an early console discovery mechanism, it is
usually called before allocating hvc terminal devices. In fact, if
we check hvc_riscv_sbi's hvc_instantiate() return value, we'll find
that it's -1. So the calling hvc_instantiate() is too late.

We can remove the hvc_instantiate() to only rely on the hvc_alloc() to
register the kernel console. We can also move its calling earlier so
the kernel console is registered earlier, so that we can get kernel
console msg earlier. We take the 2nd choice in this patch.

Before the patch:
[    0.367440] printk: legacy console [hvc0] enabled
[    0.401397] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled

After the patch:

[    0.004665] printk: legacy console [hvc0] enabled
[    0.050183] Calibrating delay loop (skipped), value calculated using timer frequency.. 20.00 BogoMIPS (lpj=100000)

As can be seen, now the kernel console is registered much earlier before
the BogoMIPS calibrating.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/tty/hvc/hvc_riscv_sbi.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/hvc/hvc_riscv_sbi.c b/drivers/tty/hvc/hvc_riscv_sbi.c
index cede8a572594..d2ecfbf7c84a 100644
--- a/drivers/tty/hvc/hvc_riscv_sbi.c
+++ b/drivers/tty/hvc/hvc_riscv_sbi.c
@@ -68,12 +68,10 @@ static int __init hvc_sbi_init(void)
 		err = PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_dbcn_ops, 256));
 		if (err)
 			return err;
-		hvc_instantiate(0, 0, &hvc_sbi_dbcn_ops);
 	} else if (IS_ENABLED(CONFIG_RISCV_SBI_V01)) {
 		err = PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_v01_ops, 256));
 		if (err)
 			return err;
-		hvc_instantiate(0, 0, &hvc_sbi_v01_ops);
 	} else {
 		return -ENODEV;
 	}
@@ -81,3 +79,18 @@ static int __init hvc_sbi_init(void)
 	return 0;
 }
 device_initcall(hvc_sbi_init);
+
+static int __init hvc_sbi_console_init(void)
+{
+	int err;
+
+	if (sbi_debug_console_available)
+		err = hvc_instantiate(0, 0, &hvc_sbi_dbcn_ops);
+	else if (IS_ENABLED(CONFIG_RISCV_SBI_V01))
+		err = hvc_instantiate(0, 0, &hvc_sbi_v01_ops);
+	else
+		return -ENODEV;
+
+	return err < 0 ? -ENODEV : 0;
+}
+console_initcall(hvc_sbi_console_init);
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
