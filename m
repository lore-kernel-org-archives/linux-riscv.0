Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE7FC61DA3
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 02:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SdRaSP05EVRqZHgQtDujhZiKvN9NBZZyelztjgAkprQ=; b=dQ61NwXAwSQ3y1
	zPc9mguwKR/OhKLlmN3cjh8Z683KdwV8EKQy1n944sunIu66uisho0oYDMAkHEHXJsxcnwd8UjDj/
	rriNwnblMPPaDe+nltIpreuw0Pw4vZjf5BcpRGi4JXD+wm6zKpGEbCrvbjb/r933AHsJx39tGxkXH
	MjLRYizH7L5VGjPkbE3lVoc+sFHXLkG/+PMzPcu89FXpuG5K+qALjlMYUNj06PXVHl6pDRKwu2c66
	xgGafj/WmQ9yM6vX/li485Qb9mNRuspZGJZlwFRYuNCTSoT0gPTPWzRApLS29pfVsTAVysm3vQ+Ii
	cyxWZpZbbrTljwpp00yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUIVQ-006JVQ-Pw; Tue, 21 Feb 2023 02:35:48 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUIVM-006JU4-2F
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 02:35:45 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 7B48D24E1E1;
	Tue, 21 Feb 2023 10:35:30 +0800 (CST)
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 21 Feb
 2023 10:35:30 +0800
Received: from jsia-virtual-machine.localdomain (202.188.176.82) by
 EXMBX066.cuchost.com (172.16.6.66) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Tue, 21 Feb 2023 10:35:27 +0800
From: Sia Jee Heng <jeeheng.sia@starfivetech.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<jeeheng.sia@starfivetech.com>, <leyfoon.tan@starfivetech.com>,
	<mason.huo@starfivetech.com>
Subject: [PATCH v4 0/4] RISC-V Hibernation Support
Date: Tue, 21 Feb 2023 10:35:19 +0800
Message-ID: <20230221023523.1498500-1-jeeheng.sia@starfivetech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [202.188.176.82]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX066.cuchost.com
 (172.16.6.66)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_183544_418295_6F8609F7 
X-CRM114-Status: GOOD (  17.21  )
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

Arch specific hibernation header is implemented and is utilized by the
arch_hibernation_header_restore() and arch_hibernation_header_save()
functions. The arch specific hibernation header consists of satp, hartid,
and the cpu_resume address. The kernel built version is also need to be
saved into the hibernation image header to making sure only the same
kernel is restore when resume.

swsusp_arch_resume() creates a temporary page table that covering only
the linear map. It copies the restore code to a 'safe' page, then start to
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
2) Refactor the common code in the __cpu_resume_enter() function and
   __hibernate_cpu_resume() function. The common code are used by
   hibernation and suspend. (patch 2)
3) Enhance kernel_page_present() function to support huge page. (patch 3)
4) Add arch/riscv low level functions to support
   hibernation/suspend to disk. (patch 4)

The above patches are based on kernel v6.2 and are tested on
StarFive VF2 SBC board and Qemu. 
ACPI platform mode is not supported in this series.

Changes since v3:
- Rebased to kernel v6.2
- Temporary page table code refactoring by reference to ARM64
- Resolved typo(s) and grammars
- Resolved documentation errors
- Resolved clang build issue
- Removed unnecessary comments
- Used kzalloc instead of kcalloc

Changes since v2:
- Rebased to kernel v6.2-rc5
- Refactor the common code used by hibernation and suspend
- Create copy_page macro
- Solved other comments from Andrew and Conor

Changes since v1:
- Rebased to kernel v6.2-rc3
- Fixed bot's compilation error

Sia Jee Heng (4):
  RISC-V: Change suspend_save_csrs and suspend_restore_csrs to public
    function
  RISC-V: Factor out common code of __cpu_resume_enter()
  RISC-V: mm: Enable huge page support to kernel_page_present() function
  RISC-V: Add arch functions to support hibernation/suspend-to-disk

 arch/riscv/Kconfig                 |   7 +
 arch/riscv/include/asm/assembler.h |  82 ++++++
 arch/riscv/include/asm/suspend.h   |  22 ++
 arch/riscv/kernel/Makefile         |   1 +
 arch/riscv/kernel/asm-offsets.c    |   5 +
 arch/riscv/kernel/hibernate-asm.S  |  77 +++++
 arch/riscv/kernel/hibernate.c      | 447 +++++++++++++++++++++++++++++
 arch/riscv/kernel/suspend.c        |   4 +-
 arch/riscv/kernel/suspend_entry.S  |  34 +--
 arch/riscv/mm/pageattr.c           |   8 +
 10 files changed, 654 insertions(+), 33 deletions(-)
 create mode 100644 arch/riscv/include/asm/assembler.h
 create mode 100644 arch/riscv/kernel/hibernate-asm.S
 create mode 100644 arch/riscv/kernel/hibernate.c


base-commit: db77b8502a4071a59c9424d95f87fe20bdb52c3a
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
