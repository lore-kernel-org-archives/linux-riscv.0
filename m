Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D56EB64DC
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Jul 2023 10:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2eP50szHvJJc6IJrSICBR8s0K5FCndLuxo3BWZLpqbk=; b=bU87+P2vTbyCWD
	qflHWsgE4bDliM7akKlqqh6tKDe5NzTYmaSjkGpRHKaMIsxHgXR05Mo7H9qgiGV9OZjQGlD+kXlJU
	+/ZnVMGBtxL/0OcLLAn82uhkT0z2vJV2r2T10wylgXHD7S71OvgOkEZlTezKGZxHGBXqXUCJbXJeE
	X8O7j87RSYXEfl4tQG6chCd+E5cpWtp0szMdZsv3XuFW3tw/lvJxxw88GJbTS4bVJt5es5dHopmm2
	+1artNZaSZGeEZduob0q/aKBMZtIqNgd/MhbcufgAUyQOmMp4Ct9/idRc/zFboV91AxR3aoManNsf
	oXrCQ3HOmEgxI3EUniCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFYAy-005iD2-1x;
	Sat, 01 Jul 2023 10:50:00 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFYAv-005iCV-2A
	for linux-riscv@lists.infradead.org;
	Sat, 01 Jul 2023 10:49:59 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9891c73e0fbso489715966b.1
        for <linux-riscv@lists.infradead.org>; Sat, 01 Jul 2023 03:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1688208594; x=1690800594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yy74r11zEdWsHFYiWRbF/mcSfP7vY0N5EyD0HnLO+xY=;
        b=ZW8+GT+RDP8ZXRsCLgL4Bp0/4JHSxiDaWKQCEGiBcvpUjtP5E2ZbS1cAcN2h5xhn2x
         saaWLU89bq7tnk7qeR/FpIDEb4ASsHLIX2dy/uNGDTKWsxiYx71V+l3y2rfx8vZFBYzY
         0Yzo2SmgseAVhVbiwYsuhsshMSf7oI3MjbVHtYCEQOGsEeJzf0m2dA6fZYEUYLW7tTQK
         MhGvle0Y3r9Sh+C7lXXNuR/O83qreoxvMe7poRjc7hx/zgIfqGairNwnmCs21ri8mfcz
         FzFqWngc6gbWwY46AkNsLRDNm1Haugwp47QLl5Tu5k23tOKJQk4TwzfI7uTY1NK8cDzG
         v3iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688208594; x=1690800594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yy74r11zEdWsHFYiWRbF/mcSfP7vY0N5EyD0HnLO+xY=;
        b=H7HN3ft4FaWgz77ZSF6pF2lkNGOZFVZwI+CphBxk5yOYpCt4lhGEJF6FgsrmvdBz5M
         SLgZuxjCxkBpMM5rPbnNm0oW+MMuzbxVoOevpVJ4eAvxDLKw598nuJN3AQoHjCHbvgCM
         P9jf9COnZ3zbhYOwBciKkjjVfSu0PY9ZKA2ctYnqanzZdXSo6m6x2G34EwprY5dJMsA9
         4/2yOOangMXru/kQnhri8Ps1VwQu6murdq/8wfVDfhkSiiloSrKBVdSV4aCRTTGxoWz9
         j+1fN+JcGYb5Yx8LTr11vL7wcjWWnDngw4upI2fSKtb2KK2XVU8ok492udQpcVJDkF9I
         BY1w==
X-Gm-Message-State: AC+VfDxCc676MP3OIzlKq4e7e6py4il6cHyDn9IKEHAuaU70/LqfXASU
	lUZ47Nj0tQBdxod1Mntzj2x5zQ==
X-Google-Smtp-Source: ACHHUZ63HJaiSjtPUrA2MKbj0y3+pjdKkuCMv+y2Yz6Ok03XFHlhsmYzKA9rCUssSRl/SCT4Te/xCQ==
X-Received: by 2002:a17:907:8689:b0:982:7434:ea84 with SMTP id qa9-20020a170907868900b009827434ea84mr6741959ejc.10.1688208594650;
        Sat, 01 Jul 2023 03:49:54 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id gt12-20020a170906f20c00b00992b2c5598csm2828739ejb.128.2023.07.01.03.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jul 2023 03:49:54 -0700 (PDT)
Date: Sat, 1 Jul 2023 12:49:53 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 10/10] RISC-V: provide a Kconfig option to disable
 parsing "riscv,isa"
