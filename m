Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD0BAC6FA8F
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 23:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4+ZgV/WQEr007UYB9/OT58BHrZGbQ12Dlxe+GyipVaQ=; b=UoUvDxsRaV3t+v
	N3+p1RMR4k/2ahnSZ43M65zF4uMbbm1i6YvolBxzi7YWEuQDQq2LNvsRKs6qMl2rPmSru3sFn3uWq
	XVy8Hi/34HYkbF/d2ddwrcBne3G/ShGpTWkCO/9m+W1zrIsQe3/G7pAParQHf9QNMILdg0XwWDrLg
	dpDw/QetKwZtnl89jgz4xPqXQpsAw08FTd96IanxJMs4+oiKl2L8iPP30okuYLmISTx6VhSTafBvS
	MDie9EHM8PvznYWwMTSKYfNLAUtp8/F32b2nFiz39g/Z6gDSy3FIvfldFfqn8y8j6akKg9O7YyjOy
	aJUFrxAsl8+ixyaDillA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbUra-00ELrY-0A;
	Wed, 30 Aug 2023 23:44:42 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbUrW-00ELrA-20
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 23:44:40 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-68a440a8a20so169800b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 30 Aug 2023 16:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693439076; x=1694043876; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Iloc+1foZTd3D7il1KXtcra5Lia6qDKnkjAXReM/7hY=;
        b=a14hUxAYoPcNA36c++P5bo9yoEjOGrkCE/wO+nsxlb8N5L/A5q1uN2VwEbMDHTROlJ
         Cw7YURijhopMLMcR5VyagH24NgvT17t+Y2aZFuH15T9PCdle9WhG19E/qPQNAU2gL7+i
         LA9YyHQEc8tQd3bFfLVZaev5X7goeFXyasLdc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693439076; x=1694043876;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iloc+1foZTd3D7il1KXtcra5Lia6qDKnkjAXReM/7hY=;
        b=imIbslP8AUxUcyh2T1aY+rgUfXvCQnxnCpRQqNH3fVZzJroGnrt6HT3QPit2GHhbq3
         3ikuVTcndA2Ol0uq3fXqw7fgxji60ANNYbCRHKfsxLCjNVDBFNqZrIrvYKjG/wmNFdoO
         ObMIxKIlpi8+jnGfuJAuJAEcTZS13klw/Radg6+WnYN46XclVCPOa8na5+Xa3Fd+vE6Q
         ASY7P5DWCOzfDbLOjTlaKkPS1Uj0QDEd8Py5FrPUeqloKlHLLHCbsJASPcjMIq50h2qe
         MCKa3FgTZffYFPDyWfHMbzis38LKqL/SvvwvsNcyDsXZonsLvPoFSjSdOTlwWiVY3nwl
         cyCQ==
X-Gm-Message-State: AOJu0Yz/NsNnzIf49voiCdquVFyvrLwab+icBore1+aefRY6zIjVUvGo
	bqkabQEuBe6j9VMFWserykrFTA==
X-Google-Smtp-Source: AGHT+IHYyQVG26HerVdU+4vxHN6Ebsm8IcJMnKrdHcXsURJ/juD8+fBTCoS9l7E6Cm3dE+6RAuDQ6g==
X-Received: by 2002:a05:6a21:66cb:b0:138:2fb8:6b42 with SMTP id ze11-20020a056a2166cb00b001382fb86b42mr3570828pzb.14.1693439076090;
        Wed, 30 Aug 2023 16:44:36 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id x26-20020aa784da000000b0064d57ecaa1dsm125836pfn.28.2023.08.30.16.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 16:44:35 -0700 (PDT)
Date: Wed, 30 Aug 2023 16:44:35 -0700
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, akpm@linux-foundation.org,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	Conor Dooley <conor@kernel.org>, ndesaulniers@google.com,
	trix@redhat.com, linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev, patches@lists.linux.dev, lkp@intel.com
Subject: Re: [PATCH] lib/Kconfig.debug: Restrict DEBUG_INFO_SPLIT for RISC-V
Message-ID: <202308301644.AABBE6694@keescook>
References: <20230816-riscv-debug_info_split-v1-1-d1019d6ccc11@kernel.org>
 <mhng-747958b0-514c-4fc8-ac37-0769562ba385@palmer-ri-x1c9>
 <20230830153646.GA954264@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230830153646.GA954264@dev-arch.thelio-3990X>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_164438_664050_55266D02 
X-CRM114-Status: GOOD (  30.40  )
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

On Wed, Aug 30, 2023 at 08:36:46AM -0700, Nathan Chancellor wrote:
> On Wed, Aug 30, 2023 at 06:22:45AM -0700, Palmer Dabbelt wrote:
> > On Wed, 16 Aug 2023 10:35:43 PDT (-0700), nathan@kernel.org wrote:
> > > When building for ARCH=riscv using LLVM < 14, there is an error with
> > > CONFIG_DEBUG_INFO_SPLIT=y:
> > > 
> > >   error: A dwo section may not contain relocations
> > > 
> > > This was worked around in LLVM 15 by disallowing '-gsplit-dwarf' with
> > > '-mrelax' (the default), so CONFIG_DEBUG_INFO_SPLIT is not selectable
> > > with newer versions of LLVM:
> > > 
> > >   $ clang --target=riscv64-linux-gnu -gsplit-dwarf -c -o /dev/null -x c /dev/null
> > >   clang: error: -gsplit-dwarf is unsupported with RISC-V linker relaxation (-mrelax)
> > > 
> > > GCC silently had a similar issue that was resolved with GCC 12.x.
> > > Restrict CONFIG_DEBUG_INFO_SPLIT for RISC-V when using LLVM or GCC <
> > > 12.x to avoid these known issues.
> > > 
> > > Link: https://github.com/ClangBuiltLinux/linux/issues/1914
> > > Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99090
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes: https://lore.kernel.org/all/202308090204.9yZffBWo-lkp@intel.com/
> > > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > > ---
> > > Since this only impacts RISC-V, it seems reasonable that this would go
> > > in via their tree but I have added Andrew in case he wants to take it.
> > > ---
> > >  lib/Kconfig.debug | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> > > index d6798513a8c2..bd51274f4771 100644
> > > --- a/lib/Kconfig.debug
> > > +++ b/lib/Kconfig.debug
> > > @@ -355,6 +355,11 @@ endchoice # "Compressed Debug information"
> > >  config DEBUG_INFO_SPLIT
> > >  	bool "Produce split debuginfo in .dwo files"
> > >  	depends on $(cc-option,-gsplit-dwarf)
> > > +	# RISC-V linker relaxation + -gsplit-dwarf has issues with LLVM and GCC
> > > +	# prior to 12.x:
> > > +	# https://github.com/llvm/llvm-project/issues/56642
> > > +	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99090
> > > +	depends on !RISCV || GCC_VERSION >= 120000
> > >  	help
> > >  	  Generate debug info into separate .dwo files. This significantly
> > >  	  reduces the build directory size for builds with DEBUG_INFO,
> > 
> > Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> > Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> > 
> > Not sure who's taking stuff for lib/Kconfig.debug, I can take it via the
> > RISC-V tree if folks are OK with it.  Kees and Andrew were the last to touch
> > it.
> 
> I don't think lib/Kconfig.debug has a formal maintainer. Given that and
> the fact that this change only affects RISC-V, I think it is entirely
> reasonable for you to take it.

Agreed -- got for it. :)

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
