Return-Path: <SRS0=Z6yX=OZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94AD3C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Oct 2021 04:44:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B6BF61130
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Oct 2021 04:44:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4B6BF61130
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=lAVbA360qYtkDUwLdEf2EPmbmQVpGgKaL8nFhxKuekM=; b=lloBSm46uhrBhcnUcgWJeQyv3i
	ec1nbN0u8OMj/cFz6tXubUqQCIVg0auZjTROegJWvUACRkw+Z65oCThuMEKwV73rmfv+Bgzw2F/fz
	ukDG/C3vAr4TCgD0KnLZ2v/NaIWDOetSBESnHjkl9ydDKM4hEofPDDRMkAs2XazNX0LEmz66UzoCn
	qICr6QYGTqDM0Xgx3oY5dCCANPPiBuroxqo6DLQ56qcQZzVAA54acl+NT02CL9aLSHy5B6iswh/Av
	4s7/ljk3gQv0KCdvrItq6m17SH0KQWlPzg2j9vBVzIDUPRUHVaOoGAPNGFCjCwshv+3wNP0wlJhTB
	xV+ALnog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXcJB-008uJn-Rw; Tue, 05 Oct 2021 04:44:05 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXcJ8-008uIl-Q1
 for linux-riscv@lists.infradead.org; Tue, 05 Oct 2021 04:44:04 +0000
Received: by mail-pj1-x102b.google.com with SMTP id np13so3125412pjb.4
 for <linux-riscv@lists.infradead.org>; Mon, 04 Oct 2021 21:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=uovvNPqcOtPITvL35pdS3OwBKy+1DRqZZ8OvlQeXHzI=;
 b=oAazWwvn5l02BM3cJ1+Ec1NwiFJarB9m+UCP6BZylJshjtkYus2pglZGsOtpVfGh6H
 951A5tI7PJtzdfKPIvrSFeIZDEKS4MqenFAEDcp+z8z3vbsZZrVF7PFAt+X2AglSuVlc
 cgkLKemWTHaOe/gvWuVhmPSWxcNlzppomsPWAWMeYBIjZBz+uNPsxDNc5bvnUlI8u/Ae
 q0WiSZD+ijWoiqOpn4yHu2PHfOeXSvsj4gKQ4wBCVqEKHzLaLiaUO4H/Pa+xAfmCiwSE
 wh1BV3HDYsKqXHHSGuV0ETkv7f92cMHJrgdFjl/MLlvzQbEqMcavHuQQFjCtX8te9OMd
 JrZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=uovvNPqcOtPITvL35pdS3OwBKy+1DRqZZ8OvlQeXHzI=;
 b=qBuqSgwkjlFQn5hA3nxA9QR9ryCyLo6uduyKd2nItjYzeqc1wK6DoGul6heFvH6So/
 VKrSyzh2AQvQ5zh+LRmr9sD09FlN4N4DrcNxLeOOPGeBEdtkr0IJ1FG6NyFYtui0uALL
 tkFh+N3G14h4O19c7Fb1lpIFBj6tEChLEugiA/X8Vj4hExrc7HahY8DcdVxHYAllaz3V
 61ddPbQ5pxnVXLP+IhfB32SOPPeWlZI27TNJTQfdrDWutQWHktKIU04agLnvpiQJgZxn
 JufLsvTVnfJyXKgOXA47pFnlKg7DrXxt0IJNpAOZpm2jS0PabNWzAc0hTgg5yy1nEF3X
 rY1A==
X-Gm-Message-State: AOAM530dZvYO8pKfyZA+g61o7AwnbKp2HSQOC+F3oGovXWnoGaGuNpj5
 ZtCbqL+ZH2nS8OdhqWUM/vm6vg==
X-Google-Smtp-Source: ABdhPJyF/LGAVPm/b2lSVNzd2+1Rer/1ulbWJE81Zzb4w/z7CcMhvzPMm5RQsR028OsM9+1THaIAHw==
X-Received: by 2002:a17:90b:1e4d:: with SMTP id
 pi13mr1293626pjb.96.1633409041486; 
 Mon, 04 Oct 2021 21:44:01 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id m2sm16088591pgd.70.2021.10.04.21.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 21:44:01 -0700 (PDT)
