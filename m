Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA26C02198
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 00:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=78fFXy1DJ6GeXUjO4sgTu9g3DL1XznlGd4NF+7XZBKM=; b=z/hl4g5hUf9K5H
	Y/ROblyaKSeTtLKSO/XkmqQ1TIaLLdpK1acQV4wRIhODLUnXpK1cD7KGwIqFLJZgeWYTH/92xyDv0
	+2IlV1HsuOMASKxOOP7qVmFMm6zBijsjJjVWAPckp0a1vaC5taVQiy67IpFaUaaXyzbsQV8/8DMRD
	8pOqg7BstFzTwgOxlEDp0GHPjVuTszqgH2SQ7imDnhxrvDGL011LejNkaxAE+9alLdqqrVIB9lRWv
	5SEpfD+DgJ8fCr9BPW2iPHYi7AXrdZtf9JfkjlBwjk12NcfSRmAKNgB0TV2k78YRzUHQA+vo2OCha
	YLftnJMGaLy7MosAfU9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1theMT-000000021MH-0WqB;
	Tue, 11 Feb 2025 00:42:49 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1theMR-000000021Lc-2mVe
	for linux-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 00:42:48 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7be8efa231aso511349685a.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 16:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739234566; x=1739839366; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ves2PKf6HPc01SFv90D7qof8tDzgHtK1O0RPrNmLMrU=;
        b=BQRegQUutOci4dnRRRySZv8I8eh8oyaqXQEdNwCfEh5rM54g05fwE/2svQLzL+zud6
         /Ahp0/9CZxUPBpzGd4qX5HUmXbeE3tVT/RdeSf/6c0dHnqL2qGOiEJh/QimGlcHA8s4N
         axNdFCGKQ3XkCFV+hMzlZvJEoNGttE/I3HRQJpmstd9e8nDSLDiiw5mhoDs7U2eYpT0F
         UiFyV+ionPHfPB5nulhUfZjDXlBTCGguAxfqkTaFKYJ2EJEnCtEYZ4n0kQEEDTK2A7Gc
         nNhlp45oD9dXmXdHMp3TtZSdNB+ksE3c1ckGWE3vp5cznmFCD0dezVw6FCh8vbwug/4C
         Dsbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739234566; x=1739839366;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ves2PKf6HPc01SFv90D7qof8tDzgHtK1O0RPrNmLMrU=;
        b=jR2W0QtAKjRD9oKITNLmuhbjwERn2dyl7PXG6lOjsFoMlq80I+J5JrYaHXe2WmxW2v
         PowT4tFD5aDJKb2cLlqimxBzRViQQ2uGLyNnHrpFm4LViisFUkFCBz3hEIodLCxsYcVw
         9aX1TjmGb26zbGmQQDNyqpqCZdgdjguU1xFW1wRcEpP20nhDRn6z5UScB0n+GL8PT/t1
         L5yg8YwteEW7z5kwnWTFZWg+qp1wNBwEwQaE1PgpY6wt+6Yq2MseAbcGvaqm/ThZiPqR
         JNi4d05lhm4lYcKVX/0rM1WbmXuFtAQZRq/xxQGVqw4Y8cVgVYkw5TE3ea0cwwlPnxNi
         XzVg==
X-Forwarded-Encrypted: i=1; AJvYcCUoqa58w3TbBrcAbOI36CqMXCc0dP5RY2OybH7sBnYmFSClJC+xA9nk6Hxv5RdbszyyyK3cylfKWwoPkw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwNJhoszcTAbmkh7c581H8HibnX76v2FlcFEiGRMfBu/r6JEqkI
	hbtyUzXzohMFa3GMRAdDtxT58ljfA0H+Ij/U6DgX50dge0ZvDszS
X-Gm-Gg: ASbGnctQymhdG+jkTSs/xhRwBg6Y0o1EXw/j3CUSiRQwd3tLVSpWpQcjJr1kp2m9WCl
	Jp4VlLJKMp2s/UsndNYeiVoXRW9gaeyiVUXplQZU3EgcGEydH552yTa+AeTm7pNU2wJ4fNH5JJk
	XskmluY5CDlJ6m6TShWS2HPJJr8SyXdNZwdglwzgOEFj0rpEGs97RWSdUNJTdMxzTgrXUfDCfCf
	SVY/tcyxs7HAO9AKGqZZh81uGC7wLsG+wxPLddN4UwtVNRB6OGSXdgR8bZo/Xk6Jzc=
X-Google-Smtp-Source: AGHT+IEF3uTLUH2iOgpwnxLI7jl+sTJ/Lafd2yRzSkI96FyLXuh78dVjps2rwiQRrWVM1p/rSY8GKA==
X-Received: by 2002:a05:620a:6a83:b0:7c0:51b1:49b4 with SMTP id af79cd13be357-7c051b14a5fmr986106485a.38.1739234566457;
        Mon, 10 Feb 2025 16:42:46 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c041d6628bsm598304585a.0.2025.02.10.16.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 16:42:45 -0800 (PST)
Date: Tue, 11 Feb 2025 08:42:39 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>, Jesse Taube <jesse@rivosinc.com>, 
	Yong-Xuan Wang <yongxuan.wang@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Evan Green <evan@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Andy Chiu <andybnac@gmail.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Jonathan Corbet <corbet@lwn.net>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH v3 2/3] riscv: add ISA extension parsing for bfloat16 ISA
 extension
