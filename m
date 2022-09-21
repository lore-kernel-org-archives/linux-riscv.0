Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 975DAC6FA82
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 01:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:Mime-Version:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=V2zz64KaIUCiHuV03QVGC6v1VtyGDfcj80adJOz2gIs=; b=lQIqPzhFeP2z49
	sLCQaBqs++S0UpDvCCYrOVQXymyhsquSudjUoBCaKmIe/Fgd6hd8e3XVEk07sh81Qj1hRgSsoTk4B
	4XzbGU/lGC68OzMQWpfxwuWkLL6MOIIAFSqpZ3+xFMbtfA6i9TjPdxD9969af8p3OiaVKT2JpTyUL
	clPUl7FWWIIF5CxYqZ8usEfkmab0AHcCveuvm3gHN5mKwyjMtl6XPLxg8QSUi2DmbpMpmjL8SlC8V
	pJdJxQ8i01LaNDK3q65b/QVImjtMBVcNZhTmysQJVnx5OT5vB6uTBRSpJgFttlpu1w4CPJjnSdtDU
	aQXLAusoP3nNd9Pdx2OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaooT-0082II-LB; Wed, 21 Sep 2022 01:46:09 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oanfV-007hlD-6M
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 00:32:50 +0000
Received: by mail-pf1-x449.google.com with SMTP id g24-20020a056a00079800b0054b1a110543so2564622pfu.2
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 17:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date;
        bh=YVTX41DvvKxI+UwJXy7clPsFGJGlirwL5Ozkg5cZ92g=;
        b=jsAJOmaw4PgLCggNnx5/TYjU6cPknBULwo8y0CP8EG2Sw1Ww/Zrcrj6rGqXRDdQXIy
         EWBMc+N0YIPVg9+2uIB4J+yKk6tMlcVTEVpV4JuWamxfv2EHt8Ej3zHy+5oNaS33lDfN
         vH0m6DcsIZmg5DI1FTeFfpS1f4mHkStL+K18cPVuWZt5XpaSJGD13ON+coD8QTFYFBT0
         2meYcKf8yaGiX/cOLkiucS7uLGTg/lFhOnl9Bpa7jzJMpOV+XF1YoiuyQSMhVGmgnyon
         QYw+h9rG1jod+1d+oEBVHjsWVAsFeTGvZgaCNWH4jrGOsY16rCNYJVCAAf8mzBIPZVXO
         9sQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date;
        bh=YVTX41DvvKxI+UwJXy7clPsFGJGlirwL5Ozkg5cZ92g=;
        b=n1Kap1G6YdpllSKRCqwWR8YRI7zNT5bVO6klA4y7Hx0L/UEPYmaHidmEOMv/TZ3/aK
         YnLQ7EUmFSh3maha0WwIgmLId7pR4XJPRlc4UPAiB9p1BhNaKPTos2SX4gOwjHdyhP6t
         /S2Wjs6KtqSnCrzLaR6VOGC6udH5cW+IppA50XkaBYrp9TpVisx0hoVB92sfJTXFjhCx
         xw7kSUmXSimqh/LBhpiahSvETRv/py9pmL+Tb1Ea6LDsmgC76RXXowXO/y3ex1YrSw/0
         NhhAsZaGSkjyVT6I/dOvuPhOMbX6nnwIMveeX8iVIgsOkPKSsbtywvDoJxoKdo3CF7dz
         hKcg==
X-Gm-Message-State: ACrzQf1XoHbIIRJ3U7GnRJMLauni7Hk7TKTp98Y4a06jW2bo3HLc8Ps6
	BkEEvhWRmC07JVBEb4oVDqZJGjRvFio=
X-Google-Smtp-Source: AMsMyM5IXBzO0Z3bLf7U4Nl4fzPxWQVIxnXG7eLk3nZYDV6O9qarsIgEDf3VrL/1WyPiWF5/ev4wovLKs6Q=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:854:b0:542:4254:17f6 with SMTP id
 q20-20020a056a00085400b00542425417f6mr25988846pfk.47.1663720366656; Tue, 20
 Sep 2022 17:32:46 -0700 (PDT)
