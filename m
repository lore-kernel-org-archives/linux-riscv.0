Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A46C88E72
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 15:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pwF9agv/ZeMZFNctOfwPL4R7EuFRjrijSHHBi54rauk=; b=QBhp7G332oqnVU
	W8nOL9sjMWWmVBjlQeNxGGMR+YVNrp2gdcrtbXOR9L2TGkYaZHYUOaGAWvDX/AKFnX6obAEjgnQ22
	lVp8fhJuJAuMrh+jrYQ266S/u10eW/JK8PwCID61JpDUlSPLmlzJHaoMwI0Gc4oeO9R0qscJnWdJu
	EEme8+KInC+6A4ltvyOfINmBU+y6/LNkH4qjxMb4bYXo3SIhHfdM3mZR+0CeRNe7mRPXD5VIaevZc
	LYKZDfwM4AtBMexLSl9NCccuUyv9SgMPyHB9DIo0ArrhMjuRjAQB69X+/Pe5DrnbLWNIn2flRkTxm
	6+msOOjQ9GXDfg9Ja/uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7E9U-0000000BhYy-2v69;
	Thu, 17 Sep 2026 15:35:56 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7E9R-0000000BhYB-1WDb
	for linux-riscv@lists.infradead.org;
	Thu, 17 Sep 2026 15:35:54 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAAHcz3WCKxqlauDCA--.46402S2;
	Thu, 17 Sep 2026 23:35:50 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: conor.dooley@microchip.com
Cc: daire.mcnamara@microchip.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] soc: microchip: mpfs: Fix flash leak in mpfs_sys_controller_probe()
Date: Thu, 17 Sep 2026 15:35:50 +0000
Message-Id: <20260917153550.2160672-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowAAHcz3WCKxqlauDCA--.46402S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJr1ftryUtF47JFWUGw15Arb_yoW8ZFWUpF
	4UJrW7tF18KF45JF10kw18GF1fZFnFqw1kWws7Gw17A34fW3srZFy3A3yrWFy8JryIgr15
	Cr45Ja1xJFsrAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBFb7Iv0xC_KF4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxV
	W0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Cr1j6rxdMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VAI37AI020EjII2zVCS5cI20VAGYxC7MxkF
	7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Gr43Wr
	1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr1j6F4UJwCI42IY6I8E87Iv6x
	kF7I0E14v26rxl6s0DYxBIdaVFxhVjvjDU0xZFpf9x07UMq2NUUUUU=
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBggNA2qr888yaQAAsm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_083553_772949_4988E1F0 
X-CRM114-Status: GOOD (  11.39  )
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

of_get_mtd_device_by_node() returns an MTD device reference that the
caller has to drop with put_mtd_device().  The probe error paths return
without releasing it, and the reference stored in sys_controller->flash
is never dropped when the controller is destroyed either.

Release the flash on the probe error paths and in
mpfs_sys_controller_delete(), so the reference is always put.

Fixes: 742aa6c563d2 ("soc: microchip: mpfs: enable access to the system controller's flash")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/soc/microchip/mpfs-sys-controller.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/microchip/mpfs-sys-controller.c b/drivers/soc/microchip/mpfs-sys-controller.c
index 92d1142a59e6..ad57b09e5807 100644
--- a/drivers/soc/microchip/mpfs-sys-controller.c
+++ b/drivers/soc/microchip/mpfs-sys-controller.c
@@ -98,6 +98,8 @@ static void mpfs_sys_controller_delete(struct kref *kref)
 	struct mpfs_sys_controller *sys_controller =
 		container_of(kref, struct mpfs_sys_controller, consumers);
 
+	if (sys_controller->flash)
+		put_mtd_device(sys_controller->flash);
 	mbox_free_channel(sys_controller->chan);
 	kfree(sys_controller);
 }
@@ -159,7 +161,8 @@ static int mpfs_sys_controller_probe(struct platform_device *pdev)
 	of_data = (struct mpfs_syscon_config *) device_get_match_data(dev);
 	if (!of_data) {
 		dev_err(dev, "Error getting match data\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto out_free;
 	}
 
 	for (i = 0; i < of_data->nb_subdevs; i++) {
@@ -174,6 +177,10 @@ static int mpfs_sys_controller_probe(struct platform_device *pdev)
 	return 0;
 
 out_free:
+	if (!IS_ERR_OR_NULL(sys_controller->flash))
+		put_mtd_device(sys_controller->flash);
+	if (!IS_ERR_OR_NULL(sys_controller->chan))
+		mbox_free_channel(sys_controller->chan);
 	kfree(sys_controller);
 	return ret;
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
