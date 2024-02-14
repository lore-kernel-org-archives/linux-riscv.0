Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8960C48BC1
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Feb 2024 11:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HOqd5V6liXdRbPwCG7h5xo/XWo+mwdf4MywBxzYodXM=; b=LMIOwiHTho+8PN
	m0w/J/5NT5Rm3xdhqYeWyZvyJ01ALKjVFysLhztTy95WxZY4Pw6RpwcfKnDtsryQzpFU9NpriLD3h
	RalXrV5q0z75VsGhaqITaUvsvISqg/bmGrqXeWAKBSs6iQtlattcGwYrJnOxf5fwrBLOLs6BRsDFT
	Mb6rPTu/yc9fy70sCER2yxX21py+Kp+Cw8AFcvOEi2vXfx2cvkDo2jb5vj8QpCzRR63fRwVrxXWUx
	VLcsqHkOg2lMwY3egEAtpCSIgjfACgh6mX3GzgCGwKYVwNQ02frC9GLVxuKs9ggEpHbW3FOsObcE5
	uI7iuWKv8HLq5+R2D/oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raDch-0000000Chng-34oX;
	Wed, 14 Feb 2024 11:40:19 +0000
Received: from out-181.mta0.migadu.com ([2001:41d0:1004:224b::b5])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raDce-0000000Chn7-04aH
	for linux-riscv@lists.infradead.org;
	Wed, 14 Feb 2024 11:40:18 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1707910810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uT81D9JadSG4shnyPAzeCNq5QuDdA42vAVAwALPxupk=;
	b=i6yVSl6uTdkrx6HNLprqf5oHzRLgtC5JZQkJuQR6agOvHCg/AMST2eLGx1vFU3A00TNMDc
	W6HIk/+HvpVx4AhZasgIvsCQXJOr/PttA4KuQJETrVo5d3VvyVx4r36xtpuK4BnKIJ1efl
	CE0D7myb/TkQwGbDq2rSHjzxZkTlhhI=
From: Leo Yan <leo.yan@linux.dev>
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>,
	Will Deacon <will@kernel.org>,
	James Clark <james.clark@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ming Wang <wangming01@loongson.cn>,
	Kan Liang <kan.liang@linux.intel.com>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Leo Yan <leo.yan@linux.dev>
Subject: [PATCH v1 0/4] perf parse-regs: Cleanup config and building
Date: Wed, 14 Feb 2024 19:39:43 +0800
Message-Id: <20240214113947.240957-1-leo.yan@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_034016_863563_8ECB5E78 
X-CRM114-Status: GOOD (  12.88  )
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

Currently, the perf building enables register parsing based on the
target architecture has supported register feature.

Furthermore, the perf building system needs to maintain a variable
'NO_PERF_REGS' and defines macro 'HAVE_PERF_REGS_SUPPORT' for statically
compiling the tool.

As a result, the perf has no flexibilty for parsing register if an
architecture doesn't support it. And the source files use the macro
'HAVE_PERF_REGS_SUPPORT' to switch on and off the register parsing
related code, which is not a good practice.

This series is to remove the static building for register parsing. In
theory, we should can dynamically detect if an arch has support this
feature and functions can return errors when the feature is not
supported.

The first patch is to remove unused build configuration
CONFIG_PERF_REGS.

The second patch is to build perf register functions, without using the
macro 'HAVE_PERF_REGS_SUPPORT' to statically turn on or off code.

The third patch is to introduce a weak function arch__sample_reg_masks(),
this function can allow the target arch to return its sample register
list.  With this change, we can totally remove the macro
'HAVE_PERF_REGS_SUPPORT' in the source file.

The forth patch is to clean up the Makefile for removing relevant
configuration and macro definition, as they are not useful anymore.

I tested this patch set on Arm64 and x86 for building and did a cross
register parsing ('perf record' on Arm64 and 'perf report' on x86).


Leo Yan (4):
  perf build: Remove unused CONFIG_PERF_REGS
  perf parse-regs: Always build perf register functions
  perf parse-regs: Introduce a weak function arch__sample_reg_masks()
  perf build: Cleanup perf register configuration

 tools/perf/Makefile.config                    | 25 --------------
 tools/perf/arch/arm/util/perf_regs.c          |  7 +++-
 tools/perf/arch/arm64/util/machine.c          |  2 ++
 tools/perf/arch/arm64/util/perf_regs.c        |  7 +++-
 tools/perf/arch/csky/util/perf_regs.c         |  7 +++-
 tools/perf/arch/loongarch/util/perf_regs.c    |  7 +++-
 tools/perf/arch/mips/util/perf_regs.c         |  7 +++-
 tools/perf/arch/powerpc/util/perf_regs.c      |  7 +++-
 tools/perf/arch/riscv/util/perf_regs.c        |  7 +++-
 tools/perf/arch/s390/util/perf_regs.c         |  7 +++-
 tools/perf/arch/x86/util/perf_regs.c          |  7 +++-
 tools/perf/util/parse-regs-options.c          |  8 ++---
 .../util/perf-regs-arch/perf_regs_aarch64.c   |  4 ---
 .../perf/util/perf-regs-arch/perf_regs_arm.c  |  4 ---
 .../perf/util/perf-regs-arch/perf_regs_csky.c |  4 ---
 .../util/perf-regs-arch/perf_regs_loongarch.c |  4 ---
 .../perf/util/perf-regs-arch/perf_regs_mips.c |  4 ---
 .../util/perf-regs-arch/perf_regs_powerpc.c   |  4 ---
 .../util/perf-regs-arch/perf_regs_riscv.c     |  4 ---
 .../perf/util/perf-regs-arch/perf_regs_s390.c |  4 ---
 .../perf/util/perf-regs-arch/perf_regs_x86.c  |  4 ---
 tools/perf/util/perf_regs.c                   | 11 ++++--
 tools/perf/util/perf_regs.h                   | 34 +------------------
 23 files changed, 67 insertions(+), 112 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
