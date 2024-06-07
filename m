Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E7EC27C53
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jun 2024 20:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Dw2DpNrkYsh1YWgk1Gm26Ycit/azswXcPUcMKJ5MXAs=; b=J0QYceeqCEl4fb
	sKI0fU4E4eO+e0CDUT0oL2MAXrWfMvXMQg/hNLKXX6l1cv6O6cc3wZZUmNGCZWLqLHEjYHo0h3i+H
	zXL/TZnuVYHRRTIzcvH5EvOM36jOc6acY5eKrtk82sLu+ui12UeIGeyM/4sBVrnCckO8cAIenekjc
	3F/0aoB8hUyxS87oVQW6Nid5ZCLj6XUfDxVIx9rftVn2DivlSEKofdzIJB0enVFlf+rRRKjASckxZ
	RaNd889BEDuGE1C3e3k0TM/t+klXsR7wf5tV1pgX9CzDSxFg275441sXhBJag6TC9hS/GG0JA0ALz
	wiXYJ9hqtLngAdS3wnDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFg6R-0000000FVSs-2woc;
	Fri, 07 Jun 2024 20:22:23 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFg6L-0000000FVQ0-2iIP
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jun 2024 20:22:21 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1717791734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=95PpUWaV62SsrnL0BPckok51h7bQ1MXWT68WtYsi6ZU=;
	b=KDmLcRrDD/geGDzKxZ7XAY0NSrzjB5ssHpXsodTzg2B5lqPgH3Degn0hcmblSkD3yt9twq
	Owlh9AEmDQexYrtRhMyfuhQW7gQ6is3I67r7OFRndJfA9vB18ko1kUdJxXS4n9dXJJ1pE3
	S4SVaJtWc00v2nNxE2SIHnCD0roOtHB9vuEdRw0P7alD4srihU8ai6H2fimZzUgBkh9E/P
	iP7sfYbk5xCORBxjGIXwTDHVBs6SYud0sp9cgaJ+4vGVQB/PhlsniDV6FfOWzUJeBmJrl5
	u79H9dsry7buSvCifWTC3y38x7+Ix0vcy7XOAnCOAaOPjutzER9OBMNaEGWAyA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1717791734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=95PpUWaV62SsrnL0BPckok51h7bQ1MXWT68WtYsi6ZU=;
	b=kkEBxDTwLGDhUmHWmppMYOcw4k9zSfrUSiHwbrf3F4PLLWFPVNOD1g7RNXufuykyhtquEx
	rCgxUBbJC/+m0pBw==
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/8] remove size limit on XIP kernel
Date: Fri,  7 Jun 2024 22:22:05 +0200
Message-Id: <cover.1717789719.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_132217_869746_A7749C98 
X-CRM114-Status: UNSURE (   9.21  )
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

v2: address all Alex's comments (thanks Alex!). This includes the addition of a
new patch (riscv: don't export va_kernel_pa_offset in vmcoreinfo for XIP kernel),
which fix a build failure if CONFIG_VMCORE_INFO=y

Best regards,
Nam

Nam Cao (8):
  riscv: cleanup XIP_FIXUP macro
  riscv: don't export va_kernel_pa_offset in vmcoreinfo for XIP kernel
  riscv: replace misleading va_kernel_pa_offset on XIP kernel
  riscv: drop the use of XIP_OFFSET in XIP_FIXUP_OFFSET
  riscv: drop the use of XIP_OFFSET in XIP_FIXUP_FLASH_OFFSET
  riscv: drop the use of XIP_OFFSET in kernel_mapping_va_to_pa()
  riscv: drop the use of XIP_OFFSET in create_kernel_page_table()
  riscv: remove limit on the size of read-only section for XIP kernel

 arch/riscv/include/asm/page.h       | 29 ++++++++++++++++++++--------
 arch/riscv/include/asm/pgtable.h    | 18 +++++++----------
 arch/riscv/include/asm/set_memory.h |  2 +-
 arch/riscv/include/asm/xip_fixup.h  | 30 +++++++++++++++++++++++------
 arch/riscv/kernel/vmcore_info.c     |  7 +++++++
 arch/riscv/kernel/vmlinux-xip.lds.S |  5 +++--
 arch/riscv/mm/init.c                | 13 ++++++++-----
 7 files changed, 71 insertions(+), 33 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
