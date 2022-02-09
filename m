Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 073C7C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Feb 2022 12:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IJ+9DbFlR33jQksvAWmRjZg15KEV2tQWjdM9Q8WJ50M=; b=kywpycnETdppEg
	9ycRsbsDP0P7hLub1oLUIcFNI9AkaXuEoVp9bXfUWRSMC2YawCUWeGpk18K505JVAqyZYvJW2jF0w
	WBY/kCu0r0Sam50tNoIbFwCPpeoM1iSEzQbAIlec1eh6IZAdBAreCiBU2aUum6B83ddQQQPBrjCW7
	bZpuzyiVgCTGczEEy1/LjrNLdHiVsrt4QSNqFAoiJhY2QFkhFK4xvFGPHsuUNSGFy2bANAjkhsxl6
	a21D7/s2w5aZstUhwtucKGwMEgPzCC/3Z44xoOlN4UesTmsBJJYTn0U+8DZdnbxJl+ajVr/kq2s7c
	zYYpc/KpVnQXv9RhHdOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHmIk-0003wx-Q2; Wed, 09 Feb 2022 12:42:26 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHmIi-0003vv-CR
 for linux-riscv@lists.infradead.org; Wed, 09 Feb 2022 12:42:25 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nHmEv-0001Mv-BV; Wed, 09 Feb 2022 13:38:29 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, wefu@redhat.com,
 liush@allwinnertech.com, guoren@kernel.org, atishp@atishpatra.org,
 anup@brainfault.org, drew@beagleboard.org, hch@lst.de, arnd@arndb.de,
 wens@csie.org, maxime@cerno.tech, gfavor@ventanamicro.com,
 andrea.mondelli@huawei.com, behrensj@mit.edu, xinhaoqu@huawei.com,
 huffman@cadence.com, mick@ics.forth.gr, allen.baum@esperantotech.com,
 jscheid@ventanamicro.com, rtrauben@gmail.com, samuel@sholland.org,
 cmuellner@linux.com, philipp.tomsich@vrull.eu,
 Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v6 13/14] riscv: remove FIXMAP_PAGE_IO and fall back to its
 default value
Date: Wed,  9 Feb 2022 13:37:59 +0100
Message-Id: <20220209123800.269774-14-heiko@sntech.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209123800.269774-1-heiko@sntech.de>
References: <20220209123800.269774-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_044224_438408_9867500F 
X-CRM114-Status: UNSURE (   9.82  )
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
---
 arch/riscv/include/asm/fixmap.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/include/asm/fixmap.h b/arch/riscv/include/asm/fixmap.h
index 58a718573ad6..692e25e56d8e 100644
--- a/arch/riscv/include/asm/fixmap.h
+++ b/arch/riscv/include/asm/fixmap.h
@@ -44,8 +44,6 @@ enum fixed_addresses {
 	__end_of_fixed_addresses
 };
 
-#define FIXMAP_PAGE_IO		PAGE_KERNEL
-
 #define __early_set_fixmap	__set_fixmap
 
 #define __late_set_fixmap	__set_fixmap
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