Message-ID: <20230701-623f719c181e08b43930de11@orel>
References: <20230629-landed-popsicle-ab46ab3b46d9@spud>
 <mhng-f060b5c8-aa99-4952-b1e1-ee85a92e6b07@palmer-ri-x1c9a>
 <20230629-angled-gallantly-8fe7451a25fa@spud>
 <20230630-7d0f6fe66c9415315d491f15@orel>
 <20230630-urgency-emission-882cd52a7a27@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230630-urgency-emission-882cd52a7a27@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230701_034957_733749_0C74254E 
X-CRM114-Status: GOOD (  27.75  )
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
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, robh+dt@kernel.org, Conor Dooley <conor@kernel.org>, krzysztof.kozlowski+dt@linaro.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, heiko.stuebner@vrull.eu, Evan Green <evan@rivosinc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jun 30, 2023 at 02:19:46PM +0100, Conor Dooley wrote:
> On Fri, Jun 30, 2023 at 09:46:48AM +0200, Andrew Jones wrote:
> > On Thu, Jun 29, 2023 at 10:44:18PM +0100, Conor Dooley wrote:
> > > On Thu, Jun 29, 2023 at 02:16:49PM -0700, Palmer Dabbelt wrote:
> > > > On Thu, 29 Jun 2023 13:20:55 PDT (-0700), Conor Dooley wrote:
> > ...
> > > > > +bool __initdata riscv_isa_fallback_cmdline = false;
> > > > > +static int __init riscv_isa_fallback_setup(char *__unused)
> > > > 
> > > > Maybe it's better to support =true and =false here?  Not sure it matters,
> > > > we're already down a rabbit hole ;)
> > > 
> > > Dunno, not implemented a cmdline param before. Seemed "cleaner" to check
> > > for presence, don't really care so I'll adapt to w/e.
> > >
> > 
> > I don't have a strong preference here, but to throw in more food for
> > thought, I see this DT-v1 vs. DT-v2 choice to be a bit analogous to the
> > DT vs. ACPI choice. The 'acpi' command line parameter, for RISC-V, can
> > be 'off', 'on', and 'force', where
> > 
> >   off -- disable ACPI if default was on
> >   on -- enable ACPI but allow fallback to DT
> >   force -- enable ACPI if default was off
> > 
> > So, if the default of the isa fallback command line option will depend on
> > Kconfig, then we may also want a 'force'.
> 
> I'm not sure that I understand what "force" would give us.
> There's 4 cases:
> - CONFIG_RISCV_ISA_FALLBACK is enabled, cmdline option is present:
>   cmdline option is ignored, fallback is taken if needed.
>   crash if neither are present.
> 
> - CONFIG_RISCV_ISA_FALLBACK is enabled, cmdline option is not present:
>   cmdline option is ignored, fallback is taken if needed.
>   crash if neither are present.
> 
> - CONFIG_RISCV_ISA_FALLBACK is disabled, cmdline option is present:
>   cmdline option takes priority, fallback is taken if needed.
>   crash if neither are present.
> 
> - CONFIG_RISCV_ISA_FALLBACK is disabled, cmdline option is not present:
>   fallback is never taken
>   crash if new properties aren't present.
> 
> I don't really see the value in having an equivalent to acpi=off,
> because the order of precedence is, to use your naming, "DT-v2" falling
> back to "DT-v1" & the default value concerns the use of the fallback.
> For ACPI, it is the other way around & the option controls the use of
> "DT-v2"'s analogue. Trying to slot in that logic:
> 
> - CONFIG_RISCV_ISA_FALLBACK is enabled, cmdline option "=on":
>   cmdline option is ignored, fallback is taken if needed.
>   crash if neither are present.
> 
> - CONFIG_RISCV_ISA_FALLBACK is enabled, cmdline option "=off":
>   cmdline option is prioritised, fallback is taken if needed.
>   crash if new properties aren't present.
> 
> - CONFIG_RISCV_ISA_FALLBACK is disabled, cmdline option "=on":
>   cmdline option is prioritised, fallback is taken if needed.
>   crash if neither are present.
> 
> - CONFIG_RISCV_ISA_FALLBACK is disabled, cmdline option "=off":
>   fallback is never taken
>   crash if new properties aren't present.
> 
> I think I prefer the behaviour of what I currently have & I don't really
> get where the "force" option is supposed to fit in either?
>

WFM

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
