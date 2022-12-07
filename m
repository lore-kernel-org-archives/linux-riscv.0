Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D618C352A1
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Dec 2022 10:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3Jd0EdDWF2mgV/hwlrcqnAUZDAWcUF2IT09a06+75zo=; b=VGiM60Q6/hw/r9
	kbPOcXlV3aiEORGOPPZITKOlE4+C+m0lbivGIhxFsm1tmacd30bVgxSF38uZWwFHOwOxikVrOokxh
	L/a2qTRWBBNNtY47gO0b6U+y5Hd6jwJPCRVfWpPOz0uk1Ok8LBP85ZGboHEoSWt3466yVVE6sfgy0
	Mhns89sGd/bQT+lluydkfxyX395kvpwyzQDpyW7fGrPkVdf3P4+qXXGIWLKSxJcl9aFADmx9fFe04
	GclNVyA0U/+J4wfPUV5MWCpJVtb9bULY7/073Oi/Z4lkebZdHLL7DjD0VyHWhx3bZP1vPFpAwwjFW
	pQp3Zx2VknU0oYxTc4PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2rkK-00HIhU-7p; Wed, 07 Dec 2022 10:33:48 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2rkF-00HIeB-NP
	for linux-riscv@lists.infradead.org; Wed, 07 Dec 2022 10:33:46 +0000
Received: by mail-ej1-x632.google.com with SMTP id vv4so12960256ejc.2
        for <linux-riscv@lists.infradead.org>; Wed, 07 Dec 2022 02:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I0jpWPIBVAp+rHu6Z64EYwjXGIWWou0XXGrJUb14aao=;
        b=scpoUvPhowy1XW5Y96Ae003nM1Gvl3fcmNIdR4qRMYq/SipCy3E/62EhkBRXw9D2Gi
         2xAVK6xRXmyqGTivUoovzUQ8uvymc3LwokrvWO870n1WP8bJdApEgvdamY//1yakUNKV
         juQSDzs8tODfjN9xhRsg7xmY1+Z3A4PxUgZM/OcZN07mb+iovagj0fbar4fkBe4GGXIl
         SPaANxskB67v78rbgpYwDnwcs/uJ4SfZE5zWwTC00kJwQhO7H4H23wJo0GdwJCYsyYzt
         xMb8pShJvuLE01FgHKOO90eBDT40cYL+2UrsqIRuLZ3HwGhrr/IcoQTMsciFSohQTOl9
         xASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I0jpWPIBVAp+rHu6Z64EYwjXGIWWou0XXGrJUb14aao=;
        b=GnZ39DXtxYa6Oub5aC3Pif7lXllOOcQJsOf7rUfhQ7Ssoa++7HuTjH4BC2CYhTRFPi
         Cq7yP/awXq+H2uCOHCBgcp4aLlzlVPKWic+OTe17cYd7ZbDUBS14EpANflJilDjZM4yn
         Me8O5pMI49ozk35SVKkrXw91/pTQqLvdmrXURWeVg+VmnGjZMiftnjXRGZM0NqjoSjbw
         H5q4MhT2+qKTuO/j2NMufZQzArKa0ao32KYsllFYP23V3XEH8Wvw4QepZ8XjE23vVU2K
         ILPBkA27gDNZQqUvlS7v3y0AZ9NsgUB2+ndqJVhXmC3rwKT4CfKzSBb2uob5VQ64ljNI
         Wcbg==
X-Gm-Message-State: ANoB5pk8E6QevlEI0rkCwKa6D3Nkm4CZMMTVVSPRN0hgkM+DNUHDKzdk
	tG/7q7JB0laWNkzY2hw7A3H+Lg6LKhBp4hxIraZnVQ==
X-Google-Smtp-Source: AA0mqf7gvLaEime8aYps0wOthxWyDMPcGn8Z+/r199yLrTRc6psuJEF6pBbA/xA9BzcaPKlCe8Jz/AIQWBoKY/+ZyXQ=
X-Received: by 2002:a17:906:114a:b0:7c0:c836:e586 with SMTP id
 i10-20020a170906114a00b007c0c836e586mr18222229eja.750.1670409220219; Wed, 07
 Dec 2022 02:33:40 -0800 (PST)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Wed, 7 Dec 2022 16:03:28 +0530
Message-ID: <CAAhSdy0qihfFCXTV-QUjP-5XiQQqBC4_sP-swx77k6PC3uTmmw@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv changes for 6.2
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, 
	KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_023343_995193_D8BE6583 
X-CRM114-Status: UNSURE (   6.72  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Paolo,

We have the following KVM RISC-V changes for 6.2:
1) Allow unloading KVM module
2) Allow KVM user-space to set mvendorid, marchid, and mimpid
3) Several fixes and cleanups

Please pull.

Regards,
Anup

The following changes since commit 76dcd734eca23168cb008912c0f69ff408905235:

  Linux 6.1-rc8 (2022-12-04 14:48:12 -0800)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-6.2-1

for you to fetch changes up to 6ebbdecff6ae00557a52539287b681641f4f0d33:

  RISC-V: KVM: Add ONE_REG interface for mvendorid, marchid, and
mimpid (2022-12-07 09:17:49 +0530)

----------------------------------------------------------------
KVM/riscv changes for 6.2

- Allow unloading KVM module
- Allow KVM user-space to set mvendorid, marchid, and mimpid
- Several fixes and cleanups

----------------------------------------------------------------
Anup Patel (9):
      RISC-V: KVM: Exit run-loop immediately if xfer_to_guest fails
      RISC-V: KVM: Fix reg_val check in kvm_riscv_vcpu_set_reg_config()
      RISC-V: KVM: Remove redundant includes of asm/kvm_vcpu_timer.h
      RISC-V: KVM: Remove redundant includes of asm/csr.h
      RISC-V: KVM: Use switch-case in kvm_riscv_vcpu_set/get_reg()
      RISC-V: KVM: Move sbi related struct and functions to kvm_vcpu_sbi.h
      RISC-V: Export sbi_get_mvendorid() and friends
      RISC-V: KVM: Save mvendorid, marchid, and mimpid when creating VCPU
      RISC-V: KVM: Add ONE_REG interface for mvendorid, marchid, and mimpid

Bo Liu (1):
      RISC-V: KVM: use vma_lookup() instead of find_vma_intersection()

Christophe JAILLET (1):
      RISC-V: KVM: Simplify kvm_arch_prepare_memory_region()

XiakaiPan (1):
      RISC-V: KVM: Add exit logic to main.c

 arch/riscv/include/asm/kvm_host.h     | 16 +++----
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  6 +++
 arch/riscv/include/uapi/asm/kvm.h     |  3 ++
 arch/riscv/kernel/sbi.c               |  3 ++
 arch/riscv/kvm/main.c                 |  6 +++
 arch/riscv/kvm/mmu.c                  |  6 +--
 arch/riscv/kvm/vcpu.c                 | 85 ++++++++++++++++++++++++++---------
 arch/riscv/kvm/vcpu_sbi_base.c        | 13 +++---
 arch/riscv/kvm/vcpu_sbi_hsm.c         |  1 -
 arch/riscv/kvm/vcpu_sbi_replace.c     |  1 -
 arch/riscv/kvm/vcpu_sbi_v01.c         |  1 -
 11 files changed, 97 insertions(+), 44 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
