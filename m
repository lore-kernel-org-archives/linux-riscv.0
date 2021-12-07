Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83C2C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Dec 2021 18:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QtguoFrboKroqI0QUB8Glaws5+6eCV7YKb1Y7hHJMg0=; b=45gdp/idr8huQA
	mKAuJF7IpStp+bzIUz4Gd3ysvRGjel1wSgTmt63OTR6f4IuA/lajJtUULPExABawSQKNxdDJpPG8F
	MTjMIP7a8s+HdZUJ5OsBIKNk8PA6h0/axQaxGeDy1zl1Y2lmiCWuF068TcAeIoScMnXcW2vx+t6Zd
	7QwXwiIH4URMkDndiQqCHUSxzZggkag9VBkNtG2M1OadaKRifEa1AlkJx4oqE+jO18oH0vLlDgCMh
	TpwhWbs+QxzMqmVUMsNZodc+UNVTgxvl1+0sptteriEVXTrPHiuTTl3LLu3/Q5UiBHPK9q5lcHhVS
	LHZcd7IOcB8RGzfaHQSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muesG-009eKP-Jv; Tue, 07 Dec 2021 18:07:32 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mues2-009eFO-Au; Tue, 07 Dec 2021 18:07:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F3A9111FB;
 Tue,  7 Dec 2021 10:07:15 -0800 (PST)
Received: from e127744.cambridge.arm.com (e127744.cambridge.arm.com
 [10.1.37.151])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7D95D3F73B;
 Tue,  7 Dec 2021 10:07:12 -0800 (PST)
From: German Gomez <german.gomez@arm.com>
To: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 acme@kernel.org
Cc: German Gomez <german.gomez@arm.com>, John Garry <john.garry@huawei.com>,
 Will Deacon <will@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linaro.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/3] Support register names of all architectures
Date: Tue,  7 Dec 2021 18:06:49 +0000
Message-Id: <20211207180653.1147374-1-german.gomez@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_100718_447650_BFCC8751 
X-CRM114-Status: GOOD (  10.94  )
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

The following changeset applies some corrections to the way system
registers are processed and presented when reading perf.data files using
the various perf tools.

The commit message from [3/3] shows how register names aren't correctly
presented when performing x-arch analysis of perf.data files (recording
in one arch, then reading the file from a different arch).

  - [PATCH 1/3] Fixes a potential out-of-bounds access when reading the
    values of the registers in the perf.data file.
  - [PATCH 2/3] Fixes an issue of ARM and ARM64 registers having the
    same enum name.
  - [PATCH 3/3] Refactors the function "perf_reg_name" declared in the
   "tools/perf/util/perf_regs.h" header, in order to support every arch.

Thanks,
German

--
Changes since v1

  - Added "Reported-by" tags.
  - Removed [PATCH 2/4] because it's not needed (suggested by Athira
    Rajeev).
  - Removed [PATCH 3/4] which created additional header files with the
    register names of every arch.
  - Introduced [PATCH 2/3] to deal with ARM and ARM64 registers having the
    same enum name across "/tools/perf/".
  - Reworked the refactor of "perf_reg_name" function (now implemented in
    perf_regs.c, rather than in the header file) in [PATCH 3/3].

German Gomez (3):
  perf tools: Prevent out-of-bounds access to registers
  perf tools: Rename perf_event_arm_regs for ARM64 registers
  perf tools: Support register names from all archs

 tools/perf/arch/arm/include/perf_regs.h       |  42 --
 tools/perf/arch/arm64/include/perf_regs.h     |  78 +-
 tools/perf/arch/csky/include/perf_regs.h      |  82 ---
 tools/perf/arch/mips/include/perf_regs.h      |  69 --
 tools/perf/arch/powerpc/include/perf_regs.h   |  66 --
 tools/perf/arch/riscv/include/perf_regs.h     |  74 --
 tools/perf/arch/s390/include/perf_regs.h      |  78 --
 tools/perf/arch/x86/include/perf_regs.h       |  82 ---
 tools/perf/builtin-script.c                   |  18 +-
 tools/perf/util/event.h                       |   5 +-
 tools/perf/util/libunwind/arm64.c             |   2 +
 tools/perf/util/perf_regs.c                   | 671 +++++++++++++++++-
 tools/perf/util/perf_regs.h                   |  10 +-
 .../scripting-engines/trace-event-python.c    |  10 +-
 tools/perf/util/session.c                     |  25 +-
 15 files changed, 709 insertions(+), 603 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
