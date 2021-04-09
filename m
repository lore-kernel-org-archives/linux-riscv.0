Return-Path: <SRS0=YT8n=JG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE46C433ED
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Apr 2021 06:16:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B77E7610C7
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Apr 2021 06:15:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B77E7610C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KGxG2Ou/gVmyyGJkiwM+rn5Zn4WXaie0XpxeBswshX8=; b=bCU9dMSt+muPDVmHgpI6VwRx3W
	6FmTb9qEv9Weh4XdeEC4fgXs+MkluX6t8kM0EW6EZktcUefiSUJ27rOtWXjDSHoi+Ddpo34QZ8zsI
	h61Gl7cqpek7FgTZNCuEtl1l73x3+3Dd/KaH7ZLyVCtwcxHAIkhR1e4e1bAduNVDeDp6XiSfXctGn
	7yyK7cVOw8CDMMK/m5GCcI0ocTz6mwx+B9xMWaaakULnlSqQtrudwp74B6BlUrm9Vvq79nmYLncZc
	BmTdrriB1YPb6C9AQe7VlOCLusQNJ/Ydq8+Ti6UvMYNG1AZmDHM13gShx75vhSnjDCCV+FJgaAA6i
	N923v5OQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUkQl-00AHJ5-1D; Fri, 09 Apr 2021 06:15:47 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUkQS-00AHDb-MD
 for linux-riscv@lists.infradead.org; Fri, 09 Apr 2021 06:15:34 +0000
Received: from localhost.localdomain (105.169.185.81.rev.sfr.net
 [81.185.169.105]) (Authenticated sender: alex@ghiti.fr)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 8D27D10000B;
 Fri,  9 Apr 2021 06:15:12 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Alexander Potapenko <glider@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-arch@vger.kernel.org, linux-mm@kvack.org
Cc: Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH v4 0/3] Move kernel mapping outside the linear mapping
Date: Fri,  9 Apr 2021 02:14:57 -0400
Message-Id: <20210409061500.14673-1-alex@ghiti.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_071531_494787_8D075151 
X-CRM114-Status: GOOD (  16.20  )
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

I decided to split sv48 support in small series to ease the review.

This patchset pushes the kernel mapping (modules and BPF too) to the last
4GB of the 64bit address space, this allows to:
- implement relocatable kernel (that will come later in another
  patchset) that requires to move the kernel mapping out of the linear
  mapping to avoid to copy the kernel at a different physical address.
- have a single kernel that is not relocatable (and then that avoids the
  performance penalty imposed by PIC kernel) for both sv39 and sv48.

The first patch implements this behaviour, the second patch introduces a
documentation that describes the virtual address space layout of the 64bit
kernel and the last patch is taken from my sv48 series where I simply added
the dump of the modules/kernel/BPF mapping.

I removed the Reviewed-by on the first patch since it changed enough from
last time and deserves a second look.

Changes in v4:
- Fix BUILTIN_DTB since we used __va to obtain the virtual address of the
  builtin DTB which returns a linear mapping address, and then we use
  this address before setup_vm_final installs the linear mapping: this
  is not possible anymore since the kernel does not lie inside the
  linear mapping anymore.

Changes in v3:
- Fix broken nommu build as reported by kernel test robot by protecting
  the kernel mapping only in 64BIT and MMU configs, by reverting the
  introduction of load_sz_pmd and by not exporting load_sz/load_pa anymore
  since they were not initialized in nommu config. 

Changes in v2:
- Fix documentation about direct mapping size which is 124GB instead
  of 126GB.
- Fix SPDX missing header in documentation.
- Fix another checkpatch warning about EXPORT_SYMBOL which was not
  directly below variable declaration.

Alexandre Ghiti (3):
  riscv: Move kernel mapping outside of linear mapping
  Documentation: riscv: Add documentation that describes the VM layout
  riscv: Prepare ptdump for vm layout dynamic addresses

Alexandre Ghiti (3):
  riscv: Move kernel mapping outside of linear mapping
  Documentation: riscv: Add documentation that describes the VM layout
  riscv: Prepare ptdump for vm layout dynamic addresses

 Documentation/riscv/index.rst       |  1 +
 Documentation/riscv/vm-layout.rst   | 63 +++++++++++++++++++++
 arch/riscv/boot/loader.lds.S        |  3 +-
 arch/riscv/include/asm/page.h       | 17 +++++-
 arch/riscv/include/asm/pgtable.h    | 37 ++++++++----
 arch/riscv/include/asm/set_memory.h |  1 +
 arch/riscv/kernel/head.S            |  3 +-
 arch/riscv/kernel/module.c          |  6 +-
 arch/riscv/kernel/setup.c           |  5 ++
 arch/riscv/kernel/vmlinux.lds.S     |  3 +-
 arch/riscv/mm/fault.c               | 13 +++++
 arch/riscv/mm/init.c                | 87 ++++++++++++++++++++++-------
 arch/riscv/mm/kasan_init.c          |  9 +++
 arch/riscv/mm/physaddr.c            |  2 +-
 arch/riscv/mm/ptdump.c              | 67 ++++++++++++++++++----
 15 files changed, 265 insertions(+), 52 deletions(-)
 create mode 100644 Documentation/riscv/vm-layout.rst

-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
