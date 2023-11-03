Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6979C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 15:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iMlINUDkTuIFDvUCBZzwNUvMk4vQ/s43e4IpO1jBaIw=; b=Cc6x0uhLzy0QIY
	wrrq3GZSaYLULPu0ngB+LZAaQcjUWjUZpI6dO+uPKRFwgGlaH54cP39s5hbA+6JvvRepUq3/3VXD/
	LJ0DxEk1kdUUPkrBDsPKnQ7ZzTmfbwH6U6pQ2WqlEObgTGPSZIhYLbjWa3xskOGDu9vgRp3N2AaL+
	BrhPMBlBI1fNUqInGGHVuu1qKKzFTaAFhW2jYZ0Liv+VHycoy0T0i9wz+6SeZN2HvA1Fig7nz4F8L
	Ny+1O6iTDYozWUS6WfG/qxIelNW9JqNSwNcawrkdrUEwZ+8qocbCIxN1wIbf/TT/nJRUGu5b7lXpP
	VGB9g54d5Z4CK+0ysGNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qywYZ-00BjDP-23;
	Fri, 03 Nov 2023 15:57:59 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qywYS-00Bj5i-0N
	for linux-riscv@lists.infradead.org;
	Fri, 03 Nov 2023 15:57:57 +0000
X-QQ-mid: bizesmtp78t1699027037tibjddzq
Received: from main2-ubuntu.tail147f4.ts.net ( [202.201.15.117])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 03 Nov 2023 23:57:14 +0800 (CST)
X-QQ-SSF: 01200000000000B06000000A0000000
X-QQ-FEAT: QityeSR92A0CP7ledumJcL/YcFg/S2vCRasLnx4V41TLMZugGiWPhdXyRvEjd
	NU48y/mVScgRq0fQozHdMCgD4Xnou/kbN39qvapr+jCESqwElCbQD54Ib/JBgMdsLkB96UB
	M3jhs9MFqlqy2shevC4BLkj/hf6npz1vl8J6spTtbn4BVbDAnNWUHTcXRHaW/ppO0M60ae3
	Js6L8NjWL5oHz8R3iTbMVYCFm5OMNnFgs7EM1Y0lH9RFylCi3Krfhdqc9Ktp4e9UlZ63HNs
	TrnY+TU8JL/R1brTVWiAb6dX7W7wXxfeSF0XwINpSFbxJjKtpPiOusLQjvWJLBZWQJ2c1zF
	XvDr/++U8V9kUDk7qZmnFbFnnW+xV+++Cbc13mk
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3192958384466937205
From: Yuan Tan <tanyuan@tinylab.org>
To: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	luc.vanoostenryck@gmail.com,
	linux-sparse@vger.kernel.org
Cc: linux@weissschuh.net,
	palmer@rivosinc.com,
	paul.walmsley@sifive.com,
	paulburton@kernel.org,
	paulmck@kernel.org,
	tim.bird@sony.com,
	tsbogend@alpha.franken.de,
	w@1wt.eu,
	tanyuan@tinylab.org,
	i@maskray.me
Subject: [PATCH v1 00/14] DCE/DSE: Add Dead Syscalls Elimination support, part2
Date: Fri,  3 Nov 2023 23:56:35 +0800
Message-Id: <cover.1699025537.git.tanyuan@tinylab.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_085752_457872_B423985A 
X-CRM114-Status: GOOD (  12.00  )
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

This series aims to add Dead Code Elimination(DCE) based Dead Syscalls
Elimination(DSE) support, here is the RFC patchset[1]. The whole series
includes three parts, here is the Part2.

Part1 adds basic DCE based DSE support [5].

Part3 will add DSE test support with nolibc-test.c.

This Part2 further eliminates the unused syscalls forcely kept by the
exception tables. This is just a preliminary approach and requires a lot
of discussion and modifications.

Some syscalls use put_user()/get_user() to access memory from
user-space, the exception tables are added for such memory addresses to
fixup potential exceptions fairily.

These exception tables are added by the simple '.pushsection' directive
and there is no explicit section relationship between them and their
syscall functions, So, all of such tables are explicitly kept by the
KEEP() directive in vmlinux.lds, but such forcely KEEP() operations
prevent DCE from eliminating their syscall functions for the tables used
some addresses in their syscall functions, the insn and fixup addresses
(arch/riscv/include/asm/asm-extable.h) are from their syscall functions,
as a result, the ownership reverses.

To further eliminate such syscalls, we must fix up this ownership
reversal issue. At first, the KEEP() operations must be removed from
vmlinux.lds, but at the same time, we must find a way to tell ld the
real ownership between the syscalls and their exceptions tables.

Fortunately, under the guidance of Zhangjin Wu, I discovered that both
SHF_GROUP and SHF_LINK_ORDER can be helpful for such targets ([6] [7]
[8]), but the former method triggers a warning from as. The binary files
compiled using both methods turn out to be identical. So maybe we just
choose the later one?

