Return-Path: <SRS0=tUGE=J2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBE4AC433ED
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 10:26:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7912F613C1
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 10:26:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7912F613C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y6dAlhKs2fmJptJXhB4OeWcnsZT5afKnevJWxjrAX9c=; b=BHm8jMoT7wnUVJpetXYWKRwTzd
	NM+U3qw72XYHKVq6qLwOi9PRM5sDWDhp9cQ79xcvF6WDgtl3DVXhHSXQ+VSS0k8gCkPXL9+8F72Tc
	az6ycs98/GMZ+/11ecG0ByuaVxAN4Z3c94EMU2gEbE1Sa8I0clYr+OsFbgksn7o/VboeuqpmlxRcP
	7hZqTNY+tf3dlECHsn2NNpcGtWJyW7cjClNTZ5ngihs0mXYstEuJa5NlZV5KpXCC3sxXktkZa2udj
	dcHfjZ4sxhNPaxnwNzlvWt8o4BXmUkarUQuSn477UqBvKG/K8e6aR2DvamqFZ8XdAUVf72zv9HUZx
	HxnZwiAw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc3rz-005Ua8-BB; Thu, 29 Apr 2021 10:26:07 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc3rw-005UZn-VQ
 for linux-riscv@desiato.infradead.org; Thu, 29 Apr 2021 10:26:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=jdvyiwfxk6EhWWBBvXgI59VcLf6U+A7h1FH/Y/4CYVI=; b=V+lNrJZSjHNQX/mYQpzSnbVOCX
 eGa9m1hrviDFxSk/J7Pi68dt/LkVpXR5ljMZBBg8dfYXSRK25+Dse5ScqRNtPzDQRWcpYxojPQeIl
 DbPAlI0O9QjC9gKsII88iBtZp0R0hHCk4T1lIrHEyaEBhEk1ObTk5NF+3s1vpTntUiGM8DzcY20WR
 mBEesqnq2T600c6DirHs4yWFxX4Dui9nSOf91Sw7du8MMcFEyydJoP7z1kGeqsidtaSRWrI97S4Z/
 LS5gkli7srhcAFzUXZSSMe9TANjAfKPQbtydY7FPDvbIsrcqLILRyUefkN69OXv56Vwt/lRr1PDUj
 mAs2TtIw==;
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc3ru-000YaK-8d
 for linux-riscv@lists.infradead.org; Thu, 29 Apr 2021 10:26:03 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04426;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=11; SR=0;
 TI=SMTPD_---0UX9cCYY_1619691948; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0UX9cCYY_1619691948) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 29 Apr 2021 18:25:58 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: nicolas.ferre@microchip.com
Cc: claudiu.beznea@microchip.com, davem@davemloft.net, kuba@kernel.org,
 linux@armlinux.org.uk, palmer@dabbelt.com, paul.walmsley@sifive.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] net: macb: Remove redundant assignment to queue
Date: Thu, 29 Apr 2021 18:25:46 +0800
Message-Id: <1619691946-90305-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_032602_490535_CE14D93D 
X-CRM114-Status: UNSURE (   9.37  )
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

Variable queue is set to bp->queues but these values is not used as it
is overwritten later on, hence redundant assignment  can be removed.

Cleans up the following clang-analyzer warning:

drivers/net/ethernet/cadence/macb_main.c:4919:21: warning: Value stored
to 'queue' during its initialization is never read
[clang-analyzer-deadcode.DeadStores].

drivers/net/ethernet/cadence/macb_main.c:4832:21: warning: Value stored
to 'queue' during its initialization is never read
[clang-analyzer-deadcode.DeadStores].

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/net/ethernet/cadence/macb_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 0f6a6cb..5693850 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -4829,7 +4829,7 @@ static int __maybe_unused macb_suspend(struct device *dev)
 {
 	struct net_device *netdev = dev_get_drvdata(dev);
 	struct macb *bp = netdev_priv(netdev);
-	struct macb_queue *queue = bp->queues;
+	struct macb_queue *queue;
 	unsigned long flags;
 	unsigned int q;
 	int err;
@@ -4916,7 +4916,7 @@ static int __maybe_unused macb_resume(struct device *dev)
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
