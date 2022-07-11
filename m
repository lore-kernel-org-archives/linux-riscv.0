Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A982C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jul 2022 17:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jJsPnrZKSKNIkpmhE56KU5fVWcWIwek6nN50F8N1pTg=; b=uACcMSYBPOVOVM
	Fvd15cl9NcnYoNNIar2SfhCq4bSWlWkXWaPgnszUFpwIQ5FNcpgMAn2G58ZAScSeZOmgrrrMtHfJR
	U8kPVpw/kG5kdnTcO1Ww1L4GGwc+fDPh0N5W1TGxn6YAKWiOoPHURSo3EVui+eoS0XqagABwy82Vm
	TOYWhX7DM9AsgS/C8zTj7xGxTfVoUPWue/Cn0cRNpXeRwRgaVpFu+H+aAxlqJlVNq/aIsQ0PDob0y
	6cwrwZ06yCUydVPukgig6i2WltGN9DE7O2ZQt06KoT+9lA9oWiTtaYZ5Zgy2W4lxj/NT+ra7B7Jcz
	AutyMjeDhMpZu+RTs5/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAxKS-003WTt-2s; Mon, 11 Jul 2022 17:36:16 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAxKQ-003WSY-0Z
	for linux-riscv@lists.infradead.org; Mon, 11 Jul 2022 17:36:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D3D85B810AB;
	Mon, 11 Jul 2022 17:36:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24210C34115;
	Mon, 11 Jul 2022 17:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657560970;
	bh=/JLD7aGPAUH2PlEjhKv8uoAqs8/TyZRWMWlU6+jVWgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BlYkvo3bixwtbU6hCps4/5JfqYhJ5pR2zL0s9D0OlM2Jp2Dq/8xx2NK4NAJ3JQGpB
	 gZKYcK/HJ0O/zdgNbOOQgmZ5FqPOB1TYqKj2ZSzQhXEleq4K1Yke3XCISkRbSBoKoF
	 JnOWU17WoB5SRUA9UhoLCKQ5RumJqm0l3Sr44Q/44UZSp3aFVRGOWlFQlxjvItLSVB
	 3oSTQGA41U2Y6wP5oEEeiTT3/7HoXz48tkpb9ji8x++aED+S76Y3Xlz6ASpoyfUBDS
	 dUz6dqIlSjUa5nNmaQ4hC0FAB9ViMDG+QJup58Hm5ldq8LeBjyJAkmGigAd8T8TAUC
	 DDinQqc3d8l6Q==
Date: Mon, 11 Jul 2022 10:36:08 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Fangrui Song <maskray@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	Khem Raj <raj.khem@gmail.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] riscv: Pass -mno-relax only on lld < 15.0.0
Message-ID: <YsxfiKC/ZBr7U7qI@dev-arch.thelio-3990X>
References: <20220710071117.446112-1-maskray@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220710071117.446112-1-maskray@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_103614_245655_04D9DD96 
X-CRM114-Status: GOOD (  14.96  )
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

On Sun, Jul 10, 2022 at 12:11:17AM -0700, Fangrui Song wrote:
> lld since
> https://github.com/llvm/llvm-project/commit/6611d58f5bbcbec77262d392e2923e1d680f6985
> (milestone: 15.0.0) has implemented some RISC-V linker relaxation.
> -mno-relax is no longer needed in KBUILD_CFLAGS/KBUILD_AFLAGS to
> suppress R_RISCV_ALIGN which older lld can not handle:
> 
> ld.lld: error: capability.c:(.fixup+0x0): relocation R_RISCV_ALIGN requires unimplemented linker relaxation; recompile with -mno-relax but the .o is already compiled with -mno-relax
> 
> Signed-off-by: Fangrui Song <maskray@google.com>

ld.lld 14 and 15 both continue to link kernels and I have no issues
booting them in QEMU.

Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/riscv/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 34cf8a598617..7e4ceb2a0981 100644
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
> 2.37.0.144.g8ac04bfd2-goog
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
