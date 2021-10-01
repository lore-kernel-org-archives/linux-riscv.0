Return-Path: <SRS0=1++v=OV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07C80C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Oct 2021 09:03:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C00DA61A82
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Oct 2021 09:03:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C00DA61A82
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RKsZ+Kcxsh07EwSzEwUQ6GhzVIIEgpqNg3Pa/0a+14M=; b=4wngC0/7MpcdY4
	IWI1XD0GskIT/3DhhAHYzbZ+mgbA9URC6GLPrc+xslVmECVGeczkiw9+0qRGLcs2jB+D3Q0MEfW7K
	uhpjSpTIBie5Kp25Dd//oyZ0M6rswuSZSiiw7SHHsvHzrRW7y6DUwb+fIja9Wmpo1PxtMOzK8YcHS
	sJ0ySKX68de27NoiF5oxtqPrdKLhir5ncTjhsCtTKzeEsahUT33IP6m77s/jPbEWzbj1hO5ttPQRa
	Dqsb7d4P86TpkgXZ7FrV3EaHKQD56jwOq6VQosvv99NgCfNg8tOGC/5Car3KCLXeByXmH+28Ynvgs
	sZ4+++5iMP82posQuohQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWERm-00H9xz-Lj; Fri, 01 Oct 2021 09:03:14 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWERj-00H9wu-3Q; Fri, 01 Oct 2021 09:03:13 +0000
Received: by mail-vs1-xe33.google.com with SMTP id o124so10502360vsc.6;
 Fri, 01 Oct 2021 02:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9CB3sizahUUJs/3SYVMCSy/MxYgvI6Z5lq0WR98R9xk=;
 b=qXKuMnj/0GZvc9W+uwopmhv85sOVTX6/s8bNmQzDgq5Am/fXKrUAUkYDMyGe0siBMS
 jq6Ei1wUhrNrJ+otNirNwkHDMCJmryM4O+0G6XqneszmI0thwOqm6SwXKjzf9sp58oRU
 neFiOoXKGqLyNqpyrmQoaHXmLhDrUlWrmbm0rsl9R3+/APmKoq93Q8rnE8ggN7YotVQ6
 HDrrj/0hDEdDQaEh2655/EhqpRePKaz23EvPhsh0rC9v2/Qj9VN/U31YQMkLdXpLPBTX
 8UbR6ciUM0S6Bs3d2CRQE7onCe1RFNfdjXyU3Ckd0H8vaiin5rh7+TsF8mD1HzwhKiIU
 rV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9CB3sizahUUJs/3SYVMCSy/MxYgvI6Z5lq0WR98R9xk=;
 b=H5t0ZDJOJWf03KYgAQ9Fc86Sz/F+zhm40dF7osWvPSuDnISJ8+SDHiOxAb7yzsjw6F
 YzDspGJIQNcO0rDi/8b5jR0oRaMqHLxKd195xQqUz+evCPb4sCqAEORTefQh7fx+1oTZ
 icIE+wLZSXFw+H0wF3EvRUw2jcFec2rf1lY2eC36Ok6zOYQktA2ujCnbqa4ukwqyLXNi
 MUiBNKSRgeqRdMG6uL5eDz97S9QyuBvicpxdVHW4O2XwqrlqTGlfDx/62K0Mj/fQPZod
 ytkf9Za4kPU5hNF3/GjqX6evMrEOUymcgoZK1dDlcuhxs2TVxmi1hY6ok7tC9pspLBHP
 fkzQ==
X-Gm-Message-State: AOAM530kJMsNPvrEd1mLMponYbGEwjWLoSwNMyOqK4gMdUEax6WaeqA/
 Ovy3l/e2dJDF2Jlvsxed1TamQWphOvyfZAy1o8I0/tRwPTZALQ==
X-Google-Smtp-Source: ABdhPJxVgP3MMA1ukKi2H272QWDNEIHU8Ipw2p/m6hQ8AL96UrCPgQAiYrZM8dJv6T+Qe9aL8UVfUC66WkGK4QH2uug=
X-Received: by 2002:a67:a601:: with SMTP id p1mr2568434vse.38.1633078989875;
 Fri, 01 Oct 2021 02:03:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210927114016.1089328-1-anup.patel@wdc.com>
 <CAAhSdy1yZ11L=A3g06GXM8tFtonBX0Cj5NDyGHQ1v44vJ8MqSA@mail.gmail.com>