Message-ID: <7qkfqzhytjq2qwo2wg3xtkoqu6id6wduckeeudbn2yt5p5p7xv@2gl5bcny26rk>
References: <20241206055829.1059293-1-inochiama@gmail.com>
 <20241206055829.1059293-3-inochiama@gmail.com>
 <374d3b07-e16c-4468-828a-a2a542cd88ac@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <374d3b07-e16c-4468-828a-a2a542cd88ac@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_164247_703188_794ED67D 
X-CRM114-Status: GOOD (  24.10  )
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

On Mon, Feb 10, 2025 at 03:38:58PM +0100, Cl=E9ment L=E9ger wrote:
> =

> =

> On 06/12/2024 06:58, Inochi Amaoto wrote:
> > Add parsing for Zfbmin, Zvfbfmin, Zvfbfwma ISA extension which
> > were ratified in 4dc23d62 ("Added Chapter title to BF16") of
> > the riscv-isa-manual.
> > =

> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  arch/riscv/include/asm/hwcap.h | 3 +++
> >  arch/riscv/kernel/cpufeature.c | 3 +++
> >  2 files changed, 6 insertions(+)
> > =

> > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hw=
cap.h
> > index 869da082252a..14cc29f2a723 100644
> > --- a/arch/riscv/include/asm/hwcap.h
> > +++ b/arch/riscv/include/asm/hwcap.h
> > @@ -100,6 +100,9 @@
> >  #define RISCV_ISA_EXT_ZICCRSE		91
> >  #define RISCV_ISA_EXT_SVADE		92
> >  #define RISCV_ISA_EXT_SVADU		93
> > +#define RISCV_ISA_EXT_ZFBFMIN		94
> > +#define RISCV_ISA_EXT_ZVFBFMIN		95
> > +#define RISCV_ISA_EXT_ZVFBFWMA		96
> >  =

> >  #define RISCV_ISA_EXT_XLINUXENVCFG	127
> >  =

> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeat=
ure.c
> > index c0916ed318c2..5cfcab139568 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -341,6 +341,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D=
 {
> >  	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
> >  	__RISCV_ISA_EXT_DATA(zawrs, RISCV_ISA_EXT_ZAWRS),
> >  	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
> > +	__RISCV_ISA_EXT_DATA(zfbfmin, RISCV_ISA_EXT_ZFBFMIN),
> =

> Hi Inochi,
> =

> You could add a validation callback to that extension:
> =

> static int riscv_ext_f_depends(const struct riscv_isa_ext_data *data,
> 			       const unsigned long *isa_bitmap)
> {
> 	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_f))
> 		return 0;
> =

> 	return -EPROBE_DEFER;
> }
> =

>   ...
>   __RISCV_ISA_EXT_DATA_VALIDATE(zfbfmin, RISCV_ISA_EXT_ZFBFMIN,
> riscv_ext_f_depends),
> =

> =

> But I'm ok with the current state of that patch since I have the same
> thing coming for other extensions as well. =



I think it is good for me to add the check, and I wonder it is possible
to add the extra check for zvfbfmin and zvfbfwma like this:

static int riscv_ext_zvfbfmin_validate(const struct riscv_isa_ext_data *dat=
a,
				       const unsigned long *isa_bitmap)
{
	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_v))
		return 0;

	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZVE32F))
		return 0;

	return -EPROBE_DEFER;
}

static int riscv_ext_zvfbfwma_validate(const struct riscv_isa_ext_data *dat=
a,
				       const unsigned long *isa_bitmap)
{
	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZFBFMIN) &&
	    __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZVFBFMIN))
		return 0;

	return -EPROBE_DEFER;
}

> So with or without my previous comment fixed:
> =

> Reviewed-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> =

> Thanks,
> =

> Cl=E9ment
> =


Thanks,

Regards,
Inochi

> >  	__RISCV_ISA_EXT_DATA(zfh, RISCV_ISA_EXT_ZFH),
> >  	__RISCV_ISA_EXT_DATA(zfhmin, RISCV_ISA_EXT_ZFHMIN),
> >  	__RISCV_ISA_EXT_DATA(zca, RISCV_ISA_EXT_ZCA),
> > @@ -373,6 +374,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D=
 {
> >  	__RISCV_ISA_EXT_SUPERSET(zve64d, RISCV_ISA_EXT_ZVE64D, riscv_zve64d_e=
xts),
> >  	__RISCV_ISA_EXT_SUPERSET(zve64f, RISCV_ISA_EXT_ZVE64F, riscv_zve64f_e=
xts),
> >  	__RISCV_ISA_EXT_SUPERSET(zve64x, RISCV_ISA_EXT_ZVE64X, riscv_zve64x_e=
xts),
> > +	__RISCV_ISA_EXT_DATA(zvfbfmin, RISCV_ISA_EXT_ZVFBFMIN),
> > +	__RISCV_ISA_EXT_DATA(zvfbfwma, RISCV_ISA_EXT_ZVFBFWMA),
> >  	__RISCV_ISA_EXT_DATA(zvfh, RISCV_ISA_EXT_ZVFH),
> >  	__RISCV_ISA_EXT_DATA(zvfhmin, RISCV_ISA_EXT_ZVFHMIN),
> >  	__RISCV_ISA_EXT_DATA(zvkb, RISCV_ISA_EXT_ZVKB),
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
