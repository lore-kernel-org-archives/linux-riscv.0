Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F957E77187
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 21:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d9PPGPDAFNS3y2o6nEetOdYEKM8RryoMaGiz+5qQu3Y=; b=VpY7UrmpENL0wH
	FRqFdgJvcYqM2vlBc9fTfu0ZP60p09lomIRGlvC6zsujEpQrnr40YNUh8rKMksrd10XNIRtjZodGw
	nH/JRKraXlsTTyFFw/r8I4N/OaqeA+0ksX4aO6GmrPwPmwUbggrKL969F0yARvet3K0bj13ccExTn
	hFoBv8iAcej8zcxv0SiKIRlbiyEmqY2Uxd0ytJ3K3EpVbQH9CWrzy35UZ4T7x7LMG42CNypI2CEQO
	4UvhawQ+jfjIVI5X2Is4ouq43GoadcnnBGuQVcUi9lcQ+lqyhE9ht9hg/rHB4VLfNbkWy9eEjO6jh
	Wx2DIThpgVqhEz7oaXzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO20f-00000000BM8-0xR2;
	Wed, 18 Dec 2024 21:55:13 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO20b-00000000BLH-2Utz
	for linux-riscv@lists.infradead.org;
	Wed, 18 Dec 2024 21:55:11 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-825c6570a80so21854a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 18 Dec 2024 13:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734558908; x=1735163708; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qQSiK4s4Uqm4QJokNKH0Tf7jwBuMNzU4RqKyMwdUVzU=;
        b=yRETgIGHOROMZPHR0Bb4Dt0wEKKuNOYD0zJ4SRV0woMhUw0xLfnTxIqkVlkViNmen3
         K5asRCQHooqUsNXDs+0lqOyvKKZbUeQ5R2ENNBw6FFkxrdvmU4cFu7fq3aTfxWpujDFY
         ZKcg7/hvHDj/6xhY+zAU1tJly6B6ddYeBmPQhNkv11U3kPgd0SlQbx3G15bpRNF1KH2t
         xvEnS2EDHMwxIgzcTT6ym3YOdUaLttKFHEy9+QFvvgWnXCcqiP1GISVqEXrWy6aj9dZV
         bWp3eDbI8qLCVwad0ltn7m5SypAkuEWiX3koIgVybuHKe/91/SWsjz/uB2vzwzrPR6ip
         AXJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734558908; x=1735163708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQSiK4s4Uqm4QJokNKH0Tf7jwBuMNzU4RqKyMwdUVzU=;
        b=YjvPEmfgsbwuJXamF5TRhJkuFEazfVI6Xx9nd/fUikPU0dMizAb137f4X2WsuLmZ9m
         8XLA5z8FGUdQLLqstGsKBjNQSZO4BDFx+/ZrlaIk5wMUV6+GDnB+TRM8f+Zm2RWpoHw8
         7CZC4tPUnc+MyGE2fDp+8l8hcAi7rA18UpaFWbAKbePz/AWdZuq8F5tmsvJ2+phrTkNg
         1qVEpeC1LQGrwmuvEMYfH7qsrfwTBBeCPlgTs85VrG4fDqpjv4voJHVGK+qn/KYQ49ED
         nL/dlcu1YU3Vd8eJedlm3M/S/OhtjIDnbaMooiZBZaaR5qyMYbArHIy7e2/E1Wbo+3AP
         0zyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqi7KOfFVJ9Q1uAmqIp2To9GxvUHojXNFhhp1kKWp2k95hEY9IToazSCVMAq7q+TL9AnLah/xuZSJd1A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxR+EQ0mVPMUZNnHTgzymPxeBv34pekIIEs3lTGl/+9ZF+T84yL
	eV3jfvBQgdqeEqZieVVDllW1+5EW10mpamCx64TYVcum7tNSiXkquoRl7HPYMEM=
X-Gm-Gg: ASbGnctHu3UgT0JwCME/oy+NTIn3PanDfiiMW7RKpqKHZ5yGZ53AXIQNC7S+tQtnpSS
	+NsELYbporyB7tvdEE0aGehQv4bhmEAp5GeVfqDdQY/9GnJ9XG+qCwfL92ncpKx8IWtvNnKUIOP
	J5967DqdGCWoW4hCXJCNWrmhfPj+RjH25emwu6FyAeIU1c3CSwjTyL9brQ8LGLHWrRJnWlm1yxD
	ZiaKuPX1k7wTeNmjmYt7mZfpwdxSgs1bVRGlTSB0YRQY0Q=
