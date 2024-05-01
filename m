Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4252FC10F1A
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 16:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SFQSqcWcgLWDkOy9xBkQquVSWGGyZ/t/MCzhFm9VjuU=; b=cR1J9seJ4GHEBV
	07XJ3dGrS8Vn8oYZ64O2fJ6+NuQG5PoYushPYMR+kZgwOW+xHZiAtVK3u+KH+YE1NiRWY9lSXE0qW
	bldTZKwuth4HLDDgHgj2gVGJ+78teXys8DMRSwZIFFvBD88pJN2Nib6YJEx3PnZnMkNbZn79qlCe4
	rXljIX2Arn5WwSS30TgRKvuan4f+GIpeeDziNH43q44RaEFZQrIu05b/WpnaIw0EpNWzAa7x9ljjS
	72xFLl43uJvWN7njkt5TPnFoZzi67JdRVt6iNcFgx3yXXxpAMC9nPINNR/WHyyLHg3TdF8PZ+A8pY
	jM89ApRtr7c55e7zUsOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2D60-0000000ACUv-18eN;
	Wed, 01 May 2024 16:46:16 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2D5x-0000000ACTp-1LX9
	for linux-riscv@lists.infradead.org;
	Wed, 01 May 2024 16:46:14 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2b38f2e95aeso2012a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 01 May 2024 09:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714581970; x=1715186770; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HNAlEVQt8bQKb4hVjkj/tzVzfjylPjyKPm1CNtyCLJI=;
        b=Bf2HOaDjLP/bOm8DUzNaNPX2V3Y87j0vD8q3+Mp8zsw/RMkC3nzuh3dI3lwQVd4o9e
         TLJ7QsFDY1OiOn0dpDbG9Ix7AZJ9iioysK+5uy0ULIoztnM4ZUwltb0aILbcKoem4qgX
         RemLKlFBBaQZ/JQHgOMZt/GQ3D5JMhQ3sVSCV9AVum0yrPlOWOg+Gch95iaF8zL+tNK4
         xWExXdQ7Di+Nd7MOIgztC+YntupIB/2VRCXpskausxOmpr5HqMOXUUiKoEYX/xJ04+32
         f9nxhfd0h4g/qwGSuczS1K/guxYgCBhwvcgUbgDeJ9Zj6j1X4k6zu1ki809+PGmHTnuV
         CMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714581970; x=1715186770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNAlEVQt8bQKb4hVjkj/tzVzfjylPjyKPm1CNtyCLJI=;
        b=Rcy0vo9fn/VzExhSoGc6fS2Is96G5Xz5Ljml5KmA3WWDj/nZOzLeBGWoyktgrh0fdV
         ibLHuJeIOI86a9EIYHtN+GcR5lLZ/WWVan9zBF3toJsN9AAQmALq9t/gKHSlIRbLqXzn
         M4gi0ONjvVUILgBpiuZe1NSYYzd3hc8GAFJzYG5cpjd6vIgice4taSiS+KGySi7pKP81
         XSZ7GFw6WiFaPblgVgfB0hbipm+ZMHu27MqqtttiCxcI0snfVyEZpFCy+87mEet5TQI5
         exMi+YESOPQGeZEljmclXRgP+x3jKsSEd5lKx4Js/GglfZnZz3IYDvfREObB/6tSrvCM
         Dh9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWTReWAVbIXm28tOoDQmfZuFpJCHgpngL8bXIK4xvRD/uwy8hzUoElZiVPfN9Ymw8LiZl9SjaiUXElZCUjkjPwdpyTTdlNYfNpV07GW75Za
X-Gm-Message-State: AOJu0Yxi/73OL2PIBBRvTQ6jqcIuFbEYnLa0fsmTzJ5+OnCxq2deoeY9
	gzQLTJ6OpXRG8qERF/E8qPsjUMYE4gTPjgnluo2PfvJ7ccA9cLZufNzFR9PnZYk=
X-Google-Smtp-Source: AGHT+IH65t3T7Cre6ETXiixVNrR9oMbdBgpbTRkUxmtEpcotJ4qRMx/UYqqnRRVgQ7nCUV3kiM8/gw==
X-Received: by 2002:a17:90a:c78f:b0:2a5:3f30:f5f6 with SMTP id gn15-20020a17090ac78f00b002a53f30f5f6mr274501pjb.20.1714581969579;
        Wed, 01 May 2024 09:46:09 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:1dcc:e03e:dc61:895d])
        by smtp.gmail.com with ESMTPSA id g2-20020a170902934200b001e25da6f2f2sm24328716plp.68.2024.05.01.09.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 09:46:08 -0700 (PDT)
Date: Wed, 1 May 2024 09:46:04 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 03/16] riscv: vector: Use vlenb from DT
Message-ID: <ZjJxzKUHkrVUv9zm@ghost>
References: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-b692f3c516ec@rivosinc.com>
 <20240426-dev-charlie-support_thead_vector_6_9-v4-3-b692f3c516ec@rivosinc.com>
 <20240501-showroom-rephrase-66c0929011b3@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240501-showroom-rephrase-66c0929011b3@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_094613_387651_87EC131F 
X-CRM114-Status: GOOD (  36.97  )
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

