Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DECA3CDB466
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jun 2026 01:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Figt72Fr4ksX88kuQYjRF6FwHEr+zalCSs4CFvdSWHA=; b=1eEdV4Msps8I5i
	Z3PzqiRewYilr66smdCfao3C2+FBEE9nFwsjwgB4rzu0RkARJAsu6wx4cvkbSxiVAh16U1zU9nHG5
	jLpZyOum6JS5RkmXtTfPDdC77Bta8xNpFWgzzs5Q/SlAkOB6OuJBb0gx6uBlH1Vnl/W6JqiboTp2d
	AFhr12OnFqfRQ+/WWfNlDSpTGbAY/6vddJmI6G5E4fLRiIpdDS66hMO99GhsWZU5G45g+eHAVV6hT
	xUuZEBrRs7g8VAmnq0cgP3xHNyqMMqySOhgi6h4E1N8RLTYkns1xjRWH5oHdOVbW3aPLnQdsZAi0g
	4uLgZDxUgenEejGKNytg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbqMU-00000005ZHM-42aV;
	Tue, 23 Jun 2026 01:55:38 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbqMS-00000005ZGX-14JP
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jun 2026 01:55:38 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowADHINSV5zlqGsbCFA--.2902S2;
	Tue, 23 Jun 2026 09:55:33 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Conor Dooley <conor@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Paul Walmsley <pjw@kernel.org>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	pengpeng@iscas.ac.cn
Subject: [PATCH v2] cache: sifive_ccache: remove debugfs on driver register failure
Date: Tue, 23 Jun 2026 09:55:27 +0800
Message-ID: <20260623015527.32846-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowADHINSV5zlqGsbCFA--.2902S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw15Zw1DAry8JrW3Gry3urg_yoW8Gw4rpF
	W7uFyagr18uw42g3srA3WUAFyfCa9xWFy29348uw13Z398Ar1DXry8XFWjvF17ZF4rJanr
	tr1rt3Z8AF15CF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F
	4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AK
	xVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1l
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j
	6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUmjg
	xUUUUU=
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_185536_657124_F157650D 
X-CRM114-Status: UNSURE (   8.83  )
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

sifive_ccache_init() sets up debugfs entries before registering the
platform driver. If platform_driver_register() fails, the current error
path unmaps the controller base but leaves the debugfs directory behind.

Remove the debugfs directory directly on that failure path before
unmapping the controller base.

Fixes: c90847bcbfb6 ("cache: sifive_ccache: Partially convert to a platform driver")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v1: https://lore.kernel.org/all/20260616151314.87102-1-pengpeng@iscas.ac.cn/
- remove the helper and explicit dentry NULL assignment
- directly call debugfs_remove_recursive() in the
  platform_driver_register() failure path

 drivers/cache/sifive_ccache.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/cache/sifive_ccache.c b/drivers/cache/sifive_ccache.c
index 2acb8bdf06d5..3b7a78fc7feb 100644
--- a/drivers/cache/sifive_ccache.c
+++ b/drivers/cache/sifive_ccache.c
@@ -338,12 +338,16 @@ static int __init sifive_ccache_init(void)
 
 	rc = platform_driver_register(&sifive_ccache_driver);
 	if (rc)
-		goto err_unmap;
+		goto err_remove_debugfs;
 
 	of_node_put(np);
 
 	return 0;
 
+err_remove_debugfs:
+#ifdef CONFIG_DEBUG_FS
+	debugfs_remove_recursive(sifive_test);
+#endif
 err_unmap:
 	iounmap(ccache_base);
 err_node_put:
-- 
2.50.1 (Apple Git-155)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
