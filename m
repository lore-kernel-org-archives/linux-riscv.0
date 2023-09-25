Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D0ACE7AB9
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 18:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ip7YdlBSBIrjOnsqdQ4k0Gf9m+P1xSFwAGLlx4BtgyE=; b=Ht1uVzW7AEeh2k
	KC98hsa1+/moIF9Mm7ud1bTNIVo35a+dFi9sceJPTlS48e6pUAMzESTgr1jpRbVAMNl6890tv5uA3
	nhOwJlMrbA2g/fOEj7IsbnIyC7sSxZ2FWI0h8wUOdl0hOO3fRsQM6uZX3I0XRggFfP5GMlY6UY/BW
	SnUH5Cny8uGu6RoMzAp59aKjM9/rwm+5sQIOJow+cTEbZtJcziWupUmaoJVR9wdyKDDWkYIHZE0Ab
	B8CTDKWBStSC4/oyDJ0ILSeJkdmMA1dipE4LzzmgXxMrX1vH/Raqr0mWuUHpD/3RHa4ARYMUSG1JD
	SjLg/Aa4NN508LdOWASA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkq4h-00EoF0-2u;
	Mon, 25 Sep 2023 18:12:51 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkq4e-00EoDx-2U
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 18:12:50 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-27758c8f62aso1795827a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 25 Sep 2023 11:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1695665566; x=1696270366; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KsRIBM7dOdcj87tvwe4EQo8GqJ5cXnTOsGKKYnAPAk4=;
        b=tDES2gRHi/Zyb1fik5VYs++OMFJcwMMhPBtLsw4FZMJ96ETWfSITHIV1hCubIhGtKG
         cBcmmBIbsTFVbLd/vGJtpSp0A9sIMjOiZ5BWjea0jiNII7f2Q1AahdmSjN8mfrLpUKsk
         HlFLkgslKzawCif22GgX4GjdNgv92SGfF30Yq2JdYBpPJDhGJh4Rk6yFqESrB0Au+tnV
         a/pyDNVSdM1ZkVKsvfum8ITROVhuONci8XvzP5NsRZ1n7G9j6B2CPGBlVyfCegs3ELoO
         2T+Ckah4kW0a7527OAcHuTh34qSF+zVtl1WPKrCxFcSY1DvXu92fR/nrlM9WsV3tVROO
         ZqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695665566; x=1696270366;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KsRIBM7dOdcj87tvwe4EQo8GqJ5cXnTOsGKKYnAPAk4=;
        b=NNBjsOrUadgOtaqJigH5nahEIo+mC2tENnCHU5yAy3RwgTWhLcGH44NEvfaj7Lx1pp
         LMjMmd0lYYKEgqMiyKkcnws7lXcvTAomxOkHE+9LOBRNaEP8xITXQAORinMPvJ/z8xWH
         JMAU7E2+YbdkUkq5EPaAizvvkjD2kAbUaNeALD15WOkmGji7KCzfdewFsQ+s+n6adzff
         g9/vPcRTctye+opkrRfnwzQNxTzmdWK9bHL9uAOIyM9VgRHuZyXgaA/tjUXH1ni5bYVe
         rztmo/EdZjyN/xQmE5m8xCn001mMNV3oD2CvhmhYamSgRGVKvK/lHZWnIprLJlUJZKSM
         Hmcw==
X-Gm-Message-State: AOJu0YyUzOo1IyP3Br0O2eU+oI1cYVjWlINRYQko3a8sAR2xjUmKAbbE
	Ot5acnBXJYMrEs2aGutKUX2cjA==
X-Google-Smtp-Source: AGHT+IEITTnOWUqqZd2QQfvnjuWHs46rWx0fKoZhZxeSiyP6OtQJWAzOWXHuNzwpn4hPs7lDCludXw==
X-Received: by 2002:a17:90b:2386:b0:267:faba:705 with SMTP id mr6-20020a17090b238600b00267faba0705mr3779807pjb.10.1695665565853;
        Mon, 25 Sep 2023 11:12:45 -0700 (PDT)
Received: from ghost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id az14-20020a17090b028e00b002777001ee76sm949619pjb.18.2023.09.25.11.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 11:12:45 -0700 (PDT)
Date: Mon, 25 Sep 2023 11:12:42 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Shuah Khan <shuah@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	devicetree@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 2/9] RISC-V: Detect XVentanaCondOps from ISA string
Message-ID: <ZRHNmuv8KzUU7u0r@ghost>
References: <20230925133859.1735879-1-apatel@ventanamicro.com>
 <20230925133859.1735879-3-apatel@ventanamicro.com>
 <ZRHH25IyJJLWSolC@ghost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZRHH25IyJJLWSolC@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_111248_811948_83A3C61C 
X-CRM114-Status: GOOD (  28.71  )
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

On Mon, Sep 25, 2023 at 10:48:11AM -0700, Charlie Jenkins wrote:
> On Mon, Sep 25, 2023 at 07:08:52PM +0530, Anup Patel wrote:
> > The Veyron-V1 CPU supports custom conditional arithmetic and
> > conditional-select/move operations referred to as XVentanaCondOps
> > extension. In fact, QEMU RISC-V also has support for emulating
> > XVentanaCondOps extension.
> > 
> > Let us detect XVentanaCondOps extension from ISA string available
> > through DT or ACPI.
> > 
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/include/asm/hwcap.h | 1 +
> >  arch/riscv/kernel/cpufeature.c | 1 +
> >  2 files changed, 2 insertions(+)
> > 
> > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> > index 0f520f7d058a..b7efe9e2fa89 100644
> > --- a/arch/riscv/include/asm/hwcap.h
> > +++ b/arch/riscv/include/asm/hwcap.h
> > @@ -59,6 +59,7 @@
> >  #define RISCV_ISA_EXT_ZIFENCEI		41
> >  #define RISCV_ISA_EXT_ZIHPM		42
> >  #define RISCV_ISA_EXT_SMSTATEEN		43
> > +#define RISCV_ISA_EXT_XVENTANACONDOPS	44
> >  
> >  #define RISCV_ISA_EXT_MAX		64
> >  
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 3755a8c2a9de..3a31d34fe709 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -182,6 +182,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
> >  	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
> >  	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
> >  	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> > +	__RISCV_ISA_EXT_DATA(xventanacondops, RISCV_ISA_EXT_XVENTANACONDOPS),
> >  };
> >  
> >  const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
> > -- 
> > 2.34.1
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
> I worry about storing vendor extensions in this file. Because vendor
> extensions are not standardized, they can only be expected to have the
> desired behavior on hardware with the appropriate vendor id. A couple
> months ago I sent a patch to address this by handling vector extensions
> independently for each vendor [1]. I dropped the patch because it
> relied upon Heiko's T-Head vector extension support that he stopped
> working on. However, I can revive this patch so you can build off of it.
> 
> This scheme has the added benefit that vendors do not have to worry
> about conficting extensions, and the kernel does not have to act as a
> key registry for vendors.
> 
> What are your thoughts?
> 
> - Charlie
> 
> [1] https://lore.kernel.org/lkml/20230705-thead_vendor_extensions-v1-2-ad6915349c4d@rivosinc.com/
> 

I guess I don't need to revive the patch, you could just take the code
and update it for xventanacondops.

- Charlie

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
