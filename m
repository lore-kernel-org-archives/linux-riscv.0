Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC9CEE6457
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 12:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6os7OPXXgIpHKFh6xBjS7Op2y7socaUl2HUGnTBOz3s=; b=tnqr8gVjskhzG+
	bO5OaPlxWgK/aTd79gaIx+d7olzDxJyXA29IxceSUTafPvUAHQDoHjgAfd9MN0+7RCo21DYDDeEvN
	GbAfQpxBsxn4xGSTFvvQQHnqaf4AIS0SDDmg5V0gLhJP2/aeP//C3c0uGqM5izXkqQMkwIbRAc4ci
	3497NoogUwgry8/8QmW0QuiZXMmgZUIy/dRNkcglouY4KUb/+BJHWCsynU7m36nuXtSe7UM7Igmnh
	7fxXFfpDyhRtnV9+ngHy1JzoyxvXnoC6+VdFkosATVRhWiZWThkQBncJWHP8RIX+1mYnJWbMMoKc9
	TnLH48YRvoMLF/xNHhUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh7ih-00Ahfz-2K;
	Fri, 15 Sep 2023 12:14:47 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh7if-00Ahei-0B
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 12:14:46 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-52a5c0d949eso2377321a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 05:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1694780082; x=1695384882; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=szs0z99Qb90KUWcFs/6Ik8kAwcoyMXLC77ZFiHuCf3w=;
        b=XSAq2c8oFLva7CBn9mkTTpZ8tI+/Zg7rDA/t4gPWgaaK5JvQ2Q+jh/KExawPkZTxmF
         dFa6oIcp0DywOePKnvIg72c4m1YPD+0MZQWsqlX6po6bTQcv5Gi92su22FH/mRd8V68i
         /emS3LRRRh14+ggJRVZN8ugGhb108TqqwHS+GbJj2lLui7dNWzzZtSMwFrn2dUz0Pzfa
         bcdsZXwzs1Jj9ZuU7kxsjmanfFOS31V0GwBF3xdZkeu5P2SQuQcn4mTwUY46WBPNX+o4
         6BUAC0Umw5DyW1vzg1nacQM7qwdP9H0kr2bWSG6DGVCtayzB9scxXuIxD+9GmqMq9jF5
         L3lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694780082; x=1695384882;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=szs0z99Qb90KUWcFs/6Ik8kAwcoyMXLC77ZFiHuCf3w=;
        b=w55vUTZNYXXbH5e47bafEbOPaT3qwOQa0RyYIPMj8hYEPt0Uzn5f+COEboiwbum5MF
         u2aQCPJhhOB1YR1lXl0OM5xldwY53AEkEtHAKVDy3GzvtL14wvpbMFi/i5Ax57ZmMhzj
         05w4eQROBcJp38v2tqktWpxVcBFLa1D1tQ9gDAvi1eMvuQyINk30Ag/LaNhbYY1vL+nY
         7+f1eZ8yaUYumBXPpIMjr3yKICUB/t2gk9KCkIyCo6fFaUOJ22/xmpxicfMYZSVfE2LQ
         R6Zv50jG9rbSJz06cp7VUwGMEn+s9Jv81WbhdtKb78WQ+18mzpJu9iUuePYlY9fweoMj
         XrDQ==
X-Gm-Message-State: AOJu0YyLDi6BDG7+KJ5oYezWElfl8FjmMiEUznISVNoTWKmy7nfTCmIN
	54yJskjRSq1WQulSMUeRXlyJRg==
X-Google-Smtp-Source: AGHT+IGJZenyDQYnb3LjVAUFoWcYxvrgK5cLrtdOozPVvSraBAlkkM7GZOO5BDI5gIu6HsXU6mBNpQ==
X-Received: by 2002:aa7:d699:0:b0:522:30cc:a1f4 with SMTP id d25-20020aa7d699000000b0052230cca1f4mr1309802edr.0.1694780082187;
        Fri, 15 Sep 2023 05:14:42 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id o7-20020aa7d3c7000000b005233deb30aesm2196718edr.10.2023.09.15.05.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 05:14:41 -0700 (PDT)
Date: Fri, 15 Sep 2023 14:14:40 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: guoren@kernel.org, paul.walmsley@sifive.com, anup@brainfault.org, 
	peterz@infradead.org, mingo@redhat.com, will@kernel.org, palmer@rivosinc.com, 
	longman@redhat.com, boqun.feng@gmail.com, tglx@linutronix.de, paulmck@kernel.org, 
	rostedt@goodmis.org, rdunlap@infradead.org, catalin.marinas@arm.com, 
	xiaoguang.xing@sophgo.com, bjorn@rivosinc.com, alexghiti@rivosinc.com, 
	keescook@chromium.org, greentime.hu@sifive.com, jszhang@kernel.org, wefu@redhat.com, 
	wuwei2016@iscas.ac.cn, leobras@redhat.com, linux-arch@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	virtualization@lists.linux-foundation.org, linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V11 03/17] riscv: Use Zicbop in arch_xchg when available