In-Reply-To: <CAAhSdy1yZ11L=A3g06GXM8tFtonBX0Cj5NDyGHQ1v44vJ8MqSA@mail.gmail.com>
From: Ley Foon Tan <lftan.linux@gmail.com>
Date: Fri, 1 Oct 2021 17:02:58 +0800
Message-ID: <CAFiDJ5_--KsNd3aH1gT_cgU32C+wzunzXeSKtn8HTNj_La7n5A@mail.gmail.com>
Subject: Re: [PATCH v20 00/17] KVM RISC-V Support
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexander Graf <graf@amazon.com>, 
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, KVM General <kvm@vger.kernel.org>, 
 kvm-riscv@lists.infradead.org, linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Anup Patel <anup.patel@wdc.com>, 
 Philipp Tomsich <philipp.tomsich@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211001_020311_241730_8DE39937 
X-CRM114-Status: GOOD (  40.41  )
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

On Mon, Sep 27, 2021 at 8:01 PM Anup Patel <anup@brainfault.org> wrote:
>
> Hi Palmer, Hi Paolo,
>
> On Mon, Sep 27, 2021 at 5:10 PM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > This series adds initial KVM RISC-V support. Currently, we are able to boot
> > Linux on RV64/RV32 Guest with multiple VCPUs.
> >
> > Key aspects of KVM RISC-V added by this series are:
> > 1. No RISC-V specific KVM IOCTL
> > 2. Loadable KVM RISC-V module supported
> > 3. Minimal possible KVM world-switch which touches only GPRs and few CSRs
> > 4. Both RV64 and RV32 host supported
> > 5. Full Guest/VM switch is done via vcpu_get/vcpu_put infrastructure
> > 6. KVM ONE_REG interface for VCPU register access from user-space
> > 7. PLIC emulation is done in user-space
> > 8. Timer and IPI emuation is done in-kernel
> > 9. Both Sv39x4 and Sv48x4 supported for RV64 host
> > 10. MMU notifiers supported
> > 11. Generic dirtylog supported
> > 12. FP lazy save/restore supported
> > 13. SBI v0.1 emulation for KVM Guest available
> > 14. Forward unhandled SBI calls to KVM userspace
> > 15. Hugepage support for Guest/VM
> > 16. IOEVENTFD support for Vhost
> >
> > Here's a brief TODO list which we will work upon after this series:
> > 1. KVM unit test support
> > 2. KVM selftest support
> > 3. SBI v0.3 emulation in-kernel
> > 4. In-kernel PMU virtualization
> > 5. In-kernel AIA irqchip support
> > 6. Nested virtualizaiton
> > 7. ..... and more .....
> >
> > This series can be found in riscv_kvm_v20 branch at:
> > https//github.com/avpatel/linux.git
> >
> > Our work-in-progress KVMTOOL RISC-V port can be found in riscv_v9 branch
> > at: https//github.com/avpatel/kvmtool.git
> >
> > The QEMU RISC-V hypervisor emulation is done by Alistair and is available
> > in master branch at: https://git.qemu.org/git/qemu.git
> >
> > To play around with KVM RISC-V, refer KVM RISC-V wiki at:
> > https://github.com/kvm-riscv/howto/wiki
> > https://github.com/kvm-riscv/howto/wiki/KVM-RISCV64-on-QEMU
> > https://github.com/kvm-riscv/howto/wiki/KVM-RISCV64-on-Spike
> >
> > Changes since v19:
> >  - Rebased on Linux-5.15-rc3
> >  - Converted kvm_err() to kvm_debug() in kvm_set_spte_gfn() function
> >    added by PATCH11
> >
> > Changes since v18:
> >  - Rebased on Linux-5.14-rc3
> >  - Moved to new KVM debugfs interface
> >  - Dropped PATCH17 of v18 series for having KVM RISC-V in drivers/staging
> >
> > Changes since v17:
> >  - Rebased on Linux-5.13-rc2
> >  - Moved to new KVM MMU notifier APIs
> >  - Removed redundant kvm_arch_vcpu_uninit()
> >  - Moved KVM RISC-V sources to drivers/staging for compliance with
> >    Linux RISC-V patch acceptance policy
> >
> > Changes since v16:
> >  - Rebased on Linux-5.12-rc5
> >  - Remove redundant kvm_arch_create_memslot(), kvm_arch_vcpu_setup(),
> >    kvm_arch_vcpu_init(), kvm_arch_has_vcpu_debugfs(), and
> >    kvm_arch_create_vcpu_debugfs() from PATCH5
> >  - Make stage2_wp_memory_region() and stage2_ioremap() as static
> >    in PATCH13
> >
> > Changes since v15:
> >  - Rebased on Linux-5.11-rc3
> >  - Fixed kvm_stage2_map() to use gfn_to_pfn_prot() for determing
> >    writeability of a host pfn.
> >  - Use "__u64" in-place of "u64" and "__u32" in-place of "u32" for
> >    uapi/asm/kvm.h
> >
> > Changes since v14:
> >  - Rebased on Linux-5.10-rc3
> >  - Fixed Stage2 (G-stage) PDG allocation to ensure it is 16KB aligned
> >
> > Changes since v13:
> >  - Rebased on Linux-5.9-rc3
> >  - Fixed kvm_riscv_vcpu_set_reg_csr() for SIP updation in PATCH5
> >  - Fixed instruction length computation in PATCH7
> >  - Added ioeventfd support in PATCH7
> >  - Ensure HSTATUS.SPVP is set to correct value before using HLV/HSV
> >    intructions in PATCH7
> >  - Fixed stage2_map_page() to set PTE 'A' and 'D' bits correctly
> >    in PATCH10
> >  - Added stage2 dirty page logging in PATCH10
> >  - Allow KVM user-space to SET/GET SCOUNTER CSR in PATCH5
> >  - Save/restore SCOUNTEREN in PATCH6
> >  - Reduced quite a few instructions for __kvm_riscv_switch_to() by
> >    using CSR swap instruction in PATCH6
> >  - Detect and use Sv48x4 when available in PATCH10
> >
> > Changes since v12:
> >  - Rebased patches on Linux-5.8-rc4
> >  - By default enable all counters in HCOUNTEREN
> >  - RISC-V H-Extension v0.6.1 spec support
> >
> > Changes since v11:
> >  - Rebased patches on Linux-5.7-rc3
> >  - Fixed typo in typecast of stage2_map_size define
> >  - Introduced struct kvm_cpu_trap to represent trap details and
> >    use it as function parameter wherever applicable
> >  - Pass memslot to kvm_riscv_stage2_map() for supporing dirty page
> >    logging in future
> >  - RISC-V H-Extension v0.6 spec support
> >  - Send-out first three patches as separate series so that it can
> >    be taken by Palmer for Linux RISC-V
> >
> > Changes since v10:
> >  - Rebased patches on Linux-5.6-rc5
> >  - Reduce RISCV_ISA_EXT_MAX from 256 to 64
> >  - Separate PATCH for removing N-extension related defines
> >  - Added comments as requested by Palmer
> >  - Fixed HIDELEG CSR programming
> >
> > Changes since v9:
> >  - Rebased patches on Linux-5.5-rc3
> >  - Squash PATCH19 and PATCH20 into PATCH5
> >  - Squash PATCH18 into PATCH11
> >  - Squash PATCH17 into PATCH16
> >  - Added ONE_REG interface for VCPU timer in PATCH13
> >  - Use HTIMEDELTA for VCPU timer in PATCH13
> >  - Updated KVM RISC-V mailing list in MAINTAINERS entry
> >  - Update KVM kconfig option to depend on RISCV_SBI and MMU
> >  - Check for SBI v0.2 and SBI v0.2 RFENCE extension at boot-time
> >  - Use SBI v0.2 RFENCE extension in VMID implementation
> >  - Use SBI v0.2 RFENCE extension in Stage2 MMU implementation
> >  - Use SBI v0.2 RFENCE extension in SBI implementation
> >  - Moved to RISC-V Hypervisor v0.5 draft spec
> >  - Updated Documentation/virt/kvm/api.txt for timer ONE_REG interface
> >
> > Changes since v8:
> >  - Rebased series on Linux-5.4-rc3 and Atish's SBI v0.2 patches
> >  - Use HRTIMER_MODE_REL instead of HRTIMER_MODE_ABS in timer emulation
> >  - Fixed kvm_riscv_stage2_map() to handle hugepages
> >  - Added patch to forward unhandled SBI calls to user-space
> >  - Added patch for iterative/recursive stage2 page table programming
> >  - Added patch to remove per-CPU vsip_shadow variable
> >  - Added patch to fix race-condition in kvm_riscv_vcpu_sync_interrupts()
> >
> > Changes since v7:
> >  - Rebased series on Linux-5.4-rc1 and Atish's SBI v0.2 patches
> >  - Removed PATCH1, PATCH3, and PATCH20 because these already merged
> >  - Use kernel doc style comments for ISA bitmap functions
> >  - Don't parse X, Y, and Z extension in riscv_fill_hwcap() because it will
> >    be added in-future
> >  - Mark KVM RISC-V kconfig option as EXPERIMENTAL
> >  - Typo fix in commit description of PATCH6 of v7 series
> >  - Use separate structs for CORE and CSR registers of ONE_REG interface
> >  - Explicitly include asm/sbi.h in kvm/vcpu_sbi.c
> >  - Removed implicit switch-case fall-through in kvm_riscv_vcpu_exit()
> >  - No need to set VSSTATUS.MXR bit in kvm_riscv_vcpu_unpriv_read()
> >  - Removed register for instruction length in kvm_riscv_vcpu_unpriv_read()
> >  - Added defines for checking/decoding instruction length
> >  - Added separate patch to forward unhandled SBI calls to userspace tool
> >
> > Changes since v6:
> >  - Rebased patches on Linux-5.3-rc7
> >  - Added "return_handled" in struct kvm_mmio_decode to ensure that
> >    kvm_riscv_vcpu_mmio_return() updates SEPC only once
> >  - Removed trap_stval parameter from kvm_riscv_vcpu_unpriv_read()
> >  - Updated git repo URL in MAINTAINERS entry
> >
> > Changes since v5:
> >  - Renamed KVM_REG_RISCV_CONFIG_TIMEBASE register to
> >    KVM_REG_RISCV_CONFIG_TBFREQ register in ONE_REG interface
> >  - Update SPEC in kvm_riscv_vcpu_mmio_return() for MMIO exits
> >  - Use switch case instead of illegal instruction opcode table for simplicity
> >  - Improve comments in stage2_remote_tlb_flush() for a potential remote TLB
> >   flush optimization
> >  - Handle all unsupported SBI calls in default case of
> >    kvm_riscv_vcpu_sbi_ecall() function
> >  - Fixed kvm_riscv_vcpu_sync_interrupts() for software interrupts
> >  - Improved unprivilege reads to handle traps due to Guest stage1 page table
> >  - Added separate patch to document RISC-V specific things in
> >    Documentation/virt/kvm/api.txt
> >
> > Changes since v4:
> >  - Rebased patches on Linux-5.3-rc5
> >  - Added Paolo's Acked-by and Reviewed-by
> >  - Updated mailing list in MAINTAINERS entry
> >
> > Changes since v3:
> >  - Moved patch for ISA bitmap from KVM prep series to this series
> >  - Make vsip_shadow as run-time percpu variable instead of compile-time
> >  - Flush Guest TLBs on all Host CPUs whenever we run-out of VMIDs
> >
> > Changes since v2:
> >  - Removed references of KVM_REQ_IRQ_PENDING from all patches
> >  - Use kvm->srcu within in-kernel KVM run loop
> >  - Added percpu vsip_shadow to track last value programmed in VSIP CSR
> >  - Added comments about irqs_pending and irqs_pending_mask
> >  - Used kvm_arch_vcpu_runnable() in-place-of kvm_riscv_vcpu_has_interrupt()
> >    in system_opcode_insn()
> >  - Removed unwanted smp_wmb() in kvm_riscv_stage2_vmid_update()
> >  - Use kvm_flush_remote_tlbs() in kvm_riscv_stage2_vmid_update()
> >  - Use READ_ONCE() in kvm_riscv_stage2_update_hgatp() for vmid
> >
> > Changes since v1:
> >  - Fixed compile errors in building KVM RISC-V as module
> >  - Removed unused kvm_riscv_halt_guest() and kvm_riscv_resume_guest()
> >  - Set KVM_CAP_SYNC_MMU capability only after MMU notifiers are implemented
> >  - Made vmid_version as unsigned long instead of atomic
> >  - Renamed KVM_REQ_UPDATE_PGTBL to KVM_REQ_UPDATE_HGATP
> >  - Renamed kvm_riscv_stage2_update_pgtbl() to kvm_riscv_stage2_update_hgatp()
> >  - Configure HIDELEG and HEDELEG in kvm_arch_hardware_enable()
> >  - Updated ONE_REG interface for CSR access to user-space
> >  - Removed irqs_pending_lock and use atomic bitops instead
> >  - Added separate patch for FP ONE_REG interface
> >  - Added separate patch for updating MAINTAINERS file
> >
> > Anup Patel (13):
> >   RISC-V: Add hypervisor extension related CSR defines
> >   RISC-V: Add initial skeletal KVM support
> >   RISC-V: KVM: Implement VCPU create, init and destroy functions
> >   RISC-V: KVM: Implement VCPU interrupts and requests handling
> >   RISC-V: KVM: Implement KVM_GET_ONE_REG/KVM_SET_ONE_REG ioctls
> >   RISC-V: KVM: Implement VCPU world-switch
> >   RISC-V: KVM: Handle MMIO exits for VCPU
> >   RISC-V: KVM: Handle WFI exits for VCPU
> >   RISC-V: KVM: Implement VMID allocator
> >   RISC-V: KVM: Implement stage2 page table programming
> >   RISC-V: KVM: Implement MMU notifiers
> >   RISC-V: KVM: Document RISC-V specific parts of KVM API
> >   RISC-V: KVM: Add MAINTAINERS entry
> >
> > Atish Patra (4):
> >   RISC-V: KVM: Add timer functionality
> >   RISC-V: KVM: FP lazy save/restore
> >   RISC-V: KVM: Implement ONE REG interface for FP registers
> >   RISC-V: KVM: Add SBI v0.1 support
> >
> >  Documentation/virt/kvm/api.rst          | 193 ++++-
> >  MAINTAINERS                             |  12 +
> >  arch/riscv/Kconfig                      |   1 +
> >  arch/riscv/Makefile                     |   1 +
> >  arch/riscv/include/asm/csr.h            |  87 +++
> >  arch/riscv/include/asm/kvm_host.h       | 266 +++++++
> >  arch/riscv/include/asm/kvm_types.h      |   7 +
> >  arch/riscv/include/asm/kvm_vcpu_timer.h |  44 ++
> >  arch/riscv/include/uapi/asm/kvm.h       | 128 +++
> >  arch/riscv/kernel/asm-offsets.c         | 156 ++++
> >  arch/riscv/kvm/Kconfig                  |  36 +
> >  arch/riscv/kvm/Makefile                 |  25 +
> >  arch/riscv/kvm/main.c                   | 118 +++
> >  arch/riscv/kvm/mmu.c                    | 802 +++++++++++++++++++
> >  arch/riscv/kvm/tlb.S                    |  74 ++
> >  arch/riscv/kvm/vcpu.c                   | 997 ++++++++++++++++++++++++
> >  arch/riscv/kvm/vcpu_exit.c              | 701 +++++++++++++++++
> >  arch/riscv/kvm/vcpu_sbi.c               | 185 +++++
> >  arch/riscv/kvm/vcpu_switch.S            | 400 ++++++++++
> >  arch/riscv/kvm/vcpu_timer.c             | 225 ++++++
> >  arch/riscv/kvm/vm.c                     |  97 +++
> >  arch/riscv/kvm/vmid.c                   | 120 +++
> >  drivers/clocksource/timer-riscv.c       |   9 +
> >  include/clocksource/timer-riscv.h       |  16 +
> >  include/uapi/linux/kvm.h                |   8 +
> >  25 files changed, 4699 insertions(+), 9 deletions(-)
> >  create mode 100644 arch/riscv/include/asm/kvm_host.h
> >  create mode 100644 arch/riscv/include/asm/kvm_types.h
> >  create mode 100644 arch/riscv/include/asm/kvm_vcpu_timer.h
> >  create mode 100644 arch/riscv/include/uapi/asm/kvm.h
> >  create mode 100644 arch/riscv/kvm/Kconfig
> >  create mode 100644 arch/riscv/kvm/Makefile
> >  create mode 100644 arch/riscv/kvm/main.c
> >  create mode 100644 arch/riscv/kvm/mmu.c
> >  create mode 100644 arch/riscv/kvm/tlb.S
> >  create mode 100644 arch/riscv/kvm/vcpu.c
> >  create mode 100644 arch/riscv/kvm/vcpu_exit.c
> >  create mode 100644 arch/riscv/kvm/vcpu_sbi.c
> >  create mode 100644 arch/riscv/kvm/vcpu_switch.S
> >  create mode 100644 arch/riscv/kvm/vcpu_timer.c
> >  create mode 100644 arch/riscv/kvm/vm.c
> >  create mode 100644 arch/riscv/kvm/vmid.c
> >  create mode 100644 include/clocksource/timer-riscv.h
> >
> > --
> > 2.25.1
> >
>
> The RISC-V H-extension is now frozen. Please refer to the latest
> RISC-V privilege specification v1.12 which is in public review.
> https://github.com/riscv/riscv-isa-manual/releases/download/riscv-privileged-20210915-public-review/riscv-privileged-20210915-public-review.pdf
>
> Currently, the RISC-V H-extension is on it's way to being ratified.
> https://wiki.riscv.org/display/TECH/ISA+Extensions+On+Deck+for+Freeze+Milestone
> https://wiki.riscv.org/display/TECH/ISA+Extensions+On+Deck+-+Ready+for+Ratification+Milestone
>
> Here's the announcement on twitter from Mark (CTO, RISC-V International)
> https://twitter.com/mark_riscv/status/1441375977624375296
>
> This means the KVM RISC-V series now satisfies the
> requirements of the Linux RISC-V patch acceptance policy.
>
> Can we consider the KVM RISC-V series for Linux-5.16 ?
>
> Regards,
> Anup

