Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60025C677C4
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 00:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=2QGm2CHRJGyEpM7f7llRAaKFkxe1M7c9AqRqMxPKPAY=; b=epNlGTNEgtZ/cYGkSUwwjydTAZ
	QPbmf82fD8lqTYSOEzDmG04bXQQNNT5UgC3dYTHX4rywftHN9Rsv3qFoxxK+6f13U9p6Q8PnpZ+/z
	7dJGPhA2Wm57fttCYy/z9Xq8L3kP5DjSlg43jmGt1PMljrtQtomC7PX1D1alKbvlHTvaxqDALl/4A
	jb1CY/k291iUk9Wsm3KJXlGsNE81aZ9nSc76ICPH3NykJH5qWQMYYnfT4NkIzHAHlo2w1hDAD++t8
	U1dB73u+hD1mqpq0R4jEYbwhHNlT97vsHEBnRuoOaGeLvjvOrne7e8g4zXLvo8PJIZBgCamBCV8tf
	H/1JFZYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP9j9-00000008VbZ-0r6O;
	Wed, 11 Jun 2025 00:54:03 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP715-000000089y6-0i2D
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 22:00:24 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2350fc2591dso2765085ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 15:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1749592822; x=1750197622; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4G2dsRaNLfs2nkgAzSn0O1Z1VlS3VRtVJRLvHcMgFCE=;
        b=agQMnroRw4QJtVfbJ0KkoCP+DL1Npev+y+rYURFXzOTd1nKpKff4Uxghmw7xyDNPSM
         PoG3dLaGjOHDPQsvyGeooNtf4AhjAcTZzJUtFKhzkSONiDKFHUhar2PoEOh+rQXP7/xU
         Yc515o3YTv3PDqI9ipzn/GIdntkKMMTQ5KnDTa9mWUmcO2W8Q3sezhQQE3WYKdrk8cE/
         w9OQhE3ZvthzmQEpWCmtG+upmEIBZeaTz7K8BFwuGIVNwlHRzMGhiT17cdkzj1McKjtw
         8jyUtKF+klg1n3/ePejZRU2reyDlJ9LmamzNe8DcN0akWuuWYF6UoFHiEOY0AKRpJs4a
         Ht3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749592822; x=1750197622;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4G2dsRaNLfs2nkgAzSn0O1Z1VlS3VRtVJRLvHcMgFCE=;
        b=UXqLE9Dyu7if4NQE0HPkGBZgrNSZZLMv7sjgNgx5B7qQqIRBE2umClOXVbWcANmrms
         rnkO5XreaS5S9Bsw/4S/hDDoa38V/qtKSCKSH8NCWK+It6WJz+9ribMh41LCKsDTquv2
         Um+u82G5p51v/oysKFNkJbd6kL3y9jRRt1X6UBHPGrkHLZBRLi22GtJHWGu5raEEt+e8
         g7N8tC+Bnr3+BrwyFoxPnBzPZXLoh+AsUxaSyCpLXeNapr1ag8NJ7u4lBp2tGAVxxGV7
         iuSEXIsLTrwmxl37PZpapoR10S+9bGzn8vecPm9Z/Nh4NVUmFRS01puOWnnxEaOC7zG2
         JwPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTMMurz+fPCvUXv6HI+UsGu+vOtt94iJLGXAsBzrRReku3dPYuFXeuqpqs1upiysn7+xcuNV/d2XclKw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwsKm1y3zoIJUa6JFGpCTRrrx88DXThxLWJ0MBLywcfJvPohGGe
	O4fBF48nze0u80ApFH1zB7XGtmhClol+PeDsGU6nlvPv4wgI4kHl0BWkIx6hiRyrVD0=
X-Gm-Gg: ASbGnct3DIvCTYhF25FW1t0DV3ok5FZ1xkItmrQ4Mxeg2mslUPwBH9J4V13nJIPeZtB
	CLNkizJXANmtAveYiwOqDV0fqGAWFUS+nWp/iARWYExS7icbnxMBhnzlih2zfIKcO3nwYHQiwuH
	pMAY/WDIU5nInu3TtQ/wGltbzVdlnjmtDO325/sF0rUNi5hDquKU61c2yHpbyCxousTfXWiVC6M
	usLZiTTXQoPAfTsZlXnMwJh7EW9mtID+MBA7xxwSe6ERddBS3YwP6yYbllp2XlJ14tP+mWTR/db
	l2JA+Um/Lrm232va7zbmpZXe1qLWMg0YlltgKbmypZbOJlcClgDngCrVSqQ9
