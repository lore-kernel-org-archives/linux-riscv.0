Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F1AC54ED1
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 18:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t93A24HREm+z7kJXr7KJRUxn0RRrAv3z/YTNT/fmdY0=; b=hMWzzXHa1YMoJ7
	ZFrQCLDQSAPH52ZGEVuUMxl62ONNVAR362//rnuMOZNocRwfZnVkVWeDej+A5vh0wb20XPydmcYRj
	DIXPRonbmukYlzP4c3Jcy8Xm/61z/PBA6Zp+Cd8kDh//wi0pdzycyrqar4Ume7KY/w0RUPmehaSOe
	9lPOAe1vfg7gvG1YmNFHEr/KF0wb+E8nIWsr1y7bq7c3l4/y/1xG37Rjii72q6YvJNJMDyi2jt8UB
	nk4WrQhc+2VU6gszQWppvm+k9RphMsOVaGoUm9p2SlRa++WT+ogLIzsq/5upILsH0MR+MlVJH+WEW
	eAZTiOb2DUE/aHDoGEGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIXFy-00000004hk1-2oqY;
	Fri, 23 May 2025 18:36:34 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIXFv-00000004hj3-3LlA
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 18:36:33 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2321c38a948so1991725ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 23 May 2025 11:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748025391; x=1748630191; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XnO8ioDanheZvAb9A+PQvS64cAnXAyms8SMalyfchF4=;
        b=10b+CDtnVlm5D3Od74zIwqSPnBHxb8tIjIfKZWI6kovXh30PcK0Rm92tVLpnChizcC
         khbnifiTy7wGG6u7OSaL6gFdHdzMPzTfjU0oXzVyGYMgaAvZ7DbU6vCliTi6/OFqIkyM
         +z26alAndOQ27PNIhkzDTrCNbizhC+oggs2PlZEccCVWajhb8HvgNUFjezCeay3JAtj2
         q4/dr8maCQJv/+CFtIKrxWUFlM+v889k86S9xb1D0X5iDBXAb8opnPilLaRq+k/hQTDh
         FcGzyq53Q360JKF45h5wP/jd6KxF0FM8T7ryR63t1mTqkQdyo+T7vOjAzstAUfs5AwYm
         QsOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748025391; x=1748630191;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XnO8ioDanheZvAb9A+PQvS64cAnXAyms8SMalyfchF4=;
        b=XsC9OIbblNKD17OOjst8WJbWXG50N1XoVS6v1kBKnFq+N4CZoJ9mc/CdylpngAeM3K
         hE/T/QeGhwKAemLRDp8oDnZvfroXn/bDq1kZ1WXe2K0/2VA1d3Hn7m+6McNw1tKz5fKp
         Xi/6Y+JMs3RLeBpRQ2eqxTwRX1UG558LSa4HqfSRZ6d/DNPdsvap4Gok1jCAK6xtXBvk
         Vl00ORNaQd3tRxYTxDDpUsqr7dOcC42ped31hDvzEKlonQIrjsnYtsQTB2ssQUs8eyBg
         jt2Oo3S33eypoNfHF8IW8aNZ9gbIRzKK+WgIuVzwKfjS1pf97yLa9PFQhwZgDHrVmd7q
         0KyA==
X-Forwarded-Encrypted: i=1; AJvYcCUAfkW/ba64yeZYRA5sMfiOIEL3twSVT1MKqzLnPEFU2W56kT2t40l6JjujEgI35OxKSvGGk54/qUy25g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzfxmZy40229OIV+HZAaFF0+FHSVbqskUiMpDl0TCmVRxeJkX7x
	eG98jrbjt2JIBHvxMgwHoGiYYdZWvLgOas5spAX7YgcFle/0ZG6pOtPETJCPtLIriU8=
