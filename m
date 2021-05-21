Return-Path: <SRS0=oP9+=KQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 182CCC433B4
	for <linux-riscv@archiver.kernel.org>; Fri, 21 May 2021 12:49:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89B92613D8
	for <linux-riscv@archiver.kernel.org>; Fri, 21 May 2021 12:49:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89B92613D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yqUxpZau9gFWHiCREeT4h71QSWQGFQ8MDzggpwlGrkU=; b=LJSOObJeAzQVAxnko7SBTFlyNs
	KDMQMdl2q0FZxzJcXEK04aFYOv2lBJynccml3QpUOHz3ORl7mPZngE7Nxy1HyPHXPV+x7LoXmDUls
	tzlVh88dcmGI+gkDi2a2iKM36OpoZhsWr2OXLnr2r4rkEfjJn59VtFFCseZ1vBA2PAjl/Eg/rusBE
	8JXRINCBzRBn4SESE41yWXn7iwwjXUiZp6Qxdbi4o5Fa8yLmaWrpTHh3lF1Z3eKUhFRfhCdW+nuSU
	QC/TEb/98mBLdu6uRRIdoZV97/7rvy6Z3m5wsyflbPIQy8RW4BGf1gb4Z8FhyuZ1YOnleLLcxudgb
	uCWt7j8Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lk4aY-005Mwr-4A; Fri, 21 May 2021 12:49:14 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lk4aU-005Mwa-RG
 for linux-riscv@desiato.infradead.org; Fri, 21 May 2021 12:49:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=pGuPc/FWKOVvjhaHRN43mHg/w+5OJaPMhcuzSdmouas=; b=gLJqzNP+apt2VV84yNWd8X47Nu
 xjVk1SmdLe2MgwROveGjO0ZMB9AJ5rOAkJ3sEEC/oR9dJjka+bYikACf6N9XroaYMNwCCMm5WB9HA
 Idf7EhpCipAjuGVOForjDL3OX1qjPlS2zu8D3yJhub5nhaF4sHgG9mBvxgszF3tRSA+Fa1ZtcuDnj
 JVi2nX++9Y0eM61kqvE70phsrVOLAUEEURZME8VLdiGhR8jcAd5uZgj+WYPLZX3oKVzM2BHREaz/p
 Sc5Pi/cptXj9JZsxI0Pvc3yHKHVTfPxsgdT8SdbvImAzuVgKaMF7k0MM9zxWQBxTvKAnisM1T/Qsv
 oPGp9YLg==;
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lk4aS-00H6gt-86
 for linux-riscv@lists.infradead.org; Fri, 21 May 2021 12:49:09 +0000
Received: by mail-pg1-x536.google.com with SMTP id i5so14170968pgm.0
 for <linux-riscv@lists.infradead.org>; Fri, 21 May 2021 05:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pGuPc/FWKOVvjhaHRN43mHg/w+5OJaPMhcuzSdmouas=;
 b=SsyTMFiRSBaxbEGOPNJk2PsZEN+4hTeX/8abTCA5DUXF83GqcbK4L3mi2tLPQj9Ep0
 8DJYTXH9XZC5Vp+ZWOASmVWucLMA9lLwn9jpYZhfS6LawydoUt8UUoHcpIPdXbicVgxH
 VIXprSTWEfwWNINvuSYOPa/Zw0vOS4aGrZizqs8TZEHV2CBobhxoyif/muGrupWz2+Wo
 HBDNKFTaRf1Gpa3WomeNKwqgwdQkpRQq5cR9bxtX4ZSRLubqhiG9zMWxCCEiCWVBeajQ
 KqxYjAMCBCJnTTxsqPAACqw1zv4yHPqeJnPJpaXGxv9IIHS1tw/zqchHq1kYFKXsklPk
 T/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pGuPc/FWKOVvjhaHRN43mHg/w+5OJaPMhcuzSdmouas=;
 b=oX7ymTr/xqZWDMzCfZScjTcCmaICqIZH9UMGlEH8J/IxD4FCZd7YhfV/XMfBpMDMsO
 fn3ThwfHPUaffBvVe2svVdJIfQ0B9nqy5s3abGTVXFmRxpTbEzCc+UUh69UK0mmcPpGq
 RDWBK5eeMLtAWN5WEfCWFFskfTo03jkvVIER4nR7oO3aiLhcJP9koOxWl2GyIf0CK1Hf
 F3BnbXZKNcAGF1LkyXzkfWwfjMa0HuEIgYbukbytBkZ2NZkXB/V4HVAa1p1tX15ZcdSe
 s+2SWSNoBgtqsZwCb45+O/QNcaH2DkqQOI/bkBFDZ3bJqiqLOSG4v29UdmaENp7QKvCU
 JAdA==
