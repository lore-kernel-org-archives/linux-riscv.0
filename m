Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D991DC4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 15:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9kBWfUe7um54rBOnWVIQ8mugu4VSN0eOtB20ypJgiGw=; b=bjG5DjYCJlhcvs
	u1tOL7TbFRJ05GZlIECisHJNXl5mmAovu9V8rs/Em2ijivD5iUU6SeFU9UTsconNCm7cSLrTFtM3r
	a6F5GABBzFKYLMI+9k9vQQpBLhycEsNPUhrADJi6Jdyvm9DhQujg/yGsrs/N3kU1yMItlb8WZigSY
	jTfhh3UW3RfvLAjXiLJNkfIkdBtNucKLkXdUgyAdpGevPXnvTey73eONz6Onj5YEiTVIsVtcID7cM
	XXebIQIxIQA9u0gBPBCAySeGxnRftcSyP9Lr1A8EPcxKWVDxRq+SQPGSg/fzSqYiQXvvpP9qIJOQD
	tTe1n2q4o34qbgyUeT3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzeJh-00000004eIG-2G5d;
	Wed, 24 Apr 2024 15:13:49 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzeJd-00000004eHJ-0Yy1
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 15:13:47 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-de45dba15feso7134448276.3
        for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2024 08:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713971623; x=1714576423; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DAuwXMJJnpPJzeS/QdiiNtiBKl3H6rCtZl+q9pQNJBs=;
        b=C+yWrqwV3hdDEZb/OPTlzupbzMQI/N+6+AaPbPCW9qmybMYuanC10LRl1nLt3FPSaf
         SAuKyL0RqQA9ogOcJ7jDiiAgJWDi7ODOg527+a5mJ9hxPKdFVbl5QuL1x+2UAv0BU90d
         KMgNuOfhosGDjl1RgyFOGxj0CyaNOEskK+ZD4FoJAdnHXV7hxo3wOuzht8gObvN0aZvh
         6+dlDNWwpTnbXtslzMyg3bB0YJLAU1jl9FAiGwpQwccfpY2ZxacJxc4a9PxDMU5WwOjB
         PMJ4icN7H6gHOneSJwkzreQ96C6fWQdEjEBNiUpiACMVlUojx6kfU13ljPpNjDaYbeuh
         KEfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713971623; x=1714576423;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DAuwXMJJnpPJzeS/QdiiNtiBKl3H6rCtZl+q9pQNJBs=;
        b=UZQqxaUyN+JvxoNjF2FzLkaN7ohfBRzDwc+B3G6KjCKeCB795jXls6LARQOWs6mH2g
         JXwr5VoOvJ6FRJsvePIOuALim23NKL1d4TTBjubZl9WuAmhyuYWX5B72tBFy2nGaLzIF
         K385iJtuW9SKB5wvhderq6eFIBj2vlYzS00Kc8ISYjM8vTAelTdRlNQGii1bsb12VCAY
         rnrQWyCCql712c2g9ajSYNk2dZnjqg7MkD9tJ3vnqG9ZcjD7mrkjs1Otq6XbunOjCmgV
         7uxPbJosl9/BweQQvVO0qEPbdN4Oszn266TvOQOXUZ5Sg9AZJUAVeXQwCqFDRNxL1qr8
         YjdQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9UIDmCmqW8jPBGYAVAwQcxWj/A9mNkO6yR3V0Qu6L+B18udW21Psl4DG5rzIsLtIyY+pz5CUxb6txMS2mbFY8Kdaq9SqTb67ylwCk21A2
X-Gm-Message-State: AOJu0YxEiaDTUE0KTQqAEQhntXc39Rq9D2ueG+Lw42LnB/CLAmBdEVfI
	W/lH+UdX/YVWU33jcUUXZO44TmSaLcmkOwmof4Zm281z2XsopjJl5kKXkYwJUM4=
X-Google-Smtp-Source: AGHT+IHhTz3fBZ7peK0ohgK/fsX2BIM1DNpAIBuTraurnQaZqdLiFfMgwIqo7gYns2h/SqUcyMxIMQ==
X-Received: by 2002:a05:6902:238a:b0:de5:51d0:9a8d with SMTP id dp10-20020a056902238a00b00de551d09a8dmr3433052ybb.55.1713971622828;
        Wed, 24 Apr 2024 08:13:42 -0700 (PDT)
Received: from ghost ([50.146.0.2])
        by smtp.gmail.com with ESMTPSA id s13-20020a056902120d00b00dc73705ec59sm3141332ybu.0.2024.04.24.08.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 08:13:42 -0700 (PDT)
Date: Wed, 24 Apr 2024 11:13:40 -0400
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>,
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
Subject: Re: [PATCH v3 06/17] riscv: Fix extension subset checking
Message-ID: <ZikhpEgEoMX/rObu@ghost>
References: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
 <20240420-dev-charlie-support_thead_vector_6_9-v3-6-67cff4271d1d@rivosinc.com>
 <6c624361-a968-498b-a9fb-ea2aaec70ce8@ghiti.fr>
 <20240424-wildly-goofy-c81aac6f8cd7@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240424-wildly-goofy-c81aac6f8cd7@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_081345_300331_E2663736 
X-CRM114-Status: GOOD (  25.21  )
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

On Wed, Apr 24, 2024 at 03:51:54PM +0100, Conor Dooley wrote:
> On Wed, Apr 24, 2024 at 04:22:02PM +0200, Alexandre Ghiti wrote:
> > Hi Charlie,
> > 
> > On 21/04/2024 03:04, Charlie Jenkins wrote:
> > > This loop is supposed to check if ext->subset_ext_ids[j] is valid, rather
> > > than if ext->subset_ext_ids[i] is valid, before setting the extension
> > > id ext->subset_ext_ids[j] in isainfo->isa.
> > > 
> > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > Fixes: 0d8295ed975b ("riscv: add ISA extension parsing for scalar crypto")
> > > ---
> > >   arch/riscv/kernel/cpufeature.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > > index 48874aac4871..b537731cadef 100644
> > > --- a/arch/riscv/kernel/cpufeature.c
> > > +++ b/arch/riscv/kernel/cpufeature.c
> > > @@ -609,7 +609,7 @@ static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
> > >   			if (ext->subset_ext_size) {
> > >   				for (int j = 0; j < ext->subset_ext_size; j++) {
> > > -					if (riscv_isa_extension_check(ext->subset_ext_ids[i]))
> > > +					if (riscv_isa_extension_check(ext->subset_ext_ids[j]))
> > >   						set_bit(ext->subset_ext_ids[j], isainfo->isa);
> > >   				}
> > >   			}
> > > 
> > 
> > I think this should go into -fixes, let's check with Palmer if he wants to
> > take this patch only or if you should send the patch on its own.
> 
> I think splitting out this and patch 1 into a new series targeting fixes
> would probably make things clearer?

Okay I can do that. I will give it a bit more time before I send this
series split into two to allow time for the rest of the patches to
gather comments so I avoid sending too many duplicate patches.

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
