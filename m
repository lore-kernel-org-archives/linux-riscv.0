Return-Path: <SRS0=WUGv=KU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C32AC2B9F8
	for <linux-riscv@archiver.kernel.org>; Tue, 25 May 2021 12:22:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5908861409
	for <linux-riscv@archiver.kernel.org>; Tue, 25 May 2021 12:22:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5908861409
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8u9Uadgki0mbaf9hVL357U6XTdf2muYweMfXaT7kktA=; b=jjLkL9AYmBVvRL
	BqP1bSsZkRwvXUzk7VIE7oj5nZOioA6WBKW3d/qlfImwg8wujkVsTDzbvCx5hkn7z7v1EeXZ9fSCj
	D0GbAdhCY0k4m1arAyZle5Ih2/3tkBrRabcZwj2tWU7Xnfbw8BlSCXRkFjl1uNFbJaou1Oi0kfLiV
	/950Ia9dqEUX71IACF0BYV1XwXQoh+1EBLhGjCSvDvX0BwbB+lQyypO0b0P3eUbIZhg9rG0zO3Dww
	yPdSS9NHCk3+Tp0W6Tfgvik0Maq4A0S7Gay6frO2W4R9RrXlJgF6M4XK/Ac7dvqBdufPYbl0fhXnZ
	PoNkuZUavt6c3f3POyOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llW4Y-004zSw-R2; Tue, 25 May 2021 12:22:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llW3r-004zGr-8d
 for linux-riscv@lists.infradead.org; Tue, 25 May 2021 12:21:28 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D25EF613F5;
 Tue, 25 May 2021 12:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621945286;
 bh=kkOFBK36MRxl8q4h1ABFoSf/N6xzgxGjK2IhPoS7xos=;
 h=From:To:Cc:Subject:Date:From;
 b=dFS/jLpi2jnANmVgkpVSLL+EL4f1yLHSxpzak6UnyM6v4A/aNcCTvjWpJtpJSiNZR
 GKgB4LEiLR6US9khaJ8z4aYMx2PXMXvxZSCq/GEN/oE4CcfNqGisIHRrWELvNfTZKm
 xh17eSoJqSi1W5C5TYN8kN0+g4VsFzH1I87ILpc+nbjPTYbytl9zn/38VCnrOXUNWE
 hgjXkE1BHNqtaT0hwcy5cWVWAcy5rwk4FQ/MfJ/Z3Ms8EGP6F3mlE5IikT2DtjAEtQ
 ai3oQkuUkJp6v6Xmuwn2lLFs8y9UIAn0TiVRH5IkEVg6u8dgiaRoqTLzBUxoVCd9zb
 L03U1dSD8pRpw==
From: guoren@kernel.org
To: guoren@kernel.org, anup.patel@wdc.com, palmerdabbelt@google.com,
 arnd@arndb.de, hch@lst.de
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Guo Ren <guoren@linux.alibaba.com>, Michal Simek <monstr@monstr.eu>
Subject: [PATCH] arch: Cleanup unused functions
Date: Tue, 25 May 2021 12:20:34 +0000
Message-Id: <1621945234-37878-1-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_052127_398042_CD2D1593 
X-CRM114-Status: UNSURE (   9.87  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

These functions haven't been used, so just remove them. The patch
has been tested with riscv, but I only use grep to check the
microblaze's.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Michal Simek <monstr@monstr.eu>
Cc: Christoph Hellwig <hch@lst.de>
---
 arch/microblaze/include/asm/page.h |  3 ---
 arch/riscv/include/asm/page.h      | 10 ----------
 2 files changed, 13 deletions(-)

diff --git a/arch/microblaze/include/asm/page.h b/arch/microblaze/include/asm/page.h
index bf681f2..ce55097 100644
--- a/arch/microblaze/include/asm/page.h
+++ b/arch/microblaze/include/asm/page.h
@@ -35,9 +35,6 @@
 
 #define ARCH_SLAB_MINALIGN	L1_CACHE_BYTES
 
-#define PAGE_UP(addr)	(((addr)+((PAGE_SIZE)-1))&(~((PAGE_SIZE)-1)))
-#define PAGE_DOWN(addr)	((addr)&(~((PAGE_SIZE)-1)))
-
 /*
  * PAGE_OFFSET -- the first address of the first page of memory. With MMU
  * it is set to the kernel start address (aligned on a page boundary).
diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 6a7761c..a1b888f 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -37,16 +37,6 @@
 
 #ifndef __ASSEMBLY__
 
-#define PAGE_UP(addr)	(((addr)+((PAGE_SIZE)-1))&(~((PAGE_SIZE)-1)))
-#define PAGE_DOWN(addr)	((addr)&(~((PAGE_SIZE)-1)))
-
-/* align addr on a size boundary - adjust address up/down if needed */
-#define _ALIGN_UP(addr, size)	(((addr)+((size)-1))&(~((size)-1)))
-#define _ALIGN_DOWN(addr, size)	((addr)&(~((size)-1)))
-
-/* align addr on a size boundary - adjust address up if needed */
-#define _ALIGN(addr, size)	_ALIGN_UP(addr, size)
-
 #define clear_page(pgaddr)			memset((pgaddr), 0, PAGE_SIZE)
 #define copy_page(to, from)			memcpy((to), (from), PAGE_SIZE)
 
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