Message-ID: <20230915-ff4bd6cd721ed9bc4c4eb101@orel>
References: <20230910082911.3378782-1-guoren@kernel.org>
 <20230910082911.3378782-4-guoren@kernel.org>
 <20230914-892327a75b4b86badac5de02@orel>
 <20230914-74d0cf00633c199758ee3450@orel>
 <20230915-removing-flaky-44c66da669ae@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230915-removing-flaky-44c66da669ae@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_051445_104323_EC5FE8FF 
X-CRM114-Status: GOOD (  45.31  )
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

On Fri, Sep 15, 2023 at 12:37:50PM +0100, Conor Dooley wrote:
> Yo,
> 
> On Thu, Sep 14, 2023 at 04:47:18PM +0200, Andrew Jones wrote:
> > On Thu, Sep 14, 2023 at 04:25:53PM +0200, Andrew Jones wrote:
> > > On Sun, Sep 10, 2023 at 04:28:57AM -0400, guoren@kernel.org wrote:
> > > > From: Guo Ren <guoren@linux.alibaba.com>
> > > > 
> > > > Cache-block prefetch instructions are HINTs to the hardware to
> > > > indicate that software intends to perform a particular type of
> > > > memory access in the near future. Enable ARCH_HAS_PREFETCHW and
> > > > improve the arch_xchg for qspinlock xchg_tail.
> > > > 
> > > > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > > > Signed-off-by: Guo Ren <guoren@kernel.org>
> > > > ---
> > > >  arch/riscv/Kconfig                 | 15 +++++++++++++++
> > > >  arch/riscv/include/asm/cmpxchg.h   |  4 +++-
> > > >  arch/riscv/include/asm/hwcap.h     |  1 +
> > > >  arch/riscv/include/asm/insn-def.h  |  5 +++++
> > > >  arch/riscv/include/asm/processor.h | 13 +++++++++++++
> > > >  arch/riscv/kernel/cpufeature.c     |  1 +
> > > >  6 files changed, 38 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > > index e9ae6fa232c3..2c346fe169c1 100644
> > > > --- a/arch/riscv/Kconfig
> > > > +++ b/arch/riscv/Kconfig
> > > > @@ -617,6 +617,21 @@ config RISCV_ISA_ZICBOZ
> > > >  
> > > >  	   If you don't know what to do here, say Y.
> > > >  
> > > > +config RISCV_ISA_ZICBOP
> > > 
> > > Even if we're not concerned with looping over blocks yet, I think we
> > > should introduce zicbop block size DT parsing at the same time we bring
> > > zicbop support to the kernel (it's just more copy+paste from zicbom and
> > > zicboz). It's a bit annoying that the CMO spec doesn't state that block
> > > sizes should be the same for m/z/p. And, the fact that m/z/p are all
> > > separate extensions leads us to needing to parse block sizes for all
> > > three, despite the fact that in practice they'll probably be the same.
> > 
> > Although, I saw on a different mailing list that Andrei Warkentin
> > interpreted section 2.7 "Software Discovery" of the spec, which states
> > 
> > """
> > The initial set of CMO extensions requires the following information to be
> > discovered by software:
> > 
> > * The size of the cache block for management and prefetch instructions
> > * The size of the cache block for zero instructions
> > * CBIE support at each privilege level
> > 
> > Other general cache characteristics may also be specified in the discovery
> > mechanism.
> > """
> > 
> > as management and prefetch having the same block size and only zero
> > potentially having a different size. That looks like a reasonable
> > interpretation to me, too.
> 
> TBH, I don't really care what ambiguous wording the spec has used, we
> have the opportunity to make better decisions if we please. I hate the
> fact that the specs are often not abundantly clear about things like this.
> 
> > So, we could maybe proceed with assuming we
> > can use zicbom_block_size for prefetch, for now. If a platform comes along
> > that interpreted the spec differently, requiring prefetch block size to
> > be specified separately, then we'll cross that bridge when we get there.
> 
> That said, I think I suggested originally having the zicboz stuff default
> to the zicbom size too, so I'd be happy with prefetch stuff working
> exclusively that way until someone comes along looking for different sizes.
> The binding should be updated though since
> 
>   riscv,cbom-block-size:
>     $ref: /schemas/types.yaml#/definitions/uint32
>     description:
>       The blocksize in bytes for the Zicbom cache operations.
> 
> would no longer be a complete description.
> 
> While thinking about new wording though, it feels really clunky to describe
> it like:
> 	The block size in bytes for the Zicbom cache operations, Zicbop
> 	cache operations will default to this block size where not
> 	explicitly defined.
> 
> since there's then no way to actually define the block size if it is
> different. Unless you've got some magic wording, I'd rather document
> riscv,cbop-block-size, even if we are going to use riscv,cbom-block-size
> as the default.
>

Sounds good to me, but if it's documented, then we should probably
implement its parsing. Then, at that point, I wonder if it makes sense to
have the fallback at all, or if it's not better just to require all the
DTs to be explicit (even if redundant).

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
