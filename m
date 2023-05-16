Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F1CC77B75
	for <linux-riscv@archiver.kernel.org>; Tue, 16 May 2023 12:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+m104PjmZkCGc+l4q+tZwYJLoIs2kuirEpbhh0Z86Rg=; b=AUsq6EHDIppOc8
	4fZerpYObyo5NkGjbseaIEf9iCm3UdaTRGuxWU5VfpKLTG1udB0QuNueJFejiSxDkJYq0iZz6l2yv
	77RstXRffBi6hHaz0R/OBDyQJU7N/nzbi+qMnFE32q45qKkBE2FxocORXUdzChifOpbZxh7KGomjt
	iGrbSCt8vcjhqcNRjyc1y4ipKfNoQY0dPV3mJBCmSRbOE0RGWJN8IBEr7NKn6g5bKeC59B2ZYsWro
	lcKvDvlUIEakhqgx914Yw+U4pQzfqCkhspwVeiWnjgbK9JL8QJku+cTQnXUsOISg9aghE1T9fRPJg
	zopZsSHnWi0c0j17G8UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pytS3-005gLz-1t;
	Tue, 16 May 2023 12:06:47 +0000
Received: from forward502a.mail.yandex.net ([178.154.239.82])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pytS0-005gKd-2n
	for linux-riscv@lists.infradead.org;
	Tue, 16 May 2023 12:06:46 +0000
Received: from mail-nwsmtp-smtp-production-main-31.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-31.vla.yp-c.yandex.net [IPv6:2a02:6b8:c18:58f:0:640:3768:0])
	by forward502a.mail.yandex.net (Yandex) with ESMTP id 226C25EB96;
	Tue, 16 May 2023 15:06:40 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-31.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id b6aGXvFDdKo0-Qd5YAZVi;
	Tue, 16 May 2023 15:06:39 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1684238799;
	bh=/a6pvyDAWlMZ0z7v7y2vBNHYN4rbuFjpKaEnziP4leI=;
	h=References:Date:In-Reply-To:Cc:To:From:Subject:Message-ID;
	b=g5DXrY5seHHIRvbxU18DdWqOc5we2o1Y9nxHH41nZKWf8C5lfFVF/OERoFLIVWtp+
	 jpVrB61ha4mlM1/4aWky+QYKvwXLHSAkat5ud5IOfqTRY9JLFOgwl5a4C88fUeVvYE
	 EBB8uQsTaJoFSlSIRvq9VeLtDSGLwIDKLTzxOlEY=
Authentication-Results: mail-nwsmtp-smtp-production-main-31.vla.yp-c.yandex.net; dkim=pass header.i=@maquefel.me
Message-ID: <4950f67bf989a7f5eba462c44d6bdbffb34485d1.camel@maquefel.me>
Subject: Re: [PATCH 2/2] perf vendor events riscv: add T-HEAD C9xx JSON file
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, Adrian
 Hunter <adrian.hunter@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Nikita Shubin <n.shubin@yadro.com>,  linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org,  linux-riscv@lists.infradead.org
Date: Tue, 16 May 2023 18:06:39 +0300
In-Reply-To: <IA1PR20MB49539F3FBE068C7C811152B1BB799@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <38eaec6b495786b048f78be08470f7c770793d7b.camel@maquefel.me>
	 <IA1PR20MB49539F3FBE068C7C811152B1BB799@IA1PR20MB4953.namprd20.prod.outlook.com>
User-Agent: Evolution 3.46.3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_050645_074129_D78EC0AB 
X-CRM114-Status: GOOD (  11.75  )
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

On Tue, 2023-05-16 at 17:45 +0800, Inochi Amaoto wrote:
> > Do c906 and c910 have same HPM events ?
> > 
> > https://github.com/T-head-Semi/openc906/blob/main/C906_RTL_FACTORY/gen_rtl/pmu/rtl/aq_hpcp_top.v
> > 
> > and
> > 
> > 
> > https://github.com/T-head-Semi/openc910/blob/main/C910_RTL_FACTORY/gen_rtl/pmu/rtl/ct_hpcp_top.v
> > 
> > Look different to me - am i missing something ?
> 
> Yes, they as different, but event ids are compatible. See [1] p.99
> and [2] p.73.
> 
> It seems I forgot extra event index from C906. I will fix in the v2.
> 
> [1]
> https://github.com/T-head-Semi/openc910/blob/main/doc/%E7%8E%84%E9%93%81C910%E7%94%A8%E6%88%B7%E6%89%8B%E5%86%8C.pdf
> [2]
> https://github.com/T-head-Semi/openc906/blob/main/doc/%E7%8E%84%E9%93%81C906%E7%94%A8%E6%88%B7%E6%89%8B%E5%86%8C.pdf

They are not the same - they are different in many ways. And c906 list
seems more complete to me.

I think you should drop wildcard (it shouldn't be used anyway) then and
name it c906.

"0x5b7-0x0-0x0,v1,t-head/c906,core" would match both c906 and c910.


> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
