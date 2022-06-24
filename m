Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55AD6C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jun 2022 16:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UHWlPnkab86aD0N5jTraPq0kQ+EpIuQzfnJWfwJG0/s=; b=IN9B1sBele9yiO
	9S7yQE0r6g2hhPS3+yOLCajt5Svf+SE9ar+2xJ6gWLGLMOeFKk40C/IDCZZLodc2roovBM9yivefU
	q1EYGs2FCm4aqRbNq+IUpG/Ba14ekB3c5beGCPK3C/x1s9rdfkHqbzF14tYdE3FqVAevJ81s2fKhX
	qVLgzoQJXE+5YO9nf3EgHveVvtpiXy1sR3q4DXVl78udW46Ie/AvcHNtZLlxqR/BUSbEK4mlNGy0U
	z2yEi5EPpGOj2J80jJTBVVPeOrakXXYdZynqSwlzvirta0cuM3cI0zl1VbvhE03ln36cMhVI+x1/1
	mKHmzD9xv7CIRoVW7vdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4lki-002wU0-EL; Fri, 24 Jun 2022 16:01:48 +0000
Received: from forward101p.mail.yandex.net ([2a02:6b8:0:1472:2741:0:8b7:101])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4lkU-002wQU-TM; Fri, 24 Jun 2022 16:01:38 +0000
Received: from myt5-36442628f0be.qloud-c.yandex.net (myt5-36442628f0be.qloud-c.yandex.net [IPv6:2a02:6b8:c12:1c0c:0:640:3644:2628])
	by forward101p.mail.yandex.net (Yandex) with ESMTP id E74B059D0609;
	Fri, 24 Jun 2022 19:01:24 +0300 (MSK)
Received: from myt5-ca5ec8faf378.qloud-c.yandex.net (myt5-ca5ec8faf378.qloud-c.yandex.net [2a02:6b8:c12:2514:0:640:ca5e:c8fa])
	by myt5-36442628f0be.qloud-c.yandex.net (mxback/Yandex) with ESMTP id 2Fyt6Hhqj2-1MfK7rLK;
	Fri, 24 Jun 2022 19:01:24 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1656086484;
	bh=V2FI//aX/fY8Jc2kwGxZThRsM9F7hvj3YMlPdBRYyS8=;
	h=Date:Subject:Cc:To:From:Message-Id;
	b=QwQN4xN62UdWVzVipm9XF6FMGLsXU4unzPCWkMLbgtbOO9GD0BgOvdKPvbUNueeSj
	 Nvmgzcoy4deQU9Q+eS+S/CVwkJlDWH6FBk8zFDH5la+3PJzBGm0gmYVAiK+GgWt5Nf
	 UIrvp3ChDrB9NGAnjkhEYA6NgZMPMcaqhZ6FYSq4=
Authentication-Results: myt5-36442628f0be.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by myt5-ca5ec8faf378.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id iVUkuL8Azf-1LMKbASM;
	Fri, 24 Jun 2022 19:01:21 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>
Cc: =?UTF-8?q?Jo=C3=A3o=20M=C3=A1rio=20Domingos?= <joao.mario@tecnico.ulisboa.pt>,
	linux@yadro.com,
	Nikita Shubin <n.shubin@yadro.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jiri Olsa <jolsa@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v4 0/5] RISC-V: Create unique identification for SoC PMU
Date: Fri, 24 Jun 2022 19:00:50 +0300
Message-Id: <20220624160117.3206-1-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_090136_371949_7806FBC3 
X-CRM114-Status: GOOD (  11.51  )
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

This series aims to provide matching vendor SoC with corresponded JSON bindings.

The ID string is proposed to be in form of MVENDORID-MARCHID-MIMPID, for example 
for Sifive Unmatched the corresponding string will be:

0x489-0x8000000000000007-0x[[:xdigit:]]+,v1,sifive/u74,core

Where MIMPID can vary as all impl supported the same number of events, this might not 
be true for all future SoC however.

Also added 3 counters which are standart for all RISC-V implementations and SBI firmware 
events prerry names, as any firmware that supports SBI PMU should also support firmare 
events.

Link: https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/riscv-sbi.adoc
Link: https://patchwork.kernel.org/project/linux-riscv/list/?series=648017
---
v3->v4:
- drop pmuid in riscv_pmu_sbi, we are using /proc/cpuinfo
- rework util/header.c to use /proc/cpuinfo
- add SBI firmware events
- add firmware and std arch events to U74 pmu bindings
- change U74 id string and description in mapfile.csv
---
Nikita Shubin (5):
  drivers/perf: riscv_pmu_sbi: perf format
  perf tools riscv: Add support for get_cpuid_str function
  perf arch events: riscv arch std event files
  perf arch events: riscv sbi firmare std event files
  perf vendor events riscv: add Sifive U74 JSON file

 drivers/perf/riscv_pmu_sbi.c                  |  20 +++
 tools/perf/arch/riscv/util/Build              |   1 +
 tools/perf/arch/riscv/util/header.c           | 109 ++++++++++++++
 tools/perf/pmu-events/arch/riscv/mapfile.csv  |  17 +++
 .../pmu-events/arch/riscv/riscv-generic.json  |  20 +++
 .../arch/riscv/riscv-sbi-firmware.json        | 134 ++++++++++++++++++
 .../arch/riscv/sifive/u74/firmware.json       |  68 +++++++++
 .../arch/riscv/sifive/u74/generic.json        |  11 ++
 .../arch/riscv/sifive/u74/instructions.json   |  92 ++++++++++++
 .../arch/riscv/sifive/u74/memory.json         |  32 +++++
 .../arch/riscv/sifive/u74/microarch.json      |  57 ++++++++
 11 files changed, 561 insertions(+)
 create mode 100644 tools/perf/arch/riscv/util/header.c
 create mode 100644 tools/perf/pmu-events/arch/riscv/mapfile.csv
 create mode 100644 tools/perf/pmu-events/arch/riscv/riscv-generic.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/riscv-sbi-firmware.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/sifive/u74/firmware.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/sifive/u74/generic.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/sifive/u74/instructions.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/sifive/u74/memory.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/sifive/u74/microarch.json

-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
