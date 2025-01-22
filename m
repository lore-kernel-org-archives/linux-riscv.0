Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42973C02182
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jan 2025 02:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KqaWl+UJWXyya0EgR49nbTHWV3c9dPV4Tmug2lbFOps=; b=kgpqA8jLCgTbcJ
	hiDi5Ffu6bES7EpvhFZ26yhq/686VdrWLCUqHmaPb5frX97HzGZ/mv3IN+lHx5v/fQeysPFwCdhbt
	teCOiMLmC44FItbncfgomK78Yrpm+Zx6CgUAl/cT0gMx6xNPAzJ8LyWv7wRQidfoga+UJPF4SPsBO
	R4Uad6cnvEOxVgXVc/AZi3NxRfzqvPaRwh5ouKJeM8IaK6rd1bfxVvueTtlk8cSPz+dxBh4qsgSMd
	g7Rvbc5AP5kYbOFHP4Xuwi0CLZGEw2PqopLlzzHsBu6LRTA/X11SggqBk/SznUEYl3BGWKM6EKsY1
	9NXUB5zgLU6mR1LIM1/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taQp5-00000009H6e-0PTr;
	Wed, 22 Jan 2025 02:50:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taQp3-00000009H6M-0gHq
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jan 2025 02:50:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D8BD35C5BA6;
	Wed, 22 Jan 2025 02:49:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCB21C4CEDF;
	Wed, 22 Jan 2025 02:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737514228;
	bh=tSe8zq64GYFFDsH13XEnW64yDOeQMrGH+qPo7B8Ok28=;
	h=From:To:Cc:Subject:Date:From;
	b=GogVAmSfJYD3c9wtlsfGAdufGgBuUZhlf+ZlgbQzv2dpLTY6oS1LpIks7fFXFy2A9
	 eJ4k8bkzWAArTIgzVmnDk3es/nlWXv6SFFHxfom5wEbQoLCYGvfVWYYZDqlSSyuW5L
	 +xlLC1DhuB+M6/vJFHn4PmyTOPClAsDYtramHrnL/meRTlU04pK2aeBcQC07/HE0vo
	 uxHHqE4489gQFlJiIy9RM8xYkVeByOWZSZuSw7L9XSmszjI80ddHxzmNhSwFLPMQ+H
	 dxNfQMNpMw5WJUnDyZwzF1Cvu5iHK2D0NoBIEGxg9Zae4ZDokESNRhyg+qJZMA3wxk
	 t3lh6DhyYupVA==
From: guoren@kernel.org
To: palmer@dabbelt.com,
	guoren@kernel.org,
	conor@kernel.org,
	geert+renesas@glider.be,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org,
	Guo Ren <guoren@linux.alibaba.com>,
	stable@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] usb: gadget: udc: renesas_usb3: Fix compiler warning
Date: Tue, 21 Jan 2025 21:50:13 -0500
Message-Id: <20250122025013.37155-1-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_185029_248891_79A6397C 
X-CRM114-Status: UNSURE (   9.17  )
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

From: Guo Ren <guoren@linux.alibaba.com>

drivers/usb/gadget/udc/renesas_usb3.c: In function 'renesas_usb3_probe':
drivers/usb/gadget/udc/renesas_usb3.c:2638:73: warning: '%d'
directive output may be truncated writing between 1 and 11 bytes into a
region of size 6 [-Wformat-truncation=]
2638 |   snprintf(usb3_ep->ep_name, sizeof(usb3_ep->ep_name), "ep%d", i);
                                    ^~~~~~~~~~~~~~~~~~~~~~~~     ^~   ^

Fixes: 8292493c22c8 ("riscv: Kconfig.socs: Add ARCH_RENESAS kconfig option")
Cc: stable@vger.kernel.org
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501201409.BIQPtkeB-lkp@intel.com/
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 drivers/usb/gadget/udc/renesas_usb3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index fce5c41d9f29..89b304cf6d03 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -310,7 +310,7 @@ struct renesas_usb3_request {
 	struct list_head	queue;
 };
 
-#define USB3_EP_NAME_SIZE	8
+#define USB3_EP_NAME_SIZE	16
 struct renesas_usb3_ep {
 	struct usb_ep ep;
 	struct renesas_usb3 *usb3;
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
