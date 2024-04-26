Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D5CAC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 20:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UasBB5xam2VrM2cChAUfXWU28YRo0Ff+Hjt8fKpIxGQ=; b=OiHaluwVXL4MPl
	rOnRXVQB+ajFaCqVoTpieYZoG9nDllPxqiYyEGU4vCF+7NMnBv6IJ8dokaCzbRzuDloy7FzMxvNxw
	nxNkXhO9NlTHomscIiaMqegHGu3ENEuLiFFtPYaAAjjYRyP5QBgkRsRl+kIZ+hbMxig1MI+x4qqDz
	ty2JvYZlT35hXRnW4tv29m2wICMsemJ7FIr9HYaT9icg9tZcDAWdLsr+fmvbewCwTe5/sJhgJwuGV
	Sl5p1tvlbFuSJbKE25CEXyX7kVeYBG6gh5Zs2zFJ8busDHvVPzre+Wl/NoQJ3bm8PpgZcPpIHr+pm
	xhfBV6LhUK8K/4Jig4YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Rl3-0000000Dt8a-2oyW;
	Fri, 26 Apr 2024 20:01:21 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Rl0-0000000Dt7R-3WCk
	for linux-riscv@lists.infradead.org;
	Fri, 26 Apr 2024 20:01:20 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5dbcfa0eb5dso2139792a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 26 Apr 2024 13:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714161676; x=1714766476; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=raghWWuWmM/5TZJC4kDKpgJQ4hXCQAZ4Q/dcRR9ZX90=;
        b=wo8ZITAl04xavUoYNCpTXEj9ziilvbK/M0MeQoh2ca77YXMcwFY7jPPYMwbbUR0re1
         eVlZ9ehZkADk+rqVBVP6tgHN82VSEJPb+6tQc2Z3s4BvxZHsnk+Ep7AkaHFzUmllUAtH
         FRcsrtqfNfvxAXoTpMJJ/4sLhXEE2zUjb44oqGimlaM8SoQwT3h0BSYt+xMysGk2Y5n0
         bBCQfaXBasnNOsaowfZ98E+v/GRWuZ48fb6WRkZRVKrgs4oLGCMKNMfH0NW4OM9XSuE4
         Zdl/1+979Uq7xDaS2UjVb13Xznh4VZFdqizMP3RwsCYuFW1KAxxm/OdQt7I3NDYehCMV
         nzfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714161676; x=1714766476;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=raghWWuWmM/5TZJC4kDKpgJQ4hXCQAZ4Q/dcRR9ZX90=;
        b=fIfT3tmfg1bF35kTh2Px3OvWpePS86ouPVTP/R8ZGrFEpwsKpBe0VZVC0nviN+q/YA
         xABNwJ69SxR5Ph84mbkbTxVYKc/1QQyGyzatCkNpH+xBYV1UQZ376FXR+W+HCufFQS1+
         G6d7pAGZy3YJcdibiTlw2nOIDHKHOa6FpZiXGkbPzJX1haK1+xWD+veuqJ7qr2u7qXum
         k+5IMJJ1uIrTUvkP/pUah7aHGM8EtpYFxeUA2FcsN0eZuACrF9AaZ/yMSPHI+0eb44C+
         gLJKUW9qaARt3NN+jenKkCw3/SdEhL1x+I/34RhJsuErYk5RDmmdinnEg0XHWylwWEb9
         TOVg==
X-Forwarded-Encrypted: i=1; AJvYcCUslum59wW/sy+kRsIeaf70DY4venfz2pXA0zG99NaO/aLUi/Al3HvZu4eh4D7JNv1cNpdUE9xM/yzOW4dOpZavoEwZtd4oNbCQeTrWCT/U
X-Gm-Message-State: AOJu0Yz5tqd4POdwrGKlMImOAvMmkZ652R2ynkUoo49A80aA1oLmW/2E
	Pp4b4iacyqTFwKVYZXVzBdBA48J78v+rgRW2OOMT9uHeDQmON2mqaqGiVou2gn5G0XtgWcCNzu8
	8
X-Google-Smtp-Source: AGHT+IGZxLUwYQbkZfhTACgCMYLPnuJOtrr+IfS6fDS+sMRgvJF5Hn9EpqDDgcmVhTluvK+/7Qvf6w==
X-Received: by 2002:a17:90b:3741:b0:2a5:395e:8673 with SMTP id ne1-20020a17090b374100b002a5395e8673mr674149pjb.5.1714161675889;
        Fri, 26 Apr 2024 13:01:15 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:3b15:3aba:70a1:7ce9])
        by smtp.gmail.com with ESMTPSA id u6-20020a17090a5e4600b002a5d71d48e8sm16583852pji.39.2024.04.26.13.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 13:01:14 -0700 (PDT)
