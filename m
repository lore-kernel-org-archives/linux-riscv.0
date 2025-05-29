Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D466C5B552
	for <linux-riscv@archiver.kernel.org>; Thu, 29 May 2025 13:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ql2unu0sXKNX5Y6H18yvCVg0WpHzMx01kJATOxXzZs0=; b=zmiVjwT4kSIZcA
	d5vFU8XBL4/7i6S/WWqoaMvacEEicIOrx9r/QnoTsEZf/xbGK16wEnxn8PX37eEEDajmw3CkkMpAO
	SmdT0trv+x4jyhuuFguWaymWUhbh1w0hzA4x+ZcLF6WUPL+G4Z+HyN8KMGmC6xniDC5Hm8WtHs0vD
	Bnq5ptX+QaqKRSZobiC+Oej6n3PrEaeP/5uly7jIfSEvv2jgnifQsDDiK0cWWq4jU6Izw94oJ90md
	NU0rHFqPcEo3uZOQt6sJGvNa+XGwH9Wc1O2NjiqtKKksfdmu3ix1lZ8qfw5gj6G3RPqCz9EIQrQWA
	sSNsLgvtIvpxFFR60DhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKdPR-0000000Frng-060w;
	Thu, 29 May 2025 13:35:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKcsE-0000000FoJZ-3HD2
	for linux-riscv@bombadil.infradead.org;
	Thu, 29 May 2025 13:00:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=B9FZFM/LbM/WG4dVN1ywu8DCI56BaOkRgJQCty2OaRA=; b=naY2luxG7Ow1f46/owtmr0v/LT
	MzfPHVLTgIlphtP8Hc14MexJtqxuDRvyiXC1Xcicvdgzpg7Yzm7+CwOC/EOq3CB+SjtE+0TtjRbEc
	dEfzhIHXbKKWCBmBol2mpnp4GypeL7mv1hwYmlXI8n4Fha7dJNvEgAfsHH9CPvTaCbl0J/i/WIvMd
	tRUH7Wut627brVqzd9pBJYTOAQfzMG5CK70qAGTy7Ds+XkCtAw0xu2zkDNZQBvUAodAw1dP9A+HK4
	GxXHjf8VD4H2ah+bnBgNNFxW9Xx+uOv9d54vKTFVniEEaiQKtA+jluaS5GVCVqFyXQVm7zpmH56w0
	DnuDut6w==;
Received: from mail.loongson.cn ([114.242.206.163])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKcsB-000000007ms-1log
	for linux-riscv@lists.infradead.org;
	Thu, 29 May 2025 13:00:41 +0000
Received: from loongson.cn (unknown [223.64.69.3])
	by gateway (Coremail) with SMTP id _____8BxXWt1Wjho2CsCAQ--.21759S3;
	Thu, 29 May 2025 21:00:37 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.3])
	by front1 (Coremail) with SMTP id qMiowMBxLsduWjhovLP6AA--.61125S4;
	Thu, 29 May 2025 21:00:36 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	linux-mmc@vger.kernel.org,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Yixun Lan <dlan@gentoo.org>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH v2 22/35] mmc: sdhci-of-k1: Drop the use of sdhci_pltfm_free()
Date: Thu, 29 May 2025 21:00:18 +0800
Message-ID: <84cc84004d0bdbb2ee1c68dbea4b23eeefe8845b.1748515612.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1748515612.git.zhoubinbin@loongson.cn>
References: <cover.1748515612.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
X-CM-TRANSID: qMiowMBxLsduWjhovLP6AA--.61125S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoWrur45KrWrCF4fJF13Aw4xuFX_yoW3JFgEka
	45Wws7WFyrCrWvv34xt3WSyr97KFnagF1kuF4rKw4a9ry8Zrn5Ga47Zr1DX3yUuFW0kFW5
	CayUGw4xZrWjkosvyTuYvTs0mTUanT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbkxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVW8Xw0E
	3s1lYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JM4x0Y40E4IxF1VCIxcxG6Fyj6r4UJwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY
	0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c
	02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_
	GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWDJVCq3wCI42IY6xIIjxv20xvEc7
	CjxVAFwI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAF
	wI0_Gr1j6F4UJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43
	ZEXa7IUYyMKtUUUUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_140040_108424_66A9361A 
X-CRM114-Status: UNSURE (   7.78  )
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

Since the devm_mmc_alloc_host() helper is already in use,
sdhci_pltfm_free() is no longer needed.

Cc: Yixun Lan <dlan@gentoo.org>
Cc: linux-riscv@lists.infradead.org
Cc: spacemit@lists.linux.dev
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/mmc/host/sdhci-of-k1.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index 6880d3e9ab62..026dc79af292 100644
--- a/drivers/mmc/host/sdhci-of-k1.c
+++ b/drivers/mmc/host/sdhci-of-k1.c
@@ -286,7 +286,6 @@ static int spacemit_sdhci_probe(struct platform_device *pdev)
 	return 0;
 
 err_pltfm:
-	sdhci_pltfm_free(pdev);
 	return ret;
 }
 
-- 
2.47.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
