Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E5B1C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 09:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6+M1nuXOsuddk1Z5aaWGw7X36W1sv81DICXH3ACtA3U=; b=u929irkNG0Q5w+
	Z93F6e7WM+ihI+0gLHwGGd0wTIp0LVFRueiw57L5XJgYboCs7rp42hcpF2wBBlZt+k1Dpd3ZA4PLY
	tKKTweT7Q0jaxG/EnrBzau4C+l1jx5gESKMVlieqYZSKWvUYKRx4RFTtZlKrVSkpgT8/M/7Dqy7IH
	VOISldqe1iTx2KVxivUjPaBe9LzGHukIdEtNcJf2ZPKl68tWj4iyHQWE0jJbUq6wtIzAfXh7QBb69
	8/RNsd+tKmbUqatXpYNL3oZP5iYpunN118DiTtSnrSN3P9HRS277StpKW+E8UKTZ2HEcCWxq+XFpi
	m1DHOGpigyfEaEn/8RPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCyv5-00B9Ew-22;
	Tue, 12 Dec 2023 09:19:15 +0000
Received: from mgamail.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCyv1-00B9DM-1v;
	Tue, 12 Dec 2023 09:19:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702372751; x=1733908751;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=r1px4BsQs/X7Xgfx+BYJsYmJ0wM7HnTCh77HJxhuwZg=;
  b=GCqiXSNObMIfEeYGqxSG47mnZdB2uZ0Z0YCglMjj4H7nzgAcBKeo7rDP
   N+5wBhEPcdXNjCzOxsZNqheYrsMcsn3z6611YjZGqyUG0KY3WRge6zWeF
   9OcdgnB62Or8UCrBodYW02Bg1StccETve0bA7mW6fv7DCo4jSZwZFzYEN
   myjLc+ws41yN6tlgHxa9yINYpfY1jBm4RMfK2YesXD2HNJfZ50G5dO8eT
   jJEqgL7X7dAH5TfQgqUhNI5sV47/jnOo7S4kUSDKWYTqCUOof0hc7eTgy
   cTkeXohR1iAMCUsBowhGKqjDgLV8rwrSUWcOQHtjq8nJyWkYnEqpZw52A
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="480974134"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="scan'208";a="480974134"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 01:19:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="917212797"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="scan'208";a="917212797"
Received: from haibo-optiplex-7090.sh.intel.com ([10.239.159.132])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 01:19:00 -0800
From: Haibo Xu <haibo1.xu@intel.com>
To: 
Cc: xiaobo55x@gmail.com,
	haibo1.xu@intel.com,
	ajones@ventanamicro.com,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Guo Ren <guoren@kernel.org>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	wchen <waylingii@gmail.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Samuel Holland <samuel@sholland.org>,
	Minda Chen <minda.chen@starfivetech.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Peter Xu <peterx@redhat.com>,
	Like Xu <likexu@tencent.com>,
	Vipin Sharma <vipinsh@google.com>,
	Aaron Lewis <aaronlewis@google.com>,
	Thomas Huth <thuth@redhat.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v4 00/11] RISCV: Add kvm Sstc timer selftests
Date: Tue, 12 Dec 2023 17:31:09 +0800
Message-Id: <cover.1702371136.git.haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_011911_717781_31B60D61 
X-CRM114-Status: GOOD (  12.02  )
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

The RISC-V arch_timer selftests is used to validate Sstc timer
functionality in a guest, which sets up periodic timer interrupts
and check the basic interrupt status upon its receipt.

This KVM selftests was ported from aarch64 arch_timer and tested
with Linux v6.7-rc4 on a Qemu riscv64 virt machine.

---
Changed since v4:
  * Rebased to Linux 6.7-rc4
  * Included Paolo's patch(01/11) to fix issues with SPLIT_TESTS
  * Droped the patch(KVM: selftests: Unify the makefile rule for split targets) 
    since Paolo's patch had included the fix
  * Added new patch(05/11) to include header file vdso/processor.h from linux
    source tree to leverage the cpu_relax() definition - Conor/Andrew
  * Added new patch(11/11) to enable user configuration of timer error margin
    parameter which alleviate the intermitent failure in stress test - Andrew
  * Other minor fixes per Andrew's comments

Haibo Xu (10):
  KVM: arm64: selftests: Split arch_timer test code
  KVM: selftests: Add CONFIG_64BIT definition for the build
  tools: riscv: Add header file csr.h
  tools: riscv: Add header file vdso/processor.h
  KVM: riscv: selftests: Switch to use macro from csr.h
  KVM: riscv: selftests: Add exception handling support
  KVM: riscv: selftests: Add guest helper to get vcpu id
  KVM: riscv: selftests: Change vcpu_has_ext to a common function
  KVM: riscv: selftests: Add sstc timer test
  KVM: selftests: Enable tunning of err_margin_us in arch timer test

Paolo Bonzini (1):
  selftests/kvm: Fix issues with $(SPLIT_TESTS)

 tools/arch/riscv/include/asm/csr.h            | 521 ++++++++++++++++++
 tools/arch/riscv/include/asm/vdso/processor.h |  32 ++
 tools/testing/selftests/kvm/Makefile          |  27 +-
 .../selftests/kvm/aarch64/arch_timer.c        | 295 +---------
 tools/testing/selftests/kvm/arch_timer.c      | 259 +++++++++
 .../selftests/kvm/include/aarch64/processor.h |   4 -
 .../selftests/kvm/include/kvm_util_base.h     |   9 +
 .../selftests/kvm/include/riscv/arch_timer.h  |  71 +++
 .../selftests/kvm/include/riscv/processor.h   |  65 ++-
 .../testing/selftests/kvm/include/test_util.h |   2 +
 .../selftests/kvm/include/timer_test.h        |  45 ++
 .../selftests/kvm/lib/riscv/handlers.S        | 101 ++++
 .../selftests/kvm/lib/riscv/processor.c       |  87 +++
 .../testing/selftests/kvm/riscv/arch_timer.c  | 111 ++++
 .../selftests/kvm/riscv/get-reg-list.c        |  11 +-
 15 files changed, 1333 insertions(+), 307 deletions(-)
 create mode 100644 tools/arch/riscv/include/asm/csr.h
 create mode 100644 tools/arch/riscv/include/asm/vdso/processor.h
 create mode 100644 tools/testing/selftests/kvm/arch_timer.c
 create mode 100644 tools/testing/selftests/kvm/include/riscv/arch_timer.h
 create mode 100644 tools/testing/selftests/kvm/include/timer_test.h
 create mode 100644 tools/testing/selftests/kvm/lib/riscv/handlers.S
 create mode 100644 tools/testing/selftests/kvm/riscv/arch_timer.c

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
