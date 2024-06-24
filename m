Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D98C30653
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 22:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mltU4ET0wLoC8nepHTv0LLRRmS2MObtOFb45WNTDvSQ=; b=zfs1xme/oXiEnx
	Jj8c4s4fvy+l4IaDLcZJjpXaSSPbr1UvBXItC1vKa2F570Jq9UcnQXtbvJsB2Lf79/rJExcz1kU6b
	lqyoMBs/2V6aI7K+cC2NijxHbtnrXUhmQM518hPM38R9n+yPm95GuUIebfuC0qOHKL/rJ3eziNuFg
	u+F8sozPbi4a5NjhGS80/O3S/9fdgrN2KohhEWdDaEszUEXNEtn65gCp9GLZV8Wx9Q/Ze0/T7jtoX
	YkDZ23Wo+cXmU6u62F/9idPPAomoOTLTX3W8uvgd6D+Xsfrt8PkWL19CGrvquJMtCfev0RJQriulP
	HAEJzeL0EjG5mr+d9SBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLs8s-00000000qSd-2VlK;
	Mon, 24 Jun 2024 22:26:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLs8l-00000000qRJ-1j8l;
	Mon, 24 Jun 2024 22:26:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AB44F61126;
	Mon, 24 Jun 2024 22:26:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFAECC2BBFC;
	Mon, 24 Jun 2024 22:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719267982;
	bh=A1zw7pChb50vCYHTi+cKNPAO0Oryfwi6Z4lff+lI6Js=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RmN/u75HA1sFMpeGPdJhkl4iIpVo2QC3mcj4pV3sSro9zUXSg77efg3iJbqMAgsva
	 e2eLM/YOePlu2m1GZRn17m/S1YU3iOvZAYvmUcCV8oZwNzTgE194CKbUQKvz6/2ANQ
	 F8IUUTej+bXUYcut+Ihvlv2di7ARhVVTb06R/XFMS+S+6WuKAuqmqpcBG6yeQTdIlb
	 M/rXFi6XnrPpCOabmhSZBP8sx5LHAf5mYRT9YivXxIcvXZ5Niz1JGKDmyncJerdOUk
	 G+MECTVMOxUllUNDbx260XaCoth/cIZmho3/G3JBlmxTNJ54cG+acw5a+nB/73TKk6
	 L3pS82Zv27FWQ==
Date: Mon, 24 Jun 2024 15:26:19 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@arm.com>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>, Nick Terrell <terrelln@fb.com>,
	Ravi Bangoria <ravi.bangoria@amd.com>,
	Kees Cook <keescook@chromium.org>, Andrei Vagin <avagin@google.com>,
	Athira Jajeev <atrajeev@linux.vnet.ibm.com>,
	Oliver Upton <oliver.upton@linux.dev>, Ze Gao <zegao2021@gmail.com>,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org, coresight@lists.linaro.org,
	rust-for-linux@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH v3 7/8] perf python: Switch module to linking libraries
 from building source
Message-ID: <Znnyi2IPC79jMd9y@google.com>
References: <20240613233122.3564730-1-irogers@google.com>
 <20240613233122.3564730-8-irogers@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240613233122.3564730-8-irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_152623_577325_C8D3ABC1 
X-CRM114-Status: GOOD (  16.26  )
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

On Thu, Jun 13, 2024 at 04:31:21PM -0700, Ian Rogers wrote:
> setup.py was building most perf sources causing setup.py to mimic the
> Makefile logic as well as flex/bison code to be stubbed out, due to
> complexity building. By using libraries fewer functions are stubbed
> out, the build is faster and the Makefile logic is reused which should
> simplify updating. The libraries are passed through LDFLAGS to avoid
> complexity in python.
> 
> Force the -fPIC flag for libbpf.a to ensure it is suitable for linking
> into the perf python module.
> 
> Signed-off-by: Ian Rogers <irogers@google.com>
> Reviewed-by: James Clark <james.clark@arm.com>
> ---
>  tools/perf/Makefile.config |   5 +
>  tools/perf/Makefile.perf   |   6 +-
>  tools/perf/util/python.c   | 271 ++++++++++++++-----------------------
>  tools/perf/util/setup.py   |  33 +----
>  4 files changed, 110 insertions(+), 205 deletions(-)
> 
> diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
> index 7f1e016a9253..639be696f597 100644
> --- a/tools/perf/Makefile.config
> +++ b/tools/perf/Makefile.config
> @@ -910,6 +910,11 @@ else
>           endif
>           CFLAGS += -DHAVE_LIBPYTHON_SUPPORT
>           $(call detected,CONFIG_LIBPYTHON)
> +	 ifeq ($(filter -fPIC,$(CFLAGS)),)

Nitpick: mixed TAB and SPACEs.


> +           # Building a shared library requires position independent code.
> +           CFLAGS += -fPIC
> +           CXXFLAGS += -fPIC
> +         endif


I'm curious if it's ok for static libraries too..

Thanks,
Namhyung


>        endif
>      endif
>    endif

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
