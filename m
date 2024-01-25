Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 165C9C47258
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 23:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ArXHLGfcO+MV+tvTSTnb+VFDzJMyRgU9WNe0+tSFLtQ=; b=vmdkZJtOhtGOQJ
	KPfhgcuebJoj2uDtf72I8q0fi66aS5KCxDJcWkBZ7GM4q8aen6TJDdVaSveKfLMz6a4RizS+pqeYp
	n6tDo+qz28h/kgEnY4rWpn+KgUU+zpHOPjptRDxfPpPzc8i7WsT2VG4VK9mD9AT6KqFAl78Oae8m5
	4vObtV+BbQz3z3XFmjfjSYwpF4altjAK6Dc+g6Z1CDWcPabLrimqBWCf4zDFmPv7mskYaPowThkOr
	npnt/OkJAeTWPgY3MbzJffZDStFMB+eg1zukCVWJ1tG3QQsiCKiGKOiZA1RBcat4BdCVlY2yK/8dY
	6M1AMicTacHn8VVDhnRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT8rf-00000002Ngc-2pV7;
	Thu, 25 Jan 2024 23:10:31 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT8rb-00000002Nde-29qT
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 23:10:29 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-5cf450eba00so121494a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 25 Jan 2024 15:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706224225; x=1706829025; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YSh2SMxpzeSY8suanJAp4xUOQNbTcnMt4h+uTiF67+U=;
        b=QOu2XwLLhr1FtU7dzoMeBEBS6GULpX698Ixg8UrOuP924Pg9H/GQVl0ryV/i9zglXV
         TZLRbofZABcGfhWKNy5hwnhysUB7WHRcSElMxmvlk7M7+CRZOQsC/dNrKJFHLySDS0Hp
         NMbIOVXAij/MV77qLMeo6lwNPqy2ZyqpS7jMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706224225; x=1706829025;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YSh2SMxpzeSY8suanJAp4xUOQNbTcnMt4h+uTiF67+U=;
        b=NHIvjWV0N7r3b3DnLqwFcCLbzN6d684KnBbPOGbXhmi/uuwfM3ziIWnc6w/0dNywrO
         kO73bq2vsurXmUSrr/2A+J/HaoEGqxOLroSJ3MzPJr93DxYIQy2QYfQnrZGQqJHkyS0s
         YHXCmqIJtp5uwVLWYMgNVRLymahaXPkM4bpLLLMumH2v5uOfcKWq+3BeWQtJMYp3CIEI
         V9GtK/YoTngkLn+S+/rDvpz+ey9TOH43Wx256CtyHRxuo0/VS2dR1BwJAvLeWnhnHHQx
         NRLIq88/xJZ6KGXODrK/gP//UR8weHjyILe1cn+2UB9c+Bz5VSqBB2sQKoY6eKEQhrDe
         +fgw==
X-Gm-Message-State: AOJu0YzGefpgbkEGBnYdy6Ja+pWbNujEvRILKgcb9akhtX3k/c3XP6Ms
	nyND2OXqmDmKYfLz90/KGVWe0luGax0RMBBN9Loe3wbVLvlOkJwx2xGgCWBRWg==
X-Google-Smtp-Source: AGHT+IH31m5NlnF2FWv8Czpe2vRmKzes75Mmfn8IuhBbVPoTR04pbzWQk7GFedHzNU9HrXMbCT/lvQ==
X-Received: by 2002:a05:6a21:338d:b0:19a:e2aa:ff23 with SMTP id yy13-20020a056a21338d00b0019ae2aaff23mr509971pzb.9.1706224225137;
        Thu, 25 Jan 2024 15:10:25 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id s22-20020a635256000000b005ca0ae17983sm33642pgl.8.2024.01.25.15.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 15:10:24 -0800 (PST)
Date: Thu, 25 Jan 2024 15:10:24 -0800
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: akpm@linux-foundation.org, masahiroy@kernel.org, nicolas@fjasle.eu,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
	patches@lists.linux.dev, linux-kernel@vger.kernel.org,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, linux@armlinux.org.uk,
	ardb@kernel.org, linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, aneesh.kumar@kernel.org,
	naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	conor@kernel.org, linux-riscv@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 00/11] Bump the minimum supported version of LLVM to
 13.0.1
Message-ID: <202401251509.17795F434@keescook>
References: <20240125-bump-min-llvm-ver-to-13-0-1-v1-0-f5ff9bda41c5@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240125-bump-min-llvm-ver-to-13-0-1-v1-0-f5ff9bda41c5@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_151027_711818_25F8076A 
X-CRM114-Status: GOOD (  31.62  )
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