Date: Mon, 04 Oct 2021 21:44:01 -0700 (PDT)
X-Google-Original-Date: Mon, 04 Oct 2021 21:43:59 PDT (-0700)
Subject: Re: [PATCH v20 00/17] KVM RISC-V Support
In-Reply-To: <CAAhSdy1vQg+UKxquZiQG32YFmU95xYc_4Yb_VUA0nd=t8vRu-A@mail.gmail.com>
CC: pbonzini@redhat.com, Anup Patel <Anup.Patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 graf@amazon.com, Atish Patra <Atish.Patra@wdc.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Damien Le Moal <Damien.LeMoal@wdc.com>, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: anup@brainfault.org
Message-ID: <mhng-a3959620-f7e2-4ece-96bc-72fec3e58629@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_214402_878993_3014D965 
X-CRM114-Status: GOOD (  23.09  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 04 Oct 2021 21:22:36 PDT (-0700), anup@brainfault.org wrote:
> On Mon, Oct 4, 2021 at 11:31 PM Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>>
>> On Mon, 04 Oct 2021 01:58:28 PDT (-0700), pbonzini@redhat.com wrote:
>> > On 27/09/21 13:39, Anup Patel wrote:
>> >> This series adds initial KVM RISC-V support. Currently, we are able to boot
>> >> Linux on RV64/RV32 Guest with multiple VCPUs.
>> >>
>> >> Key aspects of KVM RISC-V added by this series are:
>> >> 1. No RISC-V specific KVM IOCTL
>> >> 2. Loadable KVM RISC-V module supported
>> >> 3. Minimal possible KVM world-switch which touches only GPRs and few CSRs
>> >> 4. Both RV64 and RV32 host supported
>> >> 5. Full Guest/VM switch is done via vcpu_get/vcpu_put infrastructure
>> >> 6. KVM ONE_REG interface for VCPU register access from user-space
>> >> 7. PLIC emulation is done in user-space
>> >> 8. Timer and IPI emuation is done in-kernel
>> >> 9. Both Sv39x4 and Sv48x4 supported for RV64 host
>> >> 10. MMU notifiers supported
>> >> 11. Generic dirtylog supported
>> >> 12. FP lazy save/restore supported
>> >> 13. SBI v0.1 emulation for KVM Guest available
>> >> 14. Forward unhandled SBI calls to KVM userspace
>> >> 15. Hugepage support for Guest/VM
>> >> 16. IOEVENTFD support for Vhost
>> >>
>> >> Here's a brief TODO list which we will work upon after this series:
>> >> 1. KVM unit test support
>> >> 2. KVM selftest support
>> >> 3. SBI v0.3 emulation in-kernel
>> >> 4. In-kernel PMU virtualization
>> >> 5. In-kernel AIA irqchip support
>> >> 6. Nested virtualizaiton
>> >> 7. ..... and more .....
>> >
>> > Looks good, I prepared a tag "for-riscv" at
>> > https://git.kernel.org/pub/scm/virt/kvm/kvm.git.  Palmer can pull it and
>> > you can use it to send me a pull request.
>>
>> Thanks.  I'm assuming "you" there is Anup?
>>
>> Just to make sure we're on the same page here, I've got
>>
>>     commit 6c341a285912ddb2894ef793a58ad4f8462f26f4 (HEAD -> for-next)
>>     Merge: 08da1608a1ca 3f2401f47d29
>>     Author: Palmer Dabbelt <palmerdabbelt@google.com>
>>     Date:   Mon Oct 4 10:12:44 2021 -0700
>>
>>         Merge tag 'for-riscv' of https://git.kernel.org/pub/scm/virt/kvm/kvm.git into for-next
>>
>>         H extension definitions, shared by the KVM and RISC-V trees.
>>
>>         * tag 'for-riscv' of ssh://gitolite.kernel.org/pub/scm/virt/kvm/kvm: (301 commits)
>>           RISC-V: Add hypervisor extension related CSR defines
>>           KVM: selftests: Ensure all migrations are performed when test is affined
>>           KVM: x86: Swap order of CPUID entry "index" vs. "significant flag" checks
>>           ptp: Fix ptp_kvm_getcrosststamp issue for x86 ptp_kvm
>>           x86/kvmclock: Move this_cpu_pvti into kvmclock.h
>>           KVM: s390: Function documentation fixes
>>           selftests: KVM: Don't clobber XMM register when read
>>           KVM: VMX: Fix a TSX_CTRL_CPUID_CLEAR field mask issue
>>           selftests: KVM: Explicitly use movq to read xmm registers
>>           selftests: KVM: Call ucall_init when setting up in rseq_test
>>           KVM: Remove tlbs_dirty
>>           KVM: X86: Synchronize the shadow pagetable before link it
>>           KVM: X86: Fix missed remote tlb flush in rmap_write_protect()
>>           KVM: x86: nSVM: don't copy virt_ext from vmcb12
>>           KVM: x86: nSVM: test eax for 4K alignment for GP errata workaround
>>           KVM: x86: selftests: test simultaneous uses of V_IRQ from L1 and L0
>>           KVM: x86: nSVM: restore int_vector in svm_clear_vintr
>>           kvm: x86: Add AMD PMU MSRs to msrs_to_save_all[]
>>           KVM: x86: nVMX: re-evaluate emulation_required on nested VM exit
>>           KVM: x86: nVMX: don't fail nested VM entry on invalid guest state if !from_vmentry
>>           ...
>>
>> into ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git for-next
>> (I know that's kind of a confusing name, but it's what I've been using
>> as my short-term staging branch so I can do all my tests before saying
>> "it's on for-next").
>>
>> If that looks OK I can make it a touch more official by putting into the
>> RISC-V tree.
>>
>> > I look forward to the test support. :)  Would be nice to have selftest
>> > support already in 5.16, since there are a few arch-independent
>> > selftests that cover the hairy parts of the MMU.
>>
>> Me too ;).
>>
>> I'm happy to add some KVM-related stuff to my pre-push test set, just
>> LMK if there's anything specific I should be looking in to.
>
> Thanks Palmer, I will ping you once I have basic kvm-selftest patches
> ready for RISC-V.

Sonuds good.  I was just rewriting history (oops) because I forgot a 
SOB, so the hash is a bit different but it the merge is still the tip of 
palmer/for-next.

73698660f17c Merge tag 'for-riscv' of https://git.kernel.org/pub/scm/virt/kvm/kvm.git into for-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
