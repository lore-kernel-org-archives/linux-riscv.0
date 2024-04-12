Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A7CC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 17:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4FSbNHe6RJl19tRtsfFndKwPtYXMQEpzVXDW8b5c5Yc=; b=ftyMFL7JXaL0mG
	cZfCcoIZcVkGs8dv1skEN4nDksS+0cUbSdEPQBJWqqECxEcDV52YQGKR5YqnVcWf0lI75LJkBUpYX
	GEwPaBAegk0vsmupTbuBtaJaHce9IjIv9VQ8vLJhqWkW1dZ5XtvBCMowPBP0/kjy3La160lzaGaUr
	cBUOStXifUDQe0ZORbq6NVVgoV72EqeJZuMsGhpURGP+pU8+3iQrTQfEV8JEzTS9cSPSdCxKv2Mkf
	R1g2nkIlm+ZNZRIGVV+9LzD5EqKGF0GYxQub3a7EhzAFWyHaxPDSNhngpEv8pN+QSs2inRAT3B2vo
	LpJKrw4qq6k7M6hEdaIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvKvg-00000000ias-1ddK;
	Fri, 12 Apr 2024 17:43:12 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvKvc-00000000iZS-40ZC
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 17:43:10 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1e4266673bbso10502835ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 12 Apr 2024 10:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712943786; x=1713548586; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8YRvEt+OTF00KrpCNHpUGlZ7toxHUQ85PqnBkH5iiOI=;
        b=jbpjdEmKBEWIbLneWFvix7/nL0LxC7Ee6RK5CpqanbCnVOcRSLiZJBtkkfjdF4TSnE
         yw+XjWa+dRt46JlF4JcS0/C/4D2KQ+ftnTiqFhWc5Kx/3jvhF3c8ziOJ2l14UJTHDTmT
         nCAfBE3ad0C3i0oHcH53YUeLVeUeBLSKcYbifnfwxew2G9ofqAeiZuYFHW1c/DJC7xN6
         czbv32eD+J4Fr2+ZXbtelHuQGCWf9V3EkFU5p1VlIuJCET5OtXkdRkhN/Dr7MWsepEqx
         OURkKtMWr8xcGnY+bNaNwKPtyh2HyiHNJvhk/ZRNHlW9PNsMevwN+vvRt+DwsZdocMyL
         zMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712943786; x=1713548586;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8YRvEt+OTF00KrpCNHpUGlZ7toxHUQ85PqnBkH5iiOI=;
        b=EJcNUKKaXjHOU3U+Ft2hlUxFVVM/SE5UV9Z6/Ci1DnOqUCDHDcGkLsdy0LGnH96Qpf
         o/eUx+oStvX8s5dun/l7rsbUSx6vK4hxW0Spcp/OphiqNsUaU7puEo6aGiaLwjnpBwNB
         QXMEfVwDeH6Sd73ZhPjwsnvNuHAoAO6LTftaiBH6VnTblAK0cQrv3G7ihhNQ+5IGbjVa
         QzG0vGcJcNZgT/pnBWDMBQOXP69cVMekSP6KP5OdeK5qtdJTF+6msIJ6fmmJLL4XvBWo
         ekgQfEK0d58Qv6kn+9n6lrmbOj1by95rLX3/noT3yyj95MCICLhXkfcjqA89euHYQ/V2
         /tHA==
X-Forwarded-Encrypted: i=1; AJvYcCXmVlmwcNSkL9loXX5NewD1ABvu0XS9v+6OzT/gZxkWvNQk5df1kARk+0M+uV+p0DdAQzFwzDIqnEd86lmDjH8jWN2EsyT/BRPatisAa1fj
X-Gm-Message-State: AOJu0YyRvxzaXnCpk7UTb5of6gewt3wYQ+kB8J4yenmoMMDcDznQNFsH
	6JYAXcoYtl6V9IuvjikKKYb3O8msTRegYhUSiUk3X1kDymF5K8vdYfrfaG9zpx4=
X-Google-Smtp-Source: AGHT+IE1KS+cgoHgP39ECdNzoJBDC8vTl8/0G5V7240HCpKQkDUzHJq76jMWfkj5KFoeGRTzjJqSZQ==
X-Received: by 2002:a17:902:d303:b0:1e0:bae4:48f9 with SMTP id b3-20020a170902d30300b001e0bae448f9mr3205407plc.32.1712943785937;
        Fri, 12 Apr 2024 10:43:05 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:121b:da6b:94f1:304])
        by smtp.gmail.com with ESMTPSA id h9-20020a170902f2c900b001e0e5722788sm3287804plc.17.2024.04.12.10.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 10:43:05 -0700 (PDT)
Date: Fri, 12 Apr 2024 10:43:02 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 08/19] riscv: Introduce vendor variants of extension
 helpers
Message-ID: <ZhlypvTdsFPZBr08@ghost>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-8-4af9815ec746@rivosinc.com>
 <20240412-dwarf-shower-5a7300fcd283@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240412-dwarf-shower-5a7300fcd283@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_104309_024217_90B1733F 
X-CRM114-Status: GOOD (  28.63  )
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

