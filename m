Return-Path: <SRS0=syY9=G4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E4F1C433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Jan 2021 21:56:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA95921D94
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Jan 2021 21:56:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA95921D94
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ua5lgVf7USmAMkgrdBDLpq3lQhjoP8QQFP6LqYqWJqs=; b=m/CuZ1SoVrAqC+HNmXy/3/bKF
	zqS7M/qk3a3ihxkZIijMpD5Q7NjPf1ymHrvmcwj7/UwIS9oruBlrx+LbS5aSvtKRlInWNCBJ0w3oO
	zODUUtLMrQcWm3FitxhmVlzWNa5oAdDNKKKbV4c73fJnj7fGn/1GUFnPP9J4CpwkZF+NXThMxb3uO
	s3ah27tOy0kGQ3MgKl0aZ3CG06ApsFNRfQFXpuogrWWx8N79ILebCrcQbDddtHQXDacnB2PZ5C+na
	HV4UqoAOJMeeKVwBb8RofR38O9pyvDtjcIITNIrO2Ps2yGqCyzXdofJ4tuEQflAE/zkSptvej72aY
	1lRCPoHuA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l49qb-00063Y-Uc; Mon, 25 Jan 2021 21:56:33 +0000
Received: from conssluserg-05.nifty.com ([210.131.2.90])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l49qY-00062y-LT
 for linux-riscv@lists.infradead.org; Mon, 25 Jan 2021 21:56:31 +0000
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id 10PLu27R023859
 for <linux-riscv@lists.infradead.org>; Tue, 26 Jan 2021 06:56:02 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 10PLu27R023859
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1611611762;
 bh=k13xTgp4YHfTY2q/O6bg9I8kJdCvKuXvFQLmI3+RhI0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dK+2GFRbXjlPKnrgk8h81RgCsjUI9MVHCbCaBBuEVQjhvutSMBuEZXNBIWmWjKSdG
 XiXo/6Mv9j7AFxAcohOluO0dJ0Ed5DUu86XQeptwtct8i9alY6b+PGo9Mmh+dOKBw2
 7G1kNyOdVr+BTPCUuoinkmG23bwq5kxcqt2pK5epUH6NNIJpOIeVGQ5gtBNlEHNpPc
 K5UwWWH2oEt3t60j54TwiN5r+kJjJGdFC40Ppuv3cH+p+NNxPRKoLmb8/Yy8+HlEzR
 76zaYkHH8EZqBTfn/6Q9AnQFuMwQh7Rlr8f6CmfhJjFtkWO1cFlfijPsP3u0XGFY0B
 acRIvx6RKTqRA==
X-Nifty-SrcIP: [209.85.210.177]
Received: by mail-pf1-f177.google.com with SMTP id y205so9200750pfc.5
 for <linux-riscv@lists.infradead.org>; Mon, 25 Jan 2021 13:56:02 -0800 (PST)
X-Gm-Message-State: AOAM530gj5loIVHv+Dgm2bcMiSJcNVqumgvEtjcqitKQSsPkLrjx74UJ
 OnCz/S7iK7T62VTTM8M98DsJMNY/9PnWYNhfudA=
X-Google-Smtp-Source: ABdhPJxdcIWBPAyh3WbuAUW/EWSOSODCsrlOwl2RnFKZ8jqnC8tLenx9emKykYOcLkOUSZ1xRTq+RAj98lrdZe1Yb2M=
X-Received: by 2002:a63:1f1d:: with SMTP id f29mr2556604pgf.47.1611611761596; 
 Mon, 25 Jan 2021 13:56:01 -0800 (PST)
