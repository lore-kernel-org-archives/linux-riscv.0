Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C3A5C433FE
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Oct 2022 05:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Zh2BBjNS0RzhyjYiq87j3z+8fj3E09w+lIRf1V2T+vI=; b=IzBxjeK0hCMyQA
	sLhCSNigZi6IDn4Ef3aUXm4wIHYYegtD0zaMsK6h8ZQ2fFeYfK4DZ7il026kxTCv+Ledi3xGme9vH
	WTskocS+vAAnMfms9AttPfxpMks6dU7DxB8DuLSLx3OWsCTWUdiQmKToPyjuAxCCwrsTYVD9OK477
	fQ9MBO2QJQmmT4gV6rXW2MueS8/UwLxfEUleBnDIlrZQWJXJO/LBGMTnPM8ON7+k51XFQYUWLHhxv
	kg4CjEjO/NL1EUK2UoXcQJ9hueYnirbfuZewYATiIw0xYdApvMlGbOmdAdQDZDBquzswdtgIL/wft
	NRpyVUmo5BzsxEL9DupA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeroH-00HUj7-BE; Sun, 02 Oct 2022 05:46:41 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeroE-00HUhr-A4
	for linux-riscv@lists.infradead.org; Sun, 02 Oct 2022 05:46:40 +0000
Received: by mail-ej1-x635.google.com with SMTP id lh5so16386109ejb.10
        for <linux-riscv@lists.infradead.org>; Sat, 01 Oct 2022 22:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=GrhlWqAeelXfFuousvZL4+uQTtUeskpuRrDHgcNrsFk=;
        b=XjJpKVPBIKlwhYhRUPpz9eY8Ka60DUW/QLjuULsbSKCtTlOmI948XHWtlCrP8yRQHL
         SfqmahZAzqeGgQfVjj8fsuVnGg6cIV2NIj5dk/+sQgOJHycIYxjj4VN/jTqVdFE0Uuc6
         CEXhLUDLFA8SbPkuJTw/hrCrey9XCgAPdOjI35jAEluH8Tf0DJW1TmmSH+onuX+NYviP
         J6V1Dou2xcGGGQqfCO7tpLpo5u5xJHOQxs+XfeWrUCAmrSdhnKja6ukJo04ozb2JbNXB
         o+QdZClYuVoA7IrF1j6mSN+Cegh8P69f0LHforGdryusyVioIp+N5UZVkyjha+Msn0Yt
         5luQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=GrhlWqAeelXfFuousvZL4+uQTtUeskpuRrDHgcNrsFk=;
        b=P38TNZNELq2rN9Ib9Q6N/GZmHAT5e/AyhXEtaSr8/xYTk/JKrg2RD+EO6s4lPDS5d5
         YG2AfXBaLIy3XsPG7b/xRw3MpUqi7fxb5fhSgKuOIl4Z0HvZrSkkDwGviUCfxo11Nx7J
         8m+zLdm82FeJpVUALWykaQHXlwlrSEsnZcx1oY6ex969ffEbHRrYhs0bgrBZ1/rdSo6w
         snzyRkyabEJtZ1dS/KsLVCg5QgLIXEE6zzpuYIhAY0AVq3S7RPKp9hdX9zleVsy9Q+2Z
         lthFScyKUL2tJ48AV6cfIW10ASLFlIXtmuGIsq9YeDAsSAEK82LQH1QFU4Dp7FHjznvo
         5H1w==
X-Gm-Message-State: ACrzQf2PBy3x6eCFFApgkEiPu/TyyOb2iyQZ7fSd5eE9Ept0CtuRhCtN
	hVB8YXyaJsbZ5QBIvfz85Fcx0UoQEYYm7D6JYSMIpA==
X-Google-Smtp-Source: AMsMyM6D693fA/UMqz9ykh3+TeK8rgLMRoHflKIaijjN8Mr9HIz1/kbi4Ju0H1KDsquIqzXaUJzgKT8CYyFMZYNBkjA=
X-Received: by 2002:a17:906:dac8:b0:741:545b:796a with SMTP id
 xi8-20020a170906dac800b00741545b796amr11184738ejb.240.1664689595859; Sat, 01
 Oct 2022 22:46:35 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Sun, 2 Oct 2022 11:16:24 +0530
