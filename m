Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB07E784BE
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Dec 2025 12:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u5C7mgFvVRORcS4prUIEDaqEeWYXFpNC8gcC7ztbQZo=; b=VkDClenD/sDf5o
	THZeh5GhjwmqAtDJAdRjehVZtSMV68y5UBO3I46p0pFaG1oTqRpr+N4P8xDCIA04RMxY1jj6zwbPP
	LOiEMwqXKigvE9CKAVEHUf3RujsZdrEJvfBrzcvJmaXUuzwaqUajqdGW54FmcSu1Oc2HtGKoDmUqx
	yplGkQXVJ1grCgEdqxw0slAYr2I5RRM4uCoq6+BDZnPSDE5OHhGDc9RgNhQMmiDy5qFEGrqLuVwGr
	VynPy55NRD7+cWiKeFUT7gKwIaCtkYDq7sUEaAUNqXNxMPsSUKsGEbWH7WCHdaC37G0fwn+VsN3Mo
	s/eyps1ABEiYiDifr4Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZqHO-00000002lGA-1po2;
	Sun, 28 Dec 2025 12:53:50 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZqHM-00000002lFZ-0jWS
	for linux-riscv@lists.infradead.org;
	Sun, 28 Dec 2025 12:53:49 +0000
Received: from LAPTOP-N070L597.localdomain (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2eca68e1d;
	Sun, 28 Dec 2025 20:48:39 +0800 (GMT+08:00)
From: Zilin Guan <zilin@seu.edu.cn>
To: conor.dooley@microchip.com
Cc: daire.mcnamara@microchip.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zilin Guan <zilin@seu.edu.cn>,
	Jianhao Xu <jianhao.xu@seu.edu.cn>
Subject: [PATCH] soc: microchip: mpfs: Fix memory leak in mpfs_sys_controller_probe()
Date: Sun, 28 Dec 2025 12:48:36 +0000
Message-Id: <20251228124836.3681318-1-zilin@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-HM-Tid: 0a9b6500f27803a1kunm8b0da3cda5767
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZSBofVkhOTk4fT08fQxpKGVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSUJDQ0xVSktLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=OdFARV9ONvNCho4sAGZiGFcKXEwgjxj5/IH4WU/h95xIMJlezjrviReOHeH3JdyUkpCNGsJCHajH9w8RAfVa+jrzJa57v87ccVVyDXc5rySMdwLKMV1aRvmO6gxG9G7Uo8AtQCiVG/Ry4jg/aa84vOakhELYApx67LNuUmDKZhw=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=8TQHnr3dcefIVDlkuxlro1RTJr9H/RV8WrNYmYPmmtw=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_045348_595327_9FBDA472 
X-CRM114-Status: UNSURE (   9.01  )
X-CRM114-Notice: Please train this message.
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

In mpfs_sys_controller_probe(), if of_get_mtd_device_by_node() fails,
the function returns immediately without freeing the allocated memory
for sys_controller, leading to a memory leak.

Fix this by jumping to the out_free label to ensure the memory is
properly freed.

Also, consolidate the error handling for the mbox_request_channel()
failure case to use the same label.

Fixes: 742aa6c563d2 ("soc: microchip: mpfs: enable access to the system controller's flash")
Co-developed-by: Jianhao Xu <jianhao.xu@seu.edu.cn>
Signed-off-by: Jianhao Xu <jianhao.xu@seu.edu.cn>
Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
---
 drivers/soc/microchip/mpfs-sys-controller.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/microchip/mpfs-sys-controller.c b/drivers/soc/microchip/mpfs-sys-controller.c
index 30bc45d17d34..81636cfecd37 100644
--- a/drivers/soc/microchip/mpfs-sys-controller.c
+++ b/drivers/soc/microchip/mpfs-sys-controller.c
@@ -142,8 +142,10 @@ static int mpfs_sys_controller_probe(struct platform_device *pdev)
 
 	sys_controller->flash = of_get_mtd_device_by_node(np);
 	of_node_put(np);
-	if (IS_ERR(sys_controller->flash))
-		return dev_err_probe(dev, PTR_ERR(sys_controller->flash), "Failed to get flash\n");
+	if (IS_ERR(sys_controller->flash)) {
+		ret = dev_err_probe(dev, PTR_ERR(sys_controller->flash), "Failed to get flash\n");
+		goto out_free;
+	}
 
 no_flash:
 	sys_controller->client.dev = dev;
@@ -155,8 +157,7 @@ static int mpfs_sys_controller_probe(struct platform_device *pdev)
 	if (IS_ERR(sys_controller->chan)) {
 		ret = dev_err_probe(dev, PTR_ERR(sys_controller->chan),
 				    "Failed to get mbox channel\n");
-		kfree(sys_controller);
-		return ret;
+		goto out_free;
 	}
 
 	init_completion(&sys_controller->c);
@@ -174,6 +175,10 @@ static int mpfs_sys_controller_probe(struct platform_device *pdev)
 	dev_info(&pdev->dev, "Registered MPFS system controller\n");
 
 	return 0;
+
+out_free:
+	kfree(sys_controller);
+	return ret;
 }
 
 static void mpfs_sys_controller_remove(struct platform_device *pdev)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
