Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BB2C4345F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 19:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZZVHawMBpXlVPVl7ARi3wpBFLdVMW5TiSVEuYQfW6cw=; b=OaSBll/RK4msDX
	H0GCWvwp7FrqGAFbsy4YYbsqsJnuYVB25twRltBTieV0eATcjw3WkT4oDABEZpYpUd7StTFORcmbl
	BeuPci6QUDatIn+ZyibLJ2/cL2OPi3RttQ09dWFjunufM4yK3j1PdA7TxokoZQhtbIRs+aj66qyYO
	Q8yJmW6QCB5nLLbnLEB6q4ccgfaCxAp/awZYmuQfYDJQHU+5XYgEawuNKL6gkbd6THAdz2UshP0Lg
	kMEn0Vd7POsI22OoopCvSo+FaNp3wk9r2XhCz5/9ga313XpskiDZHNF7clGRsjzT7Q88YWafO+NNP
	t7M5r72bpvZTVN0jws5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2Ftn-0000000AY3B-2DSK;
	Wed, 01 May 2024 19:45:51 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2Ftk-0000000AY1l-2yTm
	for linux-riscv@lists.infradead.org;
	Wed, 01 May 2024 19:45:50 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2a559928f46so4818496a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 01 May 2024 12:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714592746; x=1715197546; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j1EbBqpWrfZZxoY9bSkBt1o8FAuASMzz42NrlJzrLQw=;
        b=kugSt6YOsBFgeMIrtmSkkFhQA38CTF++n67dieMgQKUJPa7cskNn53UbEW9zV71Gi9
         yeS2ItnNqebrLje2eORsefNqCFM4JPlJ2Ls+zNunlmsWxPa+KkxUNPNa/MiaNFRzW+Ux
         Kd21w9//HHJD9fpMhhwZeElTAAlMw0wMgBQOGYJEDa9XRLvuMTJmhiVa6SUw2EIEBKem
         z3sXFOKxiOllyfrwlI+eMnYL3kIL7ijpKdDKxolm3ZLM4zOELlxOzBIqdZmTTUND7ToI
         UE4BX4GPPrZNtZX2S9rYMIM4dBMnbo4+QkGuPIl3Lhwx4YYeavhmdYUwQSHpWM/H0m3E
         N/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714592746; x=1715197546;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j1EbBqpWrfZZxoY9bSkBt1o8FAuASMzz42NrlJzrLQw=;
        b=pKBkcakIVjBD20fm6/FtJQ5wMywUasznHA+xDWYEFCUDqCOh7uLiQDzfBAaE9vrRS1
         Z0FjmJ8GZxU+ypnXFydZo1uxqpOjetooRVg9mY1Qzu2iEN+RTZ/g19n+XPTHEwRj2YOi
         wTx7yJIJXx2WQCSAMCs9K2DFUlNsqs6HyUQVyw2OJkZJ11023AT3ie5lVpkSoZBjGL+n
         7I3/5vDTR7DhIYSGhp64HxmBQ2bI70APGYiwzalQo5nbAtpJNVMSVk0CaAfLdqAnKQjc
         K/72b7U1PNwuE8ModpM3GS/THL61+B1U7OCMfX/fmZZxaqtW4TrSC2XRE0/MseatZqWJ
         JmvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqiNrNLjZbgVmZlTTKTOq9+tWGrXYcFbzpoGa4oS1FBCh46GpbJCtOG1LCfd1IBTEVd4TvMutOVJ/Xm7XqTjErj2afQvPHYgYSmbQ9cP9J
X-Gm-Message-State: AOJu0Yx5cTfJuK9zHSvtQkbuRRpd0fczTVUmn06rcjEF19aDxr1kYuBF
	SEKL2UZvqVf5P98TDRXNrZnS13CoFhPG7e5hM2YOLyQsdbH8wpASLRW3d+TGYRg=
X-Google-Smtp-Source: AGHT+IEAo4x8MOTk0rByHOk2fmlXZ3MwLp/YpTWYLg+olqE/2iU7l17JuO1KTk3z+XxlvKBKlVpzRA==
X-Received: by 2002:a17:90a:1309:b0:2ab:e345:4685 with SMTP id h9-20020a17090a130900b002abe3454685mr3536711pja.17.1714592745626;
        Wed, 01 May 2024 12:45:45 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:1dcc:e03e:dc61:895d])
        by smtp.gmail.com with ESMTPSA id bf15-20020a17090b0b0f00b002a2e6fc09b5sm1724376pjb.29.2024.05.01.12.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 12:45:45 -0700 (PDT)
Date: Wed, 1 May 2024 12:45:41 -0700
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
Subject: Re: [PATCH v4 06/16] riscv: Introduce vendor variants of extension
 helpers
Message-ID: <ZjKb5e584UzQxSgT@ghost>
References: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-b692f3c516ec@rivosinc.com>
 <20240426-dev-charlie-support_thead_vector_6_9-v4-6-b692f3c516ec@rivosinc.com>
 <20240501-tripping-acetone-e556e993ba95@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240501-tripping-acetone-e556e993ba95@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_124548_760481_C5024E10 
X-CRM114-Status: GOOD (  30.22  )
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

On Wed, May 01, 2024 at 12:29:56PM +0100, Conor Dooley wrote:
> On Fri, Apr 26, 2024 at 02:29:20PM -0700, Charlie Jenkins wrote:
> 
> > index c073494519eb..dd7e8e0c0af1 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -844,25 +844,41 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
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
> > +		/*
> > +		 * Any alternative with a patch_id that is less than
> > +		 * RISCV_ISA_EXT_MAX is interpreted as a standard extension.
> > +		 *
> > +		 * Any alternative with patch_id that is greater than or equal
> > +		 * to RISCV_VENDOR_EXT_ALTERNATIVES_BASE is interpreted as a
> > +		 * vendor extension.
> 
> I think this stuff is all fine, since we can always re-jig things in the
> future if needs be.
> 
> > +		 */
> > +		if (id < RISCV_ISA_EXT_MAX) {
> > +			/*
> > +			 * This patch should be treated as errata so skip
> > +			 * processing here.
> > +			 */
> > +			if (alt->vendor_id != 0)
> > +				continue;
> > +
> > +			if (!__riscv_isa_extension_available(NULL, id))
> > +				continue;
> > +		} else if (id >= RISCV_VENDOR_EXT_ALTERNATIVES_BASE) {
> > +			if (!__riscv_isa_vendor_extension_available(VENDOR_EXT_ALL_CPUS, vendor, id))
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
> 
> I wonder if we care to implement a non __ prefixed version of this, like
> the standard stuff? The only __ version users of the standard one are in
> kvm and core arch code, the "external" users all use the non-prefixed
> version.

In vendor_extensions.h there is:

#define riscv_isa_vendor_extension_available(vendor, ext)	\
	__riscv_isa_vendor_extension_available(VENDOR_EXT_ALL_CPUS, vendor, \
					       RISCV_ISA_VENDOR_EXT_##ext)


> 
> In any case,
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks!

- Charlie

> 
> Cheers,
> Conor.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
