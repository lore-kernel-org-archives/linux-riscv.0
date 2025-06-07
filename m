Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E2E2C5B543
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Jun 2025 07:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GNlYgcZsJ894nhZXnqfAyTgTp8W0GJ+bzvnsorK6wuU=; b=Z9NAFUFEpN+c5g
	A+55+6B/iCWsWb/fnX/K5E0WFGkwM2uWiHmQ7KFTH+pTSbThfwDFz4/2it0k7eVCaY0TsBgql5jMY
	PNQa7uaazETsEf/N7D01qA/KQL8+SrpVZAiNeNHEBG4iiPvdycAYRO9Dh2PeYqCYFxWaA8CIEPYok
	njQMw9am9QYkJXRVaaDndqdbTkaT0+ITU1eyC/2UJKbuxG1CKyRM+ZpnBdMzTdZkRGEYzp9m6zMHG
	bECwxJyt2J30D5ZZKrYZEOwfdtZY6kQc//vD0Xz/1qaeG/w3pET/8CR7fVmz5X3xR9EgDA1apxnv6
	5YDOsnGpc3OxZ4haWmNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNo9G-00000001QNO-0e3X;
	Sat, 07 Jun 2025 07:39:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNo9E-00000001QMT-0C54
	for linux-riscv@bombadil.infradead.org;
	Sat, 07 Jun 2025 07:39:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=GVhsR+16UMDIUqyMfTOMhoejASSuesyetmjGp0dokIc=; b=TNCD/RxDPhdskJYLGHXPGEBvvL
	BtGxcaEIX4CuzD+/GGpsoffH3nFptNEcib0C5PqNqbg1XlS+ZDWzv5N7oblSNv4x3daR+sRQ2KDOO
	DSVpNqlWioDZ1J+qL5AFKL6L8TjgOw0Ym/sdG61J3gfv1qTNJpvpIFbiLhKFGfxqTupqjWsSCmd5d
	3wpgou3jDTCTsnmRl5YPnGOW+/W/GOdkC/457Onuwb4p2OcjnxYzZJEqOcxpT7QS4WgWOXuHbQ2eH
	zQuMTQKfo3yl2fMStFSny6NuH4WUB4w1hvcnP914d4VrwUk/1xvv0/kLDB2m87TuP7Xhac1kqtO1w
	gD+FjTwQ==;
Received: from mail.loongson.cn ([114.242.206.163])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNo9B-00000001MY2-0cz0
	for linux-riscv@lists.infradead.org;
	Sat, 07 Jun 2025 07:39:23 +0000
Received: from loongson.cn (unknown [223.64.69.3])
	by gateway (Coremail) with SMTP id _____8AxlnCm7ENowhYPAQ--.40418S3;
	Sat, 07 Jun 2025 15:39:18 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.3])
	by front1 (Coremail) with SMTP id qMiowMAxDcWg7ENo4p4OAQ--.42474S4;
	Sat, 07 Jun 2025 15:39:16 +0800 (CST)
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
Subject: [PATCH v3 22/35] mmc: sdhci-of-k1: Drop the use of sdhci_pltfm_free()
Date: Sat,  7 Jun 2025 15:39:03 +0800
Message-ID: <e98c6383c82a0af2dce6d07645c9fecd53de8767.1749127796.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1749127796.git.zhoubinbin@loongson.cn>
References: <cover.1749127796.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
X-CM-TRANSID: qMiowMAxDcWg7ENo4p4OAQ--.42474S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoWrur4rZr4UXFW5Xry3Gr1fKrX_yoW3ArXEka
	45uws7WFyrArWvv34fta4Syr97KFnIgF1kuF4rKa1a9348Zrn5Ga47Zr1DX3y7uFyjkFs8
	CayUJw4xZrWjkosvyTuYvTs0mTUanT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbkAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r45
	tVCq3wAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2
	Ij64vIr41lF7xvrVCFI7AF6II2Y40_Zr0_Gr1UMxkF7I0En4kS14v26r126r1DMxAIw28I
	cxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I
	0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWU
	tVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26w1j6s0DMIIF0xvE2Ix0cI8IcV
	CY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv
	67AKxVW8Jr0_Cr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxU9zpBDUUUU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_083921_824451_FE0ED138 
X-CRM114-Status: UNSURE (   7.37  )
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
Reviewed-by: Yixun Lan <dlan@gentoo.org>
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
