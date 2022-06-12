Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A5BC43334
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Jun 2022 04:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iEZ5KuU7rD9d3PLpAAOH5915aqI3WHApPCOm6f4C13U=; b=jq96JQhzxIWi59
	qWATcpgM2WRePMaOQfehLS/eAtn5PDw/y7AYGaB2X2vHKCjt5vWmSfFEbIVza6l6ifEgxJ1q8WfoF
	DB1Z1H3CQDUa7Vf4zJBFPeVoESTgQ/0KXFQ4CyGnoUuka8u0GBfRdKdsXw+YKCX+htgVqc1gb2dRn
	NGNdo1r1nI23I2xSdC8Yd+SzzX5x9ULkNTL/UY0Xbra/l2dI6zn1Qb45glZ7vFlkU9ecd56flyUfX
	gjrzm1IajF3DZ8JsEpLz5YhEFImhF8MbBe/u+RVYQlTzb3cvduJcVh+qX1fILOn7rQEX1qq6ciX+p
	tXXA5MA2+YoXBLeCv9ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0FJc-00FWT9-L6; Sun, 12 Jun 2022 04:35:08 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0FJa-00FWSi-6A
	for linux-riscv@lists.infradead.org; Sun, 12 Jun 2022 04:35:07 +0000
From: Yixun Lan <dlan@gentoo.org>
To: linux-riscv@lists.infradead.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH] RISC-V: enable CONFIG_ARCH_KEEP_MEMBLOCK
Date: Sun, 12 Jun 2022 12:34:33 +0800
Message-Id: <20220612043433.10469-1-dlan@gentoo.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220611_213506_295019_CBBB818B 
X-CRM114-Status: UNSURE (   6.24  )
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

Preserve the memblock info while CONFIG_DEBUG_FS is enabled.
So later, the information can be showed at:
  /sys/kernel/debug/memblock/{memory,reserved}

Signed-off-by: Yixun Lan <dlan@gentoo.org>

---
Check mm/memblock.c:2120 for the code logic:
   #if defined(CONFIG_DEBUG_FS) && defined(CONFIG_ARCH_KEEP_MEMBLOCK)

I've tested on unmatched board, with this patch applied
for example, we can see the memblock reserved info as:

 # cat /sys/kernel/debug/memblock/reserved
   0: 0x0000000080000000..0x000000008007ffff
   1: 0x0000000080200000..0x00000000823fffff
   2: 0x0000000088000000..0x000000008800307f
   3: 0x00000000ec000000..0x00000000ffffffff
   4: 0x000000046d600000..0x000000047edfffff
   5: 0x000000047ee2d000..0x000000047eeecfff
   6: 0x000000047eeed440..0x000000047eeed947
   7: 0x000000047eeed980..0x000000047eeede1f
   8: 0x000000047eeede40..0x000000047eeedfc7
   9: 0x000000047eeee000..0x000000047ef59fff
  10: 0x000000047ef5c000..0x000000047efdd05f
  11: 0x000000047efdd080..0x000000047efdd29f
  12: 0x000000047efdd2c0..0x000000047efdd3df
  13: 0x000000047efdd400..0x000000047efdd41f
  14: 0x000000047efdd440..0x000000047efdd44f
  15: 0x000000047efdd480..0x000000047efdd487
  16: 0x000000047efdd4c0..0x000000047efdd525
  17: 0x000000047efdd540..0x000000047efdd5a5
  18: 0x000000047efdd5c0..0x000000047ffdfa47
  19: 0x000000047ffdfa78..0x000000047ffdfaa8
  20: 0x000000047ffdfab0..0x000000047ffdfade
  21: 0x000000047ffdfae0..0x000000047ffdfb0e
  22: 0x000000047ffdfb10..0x000000047ffeeffb
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index c22f58155948..e457c5855222 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -32,6 +32,7 @@ config RISCV
 	select ARCH_HAS_STRICT_MODULE_RWX if MMU && !XIP_KERNEL
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
+	select ARCH_KEEP_MEMBLOCK
 	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
 	select ARCH_STACKWALK
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
