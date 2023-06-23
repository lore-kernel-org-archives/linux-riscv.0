Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB61EEB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jun 2023 10:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NTgoiXq2b/Qo0PiiwD7Z8JiZXqYOHkjV6GRaZhdNrZw=; b=YmTEgK9O4gdopg
	nRCR2GTkaGcDntCGxx+O2iy7usWj5t+URrK8rWjRix0rpsmjjDLj+Ohy1DnJr/Olgp443zzLIJJjj
	8O3QS1ow0ICfVKTAp7o3ObfrknZYuvuy1tTm5OAB0R3UZ1LQ+ojM/Y4wposL4qcSPa5uBjB/A/BOI
	ZDzRF4LdpQ6g60x0aFhyf/XHK2J2Zudnvs7TvXQzxHvA2NC20OJNFl5NfqlIfbC8MWY8R/xrg8SKl
	MX+q/VvlesbgOjo4EGom7PTZJk9vEpJwPIekK1hFD0cpmNcS21nl2UjPKR9nLEw1ByOed8KZXakD1
	SZbWmu12hgzN5fpsQpyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCe7c-003H3b-1C;
	Fri, 23 Jun 2023 10:34:32 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCe7Y-003GxD-02;
	Fri, 23 Jun 2023 10:34:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687516467; x=1719052467;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ug0tb+KIthtcBNlWZulbUMsIP+un6qpERH8Wcsp0QfQ=;
  b=FVcaabBmC2tlLFs7N6ud+BOKDCDppvHjeDHs4YUaE07umlTTddUKftZf
   LKiI5xilK3wwmsMFXlD4wyBV9dexH1RGZDQ0T2XsYKZuQMfECZJaPDnKy
   26S9zBVVLt791omhmSkbRGcG3/JRqUT4HbZH7HGOOYl38+2M8a5UIKEPO
   zH1hMsCPboJ6kFMJn3wvNF7jtJg4kQqaIZgNkGbFVi/7n1QxVTEKRuWoZ
   91abrXsGoSa+hiaUqhKFQcZsCcNO/7+npWX/hHCOYv8+iF5+zIlR8ypCN
   6awxEBgi7JRqj70zD6tCaRG5aNYz/VvBF2eSD14O1DArbysawPSwhBQwD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="447112229"
X-IronPort-AV: E=Sophos;i="6.01,151,1684825200"; 
   d="scan'208";a="447112229"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2023 03:34:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="715275624"
X-IronPort-AV: E=Sophos;i="6.01,151,1684825200"; 
   d="scan'208";a="715275624"
Received: from haibo-optiplex-7090.sh.intel.com ([10.239.159.132])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2023 03:34:17 -0700
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
	Ricardo Koller <ricarkol@google.com>,
	Vishal Annapurve <vannapurve@google.com>,
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
Subject: [PATCH v4 00/12] RISCV: Add KVM_GET_REG_LIST API
Date: Fri, 23 Jun 2023 18:40:02 +0800
Message-Id: <cover.1687515463.git.haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_033428_084078_F0FDFE50 
X-CRM114-Status: GOOD (  10.79  )
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
Patch 9 change to do the get/set operation only on present-blessed list.
Patch 10 enabled the KVM_GET_REG_LIST API in riscv.
patch 11-12 added the corresponding kselftest for checking possible
register regressions.

The get-reg-list kvm selftest was ported from aarch64 and tested with
Linux 6.4-rc6 on a Qemu riscv64 virt machine.

---
Changed since v3:
  * Rebase to Linux 6.4-rc6
  * Address Andrew's suggestions and comments:
  *   Move reject_set check logic to a function 
  *   Only do get/set tests on present blessed list 
  *   Only enable ISA extension for the specified config
  *   For disable-not-allowed registers, move them to the filter-reg-list 

Andrew Jones (7):
  KVM: arm64: selftests: Replace str_with_index with strdup_printf
  KVM: arm64: selftests: Drop SVE cap check in print_reg
  KVM: arm64: selftests: Remove print_reg's dependency on vcpu_config
  KVM: arm64: selftests: Rename vcpu_config and add to kvm_util.h
  KVM: arm64: selftests: Delete core_reg_fixup
  KVM: arm64: selftests: Split get-reg-list test code
  KVM: arm64: selftests: Finish generalizing get-reg-list

Haibo Xu (5):
  KVM: arm64: selftests: Move reject_set check logic to a function
  KVM: selftests: Only do get/set tests on present blessed list
  KVM: riscv: Add KVM_GET_REG_LIST API support
  KVM: riscv: selftests: Add finalize_vcpu check in run_test
  KVM: riscv: selftests: Add get-reg-list test

 Documentation/virt/kvm/api.rst                |   2 +-
 arch/riscv/kvm/vcpu.c                         | 375 +++++++++
 tools/testing/selftests/kvm/Makefile          |  11 +-
 .../selftests/kvm/aarch64/get-reg-list.c      | 538 ++-----------
 tools/testing/selftests/kvm/get-reg-list.c    | 439 ++++++++++
 .../selftests/kvm/include/kvm_util_base.h     |  16 +
 .../selftests/kvm/include/riscv/processor.h   |   3 +
 .../testing/selftests/kvm/include/test_util.h |   2 +
 tools/testing/selftests/kvm/lib/test_util.c   |  15 +
 .../selftests/kvm/riscv/get-reg-list.c        | 752 ++++++++++++++++++
 10 files changed, 1658 insertions(+), 495 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/get-reg-list.c
 create mode 100644 tools/testing/selftests/kvm/riscv/get-reg-list.c

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
