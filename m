Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C97BEC43334
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jun 2022 05:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8gkpvWi+vol0XOY83hEcOL4yR7CCaZphmbZxwDBihhs=; b=eGf5WR9X0pe0uj
	1vjs6HZVGR+vfKv5GIReydDqBPf497nYQPq4pCtQ/USdSrL5+gqRGSKEMPJ3XKAxt7zTPuqXwOoFE
	3/SC1yJTr4+PUgr1X6N4wPnP4hC6C3k5d7F1h8BUDAgIpXTsOoNuvlmzFV9ARAwAQm5wWquuCPgRz
	g5nXSQNOQuiBNwIFKKjTuxc4bxIPWzddQxIjaQw4QZULf8A266XclKAi2y78k/I2dsqZwDJRHJ1JQ
	9i9Jv5B6b3cWIYutGIBUSBKv8mFg4FPMSeleQe9/JGbEZC4iiLm6D9pYFPDZm1xd1AtWylIRW9U4X
	DUPS6nw6d/FLlBwxKE6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4yW7-004jgu-W2; Sat, 25 Jun 2022 05:39:36 +0000
Received: from forward500j.mail.yandex.net ([5.45.198.250])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4yVv-004jea-LA; Sat, 25 Jun 2022 05:39:25 +0000
Received: from iva1-5d4bed9ec33e.qloud-c.yandex.net (iva1-5d4bed9ec33e.qloud-c.yandex.net [IPv6:2a02:6b8:c0c:298:0:640:5d4b:ed9e])
	by forward500j.mail.yandex.net (Yandex) with ESMTP id 2E2AA6CB8553;
	Sat, 25 Jun 2022 08:39:21 +0300 (MSK)
Received: from iva6-2d18925256a6.qloud-c.yandex.net (iva6-2d18925256a6.qloud-c.yandex.net [2a02:6b8:c0c:7594:0:640:2d18:9252])
	by iva1-5d4bed9ec33e.qloud-c.yandex.net (mxback/Yandex) with ESMTP id 6mNwP7t9KO-dJfSARhe;
	Sat, 25 Jun 2022 08:39:21 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1656135561;
	bh=sO6lv1ZaVsGCGLQcMcTq6F56qYmSsejjTXP/P42zzXY=;
	h=In-Reply-To:Subject:Cc:To:From:References:Date:Message-ID;
	b=o5oyqrUGzYOQV9pIoheCfiSYg/iYp5RNTfmP5Rqp6hyA0t2jBZUjqDsLrpwofU/i+
	 eT+y4CEGRYKpEvQ+C4PmFKo3hxCJ4qhe5/KbXXbuz3R4uL4axfkLIoroPBsNLsXg5O
	 GeOELEHAjAXBeCZ8qbTccK8xNPq6vUqHQfcKiAiE=
Authentication-Results: iva1-5d4bed9ec33e.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by iva6-2d18925256a6.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id FJ8J2gkSvz-dHMu2Cgc;
	Sat, 25 Jun 2022 08:39:18 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
Date: Sat, 25 Jun 2022 08:39:16 +0300
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Atish Patra <atishp@atishpatra.org>
Cc: Anup Patel <anup@brainfault.org>, =?UTF-8?B?Sm/Do28gTcOhcmlv?= Domingos
 <joao.mario@tecnico.ulisboa.pt>, linux <linux@yadro.com>, Nikita Shubin
 <n.shubin@yadro.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Arnaldo Carvalho de Melo
 <acme@kernel.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa
 <jolsa@kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org List"
 <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org,
 linux-riscv <linux-riscv@lists.infradead.org>, Mark Rutland
 <mark.rutland@arm.com>, Namhyung Kim <namhyung@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Peter
 Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v4 0/5] RISC-V: Create unique identification for SoC PMU
Message-ID: <20220625083916.66e75def@redslave.neermore.group>
In-Reply-To: <CAOnJCU+2mOMj7MPzLKVZQ46gRs=ghxP6FK6oWkss0DfN_si3DQ@mail.gmail.com>
References: <20220624160117.3206-1-nikita.shubin@maquefel.me>
	<CAOnJCU+2mOMj7MPzLKVZQ46gRs=ghxP6FK6oWkss0DfN_si3DQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_223924_122879_02028C83 
