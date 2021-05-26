Return-Path: <SRS0=lIhr=KV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B73AAC2B9F7
	for <linux-riscv@archiver.kernel.org>; Wed, 26 May 2021 05:50:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 812BD610FA
	for <linux-riscv@archiver.kernel.org>; Wed, 26 May 2021 05:50:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 812BD610FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q+QzGexvnNyGcH49KMZ5C9vJnLVDazcyz60WCrNS8Bs=; b=pgRQ8XIaFn0vRL
	NdUXrwMLZOZgm5/E6SsBGKls6DsEazISU/1B+FToTtH6gwLYVfIZH//tjPqgxzpleLK3CVFiovpBs
	leRMj5wrdQHfJDt4nFA9xnTwr87zb1MSA6nuLn2Afm/uywSDipFn6SpZaPma8UO2Y0vrj1AgKxQw4
	6HblkYFWBiX0CG6nJ6tyNP6MWGsysktDWHJlJHg/aUSvmmw5IRNS5RWSLS5FNDI0Cauis07jNb3nw
	OYL2DOuGEEWW4C618LxUUPQ76Z5/06q+ZWB7wppkhcViMyM4dzZMBWGdFUPGEyrQikrOGtpehhahU
	WMKIadhEfBxltYYqp/0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llmQm-00BJT6-C5; Wed, 26 May 2021 05:50:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llmQh-00BJRF-IK
 for linux-riscv@lists.infradead.org; Wed, 26 May 2021 05:50:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E67EC610FA;
 Wed, 26 May 2021 05:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622008207;
 bh=yg8uTrr5bqsFHycHlXp37eTENi2y2zpYczTQ5Z9dzMo=;
 h=From:To:Cc:Subject:Date:From;
 b=EK6P9VU0nqF+SfGzh9yMPK4b23HaXiiD4pfBwQHmfB3JJM3pKD7bgr3tQ8KlkVE1u
 53h3xtq2ncsP8wTuN/tRlMrVplN8GNa3NQCD5jiyr8QBaKth4MJWo685JzbL0CCMk5
 jl0IQwkpOuWSWygGUwj6/RrE5bRnKcZBV0iAL79+5ezzZuq44P5k5oS22o6lHJx4dl
 5KiLoyXgvus7uB+WowOU7I8JaJen/S/T8FOfQxNOHxQJrCf0i9muqAtAenNUe7lBoQ
 vSgKPXKmV4H7zdP3ZKJ9h7WRNEvNsRofebeLKYMBSY8NxTeV+VBK96zmBETW/GJCNv
 SPIO2IQo4bCPQ==
From: guoren@kernel.org
To: guoren@kernel.org, anup.patel@wdc.com, palmerdabbelt@google.com,
 arnd@arndb.de, hch@lst.de
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V4 0/2] riscv: Fixup asid_allocator remaining issues
Date: Wed, 26 May 2021 05:49:19 +0000
Message-Id: <1622008161-41451-1-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_225007_650385_B54C297C 
X-CRM114-Status: UNSURE (   5.69  )
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

The patchset fixes the remaining problems of asid_allocator.
 - Fixup _PAGE_GLOBAL for kernel virtual address mapping
 - Optimize tlb_flush with asid & range

Changes since v3:
 - Optimize coding convention for
   "riscv: Use use_asid_allocator flush TLB"

Changes since v2:
 - Remove PAGE_UP/DOWN usage in tlbflush.h
 - Optimize variable name

Changes since v1:
 - Drop PAGE_UP wrong fixup
 - Rebase on clean linux-5.13-rc2
 - Add Reviewed-by

Guo Ren (2):
  riscv: Fixup _PAGE_GLOBAL in _PAGE_KERNEL
  riscv: Use use_asid_allocator flush TLB

 arch/riscv/include/asm/mmu_context.h |  2 ++
 arch/riscv/include/asm/pgtable.h     |  3 ++-
 arch/riscv/include/asm/tlbflush.h    | 23 ++++++++++++++++++
 arch/riscv/mm/context.c              |  2 +-
 arch/riscv/mm/tlbflush.c             | 46 +++++++++++++++++++++++++++++++++---
 5 files changed, 71 insertions(+), 5 deletions(-)

-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
