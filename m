Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA72C54EE9
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 17:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fRAvfz+nklx4QfOCXZ/F/RlF/JTNruWNi0/X0ZK0SXs=; b=aS62OqYe4e1Tdd
	vR8x2QyFsg+JRXxCAIQZYLynvELOYemXxKYUs3Szu0e0cN57xk6mr+gM62VmhVfBMRD7/UkmZz+nc
	1gIzkccrUrNRBz9AgQ55Qa2LNOjFtYtAciSHu+97G6fBiJFIlg6C+2p2baZxsbe9ZYHxCz6lU7SOF
	nDpYn77X5TYhZV1z0Gg8QHEtNVdrhWiP4FPF7tiixI5UkQyGJaWgPdudOADk46xQBhiORz5U/fhuu
	+ovSfpsMFQuJhn1pWt9iWVc+2Fvla1F8MxdY9nguIB5eW/HotPVsRYobOYSMnQMBRUol6xuY83Ce7
	M4/T7Z109dJvIIUFFdgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWLAh-006E2L-T6; Thu, 08 Sep 2022 17:18:35 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWLAd-006DyW-QO
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 17:18:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5A727B82190;
	Thu,  8 Sep 2022 17:18:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96103C433C1;
	Thu,  8 Sep 2022 17:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662657508;
	bh=BKMcAQ3vYiv+Ylfeo5rUhNpJPYy2W6lJL3dQjdOBQtM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p15oEeIpato/8FuclAgFIU8NnBmaj9g7/2fL318qIGl7W9JRzRLW5hgKL8KXmNW61
	 myVk1IvIDYKaht3RqxAh2hGpmOUG7E3dOG7GPrIi524J/1YEoaUbpYjjBD4H9cIBXf
	 7gohqijJ10318MqLYAV/986QoSw/GIxnT8aYLM+9MGLga7Ll5Ajd/uQWnA8mKnLXnh
	 FSn+Ea5GOQzWra/K3AZfYaGo4bSlRWnWknwMsQ99Dx7caJssLjsSWg+b2PicmB8IVl
	 eRD6C+xohQRj1KWvecXz0OYIqSjNc6O2vCLPE/LduOyfOuE06//gT/FHovnjRb8cbb
	 /l3Wq6GJO57cg==
Date: Thu, 8 Sep 2022 10:18:25 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	Khem Raj <raj.khem@gmail.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Fangrui Song <maskray@google.com>
Subject: Re: [PATCH] riscv: Pass -mno-relax only on lld < 15.0.0
Message-ID: <Yxoj4VUJFvQTFl9r@dev-arch.thelio-3990X>
References: <20220710071117.446112-1-maskray@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220710071117.446112-1-maskray@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_101832_097140_D6B085D1 
X-CRM114-Status: GOOD (  16.14  )
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

It does not look like this ever got picked up? Would it be possible to
pick it up for 6.1?

The original patch is at:

https://lore.kernel.org/20220710071117.446112-1-maskray@google.com/

Cheers,
Nathan

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