X-CRM114-Status: GOOD (  25.37  )
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

Hello Atish!

On Fri, 24 Jun 2022 10:05:34 -0700
Atish Patra <atishp@atishpatra.org> wrote:

> On Fri, Jun 24, 2022 at 9:01 AM Nikita Shubin
> <nikita.shubin@maquefel.me> wrote:
> >
> > From: Nikita Shubin <n.shubin@yadro.com>
> >
> > This series aims to provide matching vendor SoC with corresponded
> > JSON bindings.
> >
> > The ID string is proposed to be in form of
> > MVENDORID-MARCHID-MIMPID, for example for Sifive Unmatched the
> > corresponding string will be:
> >
> > 0x489-0x8000000000000007-0x[[:xdigit:]]+,v1,sifive/u74,core
> >
> > Where MIMPID can vary as all impl supported the same number of
> > events, this might not be true for all future SoC however.
> >
> > Also added 3 counters which are standart for all RISC-V
> > implementations and SBI firmware events prerry names, as any
> > firmware that supports SBI PMU should also support firmare events.
> >
> > Link:
> > https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/riscv-sbi.adoc
> > Link:
> > https://patchwork.kernel.org/project/linux-riscv/list/?series=648017
> > --- v3->v4:
> > - drop pmuid in riscv_pmu_sbi, we are using /proc/cpuinfo
> > - rework util/header.c to use /proc/cpuinfo
> > - add SBI firmware events
> > - add firmware and std arch events to U74 pmu bindings
> > - change U74 id string and description in mapfile.csv
> > ---
> > Nikita Shubin (5):
> >   drivers/perf: riscv_pmu_sbi: perf format
> >   perf tools riscv: Add support for get_cpuid_str function
> >   perf arch events: riscv arch std event files
> >   perf arch events: riscv sbi firmare std event files
> >   perf vendor events riscv: add Sifive U74 JSON file
> >
> >  drivers/perf/riscv_pmu_sbi.c                  |  20 +++
> >  tools/perf/arch/riscv/util/Build              |   1 +
> >  tools/perf/arch/riscv/util/header.c           | 109 ++++++++++++++
> >  tools/perf/pmu-events/arch/riscv/mapfile.csv  |  17 +++
> >  .../pmu-events/arch/riscv/riscv-generic.json  |  20 +++
> >  .../arch/riscv/riscv-sbi-firmware.json        | 134
> > ++++++++++++++++++ .../arch/riscv/sifive/u74/firmware.json       |
> > 68 +++++++++ .../arch/riscv/sifive/u74/generic.json        |  11 ++
> >  .../arch/riscv/sifive/u74/instructions.json   |  92 ++++++++++++
> >  .../arch/riscv/sifive/u74/memory.json         |  32 +++++
> >  .../arch/riscv/sifive/u74/microarch.json      |  57 ++++++++
> >  11 files changed, 561 insertions(+)
> >  create mode 100644 tools/perf/arch/riscv/util/header.c
> >  create mode 100644 tools/perf/pmu-events/arch/riscv/mapfile.csv
> >  create mode 100644
> > tools/perf/pmu-events/arch/riscv/riscv-generic.json create mode
> > 100644 tools/perf/pmu-events/arch/riscv/riscv-sbi-firmware.json
> > create mode 100644
> > tools/perf/pmu-events/arch/riscv/sifive/u74/firmware.json create
> > mode 100644
> > tools/perf/pmu-events/arch/riscv/sifive/u74/generic.json create
> > mode 100644
> > tools/perf/pmu-events/arch/riscv/sifive/u74/instructions.json
> > create mode 100644
> > tools/perf/pmu-events/arch/riscv/sifive/u74/memory.json create mode
> > 100644 tools/perf/pmu-events/arch/riscv/sifive/u74/microarch.json
> >
> > --
> > 2.35.1
> >  
> 
> Thanks Nikita for reworking on the patches. It is good to specify that
> this series now depends
> on Anup's patch[1] that adds the mvendorid/mimpid to the
> /proc/cpuinfo.
> 
> [1] https://lkml.org/lkml/2022/6/20/498
> 

I will correct the remarks and fire a v5 next week then, hope some more
comments will rise for current version.

Do you have any thoughts or comments on cpuid form
"MVENDORID-MARCHID-MIMPID" ?


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
