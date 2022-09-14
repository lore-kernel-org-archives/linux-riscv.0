Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7936ECAAD3
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Sep 2022 14:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gT6tB/c51a3Te9CXPn19K02V4xBHS5LtXIa6fQRaV1Y=; b=LvbEmVxQbdDscc
	NKJ/ebKpP+uZlh4xVS/+Pj2Z9qCC/fLSdRlXKeF4yhMBzqWiWSGAKHjowtxcM/NfvSKQAl/0BMldC
	bSNXYetM17rSRBCDBHZJndQoNIJxYhVzTJEZc3uHndXestKTlbeQ2NVt9lgdjVuJVR8pYhPgrfY4J
	QRuOjg3hy1AZMgVw1y7+K/f0yYqmDNWwfOr1Q9wV2Bo71Vw0wI2lflZQjA9JYQjxMN4hx3fysHG9y
	yrlg07won3sPHT7GR8f0fvLQG+Gh0VhM+et6KMkJrVpz0fonkv19BxSRkHMt92VGtOi61q9NmNAyf
	ONjnD1Ka6oGXuYR1eczg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYTVf-002RCl-Fe; Wed, 14 Sep 2022 14:37:03 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYTVd-002Qzt-7y
	for linux-riscv@lists.infradead.org; Wed, 14 Sep 2022 14:37:02 +0000
Received: from [185.122.133.20] (helo=phil.access.network)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oYTVU-0006bB-Vj; Wed, 14 Sep 2022 16:36:53 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@rivosinc.com
Cc: linux-riscv@lists.infradead.org,
	nathan@kernel.org,
	mail@conchuod.ie,
	atishp@atishpatra.org,
	ajones@ventanamicro.com,
	anup@brainfault.org,
	conor.dooley@microchip.com,
	Heiko Stuebner <heiko@sntech.de>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] RISC-V: move riscv_cbom_block_size to the correct #ifdef block
Date: Wed, 14 Sep 2022 16:36:48 +0200
Message-Id: <20220914143648.74022-1-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_073701_314994_1E18737F 
X-CRM114-Status: GOOD (  12.04  )
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

riscv_cbom_block_size is used by all current non-coherent dma operations,
not only the zicbom variant. So move it over the block also containing
the riscv_noncoherent_supported() prototype.

Fixes: 8f7e001e0325 ("RISC-V: Clean up the Zicbom block size probing")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/include/asm/cacheflush.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
index a89c005b4bbf..5c16d901d3da 100644
--- a/arch/riscv/include/asm/cacheflush.h
+++ b/arch/riscv/include/asm/cacheflush.h
@@ -43,13 +43,13 @@ void flush_icache_mm(struct mm_struct *mm, bool local);
 #endif /* CONFIG_SMP */
 
 #ifdef CONFIG_RISCV_ISA_ZICBOM
-extern unsigned int riscv_cbom_block_size;
 void riscv_init_cbom_blocksize(void);
 #else
 static inline void riscv_init_cbom_blocksize(void) { }
 #endif
 
 #ifdef CONFIG_RISCV_DMA_NONCOHERENT
+extern unsigned int riscv_cbom_block_size;
 void riscv_noncoherent_supported(void);
 #endif
 
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
