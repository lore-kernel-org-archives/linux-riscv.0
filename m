Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A78C77B7F
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 09:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1wSJJnjz3Ja29aNAo14P3mzN/Ur7dpIKSk6AAifnE3I=; b=TPHxvyKlJ3rFco
	dzIkdXT1dJ0zGhl7ZrFmbdf8V3JgXrz8pLrSLKqytFOYKA+RzOOSeLSaDChs3qEPgtOEJsMQGX3SJ
	wdQumePuAUgv+VW/04guJ0V75YMODYON1QCdcxHVapwAgQBtuqfHWpIYhQ1j5RmkC8F4srp1n03Yi
	FTzGOQVx2lJGlCiwJSvUFQH3sn3+uSLHjjFnVazZEM5m9znJTK49o8nc0BuaowOSleKD2Iq73NHvK
	KtC3YoVCQP0PvpVQxLoAPh+CJuaqEwgrCBY71xaW0TxbJArNiIbErLI0X/EY/ly3MlMOANK6Z3YlE
	GmZqPl86fMPFz1zsvwKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px2Pm-008Jyp-21;
	Thu, 11 May 2023 09:16:46 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px2Pj-008JwJ-2Q;
	Thu, 11 May 2023 09:16:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683796603; x=1715332603;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=n3XwJXO5FdIVuPB1WqckwaILsrCamFfH7Cyu/4AMII0=;
  b=H70h4KSndRoYDSBD8FarkrUNQwEnDutnijagayiMKS9reNE82tiya+7g
   pZZYbc7sDF0u3BXg3uTHIR/fKi3cDgBiW3ntIxJ5azUnGe2GhxgzpftKE
   uU7EQeolcZNNNnXtm2DPx5eNPumFRMmh1LyHwGeSMUs+azI22oP/BQoKp
   bz8K4Gx3VvXwsleag+dtwIeDkDQL2EDR4Xb0VsYj2Lc8eEulhdFxhYDT/
   VuuykmarkH+7w/eHNRmDeOfBhrL9eDP+J+HZEMPlm0BBx/m5ejjoK/vGd
   5Zyx+7z+TeFaRwcNXoy847R28sMm3mVv/aJWhAOSgLRjO6Ev5+qgFwGDU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="416040307"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="416040307"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 02:16:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="789316811"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="789316811"
Received: from haibo-optiplex-7090.sh.intel.com ([10.239.159.132])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 02:16:34 -0700
From: Haibo Xu <haibo1.xu@intel.com>
To: 
Cc: xiaobo55x@gmail.com,
	ajones@ventanamicro.com,
	Haibo Xu <haibo1.xu@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 0/2] RISCV: Add KVM_GET_REG_LIST API
Date: Thu, 11 May 2023 17:22:47 +0800
Message-Id: <cover.1683791148.git.haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_021643_853441_0BF731F2 
X-CRM114-Status: UNSURE (   8.50  )
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

Patch 1 enabled the KVM_GET_REG_LIST API in riscv and patch 2 added
the corresponding kselftest for checking possible register regressions.

Both patches were ported from arm64 and tested with Linux 6.4-rc1 on a
Qemu riscv virt machine.

Haibo Xu (2):
  riscv: kvm: Add KVM_GET_REG_LIST API support
  KVM: selftests: Add riscv get-reg-list test

 Documentation/virt/kvm/api.rst                |   2 +-
 arch/riscv/kvm/vcpu.c                         | 346 +++++++
 tools/testing/selftests/kvm/Makefile          |   3 +
 .../selftests/kvm/include/riscv/processor.h   |   3 +
 .../selftests/kvm/riscv/get-reg-list.c        | 869 ++++++++++++++++++
 5 files changed, 1222 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/kvm/riscv/get-reg-list.c

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
