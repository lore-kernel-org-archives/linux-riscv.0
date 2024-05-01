Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5797C4345F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 17:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F0uPq/ThNK4SBQ0FbR7PZlTGMyrk7cG7H88yZHjYgbE=; b=CLJ7s5gZIH/X8A
	3Xgvl1D9+tTmuvhMYW5TuJbuY/v8uoBr2g5ijs/vRRrcJB98Gt8kbuAzVjKU3iys5D+QFLtBpqXYC
	VINYRgWvG2u9tuCEvXDmuXfKL23vUlEc0BVkvvHN0lS4wvQeQ758GBOwu2yDW7Gmb87kWfQmk/ToT
	4HAJQISOUZLQh3LSF06VFoqppezElQqDuHe2IHFbEVEQwzyQSJT6Bm5rIJupx6JgMZnwg6/aBQt2H
	FvY4sLa164DbnWdj1m9qTOWz/Luiz9kMQjwOYUS0mULl/qac60WDeI+tqFzlCMKKcRZyiQRSQeoBC
	Z+6qyK7M0fQwcDEB0j4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2DPZ-0000000AGJ5-28cV;
	Wed, 01 May 2024 17:06:29 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2DPU-0000000AGGo-3X6l
	for linux-riscv@lists.infradead.org;
	Wed, 01 May 2024 17:06:26 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-5f80aa2d4a3so5773541a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 01 May 2024 10:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714583182; x=1715187982; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ulUTnrt0/o6KrpYj4/lKXwggI1Tcz4XFzc+8cliUI0c=;
        b=yK3Iy/R2MC0JGVHOIpdi7pbfIcAznQFUn9g1qjBL2c4kRdvaee97k405MER6t1Y/AY
         MwPBlQlifmqXogx9H0swy4eIVPc3Sm97c54fW35rlL/sVrULzvsl1szV8SvFqUS6Kj2C
         FuAYGsaIfTM/E2plbhXlxqQchKin+Cix8tqduEa415fv7gZO1xhGDN0FSeSN4hTaoAYH
         pjGDqAJUTKjME97/lE6O/weZsxRcgfLUw0AtsuqhlyvP3DvO1/n++9006H7835m+mKRg
         nNIHV441GmZd5jPl8L5rynxhQptAJ3OGf1L4k8LNXeliAVaI7OjcE5nDEXz02JLXaMjg
         cSGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714583182; x=1715187982;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ulUTnrt0/o6KrpYj4/lKXwggI1Tcz4XFzc+8cliUI0c=;
        b=VHkfRw7jrcznSwVLloP3PbYN2pZ686K7qhl6YzaxLCaSv507Q9kYApBXXvZxTb1Rm8
         x6an/2tEXtywisyLAONruxM+nwigWe6iTdh4JsHA/3U5HxvW8pPDSFaAxVqIOSw1edtz
         ePjJ5BL/os9Ix64Fmd5uMsac8ix+40jStoHOXfUql+aDCR1hZflbzAIp6UIlxmGYzRzO
         1DT9E+DhHOO4JstlLo2QRqalXqruC6zuU1bxUCSxYgaWyMrWQ0Nnwo8C2JCCAPBgP6Gs
         gSvG05P3u8RyvQhsCGQHRHlC2QEJj7/iw2WTQ+/LbNuo55k/lt7plIz/7npzH5kuVevK
         726Q==
X-Forwarded-Encrypted: i=1; AJvYcCXCwOhdGNnAyhCHwQr4gToK2prW3xMtbBejsp0y+bIrjm4xGkQ6lnvdlpdtGcDZDnp7gDFBz556BVOpPY4aAmjsFvSJahHOrXm3Gnw5BMQS
X-Gm-Message-State: AOJu0YxxatutQZtuK25pVDdiRd0vbsZevFDDGPTzC7eUwr8zaxdZfkm0
	Go5vn1SPSO1TAbooH5tAjhfku/13SGLX0ihXWf6LkXiYgMWRB5BUMhjPDj/OWH0=
