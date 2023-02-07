Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA1CC636D3
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Feb 2023 17:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BWEFbKQhvaPoYi6B+20phLY0mC3gsUP989awa91B/Vg=; b=QCJEr/caMJ1JRm
	H4/pwswGIXKemA8arkixEp/q2KvzLVVa/1kgvD6ibS+1TMw71CvlAQQGyxnnBtRQkLiVMZtIG253k
	szWyek3Mk1lsNGJjFoPioXiR/nWDKmVhZS3gYGgs/x/pH37aznrkvXno2p0/kG46WPiE9tnVaTBYE
	/QTt6Ixr7rJds0zQq+DXul90GVsoldtwplRrI/BIdBzN2qc0dKbFHUN8IJlEGmu+24+v6WRvaPUXK
	dYkiwIItar5AM163gWBEINrCmd96sog8gaqKH2/9KNJAECE0NbPCydjzzNB4To5Xg8ZqntMnQ8Tym
	YfGrVVzHgZQ0g+OzLyuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPRt4-00CwUG-BC; Tue, 07 Feb 2023 17:36:10 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPRsw-00CwTG-Kx
	for linux-riscv@lists.infradead.org; Tue, 07 Feb 2023 17:36:08 +0000
Received: by mail-ej1-x629.google.com with SMTP id lu11so44600614ejb.3
        for <linux-riscv@lists.infradead.org>; Tue, 07 Feb 2023 09:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BZ6y0HfdU+5U+iTOtrcJ4GxWnnDEHocKk/DZG1/+ooM=;
        b=TwzAwA2xXYZ/V6lNMp/SIYufRe4LwLnRoZESGvbDUn5HMDW4rguxJJMztGKAYjIk3o
         fG5Q87YAZYLElVMN9eEVvVnE/NCPzsjekAmPFPkOvVm3geVi4p6X8qk1yD27v2n4nGNI
         IXwR1ODRM1T5hiuZAeygXR//XQCc+d+f5D3iR7RCnG+W+Xs2nT6UOrVabyBUqW7eebOI
         kSPnLtV/qflRK/KW73RECl5KPD1uRhbhO9lltyFxaz64DrphZkSRpyy2566HwJ82sJRt
         bx0bM8qKCigg1JYhFI/YlU9kgCJuEUnPqfCgQqWC4AvqkNQR3R99nsSSd5XYyxhsuH2u
         57ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BZ6y0HfdU+5U+iTOtrcJ4GxWnnDEHocKk/DZG1/+ooM=;
        b=7NHy6H3GQ/GlGWbp2xhDXBALX2pUXCF4kskU7tRs57jHunUkJ1up9MI6B4bC8hZhK8
         b2fT0kgQZqO1hx2zbaexMsjZihWsZSYvtIXbBx5anz4CCMrrjCXdne6DBEoA1FpadC14
         PyyEXw5LpsfTPV4u+lqKmTtbAYK70DrN6STp8jWt2T2tq+MLA2JrSIDHNvPPjrbRWsgX
         0+W7Xg+I0ZuZF2+13+jFcsMfGRN63XCsjQXKfGa6FYy2FwZdRYcB/5GBJcLXOpIhEDrr
         Qt4WyFJBi+5HOgHzsPdir0rtsmS53xIVTCaB/gEDvoh5g9TlIpuB/yXNb+PWJirmcNYw
         +//w==
X-Gm-Message-State: AO0yUKUtk7eaFrP2x9WFLRBJMQn8i6mZxbQojZaXLXfSHpJNdfNEpuQr
	twUCBp1weEjVWtYDztRnUsBzVlli10gWD/GcGguLrA==
X-Google-Smtp-Source: AK7set+1X+nDNSzXfWLcK/qx4Ts9Ui6/V+Vi26x3FAphUtadBkrkCKKfEKwMyQipsGnI8EZHnBdV0FsGtRhAhGiGk4Y=
X-Received: by 2002:a17:906:3ad1:b0:884:8380:20db with SMTP id
 z17-20020a1709063ad100b00884838020dbmr891330ejd.301.1675791359418; Tue, 07
 Feb 2023 09:35:59 -0800 (PST)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Tue, 7 Feb 2023 23:05:48 +0530
Message-ID: <CAAhSdy25NgCY23u=icRgcZpEZzNgJkyEN92KEVL8D-SvUwTBXg@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv changes for 6.3
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, 
	Andrew Jones <ajones@ventanamicro.com>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_093602_949920_D7F31288 
