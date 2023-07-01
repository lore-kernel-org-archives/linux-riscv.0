Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E258EB64DC
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Jul 2023 13:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PbZ3eDAsBMNwBaB8ocExhG/da9sLW2yQbsH+JDi8yhs=; b=BreHVYz985BvlL
	Yzr11N8qE/BEwlmhpXUXlAYlGl6ASpgGwV1LKiho1GyqcITg3d+iHYbvX+qsm70BJpcK1W90mUEO3
	syqNIabFJ3VSZSvK4ZSvmsQr7ZcpXLkFEi8FMS+1MTaBi3VxQsukgXHrTadPnPLnR9HJGC5jthidY
	9pIk9W24wF0/eRZlaDRYcX0GfKLjWgalePkwdthtRK8xwIsklYqGUYe9Kev6nB+BD7Wg9IDs7uZei
	OgKuSGlfa5CY8R43/bkUJhCi+JNfcuUdTb702od+j/vv2hlJMbHsUufOnpOhhKHC3OYkW+kL8mm8R
	E4Hhji8rogRXCagW+eJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFamp-0063ry-1K;
	Sat, 01 Jul 2023 13:37:15 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFaml-0063px-12;
	Sat, 01 Jul 2023 13:37:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688218631; x=1719754631;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Dxr6Zdkg56bFHVuAkIb3PHTmV/Q7cAZw8O3SoMXKMZc=;
  b=Q9Oi0I+Ee9rPWWpe4dDfgst4qaIEmqjOS/r72UiE3DFQovgZfIbxrn0M
   Xm0ynLu5ahoZaQldAuxdMHfJcZzx5UyM/In+gTUpVIhIsaiWC6HXx4LIF
   mXOn5zFgkKsLd+tIqeSCoP+gqEBqZniuMo7I+EWhU7pn6vUyqW4AvJw1Y
   onpdhI7kW2ATh53axJw9odxrsHQGO5va0/uOP2K8uNoYzo77k8SxAQ/Is
   4sZaFsfTlhGimdB/74wUupShzKF+wFwtXrcqaN/0lvr5APR89UpZUd0oj
   u+FzpWkfaAhUyC96yBRDlcJRvtFuZQywqTgJ5hQB9YWK8JIfnHU1Mmmvm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10758"; a="342926031"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="342926031"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2023 06:37:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10758"; a="747693831"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="747693831"
Received: from haibo-optiplex-7090.sh.intel.com ([10.239.159.132])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2023 06:36:54 -0700
From: Haibo Xu <haibo1.xu@intel.com>
To: 
Cc: xiaobo55x@gmail.com,
	haibo1.xu@intel.com,
	ajones@ventanamicro.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	seanjc@google.com,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Shuah Khan <shuah@kernel.org>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Ricardo Koller <ricarkol@google.com>,
	Vishal Annapurve <vannapurve@google.com>,
	Vipin Sharma <vipinsh@google.com>,
	David Matlack <dmatlack@google.com>,
	Colton Lewis <coltonlewis@google.com>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: [PATCH v5 00/13] RISCV: Add KVM_GET_REG_LIST API
Date: Sat,  1 Jul 2023 21:42:48 +0800
Message-Id: <cover.1688010022.git.haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230701_063711_390300_8E17A0EE 
X-CRM114-Status: GOOD (  10.11  )
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

KVM_GET_REG_LIST will dump all register IDs that are available to
KVM_GET/SET_ONE_REG and It's very useful to identify some platform
regression issue during VM migration.

Patch 1-7 re-structured the get-reg-list test in aarch64 to make some
of the code as common test framework that can be shared by riscv.

Patch 8 move reject_set check logic to a function so as to check for
different errno for different registers.
Patch 9 move finalize_vcpu back to run_test so that riscv can implement
its specific operation.
Patch 10 change to do the get/set operation only on present-blessed list.
Patch 11 add the skip_set facilities so that riscv can skip set operation
on some registers.
Patch 12 enabled the KVM_GET_REG_LIST API in riscv.
patch 13 added the corresponding kselftest for checking possible
register regressions.

The get-reg-list kvm selftest was ported from aarch64 and tested with
Linux v6.4 on a Qemu riscv64 virt machine.

---
Changed since v4:
  * Rebase to v6.4
  * Address Andrew's suggestions and comments:
      Added skip_set concept
      Updated errno check logic
      Modified finalize_vcpu as weak function

Andrew Jones (7):
  KVM: arm64: selftests: Replace str_with_index with strdup_printf
  KVM: arm64: selftests: Drop SVE cap check in print_reg
  KVM: arm64: selftests: Remove print_reg's dependency on vcpu_config
  KVM: arm64: selftests: Rename vcpu_config and add to kvm_util.h
  KVM: arm64: selftests: Delete core_reg_fixup
  KVM: arm64: selftests: Split get-reg-list test code
  KVM: arm64: selftests: Finish generalizing get-reg-list

Haibo Xu (6):
  KVM: arm64: selftests: Move reject_set check logic to a function
  KVM: arm64: selftests: Move finalize_vcpu back to run_test
  KVM: selftests: Only do get/set tests on present blessed list
  KVM: selftests: Add skip_set facility to get_reg_list test
  KVM: riscv: Add KVM_GET_REG_LIST API support
  KVM: riscv: selftests: Add get-reg-list test

 Documentation/virt/kvm/api.rst                |   2 +-
 arch/riscv/kvm/vcpu.c                         | 375 +++++++++
 tools/testing/selftests/kvm/Makefile          |  11 +-
 .../selftests/kvm/aarch64/get-reg-list.c      | 544 ++----------
 tools/testing/selftests/kvm/get-reg-list.c    | 395 +++++++++
 .../selftests/kvm/include/kvm_util_base.h     |  21 +
 .../selftests/kvm/include/riscv/processor.h   |   3 +
 .../testing/selftests/kvm/include/test_util.h |   2 +
 tools/testing/selftests/kvm/lib/test_util.c   |  15 +
 .../selftests/kvm/riscv/get-reg-list.c        | 780 ++++++++++++++++++
 10 files changed, 1655 insertions(+), 493 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/get-reg-list.c
 create mode 100644 tools/testing/selftests/kvm/riscv/get-reg-list.c

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
