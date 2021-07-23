Return-Path: <SRS0=o9Ga=MP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30024C432BE
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jul 2021 21:41:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F10CE60E95
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jul 2021 21:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F10CE60E95
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RSPpR5LlXvY/ECslTXTT4/YvtNZ8lxn+d67cxTeTVHw=; b=K0pwKClM9h4a3e
	3iux8XByILVgztlcyWCeXJud98c1c4EDRlqPeG3nmwKSi6AEfLD7yrC+Hz/ULEGIZJxHhiu27vHhk
	msIV+U8BlmxD6X6PDOVkWaiFF1nJr7KL9X1BuyQaQBdKuFiLhp3RzXFF6sE+cnwV/2Evgjf2hGafz
	EKQHwcdMowF6pfF9LtyPTCFfn7Afv6WYahtlWE626d9DAnZf5YYu+XXYzSDuoi+x3doo5FClEQYt9
	77+KFVcKO0lGu5pr7F0f7z+87bT9vSbiY58s2zbWk6cBpvARzNt8eUAg2z4HRbAvgJp8eK4v21vig
	9RE+gvdHp6HgST2BRH7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m72uj-005zXW-EG; Fri, 23 Jul 2021 21:41:01 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m72uP-005zI1-JM
 for linux-riscv@lists.infradead.org; Fri, 23 Jul 2021 21:40:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1627076441; x=1658612441;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CVn7oX0CjfibpYFFpqHWKgpHrrL7Xnf/XJqEMEbWufY=;
 b=EMSagPYB85LF3i37ucrvrqlHYrP+Lo6RcGIJdeyMR1PUA5ALlzzlYmy1
 JjYlrteoYQl8TuaXpRjH3RQCo5SpV3OotrrYS7oC677ghrVpRGlfJX/oC
 gR4mJNaan1l9tQJ6C45gb+4McmEXmI873ka62HcidJ2c3IxVG2uGxRAmJ
 bfsr1iDrq0LtzbY3kGbI4SCXUAH5+PgvV9Lu+WsIGohUUqaNZS2Om/x5p
 hEqrEcsV4BVVrqL+sTZU7PCLJXrJzglZZjx1OtWuSIJUqYqlH5Uwn8XkA
 QupiU23p6rJUq/vtFU2M1FEYTY0HYbGO7zG0zdWZzOHmExSeBuerYxWIh Q==;
X-IronPort-AV: E=Sophos;i="5.84,265,1620662400"; d="scan'208";a="279198471"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 24 Jul 2021 05:40:38 +0800
IronPort-SDR: sutZTjoSHyqwYJpjLcPx+Nq7MGqpWY+HX6r9FQAsq6gETnbvJLRhVU+VVgdAWGpiL1lTgSAvud
 ZdQabCEqMi0wwRDb0wRNDUFd67CktP8ggftnbL8THjpGi9AggVp/FRjs/VGxb0odSasHZTqxcn
 cvgszLD1nknJ1wooNNyhpc1FQ7eUEHY7kWaI3bEGAXElAVZaxAMnKQVyno90ekpDHmsIS0PgMu
 5BYTWGYx6XC+uwzquw+nJJLEoHcoYnDER+pPCtcJfdOL0T4gTYm4tdTS2F+jOZhg43EuFzEjZ4
 cKzp97WFNrz5HVpEcLa1ajmG
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 14:18:27 -0700
IronPort-SDR: qhmdgrA1THlc1t/uoxnlsIj0rUGoMMu54qei7gUWzJ87apTwDnCvOIRNBoziAyb682Fgk8jRYW
 UcnQ0MFzhh8mMx4cCW8MaT8l+6SGuqwmTGzpjclU1SRda/TiKJfNmAERHZ7vruJbQbqj+9akst
 Zy3PrYdD05YDUud56v6fL93ksTdhe8tU/rO4Z3KZSrDBVeLvwxNigChWwMk+eKF4Kh9+8OoRpp
 HbIAUxanozLZ7K6AaSrtNE+1ypjkoxDYqn0/HSxVF48FGlduZ0tmkOcdTrI8grrvNtTC8wvyvW
 Vu0=
WDCIronportException: Internal
Received: from ucfbox21.ad.shared (HELO hulk.wdc.com) ([10.225.167.4])
 by uls-op-cesaip01.wdc.com with ESMTP; 23 Jul 2021 14:40:38 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atish.patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christoph Hellwig <hch@lst.de>, devicetree@vger.kernel.org,
 Dmitry Vyukov <dvyukov@google.com>, Frank Rowand <frowand.list@gmail.com>,
 Guo Ren <guoren@linux.alibaba.com>, iommu@lists.linux-foundation.org,
 linux-riscv@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Tobias Klauser <tklauser@distanz.ch>
Subject: [RFC 5/5] RISC-V: Support a new config option for non-coherent DMA
Date: Fri, 23 Jul 2021 14:40:31 -0700
Message-Id: <20210723214031.3251801-6-atish.patra@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210723214031.3251801-1-atish.patra@wdc.com>
References: <20210723214031.3251801-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_144041_765788_D4EC7F7D 
X-CRM114-Status: UNSURE (   9.38  )
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

In future, there will be more RISC-V platforms with non-coherent DMA.
Instead of selecting all the required config options in every soc, create
a new config that selects all the required configs related non-coherent
DMA.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/Kconfig | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 8fcceb8eda07..931b283c8ec9 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -209,6 +209,14 @@ config PGTABLE_LEVELS
 config LOCKDEP_SUPPORT
 	def_bool y
 
+config RISCV_DMA_NONCOHERENT
+	bool
+	select ARCH_HAS_DMA_PREP_COHERENT
+	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
+	select ARCH_HAS_SYNC_DMA_FOR_CPU
+	select ARCH_HAS_SETUP_DMA_OPS
+	select DMA_GLOBAL_POOL
+
 source "arch/riscv/Kconfig.socs"
 source "arch/riscv/Kconfig.erratas"
 
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
