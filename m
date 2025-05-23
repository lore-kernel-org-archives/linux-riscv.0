Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4726C54ED1
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 18:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c8fQaKoNPmih7y4R/1TedhhxeYfPxtnjOD702K6wgaQ=; b=DnKdFhc/bNF4rU
	cYwpMz/jvdc/xlNVBIo1p5GjdeaILOqpfnci9Nbqy7UT2D/pL3xScacSyjbfKY3uTP1Sv3FZWaZBt
	M8x2kobeh/W+SLN446lobeJ93EQeiWS/RmbuWs544Y64sNGFQ8+4uwGGgXrPf9dFAFJMhENiMOG6V
	3BY94j95EFR1fAClPbJHNHtrXvLQS0eY7yJM+6Pl5cel9i9nY9wH4tuFaHoLkJbvpTRilShPGYdwc
	otyH6BwAQCJ+xU4QmDiDO4fRyPCxmyxmazt5zz/lIcsctgSURCYWdNMcxodMdXBq/6SKOKl40Q5zu
	6+S3HGkEEAslSlx930KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIXGi-00000004hu5-2Q6Z;
	Fri, 23 May 2025 18:37:20 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIXGg-00000004ht6-0H2R
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 18:37:19 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-742caef5896so262830b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 23 May 2025 11:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748025437; x=1748630237; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+jN5GB4ngQwEolzoVEKYGux1P77VDkeV8jyjKjQj7pI=;
        b=QLmTBOo9XAXP0/vz0KeI3ZtLQeniA1V0lPUBPVIQqv3ZAoKmZFoaoHDtxvC90zq7QA
         tPZ4qg5P1rGTZYQ3Wdf93iZZPXmUgOT2tKKNRQD6X+3DAoYWjiHiWarEV/eA3GIW0+OD
         vzZR73RwFRKlqEQlk76KX4ERdFi/wlDA0zp7wt1LmUg//MWJ+WYYJxaGzI1K1rpqPLMe
         2PvesQ35vmzm5bHXGAE9qUfSbEl5h96EhaNcqaxz4oH0Bup6o73je5L2FbqaM4OV8Ptf
         gITR47/6DJaYfGWMTQUDyTPKF9Z5ozIP6nobpbMnYs0rYgoJt8+IVVsiNu73pjTr/493
         YkMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748025437; x=1748630237;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+jN5GB4ngQwEolzoVEKYGux1P77VDkeV8jyjKjQj7pI=;
        b=cnB96WWMu848ih6okERCrFN7OaDcV3em8Z32m1MuEPHCyLz/XB4uSLND5TAigyElOM
         etlO7jonYFcuuFnQycpUdG7SR88mTpCwk3KJtr2JRJk8U7dEOXtznSskcWNB701HrQeI
         Bh08jycCjOnauX8dsKKjLi6dpzyM9Zj+zT5FxYWczsl2ORoqi2ScaZKe0617DI3uyzmC
         ZIHPqwyknAUhsbWXq3IoZ4B2Il27Wc3RnJqKX3A2lkdCDRPACr+RGqTJ7tMaFcGm0aJy
         AKN5+4jbeusTNHZZ0p9+5OClbPJBpQlF8bTt830tbwJUSYZhJLS3a3iiiI7IMKdh5Ey1
         i6pA==
X-Forwarded-Encrypted: i=1; AJvYcCX/F1AccUAUJMdlXVxnfpmKhIBUNdrOEr01vEJ8n/f/W8zzxbLPgzYoadPunXMCv9yg6z8BrtNdnX+VdQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQLb9fAY/g4/gw+CJvshuq4NlQpkgAN1a+l3fBWW/OGPgN4u5B
	SLeZZNy4/pRGDC58AEh1rJHyK+kpg35PhuzwQ23yc4CH6nYaVZmHppgVUPG7/wtS13E=