Date: Fri, 26 Apr 2024 13:01:10 -0700
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
Subject: Re: [PATCH v3 08/17] riscv: Introduce vendor variants of extension
 helpers
Message-ID: <ZiwIBmlaDbYdmv8f@ghost>
References: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
 <20240420-dev-charlie-support_thead_vector_6_9-v3-8-67cff4271d1d@rivosinc.com>
 <20240426-myself-crowbar-99dc0a080cd9@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240426-myself-crowbar-99dc0a080cd9@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_130119_043864_5832D246 
X-CRM114-Status: GOOD (  36.23  )
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

On Fri, Apr 26, 2024 at 05:19:59PM +0100, Conor Dooley wrote:
> On Sat, Apr 20, 2024 at 06:04:40PM -0700, Charlie Jenkins wrote:
> > Vendor extensions are maintained in per-vendor structs (separate from
> > standard extensions which live in riscv_isa). Create vendor variants for
> > the existing extension helpers to interface with the riscv_isa_vendor
> > bitmaps.
> 
> > There is a good amount of overlap between these functions, so
> > the alternative checking code can be factored out.
> 
> Can you please split this out?

Sure.

> 
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  arch/riscv/errata/sifive/errata.c          |  3 ++
> >  arch/riscv/errata/thead/errata.c           |  3 ++
> >  arch/riscv/include/asm/cpufeature.h        | 86 +++++++++++++++++-------------
> >  arch/riscv/include/asm/vendor_extensions.h | 56 +++++++++++++++++++
> >  arch/riscv/kernel/cpufeature.c             | 20 ++++---
> >  arch/riscv/kernel/vendor_extensions.c      | 40 ++++++++++++++
> >  6 files changed, 164 insertions(+), 44 deletions(-)
> > 
> > diff --git a/arch/riscv/errata/sifive/errata.c b/arch/riscv/errata/sifive/errata.c
> > index 3d9a32d791f7..b29b6e405ff2 100644
> > --- a/arch/riscv/errata/sifive/errata.c
> > +++ b/arch/riscv/errata/sifive/errata.c
> > @@ -12,6 +12,7 @@
> >  #include <asm/alternative.h>
> >  #include <asm/vendorid_list.h>
> >  #include <asm/errata_list.h>
> > +#include <asm/vendor_extensions.h>
> >  
> >  struct errata_info_t {
> >  	char name[32];
> > @@ -99,6 +100,8 @@ void sifive_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
> >  	for (alt = begin; alt < end; alt++) {
> >  		if (alt->vendor_id != SIFIVE_VENDOR_ID)
> >  			continue;
> > +		if (alt->patch_id >= RISCV_VENDOR_EXT_ALTERNATIVES_BASE)
> > +			continue;
> >  		if (alt->patch_id >= ERRATA_SIFIVE_NUMBER) {
> >  			WARN(1, "This errata id:%d is not in kernel errata list", alt->patch_id);
> >  			continue;
> > diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
> > index b1c410bbc1ae..d8e78cc687bc 100644
> > --- a/arch/riscv/errata/thead/errata.c
> > +++ b/arch/riscv/errata/thead/errata.c
> > @@ -18,6 +18,7 @@
> >  #include <asm/io.h>
> >  #include <asm/patch.h>
> >  #include <asm/vendorid_list.h>
> > +#include <asm/vendor_extensions.h>
> >  
> >  static bool errata_probe_pbmt(unsigned int stage,
> >  			      unsigned long arch_id, unsigned long impid)
> > @@ -163,6 +164,8 @@ void thead_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
> >  	for (alt = begin; alt < end; alt++) {
> >  		if (alt->vendor_id != THEAD_VENDOR_ID)
> >  			continue;
> > +		if (alt->patch_id >= RISCV_VENDOR_EXT_ALTERNATIVES_BASE)
> > +			continue;
> 
> >  		if (alt->patch_id >= ERRATA_THEAD_NUMBER)
> 
> This number is 2, how does the patching actually work for vendor stuff
> when the base is always greater than 2?
> 

Patching is handled through the patcher at the end of cpufeature.c. The
vendor_id field is set in the alternatives for errata and now also for
vendor extensions. The vendor extension patching is all handled
generically.

This is distinguished by the patch_id being greater than
RISCV_VENDOR_EXT_ALTERNATIVES_BASE, which should leave way more than
enough room for errata ids. Since the code already checks if the
patch_id is greater than the errata number, I can drop the
"if (alt->patch_id >= RISCV_VENDOR_EXT_ALTERNATIVES_BASE)" check.

> >  			continue;
> >  
> > diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
> > index db6a6d7d6b2e..83e1143db9ad 100644
> > --- a/arch/riscv/include/asm/cpufeature.h
> > +++ b/arch/riscv/include/asm/cpufeature.h
> > @@ -103,22 +103,13 @@ bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, unsigned i
> >  	__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_##ext)
> >  
> >  static __always_inline bool
> > -riscv_has_extension_likely(const unsigned long ext)
> > +__riscv_has_extension_likely_alternatives(const unsigned long vendor, const unsigned long ext)
> >  {
> > -	compiletime_assert(ext < RISCV_ISA_EXT_MAX,
> > -			   "ext must be < RISCV_ISA_EXT_MAX");
> > -
> > -	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
> > -		asm goto(
> > -		ALTERNATIVE("j	%l[l_no]", "nop", 0, %[ext], 1)
> > -		:
> > -		: [ext] "i" (ext)
> > -		:
> > -		: l_no);
> > -	} else {
> > -		if (!__riscv_isa_extension_available(NULL, ext))
> > -			goto l_no;
> > -	}
> > +	asm goto(ALTERNATIVE("j	%l[l_no]", "nop", %[vendor], %[ext], 1)
> > +	:
> > +	: [vendor] "i" (vendor), [ext] "i" (ext)
> > +	:
> > +	: l_no);
> >  
> >  	return true;
> >  l_no:
> > @@ -126,42 +117,65 @@ riscv_has_extension_likely(const unsigned long ext)
> >  }
> >  
> >  static __always_inline bool
> > -riscv_has_extension_unlikely(const unsigned long ext)
> > +__riscv_has_extension_unlikely_alternatives(const unsigned long vendor, const unsigned long ext)
> 
> ngl, I think you could drop the _alternatives from these - the
> likely/unlikely is only actually a thing because of the alternatives in
> the first place & just retain the __ as a differentiator. That'd help
> you with some of the long-line wrangling you've been doing below.
> 

Sounds good.

> >  {
> > -	compiletime_assert(ext < RISCV_ISA_EXT_MAX,
> > -			   "ext must be < RISCV_ISA_EXT_MAX");
> > -
> > -	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
> > -		asm goto(
> > -		ALTERNATIVE("nop", "j	%l[l_yes]", 0, %[ext], 1)
> > -		:
> > -		: [ext] "i" (ext)
> > -		:
> > -		: l_yes);
> > -	} else {
> > -		if (__riscv_isa_extension_available(NULL, ext))
> > -			goto l_yes;
> > -	}
> > +	asm goto(ALTERNATIVE("nop", "j	%l[l_yes]", %[vendor], %[ext], 1)
> > +	:
> > +	: [vendor] "i" (vendor), [ext] "i" (ext)
> > +	:
> > +	: l_yes);
> >  
> >  	return false;
> >  l_yes:
> >  	return true;
> >  }
> >  
> > +static __always_inline bool
> > +riscv_has_extension_likely(const unsigned long ext)
> 
> Can you format this so that its on one line & wrap the arguments if
> needs be?
> 
> > +{
> > +	compiletime_assert(ext < RISCV_ISA_EXT_MAX,
> > +			   "ext must be < RISCV_ISA_EXT_MAX");
> > +
> > +	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
> > +		return __riscv_has_extension_likely_alternatives(0, ext);
> > +	else
> 
> I'm almost certain I said this before, but none of the else branches are
> needed here, there's a return in the if branch, so the remainder of the
> function becomes unconditionally executed.

Will fix.

> 
> > +		return __riscv_isa_extension_available(NULL, ext);
> > +}
> > +
> > +static __always_inline bool
> > +riscv_has_extension_unlikely(const unsigned long ext)
> > +{
> > +	compiletime_assert(ext < RISCV_ISA_EXT_MAX,
> > +			   "ext must be < RISCV_ISA_EXT_MAX");
> > +
> > +	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
> > +		return __riscv_has_extension_unlikely_alternatives(0, ext);
> > +	else
> > +		return __riscv_isa_extension_available(NULL, ext);
> > +}
> > +
> >  static __always_inline bool riscv_cpu_has_extension_likely(int cpu, const unsigned long ext)
> >  {
> > -	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) && riscv_has_extension_likely(ext))
> > -		return true;
> > +	compiletime_assert(ext < RISCV_ISA_EXT_MAX,
> > +			   "ext must be < RISCV_ISA_EXT_MAX");
> >  
> > -	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
> > +	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) &&
> > +	    __riscv_has_extension_likely_alternatives(0, ext))
> 
> 0 is meaningless, please make this more understandable using a define of
> some sort.

