Return-Path: <SRS0=9QI1=LA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A3F8C4743F
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 09:05:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50AD461426
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 09:05:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50AD461426
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gJReGlO0KmGb7RvfBNr/b8mP1fqRJfX/e+xWD1Fq9zA=; b=UBi1gwijGAA6dH
	++sa45SluEid0poYR1MOPNt+KqjfqVyg/Hk0nP2P1Ow/atNs5w+ttMHO1TwqBcOlFHyXiSRfwR5fT
	tHxd8+AbxeQeIQnjhI2wdOBCsR+KZWPDj/V9/BLWHqpPxA4T8VBEtdT5ejrtSvc605IQDcJWEOQti
	gH/ed10pNBAKLvO82Y1XWvM3db/dutlDvbILhM4IyZAMCylR63jlncLYqXne5HLHdAeprhOdF+PtS
	+pJq9HxDr7JVIVOn4wVQPipkgR1gGkWIulcRFrLjie/hrDUYNCHANmnOQOnMiiWxN2rDQU0txAPtN
	kw/kt8y2/dfWsVfR+xig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpoiQ-0002ZL-JK; Sun, 06 Jun 2021 09:05:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpoiN-0002Yo-NQ
 for linux-riscv@lists.infradead.org; Sun, 06 Jun 2021 09:05:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id ADAC061429;
 Sun,  6 Jun 2021 09:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622970303;
 bh=OILVP/xTrY25solt1VG9doQOz27QZP5b+AfmystSFro=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Wwd1JFTUhf/IlgOz7j2TUa5JCLi2yaOe/hCx2R788MyBvmkFVbfkQJIjFZC1pA0Qb
 Rl5GK2mPJGAdfyAm1Awa1m2d4tjOphz3ceoA32ULnQTCzEIsAsw+TPpbGzZGN7HCLL
 8gosXVoV8lECcwhCT2WPflUCKOtZjyIoDPHPmAV4oR/im31bj2TRLNgM3azv9Jq8rT
 fHpOO654x8qu1VdHEZg0YMfNIch6lNCTRVcUN2h8LLq3bqTxM38SDou1FHmL9qL2CD
 eb0L02cWE18iNh/VsEig5twdfNkYb+WJsG4QEDQHi8/dQrMKWW6SKdFbfZG5lxqaPK
 zvbwLJjZoNrHw==
From: guoren@kernel.org
To: guoren@kernel.org, anup.patel@wdc.com, palmerdabbelt@google.com,
 arnd@arndb.de, wens@csie.org, maxime@cerno.tech, drew@beagleboard.org,
 liush@allwinnertech.com, lazyparser@gmail.com, wefu@redhat.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Guo Ren <guoren@linux.alibaba.com>
Subject: [RFC PATCH v2 01/11] riscv: asid: Use global mappings for kernel pages
Date: Sun,  6 Jun 2021 09:03:56 +0000
Message-Id: <1622970249-50770-2-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622970249-50770-1-git-send-email-guoren@kernel.org>
References: <1622970249-50770-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_020503_808390_412B3BE5 
X-CRM114-Status: GOOD (  10.31  )
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

We map kernel pages into all addresses space, so they can be marked as
global. This allows hardware to avoid flushing the kernel mappings when
moving between address spaces.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Liu Shaohua <liush@allwinnertech.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Liu Shaohua <liush@allwinnertech.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Drew Fustini <drew@beagleboard.org>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Wei Fu <wefu@redhat.com>
Cc: Wei Wu <lazyparser@gmail.com>
---
 arch/riscv/include/asm/pgtable.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 9469f46..346a3c6 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -134,7 +134,8 @@
 				| _PAGE_WRITE \
 				| _PAGE_PRESENT \
 				| _PAGE_ACCESSED \
-				| _PAGE_DIRTY)
+				| _PAGE_DIRTY \
+				| _PAGE_GLOBAL)
 
 #define PAGE_KERNEL		__pgprot(_PAGE_KERNEL)
 #define PAGE_KERNEL_READ	__pgprot(_PAGE_KERNEL & ~_PAGE_WRITE)
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
