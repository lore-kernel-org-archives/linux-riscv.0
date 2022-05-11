Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F43C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 11 May 2022 19:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S+8hiMVI3raSCmZgLSktGvjw7PdLfIUBGBFHrN+bAKw=; b=2+pTxaUDW8d9aQ
	SjyWj9rnjx18sidB76Jop0f9OWvZXOzGNm5HJdNAxZktg/QVzKIuz5rH9rL9r1aBaXv+WGTfi0QEC
	L21MQ1ZfCHgJr3GFgTRVchTjyBcyClTuiJs7j8i3ZAKwa0g6KzVOpzm0oylgScr80ol20ZT2VH2LG
	5i7qhkP0yBhWGd+S5k/nxdCrMF+cQXZuPmWhvCAtHzYOOOBEa8Uu4fUjCFMCsyzHgenx9v9kHR/7R
	kRvyo6uaMlA1GIWEcsHmaOIxoVTlu9nQ1mEKuxLdUAVxNoj6UiO28bVk47t59GYOQPhIPR/K0eIvm
	PTl8ZBtX1Kw54XPdn/bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nos4D-008Lsg-4c; Wed, 11 May 2022 19:32:13 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nos4A-008LrH-Gd
 for linux-riscv@lists.infradead.org; Wed, 11 May 2022 19:32:11 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nos1l-0004fe-Ss; Wed, 11 May 2022 21:29:41 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 wefu@redhat.com, liush@allwinnertech.com, guoren@kernel.org,
 atishp@atishpatra.org, anup@brainfault.org, drew@beagleboard.org,
 hch@lst.de, arnd@arndb.de, wens@csie.org, maxime@cerno.tech,
 gfavor@ventanamicro.com, andrea.mondelli@huawei.com, behrensj@mit.edu,
 xinhaoqu@huawei.com, mick@ics.forth.gr, allen.baum@esperantotech.com,
 jscheid@ventanamicro.com, rtrauben@gmail.com, samuel@sholland.org,
 cmuellner@linux.com, philipp.tomsich@vrull.eu,
 Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 10/12] riscv: remove FIXMAP_PAGE_IO and fall back to its
 default value
Date: Wed, 11 May 2022 21:29:19 +0200
Message-Id: <20220511192921.2223629-11-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220511192921.2223629-1-heiko@sntech.de>
References: <20220511192921.2223629-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_123210_583614_7455395F 
X-CRM114-Status: UNSURE (   9.86  )
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

If not defined in the arch, FIXMAP_PAGE_IO defaults to PAGE_KERNEL_IO,
which we defined when adding the svpbmt implementation.

So drop the FIXMAP_PAGE_IO riscv define.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/fixmap.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/include/asm/fixmap.h b/arch/riscv/include/asm/fixmap.h
index 3cfece8b6568..5c3e7b97fcc6 100644
--- a/arch/riscv/include/asm/fixmap.h
+++ b/arch/riscv/include/asm/fixmap.h
@@ -45,8 +45,6 @@ enum fixed_addresses {
 	__end_of_fixed_addresses
 };
 
-#define FIXMAP_PAGE_IO		PAGE_KERNEL
-
 #define __early_set_fixmap	__set_fixmap
 
 #define __late_set_fixmap	__set_fixmap
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
