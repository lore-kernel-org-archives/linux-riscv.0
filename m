Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780D0C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 17:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5AGZ2ALTXH7rsK+PDa5ZVfoi2FG8SGQAOuSR92rj0Lg=; b=u+Lcu+Dgr2Wr1n
	/AXesipsUwe0RW/8ADcxUlXV56xbyJ6N75IjiXAkBGumaXuLC6iXilXaJQi6ympK9/TV4eM4zCdG2
	1Lw32S65UKIRX50T1y9v+wLNiSzewtpYxDPiwWyw/dc1cx6BnQMKNumR8Q2TBzunXjiK2nGEmnAik
	gYYuoaNiZkuB0BERa624gkPqyghbqjP5w+dNhXJY2yXRlnpo718ONPkzgZn2D9W03hLCTK7mtTc8m
	PDx7QhgJP9i0CpJnUTH2gTIKCtbgd8/ArMbvFpwgC8M1azF9d4UGcFYT9YodoVBShV8slynVpQPnY
	t5NqwP50X62OLIc/T7sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Oyg-0000000DNXB-09hg;
	Fri, 26 Apr 2024 17:03:14 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Oyc-0000000DNVe-0KjJ
	for linux-riscv@lists.infradead.org;
	Fri, 26 Apr 2024 17:03:12 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6ed20fb620fso2201042b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 26 Apr 2024 10:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714150987; x=1714755787; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iQOEs8kmpRBE5AbT4DjWE8lg43hpZ4efabp/bR8JqV4=;
        b=BylhXHO0t06ozb42lrWZcJtgl+oXIHIQi/c6FDdtQTtXaNmRZUAzZiElQokC/FKDBV
         jk004AXm9YECCyqiDr4p7CaeMGatPo8n6pA2ZPhltwOc5UKsDcnGuPrZ98pgN5FNy298
         1SRIyODguQGLQLceILZypflZCcu8eJ16dQf0uGcRFumlQg/kEe2qp8EKF+jshs2ziKhn
         vNz/6Fmz/OhSfkwVgg+2kwX0yy6F8M00TAkA8KsLJ/4iUM4rdKdnjwtRIrIV/diyW38c
         skHdv+8Ms+uJmlquyyN1K1WDSnkULkY6lVTjqpkK0loRVf7xDt8xdYBV7DblHNsjoZFr
         TfvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714150987; x=1714755787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQOEs8kmpRBE5AbT4DjWE8lg43hpZ4efabp/bR8JqV4=;
        b=Ql5jirWoK+zaYdNb8xmDpRDReY4KrNKf73pPTv8EWX9boIFVc1uv6UsRvQIxiWvi77
         quW7v6dYbAO3mAxGWTihWNWKHgMYfMYrScZe2yQzCbBbZszyHl3NhalcR/KpLR3roO2x
         clEH/9nWcSG+vD2T9shFc8Id5FLOGp3UMcdS20Z8A8m3KAgWDPPLrGVe4EDuKuZFDvMp
         THZ6Q5E408WCDa30jUXusZfXEhW8hLRUo7elN2PBnXNwgWZ29KVY4JfLK6pDoDZv2wCz
         5HUczfQEKCllJaKQJtxX9NZ1FZR9wHhGbmsmp2+BN6FN6/DbRRS8pig24dtQrapwlIIi
         N5jQ==
X-Forwarded-Encrypted: i=1; AJvYcCWg5Q6weRup/yWI342qgF9GmKfbITFTOaBLIqITw8dHIv4/rrGsY+YLQNttYW7ElT4K6DHZCHRhYu5+wVxmnwXajsJGSRD5Ogj/dY9qDSMR
X-Gm-Message-State: AOJu0Yy0N9kZUTdEfKrPUzECoQDRqUJ5cfnCz3kCdeHb04Vjmddjz8Nc
	YIOIUdOyNyl2UeVUi+15c8Ld6CE+J29lV8j9u4qLd26fniXPJwmSjgVyuoFx8VE=
X-Google-Smtp-Source: AGHT+IFR6N5kNo831LY2QDvVk1TR2PcWNxJi2WUcYOuXc/kYMYtASUjQSOGqHJvgWIKCX9dNVAjTRg==
X-Received: by 2002:a05:6a20:1050:b0:1ad:7c58:6a74 with SMTP id gt16-20020a056a20105000b001ad7c586a74mr3664735pzc.23.1714150986909;
        Fri, 26 Apr 2024 10:03:06 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:4d29:d34e:e48:a550])
        by smtp.gmail.com with ESMTPSA id i6-20020aa787c6000000b006e6b52eb59asm15022967pfo.126.2024.04.26.10.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 10:03:06 -0700 (PDT)
Date: Fri, 26 Apr 2024 10:03:02 -0700
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
Subject: Re: [PATCH v3 04/17] riscv: vector: Use vlenb from DT
Message-ID: <ZiveRt5Ebw0dvO5h@ghost>
References: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
 <20240420-dev-charlie-support_thead_vector_6_9-v3-4-67cff4271d1d@rivosinc.com>
 <20240426-unfocused-amount-e4e74e66962f@spud>
 <20240426-unfixed-mournful-0a71fb3972b4@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240426-unfixed-mournful-0a71fb3972b4@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_100310_459517_37BCC131 
X-CRM114-Status: GOOD (  32.04  )
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

