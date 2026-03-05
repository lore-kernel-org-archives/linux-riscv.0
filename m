Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB3AEEF30F
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 07:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Rx329zL7x4s5xc12R7o3Ewy5fVnQQwl7jTPtZ3iZvEE=; b=uZShQJ3WaunPyY
	1C3ajUDlX9bJhS6sbuJzHJxOP7Rp4pDuUDWP5HEXhUZPLltO5jM/PJEd6Cqlw7sNS63/K9Pm7Z/c9
	LYmqlg87b6mTUvQKolRBNbtx4VvfjTOFSxmoIbUl6oomidV/VUxaxZWTp8wngsS+1JyqoC8/k/Zjc
	Rhr0vc7Epf120Svl0dA4IkEfxsomT7pWquYpSVmDxBl9J++wT9UiCWSjld1O+QYZc4pYAARdSqnl4
	AMuav6MtidiL3lmcRJlvzJ/i7PKYAxyuiWjpS4hfPNP03r0vWSAFFGA4xxLxyKuDMZD9ic9I03p2x
	D6okANOQcHMn6KQv64rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy2hP-000000013U3-08xs;
	Thu, 05 Mar 2026 07:00:43 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy2hM-000000013Ta-0gFw
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 07:00:41 +0000
Received: from [127.0.0.2] (unknown [210.73.43.101])
	by APP-05 (Coremail) with SMTP id zQCowAAXrA8RKqlpDu+uCQ--.18491S2;
	Thu, 05 Mar 2026 15:00:34 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Thu, 05 Mar 2026 15:00:29 +0800
Subject: [PATCH net-next] net: spacemit: Remove unused buff_addr fields
MIME-Version: 1.0
Message-Id: <20260305-k1-ethernet-cleanup-buff_addr-v1-1-e978ef119231@iscas.ac.cn>
X-B4-Tracking: v=1; b=H4sIAAwqqWkC/y2N2w6CMBBEf4Xss2sKIhh+xaApZZBGLbgthITw7
 9bL4+TMnFnJQyw8VclKgtl6O7gY0l1CptfuBrZtzJSprFAHdeR7ygg9xCGweUC7aeRm6rqrblt
 hXeb5qUAsoqDoGAWdXb7+M30mDkug+kcErykehj9utAeb4fm0oUrmcq9YTHpZN6q37Q2b0W8Nq
 AAAAA==
X-Change-ID: 20260305-k1-ethernet-cleanup-buff_addr-a74486e305e6
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Yixun Lan <dlan@kernel.org>
Cc: netdev@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Vivian Wang <wangruikang@iscas.ac.cn>
X-Mailer: b4 0.14.3
X-CM-TRANSID: zQCowAAXrA8RKqlpDu+uCQ--.18491S2
X-Coremail-Antispam: 1UD129KBjvJXoW7GF1fZrW5GFyUGF4rCw1kuFg_yoW8JrWfp3
	yDZas2grW3JF4YgwsrZw4xZw45Ca4rtryrua4ayw4Fvwn0y3WjgF95tF43Gr45ArWxGFWS
	vrWUAw4rAF1kArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9E14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r4xMxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUj_b15UUUUU==
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_230040_572921_CA66BB8F 
X-CRM114-Status: UNSURE (   6.85  )
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

These were never used. Just remove them.

No functional change intended.

Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
Cleanup patch split out from:

  https://lore.kernel.org/r/20260303-k1-ethernet-more-fixes-v1-1-0ab0122fdd14@iscas.ac.cn/
---
 drivers/net/ethernet/spacemit/k1_emac.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/ethernet/spacemit/k1_emac.c b/drivers/net/ethernet/spacemit/k1_emac.c
index 338a2637b1da..af58eae6fcd8 100644
--- a/drivers/net/ethernet/spacemit/k1_emac.c
+++ b/drivers/net/ethernet/spacemit/k1_emac.c
@@ -57,7 +57,6 @@
 
 struct desc_buf {
 	u64 dma_addr;
-	void *buff_addr;
 	u16 dma_len;
 	u8 map_as_page;
 };
@@ -70,7 +69,6 @@ struct emac_tx_desc_buffer {
 struct emac_rx_desc_buffer {
 	struct sk_buff *skb;
 	u64 dma_addr;
-	void *buff_addr;
 	u16 dma_len;
 	u8 map_as_page;
 };
@@ -340,7 +338,6 @@ static void emac_free_tx_buf(struct emac_priv *priv, int i)
 
 		buf->dma_addr = 0;
 		buf->map_as_page = false;
-		buf->buff_addr = NULL;
 	}
 
 	if (tx_buf->skb) {

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260305-k1-ethernet-cleanup-buff_addr-a74486e305e6

Best regards,
-- 
Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
