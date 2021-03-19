Return-Path: <SRS0=wr6O=IR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D49B3C433DB
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Mar 2021 23:01:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 768C96197B
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Mar 2021 23:01:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 768C96197B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PzioxshuFhel4zR5Xw/MbWYjxhnnTn7tjx7eQuUthy4=; b=qOrwaX6oV+A/efpLFHN2XCmqrK
	Lan+SjmjK7Ov/mBljs4CPUSE1JystaEW1AHTUrXUblIAYfOr6q5k/HbUTEP54Ftz5pRD9XfUqL+Yc
	3Z2DM1thG+U6yu4jHAWMayEXiPSCVask8QgW52YNd0Niu9ThMxtVUSE3La2WZIBIEyFx1YEXUfc8d
	jGLewhHU14ayV5730pqpsCDHuiupycD9ZzfSwpcj5yyvHWxAqz+1jhWbK/xmCDVy0m+5Ef89rLUKY
	e2mTMiIaxeGCU5O9uxXR+Ud4qEnKB26Cuyf0itnmW4miTsdH/3d9ivAbxTw09O7onMqVZ2dohW2a4
	N8k3UrSQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lNO7c-008IUG-LW; Fri, 19 Mar 2021 23:01:36 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lNO7X-008ISd-B9
 for linux-riscv@lists.infradead.org; Fri, 19 Mar 2021 23:01:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1616194892; x=1647730892;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0Qf9TjLEkAqG4lRDNO3udtS6r3hubcbTqxRFi+Zi17s=;
 b=cwAUuFy0GM67CoKhRa07Dv0ko96FI1FEq/enIr9RZfdSAxYWNiPeyjd0
 MU5RGZt3C6W7Uz5ymzXoMTv+ZFvZXDn8uXRskUFyzUk+zTddnl/g+BsUx
 +BXT7Vg3/5rWyrChkRVyvayVCJNh37YNokR9CZVJePgAQK9m5mEmQrAas
 hlYnzdtabMqjticGNkEfZo4z9zAD1Wz4fWrCCSpjRBWvy3BIQdZNuX0CI
 4ZlVr4UliuiusSQrTXEPbWTGb2sAyNqOeQT4KrgpyLo9S3L0m9o5u2vV2
 WuSjsVSKDJCuXvBjPZ9N3Yo5roYMmBXQhIWPfZOekxsbKY+NBk8r5+fvL g==;
IronPort-SDR: uC7fGgx252xtzrf5BaSq42UFCnMEiN4nBfbkJ98fp7Sn7h44Bd1ou1ojp/1bJnxHx+H/UI30dg
 tThYiDwPYANfSvOltgQ2C1FnWFQx8KpYr5jidZyUa6Wa34+oOUdJA0Y0Y1lewlv7GFhTE05ek6
 e803g5RW9Cxq1y7vLEZ98P66zNoTw1T7MEs8r8Z4m4Gh6E4/iA3vY95mBFwT8Ncl+E3AaOnOCN
 CEBIE+oOgjMLYWTWwqib9x0FckHKjomht7/aVAALwjz+kE7240RDA+HKPbEqdBGpnm9IeEknZa
 6Aw=
