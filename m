Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6EDC021A0
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 23:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OQDOhEkyJCXPMHgz+Bmq0TnSSoYQnQqDdf0oIensqEo=; b=zzNVA2yTs/CaF0
	UNd3dSjMwFRQFW1uzEWxrjh148d9MbCS6GT42lm8aZfgjf/kPckws4CGZQSKCPcYJllfnIRPsuKKf
	sqWRzRG/pcSuQLkl7weggKc9ucTVshN8e1cHFkf7oCb9+HCzu1Bv3tUFk5eQmoOEB+rgfMahESVPw
	r4H1aWdxgW65FZzwrGyNJIN5aLuL88zjjO6jjW2zBqP5UDp0u2yxzyzzk0xj95n26PnwLWhgF0kRP
	hTyF0IPgZzGeCxvOuoQZNRaJYVLsSUmQzxI1d+7qdfa0+CibUMGD8OB8V+OrLlbxcTPuVO46sDZVT
	qUT+AJZoTAMF32CExL1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thzeY-00000005ZjM-1kFh;
	Tue, 11 Feb 2025 23:26:54 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thzeV-00000005ZiV-2zvf
	for linux-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 23:26:52 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-46c8474d8daso49053661cf.3
        for <linux-riscv@lists.infradead.org>; Tue, 11 Feb 2025 15:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739316410; x=1739921210; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LHbTjBhQMHeo18vkdg+R70RaCpRDyN0SUOpcR7vgLAk=;
        b=ELB9gu5VrQLDgOUpcnkJ0zATAYJwf67ecnbpzn2nuknBVnIdeW0602+v6p0lU5A456
         CJR3Agz7epGDdXBiETexev+rO0KffeLQtdOvJKJUnP+4VJ5tQWc+nbjkO0FVYw/sS001
         Wjq/aVyea5VNuReiX7QLw/2B1cr7HT3L9c7iNElEyXNXCttiVma1POgInDfoOzD8Wx/y
         uv6joQIYjqlER6PaQMnjF9m67ZgcBODV0a7Rgop4WhLxPR0TcURjkxQDabC1nR3OVirm
         Q4nWE+xVvo46usGKrCWWTyIpYPzvxEYveXIPoiIoISnVb7y+i3wiQzUAu2L5TDQIl7nT
         LW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739316410; x=1739921210;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LHbTjBhQMHeo18vkdg+R70RaCpRDyN0SUOpcR7vgLAk=;
        b=eoWPglUdpg8rU+CwNx4FmcFR67ap62b+hDvSbgxoqSaHGv2PLlMEE1lFeFqQOfFe44
         cmMr/gLUkq4dYFf62EfCDt7SGa0R5MtLvNLJyN4A1uJFqXptPVAfotLZVV1GpMXOECY6
         DJWJxUozquFMO5b5dRNcR8IviGkb/65KDx6n8N5DmpyRBYmPoUyr4WKpcAnQCa7iI71m
         iXN6GRNR863BfxIQC7akw5XrXrdH4e+KfD0xZAaH65Oe9pGz87fWmCdXUvGCcMcd2uDh
         LWW8xxldipDGTVjBBj4avdX8iWWfZ4E1gdARzv2ahFu+cCAMgpepZGtHDzclkwlkrr2m
         6Guw==
X-Forwarded-Encrypted: i=1; AJvYcCVmDhOzpAQ8cthkfGvk/mdL9h8O64G9TOwMG7dbvlFIo78V72M6Z/kTeQRIPBmZVOut8OjakDE7gddakw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/JEVAhmTXn4U46e+lwLRSBEVE8RI0KVVvqXzDUelcEO3neFq6
	sA1DnX00WkOdKTTaQEfFAuXGi9AhuxPJYUSvpqgr7HfeVANSQwdc
X-Gm-Gg: ASbGncvUYCLFtpA1/qOg64blRPz44zE5mFw9hg6ULrIsRh9YZC+FZV4C43htdFlM+oG
	mzYv1OPy5MzgX8kR9JHxaI21kDqj80vRWXkdOWp4+L44j4iLRuY7ajqwRM/+sAET/re/D7oPATW
	PYlyjIF0AWagtl7HHjeXJ9+i2jHtRddnHzTdHsA2jMpfRA539ufUHQrAg5V5TttWHj6Rrc12ywJ
	yXLh09L2q0HPR0JlCp05cKhLq/qz6iaCUBgHa2H2iUjqRSYrgcYnnd1RQvTQZdd/FM=
X-Google-Smtp-Source: AGHT+IGdYvrbgZUnhsysZ3YIfofS/ssklt7oluXB0IbrtQlBkVELl0TihfQbvfT0rCsNxXdeOI4zuw==
X-Received: by 2002:ac8:7d8a:0:b0:471:91a8:d7f4 with SMTP id d75a77b69052e-471afe4c818mr14894221cf.24.1739316410424;
        Tue, 11 Feb 2025 15:26:50 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-47198ee3fd8sm25855121cf.55.2025.02.11.15.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 15:26:49 -0800 (PST)
