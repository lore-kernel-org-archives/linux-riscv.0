Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94032C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 20:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sc4pqa0O5uHaido3oIJwkywo0veY6rTULWcJfqg9cCU=; b=AMSEYNf/jP0BG3
	5IB9rkO3e1wJHCVQEnnDz6dO8mNK7XeF6bSYOco3lRmquIxP1hPFoAaDGuhVLCEYY7adnGi2CugDN
	cK4d5p6NxIq1DHeI/ZlbjbMxtwLoulelDM6I0+F9IHeeRUFE7tapbhyVNvsxE9C9wENns4aXmL8CL
	c6tRbVU8EtRIcyXueJ/z0T32Ebdt+lDC10SAheaVlQOLR4JepbS6QvI9jg64dOU2/TRWgr1IuoHqN
	ko6TmulCTrhSTvbb6vppGoDuHtEzND4/VzZMtALCvPcXLoknNTt6Qlz8KuGYAZtTJOnLZsfhM7omM
	RQQWtIJfovrsfWOBiFrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0SH5-0000000Dxfz-0jdI;
	Fri, 26 Apr 2024 20:34:27 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0SH2-0000000Dxf5-1VfX
	for linux-riscv@lists.infradead.org;
	Fri, 26 Apr 2024 20:34:25 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6f30f69a958so2317773b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 26 Apr 2024 13:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714163663; x=1714768463; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RkjMMC1FpMNzMmAfWu9fZYy+vsjEC1qcX67/IWoyWAU=;
        b=CDD63cEmg/f/iAPm0EEIrOoNg89aot2pt4pqK9ILYh7MANG9uTRxNkuQhVk/D1o5nm
         uBN8lsoALMPA4yZI4uC+wyzeMZqzcWVeFyDFcblBykC+w6nrrYb8OosfsdTyVlio55Jt
         G3LPUvUqn7b1AxrgQ0vQbKjWaxUMh0bS2UVCm4y+OiNmu70A/GKW+3TRMeu3gc0d5lbE
         od09eGiIHNcHCa8ohbsonJmclxX200IW7HKbOXdY1vXTbnZTGywxkRFRqJmAZFY4rCl8
         B5fxZBTpDIlqqL2xcUQeUmpJQBLwoZimGtLiJtl4GXkBUgBBoNoHF6akBD+Kh2MrptRV
         OsZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714163663; x=1714768463;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkjMMC1FpMNzMmAfWu9fZYy+vsjEC1qcX67/IWoyWAU=;
        b=dLPLSZBF5W67esw6xRGT8G/Msx5eqlNHpfWShLziZYEsuaQmGKXjG82yQSbwy+Nmz+
         iEBS8S94cLJqvqWSa55rJ7grOwzAfP0K6wvMG6CCAtF/yxgqz6R8vn+JVjhnq1h05Md4
         Yy3YssPhO3lZoX5Qep8ZS0487xuZC2JpSTc5zSWy/kBjK1hUqHKavNGCZapoFQtFcScW
         m9BRZnwvtvvwe/snZAeSCVx++nIqurChabvg9ou1h4ZaGwUJin2BGF/wJsf2pL0pXKsM
         2xNywwbW+q73s1n9fHZX07YpUe1/pRNPkSSO9U22xNZkXqy7+bqPxCp8vgPc35ya8rq5
         lK4A==
X-Forwarded-Encrypted: i=1; AJvYcCXjYapT2j7tQm9EDIfzCREY/06bbCtcBEEpNcdnHuQ/BA5GYyUOdQVFwz++OsML93qZwaifUB82avt0UWGWjXMAKkqACurqe1Rf2ioLlsXv
X-Gm-Message-State: AOJu0YwESTCwkeKa6Fq1euzvqb/ENrg8A6EXAdZZ34ACqaKzI3iykXn4
	d2Kb4KYgCFazc5fIKapq8ULoWl1WMEYyB2zimQvWik+axl65CuMszZWq4U95DAw=
X-Google-Smtp-Source: AGHT+IEvgUD/PdkO6EG/DCqCKciIHZlITQ+dtQj+SWgo8Fagf2mpBkl6Knmfmn7mLkCXbfb7r7pDbw==
X-Received: by 2002:a05:6a20:3ca3:b0:1a9:b3e9:a62c with SMTP id b35-20020a056a203ca300b001a9b3e9a62cmr4797475pzj.48.1714163663081;
        Fri, 26 Apr 2024 13:34:23 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:3b15:3aba:70a1:7ce9])
        by smtp.gmail.com with ESMTPSA id fv3-20020a056a00618300b006eb3c3db4afsm15223011pfb.186.2024.04.26.13.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 13:34:22 -0700 (PDT)
