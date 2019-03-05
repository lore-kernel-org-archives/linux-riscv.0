Return-Path: <SRS0=mVee=RI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA0B4C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2019 21:42:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9D9320652
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2019 21:42:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pBbLoYPC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="cmMwmE5h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9D9320652
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DwIOFc705GQEzpXunDhfjSpOfqLspXlzTxb+PI3ZQdo=; b=pBbLoYPCF14xBg
	AN30Y0A2UYl08jgqyNcxtk2/0LHnNdrHau8F5vj8W2Gzt3OzreCrpMo4y2O5kzj8bYQY286TDD1Uc
	+MKLCjJTsVyc8UEcFUtD4rKDivdTKcwdB8Eeqmv3tVWMWkm9d0TyTajuUPuOe7SM2Qnw4lh92BEdA
	PuPHJyRCaAfVi6mkyrJCNpdM4tqFu7Ztwxv7eFgEu1dyVF8vWHGmI6vUVzGKKZNnKvJjlFBXBBCVq
	PbqsmO6fkJIwRSa51Lt7duY5Ak4k/8E6objrkYHtEFZ07JEFkfFkFGSauDuVCt/rsDyBX+9mWFSRn
	fMTo9V/8EYmi9o1COoPA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1HpM-0000oV-7z; Tue, 05 Mar 2019 21:42:20 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1HpJ-0000nv-0M
 for linux-riscv@lists.infradead.org; Tue, 05 Mar 2019 21:42:18 +0000
Received: by mail-pf1-x443.google.com with SMTP id a3so6692046pff.11
 for <linux-riscv@lists.infradead.org>; Tue, 05 Mar 2019 13:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:cc:from:to:message-id;
 bh=XURuyW4/0JZAXwwF07kDW5Wg7eJQuF769RkLAzybchM=;
 b=cmMwmE5hRXltE/EMpYVzv+VQlE6r+VIfifz3v4IKv0euerY/ioUmZFpnU0y+DUO+6t
 Cbh6Y1FF4B0FAbY5Pi5anpJXyfTEUi0wXiyD5imrv3ei0H0wpCATUNN6KhZxugLECaNH
 IuwJEpigjJbEDJIkbQ4OZoqu8llx8DMa0rLgO/ydzJD6IuaMEX2MxiQWt67MsdFpii43
 suUQCAeXaKEZaRHZc/YXLoW4yv9nmcxYJRderN/WwHn7GvM2qt3/qNPwj9dm0do7lKhL
 lMtJcvHUstkCmO4y/dY0HQmmeinLQZejRqasqjsZrFzj0enRl63AL3hHVdJ8treYNw9L
 Rs1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=XURuyW4/0JZAXwwF07kDW5Wg7eJQuF769RkLAzybchM=;
 b=DK2iHlj5aPCDVOF5WN7+EaDCqSDkLo/FubxcME9AZ1wUE/383MDmbL3TUxJkxnIceD
 HquNDjwQ/Ula42yDstvAm7Gun+EEdsRuAi/R27xkK3fNp7cS7a1HrjFGTZjSZYEFUpx4
 y/Ot5/NFyCDGHYNgQeo8DZ/yXOuVSEJlK7EtWEQ8+R18z2m1qdSEh6L7hREE86uJISoc
 lxJN2sRNB4l8S3dAde84eJk5RW1JYN2xKtEeEz0LCJZ1CokJqIFGhT67q83X76ilz3ac
 szKj+afq3dn8/CjMM/1+/hJ2WuyUm/ISdWp3I/0aRqAxzzuRYkZVegASxMdzgUd67vew
 Fatw==
X-Gm-Message-State: APjAAAViOIAah96zLFdsHphIfF4u+9H0HBMzfbeFYhWyM/T12TTjCfAO
 N2uMrAdK/KK2bn+IXpMifL5j7A==
X-Google-Smtp-Source: APXvYqxiV2wn4mNG1Gv1QwYNeAVlBwkmgQCX1+ULbxfQlVnJ2vzi3HiSxNpfyxQP0bPINpRl+fikMw==
X-Received: by 2002:a62:f51d:: with SMTP id n29mr3858271pfh.21.1551822135966; 
 Tue, 05 Mar 2019 13:42:15 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id d5sm13197208pfo.83.2019.03.05.13.42.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 Mar 2019 13:42:15 -0800 (PST)
