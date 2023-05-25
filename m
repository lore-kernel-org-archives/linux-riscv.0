Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 628A1C7EE31
	for <linux-riscv@archiver.kernel.org>; Thu, 25 May 2023 07:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G/0X4R8MsHTZBoV+SdgqtQAA5+lrBLM2LDgtf0w9064=; b=p8uK/7NaVDd/8r
	MiD7nfoZmMwZkYWE16rcpfGNembitzXkP6mbe8C1vLFOPgT6rnanAL+rD/tM1ohknohr/oZCeJO5L
	3pjmi4QVxjcswlivuZuMYh8Hrm6/k3Jn3SlT2rfGbo+00K2cj2tF8R2dhPAeN0lRkRvcZrKQcVfqs
	Fm3owoBSgzjXshQxJueT+e0ANIaepoWzlpGS1SK86fc1J9Ef2HgC9wLP5ZA2n/B9d762p97zNI3pe
	HsgfSjmIHHMYR1zGQVbbjD6IoU02AuFd8IF0bJrL5VZKJCLIWlSzZLw3X83FWDXYrnwWumIiExoWd
	MQxET07PpaakCm4Z5LRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q25VD-00Fobo-1i;
	Thu, 25 May 2023 07:35:15 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q25V9-00FoZv-1h;
	Thu, 25 May 2023 07:35:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685000111; x=1716536111;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jLH4kQk6zi0cVy2k1sUXs4W9z4mmK4Cl2bsLik9SWEQ=;
  b=dBV9OXHEx0sNhq8vvRt6dKMPjRN8ERjg/+M8jv5R5LblznHtK3aon+Vs
   0GbKfLKylEgkr+VLIi8rFazsgJyHqpHNAonPazZHXqJZBEK8rilzv+nhs
   ECxl40tXsSZVa0ai8Trqq1ePsG6GUIbyNYQXcLiBsIRf8zcXNjyuR7Uxv
   OJ2A4xnnOEPkjR3PUTebs1JAjDni6qMIZLCpe5xk3lOjqYXWUwV1WqrR9
   K9xaK0YKKtzhyK2oGgFatu6G5wrA65rosr4/tCLRd2mOe5LgV6XuIyVzE
   MYGOvLABnpkiWfoOdXKTk7irgI+1VLOcPTHp1vDzVE9jXf+aaLaTiPfNi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="417280809"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="417280809"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 00:32:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="769774564"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="769774564"
Received: from haibo-optiplex-7090.sh.intel.com ([10.239.159.132])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 00:32:32 -0700
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
	David Matlack <dmatlack@google.com>,
	Ben Gardon <bgardon@google.com>,
	Vipin Sharma <vipinsh@google.com>,
	Colton Lewis <coltonlewis@google.com>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: [PATCH v2 00/11] RISCV: Add KVM_GET_REG_LIST API
Date: Thu, 25 May 2023 15:38:24 +0800
Message-Id: <cover.1684999824.git.haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_003511_636552_E5C0E9BB 
X-CRM114-Status: UNSURE (   9.62  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

KVM_GET_REG_LIST will dump all register IDs that are available to
KVM_GET/SET_ONE_REG and It's very useful to identify some platform
regression issue during VM migration.

Patch 1-7 re-structured the get-reg-list test in aarch64 to make some
of the code as common test framework that can be shared by riscv.

Patch 8 enabled the KVM_GET_REG_LIST API in riscv and patch 9-11 added
the corresponding kselftest for checking possible register regressions.

The get-reg-list kvm selftest was ported from aarch64 and tested with
Linux 6.4-rc1 on a Qemu riscv virt machine.

---
Changed since v1:
  * rebase to Andrew's changes
  * fix coding style

Andrew Jones (7):
  KVM: arm64: selftests: Replace str_with_index with strdup_printf
  KVM: arm64: selftests: Drop SVE cap check in print_reg
  KVM: arm64: selftests: Remove print_reg's dependency on vcpu_config
  KVM: arm64: selftests: Rename vcpu_config and add to kvm_util.h
  KVM: arm64: selftests: Delete core_reg_fixup
  KVM: arm64: selftests: Split get-reg-list test code
  KVM: arm64: selftests: Finish generalizing get-reg-list

Haibo Xu (4):
  KVM: riscv: Add KVM_GET_REG_LIST API support
  KVM: riscv: selftests: Make check_supported arch specific
  KVM: riscv: selftests: Skip some registers set operation
  KVM: riscv: selftests: Add get-reg-list test

 Documentation/virt/kvm/api.rst                |   2 +-
 arch/riscv/kvm/vcpu.c                         | 372 ++++++++++++
 tools/testing/selftests/kvm/Makefile          |  13 +-
 .../selftests/kvm/aarch64/get-reg-list.c      | 540 ++----------------
 tools/testing/selftests/kvm/get-reg-list.c    | 426 ++++++++++++++
 .../selftests/kvm/include/kvm_util_base.h     |  16 +
 .../selftests/kvm/include/riscv/processor.h   |   3 +
 .../testing/selftests/kvm/include/test_util.h |   2 +
 tools/testing/selftests/kvm/lib/test_util.c   |  15 +
 .../selftests/kvm/riscv/get-reg-list.c        | 539 +++++++++++++++++
 10 files changed, 1428 insertions(+), 500 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/get-reg-list.c
 create mode 100644 tools/testing/selftests/kvm/riscv/get-reg-list.c

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
