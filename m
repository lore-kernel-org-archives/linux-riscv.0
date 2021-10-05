Return-Path: <SRS0=Z6yX=OZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43AE1C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Oct 2021 04:23:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF80961184
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Oct 2021 04:23:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EF80961184
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fplCSwgYXSZJouKDHfmv4gKv1N3zhqMqBPwZqDxfUE8=; b=pr4rhgE7Nxq28i
	X3YsfXeQjX++He/JkWmpMNr141jH3KAYGdv8H2a7xRDqGbnkCvrvQKDMipu/64IV0V4ka/IHGoo8H
	9RRFo5ray+mdygyxQUm9VZ74Ewz5KHl16w3horbpzcBeeMXNRt2WF7mUrRE165dk3w3Fg9GSe6Wcb
	VAH1kWCXo3OTeB8sQ9rzNMTQokzJnx0gWaKh13q5JVlFeO80qo6omaXyCjwFdJxz+GYqxuNnEJ2LV
	NyHsGsx8vLZvQDR2rHXF9bZQm3H7J+XdUa79ZIsreP4j2IQr5aO48rjGAiEdVQ1Mr0ovSIsu7zd23
	BxsWyZKDFpeMqp0hgteA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXbye-008rvE-S4; Tue, 05 Oct 2021 04:22:52 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXbyb-008rtt-OT
 for linux-riscv@lists.infradead.org; Tue, 05 Oct 2021 04:22:51 +0000
Received: by mail-wm1-x332.google.com with SMTP id s24so15250896wmh.4
 for <linux-riscv@lists.infradead.org>; Mon, 04 Oct 2021 21:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PMJ+9x8m5hwSi/H7EIQliJKkNzjB0DxfaHLEuq28K2o=;
 b=SZ9ECJ51JcaeYSmGP0VckwfF4wtaA9CXQo76dxViUkdRIljjPdLkCsuGAfF5uQWcFf
 eqoAgGjpbsDeFoJPfrfR0anidoGqsCNQ1LQtAewcGyL57fV2LmE2t4I2MB4+iV2+5xiV
 Tj9v4cMPYjN45x3VZsZXzDfa7ZUe9cAcUtGUnNfz8ObAd+mddcA4hS1qgmDuyO5Y+Jm2
 TFYVr+PKJgy/HEus1PynsMihA0d7V1bFrTBpSIsKy8LYCux3E123IEvDqjTpNTqNTle+
 nsvh+VoQHr1Wws2Fi0yHoAls/FMT6QU2XB32uQtjFsZ2bsCZE3H1XHR3r3etG/EE1vvz
 3ZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PMJ+9x8m5hwSi/H7EIQliJKkNzjB0DxfaHLEuq28K2o=;
 b=3jnPlnWY19e9+e0nT8HhAjDgXaIDFQOr8s30B7/IZtKWw/rfhOcHfLh4RJc6RJx8JS
 0YkbKbMUSUib8lyGvD9QFpPliugS3YZqtMgv2ZfnvrIZXZ79fnBjb6dwtqZtsEc8b3YG
 35AI6AV+Telj9BH/PF81qgh0UducuniAEOTXZrwormGfmLEDIUGQ8AKO23+wif8j2Kxm
 UEDI5apFHPd3evyt+Zq6VN5vNW5GWw7ay2i+jdXBCc6gjcJWCxhdui1a7EbQO0jy9fKR
 LW12G9/qwBA5NnHIJ92dH4osIq5DUkjfc6aoXiV918xYAs1s0gbsr8eydvqjsa9R1T06
 N4DQ==
X-Gm-Message-State: AOAM533tOyWURSfniNuGHwbGrVq252VAuUE0VnWxStYeobPTyTUH1jTH
 xUbsScqrmDv69KhfGQ85Cti4HJwalwlU4rzwbU1ANA==
X-Google-Smtp-Source: ABdhPJzjJ2NZbFDT+6nC0o5g30O6wQOKxAZi70Cyuqf41cn5zzONv0xSUwWWt9L0ghl89U+hsvaOeL64c4eNnMNjnUI=
X-Received: by 2002:a05:600c:41d6:: with SMTP id
 t22mr1029713wmh.59.1633407768121; 
 Mon, 04 Oct 2021 21:22:48 -0700 (PDT)
MIME-Version: 1.0
References: <5cadb0b3-5e8f-110b-c6ed-4adaea033e58@redhat.com>
 <mhng-1bfcbce2-3da3-4490-bcc5-45173ad84285@palmerdabbelt-glaptop>
In-Reply-To: <mhng-1bfcbce2-3da3-4490-bcc5-45173ad84285@palmerdabbelt-glaptop>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 5 Oct 2021 09:52:36 +0530
Message-ID: <CAAhSdy1vQg+UKxquZiQG32YFmU95xYc_4Yb_VUA0nd=t8vRu-A@mail.gmail.com>
Subject: Re: [PATCH v20 00/17] KVM RISC-V Support
To: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Anup Patel <Anup.Patel@wdc.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexander Graf <graf@amazon.com>, Atish Patra <Atish.Patra@wdc.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Damien Le Moal <Damien.LeMoal@wdc.com>, 
 KVM General <kvm@vger.kernel.org>, kvm-riscv@lists.infradead.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_212249_807752_FE3AE9F8 
