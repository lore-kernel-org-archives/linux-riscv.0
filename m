Return-Path: <SRS0=Qta6=KR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1346CC2B9F2
	for <linux-riscv@archiver.kernel.org>; Sat, 22 May 2021 09:16:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F8E96103E
	for <linux-riscv@archiver.kernel.org>; Sat, 22 May 2021 09:16:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F8E96103E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u2fr3gmsG66R4a/MzVHmGS6P5RBS+Oaq3vSl9nym1BQ=; b=QkZtqMC2WcNFSulrggn7IEpMau
	UABnKFaYJk/3Yuk2WJd1nQdaSyKpjUDcEn9j/feNs5oj2zqI9F8yjKqqXjvedHlJlU6Kir/C3X9oV
	kD/oCYRqbGYvSjyCwst/jJB9GIsvt66mpLQmcD6OoDHs9NldOmLQCxubDvFH3j6YguD3VPy+raLkx
	34izMrVbEJl8iGXorSNlkREsYW5rezQIO9Qi0+G9EFO96wtvijjuAoxBxy/jU0NEJ7hRrErd64dv4
	GCIrjBqudhMT8iQoXaulIGNeExs9LRsp+lzuUWADcjokHvmfx0K2cXe9poJav/Mm5vJHHyNGm0+0q
	D8JleHRg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lkNkA-002Bgv-JN; Sat, 22 May 2021 09:16:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lkNk6-002BgR-PZ
 for linux-riscv@desiato.infradead.org; Sat, 22 May 2021 09:16:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=ocIAhBgbP+PNKty+shUQ/xBwv4WxwbN40wWJrHy9LDE=; b=BGekh2NAzsWGYXWu+Q+l7bBngz
 Mxa8wiop8KM37A+FJQSNZbND5i0+ioU3Nl2na72YmtzREVyZMPEajrF95mC7vPAz9B4Rkj0Nu1rJg
 c3fxNh++TJq9wio/lXNrllbGwE9p3LSjMyI5wwstybqtMZNtgtyMiw2OfNDW8mcM4mnl1GNYvDnea
 rbOmT7iTRJyPNaioGRi52PetTjof5dT+lOIT+rZXx2hg8npKdpAEe527B2bbF/iWU1+3fiozHAF77
 6h16lIjAVW499JIx0eDUX24eo3V+uW3d6p4OFZqOrWRT/YRyFCpVbmdsQnInxBFQdeVpdZ/bmbWLG
 FHEJodaA==;
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lkNk2-0003mS-Vu
 for linux-riscv@lists.infradead.org; Sat, 22 May 2021 09:16:21 +0000
Received: by mail-pl1-x62e.google.com with SMTP id e15so5580145plh.1
 for <linux-riscv@lists.infradead.org>; Sat, 22 May 2021 02:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ocIAhBgbP+PNKty+shUQ/xBwv4WxwbN40wWJrHy9LDE=;
 b=H5IPHUVwsCv4PK07LQa0MFlmT/aE4HLOuzyADGUyy0rudXcLqXzGatgEgkhTxq0iEx
 LQwa078PXxu4cdbaepSXzxXHYI2d18vXDCC/fFTgDFbZmJM2k3Aa/Ui4Fbuo7KUbtrKB
 hmGI+FNCtf/n2xgdADvH6F3L0QTFijkC5wzqN146mbdbdxZOyf5tmwjBgbVOcjHzL9SW
 RPmLiBAX9pVvjxLKgmw5mnqa1mLotwFRVUYH2cXOZh4XKYYQrIx71YYDCaPBRnw+rbTu
 VM+icmERRTAtgYOpJ+dulojlQ/ftmxJAu7JANs/fN9ZOzJnZDq9RM/lTqPWkp8s4LINA
 b2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ocIAhBgbP+PNKty+shUQ/xBwv4WxwbN40wWJrHy9LDE=;
 b=o4Jt4kjHqpK/JgsKcWoMueVMde7s1vTcS+AC23uArlCnJcn40Zyh5Gsd3OiK6pl4Ld
 S3Bmk39VzAslN6S8lhVbiRU6tkAkmciG07ittGIiQxNhp//AAViCs2E5e7qT0t4mDL8k
 ZmsYApj7zADdmU28JqdcsUvus2adJOTwF14AMpDGS2ErBl98CwD/F7xAzY+AJ5k8OjMY
 8ZgQkO6Xg+7wvjMe6csLdcLtI+oZIBtp+q8cmKI+LfK2XHX2aP0eWq4a9n6VYP7N3nf/
 34JSEGFzweg7sVC8L3SXUZ8iigpx1ds8nhzDrPyWfb602oxEsSkABBqh/zw29AzZ7Zhx
 PxAg==
X-Gm-Message-State: AOAM533W2vTnLcy7tXX+BtUuNxjKRe4qlsMjLD/DuUmJzMNwpnKANu5g
 TQF9Gx+LUh01OFG21F7Ozr4krA==
X-Google-Smtp-Source: ABdhPJwBgPJcj3WjJ4rl8Aklh5GuighzrF2aOkUUN6iR5p/c0bE0+rouZom68Ho53Mip49r9lai9BQ==
X-Received: by 2002:a17:90a:2a89:: with SMTP id
 j9mr5925640pjd.141.1621674977901; 
 Sat, 22 May 2021 02:16:17 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (59-124-168-89.HINET-IP.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id pg5sm3647169pjb.28.2021.05.22.02.16.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 May 2021 02:16:17 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: nicolas.ferre@microchip.com, claudiu.beznea@microchip.com,
 davem@davemloft.net, kuba@kernel.org, f.fainelli@gmail.com,
 palmer@dabbelt.com, paul.walmsley@sifive.com, schwab@linux-m68k.org,
 sboyd@kernel.org, aou@eecs.berkeley.edu, mturquette@baylibre.com,
 geert@linux-m68k.org, yixun.lan@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v2] net: macb: ensure the device is available before accessing
 GEMGXL control registers
Date: Sat, 22 May 2021 17:16:11 +0800
Message-Id: <20210522091611.36920-1-zong.li@sifive.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210522_021619_054972_8B3A07AA 
X-CRM114-Status: UNSURE (   7.71  )
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

If runtime power menagement is enabled, the gigabit ethernet PLL would
be disabled after macb_probe(). During this period of time, the system
would hang up if we try to access GEMGXL control registers.

We can't put runtime_pm_get/runtime_pm_put/ there due to the issue of
sleep inside atomic section (7fa2955ff70ce453 ("sh_eth: Fix sleeping
function called from invalid context"). Add netif_running checking to
ensure the device is available before accessing GEMGXL device.

Changed in v2:
 - Use netif_running instead of its own flag

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 drivers/net/ethernet/cadence/macb_main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 6bc7d41d519b..a0c7b1167dbb 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -2867,6 +2867,9 @@ static struct net_device_stats *gem_get_stats(struct macb *bp)
 	struct gem_stats *hwstat = &bp->hw_stats.gem;
 	struct net_device_stats *nstat = &bp->dev->stats;
 
+	if (!netif_running(bp->dev))
+		return nstat;
+
 	gem_update_stats(bp);
 
 	nstat->rx_errors = (hwstat->rx_frame_check_sequence_errors +
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