X-Google-Smtp-Source: AGHT+IED7YCeQuGuUtpDThJELTrJknNCN7ilLzn7fIFW/Z/Wgd/+nA9XgNr9h0l1o/RBE85pV6GJMQ==
X-Received: by 2002:a17:90b:2d0e:b0:2ee:dcf6:1c77 with SMTP id 98e67ed59e1d1-2f2e91f0dbemr7484871a91.16.1734558908287;
        Wed, 18 Dec 2024 13:55:08 -0800 (PST)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2d9dc7342sm1451271a91.0.2024.12.18.13.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 13:55:07 -0800 (PST)
Date: Wed, 18 Dec 2024 13:55:05 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	=?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>,
	Nelson Chu <nelson@rivosinc.com>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev, linux-perf-users@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: Re: [PATCH 1/2] kbuild: Check version of objdump
Message-ID: <Z2NEuXMiP7QKhQnW@ghost>
References: <20241216-perf_fix_riscv_obj_reading-v1-0-b75962660a9b@rivosinc.com>
 <20241216-perf_fix_riscv_obj_reading-v1-1-b75962660a9b@rivosinc.com>
 <20241218-sandfish-hence-5fa18539f7ca@spud>
 <20241218-hypnotic-acid-630e8a8d35da@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241218-hypnotic-acid-630e8a8d35da@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_135509_945963_97E508B2 
X-CRM114-Status: GOOD (  34.66  )
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

On Wed, Dec 18, 2024 at 03:40:25PM +0000, Conor Dooley wrote:
> On Wed, Dec 18, 2024 at 03:14:46PM +0000, Conor Dooley wrote:
> > On Mon, Dec 16, 2024 at 03:12:51PM -0800, Charlie Jenkins wrote:
> > > Similar to ld-version, add a way to check the version of objdump. This
> > > should most of the time end up being the binutils version or the llvm
> > > version.
> > > 
> > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > 
> > This fails for allmodconfig and rv32_defconfig with clang. 19.1.1
> > according to Bjorn :)
> 
> Some additional info from Bjorn:
> https://paste.debian.net/1340410
> and the steps to reproduce:
> https://paste.debian.net/1340408
> 
> That should not be reporting 13.0.1, it should be 19.1.x, there's one
> included in the toolchains we use from https://mirrors.edge.kernel.org/pub/tools/llvm/
> 
> 13.0.1 looks like a host toolchain?

I ended up sending a v2 that dropped this in favor of detecting this at
runtime [1] so this is no longer needed.

- Charlie

Link:
https://lore.kernel.org/lkml/20241217-perf_fix_riscv_obj_reading-v2-1-58f81b7b4c7d@rivosinc.com/
[1]

