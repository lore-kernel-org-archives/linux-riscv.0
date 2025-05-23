Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E60DFC54ED1
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 18:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lh3q7kY2kI9qINZ+qBqItrL6KetVSJ+8at4EyJIorDw=; b=lLXmPv56fD2Jjg
	yerxeAYH7Tw0CWxIhce1+ymgLI04qICvUKL2Ln/Ij5QdBu5i4iNRH0v+uv1O1E8EzdOIExbjfnuSw
	NBXL20O9Jl44GGbIryZafKuAqiZudWGpusKlV7PfQZ0Et3ttcjq1G2DXMBFbFFupbikFDMXkLXPxq
	j3aiciYsAn+b83DUcvpUjqYiwvVNd9R5oF3A/o7DcANjsJnzqKsjSrtk9Gg/vmkGIZlN2EbHLYBet
	IypNaYnPzOzs0lRGLxm2ltS2IJDJukAWaoJEBvj9xhReL8RxJi1/BEUqnAwdEYVFoJyYOh95a0muq
	wBBR7QJvYCBsdXEf7tTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIXIR-00000004i8w-2eic;
	Fri, 23 May 2025 18:39:07 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIXIP-00000004i8H-3oDL
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 18:39:06 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b1fd59851baso98679a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 23 May 2025 11:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748025545; x=1748630345; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Brp4+tqBANTAovFCP7pOokKjsZ8jKRtxHJAFYCZnyiw=;
        b=bmyY9PsbDeXFEYVygXPlDmZGNM1KAx9LXny3P8JC7RZUKvtRf3EiBagjswie0YiyAG
         wmEPPplXDhZyppIcXhT75qvJhhSy8O1C3Uoft/Px5pZCBvtalk9QX0Ue2cTqlw3Mydg/
         X0X0cKIspy1WmXfpyW6xXgIJreN3PbP0xfWKR0mCSYns6pYmI28CKNwKdjgVBDuAlRwu
         bJv33v6QEBR4Sy4qaIXjCJYwph8rlL7cRYPo5q6M5f19n0Uw0t2tTE09mte8qa8AKaH9
         ws4Z1jfwwnMXM2YkciM+jTjh1JxU09qp5woCpG34iwwobRY4qoK91GC3su1gU9uvBkXv
         kyVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748025545; x=1748630345;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Brp4+tqBANTAovFCP7pOokKjsZ8jKRtxHJAFYCZnyiw=;
        b=PXJPRLWNHa6uMqwAdQ6rRmIw7DFQZX2ttmSmoaGPnl5jTPetFP0U5ORBuj/E4rKMw1
         qbpJTlrOEaPjekaZrtcqCEAyKAYvgTuCGUDYLLvaaGbeH5R/rv0/URRn6JWvZHTb2uUt
         UU32czvM1XoQN9N1Vw1cTFFxzwTrTLT+cNNdbENfdPi+2wDTkbjD2qWgiAMgSM4ovM2i
         gfGtb330YQGIBEC8W3oc/wS3ZzioaM+wgpXAoOEvOCBLjKpSwn+i7+Yq5w3QMpegGkHl
         2XUnAzYjF7AeWgWEsTCCwTO9h45cUsOiFcg6iZn7SJ4X1pnC8vjGNEYYGO4HXoyP5EkX
         txZw==
X-Forwarded-Encrypted: i=1; AJvYcCWXu0UPmWVREhcJZOiGFlByUcb/vJhcP9HIuQsVQrssju91DwBAweGoXYfPZ2pfKquplpSAre+J5SkAIA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyhYKQ2Fm7sVGsSy6nzEUbqMwdvZrodzYZo8+jjRCflL0HtAWtq
	hWW3CQtRL7lyoRHP7k88QupWGpgZTmgICoglyn7ixNsXQ++Hzt7rkNZa8HDOwC1W6VY=
