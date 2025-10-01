Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 921FBCAC5BB
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Oct 2025 18:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9hI6V44mc9X7eRkkTmbVEvUa5BbPDS4Vn8ujGK4i1jA=; b=0NfL19MTb7Zr9Y
	V5swA4+RJItwJyyoOimIEi+9BHeFSnZ3KVWQJu+7pBCEEwiPArXSs3tpor/AULpKJZUYeb/CWkuLt
	WtiuhP/n6VYUBx2FkYSa/M8PSwszOr3Sse13/9mHdtDtRTcm27wTK369/meX+mzWx8KriYXOhJtXA
	x/9DAp8SUOaPTQBryWhDY+8sc3ue36SVVMv+I9+wIrojA9/lCqeH0qU9W4b0vKq8PZlK01XyEdmuw
	5RCIwgITOlPyf6yP4w9CCB7k+G6gJbl5LR2Z4bbcAq28s1BoAW+0fwby/RvBMC6RRpkPNjkIW44uq
	FWNEeJUepwS6P9AFmisg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v41dQ-00000008l9z-1lQX;
	Wed, 01 Oct 2025 18:33:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v41dN-00000008l9Z-46Mv
	for linux-riscv@lists.infradead.org;
	Wed, 01 Oct 2025 18:33:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7DD4B16F8;
	Wed,  1 Oct 2025 11:32:50 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23ADB3F66E;
	Wed,  1 Oct 2025 11:32:58 -0700 (PDT)
Date: Wed, 1 Oct 2025 19:32:56 +0100
From: Leo Yan <leo.yan@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
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
Message-ID: <20251001183256.GS7985@e132581.arm.com>
References: <20250930-perf_build_android_ndk-v2-0-2ea440b7ef01@arm.com>
 <aN044EY-Ds9-E6iz@x1>
 <20251001152217.GQ7985@e132581.arm.com>
 <aN1yNKxXLnMtQczW@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aN1yNKxXLnMtQczW@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_113302_073855_32951AE8 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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

On Wed, Oct 01, 2025 at 03:25:56PM -0300, Arnaldo Carvalho de Melo wrote:

[...]

> It was in all alpine versions I have containers to test on:
> 
> toolsbuilder@five:~$ grep FAIL dm.log.old/summary 
>    3    71.85 almalinux:9-i386              : FAIL clang version 17.0.6 (AlmaLinux OS Foundation 17.0.6-5.el9)
>    5    78.60 alpine:3.16                   : FAIL gcc version 11.2.1 20220219 (Alpine 11.2.1_git20220219) 
>    6    59.77 alpine:3.17                   : FAIL gcc version 12.2.1 20220924 (Alpine 12.2.1_git20220924-r4) 
>    7    56.89 alpine:3.18                   : FAIL gcc version 12.2.1 20220924 (Alpine 12.2.1_git20220924-r10) 
>    8    60.86 alpine:3.19                   : FAIL gcc version 13.2.1 20231014 (Alpine 13.2.1_git20231014) 
>    9    60.18 alpine:3.20                   : FAIL gcc version 13.2.1 20240309 (Alpine 13.2.1_git20240309) 
>   10    64.58 alpine:3.22                   : FAIL gcc version 14.2.0 (Alpine 14.2.0) 
>   11    63.36 alpine:edge                   : FAIL gcc version 14.2.0 (Alpine 14.2.0) 
> toolsbuilder@five:~$
> 
>   GEN     /tmp/build/perf/python/perf.cpython-312-x86_64-linux-musl.so
> make: Leaving directory '/git/perf-6.17.0-rc6/tools/perf'
> + rm -rf /tmp/build/perf
> + mkdir /tmp/build/perf
> + make 'ARCH=' 'CROSS_COMPILE=' 'EXTRA_CFLAGS=' -C tools/perf 'O=/tmp/build/perf' 'CC=clang'
> make: Entering directory '/git/perf-6.17.0-rc6/tools/perf'
>   BUILD:   Doing 'make -j28' parallel build
> Makefile.config:494: *** No gnu/libc-version.h found, please install glibc-dev[el].  Stop.
> make[1]: *** [Makefile.perf:289: sub-make] Error 2
> make: *** [Makefile:76: all] Error 2
> make: Leaving directory '/git/perf-6.17.0-rc6/tools/perf'
> + exit 1
> toolsbuilder@five:~
> $
> 
> lemme try to reapply those patches and get the
> tools/perf/feature/test-libelf.make.output and
> tools/perf/feature/test-glibc.make.output files.

That is fine.  I have reproduced at my side, will look into.

Thanks,
Leo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
