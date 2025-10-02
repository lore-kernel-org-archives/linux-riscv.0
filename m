Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF63CCD184
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Oct 2025 17:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cQCbXuwWX2TlxrTCNBUiR7090bR+B0kEEkmI0C0nz94=; b=4In+LjEC1z2w+a
	xxDk1Z/T+8GWfgq/gohwtPRCgiLxuXIouK0/5L5Rd/s2Jh59Vd+ZGhmxzR47rsVoKXTpKVxvSKrRH
	OKzDLpC7l1ftfarI7XvTIUsfDKcItElbqAhJMOSgHPMiLp0+v4KjBhnrMO/WUW0HGBgLIvKx5/dpl
	mgydGBRw17NE/LPqdK0Syuom2JEzsDpLC1qVRmyPNGhHZqj3SLKfIHMU+TF3koCdFRRVrzKLPmePb
	7i4Vjx40cdBNrYPh3i5CJzR6GIP0Nm6bDRl7PYzfBhN6cWef8KgD/xcv+0BgNVZ9BD9TYgBUDdRVj
	8a6WXqnqrEwnHsUBxVhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4NL9-0000000AwCL-30Tn;
	Thu, 02 Oct 2025 17:43:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4NL8-0000000AwBb-37Ny
	for linux-riscv@lists.infradead.org;
	Thu, 02 Oct 2025 17:43:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EE1C8601FD;
	Thu,  2 Oct 2025 17:43:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2DBDC4CEF4;
	Thu,  2 Oct 2025 17:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759427017;
	bh=Xqz5o+ZdJCPEwJsSHbsVWkehdw3RptKsEo6BDFHxa9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o7X/wTr3NYgfOivRzqINdn9eHbE+mYwqJontKFsokLincUPL0yhN32HWvivnLf69a
	 Qct+ql80DOtSXdLhH3IjgXJvbIErrsUiNvsobaacXze4smzyn/fArVuh102PL2iCwB
	 hb4NBzlmnn67H8gFSFbMq0YgVrzA44LwIX/Kbs2GrG23CE8ayfg33SNCYBE4UHCmDr
	 Y4rbFost6z3pLR7qngNPD1DBt82H4mEt2b+6jc5taiAF/XeiMYZnWN6vUK0q5jRlNy
	 g/bXLGjLJI67SsP+0LapA//jcImbcqzPgzBGiRjxeY3/5g/GNgrPGbyxVHRaq1CWMy
	 t9ubP3mp4DwYw==
Date: Thu, 2 Oct 2025 14:43:34 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	James Clark <james.clark@linaro.org>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/8] perf build: Support building with Clang
Message-ID: <aN65xrFGqwue6jCx@x1>
References: <20250930-perf_build_android_ndk-v2-0-2ea440b7ef01@arm.com>
 <aN044EY-Ds9-E6iz@x1>
 <20251001152217.GQ7985@e132581.arm.com>
 <aN1yNKxXLnMtQczW@x1>
 <20251001183256.GS7985@e132581.arm.com>
 <20251001202050.GT7985@e132581.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251001202050.GT7985@e132581.arm.com>
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

On Wed, Oct 01, 2025 at 09:20:50PM +0100, Leo Yan wrote:
> On Wed, Oct 01, 2025 at 07:32:56PM +0100, Leo Yan wrote:
> 
> [...]
> 
> > > + make 'ARCH=' 'CROSS_COMPILE=' 'EXTRA_CFLAGS=' -C tools/perf 'O=/tmp/build/perf' 'CC=clang'
> > > make: Entering directory '/git/perf-6.17.0-rc6/tools/perf'
> > >   BUILD:   Doing 'make -j28' parallel build
> > > Makefile.config:494: *** No gnu/libc-version.h found, please install glibc-dev[el].  Stop.
> 
> It does not set correctly --target as x86_64-alpine-linux-musl if
> distros are using musl libc.
> 
> Now running the container build for updated code.  Once pass test,
> I will send new series.

Thanks for spotting the problem after taking the trouble of starting a
container! Hopefully that will save time for other people trying to
cross-build perf.

Cheers,

- Arnaldo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
