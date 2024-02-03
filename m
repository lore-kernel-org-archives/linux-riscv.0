Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEFCAC4828F
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Feb 2024 00:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:Mime-Version:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xhkSAK46vwGuaE2sgjuDThRVAxR5TpYTDM8cyQSz49Q=; b=Y95Z9YFaj3+Yl2
	zdrDQD9mbJttfzxzcChhAXATB7d9UckYY/uhSZ+PvWFqcePg5h99QQxj77FWjlQSCrTFQTEKYDmli
	2qylEnHzzJTyLjcLVexfzcdbdr26ECzMK654QZ7ejQHotOtvnTR05gZHy95NpUIgLmWLOI+oipUPL
	eIZgfgvtdfY9JL/b+WGlXclhqjW8ElwFxLrcbvw4Dw3o0qk43QRf9duTNhPkDZdzt0FzbSIakdLkU
	QrEuRfJXzjxUXMyRpePuoPWrIRuleBITcx8zny3E42korK6UDMKMS5yUN6tcUtK2XKJ4M6BbKbDBO
	9OdzRjVzICRFnQADpQww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW3b3-0000000DsWH-1N1F;
	Sat, 03 Feb 2024 00:09:25 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW3b0-0000000DsUf-0gFf
	for linux-riscv@lists.infradead.org;
	Sat, 03 Feb 2024 00:09:23 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-5d43d0d6024so2751775a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 02 Feb 2024 16:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706918961; x=1707523761; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tvzfq6Tb+/LmzZGCY47OcGl4Yg3FqwT4x8FVTh6/pw0=;
        b=axwDI5GhRlgv0wFHbkF5FuzjD0J36h2MWANXQqwaghl+QpX4wDaDSc5AahRGdQHmPu
         mDfM+A5D//ZG3bPMygBH9eaw0XA/sRqoCeTbXTsJCdx4Aj4inkrESEPrfOWTP4xsIN+S
         dieEDdH+679hkyYjgbroyL+/j2bB/Vqvj7Ek9UN0KIItaxBo+/xixpWm5uXW43Evyued
         MHOzLYN72dVQIymkgXofXMKtc2Eev4PxRuQmpzT3DAIImloEUioUeAP6NYG51ZGA0Ux1
         PACalkIA6Fnub1y0t7UfBeW+2EQXusPX+PB9RlNyae1reyCAGiM8rB53w7O8MG+FNCuV
         1lHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706918961; x=1707523761;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tvzfq6Tb+/LmzZGCY47OcGl4Yg3FqwT4x8FVTh6/pw0=;
        b=MT1NdHjRxZiPn0oek2pgSEd+VW90OsS4MF/vPcDa6W5dHAAg8LScNqfnGMQ/j9oZaQ
         u7teZw1HjRriKEnPbTOPK66x64/nQs46I8Cw1usrGjwpEuPIcDnrveY82UxIbvXFqqU6
         eCpNLDCItUALWKbceDGB2YR0L4dhnpqoNBvkpQtNhbjn4/0b+j71jrINY+BDy7p3cNGc
         32OzPIbCstsxZeF7LCtU/AG5hqzdNKcd7Nit5XQQejz6viW2W/P1Dk7vxAVXelKr+fbn
         417Z5cAt7jKaUxY/dWlzkLie5BddDfQlUMFEO9T5u747TcHBaaYnO/CxIwqcOVAOKENY
         9M1A==
X-Gm-Message-State: AOJu0YwtZiZJUgnGZX1SPbdIT5le1UxS/JJTz3vmSIBY28icfcRUZ4WP
	e0PUSw25Eubi6YrTCODpIc1MjRo8I6rxLsppgCYXD6eCE+dYej/HV5hCrxmruXxSp6MDFoqVAL7
	2hw==
X-Google-Smtp-Source: AGHT+IEqzXCmN6ReYMmNGcuC8mmtBhOi0vEe5B/tBx3edOgmg4Vw4BtLnbB387naOpc+iWQYiMA/3I2Kvpo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a65:670b:0:b0:5d7:9b27:8ad4 with SMTP id
 u11-20020a65670b000000b005d79b278ad4mr18346pgf.3.1706918960728; Fri, 02 Feb
 2024 16:09:20 -0800 (PST)
Date: Fri,  2 Feb 2024 16:09:06 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.594.gd9cf4e227d-goog
Message-ID: <20240203000917.376631-1-seanjc@google.com>
Subject: [PATCH v8 00/10] KVM: selftests: Add SEV smoke test
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Andrew Jones <andrew.jones@linux.dev>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Michael Roth <michael.roth@amd.com>, Peter Gonda <pgonda@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_160922_219577_5122A79A 
X-CRM114-Status: GOOD (  14.47  )
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

Add a basic SEV smoke test.  Unlike the intra-host migration tests, this
one actually runs a small chunk of code in the guest.