Message-ID: <CAAhSdy134Ve1mbeK+TNRx-pWpQ=nVzNLptDcUyPaDU4v18Qyaw@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv changes for 6.1
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, 
	KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221001_224638_593742_63D5898A 
X-CRM114-Status: UNSURE (   8.01  )
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

We have the following KVM RISC-V changes for 6.1:
1) Improved instruction encoding infrastructure for
    instructions not yet supported by binutils
2) Svinval support for both KVM Host and KVM Guest
3) Zihintpause support for KVM Guest
4) Zicbom support for KVM Guest
5) Record number of signal exits as a VCPU stat
6) Use generic guest entry infrastructure

Please pull.

Regards,
Anup

The following changes since commit f76349cf41451c5c42a99f18a9163377e4b364ff:

  Linux 6.0-rc7 (2022-09-25 14:01:02 -0700)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-6.1-1

for you to fetch changes up to b60ca69715fcc39a5f4bdd56ca2ea691b7358455:

  riscv: select HAVE_POSIX_CPU_TIMERS_TASK_WORK (2022-10-02 10:19:31 +0530)

----------------------------------------------------------------
KVM/riscv changes for 6.1

- Improved instruction encoding infrastructure for
  instructions not yet supported by binutils
- Svinval support for both KVM Host and KVM Guest
- Zihintpause support for KVM Guest
- Zicbom support for KVM Guest
- Record number of signal exits as a VCPU stat
- Use generic guest entry infrastructure

----------------------------------------------------------------
Andrew Jones (7):
      riscv: Add X register names to gpr-nums
      riscv: Introduce support for defining instructions
      riscv: KVM: Apply insn-def to hfence encodings
      riscv: KVM: Apply insn-def to hlv encodings
      RISC-V: KVM: Make ISA ext mappings explicit
      RISC-V: KVM: Provide UAPI for Zicbom block size
      RISC-V: KVM: Expose Zicbom to the guest

Anup Patel (3):
      RISC-V: KVM: Change the SBI specification version to v1.0
      RISC-V: KVM: Use Svinval for local TLB maintenance when available
      RISC-V: KVM: Allow Guest use Svinval extension

Jisheng Zhang (3):
      RISC-V: KVM: Record number of signal exits as a vCPU stat
      RISC-V: KVM: Use generic guest entry infrastructure
      riscv: select HAVE_POSIX_CPU_TIMERS_TASK_WORK

Mayuresh Chitale (2):
      RISC-V: Probe Svinval extension form ISA string
      RISC-V: KVM: Allow Guest use Zihintpause extension

Xiu Jianfeng (1):
      RISC-V: KVM: add __init annotation to riscv_kvm_init()

 arch/riscv/Kconfig                    |   4 +
 arch/riscv/include/asm/gpr-num.h      |   8 ++
 arch/riscv/include/asm/hwcap.h        |   4 +
 arch/riscv/include/asm/insn-def.h     | 137 ++++++++++++++++++++++++++++++
 arch/riscv/include/asm/kvm_host.h     |   1 +
 arch/riscv/include/asm/kvm_vcpu_sbi.h |   4 +-
 arch/riscv/include/uapi/asm/kvm.h     |   4 +
 arch/riscv/kernel/cpu.c               |   1 +
 arch/riscv/kernel/cpufeature.c        |   1 +
 arch/riscv/kvm/Kconfig                |   1 +
 arch/riscv/kvm/main.c                 |   2 +-
 arch/riscv/kvm/tlb.c                  | 155 +++++++++++-----------------------
 arch/riscv/kvm/vcpu.c                 |  60 ++++++++-----
 arch/riscv/kvm/vcpu_exit.c            |  39 ++-------
 arch/riscv/mm/dma-noncoherent.c       |   2 +
 15 files changed, 260 insertions(+), 163 deletions(-)
 create mode 100644 arch/riscv/include/asm/insn-def.h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