X-Google-Smtp-Source: AGHT+IEHygQuRQmcpm3Zn4j4pduojeokahmiVVQJDy8o56yodyMF2rjdCCK/u2RBqmQlMoaKDuzeog==
X-Received: by 2002:a17:902:f54e:b0:235:eca0:12e8 with SMTP id d9443c01a7336-2364169ef07mr10412215ad.4.1749592821979;
        Tue, 10 Jun 2025 15:00:21 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::7:116a])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-236030789cdsm75361745ad.11.2025.06.10.15.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 15:00:21 -0700 (PDT)
Date: Tue, 10 Jun 2025 15:00:21 -0700 (PDT)
X-Google-Original-Date: Tue, 10 Jun 2025 14:57:09 PDT (-0700)
Subject: Re: [PATCH 2/4] raid6: riscv: Fix NULL pointer dereference issue
In-Reply-To: <20250610101234.1100660-3-zhangchunyan@iscas.ac.cn>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  Alexandre Ghiti <alex@ghiti.fr>, Charlie Jenkins <charlie@rivosinc.com>, song@kernel.org, yukuai3@huawei.com,
  linux-riscv@lists.infradead.org, linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org, zhang.lyra@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zhangchunyan@iscas.ac.cn
Message-ID: <mhng-8AD2A457-504F-4EF6-AB17-2CF316DFF6A0@palmerdabbelt-mac>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_150023_209061_A2FAA31C 
X-CRM114-Status: GOOD (  27.11  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 10 Jun 2025 03:12:32 PDT (-0700), zhangchunyan@iscas.ac.cn wrote:
> When running the raid6 user-space test program on RISC-V QEMU, there's a
> segmentation fault which seems caused by accessing a NULL pointer,
> which is the pointer variable p/q in raid6_rvv*_gen/xor_syndrome_real(),
> p/q should have been equal to dptr[x], but when I use GDB command to
> see its value, which was 0x10 like below:
>
> "
> Program received signal SIGSEGV, Segmentation fault.
> 0x0000000000011062 in raid6_rvv2_xor_syndrome_real (disks=<optimized out>, start=0, stop=<optimized out>, bytes=4096, ptrs=<optimized out>) at rvv.c:386
> (gdb) p p
> $1 = (u8 *) 0x10 <error: Cannot access memory at address 0x10>
> "
>
> The issue was found to be related with:
> 1) Compile optimization
>    There's no segmentation fault if compiling the raid6test program with
>    the optimization flag -O0.
> 2) The RISC-V vector command vsetvli
>    If not used t0 as the first parameter in vsetvli, there's no
>    segmentation fault either.
>
> This patch selects the 2nd solution to fix the issue.