On Fri, Apr 26, 2024 at 05:21:16PM +0100, Conor Dooley wrote:
> On Fri, Apr 26, 2024 at 04:17:52PM +0100, Conor Dooley wrote:
> > On Sat, Apr 20, 2024 at 06:04:36PM -0700, Charlie Jenkins wrote:
> > > If vlenb is provided in the device tree, prefer that over reading the
> > > vlenb csr.
> > > 
> > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > ---
> > >  arch/riscv/include/asm/cpufeature.h |  2 ++
> > >  arch/riscv/kernel/cpufeature.c      | 26 ++++++++++++++++++++++++++
> > >  arch/riscv/kernel/vector.c          | 13 +++++++++----
> > >  3 files changed, 37 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
> > > index 347805446151..809f61ffb667 100644
> > > --- a/arch/riscv/include/asm/cpufeature.h
> > > +++ b/arch/riscv/include/asm/cpufeature.h
> > > @@ -31,6 +31,8 @@ DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
> > >  /* Per-cpu ISA extensions. */
> > >  extern struct riscv_isainfo hart_isa[NR_CPUS];
> > >  
> > > +extern u32 riscv_vlenb_dt[NR_CPUS];
> > > +
> > >  void riscv_user_isa_enable(void);
> > >  
> > >  #if defined(CONFIG_RISCV_MISALIGNED)
> > > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > > index c6e27b45e192..48874aac4871 100644
> > > --- a/arch/riscv/kernel/cpufeature.c
> > > +++ b/arch/riscv/kernel/cpufeature.c
> > > @@ -35,6 +35,8 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
> > >  /* Per-cpu ISA extensions. */
> > >  struct riscv_isainfo hart_isa[NR_CPUS];
> > >  
> > > +u32 riscv_vlenb_dt[NR_CPUS];
> > > +
> > >  /**
> > >   * riscv_isa_extension_base() - Get base extension word
> > >   *
> > > @@ -656,6 +658,28 @@ static int __init riscv_isa_fallback_setup(char *__unused)
> > >  early_param("riscv_isa_fallback", riscv_isa_fallback_setup);
> > >  #endif
> > >  
> > > +static void riscv_set_vlenb_from_dt(void)
> > 
> > I'd expect to see a name here that had "of" in it, not "dt".
> 
> Also, "set" - I think "get" is more suitable here given that this
> doesn't actually set the vlen, we only do any setting later on in
> riscv_v_set_vsize().
> 
> > 
> > > +{
> > > +	int cpu;
> > > +
> > > +	for_each_possible_cpu(cpu) {
> > > +		struct device_node *cpu_node;
> > > +
> > > +		cpu_node = of_cpu_device_node_get(cpu);
> > > +		if (!cpu_node) {
> > > +			pr_warn("Unable to find cpu node\n");
> > > +			continue;
> > > +		}
> > > +
> > > +		if (!of_property_read_u32(cpu_node, "riscv,vlenb", &riscv_vlenb_dt[cpu])) {
> > > +			of_node_put(cpu_node);
> > > +			continue;
> > > +		}
> > > +
> > > +		of_node_put(cpu_node);
> > > +	}
> > > +}
> > > +
> > >  void __init riscv_fill_hwcap(void)
> > >  {
> > >  	char print_str[NUM_ALPHA_EXTS + 1];
> > > @@ -675,6 +699,8 @@ void __init riscv_fill_hwcap(void)
> > >  	} else {
> > >  		int ret = riscv_fill_hwcap_from_ext_list(isa2hwcap);
> > >  
> > > +		riscv_set_vlenb_from_dt();
> > 
> > Hmm, I think we can go a step further here. We know all of the CPUs
> > widths by the time we get to the first call to riscv_v_setup_vsize(), can
> > we examine the whole list and decide not to enable vector if they do
> > not match, rather than continuing and failing to online CPUs that having
> > the mismatched size?
> > 
> > I guess that can go into the `if (elf_hwcap & COMPAT_HWCAP_ISA_V)`
> > condition we already have, and would require clearing the bit from the
> > mask we have at the moment.

Good point, thank you. Since this is not supported with ACPI, I will
clear the COMPAT_HWCAP_ISA_V bit from elf_hwcap if
riscv_set_vlenb_from_dt() (which will be renamed) determines that the
the riscv,vlenb field changes between CPU entries. 

- Charlie

> > 
> > Cheers,
> > Conor.
> > 
> > > +
> > >  		if (ret && riscv_isa_fallback) {
> > >  			pr_info("Falling back to deprecated \"riscv,isa\"\n");
> > >  			riscv_fill_hwcap_from_isa_string(isa2hwcap);
> > > diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
> > > index 6727d1d3b8f2..fb7f3ca80d9e 100644
> > > --- a/arch/riscv/kernel/vector.c
> > > +++ b/arch/riscv/kernel/vector.c
> > > @@ -32,11 +32,16 @@ EXPORT_SYMBOL_GPL(riscv_v_vsize);
> > >  int riscv_v_setup_vsize(void)
> > >  {
> > >  	unsigned long this_vsize;
> > > +	int cpu = smp_processor_id();
> > >  
> > > -	/* There are 32 vector registers with vlenb length. */
> > > -	riscv_v_enable();
> > > -	this_vsize = csr_read(CSR_VLENB) * 32;
> > > -	riscv_v_disable();
> > > +	if (riscv_vlenb_dt[cpu]) {
> > > +		this_vsize = riscv_vlenb_dt[cpu];
> > 
> > > +	} else {
> > > +		/* There are 32 vector registers with vlenb length. */
> > > +		riscv_v_enable();
> > > +		this_vsize = csr_read(CSR_VLENB) * 32;
> > > +		riscv_v_disable();
> > > +	}
> > >  
> > >  	if (!riscv_v_vsize) {
> > >  		riscv_v_vsize = this_vsize;
> > > 
> > > -- 
> > > 2.44.0
> > > 
> 
> 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
