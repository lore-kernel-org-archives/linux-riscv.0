Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58BDAC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jan 2022 07:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4sK3be7F66UPUiCQcg6oSv9FHz2Qbe0s3PrukWqvurQ=; b=1RLiOiCqFNF+eL
	JQpoqugAQpVwu4z/vDmCjlTExhGuq5rCd2cyzM0Q5OhsloKT3QtnCLsz2s9srOOZ0yfwUkUZ1z2wH
	UILuaJtMLoflPMqz5qwug+M6MnsYkdJDmIJfMY0qj1KklP1eM949UK3iuhkrJJ2x+rUUp9kbERj/1
	bZ3gTf5jWCJMmcwZ9aiSTsIwcsQsdn5SjSTOuwgnRIjfl8qxOqe2vyyYwC1er+EQKNPtepf5LR5ba
	LIKc2lTzMBl2jJoxsTBk7RNVJVMK+X+Js1TbFDMqATA99NhpLD2QSqmp+UuH5YDVAErSz5nGEDguw
	dResQ3USIp7qFhktryPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7Xh7-001MJZ-3T; Wed, 12 Jan 2022 07:05:17 +0000
Received: from forward500p.mail.yandex.net ([2a02:6b8:0:1472:2741:0:8b7:110])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1n7Xh3-001MId-Vj
 for linux-riscv@lists.infradead.org; Wed, 12 Jan 2022 07:05:16 +0000
Received: from vla1-765d064640cd.qloud-c.yandex.net
 (vla1-765d064640cd.qloud-c.yandex.net [IPv6:2a02:6b8:c0d:90b:0:640:765d:646])
 by forward500p.mail.yandex.net (Yandex) with ESMTP id 82F74F01FC4;
 Wed, 12 Jan 2022 10:05:10 +0300 (MSK)
Received: from vla5-445dc1c4c112.qloud-c.yandex.net
 (vla5-445dc1c4c112.qloud-c.yandex.net [2a02:6b8:c18:3609:0:640:445d:c1c4])
 by vla1-765d064640cd.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 w9vdM0OdSv-58fGQiIq; Wed, 12 Jan 2022 10:05:10 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
 t=1641971110; bh=kKmRzQlK4bLFeiYuB/aCX0zAC+JTU5I8gbqx8qA+gHg=;
 h=In-Reply-To:Subject:To:From:References:Date:Message-ID:Cc;
 b=Mn17IXGRLQOkkIqwJLI9ciRUPgpK5/7u/bGrGalwkviqe45uzgL68DFODGFocQu0c
 Nb84pfyTZZBOdevDAEHVFZfPtYqbmHarF9gmuKxAaq8P8B2W39FQms/V6jNtXMIk8R
 Yk4x54Nzw/uY3nw0wZ+PD3V81BDHT+nVFbcgO3Kg=
Authentication-Results: vla1-765d064640cd.qloud-c.yandex.net;
 dkim=pass header.i=@maquefel.me
Received: by vla5-445dc1c4c112.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id FiNekykY1X-57PGSYXd; Wed, 12 Jan 2022 10:05:07 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
Date: Wed, 12 Jan 2022 10:05:06 +0300
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Atish Patra <atishp@atishpatra.org>
Cc: Jessica Clarke <jrtc27@jrtc27.com>, Atish Patra <atishp@rivosinc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, linux <linux@yadro.com>,
 Nikita Shubin <n.shubin@yadro.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>,
 Namhyung Kim <namhyung@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Kajol Jain <kjain@linux.ibm.com>, Andi Kleen
 <ak@linux.intel.com>, Jin Yao <yao.jin@linux.intel.com>, Kan Liang
 <kan.liang@linux.intel.com>, Adrian Hunter <adrian.hunter@intel.com>, Ian
 Rogers <irogers@google.com>, John Garry <john.garry@huawei.com>, Riccardo
 Mancini <rickyman7@gmail.com>, Song Liu <song@kernel.org>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, linux-perf-users@vger.kernel.org,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 0/1] perf tools: Add 'm' event modifier for counting
