Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D81C636CC
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Feb 2023 00:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aLBG51OlYqQ64jGUjDR7F1gVZRX88pt9NTIA1VRYm+4=; b=WYyAHfdsvt5HLg
	m6UgJ9yBr5QHHc1oCToOE3JHM/pBV0N2Y+vqjVnekR3pTVyGDW0F5q2JwM5OmWeDgi8ViiY0GXTeN
	dXOdQDaWbKnoDcKP2g/QajzYJjmPZpHjJH6tmrtAy3XnffTbfqtn318jzQCrDzboAMxIs7VkXDwIM
	nk7DGWt2ZFdhLfnVGw0rEMNNbIhtE2trDEplVIE5JBWSITCoywo8NDjYjs9IJTZ0dY5A8ozk461cc
	/vRPfehPFEyrnHSH04/9VJOi+l2rk6kk3ZEm53kWnKzgV4BllAPLQip7qiDKJvJ96UgOf/vGryhNI
	oZVJR6K1oqW2GWM6FltQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSoxN-00CFfo-KI; Fri, 17 Feb 2023 00:50:33 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSoxI-00CFc0-CQ
	for linux-riscv@lists.infradead.org; Fri, 17 Feb 2023 00:50:30 +0000
X-QQ-mid: bizesmtp76t1676594968txapoplj
Received: from localhost.localdomain ( [116.30.131.224])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 17 Feb 2023 08:49:27 +0800 (CST)
X-QQ-SSF: 01200000000000C0T000000A0000000
X-QQ-FEAT: XBN7tc9DADICBB7k9+bU2BGS/LL6SOD01z1AvX6M7TbM1IcrrUquN8VoZSqxR
	z7Nk+jrerltyFZKM69igDS4EKfCoEx4eH6SS0q3im5pC77mpjTus7/qkaA/0Ohf5qWxBiSC
	4Hu8t+EjNzV8mnlaxl1RoP2a/5sdzMO7dKFr4PtGFbPx5rSV0crjKNH4ttqQ0A/7z7SWxWg
	aMh+cL67CSCH4xi5C/PYiEmJeaIhgaE2hjsHbq5zyRgiIf199tLovOH5MfKhtGcX+ZRBUtS
	/F5sSaWtSDT54mwaeY3AWMVidSPEJQFeZ4yEZQ1Ona/TpGryQoxiRjY8ah9acgpXRU6BL00
	6KmZ3DS5NXoEdmkiTnOykaFz6Cu8YR/8elR/E2knszdeujRYJlXTp5UEK5Y9VGt5LfrcCrG
X-QQ-GoodBg: 0
From: Zhangjin Wu <falcon@tinylab.org>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Willy Tarreau <w@1wt.eu>,
	Paul Burton <paulburton@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Nicholas Mc Guire <hofrat@osadl.org>,
	Zhangjin Wu <falcon@tinylab.org>
Subject: [RFC PATCH 0/5] Add dead syscalls elimination support
Date: Fri, 17 Feb 2023 08:49:20 +0800
Message-Id: <cover.1676594211.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_165029_052698_96019914 
X-CRM114-Status: GOOD (  12.54  )
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

Hi, all

CONFIG_HAVE_LD_DEAD_CODE_DATA_ELIMINATION allows to eliminate dead code
and data, this patchset allows to further eliminate dead syscalls which
are not used in target system.

It includes 5 patches:

- syscall: Allow configure used system calls

  This adds a new CONFIG_SYSCALLS_USED option to allow users or tools to
  tell kernel what syscalls are used in target system. A list of
  used syscalls can be passed to it.

- MIPS: Add dead syscalls elimination support

  Add CONFIG_SYSCALLS_USED support for mips, it simply adds a 'used'
  variant for the syscall*.tbl and accordingly updates the kernel apis
  and eventually the sys_call_table. The unused ones in the table are
  replaced by sys_ni_syscall and therefore if they are also not used by
  kernel itself, they will be eliminated by gc-sections.

  The old architectures use syscall*.tbl, so, they can use this method.

- RISC-V: Enable dead code elimination

  Select HAVE_LD_DEAD_CODE_DATA_ELIMINATION for riscv.

- RISC-V: Add dead syscalls elimination support

  Add CONFIG_SYSCALLS_USED support for riscv, it simply adds a 'used'
  variant for the *syscall_table.c and eventually the sys_call_table.

  The new architectures use generic unistd.h, they can use this method.

- nolibc: Record used syscalls in their own sections

  This allows to record syscalls used by a nolibc based application. It
  is possible to eliminate dead syscalls automatically while building
  the monolithic kernel+nolibc software.

Testing shows, on both mips and riscv, with a small config, gc-sections
shrinks ~10% and syscalls_used shrinks another ~5%.

This patchset is only a prototype implementation, welcome your feedback
and suggestion, Thanks.

Related emails:

- Re: Re: Kernel-only deployments
  https://lore.kernel.org/lkml/20230216130935.37976-1-falcon@tinylab.org/

- Re: Re: RISC-V: Enable dead code elimination
  https://lore.kernel.org/linux-riscv/Y+qSBu3YZH0JPY4I@spud/T/#t

Best Regards,
- Zhangjin Wu

---

Zhangjin Wu (5):
  syscall: Allow configure used system calls
  MIPS: Add dead syscalls elimination support
  RISC-V: Enable dead code elimination
  RISC-V: Add dead syscalls elimination support
  nolibc: Record used syscalls in their own sections

 arch/mips/Kconfig                   |  1 +
 arch/mips/kernel/syscalls/Makefile  | 24 ++++++++-
 arch/riscv/Kconfig                  |  2 +
 arch/riscv/kernel/Makefile          |  5 +-
 arch/riscv/kernel/syscalls/Makefile | 38 ++++++++++++++
 arch/riscv/kernel/vmlinux.lds.S     |  2 +-
 init/Kconfig                        | 22 +++++++++
 tools/include/nolibc/Makefile       |  2 +-
 tools/include/nolibc/arch-aarch64.h | 17 ++++---
 tools/include/nolibc/arch-arm.h     | 15 +++---
 tools/include/nolibc/arch-i386.h    | 17 ++++---
 tools/include/nolibc/arch-mips.h    | 15 +++---
 tools/include/nolibc/arch-riscv.h   | 17 ++++---
 tools/include/nolibc/arch-x86_64.h  | 17 ++++---
 tools/include/nolibc/arch.h         |  2 +
 tools/include/nolibc/record.h       | 77 +++++++++++++++++++++++++++++
 16 files changed, 226 insertions(+), 47 deletions(-)
 create mode 100644 arch/riscv/kernel/syscalls/Makefile
 create mode 100644 tools/include/nolibc/record.h

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
