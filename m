Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB0D0C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jun 2022 04:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9dX4WBsLOgZdOF1GFWfjIyLZTwKP0ghY8wRQXVMvMWY=; b=WQYoSwpTdUMc0j
	dBI66xQabMVD6yxBmEMgDTQDZgUFB0zKYvIXO9qN6wPTM46hy4volKRJs0dTQdzGLANqw48KObbOM
	pikVpSeWlQtZciNCEyy9J/Hoqyc85jOyqzrtAHfNXdudEOwiDswvsN3hJe6gL64HSEq6NQovYAc08
	xjJaFrfgLiE4KTuyQkKIgfyfFECw7NdskDcXVeXfGvrBEJxZUmjHiMXyi0EVW+VnedivX37zH/ZaD
	4DfLjOxH+9Kv0dUN7VJLChdGmoCj/uAF1qYG6He8UkRY1BW1gakyQHVvJXZNdIUQ2wV1c2qWor7r9
	gfC66SPQArqqmNdrI9gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1hRo-000QH3-Hc; Thu, 16 Jun 2022 04:49:36 +0000
Received: from mail-m963.mail.126.com ([123.126.96.3])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1hRl-000QF3-OB
	for linux-riscv@lists.infradead.org; Thu, 16 Jun 2022 04:49:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=1pCJ5
	nuqf9rZ6vZLpt9IaeTJgUV4nj1fGxyJJfDr68s=; b=QzCApHmgqspl/NhthqSmc
	xNtqRp6k0Mnw0o3UnafJxG4PEEEoeoCC04wbN5QhN2LdXgQLj3NiGudk89a0cm+P
	mJ6j/3PrWm/k+1r2nvb+FqIp3VpTS9lpgn8nWkDeIr5yyq/lnFed4XdCnQ93O0QS
	Pm8Qzo2m8YDhuIRmp0oyIE=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp8 (Coremail) with SMTP id NORpCgBXWJVMtqpiiJrqFg--.28738S2;
	Thu, 16 Jun 2022 12:49:18 +0800 (CST)
From: Liang He <windhl@126.com>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu
Cc: windhl@126.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2] soc: sifive: (sifive_l2_cache) Add missing of_node_put()
Date: Thu, 16 Jun 2022 12:49:15 +0800
Message-Id: <20220616044915.3978097-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: NORpCgBXWJVMtqpiiJrqFg--.28738S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ur4DAr47AryxJF1fCFW5Awb_yoW8ZFW3pr
	WxXryavry8Gwn7Wr9xJ3Z8ZFyF9wn293y3KFyI9wn8ur17GrWqvr4SyFyUZF9xCrW09rsx
	tr4jkF1DC3W8uFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0p_ucMdUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/xtbBGgYiF1-HZTt0IAAAs7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_214934_172545_95762839 
X-CRM114-Status: GOOD (  10.86  )
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

In sifive_l2_init(), of_find_matching_node() will return a node pointer
with refcount incremented. We should use of_node_put() in each fail path
or when it is not used anymore.

Reported-by: kernel test robot <lkp@intel.com>

Signed-off-by: Liang He <windhl@126.com>
---
 changelog: 

 v2: (1) fix bug, introduced by v1 patch, reporeted by kernel-test-robot
 v1: fix missing bug

 ps: Because of many local commit, when using --base for format-patch,
     there are too many prerequest-patch-id. I wonder if it will lead to other 
     problems. So now, I send this commit still without --base.

 drivers/soc/sifive/sifive_l2_cache.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/soc/sifive/sifive_l2_cache.c b/drivers/soc/sifive/sifive_l2_cache.c
index 59640a1d0b28..e0e3d8b64c25 100644
--- a/drivers/soc/sifive/sifive_l2_cache.c
+++ b/drivers/soc/sifive/sifive_l2_cache.c
@@ -202,17 +202,22 @@ static int __init sifive_l2_init(void)
 	if (!np)
 		return -ENODEV;
 
-	if (of_address_to_resource(np, 0, &res))
-		return -ENODEV;
+	if (of_address_to_resource(np, 0, &res)) {
+		ret = -ENODEV;
+		goto out_put;
+	}
 
 	l2_base = ioremap(res.start, resource_size(&res));
-	if (!l2_base)
-		return -ENOMEM;
+	if (!l2_base) {
+		ret = -ENOMEM;
+		goto out_put;
+	}
 
 	intr_num = of_property_count_u32_elems(np, "interrupts");
 	if (!intr_num) {
 		pr_err("L2CACHE: no interrupts property\n");
-		return -ENODEV;
+		ret = -ENODEV;
+		goto out_put;
 	}
 
 	for (i = 0; i < intr_num; i++) {
@@ -220,7 +225,8 @@ static int __init sifive_l2_init(void)
 		rc = request_irq(g_irq[i], l2_int_handler, 0, "l2_ecc", NULL);
 		if (rc) {
 			pr_err("L2CACHE: Could not request IRQ %d\n", g_irq[i]);
-			return rc;
+			ret = rc;
+			goto out_put;
 		}
 	}
 
@@ -232,6 +238,10 @@ static int __init sifive_l2_init(void)
 #ifdef CONFIG_DEBUG_FS
 	setup_sifive_debug();
 #endif
-	return 0;
+	ret = 0;
+
+out_put:
+	of_node_put(np);
+	return ret;
 }
 device_initcall(sifive_l2_init);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
