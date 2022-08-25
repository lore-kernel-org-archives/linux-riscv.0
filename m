Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C103ECAAD1
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Aug 2022 23:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:Mime-Version:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=brmXJHf+m40QMXpe6isvPAQ51ikeXP1YejqMAl7o1gk=; b=xp2aUNU4/1FoWK
	slzroTQ2NBVucGHFW+o1lrXeG0gUF+DXxze9ldOAvdik+/a8S77gTsR4qeraf7nD/HN63tUb5u+Tg
	yhsYAez3qWadNaEQDEP3t+IfFMmTvwSMGTSMDlJFGmoeABHih7B9lEiHS3cutwxFkeRg/DPvBmZ7B
	5R8JRj2UxyE4xB2c0nOd47uOjYDcSrRwkzZ9FRKG5s7ZwvLzia/ef3l0t+phT+szOT4eLw9fHD2PN
	0lMLL7xXxNKB1pQE5qCJ4C5T6up9RclANYMSnOl5eUJsN4rzPCO5BmStc+h3Gg9rtuYYuywOxEoXB
	HvVuS9Mu4rkHSzga2B0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRME9-0047hZ-6t; Thu, 25 Aug 2022 23:25:33 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRME5-0047ZH-Cz
	for linux-riscv@lists.infradead.org; Thu, 25 Aug 2022 23:25:31 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-3360c0f0583so364546877b3.2
        for <linux-riscv@lists.infradead.org>; Thu, 25 Aug 2022 16:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc;
        bh=y2TyZVHOzKZlb9wECS9yMCNcXCNpwqCPWpTxl29+IMY=;
        b=dkM+A09pjx32V3tjxCAZAaj4iTr2QWwZFTx14MwcUXXnZscAY3fsOcj6h5WXQXxdoD
         pE2ASAcwod4FD0N0sCT4FjUT0tg9Opertqs8xb3KgjTkUGEmN0krLyCYuuqUGRjMcltU
         i55uCtWc8Su1TGA6H/a9JTuhvCJcNgBM50Y1A4ihMCdqTUfplBKQUaiEUX2n1Vh4N710
         3yOt5OJYxOGq7VwXawE8F72ZOkRT8JCFAjGnVJAcUhtb87iwBUwK1cOzoECBWrP6U0Ke
         ZtEkGqxLhvl3GVE9ZNy1Tt1CBoQxoOnHS9H5jY9/byfHRVWvrd+Zhz17D7ZlFyP3ffIM
         c1wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc;
        bh=y2TyZVHOzKZlb9wECS9yMCNcXCNpwqCPWpTxl29+IMY=;
        b=TsZf+HuxLiNQrC+dsgyB8ycdbcvaewsk6DWLV9QdMVKVRX3MoUwDY0/nuB5QDCPbn9
         xEFGhownTzNgkxk+ldnOB3O3EYljRR8Ncp0kZxhwpiHIY8i7Y8BI3GL58UbdE4tic8gl
         Zrs71EAcXPdwCImjFzryWXkUFNl7LuvKFvuC1v2Pp1LEsNooGygOheho9VsON2bW9Sd2
         PbMtZF+W9zultGlJz/NZlobrVXtC3LX7VK7CDxykwE61W/vpdPhk7B6pvkWGKNtIgpct
         y/g5iGz0WAzzprZFzGap+gHVYcEjPaP4WlHPLhSicNvRoX460hBpVykcIezGGKRiP9sM
         arCQ==
X-Gm-Message-State: ACgBeo1Ww2iHEz98uxN3oM1CALPVo3HojkuHPh8B0d7JOGXQ2hZp2HGV
	dp4KydGBXMhFW5h7tx+pOmU4+PXdUDE=
X-Google-Smtp-Source: AA6agR4iAX55dcIo3IUqvlfKkqmyFpPiECgmLWRpTah2t3s+pqlFTA2hJbEvjHCDMn3ntt/fdb4I5rKg3Mw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:6143:0:b0:335:3076:168e with SMTP id
 v64-20020a816143000000b003353076168emr5851445ywb.460.1661469924695; Thu, 25
 Aug 2022 16:25:24 -0700 (PDT)
