Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4218CFA477
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 07:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hZKTZzJdfKwxRNaHSuUtpBRx5HXRRh6dEGTmfjA4waM=; b=MfNZxY5H3RRYeq
	OJeH4+1j9ZuypDdFPPJHU4TMExJ/ycup8YL7+Bi/i5gjd+k8SOE9vvcFLWwDtc8ktzNtcG6EJYyk/
	iFG7FoAHXHM7by7Isa5XhdghsZEE07Hey4CwskClMtvlFn06CwaMiSxSKV0Rgv5TQDHldmr+Uratz
	otJmzku/joMIrSnK1+sd+K0ADdXH6FiQMjnn0zHdaufAmrI/nqLc9d1KgBerNKRInzIIsuVIUUOgZ
	8lAsnZT9bkS0nz0E/uvkPDjT96pDUXucEC6mh+PKgdX7o+jCXdMziq9/xdAGCT5rf0Nk+ypgIO5q9
	FT/1s603fJYDZZmx5Q4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vML9P-00000007wkm-3FM7;
	Fri, 21 Nov 2025 07:01:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vML9O-00000007wkX-39bt;
	Fri, 21 Nov 2025 07:01:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DAE8460216;
	Fri, 21 Nov 2025 07:01:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60DE4C4CEF1;
	Fri, 21 Nov 2025 07:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763708505;
	bh=1YnEm2rwYro5kibPE7TCBvONQ7gMituY5BQOTzSye/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SsIlKV+azWDhpO+J32G4unagDrWFST2VumSfhKWuVYUEAwoDv+aVp22lROqHAwE6m
	 eZT/MSEkH8tWj56AeDZ6Nb2SoQQdCXvXvlJmz/0OvXlf1PkkaLAOLBidSpbxs5LqyQ
	 wx8oNhKq1nfYTl4yoPqn/cfgW0aE14ipP/6SQ4nOVl4FtWsvpeFZcgkKeAsCJTUkcM
	 dIddexyQrvr70uypC0ogeCOFlyHyBVBZQ4ThAj2Q1asa7ikRlgWO/H4gyc9sXOx6VR
	 R4L+zkr8xX0yj+c0NAeWAsINUCBl4OxhjHw76dwQChivSgX7SEjQ7YDQbZ/LVt9gwY
	 1zdrWruK71EFw==
Date: Fri, 21 Nov 2025 00:01:40 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-efi@vger.kernel.org, loongarch@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] kbuild: Add KBUILD_VMLINUX_LIBS_PRELINK
Message-ID: <20251121070140.GA780042@ax162>
References: <20251119042708.27658-1-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251119042708.27658-1-yangtiezhu@loongson.cn>
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

On Wed, Nov 19, 2025 at 12:27:08PM +0800, Tiezhu Yang wrote:
> In order to only link libstub to the final vmlinux, it can not use the
> current KBUILD_VMLINUX_LIBS, just add KBUILD_VMLINUX_LIBS_PRELINK. This
> is preparation for later patch, no functionality change.
> 
> Link: https://lore.kernel.org/lkml/pq4h7jgndnt6p45lj4kgubxjd5gidfetugcuf5rcxzxxanzetd@6rrlpjnjsmuy/
> Suggested-by: Josh Poimboeuf <jpoimboe@kernel.org>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
> There is a long discussion in the previous patch:
> https://lore.kernel.org/lkml/20250928085506.4471-1-yangtiezhu@loongson.cn/
> 
> This version is based on 6.18-rc6, split the generic parts out
> into a separate patch to avoid merge conflicts, the other parts
> will send out after the merge window.
> 
>  Makefile                | 1 +
>  scripts/link-vmlinux.sh | 5 ++---
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index d763c2c75cdb..69485f47b794 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1199,6 +1199,7 @@ KBUILD_VMLINUX_OBJS := built-in.a $(patsubst %/, %/lib.a, $(filter %/, $(libs-y)
>  KBUILD_VMLINUX_LIBS := $(filter-out %/, $(libs-y))
>  
>  export KBUILD_VMLINUX_LIBS
> +export KBUILD_VMLINUX_LIBS_PRELINK

This variable name is a little confusing to me since they do get added
to vmlinux during linking, not before. I am not sure of a better one
though, maybe KBUILD_VMLINUX_LIBS_FINAL? It may also make sense to
introduce similar syntax to the existing libs-y syntax, maybe

  final-libs-y

or something like that?

Also, since these objects are no longer in KBUILD_VMLINUX_LIBS, does
this new variable need to be added to any of the other places in the
build system that use KBUILD_VMLINUX_LIBS for things such as build
dependencies?

>  export KBUILD_LDS          := arch/$(SRCARCH)/kernel/vmlinux.lds
>  
>  ifdef CONFIG_TRIM_UNUSED_KSYMS
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index 433849ff7529..e72d3254b93f 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -61,12 +61,11 @@ vmlinux_link()
>  	shift
>  
>  	if is_enabled CONFIG_LTO_CLANG || is_enabled CONFIG_X86_KERNEL_IBT; then
> -		# Use vmlinux.o instead of performing the slow LTO link again.
>  		objs=vmlinux.o
> -		libs=
> +		libs="${KBUILD_VMLINUX_LIBS_PRELINK}"
>  	else
>  		objs=vmlinux.a
> -		libs="${KBUILD_VMLINUX_LIBS}"
> +		libs="${KBUILD_VMLINUX_LIBS} ${KBUILD_VMLINUX_LIBS_PRELINK}"
>  	fi
>  
>  	if is_enabled CONFIG_GENERIC_BUILTIN_DTB; then
> -- 
> 2.42.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
