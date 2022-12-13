Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 136CDC4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 00:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:Mime-Version:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EG3YQbMLBpBA2pow+CM+DgIaxjCr2JqJLxuJSEUt/8w=; b=lzFfNZdC71wmUz
	93uIiNtzW0evrneiFyXNL2UrM/2gPRLpUL3RKa02ZDkD1I/JuHpvprelyI5tYi3FXc44/r/4Q9tqA
	IdaoCA7yVx1C8NPvk8boftKq13tuG+CYB/MYOm/55YYhvayoZxnLXWMNb9cdB57ygA+84Hc2OUssJ
	znqopKddOo+jRX81N5lJhD/uzNnJUnyg0b5KecZXyvVFzKHxxjXLQZ9na30ZeHN0AgcjNiomuBBQb
	3xWQ6bJvh7md51L94qv12CeCGWa26Zar6DIXllqxBMVNwb2j/4VbmwRtkkkrGwXYhfXfnYHzUYstt
	WVopRpnzc4zuQpySam1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4sys-00896g-Aq; Tue, 13 Dec 2022 00:17:10 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4syh-00892T-Im
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 00:17:01 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-411c31a2c20so79199577b3.12
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 16:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rrmKIRMf4Mq2msGAMjuH9G/DlO6PhwIb4et9Vyytf0s=;
        b=Y/SoLe17F+HoJZwya7YFOMVPVWxIyS8YXDXAdkZKURoZhYboc1qqDhxRYkM8qd/fyn
         zV4AKnvonZDIf4kBxS6BbqKkYvK++Z8SlakM9rrpZf/WnJthiD/WaPvC4mId1Hi85VXx
         HEnTLJKfq/AiMkE+A1lvFD7n5RUyEVn7KE12qMAkazwYdkxp/onbTYKAwGSZxx/+wvCu
         AkCHnFjwsiycANQDr7f8nJl13jr3Aq6KbcvSvBjixq+cK42hwQ3dC8wgvpt4LO7Wo9ul
         DCX6EzwtU8238LHHvhH1M16EyNBESvafX2Bsjx0/y3efzS0Lla4Z0vEPMEkwmHimVswS
         SmYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rrmKIRMf4Mq2msGAMjuH9G/DlO6PhwIb4et9Vyytf0s=;
        b=GIL8JTDisgOEE4bpyeR6msy/yi0QdL1b+wWsVqTlftHljqDm9wPWpP2OLBb/PU9271
         xPM6NWpGlu+1lbY9075pqValQnkd+g8xdN8onltdYRji5wcxZJCwbHa2qk43pBTv+Y6a
         b4N8i8w+L4OLNo8HRNC1xS/lqas9eU53PhQ5Kus82y11/+cfCQD2rLlrDTdqJMe4pJc8
         9d3vvfHmrk+Yo70uDq7lIN/a7USBUW86EcTxmD5/oUYEryZApAEomEu/0oSNl9jgIL08
         zeKJLN9tHA6YbJ0PFR7QrJw8wdpU8xe0XgoGcB2N9VnNxXTxmS2QzM6vV8R+lf5XkAor
         nJbw==
X-Gm-Message-State: ANoB5plECwj26IVoPqFpvGCQgrGUnAGLoVF0iGo/awIRhiu1RQEHvPU8
	UJX0L4GBMZErInqL0R04V9yPujRyDTc=
X-Google-Smtp-Source: AA0mqf6/pKu0pWWW1KBsbsV+bRwkpXaD3AJngXQVdm+DqVUnownROWyJFsvs/+l4EXLP/kxHJtplxf44+Wk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:2397:0:b0:724:2a55:aadb with SMTP id
 j145-20020a252397000000b007242a55aadbmr1005565ybj.576.1670890616579; Mon, 12
 Dec 2022 16:16:56 -0800 (PST)
Date: Tue, 13 Dec 2022 00:16:39 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Message-ID: <20221213001653.3852042-1-seanjc@google.com>
Subject: [PATCH 00/14] KVM: selftests: Clang fixes, Makefile cleanup
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Tom Rix <trix@redhat.com>, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ricardo Koller <ricarkol@google.com>, 
	Sean Christopherson <seanjc@google.com>, Aaron Lewis <aaronlewis@google.com>, 
	Raghavendra Rao Ananta <rananta@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_161659_637202_F1AA8674 
