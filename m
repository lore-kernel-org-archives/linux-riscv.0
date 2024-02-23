Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB1BC47DD9
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Feb 2024 00:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:Mime-Version:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WojhEJqgipQ0i+/ZZnwIbb/D704yYPqBdTcV7XFOLUM=; b=q/CSUYy7LdfrHX
	oezYoZEsxRh58hddIMWYjr7htjW6286bkc11zDPgLnG8RjL9rXKGEX0ZWwxfdaG/uJR3Nw5JQoGj9
	IOuMb2sXkm4/nOsXjiIjlFlqhta1F+XBPF6FFLxtVg6ovWrMZ+TM55+3vf5MR6haR3pxZVuf/ANdL
	jENFqc9cw3lUWxH5AsDHoWFrx5EM1uYWmB8ka4Dfl7jbdv7OsFm9IOpgb7yUoPR3b6vq0GHScKdij
	9oNRn/f9GsAqrJUnmnpRVggEfvYivjxwsXNRhAq93qIPOuDrsrGRSTbCQqIMdHng+hVRGtKr9dj8m
	39I41HcTc+TB7zBsQBiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdJgK-00000007EcP-1Cyy;
	Fri, 23 Feb 2024 00:44:52 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdJeh-00000007Dnt-1g1m
	for linux-riscv@lists.infradead.org;
	Fri, 23 Feb 2024 00:43:15 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-dc64e0fc7c8so399011276.2
        for <linux-riscv@lists.infradead.org>; Thu, 22 Feb 2024 16:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708648981; x=1709253781; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zjc59DluW49ttFqszZ9w9JOq4NwZpI0t2wGHcPtZrIc=;
        b=S7lGnwleEPvPdBYPA8r87/U55YVwfw3NW+eg6eSUoNx+HnIQJ+PaRKvU5fTs3f009N
         DWTDoQEFiLPmIhxz7o4dMnnsjMAR4UVT0ydNLcrMeGrrU8ki0ALFxtOP33HiesognEKJ
         RAf6OsAXoqB3QVu76ePLEmhgLYpnafj7f39MRo+IQqnDcERWVNeEI5IuWXmXrUwJGVhS
         P4mNecSJRcAYiXWBOzP5q/1+u4wrXRxLeHX6Qty1KHqz1ORtrgc7Mc1RNKLuE6JbjLBV
         4q1HpC63/eECk80YN86BiK1itBFqMgIlbnWx9oHp9ATyelWH8Bfiza6/6mGOwXGR1bIS
         48yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708648981; x=1709253781;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zjc59DluW49ttFqszZ9w9JOq4NwZpI0t2wGHcPtZrIc=;
        b=A/lqtLalJmahk+g7WGqVb4/s8PNaHAtQRiMByA4kMGcbjNqkIkT8ho5k4/dJMTAeTf
         9zey8BWc4lw8nNhxv0s5SRA+MRFm1X4+W+J3GgJATWWLGXszx48OaZSYdXdkfKQFD7gA
         8yXHF4LtaENS17EGUsqZpEr5ogGg0bMkGxvxqEn9AL7lx8G+9iEuzrqE5efwM5VQm+zX
         bGX3qg5M866jc8nDWNb9qG15LarvYnOvJWg4yRlq7+CQaBEarPJ1lpiiC4/BC0xrQgOq
         94NIGK8PKwRbSCD8OT7vwdtImp8Bmowe7kI6shn+5ftY5LegD3ulfqo4SJ/r0ie6Sny4
         G84A==
X-Forwarded-Encrypted: i=1; AJvYcCUCTr1EZThtRKKILzLZxREumiuISrNbCPJLaQABBC/zkTFP/f8DhFEVTB6+cGAj5+DaKATlIPMFeI7mxV/WxAFH9DLEhil4ygeBw7xv6Mfa
X-Gm-Message-State: AOJu0YyN3/sk+mh6P2h6qRgNcl5uNwJoXK8FzFwlkbrShQovU9dVKzuC
	qBwevSMhkNvWbrWTcDkM9HuY5x4QKmdNLa06i/O8tvie02aTm4wynWGlJe8fm1Xq3es1EhEhMnV
	DQg==