This code is super fragile, it's got a bunch of vector asm blocks in 
there that aren't declaring their cobbers.  At a bare minimum we should 
have something like

    diff --git a/lib/raid6/rvv.c b/lib/raid6/rvv.c
    index 99dfa16d37c7..3c9b3fd9f2ed 100644
    --- a/lib/raid6/rvv.c
    +++ b/lib/raid6/rvv.c
    @@ -17,6 +17,10 @@
     #define NSIZE  16
     #endif
    
    +#ifdef __riscv_vector
    +#error "This code must be built without compiler support for vector"
    +#endif
    +
     static void raid6_rvv1_gen_syndrome_real(int disks, unsigned long bytes, void **ptrs)
     {
     	u8 **dptr = (u8 **)ptrs;

because it just won't work when built with a compiler that can use 
vector instructions.

> Fixes: 6093faaf9593 ("raid6: Add RISC-V SIMD syndrome and recovery calculations")
> Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> ---
>  lib/raid6/rvv.c | 48 ++++++++++++++++++++++++++++--------------------
>  1 file changed, 28 insertions(+), 20 deletions(-)
>
> diff --git a/lib/raid6/rvv.c b/lib/raid6/rvv.c
> index bf7d5cd659e0..b193ea176d5d 100644
> --- a/lib/raid6/rvv.c
> +++ b/lib/raid6/rvv.c
> @@ -23,9 +23,9 @@ static int rvv_has_vector(void)
>  static void raid6_rvv1_gen_syndrome_real(int disks, unsigned long bytes, void **ptrs)
>  {
>  	u8 **dptr = (u8 **)ptrs;
> -	unsigned long d;
> -	int z, z0;
>  	u8 *p, *q;
> +	unsigned long vl, d;
> +	int z, z0;
>
>  	z0 = disks - 3;		/* Highest data disk */
>  	p = dptr[z0 + 1];		/* XOR parity */
> @@ -33,8 +33,9 @@ static void raid6_rvv1_gen_syndrome_real(int disks, unsigned long bytes, void **
>
>  	asm volatile (".option	push\n"
>  		      ".option	arch,+v\n"
> -		      "vsetvli	t0, x0, e8, m1, ta, ma\n"
> +		      "vsetvli	%0, x0, e8, m1, ta, ma\n"
>  		      ".option	pop\n"
> +		      : "=&r" (vl)
>  	);
>
>  	 /* v0:wp0, v1:wq0, v2:wd0/w20, v3:w10 */
> @@ -96,7 +97,7 @@ static void raid6_rvv1_xor_syndrome_real(int disks, int start, int stop,
>  {
>  	u8 **dptr = (u8 **)ptrs;
>  	u8 *p, *q;
> -	unsigned long d;
> +	unsigned long vl, d;
>  	int z, z0;
>
>  	z0 = stop;		/* P/Q right side optimization */
> @@ -105,8 +106,9 @@ static void raid6_rvv1_xor_syndrome_real(int disks, int start, int stop,
>
>  	asm volatile (".option	push\n"
>  		      ".option	arch,+v\n"
> -		      "vsetvli	t0, x0, e8, m1, ta, ma\n"
> +		      "vsetvli	%0, x0, e8, m1, ta, ma\n"
>  		      ".option	pop\n"
> +		      : "=&r" (vl)
>  	);
>
>  	/* v0:wp0, v1:wq0, v2:wd0/w20, v3:w10 */
> @@ -192,9 +194,9 @@ static void raid6_rvv1_xor_syndrome_real(int disks, int start, int stop,
>  static void raid6_rvv2_gen_syndrome_real(int disks, unsigned long bytes, void **ptrs)
>  {
>  	u8 **dptr = (u8 **)ptrs;
> -	unsigned long d;
> -	int z, z0;
>  	u8 *p, *q;
> +	unsigned long vl, d;
> +	int z, z0;
>
>  	z0 = disks - 3;		/* Highest data disk */
>  	p = dptr[z0 + 1];		/* XOR parity */
> @@ -202,8 +204,9 @@ static void raid6_rvv2_gen_syndrome_real(int disks, unsigned long bytes, void **
>
>  	asm volatile (".option	push\n"
>  		      ".option	arch,+v\n"
> -		      "vsetvli	t0, x0, e8, m1, ta, ma\n"
> +		      "vsetvli	%0, x0, e8, m1, ta, ma\n"
>  		      ".option	pop\n"
> +		      : "=&r" (vl)
>  	);
>
>  	/*
> @@ -284,7 +287,7 @@ static void raid6_rvv2_xor_syndrome_real(int disks, int start, int stop,
>  {
>  	u8 **dptr = (u8 **)ptrs;
>  	u8 *p, *q;
> -	unsigned long d;
> +	unsigned long vl, d;
>  	int z, z0;
>
>  	z0 = stop;		/* P/Q right side optimization */
> @@ -293,8 +296,9 @@ static void raid6_rvv2_xor_syndrome_real(int disks, int start, int stop,
>
>  	asm volatile (".option	push\n"
>  		      ".option	arch,+v\n"
> -		      "vsetvli	t0, x0, e8, m1, ta, ma\n"
> +		      "vsetvli	%0, x0, e8, m1, ta, ma\n"
>  		      ".option	pop\n"
> +		      : "=&r" (vl)
>  	);
>
>  	/*
> @@ -410,9 +414,9 @@ static void raid6_rvv2_xor_syndrome_real(int disks, int start, int stop,
>  static void raid6_rvv4_gen_syndrome_real(int disks, unsigned long bytes, void **ptrs)
>  {
>  	u8 **dptr = (u8 **)ptrs;
> -	unsigned long d;
> -	int z, z0;
>  	u8 *p, *q;
> +	unsigned long vl, d;
> +	int z, z0;
>
>  	z0 = disks - 3;	/* Highest data disk */
>  	p = dptr[z0 + 1];	/* XOR parity */
> @@ -420,8 +424,9 @@ static void raid6_rvv4_gen_syndrome_real(int disks, unsigned long bytes, void **
>
>  	asm volatile (".option	push\n"
>  		      ".option	arch,+v\n"
> -		      "vsetvli	t0, x0, e8, m1, ta, ma\n"
> +		      "vsetvli	%0, x0, e8, m1, ta, ma\n"
>  		      ".option	pop\n"
> +		      : "=&r" (vl)
>  	);
>
>  	/*
> @@ -536,7 +541,7 @@ static void raid6_rvv4_xor_syndrome_real(int disks, int start, int stop,
>  {
>  	u8 **dptr = (u8 **)ptrs;
>  	u8 *p, *q;
> -	unsigned long d;
> +	unsigned long vl, d;
>  	int z, z0;
>
>  	z0 = stop;		/* P/Q right side optimization */
> @@ -545,8 +550,9 @@ static void raid6_rvv4_xor_syndrome_real(int disks, int start, int stop,
>
>  	asm volatile (".option	push\n"
>  		      ".option	arch,+v\n"
> -		      "vsetvli	t0, x0, e8, m1, ta, ma\n"
> +		      "vsetvli	%0, x0, e8, m1, ta, ma\n"
>  		      ".option	pop\n"
> +		      : "=&r" (vl)
>  	);
>
>  	/*
> @@ -718,9 +724,9 @@ static void raid6_rvv4_xor_syndrome_real(int disks, int start, int stop,
>  static void raid6_rvv8_gen_syndrome_real(int disks, unsigned long bytes, void **ptrs)
>  {
>  	u8 **dptr = (u8 **)ptrs;
> -	unsigned long d;
> -	int z, z0;
>  	u8 *p, *q;
> +	unsigned long vl, d;
> +	int z, z0;
>
>  	z0 = disks - 3;	/* Highest data disk */
>  	p = dptr[z0 + 1];	/* XOR parity */
> @@ -728,8 +734,9 @@ static void raid6_rvv8_gen_syndrome_real(int disks, unsigned long bytes, void **
>
>  	asm volatile (".option	push\n"
>  		      ".option	arch,+v\n"
> -		      "vsetvli	t0, x0, e8, m1, ta, ma\n"
> +		      "vsetvli	%0, x0, e8, m1, ta, ma\n"
>  		      ".option	pop\n"
> +		      : "=&r" (vl)
>  	);
>
>  	/*
> @@ -912,7 +919,7 @@ static void raid6_rvv8_xor_syndrome_real(int disks, int start, int stop,
>  {
>  	u8 **dptr = (u8 **)ptrs;
>  	u8 *p, *q;
> -	unsigned long d;
> +	unsigned long vl, d;
>  	int z, z0;
>
>  	z0 = stop;		/* P/Q right side optimization */
> @@ -921,8 +928,9 @@ static void raid6_rvv8_xor_syndrome_real(int disks, int start, int stop,
>
>  	asm volatile (".option	push\n"
>  		      ".option	arch,+v\n"
> -		      "vsetvli	t0, x0, e8, m1, ta, ma\n"
> +		      "vsetvli	%0, x0, e8, m1, ta, ma\n"
>  		      ".option	pop\n"
> +		      : "=&r" (vl)
>  	);
>
>  	/*

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
