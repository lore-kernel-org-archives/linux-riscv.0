Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 171C0EEAA45
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 14:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fh9gwQJEzGVW1NuAoWEcL7yFud5MzhRgpqOPebo4gPU=; b=UKP1hYkb+SV2vD
	6AJFELzyNTdXK77xAuL1v7E+tRGZ98cKTB6Nwdj4bopC/pWrl550eovBrojN5zN13+vOXXxjCkvue
	YNqwiJLTKD7Nd7FJ5A5sOzpmYZiBduTvJK27rZK/lb974nyMUhH92C6LDIAYTqOd2pHJqbYlQjd7e
	P4rkpxtK6uaV0C+woltXkJ5IMGMK+R84infxU3ClIRJD3lx3nMsS04jtCuZ4uwwSQcdNc+qIMn1Ws
	DcbO48OySeMbXIF2oxY7VEcMHnlSasrB/Nhw0ZwH7VqE0eFAX3W0S9eoC4ylbvgO/fcv/xKywNZje
	brB79Dn3iPcAR5xaTD4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgnII-008dEA-1l;
	Thu, 14 Sep 2023 14:26:10 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgnIB-008dCC-2m
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 14:26:08 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40078c4855fso10638665e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 14 Sep 2023 07:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1694701560; x=1695306360; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YG4jj4GnceKWHFc9CDsOyyvWCOlMS/zle7Y09KSgtKI=;
        b=XaNjSqCBLKEMfy2C/a916JbcZy4cxgruj2xwxZ5OjwDMPaCHMlsoEZkINJBJyq1NRp
         O/LW53T11YbcYV/47HUzn3At8cFsCadiW/4XQuidC2H6I92rSxtJ/xxu4AAUyKjklT4c
         ey/7b0RiDGmgbb8Z7FJRS8II82Djklu1foiFgTAz4GKpImBvtnbYWwJUUFFvnLZmZs6p
         XFmOIIwMtiyKy07E1XNTZZSZhWGvLTsLAndP1ZWdSOgR0VVNiUSgmS6h5XZuhBas7qbc
         N8r20j5A1UmaLHfLuYA8jL+t1ksvMseelwaK0YgyviViZbJ4QADdnCvOZyUtpZib1VAR
         JAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694701560; x=1695306360;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YG4jj4GnceKWHFc9CDsOyyvWCOlMS/zle7Y09KSgtKI=;
        b=UEG+asTQSaNtPsLAzW9E0xv2j9LAq2u1DcCxN2vmZXiC2vFF5b8usQHyfC9FZawhgY
         5in6i+ELjz0DKY1XlAuZ/1+MZUthI9PYrLsPYbkMlAYuTkEpTpesB15vMAmadjTiaLgO
         aBpnEB59RIfUrtoE2et+A+wiOiuyQFQg1aF397P4MzMBzQvUL9ZXJwnXuBAsnRaOtpOM
         mh/qT+JEbZ70mDiQJnzxeS7S+E8pE1CgBOFnAoPcYWGBGdm7VYvtgqSF0R8yrZHpI8wM
         Z+bUtBjs13jRqJDnhMuUVpbtTjBleWPRNsgkbqBMpfq7hp1TEkAXy37mbaWsruiOD7mC
         PBSA==
X-Gm-Message-State: AOJu0YxtqvKAYtVfxsXI0QAOt/YRZs46XBKOCvzqZwn/SEGVvEuuDfu2
	K5SXV+t04JV8SfYk4bL4ayoe0Q==
X-Google-Smtp-Source: AGHT+IFWc50omqudDyR0Nh+pUUfbse+nkODV23h/mlFUP8m4u/vojRIjASaeifFA7VSOhcKfy6pcrw==
X-Received: by 2002:a05:600c:c8:b0:402:f5c2:c6d9 with SMTP id u8-20020a05600c00c800b00402f5c2c6d9mr5110748wmm.37.1694701559948;
        Thu, 14 Sep 2023 07:25:59 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id f7-20020adff987000000b0031c8a43712asm1914525wrr.69.2023.09.14.07.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 07:25:59 -0700 (PDT)
Date: Thu, 14 Sep 2023 16:25:53 +0200
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
Message-ID: <20230914-892327a75b4b86badac5de02@orel>
References: <20230910082911.3378782-1-guoren@kernel.org>
 <20230910082911.3378782-4-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230910082911.3378782-4-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_072603_904046_AB016D26 
X-CRM114-Status: GOOD (  19.87  )
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

On Sun, Sep 10, 2023 at 04:28:57AM -0400, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Cache-block prefetch instructions are HINTs to the hardware to
> indicate that software intends to perform a particular type of
> memory access in the near future. Enable ARCH_HAS_PREFETCHW and
> improve the arch_xchg for qspinlock xchg_tail.
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
>  arch/riscv/Kconfig                 | 15 +++++++++++++++
>  arch/riscv/include/asm/cmpxchg.h   |  4 +++-
>  arch/riscv/include/asm/hwcap.h     |  1 +
>  arch/riscv/include/asm/insn-def.h  |  5 +++++
>  arch/riscv/include/asm/processor.h | 13 +++++++++++++
>  arch/riscv/kernel/cpufeature.c     |  1 +
>  6 files changed, 38 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index e9ae6fa232c3..2c346fe169c1 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -617,6 +617,21 @@ config RISCV_ISA_ZICBOZ
>  
>  	   If you don't know what to do here, say Y.
>  
> +config RISCV_ISA_ZICBOP

Even if we're not concerned with looping over blocks yet, I think we
should introduce zicbop block size DT parsing at the same time we bring
zicbop support to the kernel (it's just more copy+paste from zicbom and
zicboz). It's a bit annoying that the CMO spec doesn't state that block
sizes should be the same for m/z/p. And, the fact that m/z/p are all
separate extensions leads us to needing to parse block sizes for all
three, despite the fact that in practice they'll probably be the same.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