Date: Wed, 21 Sep 2022 00:31:49 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
Message-ID: <20220921003201.1441511-1-seanjc@google.com>
Subject: [PATCH v4 00/12] KVM: x86: never write to memory from kvm_vcpu_check_block
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Atish Patra <atishp@atishpatra.org>, David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Maxim Levitsky <mlevitsk@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_173249_242369_D4451EC1 
X-CRM114-Status: GOOD (  17.41  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Non-x86 folks, there's nothing interesting to see here, y'all got pulled
in because removing KVM_REQ_UNHALT requires deleting kvm_clear_request()
from arch code.

Note, this based on:

	https://github.com/sean-jc/linux.git tags/kvm-x86-6.1-1

to pre-resolve conflicts with the event/exception cleanups in there.


In Paolo's words...

The following backtrace:

[ 1355.807187]  kvm_vcpu_map+0x159/0x190 [kvm]
[ 1355.807628]  nested_svm_vmexit+0x4c/0x7f0 [kvm_amd]
[ 1355.808036]  ? kvm_vcpu_block+0x54/0xa0 [kvm]
[ 1355.808450]  svm_check_nested_events+0x97/0x390 [kvm_amd]
[ 1355.808920]  kvm_check_nested_events+0x1c/0x40 [kvm] 
[ 1355.809396]  kvm_arch_vcpu_runnable+0x4e/0x190 [kvm]
[ 1355.809892]  kvm_vcpu_check_block+0x4f/0x100 [kvm]
[ 1355.811259]  kvm_vcpu_block+0x6b/0xa0 [kvm] 

can occur due to kmap being called in non-sleepable (!TASK_RUNNING) context.
The fix is to extend kvm_x86_ops->nested_ops.hv_timer_pending() to cover
all events not already checked in kvm_arch_vcpu_is_runnable(), and then
get rid of the annoying (and wrong) call to kvm_check_nested_events()
from kvm_vcpu_check_block().

Beware, this is not a complete fix, because kvm_guest_apic_has_interrupt()
might still _read_ memory from non-sleepable context.  The fix here is
probably to make kvm_arch_vcpu_is_runnable() return -EAGAIN, and in that
case do a round of kvm_vcpu_check_block() polling in sleepable context.
Nevertheless, it is a good start as it pushes the vmexit into vcpu_block().

The series also does a small cleanup pass on kvm_vcpu_check_block(),
removing KVM_REQ_UNHALT in favor of simply calling kvm_arch_vcpu_runnable()
again.  Now that kvm_check_nested_events() is not called anymore by
kvm_arch_vcpu_runnable(), it is much easier to see that KVM will never
consume the event that caused kvm_vcpu_has_events() to return true,
and therefore it is safe to evaluate it again.

The alternative of propagating the return value of
kvm_arch_vcpu_runnable() up to kvm_vcpu_{block,halt}() is inferior
because it does not quite get right the edge cases where the vCPU becomes
runnable right before schedule() or right after kvm_vcpu_check_block().
While these edge cases are unlikely to truly matter in practice, it is
also pointless to get them "wrong".

v4:
  - Make event request if INIT/SIPI is pending when GIF=>1 (SVM) and
    on nested VM-Enter (VMX).
  - Make an event request at VMXOFF iff it's necessary.
  - Keep the INIT/SIPI pending vs. blocked checks separate (for the
    above nSVM/nVMX fixes).
  - Check the result of kvm_check_nested_events() in vcpu_block().
  - Rename INIT/SIPI helpers (hopefully we'll eventually rename all of
    the related collateral, e.g. "pending_events" is so misleading).
  - Drop pending INIT/SIPI snaphsot to avoid creating weird, conflicting
    code when kvm_check_nested_events() is called by vcpu_block().

v3:
  - https://lore.kernel.org/all/20220822170659.2527086-1-pbonzini@redhat.com
  - do not propagate the return value of  kvm_arch_vcpu_runnable() up to
    kvm_vcpu_{block,halt}()
  - move and reformat the comment in vcpu_block()

    move KVM_REQ_UNHALT removal last

Paolo Bonzini (5):
  KVM: x86: make vendor code check for all nested events
  KVM: x86: lapic does not have to process INIT if it is blocked
  KVM: x86: never write to memory from kvm_vcpu_check_block()
  KVM: mips, x86: do not rely on KVM_REQ_UNHALT
  KVM: remove KVM_REQ_UNHALT

Sean Christopherson (7):
  KVM: nVMX: Make an event request when pending an MTF nested VM-Exit
  KVM: x86: Rename and expose helper to detect if INIT/SIPI are allowed
  KVM: x86: Rename kvm_apic_has_events() to make it INIT/SIPI specific
  KVM: SVM: Make an event request if INIT or SIPI is pending when GIF is
    set
  KVM: nVMX: Make an event request if INIT or SIPI is pending on
    VM-Enter
  KVM: nVMX: Make event request on VMXOFF iff INIT/SIPI is pending
  KVM: x86: Don't snapshot pending INIT/SIPI prior to checking nested
    events

 Documentation/virt/kvm/vcpu-requests.rst | 28 +--------------
 arch/arm64/kvm/arm.c                     |  1 -
 arch/mips/kvm/emulate.c                  |  6 ++--
 arch/powerpc/kvm/book3s_pr.c             |  1 -
 arch/powerpc/kvm/book3s_pr_papr.c        |  1 -
 arch/powerpc/kvm/booke.c                 |  1 -
 arch/powerpc/kvm/powerpc.c               |  1 -
 arch/riscv/kvm/vcpu_insn.c               |  1 -
 arch/s390/kvm/kvm-s390.c                 |  2 --
 arch/x86/include/asm/kvm_host.h          |  2 +-
 arch/x86/kvm/lapic.c                     | 38 ++++++--------------
 arch/x86/kvm/lapic.h                     |  9 ++++-
 arch/x86/kvm/svm/svm.c                   |  3 +-
 arch/x86/kvm/vmx/nested.c                | 33 +++++++++--------
 arch/x86/kvm/vmx/vmx.c                   |  6 ++--
 arch/x86/kvm/x86.c                       | 46 +++++++++++++++---------
 arch/x86/kvm/x86.h                       |  5 ---
 arch/x86/kvm/xen.c                       |  1 -
 include/linux/kvm_host.h                 |  3 +-
 virt/kvm/kvm_main.c                      |  4 +--
 20 files changed, 79 insertions(+), 113 deletions(-)


base-commit: 5df50a4a9b60afba4dd2be76d0f0fb8ae8c9beab
-- 
2.37.3.968.ga6b4b080e4-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
