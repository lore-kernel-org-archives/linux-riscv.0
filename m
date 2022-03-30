Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45681C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Mar 2022 08:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OgWb388JWU9dulkIsQIyW/4yH88YHZ9bj0DudKRz6Hw=; b=Yyh2fsPWqTyh/e
	ugYcKHsxO8ymNU6QFsYDAEy2cOP6mTCZvcJzcHkB3u+8nbaJahanBlK/OPn37+6o79XXHAoXWCso7
	YhMznJ67/rUwoKkivoynr0AepES8dfFbX3MAAhyI0TW3wQpyPTwSH60BbKeABjXgdQYNcmxb9E5O3
	hoUIqefVz6F2SImLB00HLGuOKq9gpIjPRdjK6Pu78ZpUbAvQuSDSEC0VFNJXg+6b+9V+uGzAJIkQV
	agfRNBuAgvcwcvS3pkt4YAEkexf4SmA0xvf3zjPp63DgWr+asOkHcZqTiwXZzUuro18+nnZfoJAyl
	Oz5dlosRU2SZfuUSTPng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZTXB-00ElBM-Fc; Wed, 30 Mar 2022 08:18:29 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZTWW-00Ekjt-Nn; Wed, 30 Mar 2022 08:17:51 +0000
Received: from kwepemi500014.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KSzll6Kr6zgYDd;
 Wed, 30 Mar 2022 16:16:03 +0800 (CST)
Received: from huawei.com (10.67.174.157) by kwepemi500014.china.huawei.com
 (7.221.188.232) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Wed, 30 Mar
 2022 16:17:42 +0800
From: Li Zhengyu <lizhengyu3@huawei.com>
To: <liaochang1@huawei.com>
CC: <alex@ghiti.fr>, <aou@eecs.berkeley.edu>, <bjorn.topel@gmail.com>,
 <changbin.du@intel.com>, <ebiederm@xmission.com>, <guoren@linux.alibaba.com>, 
 <jszhang@kernel.org>, <kexec@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <mick@ics.forth.gr>, <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
 <penberg@kernel.org>, <sunnanyong@huawei.com>, <wangkefeng.wang@huawei.com>
Subject: [PATCH v2 -next 0/6] riscv: kexec: add kexec_file_load() support
Date: Wed, 30 Mar 2022 16:16:55 +0800
Message-ID: <20220330081701.177026-1-lizhengyu3@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.157]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500014.china.huawei.com (7.221.188.232)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_011749_181300_A0368A00 
X-CRM114-Status: GOOD (  12.99  )
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

This patchset implement kexec_file_load() support on riscv, Most of the
code is based on the kexec-tool-patch repo developed by Nick Kossifids.

This patch series enables us to load the riscv vmlinux by specifying
its file decriptor, instead of user-filled buffer via kexec_file_load()
syscall.
``
Contrary to kexec_load() system call, we reuse the dt blob of the first
kernel to the 2nd explicitly.

To use kexec_file_load() system call, instead of kexec_load(), at kexec
command, '-s' options must be specified. The patch for kexec_tools has
to be apply to riscv architecture source like this:

int elf_riscv_load(int argc, char **argv, const char *buf, off_t len,
	...
	if (info->file_mode) {
		return prepare_kexec_file_options(info);
	}
	...

Add following routine to prepare cmdline_ptr, cmdline_len and initrd_fd
for syscall kexec_file_load:

int prepare_kexec_file_options(struct kexec_info *info)
{
	int fd;
	ssize_t result;
	struct stat stats;

	if (arch_options.cmdline) {
		info->command_line = (char *)arch_options.cmdline;
		info->command_line_len = strlen(info->command_line) + 1;
	}

	if (!arch_options.initrd_path) {
		info->initrd_fd = -1;
		return 0;
	}

	fd = open(arch_options.initrd_path, O_RDONLY | _O_BINARY);
	if (fd < 0) {
		fprintf(stderr, "Cannot open `%s': %s\n", arch_options.initrd_path,
				strerror(errno));
		return -EINVAL;
	}
	result = fstat(fd, &stats);
	if (result < 0) {
		close(fd);
		fprintf(stderr, "Cannot stat: %s: %s\n", arch_options.initrd_path,
				strerror(errno));
		return -EINVAL;
	}
	info->initrd_fd = fd;
	return 0;
}

The basic usage of kexec_file is:
1) Reload capture kernel image:
$ kexec -s -l <riscv-vmlinux> --reuse-cmdline

2) Startup capture kernel:
$ kexec -e

For kdump:
1) Reload capture kernel image:
$ kexec -s -p <riscv-vmlinux> --reuse-cmdline

2) Do something to crash, like:
$ echo c > /proc/sysrq-trigger

v2:
 * Support kdump
 * Support purgatory
 * Minor cleanups

Li Zhengyu (3):
  RISC-V: Support for kexec_file on panic
  RISC-V: Add purgatory
  RISC-V: Load purgatory in kexec_file

Liao Chang (3):
  kexec_file: Fix kexec_file.c build error for riscv platform
  RISC-V: use memcpy for kexec_file mode
  RISC-V: Add kexec_file support

 arch/riscv/Kbuild                      |   2 +
 arch/riscv/Kconfig                     |  17 +
 arch/riscv/include/asm/kexec.h         |   4 +
 arch/riscv/kernel/Makefile             |   1 +
 arch/riscv/kernel/elf_kexec.c          | 448 +++++++++++++++++++++++++
 arch/riscv/kernel/machine_kexec.c      |   4 +-
 arch/riscv/kernel/machine_kexec_file.c |  14 +
 arch/riscv/purgatory/.gitignore        |   4 +
 arch/riscv/purgatory/Makefile          |  95 ++++++
 arch/riscv/purgatory/entry.S           |  47 +++
 arch/riscv/purgatory/purgatory.c       |  42 +++
 include/linux/kexec.h                  |   2 +-
 kernel/kexec_file.c                    |   4 +-
 13 files changed, 680 insertions(+), 4 deletions(-)
 create mode 100644 arch/riscv/kernel/elf_kexec.c
 create mode 100644 arch/riscv/kernel/machine_kexec_file.c
 create mode 100644 arch/riscv/purgatory/.gitignore
 create mode 100644 arch/riscv/purgatory/Makefile
 create mode 100644 arch/riscv/purgatory/entry.S
 create mode 100644 arch/riscv/purgatory/purgatory.c

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
