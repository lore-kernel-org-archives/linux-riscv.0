Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B766C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Oct 2022 15:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1AKm2ncGPzP2w9cQO4P5gVSG8ZpzB/ni8BLOWD/KoRE=; b=EBHpDF1qQuYgyR
	emmHxp/n06J+Fy9r0EfVLk8EnFbFroNLHWgDLteFmYQGco+ljobC3AyJqKMfepO88Qp/uBHIdvM8j
	pu4079vOvMFDj481pK19q2dnq1HwTHmCvyOAWsUHbptK2MqJn8HBVEOG1vmrTq/d7ZHzI1PC0Jvf8
	xDESbHaE+OIiEhnF6CysVA4jJjiZTTNI4+bnFbzB9dZcmw5cv12LSP59twYQrungNYUZPbCoxv1AL
	/wEhpWOd6aHXiwmPON01ep0m4E1CHpqqKfmJIsnjdO0HQscPOuV6Mo44HZKm/bcFV5hGFiEJwWlx+
	2iXYk+shefj/513CMU+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okSOx-00DUEm-Ei; Mon, 17 Oct 2022 15:51:39 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okSOS-00DTTl-D3
	for linux-riscv@lists.infradead.org; Mon, 17 Oct 2022 15:51:11 +0000
Received: by mail-ed1-x533.google.com with SMTP id m15so16641051edb.13
        for <linux-riscv@lists.infradead.org>; Mon, 17 Oct 2022 08:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZBmPZBk5dJIk9+JXoplzt5ARwx47oHaU28k3ADgsDIk=;
        b=Fq+h0CI3Y+K6BCz/QF2YliAkuE/anP1CfaiPSoQbygz4mBqBWNGWcprD+LBSliNVXa
         Alxeb4nR1Ps8ggwnnf20JrLvp5M5qEkI0bdaCJ00S6T0f4kZkVdsWwykVg6LK1hxjw2t
         FNUdYt2vTR+5hn7I2AJNyOn7B+U2bPlP8mPRrUUDSB702+Nb/JLJ6ERQXKi2O24CzPIC
         8xxjjUN3um+O+1kj7lkeOWg8aq6rNctWi9Mebm5eipZ0hlXOVVX9/g14luRb4jfCIGmj
         5OWt1pccYPSCQxTf+XGptDLfk15P2DfhkKQYtmmdfu5ij8CrnPYGaoj0mVXcT4p+QAFt
         mDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZBmPZBk5dJIk9+JXoplzt5ARwx47oHaU28k3ADgsDIk=;
        b=HflYlyxK/ooQsbOkMr1jYkdER8BLHysib+VgozTx/lG6WQeM8eNwOhKuZnqdNjSVHk
         hBaIcJZozz6wJdJxtYoYaK/OezKRNlPb/qMgnAWWkQmhbIeCK/z+6rfTJMNVITrGO3d6
         Sjr0kGCYKNmge2gmtbLMNsQgheRaj4lhgVPIwlA+TNJWw2seSt3Nf9B0hCZo46DxbPS1
         DBPXlTcOXP8F8gj/zLEtuNYwSKoXZGGGrCwxwt6ik+1YUy6XDvWG2UMy7mRsSMyfdmgI
         vzyCOLFQF4FmOhPd2u9xMH5p2fkTDfu9q1IY9kbwPkaW3IKHc0++pPaMb4Lqy3ZgfxDu
         6gcw==
X-Gm-Message-State: ACrzQf2WcUufZWz8OqlxL6vThfnah9M2AMw7uFOwfYU9hO4BbueX3yxC
	4DZvh0UDnXXen2B9P1N9NpUd/w==
X-Google-Smtp-Source: AMsMyM6hlf2tGA0s/Jrbgp21kZrQbJQsjTf9l7shXpqgUTI31fdS5nFiXIRGJyVgsf9z3sB7ZVVkFg==
X-Received: by 2002:a05:6402:557:b0:458:7488:8958 with SMTP id i23-20020a056402055700b0045874888958mr10722940edx.242.1666021865316;
        Mon, 17 Oct 2022 08:51:05 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id 17-20020a170906219100b0078dce9984afsm6296346eju.220.2022.10.17.08.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 08:51:04 -0700 (PDT)
