Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB717C4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 15:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OyMlUppZ0/nT+5qV3ZTCvubfRmWpW3f3akXRW6OqsLM=; b=crOqYeylRyArcG
	8A8xHLM/z0dbv88FpWbLtUYshnJGfex5kC3jyF+HRk8UnuoIBZHCOQzF2NIBl2MAUP4sCs2Dcb4Lb
	WFXpo2+4UtyAZzHsorgQbnAKlovjN746brBwOW6fBXhLKF9zgQFz79xfuuUe9rxygf84wMDbzgX+F
	eiWKQ+YdNdGQzwUxPA2vCalEbKfpDDVwsax16kOkTmqunIEhenyddv0+CZkSxcvhEfGaVMrbWAjCf
	sGoCG29X6/A/u7Mu6by/5wipexN3sxVdZTkKfROJjNHbr0NlgY+SfSrZQVRIFzZ1NPyjH5qy3qJsC
	jVfmteBdFt824dn9AzIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzefc-00000004kdm-0Yiu;
	Wed, 24 Apr 2024 15:36:28 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzefY-00000004kbX-2u66
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 15:36:26 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-61865eed63dso8615587b3.0
        for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2024 08:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713972982; x=1714577782; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UOeTFyyci3z7BUZ6gEboB6kicq7JHa28+x4pg4U/L9Q=;
        b=qwmGC3TVJYS4cgh2kh8uX6PYX0658JdMtNelBHXFXf0TMbTKaHaU3ip2ue/pBTHY8C
         hkU0po/QoZmZphw6R4qFJ/RtFQpidOh4t7YShEd7iXreJqgWou3wFaiAKiuHzf/+BG2X
         DnL30GjkrHaTI6TTh0ebbiMnIpBSn3mWU4ygmqqm+tRkgtpyqpHxuVI9u+XVUrZIF3iZ
         TldOTcHjGsjakpMUfUhCjmhwPF0Qo5nZ/KzvfHr2T4zgl94cawY0BFV7MW7n0v6bWVSc
         qAwRczoFw/b0MneCoC0t+JIhex7WUFVaLiCmveh7atDzKTBpeyoZHW9WSI72yFLRVqGI
         Iy0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713972982; x=1714577782;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UOeTFyyci3z7BUZ6gEboB6kicq7JHa28+x4pg4U/L9Q=;
        b=hCW4xa7Rf2CiSHv6/DuLnoN3rLK8h2OkwIccCNB839k0754Q+RM8omDwtqx3+704jq
         3ozJ8yydMw4w//NDzt8pHa0W/K8W4qQv3ETgiIWTSamsPkGnFhTVLn4iQxtdwW8eLD3f
         g9o/UyHW3Cn5Rw+z/XGH4K6YPRq1S3yI93VVAnDdSAiGH8zFjOEoWBkHz4ndWWF4hpk6
         y7eoXLZmI+a4RF7oZ01nzIRi8BOzXJUqGjSEcl2KdqWDpPBWVADlx6eJlT5Q2Ef4pMO7
         UwxNc5fNBR+gqEEJrtzXly+cE/gNT3Axq16Oa2o8kC8Mv906FG0fJvU9WKosF1oQBzxw
         K0FA==
X-Forwarded-Encrypted: i=1; AJvYcCXNyUS9DHgJ7z+JiNJFj2bRo+wTd3fl70W1uNpfItLV14Cw3069pekgXjKq9s0gogTrQb/+PN6T2u9sv6oZXmEXUbA7HXnIaXNr6Bq1+7ug
X-Gm-Message-State: AOJu0YxRgG0eP21/ltTCM8/QebVphej4Il3udRDRhGB1eGQtokl5X40T
	0E7qRpzzrHIefDfyTi7orsCk7SdkM8n8x2ZRwS4kgEHcY/y1GUzjCYzWmuoSwEg=