This series adds a very elementary level of patchset to demonstate how
to use them to drop KEEP() for all of the exception tables, only for
RISC-V currently.

This may also be a good start for us to rethink the widely used KEEP().
This approach can thoroughly eliminate orphan sections, providing the
compiler with more information. Eventually, most of the KEEP() calls
can be eliminated.

The nolibc-test based initrd run well on riscv64 kernel image with dead
syscalls eliminated:

    $ nm build/riscv64/virt/linux/v6.6-rc2/vmlinux | grep "T __riscv_sys" | grep -v sys_ni_syscall | wc -l
    40

These options should be enabled:

    CONFIG_LD_DEAD_CODE_DATA_ELIMINATION=y
    CONFIG_LD_DEAD_CODE_DATA_ELIMINATION_DEBUG=y
    CONFIG_TRIM_UNUSED_SYSCALLS=y
    CONFIG_SECTION_SHF_LINK_ORDER_SUPPORT=y
    CONFIG_USED_SYSCALLS="sys_dup sys_dup3 sys_ioctl sys_mknodat sys_mkdirat sys_unlinkat sys_symlinkat sys_linkat sys_mount sys_chdir sys_chroot sys_fchmodat sys_fchownat sys_openat sys_close sys_pipe2 sys_getdents64 sys_lseek sys_read sys_write sys_pselect6 sys_ppoll sys_exit sys_sched_yield sys_kill sys_reboot sys_getpgid sys_prctl sys_gettimeofday sys_getpid sys_getppid sys_getuid sys_geteuid sys_brk sys_munmap sys_clone sys_execve sys_mmap sys_wait4 sys_statx"

Or using section group intead of section link order:

    CONFIG_SECTION_SHF_GROUP_SUPPORT=y

Thanks to Song Fangrui's idea [9] of SHF_LINK_ORDER. To be honest, this
part is hard to understand, and there may be some mistakes in my
solutions. Welcome your further advice. :)

Besides, I want to express my thanks to Zhangjin Wu, Zhiming Xu, Anqi
Xiao, Jun Kong, and Yuzhe Ling for their help during the investigation
stage.

Best Regards,
Yuan Tan

---
[1]: https://lore.kernel.org/lkml/cover.1676594211.git.falcon@tinylab.org/
[2]: https://lore.kernel.org/lkml/234017be6d06ef84844583230542e31068fa3685.1676594211.git.falcon@tinylab.org/
[3]: https://lore.kernel.org/lkml/CAFP8O3+41QFVyNTVJ2iZYkB0tqnvdLTAoGShgGy-qPP1PHjBEw@mail.gmail.com/
[4]: https://lore.kernel.org/lkml/cbcbfbb37cabfd9aed6088c75515e4ea86006cff.1676594211.git.falcon@tinylab.org/
[5]: https://lore.kernel.org/lkml/cover.1695679700.git.falcon@tinylab.org/
[6]: https://maskray.me/blog/2021-07-25-comdat-and-section-group
[7]: https://maskray.me/blog/2021-01-31-metadata-sections-comdat-and-shf-link-order
[8]: https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html
[9]: https://sourceware.org/pipermail/binutils/2023-July/128521.html

Yuan Tan (10):
  DCE/DSE: add HAVE_SECTION_SHF_LINK_ORDER_SUPPORT option
  DCE/DSE: add HAVE_SECTION_SHF_GROUP_SUPPORT option
  DCE/DSE: add HAVE_SECTION_NO_KEEP_SUPPORT option
  DCE/DSE: add choice of methods to build reference for orphan sections
  DCE/DSE: inhibit .size directive for SHF_GROUP
  DCE/DSE: riscv: make every ex_table's name unique
  DCE/DSE: riscv: build reference for .pushsection in C functions
  DCE/DSE: riscv: build reference for .pushsection in assembly
  DCE/DSE: add SECTION_NO_KEEP_SUPPORT option
  DCE/DSE: vmlinux.lds.h: allow NO_KEEP on __ex_table sections

Zhangjin Wu (4):
  DCE/DSE: allow keep unique bounded sections
  compiler: add a global __QUITE_UNIQUE_ID()
  compiler: add unique __SECTION_NAME()
  compiler: add unique LABEL_NAME()

 Makefile                             |  3 ++
 arch/riscv/include/asm/asm-extable.h | 43 +++++++++++++---
 arch/riscv/lib/uaccess.S             | 60 +++++++++++-----------
 include/asm-generic/vmlinux.lds.h    | 28 ++++++++---
 include/linux/compiler.h             | 25 ++++++++++
 include/linux/compiler_types.h       |  8 +--
 init/Kconfig                         | 74 ++++++++++++++++++++++++++++
 7 files changed, 193 insertions(+), 48 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