X-CRM114-Status: GOOD (  26.54  )
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

On Mon, Oct 4, 2021 at 11:31 PM Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>
> On Mon, 04 Oct 2021 01:58:28 PDT (-0700), pbonzini@redhat.com wrote:
> > On 27/09/21 13:39, Anup Patel wrote:
> >> This series adds initial KVM RISC-V support. Currently, we are able to boot
> >> Linux on RV64/RV32 Guest with multiple VCPUs.
> >>
> >> Key aspects of KVM RISC-V added by this series are:
> >> 1. No RISC-V specific KVM IOCTL
> >> 2. Loadable KVM RISC-V module supported
> >> 3. Minimal possible KVM world-switch which touches only GPRs and few CSRs
> >> 4. Both RV64 and RV32 host supported
> >> 5. Full Guest/VM switch is done via vcpu_get/vcpu_put infrastructure
> >> 6. KVM ONE_REG interface for VCPU register access from user-space
> >> 7. PLIC emulation is done in user-space
> >> 8. Timer and IPI emuation is done in-kernel
> >> 9. Both Sv39x4 and Sv48x4 supported for RV64 host
> >> 10. MMU notifiers supported
> >> 11. Generic dirtylog supported
> >> 12. FP lazy save/restore supported
> >> 13. SBI v0.1 emulation for KVM Guest available
> >> 14. Forward unhandled SBI calls to KVM userspace
> >> 15. Hugepage support for Guest/VM
> >> 16. IOEVENTFD support for Vhost
> >>
> >> Here's a brief TODO list which we will work upon after this series:
> >> 1. KVM unit test support
> >> 2. KVM selftest support
> >> 3. SBI v0.3 emulation in-kernel
> >> 4. In-kernel PMU virtualization
> >> 5. In-kernel AIA irqchip support
> >> 6. Nested virtualizaiton
> >> 7. ..... and more .....
> >
> > Looks good, I prepared a tag "for-riscv" at
> > https://git.kernel.org/pub/scm/virt/kvm/kvm.git.  Palmer can pull it and
> > you can use it to send me a pull request.
>
> Thanks.  I'm assuming "you" there is Anup?
>
> Just to make sure we're on the same page here, I've got
>
>     commit 6c341a285912ddb2894ef793a58ad4f8462f26f4 (HEAD -> for-next)
>     Merge: 08da1608a1ca 3f2401f47d29
>     Author: Palmer Dabbelt <palmerdabbelt@google.com>
>     Date:   Mon Oct 4 10:12:44 2021 -0700
>
>         Merge tag 'for-riscv' of https://git.kernel.org/pub/scm/virt/kvm/kvm.git into for-next
>
>         H extension definitions, shared by the KVM and RISC-V trees.
>
>         * tag 'for-riscv' of ssh://gitolite.kernel.org/pub/scm/virt/kvm/kvm: (301 commits)
>           RISC-V: Add hypervisor extension related CSR defines
>           KVM: selftests: Ensure all migrations are performed when test is affined
>           KVM: x86: Swap order of CPUID entry "index" vs. "significant flag" checks
>           ptp: Fix ptp_kvm_getcrosststamp issue for x86 ptp_kvm
>           x86/kvmclock: Move this_cpu_pvti into kvmclock.h
>           KVM: s390: Function documentation fixes
>           selftests: KVM: Don't clobber XMM register when read
>           KVM: VMX: Fix a TSX_CTRL_CPUID_CLEAR field mask issue
>           selftests: KVM: Explicitly use movq to read xmm registers
>           selftests: KVM: Call ucall_init when setting up in rseq_test
>           KVM: Remove tlbs_dirty
>           KVM: X86: Synchronize the shadow pagetable before link it
>           KVM: X86: Fix missed remote tlb flush in rmap_write_protect()
>           KVM: x86: nSVM: don't copy virt_ext from vmcb12
>           KVM: x86: nSVM: test eax for 4K alignment for GP errata workaround
>           KVM: x86: selftests: test simultaneous uses of V_IRQ from L1 and L0
>           KVM: x86: nSVM: restore int_vector in svm_clear_vintr
>           kvm: x86: Add AMD PMU MSRs to msrs_to_save_all[]
>           KVM: x86: nVMX: re-evaluate emulation_required on nested VM exit
>           KVM: x86: nVMX: don't fail nested VM entry on invalid guest state if !from_vmentry
>           ...
>
> into ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git for-next
> (I know that's kind of a confusing name, but it's what I've been using
> as my short-term staging branch so I can do all my tests before saying
> "it's on for-next").
>
> If that looks OK I can make it a touch more official by putting into the
> RISC-V tree.
>
> > I look forward to the test support. :)  Would be nice to have selftest
> > support already in 5.16, since there are a few arch-independent
> > selftests that cover the hairy parts of the MMU.
>
> Me too ;).
>
> I'm happy to add some KVM-related stuff to my pre-push test set, just
> LMK if there's anything specific I should be looking in to.

Thanks Palmer, I will ping you once I have basic kvm-selftest patches
ready for RISC-V.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
