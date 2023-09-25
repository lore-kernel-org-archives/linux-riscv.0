Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BC5CE79A7
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 22:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MnKB6MOZioYYGIx7hcyHcwIfLUziZMA+XaCCxgPfjBY=; b=bkHSIhOVEiMOrV
	Qqju4NUV4k6Hq4Q5JoeosXiIFCrsxtjogatCa8oYbjwsaWzB7f+Lf+cQzPR2yBlDelFjVFvBBGhkL
	2hWIYoTbAmrkR8E5bj3HrpPHaXTQALFEa1vI/MbI8ZmH+sIJwDz1rxRV8kcB0Iaf/QPZ1PIVmbD65
	grmSSBdZObCGRslekn5cbHVsI1IM+MUmoJLvKK8XC47GmU67L/a8b23JaXhuadupVtFZ3hTJ4fKtr
	iZ/JfpIjN30Uj3XlfKidBWwQ98eR/KqMvAS7ayU5yyQ0cK4GbJRnYvOqnBEkZcvAB21JSqB9CBP58
	3zUIFSPb1HeP65g5mWxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qku9d-00F90R-1Y;
	Mon, 25 Sep 2023 22:34:13 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qku9Y-00F8zO-0o
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 22:34:11 +0000
X-QQ-mid: bizesmtp81t1695681226tcihg9u5
Received: from linux-lab-host.localdomain ( [116.30.124.152])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 26 Sep 2023 06:33:44 +0800 (CST)
X-QQ-SSF: 01200000000000E0Y000B00A0000000
X-QQ-FEAT: mRz6/7wsmIhEdtJxEM3+86IjQT+Q2BIK68FoSWVkt5uacFvPZnMVGdTic5nTs
	yFZ0ibzgKsflWJT5L40MNO8tEShlHRSZXfPwo1fDK1vqatDKo41I1IcSCrqiVhPV3R730IR
	pGGbPSYS+zsSxMPHTdxpa5tYEQ5bid0+GVFXPgKxc958NIK+3X2yS09DZdjKtvv+ZgGgu7o
	TjD9ZGoNdbjLgdkWbeFwPWuG3Ix9bFnm9YzgcMo2/xX+um7cPVbTgxCUiYcCO1ji2JSBSDg
	W1QAoXySxRkRiichVOSgMt1ehzqHAV2HQiK/pIpW8o7df+gBQPQwGFGwlddP3v0GSA2kNcT
	V2gskPCLhmWYivb0+S/GRjN4K3Tpg==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1329585511254707149
From: Zhangjin Wu <falcon@tinylab.org>
To: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>
Cc: falcon@tinylab.org,
	palmer@rivosinc.com,
	paul.walmsley@sifive.com,
	paulburton@kernel.org,
	paulmck@kernel.org,
	tsbogend@alpha.franken.de,
	w@1wt.eu,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Tim Bird <tim.bird@sony.com>
Subject: [PATCH v1 0/7] DCE/DSE: Add Dead Syscalls Elimination support, part1
Date: Tue, 26 Sep 2023 06:33:44 +0800
Message-Id: <cover.1695679700.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_153408_640333_1263C4E3 
X-CRM114-Status: GOOD (  11.54  )
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

This series aims to add DCE based DSE support, here is the first
revision of the RFC patchset [1], the whole series includes three parts,
here is the Part1.

This Part1 adds basic DCE based DSE support.

Part2 will further eliminate the unused syscalls forcely kept by the
exception tables.

Part3 will add DSE test support with nolibc-test.c.

Changes from RFC patchset [1]:

- The DCE support [2] for RISC-V has been merged [3]
- The "nolibc: Record used syscalls in their own sections" [4] will be
  delayed to Part3

- Add debug support for DCE
- Further allows CONFIG_USED_SYSCALLS accept a file stores used syscalls
- Now, only accepts symbolic syscalls, not support integral number again
- Works with newly added riscv syscalls suffix: __riscv_
- Further trims the syscall tables by removing the tailing invalid parts

The nolibc-test based initrd run well on riscv64 kernel image with dead
syscalls eliminated:

    $ nm build/riscv64/virt/linux/v6.6-rc2/vmlinux | grep "T __riscv_sys" | grep -v sys_ni_syscall | wc -l
    48

