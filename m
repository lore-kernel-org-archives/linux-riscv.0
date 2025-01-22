Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9FCAC02181
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jan 2025 08:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8zIKbPY+4yBL8p9xp8RSbSDda4ETwLpMxWVk4EwPea4=; b=LAd+t2kk/+Vqf8
	rhMLwK1xy1dtaNzepMo3wOzpB6Iiw96lBVopjc3flsR86MDbq/bMnwsNWIf6NJk314MK32Nl3uy9i
	C9MCfEeupkWXGblpBFNR3CGpzz4WTapZE6i+Sh3nSM1LVky9Wd8KLm1Kaf+j7NpXYre5aeBRe1wXR
	Ug4aH+M6IXm9u1jxBklXsQCaJmuLHe14bCsN++faro3kZyJkRdGHiPFwq2bHq6ttJsKSig2glt+dU
	Yh262KdP6qX9C9q1H9c5JLVvNKZqeyNUHaq/PPWHaUJLltrquiAL7uzAQJMUSpXLnmB8yNeVJGhMe
	p34e3VXvoKr+DipcC+Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taVr0-00000009gRm-1KXH;
	Wed, 22 Jan 2025 08:12:50 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taVqx-00000009gRC-1RVP
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jan 2025 08:12:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 27957A41BF2;
	Wed, 22 Jan 2025 08:10:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B022BC4CED6;
	Wed, 22 Jan 2025 08:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737533566;
	bh=pNAUmwzL50Wy8U5Ifi6Tf8zHHxv60Gh4QYKc+oUPoMg=;
	h=From:To:Cc:Subject:Date:From;
	b=tkQI89M5pbfBMi0oH4BByNiDkBgGmQN16tZ0TAXdAH/+cC7DJYAfxcjUyEUVivrtz
	 4JA0VOkNW/BCXZ4GA4guileuQ34JVSSH4s41g0M2bdeIubMwXPEE1D9mwklgPgLSe/
	 CMZIIiwAZQNiQBOJktffx3sjZQq/TGuXSrotfn/WqOl7XIY1z4F6aE7Wi7b5S5Fwtx
	 4dw5nwu7DLcPyevAwkUg/weIf29jv2yqq8C+OAH7/VwkI/+xQZLxPC0RZRyUyNlzk4
	 8EBw6ACnG0TNbRF/v1uOZKjCaC6TR0mNKPsqqTZaf3DsQ7oTUpEvpk8OqvCQB3RZ1Z
	 z94+uig7WVcUw==
From: guoren@kernel.org
To: palmer@dabbelt.com,
	guoren@kernel.org,
	conor@kernel.org,
	geert+renesas@glider.be,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	yoshihiro.shimoda.uh@renesas.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org,
	Guo Ren <guoren@linux.alibaba.com>,
	stable@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH V2] usb: gadget: udc: renesas_usb3: Fix compiler warning
Date: Wed, 22 Jan 2025 03:12:31 -0500
Message-Id: <20250122081231.47594-1-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_001247_446478_6F35F995 
X-CRM114-Status: UNSURE (   9.48  )
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

Fixes: 746bfe63bba3 ("usb: gadget: renesas_usb3: add support for Renesas
USB3.0 peripheral controller")
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
