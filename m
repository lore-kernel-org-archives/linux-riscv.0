Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E72C5479D
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jan 2023 06:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1ucP6TKA6Bn6v65GZ6pQy5gKMJO+/P0A46bmONYv8aU=; b=YHyEQy0U24mqGM
	n2k6Ey3PWHxi9aIu16V39hPsyc02zgFq0YNosI8c0Hh71zLHZ4+LyRyHDJvBtJy9AWUxoKEoAg+Mc
	ASrM7kalFXPRi8xmRXcPvo1CDoEkDOgng6AfRCuVRSWKiC72R1f6YvmgvmA3k7pKwgcASJreB/HWY
	FhMrfUtri1j9Ea7K8Eb9hEQwscQd2VCXP1L77tI1IZ/vDQTbnN8McY9BY1u2Z8YXBp5+9aKgT904e
	JJPlfLqP2A0hA/nOIt2/V+hLSbg+iy/nVbIe2ShEa8c7x9B4LVKleGszmLlpTZNcAEAaySIvDPjBz
	YE8viwQcn23CJoCkanjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pElaY-00HaKT-Bn; Mon, 09 Jan 2023 06:24:54 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pElaS-00HaI5-Co
	for linux-riscv@lists.infradead.org; Mon, 09 Jan 2023 06:24:51 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id DF58924E035;
	Mon,  9 Jan 2023 14:24:15 +0800 (CST)
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 9 Jan
 2023 14:24:15 +0800
Received: from jsia-virtual-machine.localdomain (60.49.128.133) by
 EXMBX066.cuchost.com (172.16.6.66) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Mon, 9 Jan 2023 14:24:12 +0800
From: Sia Jee Heng <jeeheng.sia@starfivetech.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<jeeheng.sia@starfivetech.com>, <leyfoon.tan@starfivetech.com>,
	<mason.huo@starfivetech.com>
Subject: [PATCH v2 0/3] RISC-V Hibernation Support
Date: Mon, 9 Jan 2023 14:24:04 +0800
Message-ID: <20230109062407.3235-1-jeeheng.sia@starfivetech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [60.49.128.133]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX066.cuchost.com
 (172.16.6.66)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230108_222448_647719_3BD979E8 
X-CRM114-Status: GOOD (  14.50  )
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
- CONFIG_ARCH_RV64I
- CONFIG_64BIT

At high-level, this series includes the following changes:
1) Change suspend_save_csrs() and suspend_restore_csrs()
   to public function as these functions are common to
   suspend/hibernation. (patch 1)
2) Enhance kernel_page_present() function to support huge page. (patch 2)
3) Add arch/riscv low level functions to support
   hibernation/suspend to disk. (patch 3)

The above patches are based on kernel v6.2-rc3 and are tested on
StarFive VF2 SBC board. Hibernation for RV32 and ACPI platform mode are not
supported in this series at the moment.

Changes since v1:
- Rebased to kernel v6.2-rc3
- Fixed bot's compilation error

Sia Jee Heng (3):
  RISC-V: Change suspend_save_csrs and suspend_restore_csrs to public
    function
  RISC-V: mm: Enable huge page support to kernel_page_present() function
  RISC-V: Add arch functions to support hibernation/suspend-to-disk

 arch/riscv/Kconfig                |   8 +
 arch/riscv/include/asm/suspend.h  |  23 ++
 arch/riscv/kernel/Makefile        |   2 +-
 arch/riscv/kernel/asm-offsets.c   |   5 +
 arch/riscv/kernel/hibernate-asm.S | 123 +++++++++++
 arch/riscv/kernel/hibernate.c     | 353 ++++++++++++++++++++++++++++++
 arch/riscv/kernel/suspend.c       |   4 +-
 arch/riscv/mm/pageattr.c          |   6 +
 8 files changed, 521 insertions(+), 3 deletions(-)
 create mode 100644 arch/riscv/kernel/hibernate-asm.S
 create mode 100644 arch/riscv/kernel/hibernate.c


base-commit: 1fe4fd6f5cad346e598593af36caeadc4f5d4fa9
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
