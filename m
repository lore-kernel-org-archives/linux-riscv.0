Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF1B8CD4F3D
	for <linux-riscv@archiver.kernel.org>; Mon, 18 May 2026 02:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3MdjJWyWWzRzTlOiNlAoU4cNmAvy/b3ZMKR6U5b25Jg=; b=e9WC8eUt+9VaUY
	Dnll1+5k3k9YbIA+0QQGjb0xFfVDzRqeVIjxgSS3YL7t7D/NCdd14HR0hzvXoeMFuVjTWhol4zb6e
	N8aq89qnThbNZ4FrlZk50dVP9ROXyx4js7Eq2lDjGm48feh1CjhbDfqjnEHvCXoLBgfEsWKWhv2Xg
	w9mpB0ObaoF8btYbeu9Tv5eMJ6i1ptuqr8YFlah2GigDkZhmdcBDYW7vh3IiILqJwYUoxjVIQ9lke
	U+0rS/0hzLJjuxTGutmezZ2mt6U0CENjO6NdP6ovKX3gqIxaSdJlMWc474UfLUhoyO9nOo1UVgY+8
	bD+IvsvPw8nHCz7uHzsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOoC7-0000000DzZw-2Dli;
	Mon, 18 May 2026 02:59:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOoC4-0000000DzY4-0KQw
	for linux-riscv@lists.infradead.org;
	Mon, 18 May 2026 02:59:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4AB3B60210;
	Mon, 18 May 2026 02:58:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F4A5C2BCB3;
	Mon, 18 May 2026 02:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779073139;
	bh=glMTiY++tgALwLhBNGfpjYuRggBZLhInFSckW+5Ix54=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Jdn4qGUJ093iqa6byfUuPKv+ZEfIiA15pvmTXxxuGoAkEew7EWOLaZEYn2ETiVQLS
	 2/T9tliso6CLyox925kQUIQyRS1ui97ShUwXnoAqpBVBwnjWEwJBJHf2czV1T7jbE5
	 pl/oY81XrqNnmUN0EGXmvcdH1Lr+SmEM0ti60OJRhioyCgfdjr9MngNssjwSSi4HqV
	 FfuOp5t/n+/yGvOtoxq5FfGHk/qhnMQ9teatGIWj2rTLKSjZKdEi37Cq/1/cFtK+UP
	 VoKtuRz+zqtuZL9Z+K5wFFC4aoDWR7Rprx/hoGf6LJVVuYQRVDQJ7J6PzCbj+vgdHT
	 Q9AwTwIYKSSKQ==
From: Yixun Lan <dlan@kernel.org>
Date: Mon, 18 May 2026 02:58:36 +0000
Subject: [PATCH 1/2] clk: spacemit: k3: fix USB2 bus clock
MIME-Version: 1.0
Message-Id: <20260518-06-clk-reset-usb-fix-v1-1-14fc235e692b@kernel.org>
References: <20260518-06-clk-reset-usb-fix-v1-0-14fc235e692b@kernel.org>
In-Reply-To: <20260518-06-clk-reset-usb-fix-v1-0-14fc235e692b@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>, Junzhong Pan <panjunzhong@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1380; i=dlan@kernel.org;
 h=from:subject:message-id; bh=glMTiY++tgALwLhBNGfpjYuRggBZLhInFSckW+5Ix54=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqCoBnvVc5VsIJY3iE7FPBru751ARzOjXHZta3g
 EHS7zkv1NWJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCagqAZxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0lRxAAjzNNR56QG+N0hHf62fCU46L0GxPSLvwT7VcYBb/LLr7AuTJYWBV4B
 pW6hC1Nv6mw8e2AMyV2awse1vGq2jsvN2HRpSFpg2S9c660o844B4pagh8sj5HZA0jKFKgGEufy
 s4O8t6I+604uJ8TN5FSjBZn42rlUS3bXE0zNGJIsqQENFp3eR7U+SwIOsJuyVnMMc5olaJ82/lq
 8UTO9fSxjNjwiV1PPAopa5/VbBmu468pybNPuRfFBCyDU0ZsvOKGmcGWV/+fvXMGk7j1Q5VeWrB
 SGVox32S/Qge6gI4OZBNp8YSK4+9wgi54jv1a4IJvUjwoTyUS2WNr4bjT9NblDQsLGiHBIRaIPt
 I4dEpjdAegU0GB/AEI+aWrqteb4VQ6BRB1PsOsu+8jG/SV6kgT35pMVsbmLq7boOgC6w2jT1OaV
 YEcCiCYR2Rf8O7TWA7EUTf3KT1luOTBSyLI8GF3qYNqNgltiWzOpmBw4Pv0VUY1BitciFVW29aa
 5N/h5MML++IuKZ/onDaIi4QvMVnxlXtqZMKksZ/zeTQmp8wHYiVYBMNw1zehTqmh9O2P67sIV6M
 nwYicZDGkj5fa/xBXdX7tZvOjjk+utWV53Qgc6XnQtRD+bUVTers1uBZd3e29abCv+EhfVblMAj
 80S8aio8BojPVrVeVpo+GM7HKsGqIE=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
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

According to SpacemiT K3's updated docs, the USB2 ahb reset and USB2 bus
clock enable bit was wrongly swapped, the correct one should be:

Register : APMU_USB_CLK_RES_CTRL
bit[1]   : usb2_port_bus_clk_en
bit[0]   : usb2_port_ahb_rstn

Fixes: e371a77255b8 ("clk: spacemit: k3: add the clock tree")
Reported-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 drivers/clk/spacemit/ccu-k3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/spacemit/ccu-k3.c b/drivers/clk/spacemit/ccu-k3.c
index e98afd59f05c..3d430f11d608 100644
--- a/drivers/clk/spacemit/ccu-k3.c
+++ b/drivers/clk/spacemit/ccu-k3.c
@@ -777,7 +777,7 @@ static const struct clk_parent_data sdh2_parents[] = {
 CCU_MUX_DIV_GATE_FC_DEFINE(sdh2_clk, sdh2_parents, APMU_SDH2_CLK_RES_CTRL, 8, 3,
 			   BIT(11), 5, 3, BIT(4), 0);
 
-CCU_GATE_DEFINE(usb2_bus_clk, CCU_PARENT_HW(axi_clk), APMU_USB_CLK_RES_CTRL, BIT(0), 0);
+CCU_GATE_DEFINE(usb2_bus_clk, CCU_PARENT_HW(axi_clk), APMU_USB_CLK_RES_CTRL, BIT(1), 0);
 CCU_GATE_DEFINE(usb3_porta_bus_clk, CCU_PARENT_HW(axi_clk), APMU_USB_CLK_RES_CTRL, BIT(4), 0);
 CCU_GATE_DEFINE(usb3_portb_bus_clk, CCU_PARENT_HW(axi_clk), APMU_USB_CLK_RES_CTRL, BIT(8), 0);
 CCU_GATE_DEFINE(usb3_portc_bus_clk, CCU_PARENT_HW(axi_clk), APMU_USB_CLK_RES_CTRL, BIT(12), 0);

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
