Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC24ECA1013
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Sep 2025 01:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-ID:Content-Type:
	MIME-Version:Message-ID:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OTj7HENo6eAtwHGQ6yGjOqfWPVIqoPm77hMFFg4/aTk=; b=Dk1TFdTAM5+bd/
	tzNBnGzaTMVSgjFUF3l3JtWzRlSAOFV7QxBxDsNG5CsnoIyqsLSLaVJkhuWswL1PBmhLkqWUFgoXF
	XUHDibue8MmEb19rFhoCl5xfaSf/kr97oAVw69OgLoZjRQ8GtCrO5wgesZNcRtHwxPQK1097xETYR
	8RC+nQmZjeHAzHYypjVlBaD1dLq1w9Zs6D3kbJUi1Nr5xPyh+wpIa0sMGfTN1F0GPNaBwJLgT9JYv
	r7GpWf7xiPGeLyk7+y9j4vvellw0Vek2mcEa4622PMGMhNB2caRvEcBGkrhWM1cK+D81BjchKN7yl
	KbdVcTX0jQpvhiUfMIqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuhh0-00000005s21-3OZR;
	Sat, 06 Sep 2025 01:26:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuejR-00000004xQZ-0dlO
	for linux-riscv@lists.infradead.org;
	Fri, 05 Sep 2025 22:16:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 055E4601AA;
	Fri,  5 Sep 2025 22:16:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D9D1C4CEF1;
	Fri,  5 Sep 2025 22:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757110591;
	bh=hiM3beF3fv5uGn3U41IG6n+nmzc1UenQ5CJyz/l9OE4=;
	h=Date:From:To:cc:Subject:From;
	b=Gl0twtyfvuDZHWL7ztRp01L1BmA/zS0azuZ5pyhFedqa8CfRYFFOXH3FSw+oeb2WX
	 LJUAtkFpjRpwRm/q8P0eeRIrVjizvx3EwuYU1t/e1ViMM6QRevTivmdAC+UaGwujaJ
	 eyj8bHCE4rZZ6xj5TReHLwp6Jq8rkOMy8vvw+N3XEC5OAjXShUfs754SJBxItsjiMb
	 lWkEKwCRlrwkjsduucdFq/xf2x0acvdcfWaQljtzpRQc5pqtKAXSMNxfhaCgwLUycW
	 LvZTrdAatXv64covL8M4b+5GW+jeluAU1G2jr1OhGtkbGCf15qcSXHkOljWI+WpF8o
	 iWNsqB2LMsvkw==
Date: Fri, 5 Sep 2025 16:16:30 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: torvalds@linux-foundation.org
cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V updates for v6.17-rc5
Message-ID: <053b276c-b22b-f3e7-6c11-abe61b8ee36b@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1855849172-1757110411=:9369"
Content-ID: <bda0ad22-1471-ad2a-586f-25bbb3716178@kernel.org>
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1855849172-1757110411=:9369
Content-Type: text/plain; CHARSET=ISO-8859-2
Content-Transfer-Encoding: 8BIT
Content-ID: <a503a4c4-6dc8-b783-034c-98483ca7fdfa@kernel.org>

Linus,

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-6.17-rc5

for you to fetch changes up to a03ee11b8f850bd008226c6d392da24163dfb56e:

  riscv: Fix sparse warning about different address spaces (2025-09-05 15:33:52 -0600)

----------------------------------------------------------------
Several RISC-V fixes for v6.17-rc5:

- An LTO fix for clang when building with CONFIG_CMODEL_MEDLOW

- A fix for ACPI CPPC CSR read/write return values

- Several fixes for incorrect access widths in thread_info.cpu reads

- A fix for an issue in __put_user_nocheck() that was causing the glibc
  tst-socket-timestamp test to fail

- A fix to initialize struct kexec_buf records in several kexec-related
  functions, which were generating UBSAN warnings

- Two fixes for sparse warnings

----------------------------------------------------------------
Alexandre Ghiti (2):
      riscv: Fix sparse warning in __get_user_error()
      riscv: Fix sparse warning about different address spaces

Anup Patel (1):
      ACPI: RISC-V: Fix FFH_CPPC_CSR error handling

Aurelien Jarno (1):
      riscv: uaccess: fix __put_user_nocheck for unaligned accesses

Breno Leitao (1):
      riscv: kexec: Initialize kexec_buf struct

Nathan Chancellor (1):
      riscv: Only allow LTO with CMODEL_MEDANY

Radim Krèmáø (4):
      riscv: use lw when reading int cpu in new_vmalloc_check
      riscv, bpf: use lw when reading int cpu in BPF_MOV64_PERCPU_REG
      riscv, bpf: use lw when reading int cpu in bpf_get_smp_processor_id
      riscv: use lw when reading int cpu in asm_per_cpu

 arch/riscv/Kconfig                     | 2 +-
 arch/riscv/include/asm/asm.h           | 2 +-
 arch/riscv/include/asm/uaccess.h       | 8 ++++----
 arch/riscv/kernel/entry.S              | 2 +-
 arch/riscv/kernel/kexec_elf.c          | 4 ++--
 arch/riscv/kernel/kexec_image.c        | 2 +-
 arch/riscv/kernel/machine_kexec_file.c | 2 +-
 arch/riscv/net/bpf_jit_comp64.c        | 4 ++--
 drivers/acpi/riscv/cppc.c              | 4 ++--
 9 files changed, 15 insertions(+), 15 deletions(-)
--8323329-1855849172-1757110411=:9369
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-1855849172-1757110411=:9369--