X-Gm-Gg: ASbGncsyjteBADomvkooWOz5cKr/Q1GLdnghJ9Dn5sM1NngrKZvCzVgSNw78fJoYlJw
	l6J2QtInjqJTkI3tMTeSNzxlWXXwR8MIyJPQ4zzJ7V6nysH1R6JjWHQSq4DxD6R1dV6MY26fSGc
	ZVH4IZ3dRh8ILwaajHS6Aq29qtp7OoTe3oTmFAVDT8RUk/kDwbDFxpFt9m4p5VzhZ0Mr6UJDiXm
	ScM2K3dyc5mYfio7SWoAp0XeyWVsoCag/JwHMRwfF0hDnCgWVVJ7ODRFrEmH/tudimGW+FP7YqU
	+cFIXeLrf3hgXsskXDmVzrG5Ho/nKtNUgjGHS9JDc6qdW5ILGX1NpvopOw==
X-Google-Smtp-Source: AGHT+IEwnYCpZ451OQ3B+iw4XNmTax9n7nwuUqC+o2uJAltQvhC5r0FNuL4BvGINCHYUs7gwuPUCJg==
X-Received: by 2002:a17:902:da8b:b0:224:c46:d166 with SMTP id d9443c01a7336-23414fafe1emr6331075ad.40.1748025390826;
        Fri, 23 May 2025 11:36:30 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:bb2c:c7d9:9014:13ab])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ed897asm127271765ad.250.2025.05.23.11.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 11:36:30 -0700 (PDT)
Date: Fri, 23 May 2025 11:36:28 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Deepak Gupta <debug@rivosinc.com>
Subject: Re: [PATCH v8 08/14] riscv: misaligned: declare
 misaligned_access_speed under CONFIG_RISCV_MISALIGNED
Message-ID: <aDDALDt_k1ZoID1H@ghost>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
 <20250523101932.1594077-9-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250523101932.1594077-9-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_113631_845140_0ACEE9D4 
X-CRM114-Status: GOOD (  17.60  )
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

On Fri, May 23, 2025 at 12:19:25PM +0200, Cl=E9ment L=E9ger wrote:
> While misaligned_access_speed was defined in a file compile with
> CONFIG_RISCV_MISALIGNED, its definition was under
> CONFIG_RISCV_SCALAR_MISALIGNED. This resulted in compilation problems
> when using it in a file compiled with CONFIG_RISCV_MISALIGNED.
> =

> Move the declaration under CONFIG_RISCV_MISALIGNED so that it can be
> used unconditionnally when compiled with that config and remove the check
> for that variable in traps_misaligned.c.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>

> ---
>  arch/riscv/include/asm/cpufeature.h  | 5 ++++-
>  arch/riscv/kernel/traps_misaligned.c | 2 --
>  2 files changed, 4 insertions(+), 3 deletions(-)
> =

> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm=
/cpufeature.h
> index dbe5970d4fe6..2bfa4ef383ed 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -72,7 +72,6 @@ int cpu_online_unaligned_access_init(unsigned int cpu);
>  #if defined(CONFIG_RISCV_SCALAR_MISALIGNED)
>  void unaligned_emulation_finish(void);
>  bool unaligned_ctl_available(void);
> -DECLARE_PER_CPU(long, misaligned_access_speed);
>  #else
>  static inline bool unaligned_ctl_available(void)
>  {
> @@ -80,6 +79,10 @@ static inline bool unaligned_ctl_available(void)
>  }
>  #endif
>  =

> +#if defined(CONFIG_RISCV_MISALIGNED)
> +DECLARE_PER_CPU(long, misaligned_access_speed);
> +#endif
> +
>  bool __init check_vector_unaligned_access_emulated_all_cpus(void);
>  #if defined(CONFIG_RISCV_VECTOR_MISALIGNED)
>  void check_vector_unaligned_access_emulated(struct work_struct *work __a=
lways_unused);
> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/tra=
ps_misaligned.c
> index 34b4a4e9dfca..f1b2af515592 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -369,9 +369,7 @@ static int handle_scalar_misaligned_load(struct pt_re=
gs *regs)
>  =

>  	perf_sw_event(PERF_COUNT_SW_ALIGNMENT_FAULTS, 1, regs, addr);
>  =

> -#ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
>  	*this_cpu_ptr(&misaligned_access_speed) =3D RISCV_HWPROBE_MISALIGNED_SC=
ALAR_EMULATED;
> -#endif
>  =

>  	if (!unaligned_enabled)
>  		return -1;
> -- =

> 2.49.0
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
