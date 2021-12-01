Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20601C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Dec 2021 12:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XvyXLBCRkqwJS8PlkqK7cc5iQuKR1S8ob6KKolPkpbg=; b=1Ef1eh8yXAjHGp
	6heZbSsLp7npR5vW15RLvlXA3ZB/nPSmFG2nmkThwAwkr2IswQbA1CQ2rNVqiFYN5MLmCFkGhWzqT
	uxE4z5jjZCuKhaY1GN+J/FWeufdg81tk2bpGq6oIxVVPUx+GIvNNax6zfajSaXkG/1qfDutCkKpDM
	Gzum9IQ3xEe5xVe74S8KlhQY7oakG3wMXUP2B+KpSKLBnSvJIlw5eOL+Ez5Ocv1l/aV2qSbiyprvG
	2WzojfAddWIQ3L4foT+XrCfgcioyDMvyrs3Ps+TolEFCWeRS/onVQgDzSHiRB2835iK2QGnI4RJap
	8+uLQY58BD7aWUQATuyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msOoS-008Toh-NC; Wed, 01 Dec 2021 12:34:16 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msOoF-008TkI-El; Wed, 01 Dec 2021 12:34:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E9971477;
 Wed,  1 Dec 2021 04:34:00 -0800 (PST)
Received: from e127744.cambridge.arm.com (e127744.cambridge.arm.com
 [10.1.32.151])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EB1BC3F694;
 Wed,  1 Dec 2021 04:33:56 -0800 (PST)
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
Subject: [PATCH v1 0/4] Support register names from all architectures
Date: Wed,  1 Dec 2021 12:33:28 +0000
Message-Id: <20211201123334.679131-1-german.gomez@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_043403_647013_77E82742 
X-CRM114-Status: GOOD (  13.67  )
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

The commit message from [4/4] shows how register names aren't correctly
presented when performing x-arch analysis of perf.data files (i.e.
recording in one arch, then reading the file from a different arch).

Please let me know if there are any concerns with this approach, or if
any improvements can be made for subsequent re-rolls of the changeset.

  - [PATCH 1/4] Fixes a potential out-of-bounds access when reading the
    values of the registers in the perf.data file.
  - [PATCH 2/4] Modifies one of the callbacks in "struct scripting_ops"
    so that the python version can obtain the correct register names.
  - [PATCH 3/4] Adds header files with the register indices and names
    from all architectures, which are used by the next patch.
  - [PATCH 4/4] Refactors the function "perf_reg_name" so that it can
    support registers from all architectures, not just the local one.

Thanks,
German

German Gomez (4):
  perf tools: Prevent out-of-bounds access to registers
  perf script: Add "struct machine" parameter to process_event callback
  perf tools: Crete header files with register names
  perf tools: Support register names from all architectures

 tools/perf/arch/arm/include/perf_regs.h       |  42 --------
 tools/perf/arch/arm64/include/perf_regs.h     |  76 -------------
 tools/perf/arch/csky/include/perf_regs.h      |  82 --------------
 tools/perf/arch/mips/include/perf_regs.h      |  69 ------------
 tools/perf/arch/powerpc/include/perf_regs.h   |  66 ------------
 tools/perf/arch/riscv/include/perf_regs.h     |  74 -------------
 tools/perf/arch/s390/include/perf_regs.h      |  78 --------------
 tools/perf/arch/x86/include/perf_regs.h       |  82 --------------
 tools/perf/builtin-script.c                   |  26 ++---
 tools/perf/util/event.h                       |   5 +-
 tools/perf/util/perf_regs.c                   |   3 +
 tools/perf/util/perf_regs.h                   |  33 +++++-
 tools/perf/util/perf_regs_arm.h               |  57 ++++++++++
 tools/perf/util/perf_regs_arm64.h             |  83 ++++++++++++++
 tools/perf/util/perf_regs_csky.h              | 101 ++++++++++++++++++
 tools/perf/util/perf_regs_mips.h              |  76 +++++++++++++
 tools/perf/util/perf_regs_powerpc.h           |  74 +++++++++++++
 tools/perf/util/perf_regs_riscv.h             |  81 ++++++++++++++
 tools/perf/util/perf_regs_s390.h              |  85 +++++++++++++++
 tools/perf/util/perf_regs_x86.h               |  87 +++++++++++++++
 .../util/scripting-engines/trace-event-perl.c |   3 +-
 .../scripting-engines/trace-event-python.c    |  33 +++---
 tools/perf/util/session.c                     |  25 ++---
 tools/perf/util/trace-event-scripting.c       |   3 +-
 tools/perf/util/trace-event.h                 |   3 +-
 25 files changed, 733 insertions(+), 614 deletions(-)
 create mode 100644 tools/perf/util/perf_regs_arm.h
 create mode 100644 tools/perf/util/perf_regs_arm64.h
 create mode 100644 tools/perf/util/perf_regs_csky.h
 create mode 100644 tools/perf/util/perf_regs_mips.h
 create mode 100644 tools/perf/util/perf_regs_powerpc.h
 create mode 100644 tools/perf/util/perf_regs_riscv.h
 create mode 100644 tools/perf/util/perf_regs_s390.h
 create mode 100644 tools/perf/util/perf_regs_x86.h

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
