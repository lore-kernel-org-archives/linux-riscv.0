Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCFC0C54ED1
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 15:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pcPGoGaHcEnG41rUcQ+Gd4YeCEc2f+rLexVg2qilmyc=; b=MYz6EphUMmEgpa
	fd/Mv0zKwHUO1UuPNoBvfrmEn7Zs1XNvfpUv3ese0INoZe731uklQn4ZrD8cWGg82VZAX1GC7cJFP
	STEahWeGPNFrkU/d9EZfLETM0ucvyLQFrbl9k055NzDrrrjCy8DZsuty6zz46BI7qjwynIr+kv8W2
	MyhUefFpwno5Js6kMrQfgjHDn62ra9iP3LK6jLRHNnew0zl7LoTyQy8XeutWY8pO9WdKUP1U/rS1g
	T9/EwxB4VuOWXXgkZH5t55IOuz12PxjhxMJGsb7yVWBYyWxnGhxnEkNNlBacboWkLvqNFsmbKJPfx
	nWrqL9KDu8fb//rZk6fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIU1s-00000004CHD-07BK;
	Fri, 23 May 2025 15:09:48 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uITgG-000000048WT-43wF
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 14:47:30 +0000
Received: from [127.0.0.1] (unknown [116.232.18.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 77F9B343270;
	Fri, 23 May 2025 14:47:23 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Fri, 23 May 2025 22:46:32 +0800
Subject: [PATCH 2/2] mmc: sdhci-of-k1: disable HW busy detection
MIME-Version: 1.0
Message-Id: <20250523-21-k1-sdhci-v1-2-9f293116a7e7@gentoo.org>
References: <20250523-21-k1-sdhci-v1-0-9f293116a7e7@gentoo.org>
In-Reply-To: <20250523-21-k1-sdhci-v1-0-9f293116a7e7@gentoo.org>
To: Adrian Hunter <adrian.hunter@intel.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1167; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=ci51TN0zWIkUuCtREvFuALW7XcksRaibdd6IoD9Sm2g=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBoMIpyusZ8D6qbB+Gs/i5nVYuZsa0KAy+jE6sr9
 4Jzp4cyFhWJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCaDCKcl8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277agdD/9arIG33iPsRPT10E
 r3siK0Jzx331n/x1wWBEQpcPdFVnkYdMUh5FMmG0XN4zXPFjii2T82PJDM4F8i/thQ2dex9mPrV
 puQPBg0tEVJs4UABj4N4KSuA9bmCEH76BB44+XSMvBrWejUmQfP+DN5wrDWihXJL0RPL+z7ziT5
 XGGj2FIrCPoWnLvrF1WwD4EUbJtxgrROXKB3qW8AFUMYHSwjOzvec795itMAI1XrlFXT35HSsEm
 U64F4k2OpbL3qnfgSdkhs/qakKo8WImxyLNwuE9TkRaAo73DSOhiZ8ZYUh4y/aY+ci0uORQSvSd
 xWTYf0CsymAI/eDKAWMTdTjeXCkBxgbfteujZbpcbAa7l9PJd5cC4RFQUixKfC5YgQCY0r4aktD
 n4uV1ZTqiQEbaACGgrqaNK5EoP+MxvbbEN8PwZ1yccSsljkMpDs5xzN7f3kBZE/bAAvz/W6fb/x
 afcWfLOu+o/2Lo+vk/qqAmCIOnkpSx0ACcm9apH/G9Xfzc0fvQ9m8U+0r8d4zl7iXZj+nLSxdWY
 vBZRfdDEGtvwC+C0ByqWKPEMHr7HV2EiTPwS7Tdvdki6Je1SZNaD2DjPHDcUJd716dbOjtt5LaY
 xNup/HkQEje5HbDRzK2fojE9p80l9ao32RWPw1RGPxrU/zf0xaiOPe3bGin4BDA6YZSg==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_074729_040003_A3DFEB64 
X-CRM114-Status: UNSURE (   7.92  )
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

It doesn't make sense to enable HW busy detection in pre_select_hs400(),
while disable it later in post_select_hs400(). And the reason behind this
isn't clear. Therefore, let's disable it for now.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 drivers/mmc/host/sdhci-of-k1.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index 1e1e012cdff9143a7dffa4e00bd9baac2a2dff2d..89f37f147a8a12cc80978d637cd31b9ecc0e9eac 100644
--- a/drivers/mmc/host/sdhci-of-k1.c
+++ b/drivers/mmc/host/sdhci-of-k1.c
@@ -178,7 +178,6 @@ static int spacemit_sdhci_pre_select_hs400(struct mmc_host *mmc)
 	struct sdhci_host *host = mmc_priv(mmc);
 
 	spacemit_sdhci_setbits(host, SDHC_MMC_HS400, SPACEMIT_SDHC_MMC_CTRL_REG);
-	host->mmc->caps |= MMC_CAP_WAIT_WHILE_BUSY;
 
 	return 0;
 }
@@ -188,7 +187,6 @@ static void spacemit_sdhci_post_select_hs400(struct mmc_host *mmc)
 	struct sdhci_host *host = mmc_priv(mmc);
 
 	spacemit_sdhci_phy_dll_init(host);
-	host->mmc->caps &= ~MMC_CAP_WAIT_WHILE_BUSY;
 }
 
 static void spacemit_sdhci_pre_hs400_to_hs200(struct mmc_host *mmc)

-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