Date: Fri, 26 Apr 2024 13:34:19 -0700
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
Subject: Re: [PATCH v3 09/17] riscv: drivers: Convert xandespmu to use the
 vendor extension framework
Message-ID: <ZiwPyyBK2br8yKei@ghost>
References: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
 <20240420-dev-charlie-support_thead_vector_6_9-v3-9-67cff4271d1d@rivosinc.com>
 <20240426-venue-maximum-f78ac451b146@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240426-venue-maximum-f78ac451b146@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_133424_432575_30DDA21E 
X-CRM114-Status: GOOD (  24.81  )
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

On Fri, Apr 26, 2024 at 05:25:20PM +0100, Conor Dooley wrote:
> On Sat, Apr 20, 2024 at 06:04:41PM -0700, Charlie Jenkins wrote:
> > Migrate xandespmu out of riscv_isa_ext and into a new Andes-specific
> > vendor namespace.
> > diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> > index 8cbe6e5f9c39..84760ce61e03 100644
> > --- a/drivers/perf/riscv_pmu_sbi.c
> > +++ b/drivers/perf/riscv_pmu_sbi.c
> > @@ -24,6 +24,8 @@
> >  #include <asm/errata_list.h>
> >  #include <asm/sbi.h>
> >  #include <asm/cpufeature.h>
> > +#include <asm/vendorid_list.h>
> > +#include <asm/vendor_extensions/andes.h>
> >  
> >  #define ALT_SBI_PMU_OVERFLOW(__ovl)					\
> >  asm volatile(ALTERNATIVE_2(						\
> > @@ -32,7 +34,7 @@ asm volatile(ALTERNATIVE_2(						\
> >  		THEAD_VENDOR_ID, ERRATA_THEAD_PMU,			\
> >  		CONFIG_ERRATA_THEAD_PMU,				\
> >  	"csrr %0, " __stringify(ANDES_CSR_SCOUNTEROF),			\
> > -		0, RISCV_ISA_EXT_XANDESPMU,				\
> > +		ANDES_VENDOR_ID, RISCV_ISA_VENDOR_EXT_XANDESPMU,	\
> >  		CONFIG_ANDES_CUSTOM_PMU)				\
> >  	: "=r" (__ovl) :						\
> >  	: "memory")
> > @@ -41,7 +43,7 @@ asm volatile(ALTERNATIVE_2(						\
> >  asm volatile(ALTERNATIVE(						\
> >  	"csrc " __stringify(CSR_IP) ", %0\n\t",				\
> >  	"csrc " __stringify(ANDES_CSR_SLIP) ", %0\n\t",			\
> > -		0, RISCV_ISA_EXT_XANDESPMU,				\
> > +		ANDES_VENDOR_ID, RISCV_ISA_VENDOR_EXT_XANDESPMU,	\
> >  		CONFIG_ANDES_CUSTOM_PMU)				\
> >  	: : "r"(__irq_mask)						\
> >  	: "memory")
> > @@ -837,7 +839,7 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, struct platform_device *pde
> >  		   riscv_cached_mimpid(0) == 0) {
> >  		riscv_pmu_irq_num = THEAD_C9XX_RV_IRQ_PMU;
> >  		riscv_pmu_use_irq = true;
> > -	} else if (riscv_isa_extension_available(NULL, XANDESPMU) &&
> > +	} else if (riscv_isa_vendor_extension_available(-1, XANDESPMU) &&
> 
> What's the rationale for this not using riscv_has_extension_unlikely()?
> Happens once in probe so don't bother? I forget if we discussed it when
> the code was added, but it would save us from the NULL/-1 syntax,
> neither of which I think is a good interface.

Doesn't look like something that was ever commented on in the series,
but I may have missed it. I can change this to use the alternatives.

This also wasn't supposed to be -1, it's supposed to be the id of the
vendor.

> 
> Also, I'd prob drop the "drivers" from $subject.
> 
> I'll come back and look at the rest of this Monday, it's a sunny Friday
> here and I've still got my devicetree patch queue to clear..
> 

- Charlie

> Cheers,
> Conor.
> 
> >  		   IS_ENABLED(CONFIG_ANDES_CUSTOM_PMU)) {
> >  		riscv_pmu_irq_num = ANDES_SLI_CAUSE_BASE + ANDES_RV_IRQ_PMOVI;
> >  		riscv_pmu_use_irq = true;
> > 
> > -- 
> > 2.44.0
> > 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
