Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F156C46467
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 13:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yFQIUCHUb2KNZOfarnNhSWTzUiK/S3K97SoogT757Sw=; b=3X1nAVuJQGKLOx
	bcn3Wk3GtLaii3VlZPtwT0Shh+Y2Dkhd1bVuOt+TKQiMV8xeuGOx+vbNK9c2md7mUYZNZyIxdHn+O
	4Uv/2389SVbcFZ46fhGpRkOh2EpfppTpA8E75re86A6+xVNSYtk+mFIYukDTn65qe6hk8WtMBZK+k
	0iLpMYNvbzFQLSCpW/Hzs3IISBQYIRyAhFzT/bwf+CdfbuqXeGAGymEGysoBGiB2pS6+8gJBa9t/c
	ZviOOwMJ94EkSg81QKAgCzcrtXXCrzUysIz/8R+pxQcWyzlY1IkGUENtOjbB/eakgFjgnjP0vRa5G
	gNyJoT6QEs5hvwdUjjMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFbFj-00BcVX-KQ; Wed, 11 Jan 2023 13:34:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFbFd-00BcRA-3k
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 13:34:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9B9E061AFE;
	Wed, 11 Jan 2023 13:34:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC591C433D2;
	Wed, 11 Jan 2023 13:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673444084;
	bh=EGuRXDO+fCbrjw3cAZLJ3muiEvCov2SdysxKRtQuIkk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iuKKS02FI4WSP8yBFqGNUBFmMtac+8Y84W3XsNGtmFDzn/pFdhwOBNk/u6vmCEjmz
	 8m0sQcHpLRkamuydlr1THzZOSyu5KpmM0svTJQfpJ0fgca82BRePdTK3msQGn94EAb
	 6JtqFgN+Biaf32FGwblnlj7xSCnfamofjMZAQRYEyqIEoqaY92HPnAtiywqgp1zzGO
	 7k7bzunN93YpXV+yv1IJDKQZSjoREBIst+Bd8CLc/A/d4iiUFBi+zXiBU/1buCM/ol
	 OZGHGBzWWOArBJLOXkSTJqM94OXyAKf8BDzFTxxL2gGkcbA8EmB/MQEKTo23ohVeFV
	 iU1h07453J6Kg==
Date: Wed, 11 Jan 2023 21:24:26 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, conor@kernel.org,
	philipp.tomsich@vrull.eu, ajones@ventanamicro.com,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v4 0/5] Zbb string optimizations and call support in
 alternatives
Message-ID: <Y764isfC6LsSpWus@xhacker>
References: <20230109181755.2383085-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230109181755.2383085-1-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_053445_273265_2420BB5C 
X-CRM114-Status: GOOD (  28.09  )
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

On Mon, Jan 09, 2023 at 07:17:50PM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> This series still tries to allow optimized string functions for specific
> extensions. The last approach of using an inline base function to hold
> the alternative calls did cause some issues in a number of places
> 
> So instead of that we're now just using an alternative j at the beginning
> of the generic function to jump to a separate place inside the function
> itself.
> 
> This of course needs a fixup for "j" instructions in alternative blocks,
> so that is provided here as well.
> 
> Technically patch4 got a review from Andrew, but that was still with
> the inline approach, so I didn't bring it over to v4.
> 
> 
> changes since v3:
> - rebase on top of 6.2-rc1 + the applied alternative-call series
> - add alternative fixup for jal instructions
> - drop the inline functions and instead just jump

Hi Heiko,

I think I have sent out the jal fixup a month ago. And similar as V3, Zbb
series need to be split from the general alternative improvement.

Thanks

> 
> changes since v2:
> - add patch fixing the c.jalr funct4 value
> - reword some commit messages
> - fix position of auipc addition patch (earlier)
> - fix compile errors from patch-reordering gone wrong
>   (worked at the end of v2, but compiling individual patches
>    caused issues) - patches are now tested individually
> - limit Zbb variants for GNU as for now
>   (LLVM support for .option arch is still under review)
> - prevent str-functions from getting optimized to builtin-variants
> 
> changes since v1:
> - a number of generalizations/cleanups for instruction parsing
> - use accessor function to access instructions (Emil)
> - actually patch the correct location when having more than one
>   instruction in an alternative block
> - string function cleanups (comments etc) (Conor)
> - move zbb extension above s* extensions in cpu.c lists
> 
> changes since rfc:
> - make Zbb code actually work
> - drop some unneeded patches
> - a lot of cleanups
> 
> Heiko Stuebner (5):
>   RISC-V: move some stray __RISCV_INSN_FUNCS definitions from kprobes
>   RISC-V: add helpers for J-type immediate handling
>   RISC-V: fix jal addresses in patched alternatives
>   RISC-V: add infrastructure to allow different str* implementations
>   RISC-V: add zbb support to string functions
> 
>  arch/riscv/Kconfig                       |  24 ++++
>  arch/riscv/include/asm/errata_list.h     |   3 +-
>  arch/riscv/include/asm/hwcap.h           |   1 +
>  arch/riscv/include/asm/insn.h            |  36 ++++++
>  arch/riscv/include/asm/string.h          |  12 ++
>  arch/riscv/kernel/alternative.c          |  27 ++++
>  arch/riscv/kernel/cpu.c                  |   1 +
>  arch/riscv/kernel/cpufeature.c           |  18 +++
>  arch/riscv/kernel/probes/simulate-insn.h |   3 -
>  arch/riscv/kernel/riscv_ksyms.c          |   3 +
>  arch/riscv/lib/Makefile                  |   3 +
>  arch/riscv/lib/strcmp.S                  | 131 ++++++++++++++++++++
>  arch/riscv/lib/strlen.S                  | 142 +++++++++++++++++++++
>  arch/riscv/lib/strncmp.S                 | 151 +++++++++++++++++++++++
>  arch/riscv/purgatory/Makefile            |  13 ++
>  15 files changed, 564 insertions(+), 4 deletions(-)
>  create mode 100644 arch/riscv/lib/strcmp.S
>  create mode 100644 arch/riscv/lib/strlen.S
>  create mode 100644 arch/riscv/lib/strncmp.S
> 
> -- 
> 2.35.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
