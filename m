Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4921C25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 07:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mWZgGwMFNAxRJ5jMPsDIEZDzHn3sl5mFaiM0EQCuOI4=; b=kmlsEHG7kGqs09
	2O1B41FWVJ4RpqlSjQQYtQx+VqLtkvUa/USsCdk01PX8W740XT/a1NmzS+1UgFqkwf5fn8usth3q1
	5ERHYcCBxDhyCe3tZm5om0U3FTz/ccrzmPuM26g0JO6xUxXhNQWILxZIgKRYcJx2qN47hciniTnY4
	wM72Cgs1sGBaShvIZMjLcSeqaemjrauVOIejKh+e7z0nB3wH7WbNngcGozZa/0HBSIbAMMuHUxWI+
	wlzDspxbSLaS/8NNOtGbYYgl5zjf0oVSgA5S0I+2P8APh1E5CEWRv/SH/KnnZrbFRePHnlZuuXUdj
	v8EmTtlZ+NfUl//xyLRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAPja-00000008Jjv-0hui;
	Fri, 24 May 2024 07:53:02 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAPjX-00000008Ji6-03tr
	for linux-riscv@lists.infradead.org;
	Fri, 24 May 2024 07:53:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716537179; x=1748073179;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ch+MbRPZTGBQUr5ZCA23iXr8FmFMlS0SQtrDDjy1Y0M=;
  b=Afmd7RLRELDfHVt0atdtG8IU2LuyM2aSVVHKdt8M2VVlzGCDzkX7rqua
   HWFdUICPjNzh1cPBnPZS5DxJuL5ZhWr1cBX4lFvACOLQ63kKyI2pVIcgD
   6dSuUbwVYAxjDqM6UR3jvOcBxA+gxiUWrmvZw5FpjtcZ1sgkjXmUxkmxQ
   7VkrTOIdJHkVa7u5DHfqyLRw03CgsewyQrY6Qp39ZqrdWvYBwTcN2Mw2d
   pMKyuLzCbZ6/D2ysYqOn+Vcashs+OSZR2qUKZ6xVy3IOcI40xIgVG93EU
   dQuZ4kFajL9qlyrM0a4TGwO15RngpMsPG8pHuLvBcdP3MBEqm7vPqtwS7
   w==;
X-CSE-ConnectionGUID: +XAm0bZHRb246HfR+pHpNg==
X-CSE-MsgGUID: 1Gz0zALiQH6yebWJYw0BNw==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="15845958"
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; 
   d="scan'208";a="15845958"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 00:52:57 -0700
X-CSE-ConnectionGUID: Re7qkzs6RuCEsJ3DEFCn2w==
X-CSE-MsgGUID: 9CFGnEvqQjKWmLYUyFkJjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; 
   d="scan'208";a="33953892"
Received: from xiao-desktop.sh.intel.com ([10.239.46.158])
  by fmviesa006.fm.intel.com with ESMTP; 24 May 2024 00:52:51 -0700
From: Xiao Wang <xiao.w.wang@intel.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	luke.r.nels@gmail.com,
	xi.wang@gmail.com,
	bjorn@kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@google.com,
	haoluo@google.com,
	jolsa@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	pulehui@huawei.com,
	puranjay@kernel.org,
	haicheng.li@intel.com,
	Xiao Wang <xiao.w.wang@intel.com>
Subject: [PATCH bpf-next v4 0/2] riscv, bpf: Introduce Zba optimization
Date: Fri, 24 May 2024 15:55:41 +0800
Message-Id: <20240524075543.4050464-1-xiao.w.wang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_005259_089502_D2CBEB74 
X-CRM114-Status: UNSURE (   6.43  )
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

The riscv Zba extension provides instructions to accelerate the generation
of addresses that index into arrays of basic data types, bpf JIT generated
insn counts could be reduced by leveraging Zba for address calculation.

The first patch introduces RISCV_ISA_ZBA Kconfig option and uses Zba add.uw
insn to optimize zextw operation.

The second patch uses Zba shift-and-add insns to optimize address
calculation for array of unsigned long data.

Thanks,
Xiao

v4:
* Combine the second patch (previously v1) and the first patch into a series. (Bjorn)
* Rebase the second patch on bpf-next tree.
* Link to v3: https://lore.kernel.org/bpf/20240516090430.493122-1-xiao.w.wang@intel.com/

v3:
* Remove the Kconfig dependencies on TOOLCHAIN_HAS_ZBA and
  RISCV_ALTERNATIVE. (Andrew)
* Link to v2: https://lore.kernel.org/bpf/20240511023436.3282285-1-xiao.w.wang@intel.com/

v2:
* Add Zba description in the Kconfig. (Lehui)
* Reword the Kconfig help message to make it clearer. (Conor)
* Link to v1: https://lore.kernel.org/bpf/20240507104528.435980-1-xiao.w.wang@intel.com/

Xiao Wang (2):
  riscv, bpf: Optimize zextw insn with Zba extension
  riscv, bpf: Introduce shift add helper with Zba optimization

 arch/riscv/Kconfig              | 12 ++++++++
 arch/riscv/net/bpf_jit.h        | 51 +++++++++++++++++++++++++++++++++
 arch/riscv/net/bpf_jit_comp32.c |  3 +-
 arch/riscv/net/bpf_jit_comp64.c |  9 ++----
 4 files changed, 67 insertions(+), 8 deletions(-)


base-commit: 5c1672705a1a2389f5ad78e0fea6f08ed32d6f18
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
