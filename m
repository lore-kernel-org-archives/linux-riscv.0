Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 919E9C0219F
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 18:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ptBvZCKC2UWO8mQp1OV+yJzR3cP+pnMG9cL9GC6wR/k=; b=er70J3OI+F/SwU
	13W5Ur94sAcbpx5ZcNMK3aV1YDAZ+cvGvwHuDg3LYuM6cVcYJPV4G1mJKgq2EzlGrFdmyVwP6OuOO
	cHY/WLxM3tNU2dR2P4ayiMvxefcEVBFlOpQJXeJP3h3EU9F89dqwDWnrOIcC2L7CGK0kqqIUvClPq
	YS4U4oZqcL1WX6Sa1CftAzZCRsiINd3kWkI81uQWlXZbua5hAK8fn9g2eNImZaxYODMJ4xBygeJOo
	WhhieTs3uw9v1hHUmSM6VNUPv3vfOflgMZNKK3FZWgVD0n3ODeVWgfN+IqZVTLhmS7ViCbfRsctvr
	54MMBpt3+UbtSMKIcHyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSmV-0000000Acmh-2RxK;
	Fri, 07 Feb 2025 18:08:47 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSm7-0000000Acen-1xYM
	for linux-riscv@lists.infradead.org;
	Fri, 07 Feb 2025 18:08:24 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4361815b96cso16327015e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 07 Feb 2025 10:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738951702; x=1739556502; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BwZZ/X+71TKi70TLxyV1+F70qGRY6zHI1hEQ/denga0=;
        b=CW9P6G/NewvHmH9+B4dAsKL+smhOeSYDLqWJFbiJL/6ybVlzCQyZt41T28fH0Vln0n
         2/TCKTc/a8JugNjU+ABwVCB6zVcDngT4yRFURbXHrMn/R4jaH/CtBfr0bp8PPy5c38nD
         cQS77xHVbhRjUvoWLPNrV8LozLI4k8bcCtWUQh8lUJ0TeD5AnNpw0zxqz9aR4+C7wNo3
         6d9XQv34a7J/bGyLdUaZK8IZV1myzEQ6RLXPTBmHfoIWOR/z3ylNTXrZQwFYDyMsHRCA
         MymQPKyUg/v3NimAF3gX6JB7nuGBtCCoKPsF+Q8Pj3kbmBv+lrV7VfISiBkW0qUQ67Nh
         UA0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738951702; x=1739556502;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BwZZ/X+71TKi70TLxyV1+F70qGRY6zHI1hEQ/denga0=;
        b=CNtNbPL3GDkF9CWBdR3ljNIB7UusDpO4f60YT1CuWwkBZBIBFOte/kTtvLRbw3rHap
         EQCYmAGsyunfT2EEBxBx9W/365s4NGw6fn3TpK4dRq1J54y6o5COAh2AGtmoxI0G7c32
         Xm464AMnyVhSN5NxXs+oYoRO4db5wqqYa75/9YSrZY2ppONhRbirSu0Xencxjkc1H5Mb
         nCcPEhUrjY4E5eMpebUR2OBFfUaoZlXXfFTk1SKAVPqejTbG54p1q+eLP5lDABgQi/f3
         Rv3klhHZoPYBLH5AS8Re4UCwzL3AwyZCALutfHCB0iXm4jPBb2+z1zXYNSghVDWojUel
         qPnw==
X-Gm-Message-State: AOJu0YwoZGsr2F90oltiFGZRbMr84jGemDyW7iPH487WWqsZAcG32Ye3
	sp/D+xKCHo/hJ87c1TkS9iZGuxZYQmyVTr2kAryoszr+RSOGN0w0EZiyI+HfyCM=
X-Gm-Gg: ASbGncuyR/yh14a2eoMukG9NKTfu8zh08T6Daog7SUwE3KSv9VBqssu9Du99ZVGDgVS
	TSH+nYpEXwXzBhzouicR2orqa9JIJvuEdfRk+RXN6qcKlL5i+i9PWK45ySJQ158AAvtCLHFOeek
	pKkCxHP0n8gTM7wS7/ey8fhQFLa8Cj/dor9SK88VcoDueB+CWACWKQJIoD2ZxssNs8zvrbjDZws
	ZsfKzx3apImvS/AeJIFfMKEOSJ8npyzGvpUtf2DSD3Ntohp/XMyonkjIHnpyx/++VvBezG8Hq2Z
	tq1TqdfxlKo6EOEORcfO
