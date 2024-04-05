Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96158C67861
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Apr 2024 17:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:Message-ID:To:From:CC:Subject:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=2AsF9G0MQ4C9iyvXIE10cnpyFbgnAZUrJjGxUwbZ2Io=; b=UVB
	HKxJ+XwzssDTFiUTahEJ7vZwPxkYYxy94ZvaXWQu6MAbOLDvCZ5FWtN58ONAr+wvhqS4KRfxnK0eA
	X7HPnHi9ZvhafoezdxUZCzFhuRf/bhp10B+Ao5diiZqeP4gjwrNEMO2GfWeUrSSYE6+DEWbVREpSY
	tqGGGUPeXjIe36k2ALP1/7XMrJfy7/6+sZ+ytad7htHjRR9ZGDm1Ssf5zHNE7NVbZx+faNlXf3d/C
	bGS8LRW/SnP5UL1p9UXMJBKTppZCKZA3i3e/sewsrXWX17B3iw0jH+wmQ7dCIW9IZH9Zhk6426JRj
	Eo7xcnj8N4NmIiE/9zo5IPD078FvnEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsnNb-00000008Eco-2Syv;
	Fri, 05 Apr 2024 17:29:31 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsnNX-00000008EbY-3ITG
	for linux-riscv@lists.infradead.org;
	Fri, 05 Apr 2024 17:29:29 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6eaf1a3e917so2107093b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 05 Apr 2024 10:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712338166; x=1712942966; darn=lists.infradead.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YO5f4h758dBNmiDAJhldDYKOhisPvEGqSyQ4iiERmME=;
        b=LDBcACaXCz1RZKXamwbcYE296bRz2CPCNb+aWe+fnTXkZ+SCH/SgAH4FRndlAgdrd1
         q93OwN3+xfjSZGH+qKwnP3YoMdOQjOa5Y67hGeeVQarRgIcltPYx8Tou3v82se3gHfrM
         BvEQVE9JyqVOtAO0yQV9FOLfPZoahtXV2umV8Xd0WooTiIym2TcANpFN2eDtP7navUo5
         YHQfu93K1eMglHYSxnlKugVjBIeGwIUY1AoOKI5Rk1Gf3miaCg7iZM0Lk9uBNP5Z9NAP
         VTq0eie2eUvMZnhpsLZo0/+UHMTNxtkSLPy4hAajsXG8+Amaw8pTFrzkYKmq55ux7b6x
         PKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712338166; x=1712942966;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YO5f4h758dBNmiDAJhldDYKOhisPvEGqSyQ4iiERmME=;
        b=ipBtqOZikWi9KUnK1uCNMnhi7XIqgxXxYgxf3CHcV6EuOGFHXsUxtu+waaeFYT6d5U
         WnJnMnzpiGN09tR21EFgkA3LN5UbCO+Ndtoe2dGI6i/fJ/8c662/ECAcMKKQug8AblJG
         h3hrDSg5dMsQLpEDJcjYAl7iX0V3rSuMxtaDpm0g1UntiSK7pln9iY5z4tmYXM6w3par
         w/mE0oJLi3Xn2ZaQNPWwAuMNn5yRepXGhKRbv26DEk6EAld1vPafhkA26ytAo6pXxqiQ
         dmnfhyVNJVmVJGFQ90s8ec9CkNRS/r8f9g4RAsRkF9T9omeiOTnlzbNTzYjB6pB2n3+z
         4QWA==
X-Gm-Message-State: AOJu0YyqX5ZhmQ42Ps/kianFSgltlB5QhjdKktRF1LKseB+7EGKaLVMn
	AGki+r/PUvQZxABjcnKZQ5e3QtaH0rCg/Z1eS+8VN/xbBo4eZQvC+34+Ug5J2rVWozPI27chL5p
	E
X-Google-Smtp-Source: AGHT+IE2251VrHWLZ0prAu7SSHn+DVyi5u3CH3BVvNzid0hoXLca2RkLGi9W3l4saSgMej+DT+662w==
X-Received: by 2002:a05:6a00:22d1:b0:6ec:fdcc:3cce with SMTP id f17-20020a056a0022d100b006ecfdcc3ccemr2388441pfj.5.1712338165463;
        Fri, 05 Apr 2024 10:29:25 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id x7-20020a056a00188700b006ecfe20d38csm1759033pfh.30.2024.04.05.10.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 10:29:24 -0700 (PDT)
