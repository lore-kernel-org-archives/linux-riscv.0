Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E07C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jan 2022 14:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FUQp3dzdXcONyQ4x/Q+x2vXYt+54ZdRPAc26wUJe0Bg=; b=O8KWl59nePREDk
	j/FJ96dw+ghqE0pnKfKE6TtN0NlcE+tnmfNaZDDcFvOsV3qH/32Ra6eP0KI+LM7WBXfiI1TWlaz7/
	XHVSDNK6wCFMgEVJrTyXAZdkNILJwrsKOCDiLv0TmOyAZiYwk5Hs1kcUeBAMHpWRaQ1+npfh+9CZT
	bjTAIsOfROYnO163+PSAsJ9oSFWrmzZI6fvST1yyVbDFspxNh3DdTavxHsAf84ZqaTSRdX6cTeNFL
	qvt60TKsek2/2Dcp+1P9Kmk/ZxeMW/QOg7H0X2BOV4TbiLyivqCGogR76fi6IMURt90ufQrmN8MBq
	kPg2dIvQS9iTaOfLK1ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7I1N-00GXwy-Lm; Tue, 11 Jan 2022 14:21:09 +0000
Received: from forward103o.mail.yandex.net ([2a02:6b8:0:1a2d::606])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7I1J-00GXuE-T0
 for linux-riscv@lists.infradead.org; Tue, 11 Jan 2022 14:21:08 +0000
Received: from sas1-cf895df4fa0e.qloud-c.yandex.net
 (sas1-cf895df4fa0e.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:390f:0:640:cf89:5df4])
 by forward103o.mail.yandex.net (Yandex) with ESMTP id 2221610A8BD9;
 Tue, 11 Jan 2022 17:20:58 +0300 (MSK)
Received: from sas1-37da021029ee.qloud-c.yandex.net
 (sas1-37da021029ee.qloud-c.yandex.net [2a02:6b8:c08:1612:0:640:37da:210])
 by sas1-cf895df4fa0e.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 VROTXavEds-Kuf4kE1q; Tue, 11 Jan 2022 17:20:58 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
 t=1641910858; bh=8UNetPbQ/mXpqTJYoL+hQG1SQunMszfpEUYRAI8PqrY=;
 h=Date:Subject:To:From:Message-Id:Cc;
 b=fFeTodt48DledIFE0xodTCXNeCMmxtdO0v6hYyp1uog5+kd8BA0ekQiDjXYlWoSF5
 is205IGWWL6ubGmZSgssgMXCzWgUxO753aBmFLpQ/nXWVpA2J/FItM5eFDJTV8Am7d
 W6U5aF8IukIZNhTN6Wa4AFx+ZBo/nwRxgZiWgSRc=
Authentication-Results: sas1-cf895df4fa0e.qloud-c.yandex.net;
 dkim=pass header.i=@maquefel.me
Received: by sas1-37da021029ee.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id l3U269SIUy-KsPqUEcG; Tue, 11 Jan 2022 17:20:55 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: 
Cc: Atish Patra <atishp@rivosinc.com>, linux-riscv@lists.infradead.org,
 linux@yadro.com, Nikita Shubin <n.shubin@yadro.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Kajol Jain <kjain@linux.ibm.com>, Andi Kleen <ak@linux.intel.com>,
 Jin Yao <yao.jin@linux.intel.com>, Kan Liang <kan.liang@linux.intel.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Ian Rogers <irogers@google.com>,
 John Garry <john.garry@huawei.com>, Riccardo Mancini <rickyman7@gmail.com>,
 Song Liu <song@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/1] perf tools: Add 'm' event modifier for counting
Date: Tue, 11 Jan 2022 17:20:47 +0300
Message-Id: <20220111142054.18733-1-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_062106_516008_6BEFC53F 
X-CRM114-Status: GOOD (  10.53  )
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

From: Nikita Shubin <n.shubin@yadro.com>

This patch is a proposal to add Machine Mode modifier that is currently 
available only for RISC-V for perf tool.

We don't currently have a level that is lower than kernel, so i don't 
see we can reuse something existing for this purpose.

The exclude_machine bit seems harmless to as no one will proccess it apart 
of riscv.

Patch depends on Atish Patra PMU series:
https://lwn.net/Articles/879905/
 + some modifications to pass execlude event to SBI PMU extension

Tested with qemu.

Nikita Shubin (1):
  perf tools: Add 'm' event modifier for counting machine

 include/uapi/linux/perf_event.h        |  3 ++-
 tools/include/uapi/linux/perf_event.h  |  3 ++-
 tools/perf/Documentation/perf-list.txt |  1 +
 tools/perf/tests/parse-events.c        | 18 ++++++++++++++++++
 tools/perf/util/evsel.c                |  4 +++-
 tools/perf/util/parse-events.c         | 18 +++++++++++++-----
 tools/perf/util/parse-events.l         |  2 +-
 7 files changed, 40 insertions(+), 9 deletions(-)

-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
