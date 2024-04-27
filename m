Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1EBFC04FFE
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Apr 2024 01:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Llx8hYYiRGrtAxItKUpz6G9B4TLurA/u4387caIaSU=; b=ng/SgDU8Sv4omP
	oJYk8hVj+9GASQVeAdpwDE6ZTiqlLEBZGLgtoBjuhaBhl7c8N3mBuOxDfwmAyv5HsIpg61+HvtGsV
	1f7xfbnIJ/jpxIXUnNIbK1XieMeX+PUB9NV9DuIh+Yx578EINdWbH1jCu8QGH6ONxXL7RAShZye8T
	FnBMoCELQ30omOWTDVZJWgUjTY5y35dpVz16IFQ1Kau/k8/UBBfgytktLG5xbVjJ9w4CQJZy3scbk
	cWVe7gXg8AHtB9c10ocKMzluvtD6azrF3aNj4jYVyje78puLBoHRwDcjwFd+S/rKIMDNaQSHzS/4r
	vs68dS7U5v7HM0gRyGEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0WzW-0000000EalM-1YtF;
	Sat, 27 Apr 2024 01:36:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0WzS-0000000Eajb-3Qek
	for linux-riscv@lists.infradead.org;
	Sat, 27 Apr 2024 01:36:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3A63F62188;
	Sat, 27 Apr 2024 01:36:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87305C113CD;
	Sat, 27 Apr 2024 01:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714181793;
	bh=BudDBwyhpbKB2aXRILMYhmtkIAgfvk+c5Frdnp906+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bAczzvLxktMk2sNSoo93ELqiK0WpdVjXHWFX5MYD6Te6nQIYcl4u4gla7J1WcuZj0
	 uZwHewL5qVsdGKol73/RPbnlGh61otqebH/NveTsr7oS/MgHKuuOb/W+ng/XOndfj1
	 qTUq+LKWhTkihocBzatd1QE2VbEVyRybRvrpCjuzmrpgbOt2gfN+6dhBT6QeARXCfO
	 c1+9LHKdeZNrLw9OfTE36RxWtUrVPsWtoszO8vj7y4hLBywZpa60vp7+cZPDrIIjTU
	 ThuCumqPMEAc2Iv5YyzPNgeVJt8oBkbKTDMiJTytSrP3BWfFC3J4AJnXlnScFTpbXM
	 ZtBntmIGvouDA==
Date: Fri, 26 Apr 2024 22:36:31 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	James Clark <james.clark@arm.com>, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
	Atish Patra <atishp@rivosinc.com>, linux-riscv@lists.infradead.org,
	Beeman Strong <beeman@rivosinc.com>
Subject: Re: [PATCH v2 11/16] perf parse-events: Improve error message for
 bad numbers
Message-ID: <ZixWn-ZCBpwH_2xp@x1>
References: <20240416061533.921723-1-irogers@google.com>
 <20240416061533.921723-12-irogers@google.com>
 <ZixWfypP4FtKgv0F@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZixWfypP4FtKgv0F@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_183634_969294_73F20A7C 
X-CRM114-Status: GOOD (  12.74  )
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