Date: Thu, 25 Aug 2022 23:25:15 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220825232522.3997340-1-seanjc@google.com>
Subject: [PATCH v5 0/7] KVM: selftests: Implement ucall "pool" (for SEV)
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Atish Patra <atishp@atishpatra.org>, David Hildenbrand <david@redhat.com>, Tom Rix <trix@redhat.com>, 
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.cs.columbia.edu, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Colton Lewis <coltonlewis@google.com>, 
	Peter Gonda <pgonda@google.com>, Andrew Jones <andrew.jones@linux.dev>, 
	Sean Christopherson <seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_162529_450246_5EA0F30C 
X-CRM114-Status: UNSURE (   9.70  )
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

Non-KVM folks, y'all got pulled in because of the atomic_test_and_set_bit()
patch.

Rework the ucall infrastructure to use a pool of ucall structs to pass
memory instead of using the guest's stack.  For confidential VMs with
encrypted memory, e.g. SEV, the guest's stack "needs" to be private memory
and so can't be used to communicate with the host.

Convert all implementations to the pool as all of the complexity is hidden
in common code, and supporting multiple interfaces adds its own kind of
complexity. 

Tested on x86 and ARM, compile tested on s390 and RISC-V.

v5:
 - Use less convoluted method of writing per-VM "globals". [Oliver]
 - Add patch to drop ucall_uninit().

v4: https://lore.kernel.org/all/20220824032115.3563686-1-seanjc@google.com

Peter Gonda (2):
  tools: Add atomic_test_and_set_bit()
  KVM: selftests: Add ucall pool based implementation

Sean Christopherson (5):
  KVM: selftests: Consolidate common code for populating ucall struct
  KVM: selftests: Consolidate boilerplate code in get_ucall()
  KVM: selftests: Automatically do init_ucall() for non-barebones VMs
  KVM: selftests: Make arm64's MMIO ucall multi-VM friendly
  KVM: selftest: Drop now-unnecessary ucall_uninit()

 tools/arch/x86/include/asm/atomic.h           |   7 ++
 tools/include/asm-generic/atomic-gcc.h        |  12 +++
 tools/testing/selftests/kvm/Makefile          |   1 +
 .../selftests/kvm/aarch64/arch_timer.c        |   1 -
 .../selftests/kvm/aarch64/debug-exceptions.c  |   1 -
 .../selftests/kvm/aarch64/hypercalls.c        |   1 -
 .../testing/selftests/kvm/aarch64/psci_test.c |   1 -
 .../testing/selftests/kvm/aarch64/vgic_init.c |   2 -
 .../testing/selftests/kvm/aarch64/vgic_irq.c  |   1 -
 tools/testing/selftests/kvm/dirty_log_test.c  |   3 -
 .../selftests/kvm/include/kvm_util_base.h     |  15 +++
 .../selftests/kvm/include/ucall_common.h      |  10 +-
 .../selftests/kvm/kvm_page_table_test.c       |   2 -
 .../testing/selftests/kvm/lib/aarch64/ucall.c | 102 +++---------------
 tools/testing/selftests/kvm/lib/kvm_util.c    |  11 ++
 .../selftests/kvm/lib/perf_test_util.c        |   3 -
 tools/testing/selftests/kvm/lib/riscv/ucall.c |  42 ++------
 tools/testing/selftests/kvm/lib/s390x/ucall.c |  39 ++-----
 .../testing/selftests/kvm/lib/ucall_common.c  | 102 ++++++++++++++++++
 .../testing/selftests/kvm/lib/x86_64/ucall.c  |  39 ++-----
 .../testing/selftests/kvm/memslot_perf_test.c |   1 -
 tools/testing/selftests/kvm/rseq_test.c       |   1 -
 tools/testing/selftests/kvm/steal_time.c      |   1 -
 .../kvm/system_counter_offset_test.c          |   1 -
 24 files changed, 189 insertions(+), 210 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/lib/ucall_common.c


base-commit: 372d07084593dc7a399bf9bee815711b1fb1bcf2
-- 
2.37.2.672.g94769d06f0-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