Date: Wed, 12 Feb 2025 07:26:42 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>, 
	Jesse Taube <jesse@rivosinc.com>, Yong-Xuan Wang <yongxuan.wang@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Evan Green <evan@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Andy Chiu <andybnac@gmail.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Jonathan Corbet <corbet@lwn.net>, Chen Wang <unicorn_wang@outlook.com>
Subject: Re: [PATCH v3 2/3] riscv: add ISA extension parsing for bfloat16 ISA
 extension
Message-ID: <rjnohunxmhyz4sonz5atmirpprpfwihsv7uazgb74josjxghjm@ju255opl6m6e>
References: <20241206055829.1059293-1-inochiama@gmail.com>
 <20241206055829.1059293-3-inochiama@gmail.com>
 <374d3b07-e16c-4468-828a-a2a542cd88ac@rivosinc.com>
 <7qkfqzhytjq2qwo2wg3xtkoqu6id6wduckeeudbn2yt5p5p7xv@2gl5bcny26rk>
 <20250211-dizziness-eclair-2ef49cc5ad0e@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250211-dizziness-eclair-2ef49cc5ad0e@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_152651_751937_9870799C 
X-CRM114-Status: GOOD (  31.33  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Feb 11, 2025 at 01:45:06PM +0000, Conor Dooley wrote:
> On Tue, Feb 11, 2025 at 08:42:39AM +0800, Inochi Amaoto wrote:
> > On Mon, Feb 10, 2025 at 03:38:58PM +0100, Cl=E9ment L=E9ger wrote:
> > > =

> > > =

> > > On 06/12/2024 06:58, Inochi Amaoto wrote:
> > > > Add parsing for Zfbmin, Zvfbfmin, Zvfbfwma ISA extension which
> > > > were ratified in 4dc23d62 ("Added Chapter title to BF16") of
> > > > the riscv-isa-manual.
> > > > =

> > > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > > ---
> > > >  arch/riscv/include/asm/hwcap.h | 3 +++
> > > >  arch/riscv/kernel/cpufeature.c | 3 +++
> > > >  2 files changed, 6 insertions(+)
> > > > =

> > > > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/as=
m/hwcap.h
> > > > index 869da082252a..14cc29f2a723 100644
> > > > --- a/arch/riscv/include/asm/hwcap.h
> > > > +++ b/arch/riscv/include/asm/hwcap.h
> > > > @@ -100,6 +100,9 @@
> > > >  #define RISCV_ISA_EXT_ZICCRSE		91
> > > >  #define RISCV_ISA_EXT_SVADE		92
> > > >  #define RISCV_ISA_EXT_SVADU		93
> > > > +#define RISCV_ISA_EXT_ZFBFMIN		94
> > > > +#define RISCV_ISA_EXT_ZVFBFMIN		95
> > > > +#define RISCV_ISA_EXT_ZVFBFWMA		96
> > > >  =

> > > >  #define RISCV_ISA_EXT_XLINUXENVCFG	127
> > > >  =

> > > > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpu=
feature.c
> > > > index c0916ed318c2..5cfcab139568 100644
> > > > --- a/arch/riscv/kernel/cpufeature.c
> > > > +++ b/arch/riscv/kernel/cpufeature.c
> > > > @@ -341,6 +341,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[]=
 =3D {
> > > >  	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
> > > >  	__RISCV_ISA_EXT_DATA(zawrs, RISCV_ISA_EXT_ZAWRS),
> > > >  	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
> > > > +	__RISCV_ISA_EXT_DATA(zfbfmin, RISCV_ISA_EXT_ZFBFMIN),
> > > =

> > > Hi Inochi,
> > > =

> > > You could add a validation callback to that extension:
> > > =

> > > static int riscv_ext_f_depends(const struct riscv_isa_ext_data *data,
> > > 			       const unsigned long *isa_bitmap)
> > > {
> > > 	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_f))
> > > 		return 0;
> > > =

> > > 	return -EPROBE_DEFER;
> > > }
> > > =

> > >   ...
> > >   __RISCV_ISA_EXT_DATA_VALIDATE(zfbfmin, RISCV_ISA_EXT_ZFBFMIN,
> > > riscv_ext_f_depends),
> > > =

> > > =

> > > But I'm ok with the current state of that patch since I have the same
> > > thing coming for other extensions as well. =

> > =

> > =

> > I think it is good for me to add the check, and I wonder it is possible
> > to add the extra check for zvfbfmin and zvfbfwma like this:
> > =

> > static int riscv_ext_zvfbfmin_validate(const struct riscv_isa_ext_data =
*data,
> > 				       const unsigned long *isa_bitmap)
> > {
> > 	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_v))
> > 		return 0;
> =

> This is not needed I think, V "turns on" Zve32f. If anything, you should
> be checking for CONFIG_RISCV_ISA_V here ^^
> =


Thanks for pointing it. I will change the check.

> You /could/ call the resulting riscv_vector_f_validate(), since this is
> nothing specific to Zvfvfmin, and could be used for another extension
> that requires a Zve32f or Zve64 minimum base.
> =


It is OK for me, I will change its name.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