X-Google-Smtp-Source: AGHT+IEfBajudvX7hdtPp1HAswxn8AqeOdOhPbfDZ8El6ut9FpmVZQ6qQnqAjDXWBQXbzvMLEtEweg==
X-Received: by 2002:a05:600c:6c52:b0:434:f335:83b with SMTP id 5b1f17b1804b1-43924a27b10mr42300105e9.5.1738951701728;
        Fri, 07 Feb 2025 10:08:21 -0800 (PST)
Received: from localhost ([2a00:11b1:103b:18b0:943f:8e0:c299:6db0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43907f19247sm79362335e9.1.2025.02.07.10.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 10:08:21 -0800 (PST)
Date: Fri, 7 Feb 2025 19:08:17 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, charlie@rivosinc.com, jesse@rivosinc.com, 
	Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH 2/9] riscv: Fix riscv_online_cpu_vec
Message-ID: <20250207-7bcda0b97d4beb9d72de12f7@orel>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-13-ajones@ventanamicro.com>
 <1a4de5bb-913d-489a-ac96-3f4dec48cb2d@rivosinc.com>
 <20250207-f0e7e2b868ef3e9f2a174f29@orel>
 <fdabae33-a1df-41f7-9e1f-9973f252599a@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fdabae33-a1df-41f7-9e1f-9973f252599a@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_100823_504263_DB1A9B0D 
X-CRM114-Status: GOOD (  25.69  )
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

On Fri, Feb 07, 2025 at 06:43:26PM +0100, Cl=E9ment L=E9ger wrote:
> =

> =

> On 07/02/2025 18:08, Andrew Jones wrote:
> > On Fri, Feb 07, 2025 at 05:47:28PM +0100, Cl=E9ment L=E9ger wrote:
> >>
> >>
> >> On 07/02/2025 17:19, Andrew Jones wrote:
> >>> We shouldn't probe when we already know vector is unsupported and
> >>> we should probe when we see we don't yet know whether it's supported.
> >>> Furthermore, we should ensure we've set the access type to
> >>> unsupported when we don't have vector at all.
> >>>
> >>> Fixes: e7c9d66e313b ("RISC-V: Report vector unaligned access speed hw=
probe")
> >>> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> >>> ---
> >>>  arch/riscv/kernel/unaligned_access_speed.c | 6 ++++--
> >>>  1 file changed, 4 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/=
kernel/unaligned_access_speed.c
> >>> index b7a8ff7ba6df..161964cf2abc 100644
> >>> --- a/arch/riscv/kernel/unaligned_access_speed.c
> >>> +++ b/arch/riscv/kernel/unaligned_access_speed.c
> >>> @@ -367,10 +367,12 @@ static void check_vector_unaligned_access(struc=
t work_struct *work __always_unus
> >>>  =

> >>>  static int riscv_online_cpu_vec(unsigned int cpu)
> >>>  {
> >>> -	if (!has_vector())
> >>> +	if (!has_vector()) {
> >>> +		per_cpu(vector_misaligned_access, cpu) =3D RISCV_HWPROBE_MISALIGNE=
D_VECTOR_UNSUPPORTED;
> >>>  		return 0;
> >>> +	}
> >>>  =

> >>> -	if (per_cpu(vector_misaligned_access, cpu) !=3D RISCV_HWPROBE_MISAL=
IGNED_VECTOR_UNSUPPORTED)
> >>> +	if (per_cpu(vector_misaligned_access, cpu) !=3D RISCV_HWPROBE_MISAL=
IGNED_VECTOR_UNKNOWN)
> >>>  		return 0;
> >>>  =

> >>>  	check_vector_unaligned_access_emulated(NULL);
> >>
> >> Hi Andrew,
> >>
> >> Wouldn't it be easier just not to register the hotplug callback in case
> >> !has_vector() ? In which case just set all possible cpus
> >> vector_misaligned_access to RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED
> >> at startup.
> > =

> > We could do that, but I have another use for the hotplug callback that
> > you'll see near the end of the series.
> =

> Ok, I saw patch 7/9.
> =

> BTW, what happened to patch 8 ? I thought it was in my spam but even
> lore.kernel.org does not have it:
> https://lore.kernel.org/linux-riscv/20250207161939.46139-11-ajones@ventan=
amicro.com/T/#t

I see it on lore for lkml, so linux-riscv dropped it for no good reason...
I'll send patch 8 again (this time with feeling) just to linux-riscv and
we'll see if gets through.

https://lore.kernel.org/all/20250207161939.46139-19-ajones@ventanamicro.com/

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