Date: Mon, 17 Oct 2022 17:51:03 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Dao Lu <daolu@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 0/2] (attempt to) Fix RISC-V toolchain extension support
 detection
Message-ID: <20221017155103.4dt5uzmnlbtibqcn@kamzik>
References: <20221006173520.1785507-1-conor@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221006173520.1785507-1-conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_085108_469811_E9DB5360 
X-CRM114-Status: GOOD (  35.57  )
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

On Thu, Oct 06, 2022 at 06:35:19PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Hey,
> This came up due to a report from Kevin @ kernel-ci, who had been
> running a mixed configuration of GNU binutils and clang. Their compiler
> was relatively recent & supports Zicbom but binutils @ 2.35.2 did not.
> 
> Our current checks for extension support only cover the compiler, but it
> appears to me that we need to check both the compiler & linker support
> in case of "pot-luck" configurations that mix different versions of
> LD,AS,CC etc.
> 
> Linker support does not seem possible to actually check, since the ISA
> string is emitted into the object files - so I put in version checks for
> that. The checks have gotten a bit ugly since 32 & 64 bit support need
> to be checked independently but ahh well.
> 
> As I was going, I fell into the trap of there being duplicated checks
> for CC support in both the Makefile and Kconfig, so as part of renaming
> the Kconfig symbol to TOOLCHAIN_HAS_FOO, I dropped the extra checks in
> the Makefile. This has the added advantage of the TOOLCHAIN_HAS_FOO
> symbol for Zihintpause appearing in .config.
> 
> I pushed out a version of this that specificly checked for assember
> support for LKP to test & it looked /okay/ - but I did some more testing
> today and realised that this is redudant & have since dropped the as
> check.
> 
> I tested locally with a fair few different combinations, to try and
> cover each of AS, LD, CC missing support for the extension.
> 
> The one that I am left wondering about is Zicsr/Zifencei. Our Makefile
> has:
> 
> > # Newer binutils versions default to ISA spec version 20191213 which moves some
> > # instructions from the I extension to the Zicsr and Zifencei extensions.
> > toolchain-need-zicsr-zifencei := $(call cc-option-yn, -march=$(riscv-march-y)_zicsr_zifencei)
> > riscv-march-$(toolchain-need-zicsr-zifencei) := $(riscv-march-y)_zicsr_zifencei
> 
> I'd like to also move that one to Kconfig rather than the Makefile so
> that, again, it shows up in .config etc. But as Zicsr/Zifencei do not
> appear to be emitted into the object files it's not a fix and can be a
> follow-on patch if my approach here is not entirely off-the-wall.
> 
> I am not 100% on the LD/LLD versions that I picked, I went off of a
> `git branch -a --contains` of the first commits I found that with
> mention of the extension. Please scream if I got it wrong, I'm not
> overly familar with where to find this sort of info for the toolchains.
> 
> Thanks,
> Conor.
> 
> Conor Dooley (2):
>   riscv: fix detection of toolchain Zicbom support
>   riscv: fix detection of toolchain Zihintpause support
> 
>  arch/riscv/Kconfig                      | 17 +++++++++++++----
>  arch/riscv/Makefile                     |  6 ++----
>  arch/riscv/include/asm/vdso/processor.h |  2 +-
>  3 files changed, 16 insertions(+), 9 deletions(-)
> 
> -- 
> 2.37.3
>

This looks good to me, so

For the series

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

However, we could also drop the compiler and linker checking if we
converted our use of cbo.* to the insn-def.h framework (I think Heiko once
mentioned looking at doing that, but I'm not sure.) I'm looking at adding
Zicboz support right now and for starters I've duplicated and modified
these checks. But, I think I'll look into defining the instruction type
needed for cbo.* and using insn-def instead.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
