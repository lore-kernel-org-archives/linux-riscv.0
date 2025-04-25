Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F61DC369D3
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 07:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GE66ebz7B2c01js4nlW7lwDD8RwQyaQkl4us/O5cpc0=; b=moijETqBMJ7T54
	YXX7zZojPKw8mwihRvnSf+Qt34crheUki73QjidadJtJ9P+eWdtgvaS3eYLpySCFqZOuL2XI7hbxZ
	wg5qbvItn/79LfX5V6hMQ3P2/7MrTmuExDDiYJPruD3C+nR7oTvq0vUsA9wXWAn8Tgj+iyKP3Q3r9
	CT3dfqHxP1tQnqDlT9tfz8phIToVk5TmYExgRINNiCSrSZa7A/bPeMH+XaMh1jH3535wrVVZKuLdB
	o0+/Ok+ScWdgtWiMao7kv8QwD0m50gmbZGaHsZHdzz/WphHxzZcGxVuXK8XXDMEiylZxzag2/5eMq
	gic45CIPeEwSQ6ZoIVvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8DSJ-0000000GBOG-2IXV;
	Fri, 25 Apr 2025 07:26:39 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8DSG-0000000GBNG-2RxW
	for linux-riscv@lists.infradead.org;
	Fri, 25 Apr 2025 07:26:38 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so17594005e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 25 Apr 2025 00:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745565995; x=1746170795; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8rOWai1sdUbgwofhh5Gm/RhS+Xf+8kuHnQc4bFrAWfA=;
        b=OX4sXbMuFYTmCrfPAOalYL1h2Qj5o8c2MJM0CMB2WNRq2u1+tdObqUHU0H3OB6v+C0
         RwFhNN1qAkl2YU3r7kJwTWSL+4Ar2zL5a/v7jyHx6x+v1u28AoWGoIprS6J1jERW614M
         xYT0rPqSOxS0wvR3t8xeuF4++weHA9RiN840QqyBAdwYice4jJPMhFKlOMLrM7MU90+n
         Q3sRhhpFgx2QY+Q4bcHVjeyRDZWuBYwKxAGeN/CMm8aDY2Z+e5YhN6QCUYllMdzKHxNw
         COreDrWjpja+eCuYpOM1SfNRSRkqN53RyFWnGYxZWqcQmepfiu3QJyKj7TYyeYCl4AvH
         X0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745565995; x=1746170795;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8rOWai1sdUbgwofhh5Gm/RhS+Xf+8kuHnQc4bFrAWfA=;
        b=jbZtkBwWewZLa40Z7EFNWYYTuOMpTH5QAE5Ud7rOM8prl9FKCP+yZOFMBow1C8WVg7
         Y/4vEJeSn4RMwpEPLZoKtcAgfepXv5qilJB3cS+cwRRRjR7Hua0SsRvLNHZTKbOur573
         logwUU//R5rcJb29Ekth6cCxURCJ38LQes+INbh/ICRv9oF55qWeUJ+QFwW0adZHlrn0
         5X31pzajYl5XTxLX+V7bTfog/TzEvz7NtfgzAavXfrqL2lfvYHljrL7THSQ/tKtddBdV
         xXjjTDNsuBk8MbN2TRoPN+A2ZQPuY9Vouye5NTDZsQv2vNRqGshgLW7ZhZwsnLkGS1ZO
         a6Bg==
X-Forwarded-Encrypted: i=1; AJvYcCV7r7pwblXCOC6iE8nSFdbBRUWuvn9qd/hEgSJ7HqJ7mDwnDUqRGEXTk+FHHLjWgmFYiKkmmE8RUblP5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyjAc9FxjqHG8+sL53EjQhApEP4eoKvih2Ut1Sx15RS20i0+Th6
	4QzHNT/CHoD4qXvRCwta4A6E8ZwJpahkNdLUhVjhMOLOL43u8bwa0tfvwlCi1cQ=
X-Gm-Gg: ASbGncvjvrAyWUjNqtjvoXw06VMFcI2J3K4IA6vdz/5uULP3rosVzN+Nf8duWhpEZJE
	dXLV9eGSoS+eNW4o5U2LccUNMwcM2seUcUp1tmdxRiGW3rs+AasGZe7OYgm7j5LOuIyHXNAR6h6
	zaOpKyDKFSkCpkwIj5aMmZ333cgJMkNcmrwfIKYiE+2tpO/QS1p1ZaL8rEtx5hjNUFOGq8Bva/u
	TGoWjKpeOZ1gCJEWgMfGp8OprKonM1FV78ePcs2a7MDuDvFum5jbzdclxgChvId78TDQ1PrZjsg
	tDrps7u4sk4KfpPtk2ag+yGuKjQf
X-Google-Smtp-Source: AGHT+IHyL/iAGxsNCgxot5kbeyyZgpCwkYAozWtkwnyndNThNfSseLduEbxfeuXjaZvP1Jxj6O0QvQ==
X-Received: by 2002:a05:600c:34ca:b0:43e:a7c9:8d2b with SMTP id 5b1f17b1804b1-440a66aaf1bmr8945465e9.24.1745565994713;
        Fri, 25 Apr 2025 00:26:34 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2aab65sm46521075e9.17.2025.04.25.00.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 00:26:34 -0700 (PDT)
Date: Fri, 25 Apr 2025 09:26:33 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
Subject: Re: [PATCH 2/3] riscv: Strengthen duplicate and inconsistent
 definition of RV_X()
Message-ID: <20250425-93c9f462a1980ebd7bbc515d@orel>
References: <20250422082545.450453-1-alexghiti@rivosinc.com>
 <20250422082545.450453-3-alexghiti@rivosinc.com>
 <20250424-f322adab22126ae97dd7c5b4@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250424-f322adab22126ae97dd7c5b4@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_002636_623145_D92D61BD 
X-CRM114-Status: GOOD (  15.07  )
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

On Thu, Apr 24, 2025 at 10:45:46AM +0200, Andrew Jones wrote:
> On Tue, Apr 22, 2025 at 10:25:44AM +0200, Alexandre Ghiti wrote:
> > RV_X() macro is defined in two different ways which is error prone.
> > 
> > So harmonize its first definition and add another macro RV_X_mask() for
> > the second one.
> > 
> > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/insn.h        | 39 ++++++++++++++--------------
> >  arch/riscv/kernel/elf_kexec.c        |  1 -
> >  arch/riscv/kernel/traps_misaligned.c |  1 -
> >  arch/riscv/kvm/vcpu_insn.c           |  1 -
> >  4 files changed, 20 insertions(+), 22 deletions(-)
> > 
> > diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
> > index 2a589a58b291..4063ca35be9b 100644
> > --- a/arch/riscv/include/asm/insn.h
> > +++ b/arch/riscv/include/asm/insn.h
> > @@ -288,43 +288,44 @@ static __always_inline bool riscv_insn_is_c_jalr(u32 code)
> >  
> >  #define RV_IMM_SIGN(x) (-(((x) >> 31) & 1))
> >  #define RVC_IMM_SIGN(x) (-(((x) >> 12) & 1))
> > -#define RV_X(X, s, mask)  (((X) >> (s)) & (mask))
> > -#define RVC_X(X, s, mask) RV_X(X, s, mask)
> > +#define RV_X(X, s, n) (((X) >> (s)) & ((1 << (n)) - 1))
> 
> Assuming n is arbitrary then we should be using BIT_ULL.
>

Eh, scratch this. We know n has to be 31 or less since these macros are
for instruction encodings.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