I'll add a define.

> 
> > +		return true;
> > +	else
> > +		return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
> >  }
> >  
> >  static __always_inline bool riscv_cpu_has_extension_unlikely(int cpu, const unsigned long ext)
> >  {
> > -	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) && riscv_has_extension_unlikely(ext))
> > -		return true;
> > +	compiletime_assert(ext < RISCV_ISA_EXT_MAX,
> > +			   "ext must be < RISCV_ISA_EXT_MAX");
> >  
> > -	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
> > +	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) &&
> > +	    __riscv_has_extension_unlikely_alternatives(0, ext))
> > +		return true;
> > +	else
> > +		return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
> >  }
> >  
> >  #endif
> > diff --git a/arch/riscv/include/asm/vendor_extensions.h b/arch/riscv/include/asm/vendor_extensions.h
> > index 0af1ddd0af70..3e676a96016e 100644
> > --- a/arch/riscv/include/asm/vendor_extensions.h
> > +++ b/arch/riscv/include/asm/vendor_extensions.h
> > @@ -23,4 +23,60 @@ extern const struct riscv_isa_vendor_ext_data_list *riscv_isa_vendor_ext_list[];
> >  
> >  extern const size_t riscv_isa_vendor_ext_list_size;
> >  
> > +/*
> > + * The alternatives need some way of distinguishing between vendor extensions
> > + * and errata. Incrementing all of the vendor extension keys so they are at
> > + * least 0x8000 accomplishes that.
> > + */
> > +#define RISCV_VENDOR_EXT_ALTERNATIVES_BASE	0x8000
> > +
> > +bool __riscv_isa_vendor_extension_available(int cpu, unsigned long vendor, unsigned int bit);
> > +#define riscv_cpu_isa_vendor_extension_available(cpu, vendor, ext)	\
> > +	__riscv_isa_vendor_extension_available(cpu, vendor, RISCV_ISA_VENDOR_EXT_##ext)
> > +#define riscv_isa_vendor_extension_available(vendor, ext)	\
> > +	__riscv_isa_vendor_extension_available(-1, vendor, RISCV_ISA_VENDOR_EXT_##ext)
> > +
> > +static __always_inline bool
> > +riscv_has_vendor_extension_likely(const unsigned long vendor, const unsigned long ext)
> > +{
> > +	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
> > +		return __riscv_has_extension_likely_alternatives(vendor,
> > +								 ext + RISCV_VENDOR_EXT_ALTERNATIVES_BASE);
> > +	else
> > +		return __riscv_isa_vendor_extension_available(-1, vendor, ext);
> > +}
> > +
> > +static __always_inline bool
> > +riscv_has_vendor_extension_unlikely(const unsigned long vendor, const unsigned long ext)
> > +{
> > +	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
> > +		return __riscv_has_extension_unlikely_alternatives(vendor,
> > +								   ext + RISCV_VENDOR_EXT_ALTERNATIVES_BASE);
> > +	else
> > +		return __riscv_isa_vendor_extension_available(-1, vendor, ext);
> > +}
> > +
> > +static __always_inline bool riscv_cpu_has_vendor_extension_likely(const unsigned long vendor,
> > +								  int cpu, const unsigned long ext)
> > +{
> > +	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) &&
> > +	    __riscv_has_extension_likely_alternatives(vendor,
> > +						      ext + RISCV_VENDOR_EXT_ALTERNATIVES_BASE))
> > +		return true;
> > +	else
> > +		return __riscv_isa_vendor_extension_available(cpu, vendor, ext);
> > +}
> > +
> > +static __always_inline bool riscv_cpu_has_vendor_extension_unlikely(const unsigned long vendor,
> > +								    int cpu,
> > +								    const unsigned long ext)
> > +{
> > +	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) &&
> > +	    __riscv_has_extension_unlikely_alternatives(vendor,
> > +							ext + RISCV_VENDOR_EXT_ALTERNATIVES_BASE))
> > +		return true;
> > +	else
> > +		return __riscv_isa_vendor_extension_available(cpu, vendor, ext);
> > +}
> > +
> >  #endif /* _ASM_VENDOR_EXTENSIONS_H */
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index c9f36822e337..17371887abcc 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -833,25 +833,29 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
> >  {
> >  	struct alt_entry *alt;
> >  	void *oldptr, *altptr;
> > -	u16 id, value;
> > +	u16 id, value, vendor;
> >  
> >  	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
> >  		return;
> >  
> >  	for (alt = begin; alt < end; alt++) {
> > -		if (alt->vendor_id != 0)
> > -			continue;
> > -
> >  		id = PATCH_ID_CPUFEATURE_ID(alt->patch_id);
> > +		vendor = PATCH_ID_CPUFEATURE_ID(alt->vendor_id);
> >  
> > -		if (id >= RISCV_ISA_EXT_MAX) {
> > +		if (id < RISCV_ISA_EXT_MAX) {
> 
> I think any reliance on the standard ext max requires a comment
> explaining what the interaction is between it and the vendor stuff.
>

I'll add a comment describing that anything with an id below
RISCV_ISA_EXT_MAX is interpreted as a standard extension and anything
with an id above RISCV_VENDOR_EXT_ALTERNATIVES_BASE will be interpreted
as a vendor extension.

> > +			if (alt->vendor_id != 0)
> > +				continue;
> 
> If this happens, it's a bug, should we be continuing silently?
> 

This indicates that the patch should be treated as errata and that's why
it silently continues. I can add a comment that says that.

- Charlie

> Cheers,
> Conor.
> 
> > +
> > +			if (!__riscv_isa_extension_available(NULL, id))
> > +				continue;
> > +		} else if (id >= RISCV_VENDOR_EXT_ALTERNATIVES_BASE) {
> > +			if (!__riscv_isa_vendor_extension_available(-1, vendor, id))
> > +				continue;
> > +		} else {
> >  			WARN(1, "This extension id:%d is not in ISA extension list", id);
> >  			continue;
> >  		}
> >  
> > -		if (!__riscv_isa_extension_available(NULL, id))
> > -			continue;
> > -
> >  		value = PATCH_ID_CPUFEATURE_VALUE(alt->patch_id);
> >  		if (!riscv_cpufeature_patch_check(id, value))
> >  			continue;
> > diff --git a/arch/riscv/kernel/vendor_extensions.c b/arch/riscv/kernel/vendor_extensions.c
> > index f76cb3013c2d..eced93eec5a6 100644
> > --- a/arch/riscv/kernel/vendor_extensions.c
> > +++ b/arch/riscv/kernel/vendor_extensions.c
> > @@ -3,6 +3,7 @@
> >   * Copyright 2024 Rivos, Inc
> >   */
> >  
> > +#include <asm/vendorid_list.h>
> >  #include <asm/vendor_extensions.h>
> >  #include <asm/vendor_extensions/thead.h>
> >  
> > @@ -16,3 +17,42 @@ const struct riscv_isa_vendor_ext_data_list *riscv_isa_vendor_ext_list[] = {
> >  };
> >  
> >  const size_t riscv_isa_vendor_ext_list_size = ARRAY_SIZE(riscv_isa_vendor_ext_list);
> > +
> > +/**
> > + * __riscv_isa_vendor_extension_available() - Check whether given vendor
> > + * extension is available or not.
> > + *
> > + * @cpu: check if extension is available on this cpu
> > + * @vendor: vendor that the extension is a member of
> > + * @bit: bit position of the desired extension
> > + * Return: true or false
> > + *
> > + * NOTE: When cpu is -1, will check if extension is available on all cpus
> > + */
> > +bool __riscv_isa_vendor_extension_available(int cpu, unsigned long vendor, unsigned int bit)
> > +{
> > +	unsigned long *bmap;
> > +	struct riscv_isainfo *cpu_bmap;
> > +	size_t bmap_size;
> > +
> > +	switch (vendor) {
> > +#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_THEAD
> > +	case THEAD_VENDOR_ID:
> > +		bmap = riscv_isa_vendor_ext_list_thead.vendor_bitmap;
> > +		cpu_bmap = riscv_isa_vendor_ext_list_thead.per_hart_vendor_bitmap;
> > +		bmap_size = riscv_isa_vendor_ext_list_thead.bitmap_size;
> > +		break;
> > +#endif
> > +	default:
> > +		return false;
> > +	}
> > +
> > +	if (cpu != -1)
> > +		bmap = cpu_bmap[cpu].isa;
> > +
> > +	if (bit >= bmap_size)
> > +		return false;
> > +
> > +	return test_bit(bit, bmap) ? true : false;
> > +}
> > +EXPORT_SYMBOL_GPL(__riscv_isa_vendor_extension_available);
> > 
> > -- 
> > 2.44.0
> > 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