X-CRM114-Status: GOOD (  10.50  )
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

Hi Paolo,

We have the following KVM RISC-V changes for 6.3:
1) Fix wrong usage of PGDIR_SIZE to check page sizes
2) Fix privilege mode setting in kvm_riscv_vcpu_trap_redirect()
3) Redirect illegal instruction traps to guest
4) SBI PMU support for guest

Please pull.

I will send another PR for 6.3 containing AIA CSR
virtualization after Palmer has sent his first PR for 6.3
so that I can resolve conflicts with arch/riscv changes.
I hope you are okay with this ??

Regards,
Anup

The following changes since commit 4ec5183ec48656cec489c49f989c508b68b518e3:

  Linux 6.2-rc7 (2023-02-05 13:13:28 -0800)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-6.3-1

for you to fetch changes up to c39cea6f38eefe356d64d0bc1e1f2267e282cdd3:

  RISC-V: KVM: Increment firmware pmu events (2023-02-07 20:36:08 +0530)

----------------------------------------------------------------
KVM/riscv changes for 6.3

- Fix wrong usage of PGDIR_SIZE to check page sizes
- Fix privilege mode setting in kvm_riscv_vcpu_trap_redirect()
- Redirect illegal instruction traps to guest
- SBI PMU support for guest

----------------------------------------------------------------
Alexandre Ghiti (1):
      KVM: RISC-V: Fix wrong usage of PGDIR_SIZE to check page sizes

Andy Chiu (1):
      RISC-V: KVM: Redirect illegal instruction traps to guest

Anup Patel (1):
      RISC-V: KVM: Fix privilege mode setting in kvm_riscv_vcpu_trap_redirect()

Atish Patra (14):
      perf: RISC-V: Define helper functions expose hpm counter width and count
      perf: RISC-V: Improve privilege mode filtering for perf
      RISC-V: Improve SBI PMU extension related definitions
      RISC-V: KVM: Define a probe function for SBI extension data structures
      RISC-V: KVM: Return correct code for hsm stop function
      RISC-V: KVM: Modify SBI extension handler to return SBI error code
      RISC-V: KVM: Add skeleton support for perf
      RISC-V: KVM: Add SBI PMU extension support
      RISC-V: KVM: Make PMU functionality depend on Sscofpmf
      RISC-V: KVM: Disable all hpmcounter access for VS/VU mode
      RISC-V: KVM: Implement trap & emulate for hpmcounters
      RISC-V: KVM: Implement perf support without sampling
      RISC-V: KVM: Support firmware events
      RISC-V: KVM: Increment firmware pmu events

 arch/riscv/include/asm/kvm_host.h     |   4 +
 arch/riscv/include/asm/kvm_vcpu_pmu.h | 107 ++++++
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  13 +-
 arch/riscv/include/asm/sbi.h          |   7 +-
 arch/riscv/kvm/Makefile               |   1 +
 arch/riscv/kvm/main.c                 |   3 +-
 arch/riscv/kvm/mmu.c                  |   8 +-
 arch/riscv/kvm/tlb.c                  |   4 +
 arch/riscv/kvm/vcpu.c                 |   7 +
 arch/riscv/kvm/vcpu_exit.c            |   9 +
 arch/riscv/kvm/vcpu_insn.c            |   4 +-
 arch/riscv/kvm/vcpu_pmu.c             | 633 ++++++++++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu_sbi.c             |  72 ++--
 arch/riscv/kvm/vcpu_sbi_base.c        |  27 +-
 arch/riscv/kvm/vcpu_sbi_hsm.c         |  28 +-
 arch/riscv/kvm/vcpu_sbi_pmu.c         |  86 +++++
 arch/riscv/kvm/vcpu_sbi_replace.c     |  50 +--
 arch/riscv/kvm/vcpu_sbi_v01.c         |  17 +-
 drivers/perf/riscv_pmu_sbi.c          |  64 +++-
 include/linux/perf/riscv_pmu.h        |   5 +
 20 files changed, 1035 insertions(+), 114 deletions(-)
 create mode 100644 arch/riscv/include/asm/kvm_vcpu_pmu.h
 create mode 100644 arch/riscv/kvm/vcpu_pmu.c
 create mode 100644 arch/riscv/kvm/vcpu_sbi_pmu.c

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
