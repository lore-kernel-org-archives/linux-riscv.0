Return-Path: <SRS0=fWiV=JZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F907C433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Apr 2021 10:03:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D97B4613E8
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Apr 2021 10:03:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D97B4613E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y0UG0ID7zxDTiCTlYnxN1JjqbXwgET9YH7kcV63HJqc=; b=GciYDSwCJx+UsQheIPw6h69lhq
	QEl9DvZ6RWy0sBsUGaD91zW9+ghsQ6WlfR0IClDsuNlBdLw5CSJ6muWL6rIE//CImS8ZoXxXTDoE2
	xHl31L9W8cuK2YZckObgrIgdYjOLRxml3/RSkqjscf2lDKPtiKd/iAc0GFcg5v029pmacuz6pw1+5
	p6f/C5QTgxgk5kMQ/LKOPpbJPGWIXS0m0POcJjCexbrSVFNI19feEQe1S6VUyuL9k8gH3RB6rK7yt
	Dmpjxx8jPhdAq/UR7I5DsuKe9v6+NrEwr+9ogQGviFRYyRDDPfWUy45AHNgR2qUnO2orsw/cMVsy4
	DlIyfrrg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbh2g-003FVT-H2; Wed, 28 Apr 2021 10:03:38 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbh2T-003FTX-5N
 for linux-riscv@desiato.infradead.org; Wed, 28 Apr 2021 10:03:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=Sf+uH/reXLHXtW/ByGBfxRmnUbTtgxP0NxTLEKo+YZM=; b=4U6S7wmVSTeNvEqOzFvQQEizcp
 4pQHnmoQHjui3z3vlnBOyGOLU11q2bjmGHmAj4qr2OX10Mf/eM/RGc/oGrt+/8yGakUckKnnhEah3
 5wWbt5qvWc6M1i3ctXIZG7rCraSoK4sYq/kdHYHQRcyKKwFOV7VdbLClzrio8sX4UEKcUnQWEQrL1
 Qt00EV7ZAk9Ydf8MNWnBngvKsJoNWZsWI1t1JUpz/LO8+v64diGfrvx+ClGFq7KtolLquezy1AfQt
 s9kRCwPg42Q8mFG3QD6LPPyRnHcmiIHh6X0Y1WUKcgnZsQDIVsEqjgRb1/O9iKR+VLqALYVoI0/DU
 BYjrQVkA==;
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbh2Q-00HLDw-Hm
 for linux-riscv@lists.infradead.org; Wed, 28 Apr 2021 10:03:23 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=11; SR=0;
 TI=SMTPD_---0UX3II3M_1619604189; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0UX3II3M_1619604189) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 28 Apr 2021 18:03:16 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: nicolas.ferre@microchip.com
Cc: claudiu.beznea@microchip.com, davem@davemloft.net, kuba@kernel.org,
 linux@armlinux.org.uk, palmer@dabbelt.com, paul.walmsley@sifive.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] net: macb: Remove redundant assignment to w0 and queue
Date: Wed, 28 Apr 2021 18:03:08 +0800
Message-Id: <1619604188-120341-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_030322_771047_D066D606 
X-CRM114-Status: UNSURE (   9.53  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Variable w0 and queue is set to zero and bp->queues but these
values is not used as it is overwritten later on, hence
redundant assignment  can be removed.

Cleans up the following clang-analyzer warning:

drivers/net/ethernet/cadence/macb_main.c:4919:21: warning: Value stored
to 'queue' during its initialization is never read
[clang-analyzer-deadcode.DeadStores].

drivers/net/ethernet/cadence/macb_main.c:4832:21: warning: Value stored
to 'queue' during its initialization is never read
[clang-analyzer-deadcode.DeadStores].

drivers/net/ethernet/cadence/macb_main.c:3265:3: warning: Value stored
to 'w0' is never read [clang-analyzer-deadcode.DeadStores].

drivers/net/ethernet/cadence/macb_main.c:3251:3: warning: Value stored
to 'w0' is never read [clang-analyzer-deadcode.DeadStores].

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/net/ethernet/cadence/macb_main.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 0f6a6cb..5f1dbc2 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -3248,7 +3248,6 @@ static void gem_prog_cmp_regs(struct macb *bp, struct ethtool_rx_flow_spec *fs)
 	/* ignore field if any masking set */
 	if (tp4sp_m->ip4src == 0xFFFFFFFF) {
 		/* 1st compare reg - IP source address */
-		w0 = 0;
 		w1 = 0;
 		w0 = tp4sp_v->ip4src;
 		w1 = GEM_BFINS(T2DISMSK, 1, w1); /* 32-bit compare */
@@ -3262,7 +3261,6 @@ static void gem_prog_cmp_regs(struct macb *bp, struct ethtool_rx_flow_spec *fs)
 	/* ignore field if any masking set */
 	if (tp4sp_m->ip4dst == 0xFFFFFFFF) {
 		/* 2nd compare reg - IP destination address */
-		w0 = 0;
 		w1 = 0;
 		w0 = tp4sp_v->ip4dst;
 		w1 = GEM_BFINS(T2DISMSK, 1, w1); /* 32-bit compare */
@@ -4829,7 +4827,7 @@ static int __maybe_unused macb_suspend(struct device *dev)
 {
 	struct net_device *netdev = dev_get_drvdata(dev);
 	struct macb *bp = netdev_priv(netdev);
-	struct macb_queue *queue = bp->queues;
+	struct macb_queue *queue;
 	unsigned long flags;
 	unsigned int q;
 	int err;
@@ -4916,7 +4914,7 @@ static int __maybe_unused macb_resume(struct device *dev)
 {
 	struct net_device *netdev = dev_get_drvdata(dev);
 	struct macb *bp = netdev_priv(netdev);
-	struct macb_queue *queue = bp->queues;
+	struct macb_queue *queue;
 	unsigned long flags;
 	unsigned int q;
 	int err;
-- 
1.8.3.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
