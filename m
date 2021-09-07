Return-Path: <SRS0=0BIX=N5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D07A8C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Sep 2021 23:54:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B4FE60F0F
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Sep 2021 23:54:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8B4FE60F0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aJkD5e74qK9XnN8YWqHZ5jBGkPoRBdS5CheQheeKpg0=; b=DQZqAsGErRTXiT
	/vOPcq6GSXpG5qH4btOjYWeXT384/+aRTOLwnRmbtvlrXsVtlY0+lI04g+dZG/sNt5LY0qNLjYenf
	SPYUlmVV11lqZ6F2qXfUvAehWVGefwXhiggKWBDshqJE7eyixPnK1F9E7FC9uqM9V4LwA5YeES7Q+
	qGb8NMLeNzQaNysEgjVY4VdAUgrgg17Q7abZ9IlfmpR/GHL0Qm4Na4AQ4mI8l+QPITqD4Posdlllj
	1aHP35CYGG0rt2LlUJjpN/pRluNVswN9DfcJ73c1j+Ws4pssalBTLza7okVD9hMzRZixx7RSXOhQA
	tHklDmBkEpySOKnhI/Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNkuO-0052ac-42; Tue, 07 Sep 2021 23:53:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNkty-0052aK-7n
 for linux-riscv@lists.infradead.org; Tue, 07 Sep 2021 23:53:19 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 67D7060E53;
 Tue,  7 Sep 2021 23:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631058797;
 bh=jYhS0ZcKTB6Zz+i0/PZUm2K/I0ZZy5tHzLqtXig4PgU=;
 h=From:To:Cc:Subject:Date:From;
 b=DorsFZIFCMiMbcVg1orT7EPiZAGRvLJR+DRnJ9O0jgSs+1ZLc6yxxUFxNaitLvVEs
 gdzSBZ+xnpD3F0RWGAvb4krbRuMOMMu273u7j5zc/Tf5yK3T5NXgsqr4ywinAKjzWv
 3GF5hkhTAS/qjlQhOsoldg76bn2GJzF2aGyBuED4rq7dKYs2wb+i8pi1bLFqHvKQIT
 6kIw3p2o5yDWPlwA0xeF2qll4Vmcup8UIZfbDmgNSu2Vo9OGXySf+9tPmxeSejR9E1
 Ct1ziFH+6eHpEyVARrFF2KCboLK+UxwmRpfEa4EByTiC84zB0rasCU3pbEJbEjyPZs
 YYw+YqqqtR49A==
From: Vineet Gupta <vgupta@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH] riscv: config: enable default defconfig to boot Hifive
 Unmatched
Date: Tue,  7 Sep 2021 16:53:15 -0700
Message-Id: <20210907235315.567614-1-vgupta@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210907_165318_335172_18C4DA01 
X-CRM114-Status: UNSURE (   6.44  )
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

We need just a few options related to NLS when mouting boot partition
for Unmatched to boot off of mainline kernels.

Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 1f2be234b11c..fc9a4e0a9500 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -108,6 +108,8 @@ CONFIG_NFS_V4_1=y
 CONFIG_NFS_V4_2=y
 CONFIG_ROOT_NFS=y
 CONFIG_9P_FS=y
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_ISO8859_1=y
 CONFIG_CRYPTO_USER_API_HASH=y
 CONFIG_CRYPTO_DEV_VIRTIO=y
 CONFIG_PRINTK_TIME=y
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
