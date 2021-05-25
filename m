Return-Path: <SRS0=WUGv=KU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E0A6C2B9F8
	for <linux-riscv@archiver.kernel.org>; Tue, 25 May 2021 03:49:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDF4B6140A
	for <linux-riscv@archiver.kernel.org>; Tue, 25 May 2021 03:49:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDF4B6140A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Yfuthzs6H4zFYcAuNcuLoAdiYfRjfdEsU4nW66rohww=; b=MKQ6REN9Ks4OqM
	2MY5WJQ0t8eBHJtZpoYG9yZL4BqIQqC1kO8c4hM6cjP3Rc8h7nIfaKFwdpT5K0TqRxXWIXtdkwPas
	w3GPXAESgj9Bu08ou7V4Oj3xQnCwdfp9Bp7AtDXxOWABscnVLeyb3mo5mpruYCEQLP/2VZvDV/Id2
	4XD1bBcBtd2tNhVZZ/H/ZqogCIHeqz1GR5abVpbw9Gb0iLCS9MWQVfbz0HzrmijYNsDVxKc/7+3vt
	LuUrPq/MZ2JSpYYkpwpakLfFfLhNSRqw4CoI1Wk4NVRTrkicDdAQMf5015sWNNtRemFAsPfxLdHtA
	OOj1/hREeIhLtFlQmokw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llO3i-003CyD-2h; Tue, 25 May 2021 03:48:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1llN6G-002zEj-18
 for linux-riscv@lists.infradead.org; Tue, 25 May 2021 02:47:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 491FF613F5;
 Tue, 25 May 2021 02:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621910839;
 bh=idAratzNTXPgcm61LdWO/f8aWakVRytFHu0GjCWMvLo=;
 h=From:To:Cc:Subject:Date:From;
 b=jzkgyT3GM9/C4MyH0ZehSbxHe//2BASxk8pYw3ziq54naHYtRIfoEXtbZjd9U4pFt
 2P5I04cQ40m4m6B+TWs7ydTKnDV7lz9pYtYDi1UcwzrMtDwkNSj9ULDPeI7D5bjTar
 XT5UW3bKZRJFwn3OOeJ5lhNK2R2931UCFZC7Qer5PWbjFTyi6VJspgb00XBdJg8A29
 aB/LHouaCOzV8UgGftJKvJXIZlh9QhdUuIUcZcSCdOLbM7aMFoSGjhu7ZYJPbP0oIv
 Hu8YWcG6tWQyN7aKUSrEguuqXQhcPWMdydmhrXjHHXWc4qgrm1CigrAH/6CfOcIwgI
 ca9W0gSJF9K1g==
From: guoren@kernel.org
To: guoren@kernel.org, anup.patel@wdc.com, palmerdabbelt@google.com,
 arnd@arndb.de
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V2 0/2] riscv: Fixup asid_allocator remaining issues
Date: Tue, 25 May 2021 02:46:25 +0000
Message-Id: <1621910787-34598-1-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_194720_129811_E54CD11D 
X-CRM114-Status: UNSURE (   5.30  )
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

Changes since v1:
 - Drop PAGE_UP wrong fixup
 - Rebase on clean linux-5.13-rc2
 - Add Reviewed-by

Guo Ren (2):
  riscv: Fixup _PAGE_GLOBAL in _PAGE_KERNEL
  riscv: Use use_asid_allocator flush TLB

 arch/riscv/include/asm/mmu_context.h |  2 ++
 arch/riscv/include/asm/pgtable.h     |  3 ++-
 arch/riscv/include/asm/tlbflush.h    | 22 ++++++++++++++++++++
 arch/riscv/mm/context.c              |  2 +-
 arch/riscv/mm/tlbflush.c             | 40 +++++++++++++++++++++++++++++++++---
 5 files changed, 64 insertions(+), 5 deletions(-)

-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
