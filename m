Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C55FDC64ED6
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Feb 2023 13:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wn1ao0D8z9BOCZqmGzz6rjnnuSXkpfrk3w5Wv0/xHUo=; b=K7rETvJFJkEI7R
	DzKY1LsEZYmz3m2I+LSHpriChplm659f/Nnnq9XpfKtP969lHvkD5TKFRJHem/YcSRYNS6OZL+oV9
	+qfIwbEQbWKtX6XhyhRmtiIbcjjVTp7OitT7gmmf/u8dV9Zlf/1PgelxrejeD03Y0tieHMadmrq3y
	h63+ZdsoR6xeFaBeNTFU08iDzPFAxFZdPhkkW7XemMtygL/HIHXgmbyNWjaEz27jH84GFP2FkWuZE
	NAK5UEtPdpMm61SZrIhwDP1nKQAcfjFKcSDwQTyD5KfdXzD8Zps+1M19F9GxO4GHXNG20xgiyLwX3
	D1GZ3O/VuNz2Ko6fg2Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWdkO-009odA-DO; Mon, 27 Feb 2023 13:40:56 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWdkK-009oZS-IA
	for linux-riscv@lists.infradead.org; Mon, 27 Feb 2023 13:40:55 +0000
Received: by mail-qv1-xf36.google.com with SMTP id nv15so4412401qvb.7
        for <linux-riscv@lists.infradead.org>; Mon, 27 Feb 2023 05:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bluespec-com.20210112.gappssmtp.com; s=20210112; t=1677505249;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8JIiHToWm3JJX3vLcdAdWPiMyNkhL1NymqgcmOqFXnc=;
        b=E6fDCBRzXaSEcmbwYppIr9fPG+rbeM4a7GwiXp3RIMWLGIV2hWHjvG4lfYVUELvHR1
         3vE7Rtnst+AMB2XcOoBcViFlLK79I75brt9VDJQE69HvFDx4MlWzw2n41KoEcU9NZmdA
         00AcATFg9PM2emTkkLKBI7uiWkVg6TXuvNg+QrnxI8Aevzs2AfaueO+dXN3ZHNkb0RSJ
         BlKoc01/zX+q386MMzpPhXIsnv43o2eM+Fa0eDmiHlvpNtcsVn7EzBvTKS3NBGx8pImz
         8CmcBN4v00Iua9D7twVrIPnr0IRR9Ax3X8/iaP44Qrgr7hngvwbE/BD8l2Q9Mhlt2s7z
         oarg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677505249;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8JIiHToWm3JJX3vLcdAdWPiMyNkhL1NymqgcmOqFXnc=;
        b=iKUt318xFu4BI6cEjGR7BrCpV5pLLXZ6eBpKB6EVZxl6CX3SBvh4XY0v4elFy8R1ub
         CUC2kynuFZLJTGN3w9G8eR4BUeRZ3e7r3MAvHm4qRnIvh+2op27BO6bS74vtBHYj9EHW
         hRU+o0f+3oEXoMu//Bg41KhaWvUi+NqjiCJNtt1fAn/5ZxztbuXV4gLpdtlyeYI8KufW
         z0ELfctjUQPwSoIxo2NuIpZg4EBkFcng5wL7GKS7/wjBC/KY7lJlQgEQ2mLf7LvRa6i6
         hXCwUrNIrnHTe2HaTZyqEu3lmyf46TmlQjidRlw7C+2gfolAmAZwOiZlkHYFSYNlhAiF
         29hA==
X-Gm-Message-State: AO0yUKWIPgyvRgpPKhear1sdR1WtsC3egz3/JYxp/c3dgTryKbG+AB5+
	+auLaVLvm6bueYTKnIqBSlMX
X-Google-Smtp-Source: AK7set962+ZodxtJuVn4KwIsiWzvasBAywTTkE+5fyPW8lu8CRTF3VS1E28pdLmsqnRVvjQBwlLV7Q==
X-Received: by 2002:a05:6214:194a:b0:56e:a88f:70d0 with SMTP id q10-20020a056214194a00b0056ea88f70d0mr51430834qvk.27.1677505248894;
        Mon, 27 Feb 2023 05:40:48 -0800 (PST)
Received: from bruce.bluespec.com ([102.129.235.233])
        by smtp.gmail.com with ESMTPSA id 124-20020a370b82000000b007425ef4cbc2sm4884423qkl.100.2023.02.27.05.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 05:40:48 -0800 (PST)