X-CRM114-Status: UNSURE (   9.50  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Fix a variety of KVM selftests issues exposed by clang, and rework the
Makefile and .gitignore to reduce the maintenance burden of selftests.

For the Makefile, programmatically generate the list of targets by
looking for .c files, and opt-out via a dummy macro in the source
instead of forcing architectures to opt-in.  The opt-out approach is
less error prone (harder to forget to add an arch), doesn't generate
unnecessary conflicts if multiple tests are added simultanesouly, and
makes it much easier to understand which tests aren't supported, e.g.

  $ git grep TEST_UNSUPPORTED | grep aarch64
  hardware_disable_test.c:TEST_UNSUPPORTED(aarch64);
  max_guest_memory_test.c:TEST_UNSUPPORTED(aarch64);
  system_counter_offset_test.c:TEST_UNSUPPORTED(aarch64);

This all started when trying to reproduce clang build errors reported by
Raghu and Aaron that were introduced by commit 6b6f71484bf4 ("KVM:
selftests: Implement memcmp(), memcpy(), and memset() for guest use").
Just getting selftests to compile with clang was a nightmare, as it took
me several hours to realize that "CC=clang make" and "make CC=clang"
aren't equivalent, and that the "include ../lib.mak" buried halfway through
the Makefile was overriding "CC=clang make".

After too many hours fighting to get clang working, my frustration with
the Makefile boiled over a bit...

Note, I have fixes for the RISC-V RSEQ bugs (outside of selftests/kvm) that
I'll post separately.

Tested on x86 and arm, build tested on s390x and RISC-V, all with both gcc
and clang.

Sean Christopherson (14):
  KVM: selftests: Define literal to asm constraint in aarch64 as
    unsigned long
  KVM: selftests: Delete dead code in x86_64/vmx_tsc_adjust_test.c
  KVM: selftests: Fix divide-by-zero bug in memslot_perf_test
  KVM: selftests: Use pattern matching in .gitignore
  KVM: selftests: Fix a typo in x86-64's kvm_get_cpu_address_width()
  KVM: selftests: Rename UNAME_M to ARCH_DIR, fill explicitly for x86
  KVM: selftests: Use proper function prototypes in probing code
  KVM: selftests: Probe -no-pie with actual CFLAGS used to compile
  KVM: selftests: Explicitly disable builtins for mem*() overrides
  KVM: selftests: Include lib.mk before consuming $(CC)
  KVM: selftests: Disable "gnu-variable-sized-type-not-at-end" warning
  KVM: selftests: Use wildcards to find library source files
  KVM: selftests: Use wildcards to find targets and test source files
  KVM: selftests: Enable RSEQ test for RISC-V

 tools/testing/selftests/kvm/.gitignore        |  91 +------
 tools/testing/selftests/kvm/Makefile          | 229 +++---------------
 .../selftests/kvm/aarch64/page_fault_test.c   |   2 +-
 .../selftests/kvm/access_tracking_perf_test.c |   3 +
 .../selftests/kvm/dirty_log_perf_test.c       |   3 +
 .../selftests/kvm/hardware_disable_test.c     |   4 +
 .../testing/selftests/kvm/include/test_util.h |  11 +
 .../selftests/kvm/lib/x86_64/processor.c      |   2 +-
 .../selftests/kvm/max_guest_memory_test.c     |   4 +
 .../kvm/memslot_modification_stress_test.c    |   3 +
 .../testing/selftests/kvm/memslot_perf_test.c |   6 +
 tools/testing/selftests/kvm/steal_time.c      |   3 +
 .../kvm/system_counter_offset_test.c          |   4 +
 .../kvm/x86_64/vmx_tsc_adjust_test.c          |   5 -
 14 files changed, 80 insertions(+), 290 deletions(-)


base-commit: f1a1d3aff0cc2e68a9ebbd8810d7dcd8cfe2714b
-- 
2.39.0.rc1.256.g54fd8350bd-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