X-Google-Smtp-Source: AGHT+IGUqY1hEYLyvR7VYD34HR40H5BCTS3NDhpEtJYnVydiqbsmxy3Dkl9KuCGBuZqe3HcyqLC03w==
X-Received: by 2002:a0d:cc12:0:b0:618:88d1:f15f with SMTP id o18-20020a0dcc12000000b0061888d1f15fmr73152ywd.0.1713972982354;
        Wed, 24 Apr 2024 08:36:22 -0700 (PDT)
Received: from ghost ([50.146.0.2])
        by smtp.gmail.com with ESMTPSA id j82-20020a819255000000b0061ad72dd577sm2417745ywg.112.2024.04.24.08.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 08:36:21 -0700 (PDT)
Date: Wed, 24 Apr 2024 11:36:19 -0400
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
Message-ID: <Zikm80mmHFYoaAOF@ghost>
References: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
 <20240420-dev-charlie-support_thead_vector_6_9-v3-6-67cff4271d1d@rivosinc.com>
 <6c624361-a968-498b-a9fb-ea2aaec70ce8@ghiti.fr>
 <20240424-wildly-goofy-c81aac6f8cd7@spud>
 <ZikhpEgEoMX/rObu@ghost>
 <20240424-gondola-cosmic-b7a02b2a8619@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240424-gondola-cosmic-b7a02b2a8619@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_083624_757253_03E1B527 
X-CRM114-Status: GOOD (  31.67  )
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

On Wed, Apr 24, 2024 at 04:21:05PM +0100, Conor Dooley wrote:
> On Wed, Apr 24, 2024 at 11:13:40AM -0400, Charlie Jenkins wrote:
> > On Wed, Apr 24, 2024 at 03:51:54PM +0100, Conor Dooley wrote:
> > > On Wed, Apr 24, 2024 at 04:22:02PM +0200, Alexandre Ghiti wrote:
> > > > Hi Charlie,
> > > > 
> > > > On 21/04/2024 03:04, Charlie Jenkins wrote:
> > > > > This loop is supposed to check if ext->subset_ext_ids[j] is valid, rather
> > > > > than if ext->subset_ext_ids[i] is valid, before setting the extension
> > > > > id ext->subset_ext_ids[j] in isainfo->isa.
> > > > > 
> > > > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > > > Fixes: 0d8295ed975b ("riscv: add ISA extension parsing for scalar crypto")
> > > > > ---
> > > > >   arch/riscv/kernel/cpufeature.c | 2 +-
> > > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > > > > index 48874aac4871..b537731cadef 100644
> > > > > --- a/arch/riscv/kernel/cpufeature.c
> > > > > +++ b/arch/riscv/kernel/cpufeature.c
> > > > > @@ -609,7 +609,7 @@ static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
> > > > >   			if (ext->subset_ext_size) {
> > > > >   				for (int j = 0; j < ext->subset_ext_size; j++) {
> > > > > -					if (riscv_isa_extension_check(ext->subset_ext_ids[i]))
> > > > > +					if (riscv_isa_extension_check(ext->subset_ext_ids[j]))
> > > > >   						set_bit(ext->subset_ext_ids[j], isainfo->isa);
> > > > >   				}
> > > > >   			}
> > > > > 
> > > > 
> > > > I think this should go into -fixes, let's check with Palmer if he wants to
> > > > take this patch only or if you should send the patch on its own.
> > > 
> > > I think splitting out this and patch 1 into a new series targeting fixes
> > > would probably make things clearer?
> > 
> > Okay I can do that. I will give it a bit more time before I send this
> > series split into two to allow time for the rest of the patches to
> > gather comments so I avoid sending too many duplicate patches.
> 
> Ye, I do hope to get back to this series later in the week when I have
> time to actually read through all of the patches in detail.
> 
> However, you wouldn't have to resend both parts of the series - you can
> just split out the fixes portion and send that, leaving the rest of the
> series sitting on the list to gather comments.

Oh cool, I will send those two patches out in their own series then.

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
