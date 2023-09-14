Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D8DEEAA4F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 14:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PN2HDBugwkNdre30l6YUmZViZNy2qVAihxKwtjmXCpc=; b=IMGPJsNFNh+eWD
	+TXCs7NDqkKpcfcUjhPnA5WHVH31QygpjgawQFjGhfZLsq6WxDrgQPf9QkXYllL0uT7bwx6ws+4qd
	JkaDrYxFCwGjhhwQZ1kCVkb778yUtn9RmbHgx0MPBgoOknvO9EkcOXCbvFmuXzHpd/jHkh3Iuy+G1
	B9H3DMSlXeC+ERUfsBIMWqVpczq7/POYoF7s2vZj+Kuvq31Nzdy0/EUmcJuYCiFhsIjxsPFVm1vcn
	VAQU5rlVq4ZW66+J0BMab7Mj9UYE96s7ejGIA8G9spgi9SR9zHjAfkMVJxYtGiEDQedrcScoxCXx3
	iqhs2fGF5HB1puvdOFjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgncs-008g6G-0J;
	Thu, 14 Sep 2023 14:47:26 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgnco-008g4Y-2e
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 14:47:24 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-401d6f6b2e0so14206105e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Sep 2023 07:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1694702840; x=1695307640; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vHpWmHejf9EicOnbuTpXQSbFe9gmT4JUPIXQ/pQhLLs=;
        b=LFIyIk5Sub1RuPBFrvkKxsE8sfulTO9dCCINWWeWwNKxBz4fNjAj1LlUVxNMpdZjDK
         ipg9KqOFlS7shSCuwgkfBJcyA9ZAOIDe2eHiMeIwJGJKNRPC/QSun5oloOpbReYZC149
         MGBWAF7NtKYWMkQ3uS+80kMssKEPxXhtJdMKC29xUFHpUb504mIQ2FP9kzf0BnLmnoCK
         Fi8upUd5blZ+zy+gWf9zb3O2z7RhR7619ypPoWhkChp/740aNSmlqEus97SH2s8S6B65
         t2Wj8e3XztN1ynnLBcPRiwkhqPu4oSIy/4Z8qKDEsKlUayNNj8X5YyxbMbcdxtyF7qJ6
         zY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694702840; x=1695307640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vHpWmHejf9EicOnbuTpXQSbFe9gmT4JUPIXQ/pQhLLs=;
        b=WJZjZXIcJIwWZAulTG1NlB6BsVcbZFaT2HvTJr9cKAlFPkhH0fjyqW5ljR16IWjtJX
         pinYZhaiyg8ImkjPqsIjs2Em4HeJqa1jgRSE9eRMGSwPgxYNRbO/2d+Gh5ux82PUzjNS
         tzKhYL3oIC0ty4xpv6v/iSpeIKu49jkOL9T5pxI7cZ5+0hX8cRuHFdc/RWCwKy5gBhSG
         H/7SEFkPG9CMW9ikO7jfKLw5kldRhxbGSxt2QbDRfOcXzrxUwanND8TSwOr68nkd9V/y
         KWVcycqWI151Pj/gW0MoPMcfju3JJjYpFrSFtEHxL6N/Ix4UNhKqeLruLuCVP5DhNPQG
         M/gA==
X-Gm-Message-State: AOJu0YyFpj22V23EsHQlGD7kabrHeBZtrSUPl7M8n5THtlVtfa+7Mmgu
	hpY5m9OdStjzo5NR2SMwsk0Dyw==
X-Google-Smtp-Source: AGHT+IE4vnDXBqfwShidPjq/u140Nh9Lf+YfW3WjJy+bEdPvCUxsYsEPIWnZNVPkTVSDMOA9EX84Jw==
X-Received: by 2002:a05:600c:895:b0:401:b393:da18 with SMTP id l21-20020a05600c089500b00401b393da18mr1795468wmp.6.1694702840548;
        Thu, 14 Sep 2023 07:47:20 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id n7-20020a7bcbc7000000b003fef3180e7asm4996897wmi.44.2023.09.14.07.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 07:47:19 -0700 (PDT)
