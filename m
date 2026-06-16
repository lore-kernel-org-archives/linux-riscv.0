Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF87CD98E1
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 15:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i/BFrJOAATgngT2ZYV4SaUtp52258P7eKZsORVx5miM=; b=sZ/Pcqhemwstvb
	gI05F82+ovt6WPkadoU/DM7gCFS0D/6i+IVN78L9qu4aXaleoRJn6/leS0L+Ysgo0muA8Y//y/tMa
	lncjJaVtILxoGeUuDcMkxv0pI0Vara9T0melR7DlrG3MGCON7seHALpGs4F8eD5YraA/HIbI9a6pH
	ybteH+ngcyDYXUTazw2SGk8/UHHKJZMPKawn/W6YD6UX8Oa3HM6NuS8zGOSHFjz13gXjPWbE0GnmJ
	E699QSsqHAyMk9H82cBCD0PCAoj7MI8snFMv7L37k0noJ0vmonl80JCmZ/zRiBujzZFbzY/JBNU/t
	I/829+cWyPbaYUfiErLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVTi-0000000FzI8-14tl;
	Tue, 16 Jun 2026 15:13:26 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVTg-0000000FzHc-0gBJ
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jun 2026 15:13:25 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowAAX_OIPaDFqlg7xFA--.11374S2;
	Tue, 16 Jun 2026 23:13:20 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Conor Dooley <conor@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH] cache: sifive_ccache: remove debugfs on driver register failure
Date: Tue, 16 Jun 2026 23:13:14 +0800
Message-ID: <20260616151314.87102-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowAAX_OIPaDFqlg7xFA--.11374S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJrW7uryUKFy3WFyDAF4xZwb_yoW8Gw4rpa
	y7ua45Kr48WanxW3y3A3WUZFyfCa9FqFy29347uwnxZ3s8Ar4DXr18ZFWjvr17ZF48XanF
	yr15Jwn8CF4UCF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1l
	IxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUhtxDUUU
	UU=
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_081324_700656_B726E485 
X-CRM114-Status: UNSURE (   9.47  )
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

sifive_ccache_init() creates the debugfs injection file before
registering the platform driver. If platform_driver_register() fails, the
error path unmaps ccache_base while the debugfs file remains and its
write callback still uses that global mapping.

Remove the debugfs tree before unmapping the cache controller registers
on the registration failure path.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/cache/sifive_ccache.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/cache/sifive_ccache.c b/drivers/cache/sifive_ccache.c
index a86800b123b9..cf7877d8e3e5 100644
--- a/drivers/cache/sifive_ccache.c
+++ b/drivers/cache/sifive_ccache.c
@@ -100,6 +100,12 @@ static void setup_sifive_debug(void)
 	debugfs_create_file("sifive_debug_inject_error", 0200,
 			    sifive_test, NULL, &ccache_fops);
 }
+
+static void remove_sifive_debug(void)
+{
+	debugfs_remove_recursive(sifive_test);
+	sifive_test = NULL;
+}
 #endif
 
 static void ccache_config_read(void)
@@ -336,12 +342,16 @@ static int __init sifive_ccache_init(void)
 
 	rc = platform_driver_register(&sifive_ccache_driver);
 	if (rc)
-		goto err_unmap;
+		goto err_remove_debug;
 
 	of_node_put(np);
 
 	return 0;
 
+err_remove_debug:
+#ifdef CONFIG_DEBUG_FS
+	remove_sifive_debug();
+#endif
 err_unmap:
 	iounmap(ccache_base);
 err_node_put:
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
