Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDB2C54ED1
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 18:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/g+tx3j4f9fgfLzTTESZGQmbUl6KXKErXYvYQOC0mYY=; b=toCXFXIoj7OMjl
	u0CwFdviUs06Cl7Ee7DrVholVxuyhqQS34J28CQycwA5mjoaqI7wZy3AyFYUQGTEYb6uoIdEDhLbV
	EU7FVgghuyQCWSofVifi/OWc5GaKXfCAoUEH8OK/Xg4iHlEjsw9mayzoL8rwV3mI4qHx1djjD7Z6i
	UNc2fIuF8PFGhNd1ttkMkb804Z4NsHAfSlpxB9gGvXWnwYy0QsHvG5xrYkaSvqawO04ZlmMz1wUUV
	LwiTtZ0fRFshYl+H9KErZ7GNAr/ulM7+ceTli0EkjWIzcRrEm6GQBY7ZaRAtuQBJwUT5P+KX7gVBg
	p5XwpHTI9AkQHxnSqGOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIXAU-00000004hFL-13Sf;
	Fri, 23 May 2025 18:30:54 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIXAN-00000004hCB-2MPC
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 18:30:53 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-30e542e4187so197904a91.3
        for <linux-riscv@lists.infradead.org>; Fri, 23 May 2025 11:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748025047; x=1748629847; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gWbUHPNgvAgT5G9XCmvjzlBHTlpN3kX1yERm+5eFQko=;
        b=GTpJmXgJEbv9LdtBuprM9A8n5lv4iU7RIedopP4jQe+6mYlBqYWqwuUrSrvtPx2fau
         QgN8HTd/2pll76IwzxBRmtLV7VR4rAZoTsChZKd8SRdqSRHl24oKSJ1+jxibX82zxjLe
         mZ4HoWjGIjKbFyWviJMvPaOkjw7wS8BHdqyGJErOzgY96Ve/S7woa2DjnAUKfVscxWSa
         CDwvYdhkM5hGlrkBz34MJYaFxQPZJxXoQXFbgzKzPlR/d3UIPd3EsfeCoG5H54Av408w
         GhAVKtLG7h9VEedozIora4LDg1xxCRQE4/pRdGAey041uxZ3t6N53dC2DXyaFzBUcj23
         D8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748025047; x=1748629847;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gWbUHPNgvAgT5G9XCmvjzlBHTlpN3kX1yERm+5eFQko=;
        b=OvYdhxkiHqkXWsnv4Psh7DEO55jo7ipNX2P4SHP9EM1MWExupHF57F9NXByONrqXxq
         2306fP51zrGavLk9HcQ5ElfOLNQX6M0xdoavfSXt5xe1CyylwNOsDjLaWh+xBIYOhpEQ
         GWOBlRejYo7uXuvy0aXGvlGpcNdZkaMfOTVc7x7cM2RGS98JLfZBm1jn/GxQSMnI4iPC
         /WrUgkIT3/Wj79CIvwUhICgN1vcktzWw3FFIdWuqk4CjAB1bQaeV20wQZKd2MNm1YRwJ
         pQ/l+o6MieRvdnGQHuV0+cFMcSayerW6QRCKVCMzfhXFCPM/sbzDktL4fLxNFiAPTVog
         +jtA==
X-Forwarded-Encrypted: i=1; AJvYcCV4cyOIPkNOaoNno4V2DPJHCAXjTbzMZC4B3Kal1y6GX6JH1HaMxq+kWGxnifXKVZcDkn/kojooOHLGAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwBkn35mbgDCI2lDmYWPXHmf1+r3+ppbcweLzqmLcnIqzDkfNc2
	8cDtG6dVdHjBqhkMAEfNnuQJ9Ld0YxD26ff5vwi4hDtiv4gupsiT4VTaKWSUSeePRiE=
X-Gm-Gg: ASbGncv7Tka6K9m+9DEPZoOEiXuqQ25ma8waObOKrJPsr90bm24F+XyPRP652MUb48U
	3VIuayKSxXFVCtz9ydWyYWl3aTM9Tca1k3+sHc3HCFZeD2MfHF5PCapuApLdAMSfuuMHVNQMOvQ
	8Pgdz58zlR36xdp12wVRb4xFtCuqM5+KRD9MJ6DVagSfB8Vyieb1FguwtUIrp9sN4CXxr6CdZuZ
	YoR9bT/+Fq2dcWi4zPPMb6lASYF2lgyfDnJRSy5MIeSxox85FLwTeIVteT3Ixt/8pwBa8OQocPt
	llX/dJPb6ESOwc7yFzj8sa1twh6Os1mrcyDkmxO/MiXysyE=
X-Google-Smtp-Source: AGHT+IF6EgWK2eUC5Xu5iRop7pXN3/Fhxf1IfDgAGTEelKq535OUbR+gaTA3ptsvLBrT9R7jy18zfQ==
X-Received: by 2002:a17:90b:17c1:b0:310:c46c:ee6b with SMTP id 98e67ed59e1d1-31111a4c866mr121461a91.33.1748025046448;
        Fri, 23 May 2025 11:30:46 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:bb2c:c7d9:9014:13ab])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-310f7eb53a9sm1014559a91.12.2025.05.23.11.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 11:30:45 -0700 (PDT)
Date: Fri, 23 May 2025 11:30:42 -0700
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
Subject: Re: [PATCH v8 09/14] riscv: misaligned: move emulated access
 uniformity check in a function
Message-ID: <aDC-0qe5STR7ow4m@ghost>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
 <20250523101932.1594077-10-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250523101932.1594077-10-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_113047_592223_E0AA9B67 
X-CRM114-Status: GOOD (  22.30  )
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

On Fri, May 23, 2025 at 12:19:26PM +0200, Cl=E9ment L=E9ger wrote:
> Split the code that check for the uniformity of misaligned accesses
> performance on all cpus from check_unaligned_access_emulated_all_cpus()
> to its own function which will be used for delegation check. No
> functional changes intended.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/kernel/traps_misaligned.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> =

> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/tra=
ps_misaligned.c
> index f1b2af515592..7ecaa8103fe7 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -645,6 +645,18 @@ bool __init check_vector_unaligned_access_emulated_a=
ll_cpus(void)
>  }
>  #endif
>  =

> +static bool all_cpus_unaligned_scalar_access_emulated(void)
> +{
> +	int cpu;
> +
> +	for_each_online_cpu(cpu)
> +		if (per_cpu(misaligned_access_speed, cpu) !=3D
> +		    RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED)
> +			return false;
> +
> +	return true;
> +}

This ends up wasting time when !CONFIG_RISCV_SCALAR_MISALIGNED since it
will always return false in that case. Maybe there is a way to simplify
the ifdefs and still have performant code, but I don't think this is a
big enough problem to prevent this patch from merging.

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>

> +
>  #ifdef CONFIG_RISCV_SCALAR_MISALIGNED
>  =

>  static bool unaligned_ctl __read_mostly;
> @@ -683,8 +695,6 @@ static int cpu_online_check_unaligned_access_emulated=
(unsigned int cpu)
>  =

>  bool __init check_unaligned_access_emulated_all_cpus(void)
>  {
> -	int cpu;
> -
>  	/*
>  	 * We can only support PR_UNALIGN controls if all CPUs have misaligned
>  	 * accesses emulated since tasks requesting such control can run on any
> @@ -692,10 +702,8 @@ bool __init check_unaligned_access_emulated_all_cpus=
(void)
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

> 2.49.0
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
