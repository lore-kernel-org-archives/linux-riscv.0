Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A1F606A328
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 02:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pK8LpqM+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=xGawyRevJ2By7+0XPnMUNau1Z8pbpSHqg1eOIxJrBHU=; b=pK8LpqM+F/VXMFdufJ2MWyqjRe
	CRqnmcGZKcoRViPY7bbxyAAPfw1bRc4M1QJf4F3IjY1Cun6M6wAto10bKxzJ/CrwewM5cUnTx5Jtl
	SLhJSS6JFBiuLYxXAbcHKTEOFhcBqZ6nIPReRSxZS5cJFvv4zsNLpmeRrnbUkioKHkDtMez97X/2m
	J0fErMIGX8MxwuyfNCmtpqEsAcGGEkaB1H6q9oXvdXY0ASQ4M8ja1FzFe1Tr/pl8qc6HAHi4ncy6z
	cOZWzDk7yjjVMpHQbiBjiVTfwb+U6/ECSFP3Tnn1ZcV4rdG8MDVu3J7Wcb5bbvpZMmx3s7UHgHYp/
	/OeqrreQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOQWF-0000000480e-09ps;
	Wed, 04 Nov 2026 02:14:31 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOQWC-000000047xN-2Bmb
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 02:14:30 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowAAXQfsClepqKnU+AA--.27365S2;
	Wed, 04 Nov 2026 10:14:26 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Conor Dooley <conor.dooley@microchip.com>,
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>
Cc: linux-riscv@lists.infradead.org
Subject: [PATCH] soc: microchip: mpfs-sys-controller: put the flash device reference
Date: Wed,  4 Nov 2026 02:14:35 +0000
Message-Id: <20261104021435.1468301-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: qwCowAAXQfsClepqKnU+AA--.27365S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFW7Aw4fJF1fWFW7ArWDArb_yoW8WF1fpF
	48XrW3t3W8KF45JF1v9w18uF1fuFnFq34kuws7WwnrG34fW34DuFyay3yrWFyUJryIgr1U
	Cr4UAay8GFsrAFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkqb7Iv0xC_KF4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14
	v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xf
	McIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv
	6cx26r48ZrWUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr
	4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxG
	rwCI42IY6xIIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr
	1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY
	6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU82LvtUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwEBA2rqZFi4FgAAsW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_181428_963172_5E1DFFE6 
X-CRM114-Status: UNSURE (   9.39  )
X-CRM114-Notice: Please train this message.
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

of_get_mtd_device_by_node() returns an mtd_info with a reference taken
on the MTD device, which is stored in sys_controller->flash.  The
reference is never released, neither when the last sys_controller user
goes away nor on the probe error path that frees a freshly allocated
controller without initialising the kref.

Balance it with put_mtd_device() in both places.

Fixes: 742aa6c563d2 ("soc: microchip: mpfs: enable access to the system controller's flash")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/soc/microchip/mpfs-sys-controller.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soc/microchip/mpfs-sys-controller.c b/drivers/soc/microchip/mpfs-sys-controller.c
index ef27e1083f0f..96675b7de184 100644
--- a/drivers/soc/microchip/mpfs-sys-controller.c
+++ b/drivers/soc/microchip/mpfs-sys-controller.c
@@ -99,6 +99,8 @@ static void mpfs_sys_controller_delete(struct kref *kref)
 		container_of(kref, struct mpfs_sys_controller, consumers);
 
 	mbox_free_channel(sys_controller->chan);
+	if (!IS_ERR_OR_NULL(sys_controller->flash))
+		put_mtd_device(sys_controller->flash);
 	kfree(sys_controller);
 }
 
@@ -177,6 +179,8 @@ static int mpfs_sys_controller_probe(struct platform_device *pdev)
 	mpfs_sys_controller_put(sys_controller);
 	return ret;
 out_free:
+	if (!IS_ERR_OR_NULL(sys_controller->flash))
+		put_mtd_device(sys_controller->flash);
 	kfree(sys_controller);
 	return ret;
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
