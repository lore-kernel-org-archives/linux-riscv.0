Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C62FAC7114B
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 19:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=HRj0/ubQRp2l/ttXGVi8WFFaQ7bi+75gcDSPZ4sm6Pg=; b=uDw7DitoAjzEkSh6TxsjbVDXe4
	iq9jn0tQsJ2tGD8Nn/rAFfPWuAu4++K++9k2V/jNd4Q7/okwekVF7lrq1VA2XRdUmsRWVC9A7iwbX
	QFa+xdxUNmsAxHiSJX/KSp4h13oL0++tR3aQ3jRXxJYnO2bHnALaACFDZ+86/4k30nwx0kvLJx3e/
	myBMXr8XM4JyHi3h391ryAqZcUmH+KOLtwk1B3buyCvoi5QuUNoSBUe3cSF6bVc35n2Y4DlIpyQYr
	ScMv2Mb61AWAfxowqEuzbxkhopj48wYepGTkE2Sv32ogjA10JcFE7QdQ/S3OjH2H2OqmVUmhXRZnd
	fMfbVqWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnuW-0000000EPGs-3F7I;
	Thu, 12 Jun 2025 19:48:28 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPndI-0000000ECzo-1HtQ
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 19:30:41 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-235d6de331fso16500325ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jun 2025 12:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1749756639; x=1750361439; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kPtJ9IeClIB9n7jf1IY5kxuzpZZ2o3SK0WOHDSbPH9g=;
        b=UilWel/nCAl1MKb4I6x397bx7TkWXLdkHq1IjYBYIir6yJvJLaRs0m8dLiUdUYDmpI
         BAa8cyaUnYIy4X+fVsj8gYoTpe3+wciJjCjMoyxnlW6fL1E655y6BVNG8iGDePS1rfi8
         uI3RV40SfI/ByNnjdkqBD6HdATfQ4rMbsHB7Woh/4jIyhY7hKqT7/XpZdOpQvaES2tU+
         JWMV6qtqzhgr47y0sU16x2v9tUaBaWRpdVnYkW6sQ1yrVVQDh1OPt6q9ZJNL4Qo2QQvf
         h1vTYduCH7sgClK6B3pGMLNw88RQ93BzOB83ptV6ZavzzECyCg3wVZG2P4oa1a2cmI57
         1sBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749756639; x=1750361439;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kPtJ9IeClIB9n7jf1IY5kxuzpZZ2o3SK0WOHDSbPH9g=;
        b=VSsVeBaiddVQDZYzqik3vXfG7JLDls1vXjzwvAqFaZwgOmPnCkji7Uvun+5HtqC+T3
         qNB3X8BXujtAG8oOk1dJ+5w1dq2PFyO5YrVfHNPT4SdjywQilBkj7g+0nzArsJ3sIlMO
         PC1qPJfuOXeyw+fsmWZaZzz099WJbBsYx+yjogajK2Z0W+KwmupITl+TIwV06/LwOUSZ
         IIMxBjnd1Htrll31G1LUK8l5dD2oaKG498QO6tH00Xs1EF6KI1fPi3uf2Xq4tzqw1Z+/
         cC9SF9szOH0n90e9XcuPfMgpTT8BblOQuPgrjnFequ9tpwNP2vIZEXERRCJpLnJLVAqT
         di1g==
X-Forwarded-Encrypted: i=1; AJvYcCX5xvyLgFUUrJMuaGe5uCxF9gPXBTRpT3V0eBOgcDti5NIZwEyaP1FfmskoxB0s3XTD+aFBOH+5MX2LCw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3wDnYpiJNvcXd79VaqfNEe0zbG9Pz0S2Zdnns/MoPsr0yi27i
	9J/3gB33GdHF3j3DRaoaoOnjaEegF8G6+eeYceRFBrG7m3kOIck3FHIkX8gKAjO3kkQ=
X-Gm-Gg: ASbGnct1EDzcf/UO8VwBYrr/sToiDGSyY89dVw2DPe+HXF0Jgca1Ilu0e4Ovbb5mxvY
	fBLwvq24e0SbwZ3131MmMmrOD4urAeCY+gNWrk4WAYcGSj1fA/lWX2UJLPxhNf+AgbNBymh5Pkg
	fFZBG/0b8UKAaz3g1EtWWdUuXtByQRItcLrArvbuDcDZD3Kj+qahrNZWnFpx41B6gn5fOxTwHD1
	6W6pPLHCvAqU6orpDYaNUV3FXAcvTzRl5B0DIH9h1EoXlDyk/4ViknIWWzp0EmPTqb1m8wjdMcE
	9EyNqyRvY8gipuXen483Bje41yGS8KFJv6g/V1Fqt7jJXtLNI67+eU0WfqR1gdagenA2CLE=
X-Google-Smtp-Source: AGHT+IHU7fagoyX7EvCpClw9B6nwEcBcwsyEhBHfcDDWpqjq1c1A+nBkSpB2SK4VtlksaREw83mC9g==
X-Received: by 2002:a17:903:3a90:b0:234:f4da:7eef with SMTP id d9443c01a7336-2365de4e017mr4214785ad.52.1749756639208;
        Thu, 12 Jun 2025 12:30:39 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::7:116a])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2365deca149sm801105ad.199.2025.06.12.12.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 12:30:38 -0700 (PDT)
Date: Thu, 12 Jun 2025 12:30:38 -0700 (PDT)
X-Google-Original-Date: Thu, 12 Jun 2025 12:30:30 PDT (-0700)
Subject: Re: [PATCH 2/4] raid6: riscv: Fix NULL pointer dereference issue
In-Reply-To: <20250610101234.1100660-3-zhangchunyan@iscas.ac.cn>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  Alexandre Ghiti <alex@ghiti.fr>, Charlie Jenkins <charlie@rivosinc.com>, song@kernel.org, yukuai3@huawei.com,
  linux-riscv@lists.infradead.org, linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org, zhang.lyra@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zhangchunyan@iscas.ac.cn
Message-ID: <mhng-09771FCE-11E1-401A-81E4-EF482D65AC0B@palmerdabbelt-mac>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_123040_346609_B71B559F 
X-CRM114-Status: GOOD (  27.84  )
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

I'm picking this one up as a fix, with a some slight commit message 
wording change to describe the clobber issue.  It should show up on 
fixes soon, assuming nothing goes off the rails you can base the next 
version of the patch set on bc75552b80e6 ("raid6: riscv: Fix NULL 
pointer dereference caused by a missing clobber").

On a related note: I think we have another bug if NSIZE doesn't line up 
with bytes as we're not handling the tails.  I'm not sure if that can 
happen, as I don't really know this code.

Also: unless I'm missing something you can replace one one of the loads 
in the loop with a move, which I assume will be faster on some systems.

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
