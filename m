Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3C3C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jun 2022 12:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MnUw+2GSb7kV+96Mt4W+YMgYEAFyStt71O8DWQSjT9A=; b=UkkNVWscGZhjWB
	qGbWZdt1FAYpTpybF0A95MOxPOi3mDlsgrVgUf2e1uBIzlYMOMiKKy97TPgOikaPVo74yEzcbhcZW
	1g1P5K4Redp6PqLoeVqZudsWmUWwI0NBREm4dyU3nueIua9SSzkIkiY/c9UkLYTFAE68Jsi7cyhMm
	cFAGUGPyFUyDSuisQdzXA1YuplrVZK+sZDWXe3i9gA+BWdLC+OwfPei3pmvz0pVtgpfBehfOCjpDW
	hic6y6YapjIPD4TM/PK0Pc2v7kTlJHDfdelY2nBtgyiEvtbxBUYom6bqreE99fk3vuafkQ6sCSKur
	N6BpjVGU7EIW2IJ50NVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1S3X-00ERpB-DW; Wed, 15 Jun 2022 12:23:31 +0000
Received: from mail-m964.mail.126.com ([123.126.96.4])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1S3U-00ERnZ-LS
	for linux-riscv@lists.infradead.org; Wed, 15 Jun 2022 12:23:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=/S7Lt
	ya1R558SjoL2Bmo37oQ/5sKW0975g2st9fErow=; b=AU6k1GCoeSNgChOeXIDO0
	nXYr0qSuT7/FYVN2/KZaL2Sa5dpN2yrhybSdSnOvOog4siprnWRmsAuWjZqQDce7
	I4evqhKkSpLF4sTteQzHKAOt4I1LPzGlIitsPmxSKqouF69wkvqMsyxnozRBQMft
	EfbY4/k/1Pa00tLYfbwVpg=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp9 (Coremail) with SMTP id NeRpCgCHLYM0z6lij5AsEw--.51216S2;
	Wed, 15 Jun 2022 20:23:18 +0800 (CST)
From: Liang He <windhl@126.com>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	windhl@126.com
Subject: [PATCH] drivers: soc: sifive: Add missing of_node_put() in sifive_l2_cache.c
Date: Wed, 15 Jun 2022 20:23:15 +0800
Message-Id: <20220615122315.3965435-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: NeRpCgCHLYM0z6lij5AsEw--.51216S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ur4DAr47AryxJF1fCFW5Awb_yoW8Aryrpr
	W7XryYvry8Gws7WrW3Ja1DZFyF9r1Ik3y3KFyxuwnxAr15Jr1qqr4SyFyjqrZxCry8u398
	tr4jkr1DCFy0kFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pirWrdUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/xtbBGgYhF1-HZTaAQAAAsh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_052329_169081_21B7DF6F 
X-CRM114-Status: GOOD (  10.94  )
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

Signed-off-by: Liang He <windhl@126.com>
---
 drivers/soc/sifive/sifive_l2_cache.c | 29 ++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/sifive/sifive_l2_cache.c b/drivers/soc/sifive/sifive_l2_cache.c
index 59640a1d0b28..2b9c9522ef21 100644
--- a/drivers/soc/sifive/sifive_l2_cache.c
+++ b/drivers/soc/sifive/sifive_l2_cache.c
@@ -198,29 +198,41 @@ static int __init sifive_l2_init(void)
 	struct resource res;
 	int i, rc, intr_num;
 
+	int ret;
+
 	np = of_find_matching_node(NULL, sifive_l2_ids);
 	if (!np)
 		return -ENODEV;
 
 	if (of_address_to_resource(np, 0, &res))
-		return -ENODEV;
+	{
+		ret = -ENODEV;
+		goto out_put;
+	}
 
 	l2_base = ioremap(res.start, resource_size(&res));
 	if (!l2_base)
-		return -ENOMEM;
+	{
+		ret = -ENOMEM;
+		goto out_put;
+	}
 
 	intr_num = of_property_count_u32_elems(np, "interrupts");
-	if (!intr_num) {
+	if (!intr_num) {		
 		pr_err("L2CACHE: no interrupts property\n");
-		return -ENODEV;
+		ret = -ENODEV
+		goto out_put;
 	}
 
 	for (i = 0; i < intr_num; i++) {
 		g_irq[i] = irq_of_parse_and_map(np, i);
 		rc = request_irq(g_irq[i], l2_int_handler, 0, "l2_ecc", NULL);
+		
 		if (rc) {
+			
 			pr_err("L2CACHE: Could not request IRQ %d\n", g_irq[i]);
-			return rc;
+			ret = rc;
+			goto out_put;
 		}
 	}
 
@@ -232,6 +244,11 @@ static int __init sifive_l2_init(void)
 #ifdef CONFIG_DEBUG_FS
 	setup_sifive_debug();
 #endif
-	return 0;
+	ret = 0;
+	
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
