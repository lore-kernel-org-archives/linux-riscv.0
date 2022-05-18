Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68153C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 18 May 2022 17:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nsNtD7KtABita88qeFJ0idZU/yccszZCbJhxHHjiBuk=; b=GUqtW7HS+1YoI2
	+iNLs53yISRCjtpI59epM3422wnmV2fYJOoSjK0PYGhN0BqNw2FtFYeyRLcZPJgDNC4zF2mYtv0ax
	o4dImNT1ALLxzEW7lXT3G5Xe+dHLLoKy4fMhHDJRalJPkkK1CX1vizRcq/dmGjBIaYUjsi+qyczKQ
	J4H540Q+CscvaBoJLfSLpZHgOllzEIy2rx6yTKLccXs/wvPGMFczIsroArpdG2uDhQytXxRAPLzhz
	I5Q3+en1rrKQWhSzI4SQSd4b6jOYg1Y5JkgEgLtflKAvIoF3g0Ft65kChq32Ed/BBoQ+/mRD4DX7f
	ONQxCv7riD1HIY6rGMgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrN4p-003AEI-EB; Wed, 18 May 2022 17:03:11 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrN4i-003AAd-RY
 for linux-riscv@lists.infradead.org; Wed, 18 May 2022 17:03:06 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nrN4d-0001Pv-Q5; Wed, 18 May 2022 19:02:59 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 wefu@redhat.com, guoren@kernel.org, mick@ics.forth.gr, samuel@sholland.org,
 cmuellner@linux.com, philipp.tomsich@vrull.eu, hch@lst.de,
 Heiko Stuebner <heiko@sntech.de>, kernel test robot <yujie.liu@intel.com>
Subject: [PATCH 4/4] riscv: fix dependency for t-head errata
Date: Wed, 18 May 2022 19:02:54 +0200
Message-Id: <20220518170254.3178923-5-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220518170254.3178923-1-heiko@sntech.de>
References: <20220518170254.3178923-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_100304_921574_253EE4C8 
X-CRM114-Status: UNSURE (   9.83  )
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

alternatives only work correctly on non-xip-kernels and while the
selected alternative-symbol has the correct dependency the symbol
selecting it also needs that dependency.

So add the missing dependency to the T-Head errata Kconfig symbol.

Reported-by: kernel test robot <yujie.liu@intel.com>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/Kconfig.erratas | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig.erratas b/arch/riscv/Kconfig.erratas
index ebfcd5cc6eaf..457ac72c9b36 100644
--- a/arch/riscv/Kconfig.erratas
+++ b/arch/riscv/Kconfig.erratas
@@ -35,6 +35,7 @@ config ERRATA_SIFIVE_CIP_1200
 
 config ERRATA_THEAD
 	bool "T-HEAD errata"
+	depends on !XIP_KERNEL
 	select RISCV_ALTERNATIVE
 	help
 	  All T-HEAD errata Kconfig depend on this Kconfig. Disabling
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
