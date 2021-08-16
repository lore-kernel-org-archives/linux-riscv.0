Return-Path: <SRS0=iJWH=NH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39AEDC4338F
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Aug 2021 14:48:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEB73601FA
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Aug 2021 14:48:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DEB73601FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ul0keB1wfglcEbpi3pzyXIvzb/fO4Jj1FymCWuC5fHU=; b=dHL8Bo5HCTfpED
	+5HvvzAJaaeAelYCmO5HolxDjZLpVFBdReZMJ2RVJ24lCkLg7W0U8Z745Je9T8/G5BVKFpYlBXCd5
	Vc80wKRt5cHwO3ZNMawAeDHgaYWOyyUYv8Y92uOtIStOe4GwfRgUtpGvBp7GLUz1RCPMxG6MYha8o
	/Kt1hDuUYa3j0V6WwXgbrG2/1kubR1cbOWGivM9o/kl1abdldVQ8ajT1AXwysHD9q1FbBsBNIBAoo
	u+WbFyJZx4yvf1fzOwvbdd+dyBe7WLTAa9k5h4M/9aq6+BQ85vb6DpgS6h1PxE0/umIFJ2wDOOmP3
	YKafTA5DEjvxGFgP0WLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFduB-00HJQV-VI; Mon, 16 Aug 2021 14:48:00 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFdu6-00HJOu-M8
 for linux-riscv@lists.infradead.org; Mon, 16 Aug 2021 14:47:58 +0000
Received: from workstation5.fritz.box
 (ip-88-152-144-157.hsi03.unitymediagroup.de [88.152.144.157])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id C613E3F10B; 
 Mon, 16 Aug 2021 14:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629125261;
 bh=LpKhP3By7l4CvlmRd1gqogt+J8pQf+y6CrU76SUhQKs=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=dYFeJ3aoPTNv6sbQCK+pQUwJpv5M4pE9gr9fshjkgtEu/75igIuCE/djoDetlBozT
 7S/KeG01kXExxGUbPZ8BAuVmRX1q0/MKjCGDVQtvwNt6Be29TZKgOr5ArTzF5i4wQp
 EQzO9XqkxQYtt5FdtttXM86jV3QIPDVzK4WF3GawFNeYgkdq0AAvD4feecOE92WaOs
 jjFnO+pOyCDXGNnEIVFWw9EOZWY5gx9eY6YgLsQeUv3yFZdVYfm0YSnQ7TkNGGu2j9
 6w7vQrzVQWCReXPv13WZ2c7/+QWc3tDrL+F651vkixLT4Ezbu2v+3NaJpcZmy6OMdE
 nVNciKp+8x4IQ==
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH 1/1] riscv: select CONFIG_ARCH_KEEP_MEMBLOCK
Date: Mon, 16 Aug 2021 16:47:28 +0200
Message-Id: <20210816144728.1425121-1-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_074754_893628_3CB17A83 
X-CRM114-Status: UNSURE (   8.56  )
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

For analyzing memory blocks we can either use the memblock=debug command
line argument which creates massive output or a debug file system.

Select CONFIG_ARCH_KEEP_MEMBLOCK to provide a debugfs at
/sys/kernel/debug/memblock to analyze memory blocks. The
same is already done for arm, arm64, mips, powerpc.

The actual provisioning of the file system depends on CONFIG_DEBUG_FS.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 4f7b70ae7c31..a6e57614c3fd 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -31,6 +31,7 @@ config RISCV
 	select ARCH_HAS_STRICT_KERNEL_RWX if MMU && !XIP_KERNEL
 	select ARCH_HAS_STRICT_MODULE_RWX if MMU && !XIP_KERNEL
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
+	select ARCH_KEEP_MEMBLOCK
 	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
 	select ARCH_SUPPORTS_HUGETLBFS if MMU
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
