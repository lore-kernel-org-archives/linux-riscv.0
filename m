Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11AC5C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jan 2022 18:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NaO+zS4WaJaz5KgfbplQuO0wcEsJWJdrJcRBGRdCRd0=; b=fMdHBf8E6h8ySF
	GhpUraY4qiF+YPbTEx2t65B8Lqgk+/iRCFsIM9NS3c5m/+PxQAla/Jl8scKzm9LI3lWV5KxnnRTGk
	pXoyGFosNyLDes5b/XDifBJszPjxfVGojTPo5NQW0YiudlJGS3Q2ZoQJnwC+g4L3tNJbFDgOetbpY
	5WoiZYKq0Z3imwRthg3EmB6G4Ucw7doWB42aHI4zksASk99Jz94uGuRnTMngG8V6fOa39KSwDG2Aj
	qWIVekbPZhicQ9c4Q8ndvoTAtMCjjl6hYRyMCk+tfGdLM4FdMhlJDJmVZ4lMrf3MFRaG7jVr+SlMX
	pDF7o1NHr4rjadlIwwTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7M9r-00HHwI-KC; Tue, 11 Jan 2022 18:46:11 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7M9o-00HHuv-3n
 for linux-riscv@lists.infradead.org; Tue, 11 Jan 2022 18:46:10 +0000
Received: by mail-yb1-xb29.google.com with SMTP id p5so42750104ybd.13
 for <linux-riscv@lists.infradead.org>; Tue, 11 Jan 2022 10:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sM8wuZyLOamyQ+NaAWxgxygW9jRKD3OsUdPukmMlL1U=;
 b=OpLYe3hGobUDsobWW/zx65mRZbZ+bnV73uNhO5xjHnaneVs0YX2ZC/o290orDokc0u
 WNiWHsAC9xKw+VU2KOnbLTcKHOqsdO5P1aE1IXFuxwY4ZDxpzzL/jn+Lw37Pt6HUlJdW
 LTMdizaDElo92GlzxfbX8joJBw9EPa9Fmw2r0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sM8wuZyLOamyQ+NaAWxgxygW9jRKD3OsUdPukmMlL1U=;
 b=vRt9pkvw15xC0KBz4D5GbaoBPWN11bDbNfOVWiUjPDjE9Y1ALcR+sZhMnnMGjizNG6
 WSvup+tbf0et69DmuApovmmEqzq/ghz5k4c5B5inlKvlxKYXpOP9cxGT1XyBGTAx1q7U
 34jM4asrCqCwslnh4kAOeV+I0T5RQwtb5Ag/Uxlqui0bsqd9ne+NhyVs8qEgSKgjY45d
 NODM8vkG/lzOBJFmnCy9EN4Ilw7u/cgHuZHPdKoGqSDpg88wK/Nz0nNMBlsb/SMnYbKL
 JjI4FPd+6p/VGQEvELPxqQ9kUKNej/U+GhUQ0V9YtGV7WqAL43B4UUiJjnx1J4kqE8T3
 4b1w==
X-Gm-Message-State: AOAM532o0xjJhZ+KJzo+4XgXTCFuoiaM/UVGCRg7BkQvb4n2I3g9G/cJ
 zO1MqqykHhnwSJ7UcGg0iQskBcENSYPbuikuPr2u
X-Google-Smtp-Source: ABdhPJx0Y8SQdmOLymALspxxE440M5sdcmWqHQIm5ZCLL7vr2lFtY9Dk3p4WLCtnG5DHhsKNkV8pIQcewm2Nq+Si/qc=
X-Received: by 2002:a25:d14c:: with SMTP id i73mr832991ybg.713.1641926766802; 
 Tue, 11 Jan 2022 10:46:06 -0800 (PST)
MIME-Version: 1.0
References: <20220111142054.18733-1-nikita.shubin@maquefel.me>
 <B6E7919C-9414-4CC1-BB86-7D358085CECD@jrtc27.com>
In-Reply-To: <B6E7919C-9414-4CC1-BB86-7D358085CECD@jrtc27.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 11 Jan 2022 10:45:56 -0800
Message-ID: <CAOnJCUJ6JNY9eWrPhGi3XK3omDwXhM37oimsZoqxbOP_f7vUog@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] perf tools: Add 'm' event modifier for counting
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Nikita Shubin <nikita.shubin@maquefel.me>,
 Atish Patra <atishp@rivosinc.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux <linux@yadro.com>, 
 Nikita Shubin <n.shubin@yadro.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, 
 Namhyung Kim <namhyung@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Kajol Jain <kjain@linux.ibm.com>, Andi Kleen <ak@linux.intel.com>, 
 Jin Yao <yao.jin@linux.intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Ian Rogers <irogers@google.com>, 
 John Garry <john.garry@huawei.com>, Riccardo Mancini <rickyman7@gmail.com>,
 Song Liu <song@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, linux-perf-users@vger.kernel.org, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_104608_237935_C154B651 
X-CRM114-Status: GOOD (  25.04  )
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

On Tue, Jan 11, 2022 at 6:29 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> On 11 Jan 2022, at 14:20, Nikita Shubin <nikita.shubin@maquefel.me> wrote:
> >
> > From: Nikita Shubin <n.shubin@yadro.com>
> >
> > This patch is a proposal to add Machine Mode modifier that is currently
> > available only for RISC-V for perf tool.
> >
> > We don't currently have a level that is lower than kernel, so i don't
> > see we can reuse something existing for this purpose.
> >

Thanks for a quick turnaround with a working patch!!

However, the use case can be applied to other arch as well. It would
be good to classify this
as excluding "firmware" events instead of machine mode which is a
RISC-V terminology.
Ofcourse, the current documentation should indicate that this option
is only useful
for RISC-V right now.

I would like to understand if this idea is appealing to the broader community.

> > The exclude_machine bit seems harmless to as no one will proccess it apart
> > of riscv.
>
> Armv8 has equivalent bits in PMEVTYPER<n>_EL0 and PMCCFILTR_EL0 for
> EL-based filtering, which includes filtering EL3.
>
> Jess
>
> > Patch depends on Atish Patra PMU series:
> > https://lwn.net/Articles/879905/
> > + some modifications to pass execlude event to SBI PMU extension
> >
> > Tested with qemu.
> >
> > Nikita Shubin (1):
> >  perf tools: Add 'm' event modifier for counting machine
> >
> > include/uapi/linux/perf_event.h        |  3 ++-
> > tools/include/uapi/linux/perf_event.h  |  3 ++-
> > tools/perf/Documentation/perf-list.txt |  1 +
> > tools/perf/tests/parse-events.c        | 18 ++++++++++++++++++
> > tools/perf/util/evsel.c                |  4 +++-
> > tools/perf/util/parse-events.c         | 18 +++++++++++++-----
> > tools/perf/util/parse-events.l         |  2 +-
> > 7 files changed, 40 insertions(+), 9 deletions(-)
> >
> > --
> > 2.31.1
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