On Fri, Apr 12, 2024 at 12:49:57PM +0100, Conor Dooley wrote:
> On Thu, Apr 11, 2024 at 09:11:14PM -0700, Charlie Jenkins wrote:
> > Create vendor variants of the existing extension helpers. If the
> > existing functions were instead modified to support vendor extensions, a
> > branch based on the ext value being greater than
> > RISCV_ISA_VENDOR_EXT_BASE would have to be introduced. This additional
> > branch would have an unnecessary performance impact.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> 
> I've not looked at the "main" patch in the series that adds all of the
> probing and structures for representing this info yet beyond a cursory
> glance, but it feels like we're duplicating a bunch of infrastructure
> here before it is necessary. The IDs are all internal to Linux, so I'd
> rather we kept everything in the same structure until we have more than
> a handful of vendor extensions. With this patch (and the theadpmu stuff)
> we will have three vendor extensions which feels like a drop in the
> bucket compared to the standard ones.

It is not duplicating infrastructure. If we merge this into the existing
infrastructure, we would be littering if (ext > RISCV_ISA_VENDOR_EXT_BASE)
in __riscv_isa_extension_available. This is particularily important
exactly because we have so few vendor extensions currently so this check
would be irrelevant in the vast majority of cases.

It is also unecessary to push off the refactoring until we have some
"sufficient" amount of vendor extensions to deem changing the
infrastructure when I already have the patch available here. This does
not introduce any extra overhead to existing functions and will be able
to support vendors into the future.

- Charlie

> 
> 
> > ---
> >  arch/riscv/include/asm/cpufeature.h | 54 +++++++++++++++++++++++++++++++++++++
> >  arch/riscv/kernel/cpufeature.c      | 34 ++++++++++++++++++++---
> >  2 files changed, 84 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
> > index db2ab037843a..8f19e3681b4f 100644
> > --- a/arch/riscv/include/asm/cpufeature.h
> > +++ b/arch/riscv/include/asm/cpufeature.h
> > @@ -89,6 +89,10 @@ bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, unsigned i
> >  #define riscv_isa_extension_available(isa_bitmap, ext)	\
> >  	__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_##ext)
> >  
> > +bool __riscv_isa_vendor_extension_available(const unsigned long *vendor_isa_bitmap, unsigned int bit);
> > +#define riscv_isa_vendor_extension_available(isa_bitmap, ext)	\
> > +	__riscv_isa_vendor_extension_available(isa_bitmap, RISCV_ISA_VENDOR_EXT_##ext)
> > +
> >  static __always_inline bool
> >  __riscv_has_extension_likely_alternatives(const unsigned long ext)
> >  {
> > @@ -117,6 +121,8 @@ __riscv_has_extension_unlikely_alternatives(const unsigned long ext)
> >  	return true;
> >  }
> >  
> > +/* Standard extension helpers */
> > +
> >  static __always_inline bool
> >  riscv_has_extension_likely(const unsigned long ext)
> >  {
> > @@ -163,4 +169,52 @@ static __always_inline bool riscv_cpu_has_extension_unlikely(int cpu, const unsi
> >  		return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
> >  }
> >  
> > +/* Vendor extension helpers */
> > +
> > +static __always_inline bool
> > +riscv_has_vendor_extension_likely(const unsigned long ext)
> > +{
> > +	compiletime_assert(ext < RISCV_ISA_VENDOR_EXT_MAX,
> > +			   "ext must be < RISCV_ISA_VENDOR_EXT_MAX");
> > +
> > +	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
> > +		return __riscv_has_extension_likely_alternatives(ext);
> > +	else
> > +		return __riscv_isa_vendor_extension_available(NULL, ext);
> > +}
> > +
> > +static __always_inline bool
> > +riscv_has_vendor_extension_unlikely(const unsigned long ext)
> > +{
> > +	compiletime_assert(ext < RISCV_ISA_VENDOR_EXT_MAX,
> > +			   "ext must be < RISCV_ISA_VENDOR_EXT_MAX");
> > +
> > +	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
> > +		return __riscv_has_extension_unlikely_alternatives(ext);
> > +	else
> > +		return __riscv_isa_vendor_extension_available(NULL, ext);
> > +}
> > +
> > +static __always_inline bool riscv_cpu_has_vendor_extension_likely(int cpu, const unsigned long ext)
> > +{
> > +	compiletime_assert(ext < RISCV_ISA_VENDOR_EXT_MAX,
> > +			   "ext must be < RISCV_ISA_VENDOR_EXT_MAX");
> > +
> > +	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
> > +		return __riscv_has_extension_likely_alternatives(ext);
> > +	else
> > +		return __riscv_isa_vendor_extension_available(hart_isa_vendor[cpu].isa, ext);
> > +}
> > +
> > +static __always_inline bool riscv_cpu_has_vendor_extension_unlikely(int cpu, const unsigned long ext)
> > +{
> > +	compiletime_assert(ext < RISCV_ISA_VENDOR_EXT_MAX,
> > +			   "ext must be < RISCV_ISA_VENDOR_EXT_MAX");
> > +
> > +	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
> > +		return __riscv_has_extension_unlikely_alternatives(ext);
> > +	else
> > +		return __riscv_isa_vendor_extension_available(hart_isa_vendor[cpu].isa, ext);
> > +}
> 
> Same stuff about constant folding applies to these, I think these should
> just mirror the existing functions (if needed at all).
> 
> Cheers,
> Conor.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
