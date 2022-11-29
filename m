Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC9FC4321E
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 22:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BEpGYmphdH/uOh1GgX/OfOGxqG4NN1+/UtnF0k0Bg4s=; b=N3GbIDMLMv3tzc
	vM44IekhetW5D693FKvlRnTBeIqlhc8WkeBdjvSHJVQzHbLoT5+HD99ZI7b7s6cxxies82vMHaU5F
	/Zn5KoKEU/oDORyEKCg6iGy2RmND/18pGu52TIgH4hzJf1d3AUi/7VzA+AEsEp5CnC3mtiAJnxI9Q
	yvL1/X0adjpq+R5vIkzmuITcOyp9oGd38Af0fCSXWtinUR6/jc9gzHhZfWEGktFnemZ+cS+N8PE/l
	DViCYRFPAW4tr6mGDbgr3GaZ/Fh6v2DJBRtMQPO4uX00amu6t+TK1JsbYM9JJyApHRVGVGIrCqekP
	wwofR4lUQ3/mXMcI5Dgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p08h1-00BUsj-Bq; Tue, 29 Nov 2022 22:03:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p08gy-00BUrN-6F
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 22:03:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BC2B461956;
	Tue, 29 Nov 2022 22:03:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A31FC433D6;
	Tue, 29 Nov 2022 22:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669759383;
	bh=KVGfjMTAph8lVCMEB/VJa2YacWSsfVe1Z1vkIXNj9J0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fun+nWtJakaP+ej+HZ6cha8D54t8Ai65tlnzoWYagybqXAdBpWtSMRwpa5IYnNv6v
	 r9sXUlb+tQcqwUq90OEksUePpvdFP1oYqR6Kzc74KmSf1Ou7rZGl73+X4qYzZtW3Nr
	 hA6+1/bE3G4/gSDwR+8oP18Zdv5aXkqdONH8U5gXOMIpH3ijXjHkdb1612ngsixnLR
	 z95+0UyvAsyU8ZvFQsbvl5r+5vhXFg1VgDm5GzLhBdTP3d/fpywGXGTS8Kn4007d6P
	 Wsv9pN4sVcMBJfs6POx6G8eR79a/vB0m21Qyg1t040xsCXv1omri/cApH7tano0tM0
	 12T99cq4kptcw==
Date: Tue, 29 Nov 2022 22:02:58 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com,
	philipp.tomsich@vrull.eu, ajones@ventanamicro.com,
	emil.renner.berthing@canonical.com,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v2 0/13] Zbb string optimizations and call support in
 alternatives
Message-ID: <Y4aBklZNUi4z6oWM@spud>
References: <20221128102632.435174-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221128102632.435174-1-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_140304_353405_0D3AAF3C 
X-CRM114-Status: GOOD (  33.36  )
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

Yo Heiko,

On Mon, Nov 28, 2022 at 11:26:19AM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> The Zbb extension can be used to make string functions run a lot
> faster.
> 
> To allow There are essentially two problems to solve:
> - making it possible for str* functions to replace what they do
>   in a performant way
> 
>   This is done by inlining the core functions and then
>   using alternatives to call the actual variant.
> 
>   This of course will need a more intelligent selection mechanism
>   down the road when more variants may exist using different
>   available extensions.
> 
> - actually allowing calls in alternatives
>   Function calls use auipc + jalr to reach those 32bit relative
>   addresses but when they're compiled the offset will be wrong
>   as alternatives live in a different section. So when the patch
>   gets applied the address will point to the wrong location.
> 
>   So similar to arm64 the target addresses need to be updated.
> 
>   This is probably also helpful for other things needing more
>   complex code in alternatives.
> 
> 
> In my half-scientific test-case of running the functions in question
> on a 95 character string in a loop of 10000 iterations, the Zbb
> variants shave off around 2/3 of the original runtime.
> 
> 
> For v2 I got into some sort of cleanup spree for the general instruction
> parsing that already existed. A number of places do their own
> instruction parsing and I tried consolidating some of them.
> 
> Noteable, the kvm parts still do, but I had to stop somewhere :-)

One minor thing, since I don't see it mentioned nor a base-commit, could
you note what the series is based on? I'm sure by the time this is
closer to being applied it will be capable of being build automagically
but for now (at least on the patchwork side of things) it's not being
built as it cannot figure out where to apply it:
https://patchwork.kernel.org/project/linux-riscv/list/?series=699641

Thanks,
Conor.

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
> Heiko Stuebner (13):
>   RISC-V: add prefix to all constants/macros in parse_asm.h
>   RISC-V: detach funct-values from their offset
>   RISC-V: add ebreak instructions to definitions
>   RISC-V: Move riscv_insn_is_* macros into a common header
>   RISC-V: rename parse_asm.h to insn.h
>   RISC-V: kprobes: use central defined funct3 constants
>   RISC-V: add auipc elements to parse_asm header
>   RISC-V: add U-type imm parsing to parse_asm header
>   RISC-V: add rd reg parsing to parse_asm header
>   RISC-V: fix auipc-jalr addresses in patched alternatives
>   efi/riscv: libstub: mark when compiling libstub
>   RISC-V: add infrastructure to allow different str* implementations
>   RISC-V: add zbb support to string functions
> 
>  arch/riscv/Kconfig                       |  23 ++
>  arch/riscv/include/asm/alternative.h     |   3 +
>  arch/riscv/include/asm/errata_list.h     |   3 +-
>  arch/riscv/include/asm/hwcap.h           |   1 +
>  arch/riscv/include/asm/insn.h            | 292 +++++++++++++++++++++++
>  arch/riscv/include/asm/parse_asm.h       | 219 -----------------
>  arch/riscv/include/asm/string.h          |  83 +++++++
>  arch/riscv/kernel/alternative.c          |  72 ++++++
>  arch/riscv/kernel/cpu.c                  |   1 +
>  arch/riscv/kernel/cpufeature.c           |  29 ++-
>  arch/riscv/kernel/image-vars.h           |   6 +-
>  arch/riscv/kernel/kgdb.c                 |  63 ++---
>  arch/riscv/kernel/probes/simulate-insn.c |  19 +-
>  arch/riscv/kernel/probes/simulate-insn.h |  26 +-
>  arch/riscv/lib/Makefile                  |   6 +
>  arch/riscv/lib/strcmp.S                  |  38 +++
>  arch/riscv/lib/strcmp_zbb.S              |  96 ++++++++
>  arch/riscv/lib/strlen.S                  |  29 +++
>  arch/riscv/lib/strlen_zbb.S              | 115 +++++++++
>  arch/riscv/lib/strncmp.S                 |  41 ++++
>  arch/riscv/lib/strncmp_zbb.S             | 112 +++++++++
>  drivers/firmware/efi/libstub/Makefile    |   2 +-
>  22 files changed, 978 insertions(+), 301 deletions(-)
>  create mode 100644 arch/riscv/include/asm/insn.h
>  delete mode 100644 arch/riscv/include/asm/parse_asm.h
>  create mode 100644 arch/riscv/lib/strcmp.S
>  create mode 100644 arch/riscv/lib/strcmp_zbb.S
>  create mode 100644 arch/riscv/lib/strlen.S
>  create mode 100644 arch/riscv/lib/strlen_zbb.S
>  create mode 100644 arch/riscv/lib/strncmp.S
>  create mode 100644 arch/riscv/lib/strncmp_zbb.S
> 
> -- 
> 2.35.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