These options should be enabled:

    CONFIG_LD_DEAD_CODE_DATA_ELIMINATION=y
    CONFIG_LD_DEAD_CODE_DATA_ELIMINATION_DEBUG=y
    CONFIG_TRIM_UNUSED_SYSCALLS=y
    CONFIG_USED_SYSCALLS="sys_dup sys_dup3 sys_ioctl sys_mknodat sys_mkdirat sys_unlinkat sys_symlinkat sys_linkat sys_mount sys_chdir sys_chroot sys_fchmodat sys_fchownat sys_openat sys_close sys_pipe2 sys_getdents64 sys_lseek sys_read sys_write sys_pselect6 sys_ppoll sys_exit sys_sched_yield sys_kill sys_reboot sys_getpgid sys_prctl sys_gettimeofday sys_getpid sys_getppid sys_getuid sys_geteuid sys_brk sys_munmap sys_clone sys_execve sys_mmap sys_wait4 sys_statx"

The really used syscalls:

    $ echo "sys_dup sys_dup3 sys_ioctl sys_mknodat sys_mkdirat sys_unlinkat sys_symlinkat sys_linkat sys_mount sys_chdir sys_chroot sys_fchmodat sys_fchownat sys_openat sys_close sys_pipe2 sys_getdents64 sys_lseek sys_read sys_write sys_pselect6 sys_ppoll sys_exit sys_sched_yield sys_kill sys_reboot sys_getpgid sys_prctl sys_gettimeofday sys_getpid sys_getppid sys_getuid sys_geteuid sys_brk sys_munmap sys_clone sys_execve sys_mmap sys_wait4 sys_statx" | tr ' ' '\n' | wc -l
    40

Thanks to Yuan Tan, he has researched and verified the elimination of
the unused syscalls forcely kept by the exception tables, both section
group and section link order attributes of ld work. part2 will be sent
out soon to further remove another 8 unused syscalls and eventually we
are able to run a dead loop application on a kernel image without
syscalls.

Best Regards,
Zhangjin Wu

---
[1]: https://lore.kernel.org/lkml/cover.1676594211.git.falcon@tinylab.org/
[2]: https://lore.kernel.org/lkml/234017be6d06ef84844583230542e31068fa3685.1676594211.git.falcon@tinylab.org/
[3]: https://lore.kernel.org/lkml/CAFP8O3+41QFVyNTVJ2iZYkB0tqnvdLTAoGShgGy-qPP1PHjBEw@mail.gmail.com/
[4]: https://lore.kernel.org/lkml/cbcbfbb37cabfd9aed6088c75515e4ea86006cff.1676594211.git.falcon@tinylab.org/

Zhangjin Wu (7):
  DCE: add debug support
  DCE/DSE: add unused syscalls elimination configure support
  DCE/DSE: Add a new scripts/Makefile.syscalls
  DCE/DSE: mips: add HAVE_TRIM_UNUSED_SYSCALLS support
  DCE/DSE: riscv: move syscall tables to syscalls/
  DCE/DSE: riscv: add HAVE_TRIM_UNUSED_SYSCALLS support
  DCE/DSE: riscv: trim syscall tables

 Makefile                                      |  3 +
 arch/mips/Kconfig                             |  1 +
 arch/mips/kernel/syscalls/Makefile            | 23 ++++++-
 arch/riscv/Kconfig                            |  1 +
 arch/riscv/include/asm/unistd.h               |  2 +
 arch/riscv/kernel/Makefile                    |  7 +-
 arch/riscv/kernel/syscalls/Makefile           | 69 +++++++++++++++++++
 .../{ => syscalls}/compat_syscall_table.c     |  4 +-
 .../kernel/{ => syscalls}/syscall_table.c     |  4 +-
 init/Kconfig                                  | 49 +++++++++++++
 scripts/Makefile.syscalls                     | 29 ++++++++
 11 files changed, 182 insertions(+), 10 deletions(-)
 create mode 100644 arch/riscv/kernel/syscalls/Makefile
 rename arch/riscv/kernel/{ => syscalls}/compat_syscall_table.c (82%)
 rename arch/riscv/kernel/{ => syscalls}/syscall_table.c (83%)
 create mode 100644 scripts/Makefile.syscalls

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
