Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5297CC282DE
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 13:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q+7HsF/jxJeY6G7NTZrTn8UTGIzT+dcRLmn6eHALb+g=; b=zZvAYWU2tRiTM/
	5ktHk7zBEogKFgoWoCmCLZVGMCzerm81KPhB/8eeOu6MikXwVi0VNqBnNi8+9G3PcXgJeiEAHcI5B
	uSyQaQlBAAKV0e8rzF8GRf/4PFCS9gbBA1JuU/ZgYqhbCcaaqhHcVYx5U5/qukBjzu4ni/ofksXm3
	GY1N1WlZ9awAAc0yTEce0fPzo/rtD0cRtxXV0NDqcM7gNfB5l4APppCQUB/AxB/cH3tu4sGb7ygbn
	gXPi8ZfbOW6HgKsl9soI7LasPNERurBX03ofk15kfSAEaES8dhhx3bcQuPphoNxVuONqKx/Rl3/rr
	iHzHObQ1bOs9fceio41w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsiJt-0000000BL0S-0FSb;
	Thu, 13 Mar 2025 13:09:53 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsiHR-0000000BKW5-0OFk
	for linux-riscv@lists.infradead.org;
	Thu, 13 Mar 2025 13:07:22 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-39133f709f5so579874f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 13 Mar 2025 06:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741871239; x=1742476039; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kL64DFiTXok1q71S+zi/kYHeS1QK7/sbz4oMoXWMASU=;
        b=epTd4ycYsd3WfAjc3ZXG0a5A2fPwJUZl9+EiiRsFvCAWIpu0+OqbWR3RO6HbG4Ck1q
         C8UWE/8qF4+Em1cz58RLK03QDn0oIK1ZT2cf5iK+MK2Hf9puSvLpVaJ+KTcGPst6mHjI
         qHGSeoS2OHTvfIBXqG3togFWhXBQ3hrU7f5VHOpWuee9LAM3/eIDDuNHiy5NxLTIjMQ2
         sez7VucSSKQsKlRqrvvo1NHMcHuOei0pnqEwnRpK1sfrRZ0yI0P5Dt+G8EGnOxIg6vMv
         joI7MzsKPP6KtgitZCf+d1aKS0/1hAoL8LW5dI6mCEYSsxyh87+Bhe/FRjvn5FtetB9T
         H6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741871239; x=1742476039;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kL64DFiTXok1q71S+zi/kYHeS1QK7/sbz4oMoXWMASU=;
        b=BpOM47+s0BKdJT+nulJM4LSLlcEYEcYXcgElqzhp5YrRSn7sKXUl0kN3h1lDiBM3wa
         Q5VPJWUa9Q7PwmDgrDxvzzPpWqWgvSIHq1XJIukqT8OPijyZX4BzsbUkU9zEoY7ekvMl
         cbrX6kU158hoJiuchQ6uywmT24hv6BBvKN0s+VdL54gSUVXyZo8mpmICaI7XPfbwwW5S
         wIX1v91rSghrRPcVeE+a/lBoSF4RzmKHVQJVFf01RU1IqS0ZWkfDpZdhR/Cv60DA8U6E
         qUV2TeJEp/fqbllOj6PC+DCWxoGh9s9v34PBP/x5ypxG8Suhnz/XqIOwih+QxMpQzqYH
         Yp2A==
X-Forwarded-Encrypted: i=1; AJvYcCWGmLAMrCnIcOnjyiWRUS/CKzo7T8kRTSCOEpmGV4qDZukMJRa91LuEJxGqCdfINYJy8i0Zuztt5e3Hxg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzeP/dHpbR3fyVUTfM2L8U7bGQcqHm19PVMKA+9qdWQLVQ173Lk
	3quuci2GKRxHfbSvxM0SSdsvzTGUp4FojGWVNKfTcN2yMCLM8djEJHUhZmbJZo4=
X-Gm-Gg: ASbGnctLl8FB74M9nmXBKPLKCw4VrhcJkgoDhb42xceTDa9RoROMyHIK5vT18djjbNR
	Z5SLaLEHpGZxo/0zRD9lH83l19hhyPmjgtvZ/sOB8AW300bil7Rx8UZrlo4EwdQzXQi5i4P02cX
	zfH/QADPIL6R1a5vnFdmnJvCkwv8iIPr1MWt46u/NlXNbuTKUkKtBx8rkRI/1uYi5Ou2GZTTZiB
	HONapLCZv5RkbqxxzfxTFsip3iqjoeRYBieo9svmmg9OHvxIUaj8jaEV95delDA5ePF2xdZwiaS
	AlUMuIiLsieeaJr5BW23X/oVmAcVumQr
X-Google-Smtp-Source: AGHT+IFa3kUJDoicJ8fhht/dP0MNLzwH7jshhQs0/MiP3cN1RHdBOvdNu6RA1GEeL6KH0hkbmig8fQ==
X-Received: by 2002:a05:6000:18a3:b0:390:e7c1:59d3 with SMTP id ffacd0b85a97d-39132d16de1mr20255337f8f.2.1741871239342;
        Thu, 13 Mar 2025 06:07:19 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::59a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb7ebbc3sm2013164f8f.88.2025.03.13.06.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 06:07:18 -0700 (PDT)
Date: Thu, 13 Mar 2025 14:07:18 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v3 07/17] riscv: misaligned: move emulated access
 uniformity check in a function
Message-ID: <20250313-89b46bd06fbea0072ac4932f@orel>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
 <20250310151229.2365992-8-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250310151229.2365992-8-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_060721_134546_4430D96A 
X-CRM114-Status: GOOD (  18.06  )
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

On Mon, Mar 10, 2025 at 04:12:14PM +0100, Cl=E9ment L=E9ger wrote:
> Split the code that check for the uniformity of misaligned accesses
> performance on all cpus from check_unaligned_access_emulated_all_cpus()
> to its own function which will be used for delegation check. No
> functional changes intended.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  arch/riscv/kernel/traps_misaligned.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> =

> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/tra=
ps_misaligned.c
> index 7fe25adf2539..db31966a834e 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -673,10 +673,20 @@ static int cpu_online_check_unaligned_access_emulat=
ed(unsigned int cpu)
>  	return 0;
>  }
>  =

> -bool check_unaligned_access_emulated_all_cpus(void)
> +static bool all_cpus_unaligned_scalar_access_emulated(void)
>  {
>  	int cpu;
>  =

> +	for_each_online_cpu(cpu)
> +		if (per_cpu(misaligned_access_speed, cpu) !=3D
> +		    RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED)
> +			return false;
> +
> +	return true;
> +}
> +
> +bool check_unaligned_access_emulated_all_cpus(void)
> +{
>  	/*
>  	 * We can only support PR_UNALIGN controls if all CPUs have misaligned
>  	 * accesses emulated since tasks requesting such control can run on any
> @@ -684,10 +694,8 @@ bool check_unaligned_access_emulated_all_cpus(void)
>  	 */
>  	on_each_cpu(check_unaligned_access_emulated, NULL, 1);
>  =

> -	for_each_online_cpu(cpu)
> -		if (per_cpu(misaligned_access_speed, cpu)
> -		    !=3D RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED)
> -			return false;
> +	if (!all_cpus_unaligned_scalar_access_emulated())
> +		return false;
>  =

>  	unaligned_ctl =3D true;
>  	return true;
> -- =

> 2.47.2
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