MIME-Version: 1.0
References: <20210123133333.736453-1-masahiroy@kernel.org>
In-Reply-To: <20210123133333.736453-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 26 Jan 2021 06:55:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNASV+JWG+1vuEqFUWUk=AW8TkwwSrEGaciOkJwQ8xU0+AQ@mail.gmail.com>
Message-ID: <CAK7LNASV+JWG+1vuEqFUWUk=AW8TkwwSrEGaciOkJwQ8xU0+AQ@mail.gmail.com>
Subject: Re: [PATCH v2] doc: gcc-plugins: drop more stale information
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_165631_031481_17CDC137 
X-CRM114-Status: GOOD (  34.51  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Michal Marek <michal.lkml@markovi.net>, Kees Cook <keescook@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-hardening@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Robert Karszniewicz <r.karszniewicz@phytec.de>,
 "open list:SIFIVE DRIVERS" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Jan 23, 2021 at 10:34 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> [1] Drop the version information
>
> The range of the supported GCC versions are always changing. The
> current minimal GCC version is 4.9, and commit 1e860048c53e
> ("gcc-plugins: simplify GCC plugin-dev capability test") removed the
> old code accordingly.
>
> We do not need to mention specific version ranges like "all gcc versions
> from 4.5 to 6.0" since we forget to update the documentation when we
> raise the minimal compiler version.
>
> [2] Drop the C compiler statements
>
> Since commit 77342a02ff6e ("gcc-plugins: drop support for GCC <= 4.7")
> the GCC plugin infrastructure only supports g++.
>
> [3] Drop supported architectures
>
> As of v5.11-rc4, the infrastructure supports more architectures;
> arm, arm64, mips, powerpc, riscv, s390, um, and x86. (just grep
> "select HAVE_GCC_PLUGINS") Again, we miss to update this document when a
> new architecture is supported. Let's just say "only some architectures".
>
> [4] Update the apt-get example
>
> We are now discussing to bump the minimal version to GCC 5. The GCC 4.9
> support will be removed sooner or later. Change the package example to
> gcc-10-plugin-dev while we are here.
>
> [5] Update the build target
>
> Since commit ce2fd53a10c7 ("kbuild: descend into scripts/gcc-plugins/
> via scripts/Makefile"), "make gcc-plugins" is not supported.
> "make scripts" builds all the enabled plugins, including some other
> tools.
>
> [6] Update the steps for adding a new plugin
>
> At first, all CONFIG options for GCC plugins were located in arch/Kconfig.
> After commit 45332b1bdfdc ("gcc-plugins: split out Kconfig entries to
> scripts/gcc-plugins/Kconfig"), scripts/gcc-plugins/Kconfig became the
> central place to collect plugin CONFIG options. In my understanding,
> this requirement no longer exists because commit 9f671e58159a ("security:
> Create "kernel hardening" config area") moved some of plugin CONFIG
> options to another file. Find an appropriate place to add the new CONFIG.
>
> The sub-directory support was never used by anyone, and removed by
> commit c17d6179ad5a ("gcc-plugins: remove unused GCC_PLUGIN_SUBDIR").
>
> Remove the useless $(src)/ prefix.


Applied to linux-kbuild.




> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
> Changes in v2:
>   - Remove the info about sub-directory support
>
>  Documentation/kbuild/gcc-plugins.rst | 31 +++++++++++++---------------
>  1 file changed, 14 insertions(+), 17 deletions(-)
>
> diff --git a/Documentation/kbuild/gcc-plugins.rst b/Documentation/kbuild/gcc-plugins.rst
> index 63379d0150e3..979887558e72 100644
> --- a/Documentation/kbuild/gcc-plugins.rst
> +++ b/Documentation/kbuild/gcc-plugins.rst
> @@ -11,16 +11,13 @@ compiler [1]_. They are useful for runtime instrumentation and static analysis.
>  We can analyse, change and add further code during compilation via
>  callbacks [2]_, GIMPLE [3]_, IPA [4]_ and RTL passes [5]_.
>
> -The GCC plugin infrastructure of the kernel supports all gcc versions from
> -4.5 to 6.0, building out-of-tree modules, cross-compilation and building in a
> -separate directory.
> -Plugin source files have to be compilable by both a C and a C++ compiler as well
> -because gcc versions 4.5 and 4.6 are compiled by a C compiler,
> -gcc-4.7 can be compiled by a C or a C++ compiler,
> -and versions 4.8+ can only be compiled by a C++ compiler.
> +The GCC plugin infrastructure of the kernel supports building out-of-tree
> +modules, cross-compilation and building in a separate directory.
> +Plugin source files have to be compilable by a C++ compiler.
>
> -Currently the GCC plugin infrastructure supports only the x86, arm, arm64 and
> -powerpc architectures.
> +Currently the GCC plugin infrastructure supports only some architectures.
> +Grep "select HAVE_GCC_PLUGINS" to find out which architectures support
> +GCC plugins.
>
>  This infrastructure was ported from grsecurity [6]_ and PaX [7]_.
>
> @@ -53,8 +50,7 @@ $(src)/scripts/gcc-plugins/gcc-generate-simple_ipa-pass.h,
>  $(src)/scripts/gcc-plugins/gcc-generate-rtl-pass.h**
>
>         These headers automatically generate the registration structures for
> -       GIMPLE, SIMPLE_IPA, IPA and RTL passes. They support all gcc versions
> -       from 4.5 to 6.0.
> +       GIMPLE, SIMPLE_IPA, IPA and RTL passes.
>         They should be preferred to creating the structures by hand.
>
>
> @@ -62,9 +58,9 @@ Usage
>  =====
>
>  You must install the gcc plugin headers for your gcc version,
> -e.g., on Ubuntu for gcc-4.9::
> +e.g., on Ubuntu for gcc-10::
>
> -       apt-get install gcc-4.9-plugin-dev
> +       apt-get install gcc-10-plugin-dev
>
>  Or on Fedora::
>
> @@ -76,7 +72,7 @@ Enable a GCC plugin based feature in the kernel config::
>
>  To compile only the plugin(s)::
>
> -       make gcc-plugins
> +       make scripts
>
>  or just run the kernel make and compile the whole kernel with
>  the cyclomatic complexity GCC plugin.
> @@ -85,7 +81,8 @@ the cyclomatic complexity GCC plugin.
>  4. How to add a new GCC plugin
>  ==============================
>
> -The GCC plugins are in $(src)/scripts/gcc-plugins/. You can use a file or a directory
> -here. It must be added to $(src)/scripts/gcc-plugins/Makefile,
> -$(src)/scripts/Makefile.gcc-plugins and $(src)/arch/Kconfig.
> +The GCC plugins are in scripts/gcc-plugins/. You need to put plugin source files
> +right under scripts/gcc-plugins/. Creating subdirectories is not supported.
> +It must be added to scripts/gcc-plugins/Makefile, scripts/Makefile.gcc-plugins
> +and a relevant Kconfig file.
>  See the cyc_complexity_plugin.c (CONFIG_GCC_PLUGIN_CYC_COMPLEXITY) GCC plugin.
> --
> 2.27.0
>


-- 
Best Regards
Masahiro Yamada

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
