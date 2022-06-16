Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60397C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jun 2022 08:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Up/6LOk4bxAfQ5a0dmj6LL2OzeRXGiaulKiTBJs9+S8=; b=qjvpUH/lTIzOIv
	BlLoSid4gBifvwKgmsa1iO22VrkMbq98uE4+fhjqGZCEEOeYN4+R5u/Vfww7ZpAYTLjEf78FUIoTL
	6axfn0iW4VO+7iV6Ix0ZqM360cCKHJ73XP3w5BfNVv6GYyFcbuZAiBoHHpOJKT2O9soY8+3pNtOk8
	ReK82h3qRtBz+WIA2dN8E7+tYh0cyBVvOt7kXfFshPuGMpEWbGyHe30XX35H5D5vZBCemmt7/Rfrd
	skoLXKKe+NJNhv4xDT85L3TS2U2lJtfEnNhuTS+KAsrSJKY2JJA7fXcGLWPADjfBEbgpwhV2bkkUi
	YVu567Z/3itTcP+SRS6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1kTl-001Gh7-6o; Thu, 16 Jun 2022 08:03:49 +0000
Received: from m15111.mail.126.com ([220.181.15.111])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1kMk-001E2c-Jq
	for linux-riscv@lists.infradead.org; Thu, 16 Jun 2022 07:56:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=LIcj/
	J5ZMaTfidoH1YqlkSee/mURHk9R9nwbtWge7aM=; b=EvBfc518sCN4qXUYM/cVQ
	wF2itf/pzkLdTTHVZpIRHZEIpBuDH4CoKk707YdMqTb4+bT7a8h4afm4xBDM1FIm
	i+myGI4QMqIz1QMpyI9MyC5yzWK3Pu0l0wLMP9I+7C7JONQOmJaMHl4C+MC6h3A9
	p8VTdRAbnX6rLzHGjZ3Hvg=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp1 (Coremail) with SMTP id C8mowABXNd4i4qpi5JAYEg--.33043S2;
	Thu, 16 Jun 2022 15:56:19 +0800 (CST)
From: Liang He <windhl@126.com>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu
Cc: windhl@126.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] soc: sifive: Add missing of_node_put() in sifive_l2_cache.c
Date: Thu, 16 Jun 2022 15:56:18 +0800
Message-Id: <20220616075618.3983977-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: C8mowABXNd4i4qpi5JAYEg--.33043S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ur4DAr47AryxJF1fCFW5Awb_yoW8urWrpr
	W7JryYvry8Ww4xWrZxJas8ZFyF9r1I93y7KFy7uwn8Zr17Jr1qqr4SyFyUZFZxCrW8uws3
	tr4jkF1DCF109FDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi5fQtUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbiuBQiF2JVj47iXgACsR
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_005635_081808_C7214D1B 
X-CRM114-Status: GOOD (  11.41  )
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
 changelog:

 v3: (1) fix error introduced by v2, missing 'int ret;' (2) fix error
      reported by checkpatch.pl (3) change subject title based on
      Conor's advice and drop the 'Reported by KLP' as this commit
      has not been applied.
 v2: fix error introduced by v1, missing ';'
 v1: fix missing of_node_put bug


 drivers/soc/sifive/sifive_l2_cache.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/soc/sifive/sifive_l2_cache.c b/drivers/soc/sifive/sifive_l2_cache.c
index 59640a1d0b28..dbaa66f59048 100644
--- a/drivers/soc/sifive/sifive_l2_cache.c
+++ b/drivers/soc/sifive/sifive_l2_cache.c
@@ -197,22 +197,28 @@ static int __init sifive_l2_init(void)
 	struct device_node *np;
 	struct resource res;
 	int i, rc, intr_num;
+	int ret;
 
 	np = of_find_matching_node(NULL, sifive_l2_ids);
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
@@ -220,7 +226,8 @@ static int __init sifive_l2_init(void)
 		rc = request_irq(g_irq[i], l2_int_handler, 0, "l2_ecc", NULL);
 		if (rc) {
 			pr_err("L2CACHE: Could not request IRQ %d\n", g_irq[i]);
-			return rc;
+			ret = rc;
+			goto out_put;
 		}
 	}
 
@@ -232,6 +239,9 @@ static int __init sifive_l2_init(void)
 #ifdef CONFIG_DEBUG_FS
 	setup_sifive_debug();
 #endif
-	return 0;
+	ret = 0;
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