Date: Mon, 27 Feb 2023 08:40:46 -0500
From: Darius Rad <darius@bluespec.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	vineetg@rivosinc.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH -next v14 19/19] riscv: Enable Vector code to be built
Message-ID: <Y/yy3sDX2AxvBD0f@bruce.bluespec.com>
Mail-Followup-To: Conor Dooley <conor.dooley@microchip.com>,
	Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	vineetg@rivosinc.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
 <20230224170118.16766-20-andy.chiu@sifive.com>
 <Y/yDeurep0ZBnLdR@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y/yDeurep0ZBnLdR@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_054052_637947_C92BFD7E 
X-CRM114-Status: GOOD (  26.82  )
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

On Mon, Feb 27, 2023 at 10:18:34AM +0000, Conor Dooley wrote:
> Hey Andy,
> 
> On Fri, Feb 24, 2023 at 05:01:18PM +0000, Andy Chiu wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> > 
> > This patch adds a config which enables vector feature from the kernel
> > space.
> > 
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
> > Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> > Suggested-by: Vineet Gupta <vineetg@rivosinc.com>
> > Suggested-by: Atish Patra <atishp@atishpatra.org>
> > Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> 
> At this point, you've basically re-written this patch and should be
> listed as a co-author at the very least!
> 
> > ---
> >  arch/riscv/Kconfig  | 18 ++++++++++++++++++
> >  arch/riscv/Makefile |  3 ++-
> >  2 files changed, 20 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 81eb031887d2..19deeb3bb36b 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -418,6 +418,24 @@ config RISCV_ISA_SVPBMT
> >  
> >  	   If you don't know what to do here, say Y.
> >  
> > +config TOOLCHAIN_HAS_V
> > +	bool
> > +	default y
> > +	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64iv)
> > +	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32iv)
> > +	depends on LLD_VERSION >= 140000 || LD_VERSION >= 23800
> > +
> > +config RISCV_ISA_V
> > +	bool "VECTOR extension support"
> > +	depends on TOOLCHAIN_HAS_V
> > +	select DYNAMIC_SIGFRAME
> 
> So, nothing here makes V depend on CONFIG_FPU...
> 
> > +	default y
> > +	help
> > +	  Say N here if you want to disable all vector related procedure
> > +	  in the kernel.
> > +
> > +	  If you don't know what to do here, say Y.
> > +
> >  config TOOLCHAIN_HAS_ZBB
> >  	bool
> >  	default y
> > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > index 76989561566b..375a048b11cb 100644
> > --- a/arch/riscv/Makefile
> > +++ b/arch/riscv/Makefile
> > @@ -56,6 +56,7 @@ riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
> >  riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
> >  riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd
> 
> ...but march only contains fd if CONFIG_FPU is enabled...
> 
> >  riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
> > +riscv-march-$(CONFIG_RISCV_ISA_V)	:= $(riscv-march-y)v
> >  
> >  # Newer binutils versions default to ISA spec version 20191213 which moves some
> >  # instructions from the I extension to the Zicsr and Zifencei extensions.
> > @@ -65,7 +66,7 @@ riscv-march-$(toolchain-need-zicsr-zifencei) := $(riscv-march-y)_zicsr_zifencei
> >  # Check if the toolchain supports Zihintpause extension
> >  riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE) := $(riscv-march-y)_zihintpause
> >  
> > -KBUILD_CFLAGS += -march=$(subst fd,,$(riscv-march-y))
> > +KBUILD_CFLAGS += -march=$(subst fdv,,$(riscv-march-y))
> 
> ...so I think this will not work if !CONFIG_FPU && RISCV_ISA_V.
> IIRC, vector uses some floating point opcodes, but does it (or Linux's
> implementation) actually depend on having floating point support in the
> kernel?

Yes.

"The V extension requires the scalar processor implements the F and D
extensions", RISC-V "V" Vector Extension, Section 18.3. V: Vector Extension
for Application Processors.

> If not, this cannot be done in a oneliner. Otherwise, CONFIG_RISCV_ISA_V
> should explicitly depend on CONFIG_FPU.
> 
> >  KBUILD_AFLAGS += -march=$(riscv-march-y)
> >  
> >  KBUILD_CFLAGS += -mno-save-restore
> > -- 
> > 2.17.1
> > 
> > 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