Hi Anup

I have tried this patchset, but have problems starting the kvm on host linux.
Both Qemu and Spike are unable to run kvm.

1. Qemu: have the following error when starting kvm.

[   17.877101] Run /init as init process
[  217.908013] kvm [61]: VCPU exit error -14
[  217.908577] kvm [61]: SEPC=0x7e86a SSTATUS=0x4020 HSTATUS=0x200200080
[  217.909626] kvm [61]: SCAUSE=0x2 STVAL=0x20866633 HTVAL=0x0 HTINST=0x0
KVM_RUN failed: Bad address

2. Spike: Stop at this line when starting kvm.

[    1.116675] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[    1.120875] NET: Registered PF_PACKET protocol family
[    1.123830] 9pnet: Installing 9P2000 support
[    1.127935] Key type dns_resolver registered
[    1.130390] debug_vm_pgtable: [debug_vm_pgtable         ]:
Validating architecture page table helpers

These are the git repo that I'm using:
Linux: https://github.com/avpatel/linux/tree/riscv_kvm_v20
Qemu: https://gitlab.com/qemu-project/qemu.git  (master branch)
Spike: https://github.com/riscv/riscv-isa-sim.git (master branch)
kvm-tool: https//github.com/avpatel/kvmtool.git

Any other things that need to be updated to make it work?

Note, previous v19 patchset is okay.

Regards
Ley Foon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
