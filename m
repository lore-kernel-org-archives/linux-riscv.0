Return-Path: <SRS0=Il0f=OB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDB3FC43217
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Sep 2021 09:22:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 968AF61216
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Sep 2021 09:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 968AF61216
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=375x2Kw7p3bpR7DkB3KTwc2act3ehJpz+eabMwTSksQ=; b=ULlFaO9Pgrx0ks
	U6TGEm3FHANhJt/dgfKpibl7YAD1lQiF1OQIcAtqtLqVrT2s3qG6zDkaWQR6yj10BIASKqlNJ8Qkp
	lBg2BNHEWbPnk8wl+RbTF30ymyILt9gn/pPhxUut3NxNqqH/pWi+mk6nJ974u99ehMJ+7nP1g9e40
	ppGh01Y0KvgkcijZ3W3WeZ9gUvhY/tj/5/5apqLjTqOakiXQO0yZfEbqo9kaldMeiJggEZR5wesxM
	AtqWx4MQZ9+69AN3aGjtXGGWddqLxjqik4KB+/HgxaC2dKO7ZBYMXKbBB8iehI2/jONRgbQRXeZdP
	HW+6uxh6ezvM1WnW7ayg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOzDF-00Eb0g-SI; Sat, 11 Sep 2021 09:22:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOzDD-00Eb06-Ra
 for linux-riscv@lists.infradead.org; Sat, 11 Sep 2021 09:22:17 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6151E611F2;
 Sat, 11 Sep 2021 09:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631352135;
 bh=HpczDCI/VmO/hoLx97DUXUTuxC7jnTK5MeZdEMO4bFM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZtZx2lq4XG8v1qS1EWbvBLfNb6/XMkIMsAPC9iBdpu5kJ3ty01Kd9zQ90LE95YrZt
 Vp0UxnDyBGBEnhmgUGxF/HUs7jSAHUiQohJyGJ6a5ThnI/pA5oHmlVMOSArIH1UFmF
 GoKANXwnhfdMeD3dOsV+TNFodHvXoSnDTem82IJ1j18vQOxvdu5JkZnT+YrpRwivOe
 QkdVMLiZub4dbxP9XJwfZ2123nKfJhaLdk12sJsX64+ejmGX6ul+98kQRXbbEMqoSF
 hkztwP4YgeHHjvkTvts88Sedq0SrOLV3ebYqGgHPPUqLBjVLYutvDKcnQhMNMrAC7P
 zLizmKvVCNd/A==
From: guoren@kernel.org
To: anup.patel@wdc.com, atish.patra@wdc.com, palmerdabbelt@google.com,
 guoren@kernel.org, christoph.muellner@vrull.eu, philipp.tomsich@vrull.eu,
 hch@lst.de, liush@allwinnertech.com, wefu@redhat.com, lazyparser@gmail.com,
 drew@beagleboard.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 taiten.peng@canonical.com, aniket.ponkshe@canonical.com,
 heinrich.schuchardt@canonical.com, gordan.markus@canonical.com,
 Guo Ren <guoren@linux.alibaba.com>
Subject: [RFC PATCH V4 3/6] RISC-V: Support a new config option for
 non-coherent DMA
Date: Sat, 11 Sep 2021 17:21:36 +0800
Message-Id: <20210911092139.79607-4-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210911092139.79607-1-guoren@kernel.org>
References: <20210911092139.79607-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210911_022215_949694_97C1AC45 
X-CRM114-Status: UNSURE (   6.07  )
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

From: Atish Patra <atish.patra@wdc.com>

In future, there will be more RISC-V platforms with non-coherent DMA.
Instead of selecting all the required config options in every soc, create
a new config that selects all the required configs related non-coherent
DMA.

Signed-off-by: Atish Patra <atish.patra@wdc.com>

RISC-V: Support DMA_DIRECT_REMAP for non-coherent DMA

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
---
 arch/riscv/Kconfig | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 3ab3730bee92..d18a59ea10e5 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -213,6 +213,15 @@ config PGTABLE_LEVELS
 config LOCKDEP_SUPPORT
 	def_bool y
 
+config RISCV_DMA_NONCOHERENT
+	bool
+	select ARCH_HAS_DMA_PREP_COHERENT
+	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
+	select ARCH_HAS_SYNC_DMA_FOR_CPU
+	select ARCH_HAS_SETUP_DMA_OPS
+	select DMA_GLOBAL_POOL
+	select DMA_DIRECT_REMAP
+
 source "arch/riscv/Kconfig.socs"
 source "arch/riscv/Kconfig.erratas"
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
