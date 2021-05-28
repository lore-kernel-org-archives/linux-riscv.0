Return-Path: <SRS0=2wW0=KX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6E45C4708E
	for <linux-riscv@archiver.kernel.org>; Fri, 28 May 2021 18:45:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4985613DD
	for <linux-riscv@archiver.kernel.org>; Fri, 28 May 2021 18:45:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4985613DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=35+L4dsB1FdixavU5rMNnPCTGANLYvDm0xSULt7+Kwk=; b=slvJ/8IA0loC0B
	M4tGRuDql8CTBhbuf8eyvWUp+DjLUB7eqalHYeTVQkzoEaC/gjUEeVGkfn7RwNZ23QbEneWz2Z/7M
	XZ3q1uygdXkv3aIvMQjzr+qK9foeehTQLwzqIuQzIH+36RcrXG6BdVE67T12rvzs8hehwBcE0kCBU
	wUb6atoSr+L0SWamQvMzzeqh5S1gy8ZU6m1HQ3I2jsl9RH3k3qVKPMAR1rz6EIxM0q+PPbjqPN9mx
	P0XN+RTunmogNj5F/pEae7J5ho4Te+UI7YOkLP4hCGhgCIwRvI2w+rYVgPfPSMi7SqBPnLgKFVjR9
	NS2rywQJ6xhvJyxmzsqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmhTJ-000MeL-Uu; Fri, 28 May 2021 18:44:38 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmhTA-000MXg-4E
 for linux-riscv@lists.infradead.org; Fri, 28 May 2021 18:44:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1622227481; x=1653763481;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YRFcB3Ij8slOZSzscA4hGt4gAmSSrJb4B7MzBb4wlnI=;
 b=lnaRqoz08ng2TNZXvzMAXzZWajeSvvUVMVqWc8ykg2CB7Vt1l1BbEKNW
 pfKi0q1Ho/dex2cjJpZPzuG3BNSoSI8zi1bHnq56u7wsqKsBfT6FGjuAI
 URZEabH6bV/Z+EBf+DCxMKiIFSdqp+i0sdDRGlbrbBmqBXHLLsFFyNtxJ
 be1WgjqCQ5rcYX0XNTIvKrcHrwr6NwQvSE2vCGSrasthxurE40bxG3K+G
 VbmCE39csVCAO0utprRKng2fsJT1zAiLYbIrYvk6JcXAN/Nkj5UvHmjqc
 d6GZv46QGe/VOOi34v6E7iDFaciNAPU6vqT0ieDU0jI1z7BphEpdOzNUS g==;
IronPort-SDR: 0+Kr/dwJZVa4FxnYrGdb/rLLpMgj0UpEwbl/r336yObwkSjbLwrY8Qpi9Pg0O4omycutBpLgAB
 2fIOCMRrONutGEaj00rzEy63N6dMWLrXO2vyEIxu0z/6OYSxKrXPrBD06HJ4d+KLUMDWC5mSRc
 +tjn8L0t77MMudsModnlnLZ4pwa5Zq4MA4saRaBexSdwzqQ2w12psCdQL3Bf7TgPS7sPqZGHt7
 PkN4T1fvq6CMTb0hI02y5zoqQ8TDcu9if6VLhQeTiwQ5DZDrxIxpP7MqlTLFc/k255GhrdBU89
 dFI=
X-IronPort-AV: E=Sophos;i="5.83,230,1616428800"; d="scan'208";a="273763742"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 29 May 2021 02:44:36 +0800
IronPort-SDR: tbdvBMaGPnafV0jOqsL+tMZldjLwhxEWkxGsCycpqg35Cv28WRSpUdwE1L+VAgJRGm91iuNw0n
 QBFTNN3aWvUplt1EwNsrvtsmD6fC2L6O9VBbChyS8QpaL1aVo3ECoXcbjMjYdSQcfNX76zh5R7
 g7YDRrVibYJTMhRi/BSTGV4PxTD6jdFdB6t2h9KXdFARTdnLtcazqHtdIll2ir/+AKdJfl8z4N
 +WGcd8XJqoPQtDn/dCptGaBXLk3+/is6UkU20D+2CafbgZad9CmpTUmv/AGJMnnTDYaaxDqnRo
 /Og8iPwREL0dGA6qq+ZM6GQA
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2021 11:23:47 -0700
IronPort-SDR: FwKkID0ZyCmK4yldsD9bwlpL7YKTj+dqrsIMrw8blAmx7w/E+zaal8/Z9fwFDVreYWz1Zw5xAj
 dNv/yCesVUBhLzSeTOIqpaNOfaagRIyl1d63bJBP/ePXQICOeqrBJf5NqenQQ20vVDYw+1Btlv
 eBHyQ4U5szKVvPpLJy8+F9pXQ3r3vi5tpDdVjPDB2FwEafE5SjXuFJ7f14Q0T5JJAn8KgZfp8W
 1+52WvFzs8eWA/5kFc51FOaKND3DPqIroVgnXbGqgHX7Yzz9jJHrdFO5TBamt5k0YdcLtFpU8x
 pF8=
WDCIronportException: Internal
Received: from unknown (HELO jedi-01.wdc.com) ([10.225.163.91])
 by uls-op-cesaip02.wdc.com with ESMTP; 28 May 2021 11:44:20 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 bpf@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Guo Ren <guoren@linux.alibaba.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, linux-doc@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
 Nick Kossifidis <mick@ics.forth.gr>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Alan Kao <alankao@andestech.com>,
 Nick Hu <nickhu@andestech.com>, Vincent Chen <vincent.chen@sifive.com>