On Fri, Apr 26, 2024 at 10:36:02PM -0300, Arnaldo Carvalho de Melo wrote:
> On Mon, Apr 15, 2024 at 11:15:27PM -0700, Ian Rogers wrote:
> > Use the error handler from the parse_state to give a more informative
> > error message.
> > 
> > Before:
> > ```
> > $ perf stat -e 'cycles/period=99999999999999999999/' true
> > event syntax error: 'cycles/period=99999999999999999999/'
> >                                   \___ parser error
> > Run 'perf list' for a list of valid events
> > 
> >  Usage: perf stat [<options>] [<command>]
> > 
> >     -e, --event <event>   event selector. use 'perf list' to list available events
> > ```
> > 
> > After:
> > ```
> > $ perf stat -e 'cycles/period=99999999999999999999/' true
> > event syntax error: 'cycles/period=99999999999999999999/'
> >                                   \___ parser error
> > 
> 
> This ended up in perf-tools-next, will have to look at what this problem
> is:
> 
>    9    11.46 amazonlinux:2                 : FAIL gcc version 7.3.1 20180712 (Red Hat 7.3.1-17) (GCC) 
>      yy_size_t parse_events_get_leng (yyscan_t yyscanner );
>                ^~~~~~~~~~~~~~~~~~~~~
>     util/parse-events.l:22:5: note: previous declaration of 'parse_events_get_leng' was here
>      int parse_events_get_leng(yyscan_t yyscanner);
>          ^~~~~~~~~~~~~~~~~~~~~
>      yy_size_t parse_events_get_leng  (yyscan_t yyscanner)
>                ^~~~~~~~~~~~~~~~~~~~~
>     util/parse-events.l:22:5: note: previous declaration of 'parse_events_get_leng' was here
>      int parse_events_get_leng(yyscan_t yyscanner);
>          ^~~~~~~~~~~~~~~~~~~~~
>     make[3]: *** [util] Error 2
> 
> 
> Unsure if this will appear on the radar on other distros, maybe this is
> just something that pops up with older distros...
> 
> Ran out of time today...

Context:

perfbuilder@number:~$ export BUILD_TARBALL=http://192.168.86.42/perf/perf-6.9.0-rc5.tar.xz
perfbuilder@number:~$ time dm
   1   102.33 almalinux:8                   : Ok   gcc (GCC) 8.5.0 20210514 (Red Hat 8.5.0-20) , clang version 16.0.6 (Red Hat 16.0.6-2.module_el8.9.0+3621+df7f7146) flex 2.6.1
   2   102.44 almalinux:9                   : Ok   gcc (GCC) 11.4.1 20230605 (Red Hat 11.4.1-2) , clang version 16.0.6 (Red Hat 16.0.6-1.el9) flex 2.6.4
   3   124.34 alpine:3.15                   : Ok   gcc (Alpine 10.3.1_git20211027) 10.3.1 20211027 , Alpine clang version 12.0.1 flex 2.6.4
   4   109.42 alpine:3.16                   : Ok   gcc (Alpine 11.2.1_git20220219) 11.2.1 20220219 , Alpine clang version 13.0.1 flex 2.6.4
   5    90.08 alpine:3.17                   : Ok   gcc (Alpine 12.2.1_git20220924-r4) 12.2.1 20220924 , Alpine clang version 15.0.7 flex 2.6.4
   6    84.85 alpine:3.18                   : Ok   gcc (Alpine 12.2.1_git20220924-r10) 12.2.1 20220924 , Alpine clang version 16.0.6 flex 2.6.4
   7    94.18 alpine:3.19                   : Ok   gcc (Alpine 13.2.1_git20231014) 13.2.1 20231014 , Alpine clang version 17.0.5 flex 2.6.4
   8    95.45 alpine:edge                   : Ok   gcc (Alpine 13.2.1_git20240309) 13.2.1 20240309 , Alpine clang version 17.0.6 flex 2.6.4
   9    11.46 amazonlinux:2                 : FAIL gcc version 7.3.1 20180712 (Red Hat 7.3.1-17) (GCC) 
     yy_size_t parse_events_get_leng (yyscan_t yyscanner );
               ^~~~~~~~~~~~~~~~~~~~~
    util/parse-events.l:22:5: note: previous declaration of 'parse_events_get_leng' was here
     int parse_events_get_leng(yyscan_t yyscanner);
         ^~~~~~~~~~~~~~~~~~~~~
     yy_size_t parse_events_get_leng  (yyscan_t yyscanner)
               ^~~~~~~~~~~~~~~~~~~~~
    util/parse-events.l:22:5: note: previous declaration of 'parse_events_get_leng' was here
     int parse_events_get_leng(yyscan_t yyscanner);
         ^~~~~~~~~~~~~~~~~~~~~
    make[3]: *** [util] Error 2
  10    88.41 amazonlinux:2023              : Ok   gcc (GCC) 11.4.1 20230605 (Red Hat 11.4.1-2) , clang version 15.0.7 (Amazon Linux 15.0.7-3.amzn2023.0.1) flex 2.6.4
  11    89.72 amazonlinux:devel             : Ok   gcc (GCC) 11.3.1 20221121 (Red Hat 11.3.1-4) , clang version 15.0.6 (Amazon Linux 15.0.6-3.amzn2023.0.2) flex 2.6.4
  12   115.65 archlinux:base                : Ok   gcc (GCC) 13.2.1 20230801 , clang version 17.0.6 flex 2.6.4
  13    93.87 centos:stream                 : Ok   gcc (GCC) 8.5.0 20210514 (Red Hat 8.5.0-21) , clang version 17.0.6 (Red Hat 17.0.6-1.module_el8+767+9fa966b8) flex 2.6.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
