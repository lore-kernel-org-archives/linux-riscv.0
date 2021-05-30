Return-Path: <SRS0=590W=KZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 595E8C47091
	for <linux-riscv@archiver.kernel.org>; Sun, 30 May 2021 04:54:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F35696102A
	for <linux-riscv@archiver.kernel.org>; Sun, 30 May 2021 04:54:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F35696102A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8NS20zFPI5CdSKEf9Z4nV+tx3PbFaj9Jn3Xba8XvftQ=; b=1SEYaiIhJq/sYz
	cdRPE0MSpTUWE2Bm/9Re3sEaHRgE9gCiDAo1N4MdHuKO724drSoQ3Ekb9tCM7PQsZ9HLsg3U+KW4/
	4KeyniV1peMD+RuJLVYqXLMAx1u5XyYCIBT62lbSr7TSy/r8A6DyBizoMAScEwNOQ10YnN8UiLFEq
	9K4m3r1bUy/HeTIMloAPlxP/kS3i2Fa+dQyWmSy20+Sgo+kwV6oTGhR64LGND0hsN8ezR8nvmzdLp
	acCzjv21DILOR6W2z9Zni1X0M2piBjK6sLJ4fNFLsE7ZFlFo+WbjJaMEkdRjtSBAQrUQEvW1fKzdO
	BxuBNJdjmNP1d6mSPgOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnDT1-008z5W-PY; Sun, 30 May 2021 04:54:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnDSz-008z54-7L
 for linux-riscv@lists.infradead.org; Sun, 30 May 2021 04:54:26 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E4499611AE;
 Sun, 30 May 2021 04:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622350464;
 bh=GkThTms33HMIKQO6b4SaeQi3+r70EMZPQhD7XOMYSa4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R+8pw7pfX1Bw/7vR9PVJ5quXPDC++4xVfnCDm9Z22XgRP76X0UiWSFioceOfUvsh2
 nerdYLMpw0ugG0bR6QkVghQ39aUcBNmRf9xcymBLUEH+j/nlVy8V4+FBppjEruS+/P
 aQ4SBqXpIqTbZLhbfwyX3u7jel+HVnXPPl0ezufIkVWA790ppbWfntetP38q+AnhjP
 pQwAstutgkt0bqnWrCOlAnt44lMQUucHW2mMPO0Lzhz1v+7MCkByAyljXqhV0x4FQx
 3Wi+LKPTsa6F+piFyg58UA7Tv+gTicu8vF34LW16fowlJfIduR8+4yYcwAtz5BlqTF
 fWAu8La1iwgwg==
From: guoren@kernel.org
To: guoren@kernel.org, anup.patel@wdc.com, palmerdabbelt@google.com,
 arnd@arndb.de
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Guo Ren <guoren@linux.alibaba.com>, Michal Simek <monstr@monstr.eu>
Subject: [PATCH V2 2/2] microblaze: Cleanup unused functions
Date: Sun, 30 May 2021 04:53:28 +0000
Message-Id: <1622350408-44875-3-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622350408-44875-1-git-send-email-guoren@kernel.org>
References: <1622350408-44875-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210529_215425_306727_48E10A1C 
X-CRM114-Status: UNSURE (   9.04  )
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
just uses grep to verify.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Michal Simek <monstr@monstr.eu>
---
 arch/microblaze/include/asm/page.h | 3 ---
 1 file changed, 3 deletions(-)

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
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