Date: Tue, 05 Mar 2019 13:42:15 -0800 (PST)
X-Google-Original-Date: Tue, 05 Mar 2019 13:40:41 PST (-0800)
Subject: [GIT PULL] RISC-V Patches for the 5.1 Merge Window, Part 1
From: Palmer Dabbelt <palmer@sifive.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-riscv@lists.infradead.org
Message-ID: <mhng-abd0b24c-3a6c-47bf-9b0c-e069cef41489@palmer-si-x1c4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190305_134217_082544_9CFDFA4F 
X-CRM114-Status: GOOD (  19.33  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit 41fb9d54f12b87fb1f670653e95d34668a08e8ee:

  Revert "RISC-V: Make BSS section as the last section in vmlinux.lds.S" (2019-02-11 15:24:45 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-5.1-mw0

for you to fetch changes up to 13fd5de06514458eb320188b7a815d65696efd99:

  RISC-V: Fixmap support and MM cleanups (2019-03-04 11:47:04 -0800)

----------------------------------------------------------------
RISC-V Patches for the 5.1 Merge Window, Part 1

This contains the vast majority of the RISC-V patches for this merge
window.  It includes:

* A handful of cleanups to our kernel prints, most of which are things I
  should have caught the first time.
* We now provide an HWCAP that contains the ISA extensions that all
  enabled processors support, as supposed to just looking at the first
  enabled processor.
* We no longer spin forever waiting for all harts to boot.
* A fixmap implementation, which is coupled to some cleanups in our MM
  code.

The only outstanding patches I know of right now are Vincent Chen's
patches to fix c.ebreak handling in the kernel, the v2 of which was
posted this morning.  I'd like those in the MW, but I didn't want to
hold up everything else.  The patch set is based on top of my last fixes
submission, but I've tested it with a conflict-free merge from v5.0.
I'm doing this rather than my "just go rebase everything" flow due to a
discussion with Linus, but if I misunderstood then just let me know and
I'll do something else.  It's also the first time I've taken a PR into
my own tree, so let me know if I screwed that one up.

I've used my standard testing flow (QEMU in Fedora), but now that we're
starting to get the kernel in better shape I think it's time to impose
some more testing here -- specifically I'm going to require that patches
boot on the HiFive Unleashed because we're getting to the point where we
can actually expect that to work.  I haven't done that for this tag, but
I'm going to do it for future ones.

I know the board is a bit expensive and not everyone has one, but if
I've sent you a free one and your patches break the boot then I'm going
to yell at you :).  If you don't have one then please indicate how you
tested in your cover letter, and if you have a board then please add
your Tested-by to patches if they work for your testing flow.

----------------------------------------------------------------
Andreas Schwab (1):
      arch: riscv: fix logic error in parse_dtb

Anup Patel (5):
      RISC-V: Setup init_mm before parse_early_param()
      RISC-V: Move setup_bootmem() to mm/init.c
      RISC-V: Move setup_vm() to mm/init.c
      RISC-V: Implement compile-time fixed mappings
      RISC-V: Free-up initrd in free_initrd_mem()

Atish Patra (6):
      RISC-V: Do not wait indefinitely in __cpu_up
      RISC-V: Move cpuid to hartid mapping to SMP.
      RISC-V: Remove NR_CPUs check during hartid search from DT
      RISC-V: Allow hartid-to-cpuid function to fail.
      RISC-V: Compare cpuid with NR_CPUS before mapping.
      RISC-V: Assign hwcap as per comman capabilities.

Christoph Hellwig (1):
      riscv: remove the HAVE_KPROBES option

Johan Hovold (5):
      riscv: add missing newlines to printk messages
      riscv: use pr_info and friends
      riscv: fix riscv_of_processor_hartid() comment
      riscv: treat cpu devicetree nodes without status as enabled
      riscv: use for_each_of_cpu_node iterator

Palmer Dabbelt (1):
      RISC-V: Fixmap support and MM cleanups

 arch/riscv/Kconfig               |   6 +-
 arch/riscv/include/asm/fixmap.h  |  44 +++++++++++
 arch/riscv/include/asm/pgtable.h |   1 +
 arch/riscv/include/asm/smp.h     |  18 +++--
 arch/riscv/kernel/cpu.c          |  30 +++-----
 arch/riscv/kernel/cpufeature.c   |  48 ++++++------
 arch/riscv/kernel/ftrace.c       |   2 +-
 arch/riscv/kernel/setup.c        | 141 ++---------------------------------
 arch/riscv/kernel/smp.c          |  10 ++-
 arch/riscv/kernel/smpboot.c      |  24 ++++--
 arch/riscv/mm/init.c             | 156 ++++++++++++++++++++++++++++++++++++++-
 11 files changed, 287 insertions(+), 193 deletions(-)
 create mode 100644 arch/riscv/include/asm/fixmap.h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