On Wed, May 01, 2024 at 11:31:45AM +0100, Conor Dooley wrote:
> On Fri, Apr 26, 2024 at 02:29:17PM -0700, Charlie Jenkins wrote:
> > If vlenb is provided in the device tree, prefer that over reading the
> > vlenb csr.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/cpufeature.h |  2 ++
> >  arch/riscv/kernel/cpufeature.c      | 43 +++++++++++++++++++++++++++++++++++++
> >  arch/riscv/kernel/vector.c          | 12 ++++++++++-
> >  3 files changed, 56 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
> > index 347805446151..0c4f08577015 100644
> > --- a/arch/riscv/include/asm/cpufeature.h
> > +++ b/arch/riscv/include/asm/cpufeature.h
> > @@ -31,6 +31,8 @@ DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
> >  /* Per-cpu ISA extensions. */
> >  extern struct riscv_isainfo hart_isa[NR_CPUS];
> >  
> > +extern u32 riscv_vlenb_of;
> > +
> >  void riscv_user_isa_enable(void);
> >  
> >  #if defined(CONFIG_RISCV_MISALIGNED)
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 3ed2359eae35..8158f34c3e36 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -35,6 +35,8 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
> >  /* Per-cpu ISA extensions. */
> >  struct riscv_isainfo hart_isa[NR_CPUS];
> >  
> > +u32 riscv_vlenb_of;
> > +
> >  /**
> >   * riscv_isa_extension_base() - Get base extension word
> >   *
> > @@ -648,6 +650,42 @@ static int __init riscv_isa_fallback_setup(char *__unused)
> >  early_param("riscv_isa_fallback", riscv_isa_fallback_setup);
> >  #endif
> >  
> > +static int riscv_homogeneous_vlenb(void)
> 
> Without a verb, this function name is rather odd.
> 

Maybe has_riscv_homogeneous_vlenb() is better.

> > +{
> > +	int cpu;
> > +	u32 prev_vlenb = 0;
> > +	u32 vlenb;
> > +
> > +	for_each_possible_cpu(cpu) {
> > +		struct device_node *cpu_node;
> > +
> > +		cpu_node = of_cpu_device_node_get(cpu);
> > +		if (!cpu_node) {
> > +			pr_warn("Unable to find cpu node\n");
> > +			continue;
> 
> Hmm, if we fail to find the cpu node, then shouldn't we be returning an
> error?

Yes, I will change that.

> 
> > +		}
> > +
> > +		if (of_property_read_u32(cpu_node, "riscv,vlenb", &vlenb)) {
> > +			of_node_put(cpu_node);
> > +
> > +			if (prev_vlenb)
> > +				return -1;
> 
> Can you return an errno here and below please?
> 

Sounds good.

> > +			continue;
> > +		}
> > +
> > +		if (prev_vlenb && vlenb != prev_vlenb) {
> > +			of_node_put(cpu_node);
> > +			return -1;
> > +		}
> > +
> > +		prev_vlenb = vlenb;
> > +		of_node_put(cpu_node);
> > +	}
> > +
> > +	riscv_vlenb_of = vlenb;
> > +	return 0;
> > +}
> > +
> >  void __init riscv_fill_hwcap(void)
> >  {
> >  	char print_str[NUM_ALPHA_EXTS + 1];
> > @@ -671,6 +709,11 @@ void __init riscv_fill_hwcap(void)
> >  			pr_info("Falling back to deprecated \"riscv,isa\"\n");
> >  			riscv_fill_hwcap_from_isa_string(isa2hwcap);
> >  		}
> > +
> > +		if (riscv_homogeneous_vlenb() < 0) {
> > +			pr_warn("RISCV_ISA_V only supports one vlenb on SMP systems. Please ensure that the riscv,vlenb devicetree property is the same across all CPUs. Either all CPUs must have the riscv,vlenb property, or none. If no CPUs in the devicetree use riscv,vlenb then vlenb will be probed from the vlenb CSR. Disabling vector.\n");
> 
> Oh dear, that's a bit unwieldy... I think you could get away with a far
> more basic message - and you should be able to break this over lines,
> adjacent string literals should get concatenated.
> I'd probably say something like "unsupported heterogeneous vlen detected,
> vector extension disabled", however we should actually check that the
> vector extension has been detected on all CPUs and that kernel support
> for vector is enabled before emitting a warning for this.

Haha yeah I wanted to provide as much information as possible, but I
will shorten it.

I can add an if-statement to only run this code if check if V is
contained in elf_hwcap.

- Charlie

> 
> Cheers,
> Conor.
> 
> > +			elf_hwcap &= ~COMPAT_HWCAP_ISA_V;
> > +		}
> >  	}
> >  
> >  	/*
> > diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
> > index 6727d1d3b8f2..e04586cdb7f0 100644
> > --- a/arch/riscv/kernel/vector.c
> > +++ b/arch/riscv/kernel/vector.c
> > @@ -33,7 +33,17 @@ int riscv_v_setup_vsize(void)
> >  {
> >  	unsigned long this_vsize;
> >  
> > -	/* There are 32 vector registers with vlenb length. */
> > +	/*
> > +	 * There are 32 vector registers with vlenb length.
> > +	 *
> > +	 * If the riscv,vlenb property was provided by the firmware, use that
> > +	 * instead of probing the CSRs.
> > +	 */
> > +	if (riscv_vlenb_of) {
> > +		this_vsize = riscv_vlenb_of * 32;
> > +		return 0;
> > +	}
> > +
> >  	riscv_v_enable();
> >  	this_vsize = csr_read(CSR_VLENB) * 32;
> >  	riscv_v_disable();
> > 
> > -- 
> > 2.44.0
> > 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