X-IronPort-AV: E=Sophos;i="5.81,263,1610380800"; d="scan'208";a="163715801"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Mar 2021 07:01:30 +0800
IronPort-SDR: MH1smLMlbpztfMIWy8ZvWzJvc09MCzRbO+a3Q/h+r3CqzpxV39GZpqmQ9ZHMVvtX5oJDt3kgnA
 PFR+ZZjAzwwFz/LKxCSw07Ib228XabvB1/pSQ+eGOJC/vVeg2E2vwqK4hONmyzo9ffLXB5hkzf
 zj2yAQ+Ypq/0OQMwBmlnGnU5w9mhUguTmjNAVlFLhZ2ySvn1nOfs6tibqSnuUqJQYRjf8QohGs
 x+8V+/c97an9WWCX1uEjFr8UlSkndbEYc3TEcN7reL5Ze/fQlcIqEbtZ7JYw29RZXJkA1JnZDG
 EX+7hOq2wClA2rDpi232dzVk
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2021 15:42:01 -0700
IronPort-SDR: WtbzaVxxfmKWmKaOXP5pznJullm99yE0eUrF+pcc3X67ZA2teNqDg/5mqnH/pqLQ8p5bDiZJ7Y
 BKlWPB4SQvzjLVYenj3iT1eQSp0NJicFWRa7O3+kedm05yHtuGFl1jtrHJIoX2XyOHR/zDP3/l
 YLl7zXgwedkr5FFawG/emmG5xrR92bfhr6KKCOgLIEcUMuEEX5hLKCyazVIlqoAunaiPwYvmro
 2ugrHrYOV3phGH2iUpRBfBcdB+ENC8X2zA0PC64n+TgiG7O1/VQfn9kgQYeDpSl/6j93PX4itp
 gm0=
WDCIronportException: Internal
Received: from ind002560.ad.shared (HELO jedi-01.hgst.com) ([10.86.48.105])
 by uls-op-cesaip02.wdc.com with ESMTP; 19 Mar 2021 16:01:30 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atish.patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anup Patel <anup.patel@wdc.com>, Ard Biesheuvel <ardb@kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, linux-riscv@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Will Deacon <will@kernel.org>
Subject: [RFC 0/6] Improve RISC-V Perf support using SBI PMU extension
Date: Fri, 19 Mar 2021 16:01:00 -0700
Message-Id: <20210319230106.2186694-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_230131_912427_58DCA27E 
X-CRM114-Status: GOOD (  20.29  )
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
arch specific implementation. The core platform driver is implemented in
such a way that most of the generic event handling is done in the core driver
while individual PMUs need to only implement necessary features specific to
the PMU. This is easily extensible and any future RISC-V PMU implementation
can leverage this. Currently, SBI PMU driver & legacy PMU driver are implemented
as a part of this series.

The SBI based driver provides more advanced features such as event configure
start/stop. This version does not implement counter overflow
& filtering yet. That will implemented in the future on top of this series
using "Sscof" extension. The RISC-V perf documentation will also be updated
at that time with all the bits.

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

[1] https://lists.riscv.org/g/tech-unixplatformspec/message/598
[2] https://github.com/atishp04/qemu/tree/riscv_pmu_v1
[3] https://github.com/atishp04/opensbi/tree/riscv_pmu_v1
[4] https://github.com/atishp04/linux/tree/riscv_pmu_v1

Atish Patra (6):
RISC-V: Remove the current perf implementation
RISC-V: Add CSR encodings for all HPMCOUNTERS
RISC-V: Add a perf core platform driver
RISC-V: Add a simple platform driver for RISC-V legacy perf
RISC-V: Add RISC-V SBI PMU extension definitions
RISC-V: Add perf platform driver based on SBI PMU extension

arch/riscv/Kconfig                  |  13 -
arch/riscv/include/asm/csr.h        |  58 ++++
arch/riscv/include/asm/perf_event.h |  72 -----
arch/riscv/include/asm/sbi.h        |  80 +++++
arch/riscv/kernel/Makefile          |   1 -
arch/riscv/kernel/perf_event.c      | 485 ----------------------------
drivers/perf/Kconfig                |  25 ++
drivers/perf/Makefile               |   5 +
drivers/perf/riscv_pmu.c            | 397 +++++++++++++++++++++++
drivers/perf/riscv_pmu_legacy.c     |  88 +++++
drivers/perf/riscv_pmu_sbi.c        | 464 ++++++++++++++++++++++++++
include/linux/cpuhotplug.h          |   1 +
include/linux/perf/riscv_pmu.h      |  61 ++++
13 files changed, 1179 insertions(+), 571 deletions(-)
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
