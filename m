Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7551E606A329
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 02:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n1hi0kJi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=DmrvZH1PQLFBV5kNmu9eMt8fsi9lg2YaxbnrpC6hyQ8=; b=n1hi0kJidVjTyzBIaRsXsQ/tzt
	Dsguw20I/i7gBBYhHaFxxC3Seg7aPJW1rbYh4MDVZhKZlY7AzcEw4ckQw8QVfw2QWX2U5StSCPrmu
	sZSTVsh8/RD1KmspmZ/TQjXE4uDPT8po5Te4jAHTltUFEvHBGhGydyzyV3YbN6IGaYtyhW1pj24J9
	ZrokpfaBE6RrqLy8IKr9pA7zrTI81nqlFF0nrhrQX76kSxx7TcwYug+2upuZyg3hiX1/LH1cLpJmk
	YsZWyJmqb8sZY/RGOX4/ETeLMquOjxcnF55qKGvucty785hcI6xP1jn7oaHJz3V5RmJH80MRQm88P
	zNJ1eKtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOQX3-000000048XJ-3AbI;
	Wed, 04 Nov 2026 02:15:21 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOQWx-000000048Tb-2jz6
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 02:15:21 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowACXwvwxlepqRnc+AA--.4848S2;
	Wed, 04 Nov 2026 10:15:13 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Conor Dooley <conor.dooley@microchip.com>,
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Bin Liu <b-liu@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-riscv@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH] usb: musb: mpfs: unregister the generic PHY device on remove
Date: Wed,  4 Nov 2026 02:15:22 +0000
Message-Id: <20261104021522.1468663-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: qwCowACXwvwxlepqRnc+AA--.4848S2
X-Coremail-Antispam: 1UD129KBjvJXoWrZr1fJFy5AF13KrW7Jr1rXrb_yoW8JrWxpa
	1UGFWUKrWDGF47Ja1UJw1UuasYkan7ArZ0kFZrJ3sF9wn8J347Wr98Z3WrZFy0kFW8KFWY
	ywn8tFy8GFZ3ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14
	v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xf
	McIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0E
	wIxGrwCF04k20xvE74AGY7Cv6cx26r48ZrWUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI
	8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
	xVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI
	8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnU
	UI43ZEXa7IUYbiStUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRUBA2rqY-m4xAAAs4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_181516_071603_C6046B00 
X-CRM114-Status: GOOD (  10.65  )
X-Spam-Score: -0.9 (/)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mpfs_probe() creates the "usb_phy_generic" platform device with
usb_phy_generic_register() and keeps it in glue->phy, but mpfs_remove()
hands the controller's own platform device to
usb_phy_generic_unregister().  The generic PHY device is therefore never
unregistered and its reference is leaked, while the controller device,
which the driver core is in the middle of removing, is torn down a
second time.

Pass glue->phy, as the probe error path already does.

Fixes: 7a96b6ea90a4 ("usb: musb: Add support for PolarFire SoC's musb controller")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/usb/musb/mpfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/musb/mpfs.c b/drivers/usb/musb/mpfs.c
index 587127abd30a..6cc2909b8ae3 100644
--- a/drivers/usb/musb/mpfs.c
+++ b/drivers/usb/musb/mpfs.c
@@ -357,7 +357,7 @@ static void mpfs_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(glue->clk);
 	platform_device_unregister(glue->musb);
-	usb_phy_generic_unregister(pdev);
+	usb_phy_generic_unregister(glue->phy);
 }
 
 #ifdef CONFIG_OF
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