Subject: [RFC v2 0/7] Improve RISC-V Perf support using SBI PMU extension
Date: Fri, 28 May 2021 11:43:58 -0700
Message-Id: <20210528184405.1793783-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_114428_295696_D4DF44E8 
X-CRM114-Status: GOOD (  20.50  )
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

This series adds improved perf support for RISC-V based system using
SBI PMU extension[1]. It is based on a platform driver instead of a existing
arch specific implementation. The new perf implementation has adopted a modular
approach where most of the generic event handling is done in the core library
while individual PMUs need to only implement necessary features specific to
the PMU. This is easily extensible and any future RISC-V PMU implementation
can leverage this. Currently, SBI PMU driver & legacy PMU driver are implemented
as a part of this series.

The SBI based driver provides more advanced features such as event configure
start/stop. This version does not implement counter overflow
& filtering yet. That will implemented in the future on top of this series
using "Sscofpmf" extension. 

The legacy driver tries to reimplement the existing minimal perf under a new
config to maintain backward compatibility. This implementation only allows
monitoring of always running cycle/instruction counters. Moreover, they can
not be started or stopped. In general, this is very limited and not very useful.
That's why, I am not very keen to carry the support into the new driver.
However, I don't want to break perf for any existing hardware platforms.
If nobody really uses perf currently, I will be happy to drop PATCH 4.

This series has been tested in Qemu on RV64 only. Qemu[2] & OpenSBI [3] patches
are required to test it. Qemu changes are not backward compatible. That means,
you can not use perf anymore on older Qemu versions with latest OpenSBI
and/or Kernel. However, newer kernel will just use legacy pmu driver if
old OpenSBI is detected or hardware doesn't implement mcountinhibit.

Here is an output of perf stat while running hackbench.

[root@fedora-riscv riscv]# perf stat -e r8000000000000007 -e r8000000000000006 \
-e r0000000000000002 -e r0000000000000004 -e branch-misses -e cache-misses \
-e cycles -e instructions ./hackbench -pipe 15 process 15

Running with 15*40 (== 600) tasks.
Time: 1.548

 Performance counter stats for './hackbench -pipe 15 process 15':

             7,103      r8000000000000007     (62.56%) --> SBI_PMU_FW_IPI_RECVD
             7,767      r8000000000000006     (12.19%) --> SBI_PMU_FW_IPI_SENT
                 0      r0000000000000002     (24.79%) --> a custom raw event described in DT
     <not counted>      r0000000000000004     (0.00%)  --> non-supported raw event described in DT
                 0      branch-misses         (12.65%) 
                 0      cache-misses          (25.36%)
    27,978,868,702      cycles                (38.12%)
    27,849,527,556      instructions          # 1.00  insn per cycle  (50.46%)

       2.431195184 seconds time elapsed

       1.553153000 seconds user
      13.615924000 seconds sys

The patches can also be found in the github[4].

[1] https://lists.riscv.org/g/tech-unixplatformspec/message/950
[2] https://github.com/atishp04/qemu/tree/riscv_pmu_v1
[3] https://github.com/atishp04/opensbi/tree/riscv_pmu_v2
[4] https://github.com/atishp04/linux/tree/riscv_pmu_v2

Changes from v1->v2
1. Implemented the latest SBI PMU extension specification.
2. The core platform driver was changed to operate as a library while only
   sbi based PMU is built as a driver. The legacy one is just a fallback if
   SBI PMU extension is not available.

Atish Patra (7):
RISC-V: Remove the current perf implementation
RISC-V: Add CSR encodings for all HPMCOUNTERS
RISC-V: Add a perf core library for pmu drivers
RISC-V: Add a simple platform driver for RISC-V legacy perf
RISC-V: Add RISC-V SBI PMU extension definitions
RISC-V: Add perf platform driver based on SBI PMU extension
Documentation: riscv: Remove the old documentation

Documentation/riscv/pmu.rst         | 255 -------------
arch/riscv/Kconfig                  |  13 -
arch/riscv/include/asm/csr.h        |  58 +++
arch/riscv/include/asm/perf_event.h |  72 ----
arch/riscv/include/asm/sbi.h        |  94 +++++
arch/riscv/kernel/Makefile          |   1 -
arch/riscv/kernel/perf_event.c      | 485 -------------------------
drivers/perf/Kconfig                |  25 ++
drivers/perf/Makefile               |   5 +
drivers/perf/riscv_pmu.c            | 328 +++++++++++++++++
drivers/perf/riscv_pmu_legacy.c     |  92 +++++
drivers/perf/riscv_pmu_sbi.c        | 537 ++++++++++++++++++++++++++++
include/linux/cpuhotplug.h          |   1 +
include/linux/perf/riscv_pmu.h      |  61 ++++
14 files changed, 1201 insertions(+), 826 deletions(-)
delete mode 100644 Documentation/riscv/pmu.rst
delete mode 100644 arch/riscv/kernel/perf_event.c
create mode 100644 drivers/perf/riscv_pmu.c
create mode 100644 drivers/perf/riscv_pmu_legacy.c
create mode 100644 drivers/perf/riscv_pmu_sbi.c
create mode 100644 include/linux/perf/riscv_pmu.h

--
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