X-Gm-Gg: ASbGncsVSuJYq62UjQBbBloNyU0GGj5dlUa7U9bbKXODBAih75NBgKaHt+gUiMO214B
	1BBuy8Sd7AbEvwRZPihsJVXDCM3Ma7XfdrATQUrqA44yKqN65Hj15rCFzU8HruTXT8vfLNQQ2Fv
	c789UhOe6HwVPkQC30uu4x21Gp+gEWVIbWaDH+O4o+NSOoJrdxL6Q44xb3Hlx3tlhpDKwsibgQ7
	GesBBjNTDcoG944IAFrScrU+RNmX7BiXDburH6/XmX/SN5ui/biPDHndWA73g7HxXP4Ep2Pzn/W
	vT7No9XbAC3C0JjmpvATS/a1rgSI7JXwUuOm/rjJp4/MOh4=
X-Google-Smtp-Source: AGHT+IF/W7rgN2cGONT1rL6VsHTy6gKpmlK8jFDydK2LaE8qLgbyfqjrk3Jd1cMhblWh+YfsU/FBoQ==
X-Received: by 2002:a17:903:b8d:b0:224:93e:b5d7 with SMTP id d9443c01a7336-23414fb2593mr7004755ad.34.1748025544999;
        Fri, 23 May 2025 11:39:04 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:bb2c:c7d9:9014:13ab])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ed2508sm127432885ad.221.2025.05.23.11.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 11:39:04 -0700 (PDT)
Date: Fri, 23 May 2025 11:39:02 -0700
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
Subject: Re: [PATCH v8 10/14] riscv: misaligned: add a function to check
 misalign trap delegability
Message-ID: <aDDAxugIa6XhLSSv@ghost>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
 <20250523101932.1594077-11-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250523101932.1594077-11-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_113905_946991_055FA0FB 
X-CRM114-Status: GOOD (  18.92  )
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

On Fri, May 23, 2025 at 12:19:27PM +0200, Cl=E9ment L=E9ger wrote:
> Checking for the delegability of the misaligned access trap is needed
> for the KVM FWFT extension implementation. Add a function to get the
> delegability of the misaligned trap exception.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>

> ---
>  arch/riscv/include/asm/cpufeature.h  |  6 ++++++
>  arch/riscv/kernel/traps_misaligned.c | 17 +++++++++++++++--
>  2 files changed, 21 insertions(+), 2 deletions(-)
> =

> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm=
/cpufeature.h
> index 2bfa4ef383ed..fbd0e4306c93 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -81,6 +81,12 @@ static inline bool unaligned_ctl_available(void)
>  =

>  #if defined(CONFIG_RISCV_MISALIGNED)
>  DECLARE_PER_CPU(long, misaligned_access_speed);
> +bool misaligned_traps_can_delegate(void);
> +#else
> +static inline bool misaligned_traps_can_delegate(void)
> +{
> +	return false;
> +}
>  #endif
>  =

>  bool __init check_vector_unaligned_access_emulated_all_cpus(void);
> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/tra=
ps_misaligned.c
> index 7ecaa8103fe7..93043924fe6c 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -724,10 +724,10 @@ static int cpu_online_check_unaligned_access_emulat=
ed(unsigned int cpu)
>  }
>  #endif
>  =

> -#ifdef CONFIG_RISCV_SBI
> -
>  static bool misaligned_traps_delegated;
>  =

> +#ifdef CONFIG_RISCV_SBI
> +
>  static int cpu_online_sbi_unaligned_setup(unsigned int cpu)
>  {
>  	if (sbi_fwft_set(SBI_FWFT_MISALIGNED_EXC_DELEG, 1, 0) &&
> @@ -763,6 +763,7 @@ static int cpu_online_sbi_unaligned_setup(unsigned in=
t cpu __always_unused)
>  {
>  	return 0;
>  }
> +
>  #endif
>  =

>  int cpu_online_unaligned_access_init(unsigned int cpu)
> @@ -775,3 +776,15 @@ int cpu_online_unaligned_access_init(unsigned int cp=
u)
>  =

>  	return cpu_online_check_unaligned_access_emulated(cpu);
>  }
> +
> +bool misaligned_traps_can_delegate(void)
> +{
> +	/*
> +	 * Either we successfully requested misaligned traps delegation for all
> +	 * CPUs, or the SBI does not implement the FWFT extension but delegated
> +	 * the exception by default.
> +	 */
> +	return misaligned_traps_delegated ||
> +	       all_cpus_unaligned_scalar_access_emulated();
> +}
> +EXPORT_SYMBOL_GPL(misaligned_traps_can_delegate);
> -- =

> 2.49.0
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
