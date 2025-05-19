Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D0C6C54754
	for <linux-riscv@archiver.kernel.org>; Mon, 19 May 2025 23:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=atGUn/xPhlOVCzZoFdVXjCo+5n6zNC989A39vlz9wqI=; b=SQJVPYYBd7beu0
	b5RJBigDBJo9FJTmjEGcxIn7LHvXK6Ry3I5uEnnco0/C5H94MSbmhONaKzKYl9iDbr8s0yS61MPQ1
	QR+KwcOD/vr6/oqxrgCfU8APAoa0vzP15+rCDkYFzCfb6Qho5ynaiVYxYLLUZp/OX27Dvi52Xt3IF
	XpsAnTAQmwdVyErL5rqOtoriMe1lkmlJgN4nBCeGjBVM+ApvEACwl6HovDRMZ/m5GknpeXNWaAYsf
	YKpUAJGBt+eKMsaOOHCmgjmpuB1R1wLaie5bh+4xNHUTsiSQQYXzRJkNS0f3lRjnKbGCaoUfUeyVl
	XLPLwZMmnqzGqKPjHScw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH9xp-0000000AurF-1Pm6;
	Mon, 19 May 2025 23:32:09 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH9xl-0000000Aunb-3QaG
	for linux-riscv@lists.infradead.org;
	Mon, 19 May 2025 23:32:08 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-742b614581dso3524373b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 19 May 2025 16:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747697524; x=1748302324; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QOyUGS8X8xHimjiVikyyoBlw5XuU3QFPDBQZu8PO5T8=;
        b=BaAzA6cHKejrc3L1QrckviNmTrrR5YWmsd3BYuEPMUwai+wILxkDWHVo8dR3vEA+BF
         0KOypcVslSnrzLeq/nDjJtJN/BXy1XB22sY7rYbquUu4W6IX8zteU/BhamHJF9zN6qMN
         r5UgPr4vLHAgji6pwp6mm7nfhfsP2eaARdIKR2yJ6bV9Ni33BHIBjV7zKTMTmRHxCRZs
         den0gcZxqdkOM2PHzeyA+SV6pU15yDCTiSwWPT4N/kcuBNMYv/xFJkEtC5/Z0bntzdk1
         JxIgzdAysB3akvgLGn7o565JI0Tl08oXdj85k7STKbNueOVZk6HjmXZNssQ7q41mq/Bi
         djPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747697524; x=1748302324;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QOyUGS8X8xHimjiVikyyoBlw5XuU3QFPDBQZu8PO5T8=;
        b=nluLzv5Nz4AE9Jxsso5RQMv7ruJkSWCJKQxYP2jK5qkXTx4Fx63EiTugnWPeNTGgUF
         qXc9AuH7/wCffQTwLoBC56sUPA+9o8gVmSY1FwVzBmvgLRMc6Z/1uX1sgk3N0rx+TBag
         G/HCEFrtFqN31+kyS16fmhw+ZCi4IKwOPcXyBYY7wS4DXcFKG5/fv4L54Ix/QwajBolW
         dyxCWuolJkk889UsU445lYZeOkIQapHbZ00c574DLQtvqHkOwiI6SdKpNhvxrvpC9yby
         6rShFxPng5UWMSyMFmEcYr1Pnkhgi0CunDIb7NZ+ClGCRsb76MN0GqVRmSFCAC4TqdeS
         tvcg==
X-Forwarded-Encrypted: i=1; AJvYcCVtqIEsicXTR0ESb4/+ZE3OFSFB4dPJuMB3ObThHcUvOElX3RHRQXEsnTzy+xqDKWjd2nCbNgsi5PKPBA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyF6AwMQOQi6jaE6yey6NGeYDRFsOZvvP4/pOrSzPBvLFI9o/Wi
	DLU8AkbxLSiYWprUMBxvFyc2XeZ04BTmv5qXhLKdx65PS123VLyxnhLquUF/knjwRRg=
X-Gm-Gg: ASbGncvEKQsFiodh7TeUUrD6IYfgTQjA9hHKsdCLzwojKAllkiDoXDBZq9oJKRcT20l
	3C9n1Se96g3bsv7RO4h+fQfTIV8RO2zRFNZwg/yGwFXD2WwHFL9jzP+jEWXs19i3HFQcU7pc9E8
	8QMrpBg6jVIcer0Aedd0+a3Mh+H4TUPJD9G0KXOmTqDnjC31+kND/NzWL6SrDhMZqrQnMTBLFjE
	lyF536wU/YE6RmTdxLrm6UjuLYXA8e32EpOsCgQ5aE0eCZWoVWlNkbruwz6jMI0XeGLOGa9tStg
	gokYlG2NDG0snlePXYLclt1PnfoXyidRuOrE8+TiaOQ/fsY=
X-Google-Smtp-Source: AGHT+IF/UpnfYd87Wg38QzExFJepdbUZBdK8n48P10QCBwcJgibQDw+FN+/Y6470diBydPdUYMEijg==
X-Received: by 2002:a05:6a20:3d1c:b0:1ee:d418:f764 with SMTP id adf61e73a8af0-2170ce33ad3mr22022427637.38.1747697524568;
        Mon, 19 May 2025 16:32:04 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:5f9c:a71e:a2da:158d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb0a9893sm6875885a12.72.2025.05.19.16.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 16:32:03 -0700 (PDT)
Date: Mon, 19 May 2025 16:32:01 -0700
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
Subject: Re: [PATCH v7 09/14] riscv: misaligned: move emulated access
 uniformity check in a function
Message-ID: <aCu_ce-kVQsyjrh5@ghost>
References: <20250515082217.433227-1-cleger@rivosinc.com>
 <20250515082217.433227-10-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250515082217.433227-10-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_163206_067427_24FD435B 
X-CRM114-Status: GOOD (  21.32  )
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

On Thu, May 15, 2025 at 10:22:10AM +0200, Cl=E9ment L=E9ger wrote:
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
> index e551ba17f557..287ec37021c8 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -647,6 +647,18 @@ bool __init check_vector_unaligned_access_emulated_a=
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

misaligned_access_speed is only defined when
CONFIG_RISCV_SCALAR_MISALIGNED. This function should return false when
!CONFIG_RISCV_SCALAR_MISALIGNED and only use this logic otherwise.

- Charlie

> +		    RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED)
> +			return false;
> +
> +	return true;
> +}
> +
>  #ifdef CONFIG_RISCV_SCALAR_MISALIGNED
>  =

>  static bool unaligned_ctl __read_mostly;
> @@ -685,8 +697,6 @@ static int cpu_online_check_unaligned_access_emulated=
(unsigned int cpu)
>  =

>  bool __init check_unaligned_access_emulated_all_cpus(void)
>  {
> -	int cpu;
> -
>  	/*
>  	 * We can only support PR_UNALIGN controls if all CPUs have misaligned
>  	 * accesses emulated since tasks requesting such control can run on any
> @@ -694,10 +704,8 @@ bool __init check_unaligned_access_emulated_all_cpus=
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

> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
