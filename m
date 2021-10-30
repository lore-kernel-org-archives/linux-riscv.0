Return-Path: <SRS0=We8W=PS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC643C433FE
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Oct 2021 03:17:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0E0660FE7
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Oct 2021 03:17:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A0E0660FE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q1RUMqHOYN0o0rEIYTyWr9vLDUtKrxblOrfJDCOnzJs=; b=LnNHDLffd+krP+
	5/xOB+Pmewb/0WI0dn9efE2AHZpsVC0dyTSRc5EUcMConRwi45419Vj+NExrDFk+tStJDwxZAV77W
	8qWp8mwMN+08hm3nfWaeFo0UrhSN6J9kg6DT87YABSW2RITVqJIOj9bCsddvKa7zAaVXhzvRWO5nj
	JOgDQRQHCz78Xpe8DtlOisfp/uT/VXyVP+dl2IcTN+lo6Esfd15akZX3/ZSWFDJk/xXMI5X+0jvJC
	aGWkrqLLQH70c0WYbYOJ29oEyuJyeJrJHDoCJA7dd2ImxRc+EvFAQj/xGoyTdG72nKGaYK3u7aw1X
	G8hCAOcOP+KwsfJDXcIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgerl-00Cg05-Vo; Sat, 30 Oct 2021 03:17:10 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgere-00CfvW-Km; Sat, 30 Oct 2021 03:17:04 +0000
Received: from dggeme706-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Hh4G20D8pz8vfp;
 Sat, 30 Oct 2021 11:16:42 +0800 (CST)
Received: from huawei.com (10.67.174.53) by dggeme706-chm.china.huawei.com
 (10.1.199.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.15; Sat, 30
 Oct 2021 11:16:47 +0800
From: Liao Chang <liaochang1@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
 <ebiederm@xmission.com>, <mick@ics.forth.gr>, <jszhang@kernel.org>,
 <guoren@linux.alibaba.com>, <penberg@kernel.org>, <sunnanyong@huawei.com>,
 <wangkefeng.wang@huawei.com>, <changbin.du@intel.com>, <alex@ghiti.fr>
CC: <liaochang1@huawei.com>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <kexec@lists.infradead.org>
Subject: [PATCH 0/3] riscv: kexec: add kexec_file_load() support
Date: Sat, 30 Oct 2021 11:18:29 +0800
Message-ID: <20211030031832.165457-1-liaochang1@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.53]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggeme706-chm.china.huawei.com (10.1.199.102)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_201702_970793_826F7C44 
X-CRM114-Status: GOOD (  13.33  )
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

For future work:
* Support for kdump and purgatory.
* Support for kernel image verification.
* Support physical address randomization.

Liao Chang (3):
  kexec_file: Fix kexec_file.c build error for riscv platform
  RISC-V: use memcpy for kexec_file mode
  RISC-V: Add kexec_file support

 arch/riscv/Kconfig                     |  11 ++
 arch/riscv/include/asm/kexec.h         |   4 +
 arch/riscv/kernel/Makefile             |   1 +
 arch/riscv/kernel/elf_kexec.c          | 189 +++++++++++++++++++++++++
 arch/riscv/kernel/machine_kexec.c      |   5 +-
 arch/riscv/kernel/machine_kexec_file.c |  14 ++
 include/linux/kexec.h                  |   2 +-
 kernel/kexec_file.c                    |   4 +-
 8 files changed, 226 insertions(+), 4 deletions(-)
 create mode 100644 arch/riscv/kernel/elf_kexec.c
 create mode 100644 arch/riscv/kernel/machine_kexec_file.c

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
