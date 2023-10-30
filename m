Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99BBAC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 06:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2uj9bN/cZmUSIol9Za9GSI1VMpJop08FU9iCqEl77M8=; b=zemS9hTOlWe5RA
	4lBKagAo+Nef+uWPeESUlW/LPCvWjhVBajNx6Y2E53TqSjgVVAJn3H+RsNCbAJvjOQ9N6Q+rbNpQP
	wd19xqlkui5afYrJObQ0FiX8czRkPID4OMJ0M/kawyPdM+ivGHoeS01BWDtprpJGQLQhXnYXAbsRF
	J10ZQe4+5IjRnlcq8KyqIqIOMScGoMH96ML+daPqRO0Kn+8PkAv9SKTOsm/lvQWkiqNYGtKNsEGcb
	D5WyI6qPye+LIlt/0DCPa4RTX9wFGM8XP+zJGCCxyBIDIpkgrsBwAziBvk3jjImBqSR+KS23Drfsx
	AGrNlkI0pD1R2W9x01uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxLmG-002f6W-1g;
	Mon, 30 Oct 2023 06:29:32 +0000
Received: from mgamail.intel.com ([134.134.136.31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxLmD-002f57-27
	for linux-riscv@lists.infradead.org;
	Mon, 30 Oct 2023 06:29:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698647369; x=1730183369;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=EOx93d6rorzC+eSitj0kGZenM894c+BPrPvevSZ3o3Y=;
  b=WIGvJ7EjS7QFWzCpTvCHVQYGnxO2eC4dTqZJexqdgtMSOFtD3v1s/+3M
   uuty/+VvFLYNE2itav5Acb5G3ngTqb5CzzqbxmYKQ9HoVt2BEJ6YFtCm0
   IMhzhOLAHltxvVDvxWqTAO99rLdEZeilTDBRPTAEHobF2Q+co58YDV4MQ
   qR7wIa0BV4Sr9xBh+tGrCssE0gKFeJs3d8ULJZUT2gHVysNkSJxoufOJa
   JnP6s9FDncEhIkpEkGw2QedIdXZSydp8nwuFI8v2S+v1yW4s4NBxT4Z5v
   QknXfg5lib754ocg+btqlRyUuttwIyLRXkJJ2ouNL/TOm5X1YlAHcamEc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="452277971"
X-IronPort-AV: E=Sophos;i="6.03,262,1694761200"; 
   d="scan'208";a="452277971"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2023 23:29:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="903893068"
X-IronPort-AV: E=Sophos;i="6.03,262,1694761200"; 
   d="scan'208";a="903893068"
Received: from xiao-desktop.sh.intel.com ([10.239.46.158])
  by fmsmga001.fm.intel.com with ESMTP; 29 Oct 2023 23:29:22 -0700
From: Xiao Wang <xiao.w.wang@intel.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org
Cc: anup@brainfault.org,
	haicheng.li@intel.com,
	ajones@ventanamicro.com,
	yujie.liu@intel.com,
	charlie@rivosinc.com,
	linux-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiao Wang <xiao.w.wang@intel.com>
Subject: [PATCH v4 0/2] riscv: Optimize bitops with Zbb extension
Date: Mon, 30 Oct 2023 14:39:02 +0800
Message-Id: <20231030063904.2116277-1-xiao.w.wang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231029_232929_735292_EE4674D8 
X-CRM114-Status: GOOD (  11.30  )
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

The first patch rearranges the content in hwcap.h and cpufeature.h, it helps
to avoid a cyclic header including issue for patch 2.

The second patch leverages the alternative mechanism to dynamically apply
this optimization.

Thanks,
Xiao

v4:
- Simplify the asm code in ffs() and fls() by moving general logic into C
  implementation. (Charlie)
- Add a comment to decorating the large #ifdef block. (Charlie)
- Link to v3: https://lore.kernel.org/all/20230926094655.3102758-1-xiao.w.wang@intel.com/

v3:
- Fix riscv32 build issue reported by kernel test robot. V3 changes "hwcap.h" to
  "cpufeature.h" for files where cpu feature detection APIs are used. (Yujie)
- Link to v2: https://lore.kernel.org/all/20230920074653.2509631-1-xiao.w.wang@intel.com/

v2:
- Remove the "EFI_" prefix from macro name "EFI_NO_ALTERNATIVE" to make it
  generic. (Ard)
- patch-1 is added, it's based on "RISC-V: Enable cbo.zero in usermode". (Andrew)
- Link to v1: https://lore.kernel.org/all/20230806024715.3061589-1-xiao.w.wang@intel.com/

Xiao Wang (2):
  riscv: Rearrange hwcap.h and cpufeature.h
  riscv: Optimize bitops with Zbb extension

 arch/riscv/include/asm/bitops.h       | 255 +++++++++++++++++++++++++-
 arch/riscv/include/asm/cpufeature.h   |  83 +++++++++
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
 drivers/bitopstest/Kconfig            |   1 +
 drivers/clocksource/timer-riscv.c     |   2 +-
 drivers/firmware/efi/libstub/Makefile |   2 +-
 drivers/perf/riscv_pmu_sbi.c          |   2 +-
 17 files changed, 349 insertions(+), 106 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