Date: Fri, 05 Apr 2024 10:29:24 -0700 (PDT)
X-Google-Original-Date: Fri, 05 Apr 2024 10:18:39 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 6.9-rc3
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-28e73e09-0100-4e0e-8c4a-490552b42c6f@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_102927_848753_CFED2D3F 
X-CRM114-Status: UNSURE (   9.00  )
X-CRM114-Notice: Please train this message.
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5066200057906141573=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5066200057906141573==
Content-Type: text/plain

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.9-rc3

for you to fetch changes up to d14fa1fcf69db9d070e75f1c4425211fa619dfc8:

  riscv: process: Fix kernel gp leakage (2024-04-04 12:35:05 -0700)

----------------------------------------------------------------
RISC-V Fixes for 6.9-rc3

* A fix for an __{get,put}_kernel_nofault to avoid an uninitialized
  value causing spurious failures.
* compat_vdso.so.dbg is now installed to the standard install location.
* A fix to avoid initializing PERF_SAMPLE_BRANCH_*-related events, as
  they aren't supported and will just later fail.
* A fix to make AT_VECTOR_SIZE_ARCH correct now that we're providing
  AT_MINSIGSTKSZ.
* pgprot_nx() is now implemented, which fixes vmap W^X protection.
* A fix for the vector save/restore code, which at least manifests as
  corrupted vector state when a signal is taken.
* A fix for a race condition in instruction patching.
* A fix to avoid leaking the kernel-mode GP to userspace, which is a
  kernel pointer leak that can be used to defeat KASLR in various ways.
* A handful of smaller fixes to build warnings, an overzealous printk,
  and some missing tracing annotations.

----------------------------------------------------------------
Alexandre Ghiti (2):
      riscv: Fix warning by declaring arch_cpu_idle() as noinstr
      riscv: Disable preemption when using patch_map()

Andreas Schwab (1):
      riscv: use KERN_INFO in do_trap

Björn Töpel (1):
      riscv: Fix vector state restore in rt_sigreturn()

Jisheng Zhang (1):
      riscv: mm: implement pgprot_nx

Masahiro Yamada (2):
      riscv: compat_vdso: install compat_vdso.so.dbg to /lib/modules/*/vdso/
      riscv: compat_vdso: align VDSOAS build log

Pu Lehui (1):
      drivers/perf: riscv: Disable PERF_SAMPLE_BRANCH_* while not supported

Sami Tolvanen (1):
      riscv: Mark __se_sys_* functions __used

Samuel Holland (2):
      riscv: mm: Fix prototype to avoid discarding const
      riscv: Fix spurious errors from __get/put_kernel_nofault

Stefan O'Rear (1):
      riscv: process: Fix kernel gp leakage

Victor Isaev (1):
      RISC-V: Update AT_VECTOR_SIZE_ARCH for new AT_MINSIGSTKSZ

Vladimir Isaev (1):
      riscv: hwprobe: do not produce frtace relocation

 arch/riscv/Makefile                      |  2 +-
 arch/riscv/include/asm/pgtable.h         |  6 ++++++
 arch/riscv/include/asm/syscall_wrapper.h |  3 ++-
 arch/riscv/include/asm/uaccess.h         |  4 ++--
 arch/riscv/include/uapi/asm/auxvec.h     |  2 +-
 arch/riscv/kernel/compat_vdso/Makefile   |  2 +-
 arch/riscv/kernel/patch.c                |  8 ++++++++
 arch/riscv/kernel/process.c              |  5 +----
 arch/riscv/kernel/signal.c               | 15 ++++++++-------
 arch/riscv/kernel/traps.c                |  2 +-
 arch/riscv/kernel/vdso/Makefile          |  1 +
 arch/riscv/mm/tlbflush.c                 |  4 ++--
 drivers/perf/riscv_pmu.c                 |  4 ++++
 13 files changed, 38 insertions(+), 20 deletions(-)


--===============5066200057906141573==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5066200057906141573==--