X-Google-Smtp-Source: AGHT+IGbQ99FfsOuQfbPD1HKb4OFUev7bCmbhruunbIFw2+vddc7cv9+d7D2Uj+7TUiDOOY0K6p1lQ==
X-Received: by 2002:a17:90a:f493:b0:2b2:d001:db41 with SMTP id bx19-20020a17090af49300b002b2d001db41mr2837033pjb.40.1714583181995;
        Wed, 01 May 2024 10:06:21 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:1dcc:e03e:dc61:895d])
        by smtp.gmail.com with ESMTPSA id db5-20020a17090ad64500b002a53b33afa3sm1593854pjb.8.2024.05.01.10.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 10:06:21 -0700 (PDT)
Date: Wed, 1 May 2024 10:06:18 -0700
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
Subject: Re: [PATCH v4 05/16] riscv: Extend cpufeature.c to detect vendor
 extensions
Message-ID: <ZjJ2irS2ornhzeYc@ghost>
References: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-b692f3c516ec@rivosinc.com>
 <20240426-dev-charlie-support_thead_vector_6_9-v4-5-b692f3c516ec@rivosinc.com>
 <20240501-pelican-throwaway-da84be7dac30@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240501-pelican-throwaway-da84be7dac30@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_100624_969902_A62DD784 
X-CRM114-Status: GOOD (  28.08  )
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

On Wed, May 01, 2024 at 12:19:34PM +0100, Conor Dooley wrote:
> On Fri, Apr 26, 2024 at 02:29:19PM -0700, Charlie Jenkins wrote:
> > @@ -353,6 +336,10 @@ static void __init riscv_parse_isa_string(unsigned long *this_hwcap, struct risc
> >  		bool ext_long = false, ext_err = false;
> >  
> >  		switch (*ext) {
> > +		case 'x':
> > +		case 'X':
> > +			pr_warn_once("Vendor extensions are ignored in riscv,isa. Use riscv,isa-extensions instead.");
> > +			continue;
> 
> Yeah, so this is not right - you need to find the end of the extension
> before containing - for example if I had a system with
> rv64imafdcxconorkwe, you get something like:
> [    0.000000] CPU with hartid=0 is not available
> [    0.000000] Falling back to deprecated "riscv,isa"
> [    0.000000] Vendor extensions are ignored in riscv,isa. Use riscv,isa-extensions instead.
> [    0.000000] riscv: base ISA extensions acdefikmnorw
> [    0.000000] riscv: ELF capabilities acdfim
> 
> kwe are all pretty safe letters, but suppose one was a v..
> I think you can just yoink the code from the s/z case:

Oh right, I forgot about that.

> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 20bc9ba6b7a2..4daedba7961f 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -338,8 +338,19 @@ static void __init riscv_parse_isa_string(unsigned long *this_hwcap, struct risc
>  		switch (*ext) {
>  		case 'x':
>  		case 'X':
> -			pr_warn_once("Vendor extensions are ignored in riscv,isa. Use riscv,isa-extensions instead.");
> -			continue;
> +			if (acpi_disabled)
> +				pr_warn_once("Vendor extensions are ignored in riscv,isa. Use riscv,isa-extensions instead.");
> +			/*
> +			 * To skip an extension, we find its end.
> +			 * As multi-letter extensions must be split from other multi-letter
> +			 * extensions with an "_", the end of a multi-letter extension will
> +			 * either be the null character or the "_" at the start of the next
> +			 * multi-letter extension.
> +			 */
> +			for (; *isa && *isa != '_'; ++isa)
> +				;
> +			ext_err = true;
> +			break;
>  		case 's':
>  			/*
>  			 * Workaround for invalid single-letter 's' & 'u' (QEMU).
> 
> You'll note that I made the dt property error dt only, this function
> gets called for ACPI too. I think the skip is pretty safe there though
> at the moment, we've not established any meanings yet for vendor stuff
> on ACPI.
> I think breaking is probably better than using continue - we get the _
> skip from outside the switch statement out of that. And ye, I am lazy
> so I kept it as a for loop.

Awesome, thanks!

- Charlie

> 
> Cheers,
> Conor.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
