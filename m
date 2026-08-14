Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FD1C5B572
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 08:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9t4JlH1LRlgT/PNhtRTSyj4vZrFshVRLVluRau/Bg6s=; b=v/+XIakBL4FwAV
	DDYnetWoqDPfhSVJY/w8ObULKjMmqRE01uIjzF/ejZ5yf9fQ1Yqih3+XrdOZAZ/n2GWOjoeYwdmNm
	AL/scMHFpdyoYhJm2o7+1M/oQ6QDbAcdNjbMF1Morqmg+xS4rMsuQaGvURHy8aLdCdUp0FbgEwIwT
	vqdIhFPr7YfV4c3on7LE8YnXlq51INsA4Q0KIadmljGe/BH5FPQe8cjN8vK5MGSrFLsTHBEDXkBmW
	YwzaeUM06ZPI13W5LhSuHDDT3PNAQ06dej+wrHiGejY7fQR2vWcqgvGdmQ4c+84G1TGSm1jM/v7x2
	lH2VgWMQVyOx99WvpU0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wun2v-00000002FvU-0vUF;
	Fri, 14 Aug 2026 08:13:45 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wun2s-00000002FuQ-1JTH
	for linux-riscv@lists.infradead.org;
	Fri, 14 Aug 2026 08:13:44 +0000
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowABnPfEvzn5qbC+fBQ--.31470S2;
	Fri, 14 Aug 2026 16:13:36 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Conor Dooley <conor@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH v3] cache: sifive_ccache: remove debugfs on driver register failure
Date: Fri, 14 Aug 2026 16:13:34 +0800
Message-ID: <20260814081334.25771-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: qwCowABnPfEvzn5qbC+fBQ--.31470S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw4DCF48AFW3Zr4UGFWrAFb_yoW8XF48pF
	W7ua4agr48uw429347A3WDZFyrCa9IqFy2934Uuw13Z398Ar1DXw18JFWYvF17ZF48Jw42
	yr1ak3Z8AFW5CaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9I14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
	xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
	Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
	x4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r4j6r
	yUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
	6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJb
	IYCTnIWIevJa73UjIFyTuYvjfU5byZUUUUU
X-Originating-IP: [111.196.241.250]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_011342_714357_46BB4BF9 
X-CRM114-Status: UNSURE (   9.26  )
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

sifive_ccache_init() creates its debugfs entries before registering the
platform driver. If platform_driver_register() fails, the current error
path unmaps ccache_base but leaves the debugfs file and its write
callback reachable.

Remove the debugfs directory on that failure path before unmapping the
controller registers.

Fixes: c90847bcbfb6 ("cache: sifive_ccache: Partially convert to a platform driver")

Assisted-by: Codex:gpt-5
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v2: https://lore.kernel.org/all/20260623015527.32846-1-pengpeng@iscas.ac.cn/
- no source-code changes
- rebase on current RISC-V sources
- add the coding-assistant disclosure

The error path was reviewed statically. It was not exercised on SiFive
hardware.

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