> 
> > 
> > Cheers,
> > Conor.
> > 
> > > ---
> > >  init/Kconfig               | 10 +++++++
> > >  scripts/Kconfig.include    |  6 ++++
> > >  scripts/objdump-version.sh | 69 ++++++++++++++++++++++++++++++++++++++++++++++
> > >  3 files changed, 85 insertions(+)
> > > 
> > > diff --git a/init/Kconfig b/init/Kconfig
> > > index a20e6efd3f0fbdd7f0df2448854cc30734a0ee4f..0b5d36f939e1de89c12ebdd61e4815015314d4f1 100644
> > > --- a/init/Kconfig
> > > +++ b/init/Kconfig
> > > @@ -60,6 +60,16 @@ config LLD_VERSION
> > >  	default $(ld-version) if LD_IS_LLD
> > >  	default 0
> > >  
> > > +config OBJDUMP_IS_GNU
> > > +	def_bool $(success,test "$(objdump-name)" = objdump)
> > > +
> > > +config OBJDUMP_IS_LLVM
> > > +	def_bool $(success,test "$(objdump-name)" = llvm-objdump)
> > > +
> > > +config OBJDUMP_VERSION
> > > +	int
> > > +	default $(objdump-version)
> > > +
> > >  config RUSTC_VERSION
> > >  	int
> > >  	default $(rustc-version)
> > > diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> > > index 33193ca6e8030e659d6b321acaea1acd42c387a4..cb3e2d2564fea8cce780adb3be672c9596b7ccf2 100644
> > > --- a/scripts/Kconfig.include
> > > +++ b/scripts/Kconfig.include
> > > @@ -58,6 +58,12 @@ $(error-if,$(success,test -z "$(ld-info)"),Sorry$(comma) this linker is not supp
> > >  ld-name := $(shell,set -- $(ld-info) && echo $1)
> > >  ld-version := $(shell,set -- $(ld-info) && echo $2)
> > >  
> > > +# Get the objdump name, version, and error out if it is not supported.
> > > +objdump-info := $(shell,$(srctree)/scripts/objdump-version.sh $(OBJDUMP))
> > > +$(error-if,$(success,test -z "$(objdump-info)"),Sorry$(comma) this objdump is not supported.)
> > > +objdump-name := $(shell,set -- $(objdump-info) && echo $1)
> > > +objdump-version := $(shell,set -- $(objdump-info) && echo $2)
> > > +
> > >  # machine bit flags
> > >  #  $(m32-flag): -m32 if the compiler supports it, or an empty string otherwise.
> > >  #  $(m64-flag): -m64 if the compiler supports it, or an empty string otherwise.
> > > diff --git a/scripts/objdump-version.sh b/scripts/objdump-version.sh
> > > new file mode 100755
> > > index 0000000000000000000000000000000000000000..fa24f8dc2d3c42fd1195fceb3c96b27f7127db25
> > > --- /dev/null
> > > +++ b/scripts/objdump-version.sh
> > > @@ -0,0 +1,69 @@
> > > +#!/bin/sh
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +#
> > > +# Print the objdump name and its version in a 5 or 6-digit form.
> > > +# Also, perform the minimum version check.
> > > +
> > > +set -e
> > > +
> > > +# Convert the version string x.y.z to a canonical 5 or 6-digit form.
> > > +get_canonical_version()
> > > +{
> > > +	IFS=.
> > > +	set -- $1
> > > +
> > > +	# If the 2nd or 3rd field is missing, fill it with a zero.
> > > +	#
> > > +	# The 4th field, if present, is ignored.
> > > +	# This occurs in development snapshots as in 2.35.1.20201116
> > > +	echo $((10000 * $1 + 100 * ${2:-0} + ${3:-0}))
> > > +}
> > > +
> > > +orig_args="$@"
> > > +
> > > +# Get the first line of the --version output.
> > > +IFS='
> > > +'
> > > +set -- $(LC_ALL=C "$@" --version)
> > > +
> > > +# Split the line on spaces.
> > > +IFS=' '
> > > +set -- $1
> > > +
> > > +min_tool_version=$(dirname $0)/min-tool-version.sh
> > > +
> > > +if [ "$1" = GNU -a "$2" = objdump ]; then
> > > +	shift $(($# - 1))
> > > +	version=$1
> > > +	min_version=$($min_tool_version binutils)
> > > +	disp_name="GNU objdump"
> > > +else
> > > +	while [ $# -gt 1 -a "$1" != "LLVM" ]; do
> > > +		shift
> > > +	done
> > > +
> > > +	if [ "$1" = LLVM ]; then
> > > +		version=$3
> > > +		min_version=$($min_tool_version llvm)
> > > +		disp_name="llvm-objdump"
> > > +	else
> > > +		echo "$orig_args: unknown objdump" >&2
> > > +		exit 1
> > > +	fi
> > > +fi
> > > +
> > > +version=${version%%[!0-9.]*}
> > > +
> > > +cversion=$(get_canonical_version $version)
> > > +min_cversion=$(get_canonical_version $min_version)
> > > +
> > > +if [ "$cversion" -lt "$min_cversion" ]; then
> > > +	echo >&2 "***"
> > > +	echo >&2 "*** objdump is too old."
> > > +	echo >&2 "***   Your $disp_name version:    $version"
> > > +	echo >&2 "***   Minimum $disp_name version: $min_version"
> > > +	echo >&2 "***"
> > > +	exit 1
> > > +fi
> > > +
> > > +echo objdump $cversion
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > > 
> > > _______________________________________________
> > > linux-riscv mailing list
> > > linux-riscv@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
> 
> 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
