Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E06C25B10
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 07:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FKMLg1YPespQil/EpH7aBulF800pi/zvq6FGi+DpkiI=; b=ZV9h+E+pkI1f7l
	3UvqWFcYP2/5+K9rfJ7+8hpL+s9HytSRcCP2bT5H9nBB896PBnaG4pJTRxBvpDMGnVtNF6z7qT1WX
	JKsuROBu/BXSSCfrR9RiACYjzHG6CoBX7+PcX9OEE3Niwuj6VYRj30PwoNZI0JouZmTRT326rr1e2
	1xf6aI3wljYpr33mNo3UKiVS3wJZCzRCSnY1V0W9su8aXXs3A2I7a0Lg7s9Mt7ZLU8bbfO4K3NSdr
	EP9Yq9MKT/xbJ0foRfPZ1rGG/vFlcxP1zhnpI5YQDup4QdrT4EkUHWHNUnpjTGtqWWgnCgCgP7y39
	j2JPvldz/0xAaD/EyE6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Kk3-00000004N8i-0IGZ;
	Fri, 10 May 2024 07:32:31 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5JkV-00000004DFI-3QIh
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 06:29:13 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1715322531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1sssw5A/ygmjEBxrlSd+7ue0RV3n8+xaY+HzQNbRFGM=;
	b=LZmENFvc4euk2x3YKMDS4vZQ6njaWRRmcZhRv6mhgQDO9hm76yMnLcLAclJllAXzEWI+R8
	DjMXMIQbAuNWUQU6RCme2fe+8LD7SJDor0843GvNcpMwBb9sA10gR33A6RNLBltUFyLQlt
	lKjiK2m6Ogj39GjYZoyhpfijSF4dbf+9rLTNVsC7in6cDBJABquEZBCCWiUZ32OUd6qtHo
	k53H64a5hACVKj3W1eCC8TxXG5DPJVaWvnDRArrrvRJi2mOC8JhxiaUGRLmDCAtk2/P/nd
	zz7c/qo+lPNtYH4bWk6rEBoDWA/SU1RAdM6Mn4T6/KIspEl0mCl5JP29Ao7/tQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1715322531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1sssw5A/ygmjEBxrlSd+7ue0RV3n8+xaY+HzQNbRFGM=;
	b=PR7hUigLr/KX3+deEvAwKob4CebeKY++2BeuPPXpRSX1LmYFaGaHGKwQ9QYnLsI910absd
	h8W+VHwpLEyX2eBg==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 0/7] remove size limit on XIP kernel
Date: Fri, 10 May 2024 08:28:38 +0200
Message-Id: <cover.1715286093.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_232856_199681_4633E3E9 
X-CRM114-Status: UNSURE (   8.09  )
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

Hi,

For XIP kernel, the writable data section is always at offset specified in
XIP_OFFSET, which is hard-coded to 32MB.

Unfortunately, this means the read-only section (placed before the
writable section) is restricted in size. This causes build failure if the
kernel gets too large.

This series remove the use of XIP_OFFSET one by one, then remove this
macro entirely at the end, with the goal of lifting this size restriction.

Also some cleanup and documentation along the way.

This series depends on
    https://lore.kernel.org/linux-riscv/20240508191917.2892064-1-namcao@linutronix.de/
to apply cleanly, and also depends on
    https://lore.kernel.org/linux-riscv/20240508173116.2866192-1-namcao@linutronix.de/
which fixes a boot issue.

Best regards,
Nam

Nam Cao (7):
  riscv: cleanup XIP_FIXUP macro
  riscv: replace va_kernel_pa_offset with va_kernel_data_pa_offset on
    XIP
  riscv: drop the use of XIP_OFFSET in XIP_FIXUP_OFFSET
  riscv: drop the use of XIP_OFFSET in XIP_FIXUP_FLASH_OFFSET
  riscv: drop the use of XIP_OFFSET in kernel_mapping_va_to_pa()
  riscv: drop the use of XIP_OFFSET in create_kernel_page_table()
  riscv: remove limit on the size of read-only section for XIP kernel

 arch/riscv/include/asm/page.h       | 25 ++++++++++++++++++------
 arch/riscv/include/asm/pgtable.h    | 18 +++++++----------
 arch/riscv/include/asm/xip_fixup.h  | 30 +++++++++++++++++++++++------
 arch/riscv/kernel/vmlinux-xip.lds.S |  4 ++--
 arch/riscv/mm/init.c                | 11 +++++++----
 5 files changed, 59 insertions(+), 29 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
