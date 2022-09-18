Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B97C54EE9
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Sep 2022 09:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xllt7QjqmqZ6ADrrAJ54xYA+EPnTUlEr1qORPYB4MRs=; b=kwD1WYCPInEflM
	t0Qkcf8NfdEH4+U5c2I2H16I1PSyCEq2xHyHv91nGPowLHg8xDsSQJkbqW8uiEuaY1++QPh966BGg
	nhECErwPZ+Pm6GC5snmvAA4MwSpIWtcAEZpGxL5lBBKE+5SU+n/YMfpMI5ko1eaybbtzNC66/opJd
	KIv2qKSQ57tkNLqUPaP0uZylzTv/G1plge122Pj6Df0OQdj33bwhHgpOeE6nlMBQFX1AzfLdeW4SU
	dRv2Bo30bnoKRCvTtF94aajBkY+jyr3T1DyXHx2UAA4CU9Y49Ijt1C00LnQxUidQfYHg8J/Aiz55f
	4XUXLmzI9HhtIWNUotCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZr3C-00EZUG-RK; Sun, 18 Sep 2022 09:57:22 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZr39-00EZR8-O2
	for linux-riscv@lists.infradead.org; Sun, 18 Sep 2022 09:57:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1B95CB80EBB;
	Sun, 18 Sep 2022 09:57:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD0BEC433D6;
	Sun, 18 Sep 2022 09:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663495035;
	bh=662Chcy7L1akvQ6aW/SpBa6YwTlLykZLOmsj/8yptWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qiit0wz0ORWfshCnngu5Iun9zHJ8WFOyqilV1S3mjMVm05Ujce61eO67vuNG4IQBI
	 U7X8BFBqAKzLShKbSAH7rZObvsTkZPAuMuqDnLDdtzE9EaLH2ngD2TrE23QbJ5aAwm
	 2i/9LsMy6sg46qzI0n4WYHq+gbl/UhqTMwQCLPMzG8mUGEjCs09Tf2GfUpiHgQuq5g
	 6h01masG+04iw0dJOkQ72NpeZAysTjKp5aOIhcks1C82e3YaIyY4dQoP/eMlxCNPB6
	 GVARzokGTJPA/TUpJ3d/pY7yHsgyOS6fNwJUoAaMn0+48TPOdBlBHAMSeSd7cqeDSY
	 Y/H9ySiYXa/vw==
Date: Sun, 18 Sep 2022 10:57:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>,
	Nathan Chancellor <nathan@kernel.org>
Cc: maskray@google.com, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2/RESEND] riscv: Pass -mno-relax only on lld < 15.0.0
Message-ID: <Yybrd99HuLs3ulmy@spud>
References: <20220918092933.19943-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220918092933.19943-1-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220918_025720_087168_E31A1E34 
X-CRM114-Status: GOOD (  24.24  )
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

On Sun, Sep 18, 2022 at 02:29:34AM -0700, Palmer Dabbelt wrote:
> From: Fangrui Song <maskray@google.com>
> 
> lld since llvm:6611d58f5bbc ("[ELF] Relax R_RISCV_ALIGN"), which will be
> included in the 15.0.0 release, has implemented some RISC-V linker
> relaxation.  -mno-relax is no longer needed in
> KBUILD_CFLAGS/KBUILD_AFLAGS to suppress R_RISCV_ALIGN which older lld
> can not handle:
> 
>     ld.lld: error: capability.c:(.fixup+0x0): relocation R_RISCV_ALIGN
>     requires unimplemented linker relaxation; recompile with -mno-relax
>     but the .o is already compiled with -mno-relax
> 
> Signed-off-by: Fangrui Song <maskray@google.com>
> Link: https://lore.kernel.org/r/20220710071117.446112-1-maskray@google.com/
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Tested-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
> Fanguri poked me about this one on IRC, I'm not sure what happened but
> it didn't make it to my inbox (and neither did the replies, which is
> kind of scary).  Rather that trying to resurrect that thread from lore,
> I figured it would be best to just send the v2 as the commit message
> needed a bit of cleanup.

One of the replies was a T-b from Nathan:
https://lore.kernel.org/linux-riscv/YsxfiKC%2FZBr7U7qI@dev-arch.thelio-3990X/
dunno if you wanna pick that up or he wants to resend..

I gave it a whirl too, so:
Tested-by: Conor Dooley <conor.dooley@microchip.com>

> 
> Changes since v1 <20220710071117.446112-1-maskray@google.com>:
> 
> * Clean up the commit message a bit.
> ---
>  arch/riscv/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 3fa8ef336822..e7d52a2301e2 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -37,6 +37,7 @@ else
>  endif
>  
>  ifeq ($(CONFIG_LD_IS_LLD),y)
> +ifeq ($(shell test $(CONFIG_LLD_VERSION) -lt 150000; echo $$?),0)
>  	KBUILD_CFLAGS += -mno-relax
>  	KBUILD_AFLAGS += -mno-relax
>  ifndef CONFIG_AS_IS_LLVM
> @@ -44,6 +45,7 @@ ifndef CONFIG_AS_IS_LLVM
>  	KBUILD_AFLAGS += -Wa,-mno-relax
>  endif
>  endif
> +endif
>  
>  # ISA string setting
>  riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
> -- 
> 2.34.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
