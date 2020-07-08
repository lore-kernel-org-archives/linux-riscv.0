Return-Path: <SRS0=nZh1=AT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 631EEC433E0
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jul 2020 05:44:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05F162078B
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jul 2020 05:44:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lkEWad7R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05F162078B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eswin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PrVh/3FCEnzqnEwiu74J+/D7SlvjGIQYq+Z7TAmvVmM=; b=lkEWad7RjGJAtxI4bXaAcYP7ph
	ScwEe558eIyqQCRmU6Ob+d+L7FCfZ/Eo9/lbdNiafAMa4U+6adnIcidIPCAkIrX13lg/xymPJEDKS
	8kCcQgWYsiswHhdfNbdX43LZ1yEIh3CiGmNzZwXDSq3J8nv+BQ42+inlbkz2C1ax84ta/IksZ3FWj
	4AURHim2JKHpBaM42fsRDXFfVHNvJODeVhUEorJNLLPP7unPta7uY2Bvpq7e02JR1REIozxawyNWW
	7NfLlkj4ay/0shiFAPZ/c5ANop5VxW5XifaOhFpqHiENEfvPt7J5mIf+WXk2OK8ovQCMCM/4SnYyc
	PLZIeCRg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jt2sS-0007sg-3m; Wed, 08 Jul 2020 05:44:16 +0000
Received: from out28-1.mail.aliyun.com ([115.124.28.1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jt2sO-0007s9-Ez
 for linux-riscv@lists.infradead.org; Wed, 08 Jul 2020 05:44:15 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.577819|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0144316-0.00272735-0.982841;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03294; MF=maochenxi@eswin.com; NM=1; PH=DS; RN=7;
 RT=7; SR=0; TI=SMTPD_---.I-3Y8gn_1594187037; 
Received: from localhost.localdomain(mailfrom:maochenxi@eswin.com
 fp:SMTPD_---.I-3Y8gn_1594187037)
 by smtp.aliyun-inc.com(10.194.97.171);
 Wed, 08 Jul 2020 13:44:01 +0800
From: Chenxi Mao <maochenxi@eswin.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Subject: [PATCH 1/1] riscv: Enable compiler optimizations
Date: Wed,  8 Jul 2020 13:43:54 +0800
Message-Id: <20200708054354.25283-1-maochenxi@eswin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200708_014412_760888_C1D1B498 
X-CRM114-Status: UNSURE (   6.02  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, Chenxi Mao <maochenxi@eswin.com>,
 linux-kernel@vger.kernel.org, chenxi.mao2013@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Enable ARCH_HAS_FAST_MULTIPLIER and ARCH_SUPPORTS_INT128 for better
code generation.
These 2 configurations works fine on GCC-9.3 and GCC-10.1

Signed-off-by: Chenxi Mao <maochenxi@eswin.com>
---
 arch/riscv/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 128192e14ff2..f21b7e5188ca 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -26,6 +26,8 @@ config RISCV
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
+	select ARCH_HAS_FAST_MULTIPLIER
+	select ARCH_SUPPORTS_INT128 if GCC_VERSION >= 50000 || CC_IS_CLANG
 	select CLONE_BACKWARDS
 	select COMMON_CLK
 	select EDAC_SUPPORT
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
