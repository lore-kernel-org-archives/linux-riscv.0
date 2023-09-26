Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A06E7D271
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Sep 2023 09:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8AAmJoJV420xMsnY9cWBK7nEQ3VB+/sQCBQEXkRoJA8=; b=l+0wIHII1LsCcQ
	9fOmYMUNnpRvEozFTV7DEI4DFvAYc0YXLY9ZCNNbrk+FLKUxH133CbI+9tX+vOsgqP2Dw+KNo72/0
	UFHhG3s5wfSa4yqX43WKmEjFbuz2LwqsUFiFFJ3p1c+jfGvaHxtc7vVK+/uds2rhswNyUgXnt5lzC
	e3tsiM87iDU4b3dEENAWeRA+NHxwLu9/Rw0fSNQ8puZI3e+PEvjikol/5OFpQtoa/KLNPkBrElMwV
	+iMKy0ZojzRCvSiPQu1r95ArZ9vC1r8tecJmY/Ic5csoPoEkL+omgIfVXX+vIV4fENP3rJe5GAJVs
	cB7Xhl8lTp4EN1s5hnDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql4Wc-00Fz9R-1Z;
	Tue, 26 Sep 2023 09:38:38 +0000
Received: from mgamail.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql4WZ-00Fz8z-2O
	for linux-riscv@lists.infradead.org;
	Tue, 26 Sep 2023 09:38:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695721115; x=1727257115;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=d3ouO7jf+iohjm9VzwU5wpln3TMDOcB1Wp/B8vx8bWU=;
  b=ltZxl3MGEuVgkRK2ZH6AkFbS2dQg/f9/Q7wxlPyZ7RWwGZ6Pmluqce9w
   vT2ShoUN04t9tqwrRvPGSpCrsLBgmXVE0Jhu29DDRTo6bhwSg6i8Z9Oic
   YhlmHWu0lH9KHGosWcXdo965jftZZPl3J3sGMYppr85q675CbhLL0uofJ
   KUtpoXefSWsqxsCae0FRHcmuE3NX4HB68wo0YSIbl8MgPp18D9B6qoucl
   lnnmmdUHqDRef/P9NfYmqYndMgxW7mOZJS7Vhlta7E+3InF7KHXtr10tg
   HpYZC3ShPwyNwTAJOZoq2nViO2knjSfmLgfcMVOMWkQOv67ewY/rz7i2/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="361773014"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="361773014"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 02:38:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="995767726"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="995767726"
Received: from xiao-desktop.sh.intel.com ([10.239.46.158])
  by fmsmga006.fm.intel.com with ESMTP; 26 Sep 2023 02:38:30 -0700
From: Xiao Wang <xiao.w.wang@intel.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org
Cc: anup@brainfault.org,
	haicheng.li@intel.com,
	ajones@ventanamicro.com,
	yujie.liu@intel.com,
	linux-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiao Wang <xiao.w.wang@intel.com>
Subject: [PATCH v3 0/2] riscv: Optimize bitops with Zbb extension
Date: Tue, 26 Sep 2023 17:46:53 +0800
Message-Id: <20230926094655.3102758-1-xiao.w.wang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_023835_792070_4BA42D26 
X-CRM114-Status: UNSURE (   9.31  )
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

Bitops optimization with specialized instructions is common practice in
popular ISAs, this patch set uses RISC-V Zbb extension to optimize four
bitops: __ffs, __fls, ffs and fls.

The first patch rearranges the content in hwcap.h cpufeature.h, it helps
to avoid a cyclic header including issue for patch 2.

The second patch leverages the alternative mechanism to dynamically apply
this optimization.

The series has following dependency:
https://lore.kernel.org/linux-riscv/20230918131518.56803-8-ajones@ventanamicro.com/

Thanks,
Xiao

v3:
- Fix riscv32 build issue reported by kernel test robot. V3 changes "hwcap.h" to
  "cpufeature.h" for files where cpu feature detection APIs are used. (Yujie)

v2:
- Remove the "EFI_" prefix from macro name "EFI_NO_ALTERNATIVE" to make it
  generic. (Ard)
- patch-1 is added, it's based on "RISC-V: Enable cbo.zero in usermode". (Andrew)


Xiao Wang (2):
  riscv: Rearrange hwcap.h and cpufeature.h
  riscv: Optimize bitops with Zbb extension

 arch/riscv/include/asm/bitops.h       | 266 +++++++++++++++++++++++++-
 arch/riscv/include/asm/cpufeature.h   |  83 ++++++++
 arch/riscv/include/asm/elf.h          |   2 +-
 arch/riscv/include/asm/hwcap.h        |  91 ---------
 arch/riscv/include/asm/pgtable.h      |   1 +
 arch/riscv/include/asm/switch_to.h    |   2 +-
 arch/riscv/include/asm/vector.h       |   2 +-
 arch/riscv/kvm/aia.c                  |   2 +-
 arch/riscv/kvm/main.c                 |   2 +-
 arch/riscv/kvm/tlb.c                  |   2 +-
 arch/riscv/kvm/vcpu_fp.c              |   2 +-
 arch/riscv/kvm/vcpu_onereg.c          |   2 +-
 arch/riscv/kvm/vcpu_vector.c          |   2 +-
 drivers/clocksource/timer-riscv.c     |   2 +-
 drivers/firmware/efi/libstub/Makefile |   2 +-
 drivers/perf/riscv_pmu_sbi.c          |   2 +-
 16 files changed, 359 insertions(+), 106 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