Date: Thu, 14 Sep 2023 16:47:18 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: guoren@kernel.org
Cc: paul.walmsley@sifive.com, anup@brainfault.org, peterz@infradead.org, 
	mingo@redhat.com, will@kernel.org, palmer@rivosinc.com, longman@redhat.com, 
	boqun.feng@gmail.com, tglx@linutronix.de, paulmck@kernel.org, rostedt@goodmis.org, 
	rdunlap@infradead.org, catalin.marinas@arm.com, conor.dooley@microchip.com, 
	xiaoguang.xing@sophgo.com, bjorn@rivosinc.com, alexghiti@rivosinc.com, 
	keescook@chromium.org, greentime.hu@sifive.com, jszhang@kernel.org, wefu@redhat.com, 
	wuwei2016@iscas.ac.cn, leobras@redhat.com, linux-arch@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	virtualization@lists.linux-foundation.org, linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V11 03/17] riscv: Use Zicbop in arch_xchg when available
Message-ID: <20230914-74d0cf00633c199758ee3450@orel>
References: <20230910082911.3378782-1-guoren@kernel.org>
 <20230910082911.3378782-4-guoren@kernel.org>
 <20230914-892327a75b4b86badac5de02@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230914-892327a75b4b86badac5de02@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_074722_856230_DC7E5B59 
X-CRM114-Status: GOOD (  26.40  )
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

On Thu, Sep 14, 2023 at 04:25:53PM +0200, Andrew Jones wrote:
> On Sun, Sep 10, 2023 at 04:28:57AM -0400, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> > 
> > Cache-block prefetch instructions are HINTs to the hardware to
> > indicate that software intends to perform a particular type of
> > memory access in the near future. Enable ARCH_HAS_PREFETCHW and
> > improve the arch_xchg for qspinlock xchg_tail.
> > 
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > ---
> >  arch/riscv/Kconfig                 | 15 +++++++++++++++
> >  arch/riscv/include/asm/cmpxchg.h   |  4 +++-
> >  arch/riscv/include/asm/hwcap.h     |  1 +
> >  arch/riscv/include/asm/insn-def.h  |  5 +++++
> >  arch/riscv/include/asm/processor.h | 13 +++++++++++++
> >  arch/riscv/kernel/cpufeature.c     |  1 +
> >  6 files changed, 38 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index e9ae6fa232c3..2c346fe169c1 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -617,6 +617,21 @@ config RISCV_ISA_ZICBOZ
> >  
> >  	   If you don't know what to do here, say Y.
> >  
> > +config RISCV_ISA_ZICBOP
> 
> Even if we're not concerned with looping over blocks yet, I think we
> should introduce zicbop block size DT parsing at the same time we bring
> zicbop support to the kernel (it's just more copy+paste from zicbom and
> zicboz). It's a bit annoying that the CMO spec doesn't state that block
> sizes should be the same for m/z/p. And, the fact that m/z/p are all
> separate extensions leads us to needing to parse block sizes for all
> three, despite the fact that in practice they'll probably be the same.

Although, I saw on a different mailing list that Andrei Warkentin
interpreted section 2.7 "Software Discovery" of the spec, which states

"""
The initial set of CMO extensions requires the following information to be
discovered by software:

* The size of the cache block for management and prefetch instructions
* The size of the cache block for zero instructions
* CBIE support at each privilege level

Other general cache characteristics may also be specified in the discovery
mechanism.
"""

as management and prefetch having the same block size and only zero
potentially having a different size. That looks like a reasonable
interpretation to me, too. So, we could maybe proceed with assuming we
can use zicbom_block_size for prefetch, for now. If a platform comes along
that interpreted the spec differently, requiring prefetch block size to
be specified separately, then we'll cross that bridge when we get there.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
