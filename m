Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA6BDC0015E
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 17:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ffC+QJ01jHwjwsuXEwA6D52cymqKZAqL/1meqqEP4T0=; b=Xr9tpOV3uXFiIi
	CouzUC0sPz3FbAphlLV9z83Ri5dwaGb3L/0hLgL+TkLrGw+Mi/BwX6krAwPcKHTNJlkZeTVW61Bdl
	xCBdIyZm2e4vLQl9ZDGtk/4qVQFYlhv1jmMgzYOilwpvF9xwV/gA4DO6w3QdoMPgyLtSUuXpcW2b5
	iAL0zooGSUSqUdW32nihpWqtb6NyerIa9tP/aaJ4eRG41z4uNF5xf+Iv/YGyQ+vzCBicDgvUCP3PD
	fXz5pEiMgD/bY1y3YgNF0KdeShBs8PMSGpnY28cLFoEHYv3Wwm+cNRa/BQy0FF9ajwL+K7//zDZa+
	A7iGkyV3iMvxPS0U3Yqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOLlJ-0089Yw-1c;
	Tue, 25 Jul 2023 17:23:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOLlF-0089Wr-36
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jul 2023 17:23:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D6F5261843;
	Tue, 25 Jul 2023 17:23:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B01B2C433C7;
	Tue, 25 Jul 2023 17:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690305827;
	bh=A9c+EsCAmnw3iswaBvqbsGUpM3ibnJmuEfJXVPakIrI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ugy6AoAC5WOplFFIoUW4OI+9FRlA9fthFFMsS0tiPrLONUWMa7uxKDf8kS4vVIyq+
	 Fqtyk7vFFcMypv9Zh03lafjNRf/i7IcJdcr1a9SwXkVrmP0U129vFKYsxFr9hXDNda
	 ZMfOrRMbOsiCVHm/zIJV5DCa9lZZ0mmqvAvBcyaxfvftPqu2HlbZTNl4yQMq/bnEVD
	 6+AWw8/a6quspwFv8Fi88DP7/jJEfVc73h/TqfqVjLlDzVCsOXV6m0JCrh421ICoV+
	 OLIXNdR8Q9LeuKHKvxlMb/WTjnzCSf9IgLg6g1ADI61ie51brc7y+DX8kNjUakyOd3
	 4c8muDb3p3ZIQ==
Date: Tue, 25 Jul 2023 10:23:44 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mingzheng Xing <xingmingzheng@iscas.ac.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Bin Meng <bmeng@tinylab.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] riscv: Handle zicsr/zifencei issue between gcc and
 binutils
Message-ID: <20230725172344.GA1445373@dev-arch.thelio-3990X>
References: <20230725170405.251011-1-xingmingzheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230725170405.251011-1-xingmingzheng@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_102350_088928_91C3845C 
X-CRM114-Status: GOOD (  25.92  )
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

Hi Mingzheng,

Thanks for the patch!

On Wed, Jul 26, 2023 at 01:04:05AM +0800, Mingzheng Xing wrote:
> When compiling the kernel with the toolchain composed of GCC >= 12.1.0 and
> binutils < 2.38, default ISA spec used when building binutils and GCC, the
> following build failure will appear because the
> CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI is not turned on.
> (i.e, gcc-12.1.0 and binutils-2.36, or gcc-12.3.0 and binutils-2.37, use
> default ISA spec.)
> 
>   CC      arch/riscv/kernel/vdso/vgettimeofday.o
>   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h: Assembler messages:
>   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:79: Error: unrecognized opcode `csrr a5,0xc01'

The gift that keeps on giving :/

> Binutils has updated the default ISA spec version, and the community has
> responded well to this[1][2][3], but it appears that this is not over yet.
> 
> We also need to consider the situation of binutils < 2.38 but
> GCC >= 12.1.0, since the combination between different versions of GCC and
> binutils is not unique, which is to some extent flexible. GCC release
> 12.1.0 updated the default ISA spec version in GCC commit[4].

I suspect this combination is not too common because binutils 2.38 came
out before GCC 12.1.0 but as you note, it is obviously possible. What
toolchain has this combination in the wild, which would be helpful for
documentation purposes?

> For more information, please refer to:
> 
> commit 6df2a016c0c8 ("riscv: fix build with binutils 2.38")
> commit e89c2e815e76 ("riscv: Handle zicsr/zifencei issues between clang and binutils")
> 
> [1]: https://groups.google.com/a/groups.riscv.org/g/sw-dev/c/aE1ZeHHCYf4
> [2]: https://lore.kernel.org/all/20230308220842.1231003-1-conor@kernel.org
> [3]: https://lore.kernel.org/all/20230223220546.52879-1-conor@kernel.org
> [4]: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=98416dbb0a62579d4a7a4a76bab51b5b52fec2cd
> 
> Signed-off-by: Mingzheng Xing <xingmingzheng@iscas.ac.cn>
> ---
>  arch/riscv/Kconfig | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 4c07b9189c86..b49cea30f6cc 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -570,11 +570,15 @@ config TOOLCHAIN_HAS_ZIHINTPAUSE
>  config TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI
>  	def_bool y
>  	# https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=aed44286efa8ae8717a77d94b51ac3614e2ca6dc
> -	depends on AS_IS_GNU && AS_VERSION >= 23800
> +	# https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=98416dbb0a62579d4a7a4a76bab51b5b52fec2cd
> +	depends on CC_IS_GCC && GCC_VERSION >= 120100 || \
> +		   AS_IS_GNU && AS_VERSION >= 23800

GCC_VERSION will be 0 for clang, so you don't need the CC_IS_GCC check.
With that change, this should be able to stay on one line:

    depends on GCC_VERSION >= 120100 || (AS_IS_GNU && AS_VERSION >= 23800)

>  	help
>  	  Newer binutils versions default to ISA spec version 20191213 which
>  	  moves some instructions from the I extension to the Zicsr and Zifencei
>  	  extensions.
> +	  Similarly, GCC release 12.1.0 has changed the default ISA spec version to
> +	  20191213, so the above situation requires this option to be enabled.
>  
>  config TOOLCHAIN_NEEDS_OLD_ISA_SPEC
>  	def_bool y
> -- 
> 2.34.1
> 

Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
