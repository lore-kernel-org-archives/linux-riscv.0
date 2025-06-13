Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 235DCC71135
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 09:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Mg1x1SE3MrGWzJHh9mrxunPrLdUCRx1LN6galMjhwlw=; b=0Vr+pcaWAKrph/
	FXgI1OBmPLdvcHyduuqtutWfObIIbbBSYQrIkuRlbycglgwcvPkQqMU3A3Tpbolk0iReTML8XwY3z
	gsH6t9jy3Pax7Ai9NaDQRhWKWyP6F2EnW2xTgh2X0Dc16LRMNOGwPdETUR0CT6nK0FWyo+HlwZl65
	bp5p353owQMHxg6LcxccHpP3cBwbLUoP/y1ROW7s+oJlsBRcq1p8vc+nC2UGSLzL9QwXJ1yut4nSE
	+Uqy/7wH4uIWMaiM360+6w49f1VrTM39N447o7lU/hqt2huwfOYBfzDkwXAUHCSwHQRShM1Xe36hq
	CPtTefLFNXczBRwfVsDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ0xY-0000000Fx7D-2Odv;
	Fri, 13 Jun 2025 09:44:28 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ0fP-0000000FuP1-3sDo
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 09:25:46 +0000
Received: from [127.0.0.2] (unknown [210.73.43.2])
	by APP-01 (Coremail) with SMTP id qwCowAAn1tSP7ktoxvw7Bg--.2681S2;
	Fri, 13 Jun 2025 17:25:37 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Fri, 13 Jun 2025 17:25:33 +0800
Subject: [PATCH] gpio: spacemit: Add missing MODULE_DEVICE_TABLE
MIME-Version: 1.0
Message-Id: <20250613-k1-gpio-of-table-v1-1-9015da8fdfdb@iscas.ac.cn>
X-B4-Tracking: v=1; b=H4sIAI3uS2gC/x3MTQqAIBBA4avIrBvQ6Q+6SrTImmooVDQiiO6et
 PwW7z2QOAon6NQDkS9J4l2GKRRM2+hWRpmzgTTVujEl7gbXIB79gudoD0YispVtG1vVJeQsRF7
 k/pf98L4fKAWyM2IAAAA=
X-Change-ID: 20250613-k1-gpio-of-table-222b4b76b453
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>
Cc: Vivian Wang <uwu@dram.page>, linux-gpio@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Vivian Wang <wangruikang@iscas.ac.cn>
X-Mailer: b4 0.14.2
X-CM-TRANSID: qwCowAAn1tSP7ktoxvw7Bg--.2681S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Jr15ur4DCry5GF43JFWDJwb_yoW8Jr1xpF
	45Zr9ak3y5GF43tasFvan7ZF18ua1vgFyIgF12kw1xZ3WqkrnFgF4jyFZF934UXryrJrW7
	Xa1DGFyDWF18Ar7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWUuVWrJwAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcS
	sGvfC2KfnxnUUI43ZEXa7VUb8hL5UUUUU==
X-Originating-IP: [210.73.43.2]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_022544_325156_53EF5F6F 
X-CRM114-Status: UNSURE (   9.11  )
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

The gpio-spacemit-k1 driver can be compiled as a module. Add missing
MODULE_DEVICE_TABLE so it can be matched by modalias and automatically
loaded by udev.

Fixes: d00553240ef8 ("gpio: spacemit: add support for K1 SoC")
Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
This patch is available at:

https://github.com/dramforever/linux/tree/k1/gpio-of-table/v1
---
 drivers/gpio/gpio-spacemit-k1.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-spacemit-k1.c b/drivers/gpio/gpio-spacemit-k1.c
index f027066365ff8741f99da076d1e7b6339a6c1a22..3cc75c701ec40194e602b80d3f96f23204ce3b4d 100644
--- a/drivers/gpio/gpio-spacemit-k1.c
+++ b/drivers/gpio/gpio-spacemit-k1.c
@@ -278,6 +278,7 @@ static const struct of_device_id spacemit_gpio_dt_ids[] = {
 	{ .compatible = "spacemit,k1-gpio" },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, spacemit_gpio_dt_ids);
 
 static struct platform_driver spacemit_gpio_driver = {
 	.probe		= spacemit_gpio_probe,

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250613-k1-gpio-of-table-222b4b76b453

Best regards,
-- 
Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
