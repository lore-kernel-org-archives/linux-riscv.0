Return-Path: <SRS0=WUGv=KU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92F19C2B9F8
	for <linux-riscv@archiver.kernel.org>; Tue, 25 May 2021 12:26:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52C5D61409
	for <linux-riscv@archiver.kernel.org>; Tue, 25 May 2021 12:26:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52C5D61409
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QCRZJ6eRRYtxCzyja+YmHd0fk9rYXeto+AZdq/uPkis=; b=Awgxh4jSrbLVDD
	HMxiTNmeW5ay/z6PqBzLaWb0ya0Zon7Dy4G7k7VsOAshD4nTEx6Nilv//PWTqKENQB9tCUo5yRF7v
	b3QKRc/aAGck3nUpi0Tgyjo6k7FdcotV1g2KbSltsTXw/gqkcFE1RoDNlNkxOU1+AEoME89R5pR70
	K9/MCWTQt0IujnnwVXLbU/PYAa+IZoortolj16cDWRAz2BMXX7EYdI+N+fx2Vkoj0vQ2E1BoojduW
	IlLoZe1WTkLXml/+UqGU4s/yp+PSg/ETaT0Xqr7OapbmxTMfyvUEqjbRyoI1l8YiTIpSZ48ueqCtw
	lKpYMPRenSmCsoxhT27A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llW8O-00518d-76; Tue, 25 May 2021 12:26:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llW7E-0050ef-7I
 for linux-riscv@lists.infradead.org; Tue, 25 May 2021 12:24:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B559D61409;
 Tue, 25 May 2021 12:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621945495;
 bh=kTICQpWTbjTcpQWhVugJHEfXiH/3wCrrriPNXPOkttw=;
 h=From:To:Cc:Subject:Date:From;
 b=El4UawTPYLEjOubsZ760YYIv6i9zWEW9P015m+Qk/oKYQGYFis2uosnXZbX4cew1z
 IO15KdNgaIh1Uj1Idle3GR6y0Ms2RLXUNKUgE3KMtVxbNf4M1uaj9Dmd5bIw3pSrBv
 g8WDJ+pTfUaCbqH58p0elfBYECgXnlyW6xWJ1iYP28d4Vn6CfL3eDK9mwl5FnJriA+
 CCY7KOTb56QoBqRi/iJjJXTvrBDaJdMT87rWtP6t+Ovpd6+frD5ZCgE+YcoqI2YZop
 c004SKao/40ZNZIfO9OddIb9T3LAD9sQtaL9XUZ7MRJIOqZ40+dvdWhYUovJ8HofNE
 lSnw9GHL6dmbw==
From: guoren@kernel.org
To: guoren@kernel.org, anup.patel@wdc.com, palmerdabbelt@google.com,
 arnd@arndb.de, hch@lst.de
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V3 0/2] riscv: Fixup asid_allocator remaining issues
Date: Tue, 25 May 2021 12:24:05 +0000
Message-Id: <1621945447-38820-1-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_052456_329449_05BBE870 
X-CRM114-Status: UNSURE (   5.70  )
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
 arch/riscv/include/asm/tlbflush.h    | 21 +++++++++++++++++++
 arch/riscv/mm/context.c              |  2 +-
 arch/riscv/mm/tlbflush.c             | 40 +++++++++++++++++++++++++++++++++---
 5 files changed, 63 insertions(+), 5 deletions(-)

-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
