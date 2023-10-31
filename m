Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30AA5C00142
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 06:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zlKRNUVimBthoJ8hzutc7vNmRfe7jSXhEc5+ynpirE8=; b=rLxnwcY1PwEaS6
	w2lH4/5xip+78BLsXE0lXf/KkeElGqRVWhgmMg2dk0V2QYSjSQKcnxiWNuVusNW7H1mf/3MDBW/q1
	cz9j1LbNX10RA8YDH9LJ4G8dJL6NbCPLKwAMObQ0WkZp6M4e271pDVfRy6oXgDyOZc+wxw7BtjBM9
	bUvrdzfNzWZt5UNiK4a2JqIxFkrGeFb7tqndsRq/ZnhkAI0yM40HLwHCKTOUgJMglp1jOSUVU8co/
	vx7CnDeQ+HsrC0jbbaINwCl1lc2Uzzk7A8gEXxMyqbPe7eWoTmbx74qfM2D2bcdCXE+kS5AJ2BOg+
	DmnP6Ry1cfUBJ1vs8kqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxiMN-004dTx-2c;
	Tue, 31 Oct 2023 06:36:19 +0000
Received: from mgamail.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxiMK-004dSy-0g
	for linux-riscv@lists.infradead.org;
	Tue, 31 Oct 2023 06:36:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698734176; x=1730270176;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=D+Aqhz12Bpi1YAVZ9gwZAkjrkKUZGH7axOamL/bkDyY=;
  b=Y9nJ9yJTDpJcw6gup2t3bqP3jk2Ft8+5EEIFtxwo5Xh2ViCY5lx4hWim
   Y32BRdQ392WTKYC5kNklbbv4gYodj4mSi/8ulfXTbwNsMuL5Fzuo6XVDC
   KXoTb++7tPE1YfnjZSWL9hszt20wAvkJ5yiF294WYO6QFyfuPaBCWC0ib
   DshfnbpHzxTh3r7yXS4XKa6eseqyWD/5TEZvV9+SU1olzJlZQPbyOs9JV
   4DybyjGl7XWX1QFyIRWift351/XNYRxZAeid3Sst20ATlQH5qiolJwX80
   RYTlDbCE6K1jnTPcjR0kH1mVfTv90u3T0EQzywdJvgC/RrT9R3dGdFcEy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="474463655"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="474463655"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 23:36:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="1091896282"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="1091896282"
Received: from xiao-desktop.sh.intel.com ([10.239.46.158])
  by fmsmga005.fm.intel.com with ESMTP; 30 Oct 2023 23:35:59 -0700
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
Subject: [PATCH v5 0/2] riscv: Optimize bitops with Zbb extension
Date: Tue, 31 Oct 2023 14:45:51 +0800
Message-Id: <20231031064553.2319688-1-xiao.w.wang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_233616_280876_496E4E7A 
X-CRM114-Status: GOOD (  10.31  )
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

v5:
- Fix all the checkpatch complaints from "scripts/checkpatch.pl --strict". (Charlie)
  There're three kinds of complaints on patch 2/2 code style:
  * CHECK: Lines should not end with a '('
  * CHECK: spaces preferred around that '-' (ctx:VxV)
  * CHECK: Macro argument reuse 'x' - possible side-effects?
  The third warning on fls(x) macro is fixed alongside with code style improvement.
- Drop the mistakenly added content in v4. (Charlie)
- Link to v4: https://lore.kernel.org/all/20231030063904.2116277-1-xiao.w.wang@intel.com/

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

 arch/riscv/include/asm/bitops.h       | 254 +++++++++++++++++++++++++-
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
 drivers/clocksource/timer-riscv.c     |   2 +-
 drivers/firmware/efi/libstub/Makefile |   2 +-
 drivers/perf/riscv_pmu_sbi.c          |   2 +-
 16 files changed, 347 insertions(+), 106 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
