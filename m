Return-Path: <SRS0=tUGE=J2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB1CC433B4
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 10:27:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B84961453
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 10:27:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B84961453
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0cnOZA0jKYtHho5D2KlS4tgFso3zWjY3Ooh1p+ul3Go=; b=ZWkHmoOa4HBmPwBemQ0jO0Exyz
	8urSextLs27Ofdv8gs9Kmmmqc+L4Vvv2G5e4SF4gtGWa+EBdy8fEsPK+UwbzpXpJykkev/jB5CygQ
	NBIOSlarWT5s5IFp73tqpIhZZZFhdEkSeqsjRYypQMELj4J02z1Bdh4d3ZlD0A8VcgVqYG3cuqzkx
	trAbNkvP+1026wUzp2EW0J3YQVWr+8R3/kcDVDzlvxABx1285QcmSnNgBHdOflrm2uoC+OmXLXWfV
	Im6yvxKv1rq+LbuZdZE6jVIU+wmapeHX6pQ5AXKHbQlV24jU0+RWMcQGH7O51yRC/dDS6VxacXbsx
	I4uAuRoQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc3sc-005Ucz-Ia; Thu, 29 Apr 2021 10:26:46 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc3sa-005Ucq-Lk
 for linux-riscv@desiato.infradead.org; Thu, 29 Apr 2021 10:26:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=7ASz8akXgHSdBZgkf2rOLE3pIgd6yz/gB89jK+XW3d0=; b=ALw3Avo8AGSM7INHwNbB1lqt23
 S7mT9+JxFRtq6sMgwDaOdtQVzfkbrnAV1SXuABS/qWatO+8vOCmVUkv2el+JLKL4Y8PnvWRTUBfWK
 Cmqz83ql2sJl6RFJmZP9lz3wE1UVBkIjmhDOYgIw18mtsaDMMJo6BJfzFlsw7i0j5/Bi/mUA7oHxI
 7YATzVPn+4vOn0/cItYyAqNyoAzOAqvsgfAOnRb/6L5p/cVLtscZyJftrqe6SYOPlJDRK8CCERNpT
 NO3Jx8MnlDj58uyxI4n4+CWLgzG8e8dRQNGAzycfgGNlZiwGKASBOatWPk6cLN9HlULP63goa/vwC
 7sk9osxw==;
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc3sX-000Yba-T6
 for linux-riscv@lists.infradead.org; Thu, 29 Apr 2021 10:26:43 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=11; SR=0;
 TI=SMTPD_---0UX9cCg3_1619691984; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0UX9cCg3_1619691984) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 29 Apr 2021 18:26:37 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: nicolas.ferre@microchip.com
Cc: claudiu.beznea@microchip.com, davem@davemloft.net, kuba@kernel.org,
 linux@armlinux.org.uk, palmer@dabbelt.com, paul.walmsley@sifive.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] net: macb: Remove redundant assignment to w0
Date: Thu, 29 Apr 2021 18:26:22 +0800
Message-Id: <1619691982-90657-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_032642_137239_825BEC53 
X-CRM114-Status: UNSURE (   8.00  )
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

Variable w0 is set to zero but these values is not used as it is
overwritten later on, hence redundant assignment can be removed.

Cleans up the following clang-analyzer warning:

drivers/net/ethernet/cadence/macb_main.c:3265:3: warning: Value stored
to 'w0' is never read [clang-analyzer-deadcode.DeadStores].

drivers/net/ethernet/cadence/macb_main.c:3251:3: warning: Value stored
to 'w0' is never read [clang-analyzer-deadcode.DeadStores].

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/net/ethernet/cadence/macb_main.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 0f6a6cb..741b2e3 100644
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
-- 
1.8.3.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
