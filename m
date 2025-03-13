Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB68C282EC
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 14:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZWT1qjbnGPSC0YeHeOV79DEv2KMvKlMrgqFYwWdSrW8=; b=2QXPdwqgj9qxqe
	NEL7GGZqc4ox3eLs9YQ3JcTqo/8uYGI3SmqQX8z/UqiozyGdrqp84e2U+AgRGn2mOILW1zClDgJQ4
	Glj+lt1yQwO99F1Ep0fQU5P5seSjo1lP+6ruYhimf8L1z5je8847lVlqkbtna+BQBk+U8DjvrN6Sf
	ccVjh5/hZUM1VXxbnuQEggvgU1YfDMAbV5k1ZCZzZ1N+7bNQRPdsit0DXWugp2d5X3UrBtVMIkNw3
	ax/QswW9Dy0UoXFm0dkOjKnKkVlb5SreDsyAZhgEOK+OASjDZgBDyH+wr1Iam1OgIw+U4n6Xnd8Q8
	CpxUb7YMDmaCsLL02IzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsjQg-0000000BVdx-2EWY;
	Thu, 13 Mar 2025 14:20:58 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsiGL-0000000BKI7-06vl
	for linux-riscv@lists.infradead.org;
	Thu, 13 Mar 2025 13:06:14 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso5626835e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 13 Mar 2025 06:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741871171; x=1742475971; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JykEzm+QtlDREfjY9aCf97M8p4eU9HkNtWKu9+Cs/cE=;
        b=jk2ddD3DI3oTlmqBDrsBrTUcWvJTQMYf1zIZ1cpiPs0D/HNzDBE7bf0pdFNJkE50Dj
         qm9Ho5RC1hv59kq1ia0iayblR5WHVhepPejwJ6vuZ9vxCn3O/IG9dxmEv2axd4xQ99i6
         2QJ3mKJOy1vW52jN+tbHW7y2qZcNDQzcYtvNfHK4Ta4mNEHzsE3+r1mSs5k1UYj38Na7
         it4Syk3kVbOPtDXM3XNGmeeQ8vrkiaipqUBGqswIozG19d3kpfSW0vgQc27z6DmwzyTw
         QEhkAQrivNPEoJQXGT0VRUzVbQfo9iMh5HJlukPC+RgrdAVLs/SrDdATIipKUvi7BHuw
         FZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741871171; x=1742475971;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JykEzm+QtlDREfjY9aCf97M8p4eU9HkNtWKu9+Cs/cE=;
        b=SF4Ml+2bsJB6JAkzX+BZEUfLezSWIJLazv57vpnySYKwhga58pS97y/GlLuFLI891K
         qAu7O8Nli8+0wLOp1OgGtjUNhPS2gKymd1+W1XmRGvHo0/q+NMKMemsA1kFTIzD6qgoT
         +iNCM5Jl2GZTQFLgPxg7Mv4k1E4sNn55omJ3W62A7z1IF1Bgb18sQMp5iUOuAlwiWuGh
         iurQZNvLofAvGdvNi9AAh5sica6pZ0FzkC+CL6YBJNTbZ92TeK2JvGfefsx9byqa+eJD
         dgWuLLvRSPhcxJp9ll6/8mccBQak2inbeHhnPzIJ/vlCSVl9lcR72hj5599ubaM2m1HV
         gHFA==
X-Forwarded-Encrypted: i=1; AJvYcCXBbuIs9zOge0osvPNF3FhnKulN3nmwsiJyY5WEf9/Teocw9qKsFC86Rz41SCMTAUJ5yKt5y8FjXWEYQg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwgIxPjmGkSrYWwhyx2Kc+urA35i4ocHUVvnr7ol3U9Foj/fCd0
	YcqQEmhFAQshdI6k6/iqN07WUgvuIkPNdqboCdOQ50EZWDQLTqoC5AQjgE5qPe4=
X-Gm-Gg: ASbGncuTZ5QKh71Jw7It5falmgva1RXwO08dNmy6f4a+R8KgE/uoTwM6hfapTwx0P+w
	E//I4abKTslnO+W+L2/HYsa73B4qGYox+i5tjJ7fDan+CwHWS0mDtk/U0uDn2n0/dqJES3Dhuig
	6peFn8UsFap4LyAB9IxEWDFeXtECynz+lYizosGYAwiLbOXEWOLWa0mEUOIygN5ONZ9tctKIkra
	2nzG+QMZ8s+HaeFK/RsHR+VTBiOlMohBQ/ChZzLJApEjjfWV2hEqe0rsm771ortCGKfMvycc9DW
	DyzjJTTNw+CpSTHa1ptUfisirjh14tQl
X-Google-Smtp-Source: AGHT+IHbHWsyXLkkKJFKW9xqRqjCmH9M6Hc04X13GIMAwv1uQuG0cXmClbOatlbE9Co87YMRA/AdwA==
X-Received: by 2002:a05:600c:3b13:b0:43c:e9f7:d6a3 with SMTP id 5b1f17b1804b1-43d01be652fmr113577215e9.13.1741871171136;
        Thu, 13 Mar 2025 06:06:11 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::59a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c7df413esm2048987f8f.20.2025.03.13.06.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 06:06:10 -0700 (PDT)
Date: Thu, 13 Mar 2025 14:06:09 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v3 06/17] riscv: misaligned: use correct CONFIG_ ifdef
 for misaligned_access_speed
Message-ID: <20250313-a437330d8e1c638a9aa61e0a@orel>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
 <20250310151229.2365992-7-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250310151229.2365992-7-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_060613_059184_4EB6C530 
X-CRM114-Status: GOOD (  14.98  )
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

On Mon, Mar 10, 2025 at 04:12:13PM +0100, Cl=E9ment L=E9ger wrote:
> misaligned_access_speed is defined under CONFIG_RISCV_SCALAR_MISALIGNED
> but was used under CONFIG_RISCV_PROBE_UNALIGNED_ACCESS. Fix that by
> using the correct config option.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  arch/riscv/kernel/traps_misaligned.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/tra=
ps_misaligned.c
> index ffac424faa88..7fe25adf2539 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -362,7 +362,7 @@ static int handle_scalar_misaligned_load(struct pt_re=
gs *regs)
>  =

>  	perf_sw_event(PERF_COUNT_SW_ALIGNMENT_FAULTS, 1, regs, addr);
>  =

> -#ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
> +#ifdef CONFIG_RISCV_SCALAR_MISALIGNED
>  	*this_cpu_ptr(&misaligned_access_speed) =3D RISCV_HWPROBE_MISALIGNED_SC=
ALAR_EMULATED;
>  #endif

Sure, but CONFIG_RISCV_PROBE_UNALIGNED_ACCESS selects
CONFIG_RISCV_SCALAR_MISALIGNED, so this isn't fixing anything. Changing it
does make sense though since this line in handle_scalar_misaligned_load()
"belongs" to check_unaligned_access_emulated() which is also under
CONFIG_RISCV_SCALAR_MISALIGNED. Anyway, all this unaligned configs need a
major cleanup.


Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

>  =

> -- =

> 2.47.2
> =

> =

> -- =

> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