v8:
 - Undo the kvm.h uAPI breakage.
 - Take advantage of "struct vm_shape", introduced by the guest_memfd
   selftests, to simply tracking the SEV/SEV-ES subtypes.
 - Rename the test to "sev_smoke_test" instead of "sev_all_boot_test",
   as the "all" is rather nonsensical, and the test isn't booting anything
   in the traditional sense of the word.
 - Drop vm->protected and instead add an arch hook to query if the VM has
   protected memory.
 - Assert that the target memory region supports protected memory when
   allocating protected memory.
 - Allocate protected_phy_pages for memory regions if and only if the VM
   supports protected memory.
 - Rename kvm_host.h to kvm_util_arch.h, and move it to selftests/kvm where
   it belongs.
 - Fix up some SoB goofs.
 - Convert the intrahost SEV/SEV-ES migration tests to use common ioctl()
   wrappers.

V7
 * https://lore.kernel.org/all/20231218161146.3554657-1-pgonda@google.com
 * See https://github.com/sean-jc/linux/tree/x86/sev_selftests_for_peter.
 * I kept is_pt_protected because without it the page tables are never
 readable. Its used for the elf loading in kvm_vm_elf_load().

V6
 * Updated SEV VM create function based on Seanjc's feedback and new
   changes to VM creation functions.
 * Removed pte_me_mask based on feedback.
 * Fixed s_bit usage based on TDX
 * Fixed bugs and took Ackerly's code for enc_region setup code.

V5
 * Rebase onto seanjc@'s latest ucall pool series.
 * More review changes based on seanjc:
 ** use protected instead of encrypted outside of SEV specific files
 ** Swap memcrypt struct for kvm_vm_arch arch specific struct
 ** Make protected page table data agnostic of address bit stealing specifics
    of SEV
 ** Further clean up for SEV library to just vm_sev_create_one_vcpu()
 * Due to large changes moved more authorships from mroth@ to pgonda@. Gave
   originally-by tags to mroth@ as suggested by Seanjc for this.

V4
 * Rebase ontop of seanjc@'s latest Ucall Pool series:
   https://lore.kernel.org/linux-arm-kernel/20220825232522.3997340-8-seanjc@google.com/
 * Fix up review comments from seanjc
 * Switch authorship on 2 patches because of significant changes, added
 * Michael as suggested-by or originally-by.

V3
 * Addressed more of andrew.jones@ in ucall patches.
 * Fix build in non-x86 archs.

V2
 * Dropped RFC tag
 * Correctly separated Sean's ucall patches into 2 as originally
   intended.
 * Addressed andrew.jones@ in ucall patches.
 * Fixed ucall pool usage to work for other archs

V1
 * https://lore.kernel.org/all/20220715192956.1873315-1-pgonda@google.com/

Ackerley Tng (1):
  KVM: selftests: Add a macro to iterate over a sparsebit range

Michael Roth (2):
  KVM: selftests: Make sparsebit structs const where appropriate
  KVM: selftests: Add support for protected vm_vaddr_* allocations

Peter Gonda (5):
  KVM: selftests: Add support for allocating/managing protected guest
    memory
  KVM: selftests: Explicitly ucall pool from shared memory
  KVM: selftests: Allow tagging protected memory in guest page tables
  KVM: selftests: Add library for creating and interacting with SEV
    guests
  KVM: selftests: Add a basic SEV smoke test

Sean Christopherson (2):
  KVM: selftests: Extend VM creation's @shape to allow control of VM
    subtype
  KVM: selftests: Use the SEV library APIs in the intra-host migration
    test

 tools/testing/selftests/kvm/Makefile          |   2 +
 .../kvm/include/aarch64/kvm_util_arch.h       |   7 +
 .../selftests/kvm/include/kvm_util_base.h     |  50 ++++++-
 .../kvm/include/riscv/kvm_util_arch.h         |   7 +
 .../kvm/include/s390x/kvm_util_arch.h         |   7 +
 .../testing/selftests/kvm/include/sparsebit.h |  56 +++++---
 .../kvm/include/x86_64/kvm_util_arch.h        |  23 ++++
 .../selftests/kvm/include/x86_64/processor.h  |   8 ++
 .../selftests/kvm/include/x86_64/sev.h        | 110 +++++++++++++++
 tools/testing/selftests/kvm/lib/kvm_util.c    |  67 +++++++--
 tools/testing/selftests/kvm/lib/sparsebit.c   |  48 +++----
 .../testing/selftests/kvm/lib/ucall_common.c  |   3 +-
 .../selftests/kvm/lib/x86_64/processor.c      |  32 ++++-
 tools/testing/selftests/kvm/lib/x86_64/sev.c  | 128 ++++++++++++++++++
 .../selftests/kvm/x86_64/sev_migrate_tests.c  |  67 +++------
 .../selftests/kvm/x86_64/sev_smoke_test.c     |  58 ++++++++
 16 files changed, 570 insertions(+), 103 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/include/aarch64/kvm_util_arch.h
 create mode 100644 tools/testing/selftests/kvm/include/riscv/kvm_util_arch.h
 create mode 100644 tools/testing/selftests/kvm/include/s390x/kvm_util_arch.h
 create mode 100644 tools/testing/selftests/kvm/include/x86_64/kvm_util_arch.h
 create mode 100644 tools/testing/selftests/kvm/include/x86_64/sev.h
 create mode 100644 tools/testing/selftests/kvm/lib/x86_64/sev.c
 create mode 100644 tools/testing/selftests/kvm/x86_64/sev_smoke_test.c


base-commit: 60eedcfceda9db46f1b333e5e1aa9359793f04fb
-- 
2.43.0.594.gd9cf4e227d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