On Thu, Jan 25, 2024 at 03:55:06PM -0700, Nathan Chancellor wrote:
> Hi all,
> 
> This series bumps the minimum supported version of LLVM for building the
> kernel to 13.0.1. The first patch does the bump and all subsequent
> patches clean up all the various workarounds and checks for earlier
> versions.
> 
> Quoting the first patch's commit message for those that were only on CC
> for the clean ups:
> 
>   When __builtin_mul_overflow() has arguments that differ in terms of
>   signedness and width, LLVM may generate a libcall to __muloti4 because
>   it performs the checks in terms of 65-bit multiplication. This issue
>   becomes harder to hit (but still possible) after LLVM 12.0.0, which
>   includes a special case for matching widths but different signs.
> 
>   To gain access to this special case, which the kernel can take advantage
>   of when calls to __muloti4 appear, bump the minimum supported version of
>   LLVM for building the kernel to 13.0.1. 13.0.1 was chosen because there
>   is minimal impact to distribution support while allowing a few more
>   workarounds to be dropped in the kernel source than if 12.0.0 were
>   chosen. Looking at container images of up to date distribution versions:
> 
>     archlinux:latest              clang version 16.0.6
>     debian:oldoldstable-slim      clang version 7.0.1-8+deb10u2 (tags/RELEASE_701/final)
>     debian:oldstable-slim         Debian clang version 11.0.1-2
>     debian:stable-slim            Debian clang version 14.0.6
>     debian:testing-slim           Debian clang version 16.0.6 (19)
>     debian:unstable-slim          Debian clang version 16.0.6 (19)
>     fedora:38                     clang version 16.0.6 (Fedora 16.0.6-3.fc38)
>     fedora:latest                 clang version 17.0.6 (Fedora 17.0.6-1.fc39)
>     fedora:rawhide                clang version 17.0.6 (Fedora 17.0.6-1.fc40)
>     opensuse/leap:latest          clang version 15.0.7
>     opensuse/tumbleweed:latest    clang version 17.0.6
>     ubuntu:focal                  clang version 10.0.0-4ubuntu1
>     ubuntu:latest                 Ubuntu clang version 14.0.0-1ubuntu1.1
>     ubuntu:rolling                Ubuntu clang version 16.0.6 (15)
>     ubuntu:devel                  Ubuntu clang version 17.0.6 (3)
> 
>   The only distribution that gets left behind is Debian Bullseye, as the
>   default version is 11.0.1; other distributions either have a newer
>   version than 13.0.1 or one older than the current minimum of 11.0.0.
>   Debian has easy access to more recent LLVM versions through
>   apt.llvm.org, so this is not as much of a concern. There are also the
>   kernel.org LLVM toolchains, which should work with distributions with
>   glibc 2.28 and newer.
> 
>   Another benefit of slimming up the number of supported versions of LLVM
>   for building the kernel is reducing the build capacity needed to support
>   a matrix that builds with each supported version, which allows a matrix
>   to reallocate the freed up build capacity towards something else, such
>   as more configuration combinations.
> 
> This passes my build matrix with all supported versions.
> 
> This is based on Andrew's mm-nonmm-unstable to avoid trivial conflicts
> with my series to update the LLVM links across the repository [1] but I
> can easily rebase it to linux-kbuild if Masahiro would rather these
> patches go through there (and defer the conflict resolution to the merge
> window).
> 
> [1]: https://lore.kernel.org/20240109-update-llvm-links-v1-0-eb09b59db071@kernel.org/
> 
> ---
> Nathan Chancellor (11):
>       kbuild: Raise the minimum supported version of LLVM to 13.0.1
>       Makefile: Drop warn-stack-size plugin opt
>       x86: Drop stack-alignment plugin opt
>       ARM: Remove Thumb2 __builtin_thread_pointer workaround for Clang
>       arm64: Kconfig: Clean up tautological LLVM version checks
>       powerpc: Kconfig: Remove tautology in CONFIG_COMPAT
>       riscv: Remove MCOUNT_NAME workaround
>       riscv: Kconfig: Remove version dependency from CONFIG_CLANG_SUPPORTS_DYNAMIC_FTRACE
>       fortify: Drop Clang version check for 12.0.1 or newer
>       lib/Kconfig.debug: Update Clang version check in CONFIG_KCOV
>       compiler-clang.h: Update __diag_clang() macros for minimum version bump
> 
>  Documentation/process/changes.rst |  2 +-
>  Makefile                          |  8 --------
>  arch/arm/include/asm/current.h    |  8 +-------
>  arch/arm64/Kconfig                |  5 +----
>  arch/powerpc/Kconfig              |  1 -
>  arch/riscv/Kconfig                |  2 --
>  arch/riscv/include/asm/ftrace.h   | 14 ++------------
>  arch/riscv/kernel/mcount.S        | 10 +++++-----
>  arch/x86/Makefile                 |  6 ------
>  include/linux/compiler-clang.h    |  8 ++------
>  lib/Kconfig.debug                 |  2 +-
>  scripts/min-tool-version.sh       |  2 +-
>  scripts/recordmcount.pl           |  2 +-
>  security/Kconfig                  |  2 --
>  14 files changed, 15 insertions(+), 57 deletions(-)
> ---
> base-commit: 979741ebd48f75ed6d101c7290e3325340d361ff
> change-id: 20240124-bump-min-llvm-ver-to-13-0-1-39f84dd36b19
> 
> Best regards,
> -- 
> Nathan Chancellor <nathan@kernel.org>
> 

Yes, please. :) This looks reasonable -- I appreciate the review of
default Clang versions across distros!

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
