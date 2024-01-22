Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C024C47DAF
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 09:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dsKa92VRcC/ynaKRDgowr4uznfiB1ZFVbajVU8eZIrs=; b=pbcVzzZCeeNke1
	nzZHOI640wQ3uS0OPeWL5emBWY34EBeQc2xatD4r/kfEz+vkI9GghrjEpUgYb3Z0ih9DZ6CMpb5hS
	L4eqU623Ajid1qCXl3s3L9ddPvI9MsqPdyIsYHWt+4gMnSy4kUwAkmntxHgd7WqklctFOaifdti9n
	EdGGmTPBjTr7f9ht2pAREmfhaFfcKASbV0Jiv+KTajwdUPuoxACQk4oDlphebRfKL7NQ8Fj46/+Zc
	yljdMace8cf9m7DmZLajtO6mK1VW24Xt21a+xnqgZ/FbOcqj3J7cmoQ+Jv9OCZniThCB6YQAdjapi
	8hzEkCiIyYwkK5YgPUrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRqrg-00BKsK-2f;
	Mon, 22 Jan 2024 09:45:12 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRqra-00BKoF-0d;
	Mon, 22 Jan 2024 09:45:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705916706; x=1737452706;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=t4I3ga6CJht5tl0WmnhE1Xni4i5mXbwGq8WdKx7/4Ag=;
  b=Yr7Y6zZ1jYpE6ZRiMeF8ZnUFXiITtbN/i5TfQNQZKsR7T6uwFbXVBWzY
   9xoLA0qvQ11TJFeqv0coqMb5aMpMqHydbhitSObYHIAJqLLkhoom3QvFT
   jkVcqH1t2sPmZkVQ3lA+x1sJ/7zzoKKaCQrWC8QVjdireRKDONGi/Y6Dr
   IAZwhnAahihoiBCMccP8X7s+vHDlPhuRasuOBUqSVj1xPMnOWphuHuWqO
   GSsNPuIVPJ4weYpX/kdP7bq8QYS3Qe0cCplnwPyHTRErCPC5hNqDipSXZ
   AmzKsek1hFdcFmQiQMhmNdsIVtCwn9L4mEfiebcyBq26Ym9FG4+FApewO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="22641466"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="22641466"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2024 01:45:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="778535212"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="778535212"
Received: from haibo-optiplex-7090.sh.intel.com ([10.239.159.132])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2024 01:44:50 -0800
From: Haibo Xu <haibo1.xu@intel.com>
To: 
Cc: xiaobo55x@gmail.com,
	ajones@ventanamicro.com,
	Haibo Xu <haibo1.xu@intel.com>,
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
	Conor Dooley <conor.dooley@microchip.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	wchen <waylingii@gmail.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Minda Chen <minda.chen@starfivetech.com>,
	Sean Christopherson <seanjc@google.com>,
	Peter Xu <peterx@redhat.com>,
	Like Xu <likexu@tencent.com>,
	Vipin Sharma <vipinsh@google.com>,
	Thomas Huth <thuth@redhat.com>,
	Aaron Lewis <aaronlewis@google.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v5 00/12] RISCV: Add kvm Sstc timer selftests
Date: Mon, 22 Jan 2024 17:58:30 +0800
Message-Id: <cover.1705916069.git.haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_014506_250335_A1C151B8 
X-CRM114-Status: GOOD (  10.22  )
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
with Linux v6.7-rc8 on a Qemu riscv64 virt machine.

---
Changed since v4:
  * Rebased to Linux 6.7-rc8
  * Added new patch(2/12) to clean up the data type in struct test_args
  * Re-ordered patch(11/11) in v4 to patch(3/12)
  * Changed the timer_err_margin_us type from int to uint32_t

Haibo Xu (11):
  KVM: arm64: selftests: Data type cleanup for arch_timer test
  KVM: arm64: selftests: Enable tuning of error margin in arch_timer
    test
  KVM: arm64: selftests: Split arch_timer test code
  KVM: selftests: Add CONFIG_64BIT definition for the build
  tools: riscv: Add header file csr.h
  tools: riscv: Add header file vdso/processor.h
  KVM: riscv: selftests: Switch to use macro from csr.h
  KVM: riscv: selftests: Add exception handling support
  KVM: riscv: selftests: Add guest helper to get vcpu id
  KVM: riscv: selftests: Change vcpu_has_ext to a common function
  KVM: riscv: selftests: Add sstc timer test

Paolo Bonzini (1):
  selftests/kvm: Fix issues with $(SPLIT_TESTS)

 tools/arch/riscv/include/asm/csr.h            | 541 ++++++++++++++++++
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
 15 files changed, 1353 insertions(+), 307 deletions(-)
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