X-Gm-Gg: ASbGncsC8BLD9UGIzA37Q2Him7MNZHhcthiNf0ZqDsDHw8BNRAhIsqdkn4Xl6Icu+7M
	5AiFaFW3XBRB3du896rRIsxK3um3PV/Bfk+uVgU1Mujjz3aawEH6PpW32DXN6xKdu2aZYF8pSno
	Ch0Foo3RCNTqsZzamygwKzJRF9YGsenfLxbZ2WvtUZItoJkVkV82y2nI8OFywkjo7YePikHTpKL
	XMX1/gdZdmY9S0WoANUnCBxpVlnrvnSYm3/rRDdbJtwm2UDcSG5eOq4ucfvlXRExztdtzj8o8D+
	FoPrbPhP3EiHmk/2JjBsiZjNYGoLXbORGDSwqUVEWUq1lgY=
X-Google-Smtp-Source: AGHT+IG8tomY7/3cAclRkVBgo4GdCG/oz04LT8S0Un+srTCw4pvpQpH3EIf/46AHjipa24+aocSy/g==
X-Received: by 2002:a17:902:fc44:b0:22c:35c5:e30e with SMTP id d9443c01a7336-23414f69078mr5977735ad.13.1748025437265;
        Fri, 23 May 2025 11:37:17 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:bb2c:c7d9:9014:13ab])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e9736esm127127745ad.149.2025.05.23.11.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 11:37:16 -0700 (PDT)
Date: Fri, 23 May 2025 11:37:14 -0700
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
Subject: Re: [PATCH v8 07/14] riscv: misaligned: use on_each_cpu() for scalar
 misaligned access probing
Message-ID: <aDDAWmNlr_mzrdLm@ghost>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
 <20250523101932.1594077-8-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250523101932.1594077-8-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_113718_107096_71DD22F6 
X-CRM114-Status: GOOD (  18.73  )
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

On Fri, May 23, 2025 at 12:19:24PM +0200, Cl=E9ment L=E9ger wrote:
> schedule_on_each_cpu() was used without any good reason while documented
> as very slow. This call was in the boot path, so better use
> on_each_cpu() for scalar misaligned checking. Vector misaligned check
> still needs to use schedule_on_each_cpu() since it requires irqs to be
> enabled but that's less of a problem since this code is ran in a kthread.
> Add a comment to explicit that.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>

> ---
>  arch/riscv/kernel/traps_misaligned.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> =

> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/tra=
ps_misaligned.c
> index 592b1a28e897..34b4a4e9dfca 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -627,6 +627,10 @@ bool __init check_vector_unaligned_access_emulated_a=
ll_cpus(void)
>  {
>  	int cpu;
>  =

> +	/*
> +	 * While being documented as very slow, schedule_on_each_cpu() is used =
since
> +	 * kernel_vector_begin() expects irqs to be enabled or it will panic()
> +	 */
>  	schedule_on_each_cpu(check_vector_unaligned_access_emulated);
>  =

>  	for_each_online_cpu(cpu)
> @@ -647,7 +651,7 @@ bool __init check_vector_unaligned_access_emulated_al=
l_cpus(void)
>  =

>  static bool unaligned_ctl __read_mostly;
>  =

> -static void check_unaligned_access_emulated(struct work_struct *work __a=
lways_unused)
> +static void check_unaligned_access_emulated(void *arg __always_unused)
>  {
>  	int cpu =3D smp_processor_id();
>  	long *mas_ptr =3D per_cpu_ptr(&misaligned_access_speed, cpu);
> @@ -688,7 +692,7 @@ bool __init check_unaligned_access_emulated_all_cpus(=
void)
>  	 * accesses emulated since tasks requesting such control can run on any
>  	 * CPU.
>  	 */
> -	schedule_on_each_cpu(check_unaligned_access_emulated);
> +	on_each_cpu(check_unaligned_access_emulated, NULL, 1);
>  =

>  	for_each_online_cpu(cpu)
>  		if (per_cpu(misaligned_access_speed, cpu)
> -- =

> 2.49.0
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
