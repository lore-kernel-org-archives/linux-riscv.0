Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C931C64EC4
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Mar 2023 08:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BuXQtC8zr4y+cH/6bZGur/tHfo6lttSnLoSZR2dQQbA=; b=I1yBcFDGsBnGKr
	mGMu4C6n14hgEthV++/yVbTTG66IKFw86KT8ljckAGFQinJyNH4VWnbkW219uENN03MG1/p5AiwQ9
	iecxKf1Dag2++5fXw5XFq4Ei0tGAmRIL6bp77ryy8r4eHtvauk578XAxj96iIf4RwvvLG5BsHJXqZ
	+LbARwK1cHviZB/MaJKRIJDfoL1T49M6NFWlTtYm7fsckJPlcvRrb8pP1M65T9NH434wxgu822GcK
	8HS1e6CfkQU2mBu/jTGkHM4+MdYPRxIsm2mvAGBfC9wzP2BD2IQr1xND9JIXLyyoAQFNQz7ShznHB
	PcBy0/pgWLDUDmwIfr6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZopM-003typ-Ti; Wed, 08 Mar 2023 08:07:12 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZopK-003tnr-8D
	for linux-riscv@lists.infradead.org; Wed, 08 Mar 2023 08:07:11 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 90EE124DBBD;
	Wed,  8 Mar 2023 16:06:21 +0800 (CST)
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 8 Mar
 2023 16:06:21 +0800
Received: from jsia-virtual-machine.localdomain (202.188.176.82) by
 EXMBX066.cuchost.com (172.16.6.66) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Wed, 8 Mar 2023 16:06:19 +0800
From: Sia Jee Heng <jeeheng.sia@starfivetech.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<jeeheng.sia@starfivetech.com>, <leyfoon.tan@starfivetech.com>,
	<mason.huo@starfivetech.com>
Subject: [PATCH v5 0/4] RISC-V Hibernation Support
Date: Wed, 8 Mar 2023 16:06:08 +0800
Message-ID: <20230308080612.122398-1-jeeheng.sia@starfivetech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [202.188.176.82]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX066.cuchost.com
 (172.16.6.66)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_000710_599047_DF5C492D 
X-CRM114-Status: GOOD (  17.11  )
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

The above patches are based on kernel v6.3-rc1 and are tested on
StarFive VF2 SBC board and Qemu. 
ACPI platform mode is not supported in this series.

Changes since v4:
- Rebased to kernel v6.3-rc1
- Resolved typo(s)
- Removed unnecessary helper function
- Removed unnecessary "addr" local variable
- Removed typecast of 'int'
- Used def_bool HIBERNATION
- Used "mv a0, zero" instead of "add a0, zero, zero"
- Make linear region as executable and writable when restoring the
  image

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

 arch/riscv/Kconfig                 |   6 +
 arch/riscv/include/asm/assembler.h |  82 ++++++
 arch/riscv/include/asm/suspend.h   |  22 ++
 arch/riscv/kernel/Makefile         |   1 +
 arch/riscv/kernel/asm-offsets.c    |   5 +
 arch/riscv/kernel/hibernate-asm.S  |  77 ++++++
 arch/riscv/kernel/hibernate.c      | 424 +++++++++++++++++++++++++++++
 arch/riscv/kernel/suspend.c        |   4 +-
 arch/riscv/kernel/suspend_entry.S  |  34 +--
 arch/riscv/mm/pageattr.c           |   8 +
 10 files changed, 630 insertions(+), 33 deletions(-)
 create mode 100644 arch/riscv/include/asm/assembler.h
 create mode 100644 arch/riscv/kernel/hibernate-asm.S
 create mode 100644 arch/riscv/kernel/hibernate.c


base-commit: 63355b9884b3d1677de6bd1517cd2b8a9bf53978
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