Message-ID: <20220112100506.12bc4e89@redslave.neermore.group>
In-Reply-To: <CAOnJCUJ6JNY9eWrPhGi3XK3omDwXhM37oimsZoqxbOP_f7vUog@mail.gmail.com>
References: <20220111142054.18733-1-nikita.shubin@maquefel.me>
 <B6E7919C-9414-4CC1-BB86-7D358085CECD@jrtc27.com>
 <CAOnJCUJ6JNY9eWrPhGi3XK3omDwXhM37oimsZoqxbOP_f7vUog@mail.gmail.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_230514_425080_37152C13 
X-CRM114-Status: GOOD (  33.39  )
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

On Tue, 11 Jan 2022 10:45:56 -0800
Atish Patra <atishp@atishpatra.org> wrote:

> On Tue, Jan 11, 2022 at 6:29 AM Jessica Clarke <jrtc27@jrtc27.com>
> wrote:
> >
> > On 11 Jan 2022, at 14:20, Nikita Shubin <nikita.shubin@maquefel.me>
> > wrote:  
> > >
> > > From: Nikita Shubin <n.shubin@yadro.com>
> > >
> > > This patch is a proposal to add Machine Mode modifier that is
> > > currently available only for RISC-V for perf tool.
> > >
> > > We don't currently have a level that is lower than kernel, so i
> > > don't see we can reuse something existing for this purpose.
> > >  
> 
> Thanks for a quick turnaround with a working patch!!
> 

Nothing please - your RISC-V PMU series as well as your work on
sscofpmf extension are great, so i am glad i can help you with that.

> However, the use case can be applied to other arch as well. It would
> be good to classify this
> as excluding "firmware" events instead of machine mode which is a
> RISC-V terminology.

That's a bit confusing cause, "firmware" resides in M-Mode in RISC-V
case and it's another level of privilege, i don't think it's possible
to exclude firmware that is on the same level as kernel.

For example we have PSCI in ARM, which falls in "firmware" category, in
my option, but we can't distinguish from other stuff on same privilege
level. 

> Ofcourse, the current documentation should indicate that this option
> is only useful
> for RISC-V right now.
> 
> I would like to understand if this idea is appealing to the broader
> community.

Yes - i would like to hear if adding event modifier is a way to go or
not.

> 
> > > The exclude_machine bit seems harmless to as no one will proccess
> > > it apart of riscv.  
> >
> > Armv8 has equivalent bits in PMEVTYPER<n>_EL0 and PMCCFILTR_EL0 for
> > EL-based filtering, which includes filtering EL3.
> >
> > Jess
> >  
> > > Patch depends on Atish Patra PMU series:
> > > https://lwn.net/Articles/879905/
> > > + some modifications to pass execlude event to SBI PMU extension
> > >
> > > Tested with qemu.
> > >
> > > Nikita Shubin (1):
> > >  perf tools: Add 'm' event modifier for counting machine
> > >
> > > include/uapi/linux/perf_event.h        |  3 ++-
> > > tools/include/uapi/linux/perf_event.h  |  3 ++-
> > > tools/perf/Documentation/perf-list.txt |  1 +
> > > tools/perf/tests/parse-events.c        | 18 ++++++++++++++++++
> > > tools/perf/util/evsel.c                |  4 +++-
> > > tools/perf/util/parse-events.c         | 18 +++++++++++++-----
> > > tools/perf/util/parse-events.l         |  2 +-
> > > 7 files changed, 40 insertions(+), 9 deletions(-)
> > >
> > > --
> > > 2.31.1
> > >
> > >
> > > _______________________________________________
> > > linux-riscv mailing list
> > > linux-riscv@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-riscv  
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv  
> 
> 
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