X-Gm-Message-State: AOAM532yuBXkVpWeugY5QeI+oOddAe3FZyz8xhcYH5eQkkXcZWoI/7CL
 nvO86KE7oLvHgHM11p2KWs2b2g==
X-Google-Smtp-Source: ABdhPJx4ca0fPgEFRiDgD2lJUNF0Ana9vfd7DuRLBFrZ5qcbxuD40fXoDaL43ZLv/B0Q7cEo2irrPw==
X-Received: by 2002:a62:bd14:0:b029:2de:8bf7:2df8 with SMTP id
 a20-20020a62bd140000b02902de8bf72df8mr10185713pff.60.1621601346960; 
 Fri, 21 May 2021 05:49:06 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (59-124-168-89.HINET-IP.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id d10sm4271419pfo.65.2021.05.21.05.49.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 05:49:06 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: nicolas.ferre@microchip.com, claudiu.beznea@microchip.com,
 davem@davemloft.net, kuba@kernel.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, schwab@linux-m68k.org, sboyd@kernel.org,
 aou@eecs.berkeley.edu, mturquette@baylibre.com, geert@linux-m68k.org,
 yixun.lan@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH] net: macb: ensure the device is available before accessing
 GEMGXL control registers
Date: Fri, 21 May 2021 20:48:59 +0800
Message-Id: <20210521124859.101012-1-zong.li@sifive.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_054908_312332_73B43B7D 
X-CRM114-Status: GOOD (  10.10  )
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
function called from invalid context"). Add the similar flag to ensure
the device is available before accessing GEMGXL device.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 drivers/net/ethernet/cadence/macb.h      | 2 ++
 drivers/net/ethernet/cadence/macb_main.c | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet/cadence/macb.h
index d8d87213697c..acf5242ce715 100644
--- a/drivers/net/ethernet/cadence/macb.h
+++ b/drivers/net/ethernet/cadence/macb.h
@@ -1309,6 +1309,8 @@ struct macb {
 
 	u32	rx_intr_mask;
 
+	unsigned int is_opened;
+
 	struct macb_pm_data pm_data;
 	const struct macb_usrio_config *usrio;
 };
diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 6bc7d41d519b..e079ed10ad91 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -2781,6 +2781,8 @@ static int macb_open(struct net_device *dev)
 	if (bp->ptp_info)
 		bp->ptp_info->ptp_init(dev);
 
+	bp->is_opened = 1;
+
 	return 0;
 
 reset_hw:
@@ -2818,6 +2820,8 @@ static int macb_close(struct net_device *dev)
 	if (bp->ptp_info)
 		bp->ptp_info->ptp_remove(dev);
 
+	bp->is_opened = 0;
+
 	pm_runtime_put(&bp->pdev->dev);
 
 	return 0;
@@ -2867,6 +2871,9 @@ static struct net_device_stats *gem_get_stats(struct macb *bp)
 	struct gem_stats *hwstat = &bp->hw_stats.gem;
 	struct net_device_stats *nstat = &bp->dev->stats;
 
+	if (!bp->is_opened)
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
