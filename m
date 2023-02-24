Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B93C7EE23
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 16:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0WG1axRCF+U/at+owKjtNUmIywWGcSroET2CI/wZ2z8=; b=P/Gopx6tjwUV7Q
	nfpSpsxup9SiPWqJtlu+L8UyR7LJAnfeGGJIE4GaSkeZ6fWSKjXRZvdFLlgq+fol39GWcdIwIqf5O
	BsItUZpI3FDt3lkrILJ6FqLq4aSmkUuXRR21IiMwEMZuBJw9n1NdN1sZ0nOl9DNXXVYqbvZ3H6qZg
	JIBU78RzR+m53N7nReM1f1Vhr1wKaXik56clWWlM5L7WckwqrQBR0Mk+o2sFI6sKj92pnwbEXhfqO
	MQ78fP00rL48B+EsME3YfO5bxy2bzasiZ/9hPMtNN/0mn22a1vTl3q9Rwmnfi1rdJ05lUE+CxdrVt
	/0drroyyOqfw6QIKWVBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVazq-0038T0-FW; Fri, 24 Feb 2023 16:32:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVazn-0038RQ-5z
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 16:32:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8AB286189B;
	Fri, 24 Feb 2023 16:32:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82C44C4339C;
	Fri, 24 Feb 2023 16:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677256350;
	bh=y4cwzKHY0rdTHSoLcGNukwvUgSVLhPLJhCFWCAL+0nA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HGMw2modbXaH+bULIX2yYhhekqM2zo3zzQehQx04dgqRH+qBMf1v0UCh6Vfdi/WxE
	 diq19+GBoqYJ2D8/RaEknfd+XAx4Kr35xNmvMC1WsWj9yhcIpYVCXo8sehbSSemTQv
	 iqcFYMLf8Rit6SiKMkKi4T1RPo7Fpq3xeR5crKlT3dEAtZzKLYBLc41tKN5OGgJx0/
	 yPfQGg5YSmSpHfiC9GWxc6X2IuTVakse/LSiVTo/M1CMBjY2UC9ae6XkfAK9ewBLdP
	 zyQS9YK/fFdYA2L2B8EJhhtA/CzS47IKuqW9ZRtDyGog8Zfam8lFkH6MR50B/jdCsv
	 ekhqxZu5JnTAw==
Date: Fri, 24 Feb 2023 09:32:27 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: palmer@dabbelt.com, Conor Dooley <conor.dooley@microchip.com>,
	naresh.kamboju@linaro.org, linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH v1 2/2] RISC-V: make TOOLCHAIN_NEEDS_SPEC_20191213 gas
 only
Message-ID: <Y/jmm0Q7ypzkUaXw@dev-arch.thelio-3990X>
References: <20230223220546.52879-1-conor@kernel.org>
 <20230223220546.52879-3-conor@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230223220546.52879-3-conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_083231_327011_5F93FCDA 
X-CRM114-Status: GOOD (  23.20  )
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

Hi Conor,

On Thu, Feb 23, 2023 at 10:05:46PM +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Quoting the llvm docs:
> > Between versions 2.0 and 2.1 of the base I specification, a backwards
> > incompatible change was made to remove selected instructions and CSRs
> > from the base ISA. These instructions were grouped into a set of new
> > extensions, but were no longer required by the base ISA. (snip) LLVM
> > currently implements version 2.0 of the base specification. Thus,
> > instructions from these extensions are accepted as part of the base
> > ISA.
> 
> There is therefore no need (at present!) to carry out a $cc-option
> check, and instead just gate presence of zicsr and zifencei in march
> on the version of binutils that commit 6df2a016c0c8 ("riscv: fix build
> with binutils 2.38") highlights as the introduction of the requirement.
> 
> In fact, the status quo creates some issues with mixed llvm/binutils
> builds, specifically building with llvm-17 and ld from binutils-2.35.
> Odd combo you may think, but this is what tuxsuite's debian stable uses
> while testing 5.10 stable kernels as doesn't support LLD.
> 
> CC: stable@vger.kernel.org # needs RISC-V: move zicsr/zifencei spec version check to Kconfi

I think it would be better to drop this comment and just mark patch 1
for stable directly. However, if it remains, 'Kconfi' -> 'Kconfig' :)

> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Link: https://lore.kernel.org/all/CA+G9fYt9T=ELCLaB9byxaLW2Qf4pZcDO=huCA0D8ug2V2+irJQ@mail.gmail.com/
> Suggested-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Thanks for helping getting down to the bottom of this!

> ---
>  arch/riscv/Kconfig | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 4eb0ef8314b3..c6902f4c5650 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -291,8 +291,7 @@ endchoice
>  config TOOLCHAIN_NEEDS_SPEC_20191213
>  	bool
>  	default y
> -	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zicsr_zifencei)
> -	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zicsr_zifencei)
> +	depends on AS_IS_GNU && AS_VERSION >= 23800
>  	help
>  	  Newer binutils versions default to ISA spec version 20191213 which
>  	  moves some instructions from the I extension to the Zicsr and Zifencei
> -- 
> 2.39.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