X-Google-Smtp-Source: AGHT+IG1xzJWlosTep8wtCbhiO7612+88ajrhSavDwxiYQqemKwzSboM+bUS3n19nYfTfskN3+FLs1ydHTk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:68d0:0:b0:dcd:c091:e86 with SMTP id
 d199-20020a2568d0000000b00dcdc0910e86mr26998ybc.13.1708648981584; Thu, 22 Feb
 2024 16:43:01 -0800 (PST)
Date: Thu, 22 Feb 2024 16:42:47 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240223004258.3104051-1-seanjc@google.com>
Subject: [PATCH v9 00/11] KVM: selftests: Add SEV and SEV-ES smoke tests
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
	Michael Roth <michael.roth@amd.com>, Carlos Bilbao <carlos.bilbao@amd.com>, 
	Peter Gonda <pgonda@google.com>, Itaru Kitayama <itaru.kitayama@fujitsu.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_164311_497093_CE1E07D9 
X-CRM114-Status: GOOD (  14.55  )
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

Add basic SEV and SEV-ES smoke tests.  Unlike the intra-host migration tests,
this one actually runs a small chunk of code in the guest.

Unless anyone strongly objects to the quick and dirty approach I've taken for 
SEV-ES, I'll get all of this queued for 6.9 soon-ish.

As for _why_ I added the quick-and-dirty SEV-ES testcase, I have a series to
cleanup __svm_sev_es_vcpu_run(), and found out that apparently I have a version
of OVMF that doesn't quite have to the right <something> for SEV-ES, and so I
could even get a "real" VM to reach KVM_RUN.  I assumed (correctly, yay!) that
hacking together a selftest would be faster than figuring out what firmware
magic I am missing.

v9:
 - Drop is_kvm_sev_supported() and rely purely on KVM capabilities.
 - Check X86_FEATURE_SEV to ensure SEV is actually enabled.
 - Collect tags. [Carlos, Itaru]

v8:
 - https://lore.kernel.org/all/cc9a1951-e76c-470d-a4d1-8ad67bae5794@amd.com
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

Sean Christopherson (3):
  KVM: selftests: Extend VM creation's @shape to allow control of VM
    subtype
  KVM: selftests: Use the SEV library APIs in the intra-host migration
    test
  KVM: selftests: Add a basic SEV-ES smoke test

 tools/testing/selftests/kvm/Makefile          |   2 +
 .../kvm/include/aarch64/kvm_util_arch.h       |   7 ++
 .../selftests/kvm/include/kvm_util_base.h     |  50 +++++++-
 .../kvm/include/riscv/kvm_util_arch.h         |   7 ++
 .../kvm/include/s390x/kvm_util_arch.h         |   7 ++
 .../testing/selftests/kvm/include/sparsebit.h |  56 ++++++---
 .../kvm/include/x86_64/kvm_util_arch.h        |  23 ++++
 .../selftests/kvm/include/x86_64/processor.h  |   8 ++
 .../selftests/kvm/include/x86_64/sev.h        | 107 ++++++++++++++++
 tools/testing/selftests/kvm/lib/kvm_util.c    |  67 ++++++++--
 tools/testing/selftests/kvm/lib/sparsebit.c   |  48 ++++----
 .../testing/selftests/kvm/lib/ucall_common.c  |   3 +-
 .../selftests/kvm/lib/x86_64/processor.c      |  32 ++++-
 tools/testing/selftests/kvm/lib/x86_64/sev.c  | 114 ++++++++++++++++++
 .../selftests/kvm/x86_64/sev_migrate_tests.c  |  67 ++++------
 .../selftests/kvm/x86_64/sev_smoke_test.c     |  88 ++++++++++++++
 16 files changed, 583 insertions(+), 103 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/include/aarch64/kvm_util_arch.h
 create mode 100644 tools/testing/selftests/kvm/include/riscv/kvm_util_arch.h
 create mode 100644 tools/testing/selftests/kvm/include/s390x/kvm_util_arch.h
 create mode 100644 tools/testing/selftests/kvm/include/x86_64/kvm_util_arch.h
 create mode 100644 tools/testing/selftests/kvm/include/x86_64/sev.h
 create mode 100644 tools/testing/selftests/kvm/lib/x86_64/sev.c
 create mode 100644 tools/testing/selftests/kvm/x86_64/sev_smoke_test.c


base-commit: 60eedcfceda9db46f1b333e5e1aa9359793f04fb
-- 
2.44.0.rc0.258.g7320e95886-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
