Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAAB8C021A0
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 04:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EgwSMCKgJx3m78S2rTQjfWyNSA9bKkxtpyn6uSUnm7I=; b=jYkKi15sQODXbl
	6+sjk1dED2IyPrPVCusMrO9v6gdlqUw2yY+q0qSSAQEpvPDuvGWaijZtTm+Ktse6r1mkDkWL7/oOL
	OAKTo6JtvMl/baqQNG5zMjyWFS26BN/mMPPF1zrTITkA/lQYseL/5m9Y4wmGd+xXJ50pxeZgslVeP
	Yx9iEI08hwruVnAO4AP3aEfCJyD7yqk86ovT8QDMZlKufxkFZ4/KFM5zbva6/c9YAkmFAv4BKA7Lb
	wbuxFvaB7+kKnkhpM/bTrJdKCHA7P6cZMEjrwZRBPv4IY6p8IVaShjCESq76dUQijXzGUZaZDQTo/
	s/hTErtfPvD5Ooj88ziw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjsld-00000003Ely-2WcJ;
	Mon, 17 Feb 2025 04:30:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjsee-00000003DI1-2lsb;
	Mon, 17 Feb 2025 04:22:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B9871D14;
	Sun, 16 Feb 2025 20:23:07 -0800 (PST)
Received: from a077893.blr.arm.com (unknown [10.162.16.135])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6ADA33F59E;
	Sun, 16 Feb 2025 20:22:44 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Cc: steven.price@arm.com,
	christophe.leroy@csgroup.eu,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mark Rutland <mark.rutland@arm.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org
Subject: [PATCH V2 4/5] mm: Make DEBUG_WX depdendent on GENERIC_PTDUMP
Date: Mon, 17 Feb 2025 09:52:19 +0530
Message-Id: <20250217042220.32920-5-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250217042220.32920-1-anshuman.khandual@arm.com>
References: <20250217042220.32920-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_202248_739322_3ACEA00D 
X-CRM114-Status: UNSURE (   7.45  )
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

DEBUG_WX selects PTDUMP_CORE without even ensuring that the given platform
implements GENERIC_PTDUMP. This problem has been latent until now, as all
the platforms subscribing ARCH_HAS_DEBUG_WX also subscribe GENERIC_PTDUMP.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 mm/Kconfig.debug | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/Kconfig.debug b/mm/Kconfig.debug
index 41a58536531d..a51a1149909a 100644
--- a/mm/Kconfig.debug
+++ b/mm/Kconfig.debug
@@ -186,6 +186,7 @@ config ARCH_HAS_DEBUG_WX
 config DEBUG_WX
 	bool "Warn on W+X mappings at boot"
 	depends on ARCH_HAS_DEBUG_WX
+	depends on GENERIC_PTDUMP
 	depends on MMU
 	select PTDUMP_CORE
 	help
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
