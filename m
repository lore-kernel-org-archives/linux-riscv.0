Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10882C3DA7A
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 06:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q13HcRpHwI7jU2nlI+wg/okKyKvSfmYLwvdIzgFpS9Q=; b=JgYKS0Io2boo9w
	UtEI95s7o9kZlwKfeHfSJkJjwwKyirBvknsREaK8RpYB17OR2D6byHm+aonmlCAEbaL+76GYSsibx
	hSF+1zIlszk3a+9OnR8XYJoF2fyv0W8ewmIYer+l49ktZZbwXbGE0ja+w15/SpJ/wPmtRGnroluxS
	2Cm4dc126dfooq+PLhxKXmxYjSYlIAPCWWJ53f94aie4k5SXBzkdoUG+/SRMIOQt78nsJ72T7qbRz
	fma1VHmMHrZBvQKBi14MhZkEW9V5cNEbkWGSTtocxK6t1AU/uY0wqcKNeKqmXO5tGNMgHGuqRm913
	gfl7x6pa6TFXxwTIh/hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDfsI-002uXI-F9; Fri, 06 Jan 2023 06:06:42 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDfs4-002pPY-EU
	for linux-riscv@lists.infradead.org; Fri, 06 Jan 2023 06:06:38 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 7583424E035;
	Fri,  6 Jan 2023 14:05:45 +0800 (CST)
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 6 Jan
 2023 14:05:45 +0800
Received: from jsia-virtual-machine.localdomain (202.188.176.82) by
 EXMBX066.cuchost.com (172.16.6.66) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Fri, 6 Jan 2023 14:05:41 +0800
From: Sia Jee Heng <jeeheng.sia@starfivetech.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<jeeheng.sia@starfivetech.com>, <leyfoon.tan@starfivetech.com>,
	<mason.huo@starfivetech.com>
Subject: [PATCH 0/3] RISC-V Hibernation Support
Date: Fri, 6 Jan 2023 14:05:32 +0800
Message-ID: <20230106060535.104321-1-jeeheng.sia@starfivetech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [202.188.176.82]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX066.cuchost.com
 (172.16.6.66)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_220633_434086_14105F98 
X-CRM114-Status: GOOD (  13.98  )
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

This series adds RISC-V Hibernation/suspend to disk support.
Low level Arch functions were created to support hibernation.
swsusp_arch_suspend() relies code from __cpu_suspend_enter() to write
cpu state onto the stack, then calling swsusp_save() to save the memory
image.

arch_hibernation_header_restore() and arch_hibernation_header_save()
functions are implemented to prevent kernel crash when resume,
the kernel built version is saved into the hibernation image header
to making sure only the same kernel is restore when resume.

swsusp_arch_resume() creates a temporary page table that covering only
the linear map, copies the restore code to a 'safe' page, then start to
restore the memory image. Once completed, it restores the original
kernel's page table. It then calls into __hibernate_cpu_resume()
to restore the CPU context. Finally, it follows the normal hibernation
path back to the hibernation core.

To enable hibernation/suspend to disk into RISCV, the below config
need to be enabled:
- CONFIG_ARCH_HIBERNATION_HEADER
- CONFIG_ARCH_HIBERNATION_POSSIBLE


At high-level, this series includes the following changes:
1) Change suspend_save_csrs() and suspend_restore_csrs()
   to public function as these functions are common to
   suspend/hibernation. (patch 1)
2) Enhance kernel_page_present() function to support huge page. (patch 2)
3) Add arch/riscv low level functions to support
   hibernation/suspend to disk. (patch 3)

The above patches are based on kernel v6.2-rc2 and are tested on
Starfive VF2 SBC board.

Sia Jee Heng (3):
  RISC-V: Change suspend_save_csrs and suspend_restore_csrs to public
    function
  RISC-V: mm: Enable huge page support to kernel_page_present() function
  RISC-V: Add arch functions to support hibernation/suspend-to-disk

 arch/riscv/Kconfig                |   7 +
 arch/riscv/include/asm/suspend.h  |  23 ++
 arch/riscv/kernel/Makefile        |   2 +-
 arch/riscv/kernel/asm-offsets.c   |   5 +
 arch/riscv/kernel/hibernate-asm.S | 123 +++++++++++
 arch/riscv/kernel/hibernate.c     | 353 ++++++++++++++++++++++++++++++
 arch/riscv/kernel/suspend.c       |   4 +-
 arch/riscv/mm/pageattr.c          |   6 +
 8 files changed, 520 insertions(+), 3 deletions(-)
 create mode 100644 arch/riscv/kernel/hibernate-asm.S
 create mode 100644 arch/riscv/kernel/hibernate.c


base-commit: 1f5abbd77e2c1787e74b7c2caffac97def78ba52
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
