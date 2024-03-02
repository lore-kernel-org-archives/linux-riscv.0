Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C018C54798
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Mar 2024 07:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w1alYLR+8Id2NpoyTq4z5xsFAQ+PEfzHyszCRSOZjiI=; b=unPwnidZoVftdR
	Mw39lFsp3khNTOLr7BU2l8NKFoqjMKM8NFkDO29+djslaKErqivZNkCstGS4D+wtltXtuRHajnt+B
	XtGCpMaiPqqVecpEnrzuiy2q6Tf2Xr9CsgCfsgKxFic9e8bvXlCZ8vhB0rR0QunA1h5PY/WP/57pe
	+4DqzoT+7OLOfJItn6x1bUPc1HpDIhb6qKTrURhXK/Z0SD5QWliJrrOgweA7yTXym5GsZgNRPaD9Z
	YCCEGdJcVDJUTfeMSoCBkwTZsqg9kqUlFosoDoXvEbuC8UYB/FetYCAFt8TMIWJxDW/cbrHxyQeJq
	RVeISaFilKvmL0pghRZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgJtu-000000031xR-00rW;
	Sat, 02 Mar 2024 07:35:18 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgJtq-000000031wX-3Uya
	for linux-riscv@lists.infradead.org;
	Sat, 02 Mar 2024 07:35:16 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-412c83a8259so10121665e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 01 Mar 2024 23:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1709364912; x=1709969712; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RVIp+bkmfXEEH5Z3CqG36argyLkv9jlPldmOAvVHXfk=;
        b=GeCjCdQfg0QL/ch9SyO2g/oyo99QlJ7gqZFzzv0Qp9TyjCx+iafipR6pC66Se+4al5
         gS9/54H4EhiqxClJuywdkgLtHXmJ+mAdOWvvtqaIcEzm9LAT5bIOV8bHBFmpH/mzmGUd
         +mXm/9LWqIGJTH4QeQeBf7diD+HALdaYzFN6K3dNysBC/XMmZpsnIaY/S+qEU3KOGwut
         FTgXPXLZyY5dFhEiRkZ7pP2pclLnzqBWUyiStu2QE2DwSyNVfxG1L9hxQqF2k4SX59q1
         IAm3hs6IFKkrkVPsX094J3d/s5ayfxOCnX4oXOblRX1TyKltomdP3o+kA4KQX3MDmed3
         o0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709364912; x=1709969712;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RVIp+bkmfXEEH5Z3CqG36argyLkv9jlPldmOAvVHXfk=;
        b=S/a0wNkboQ1tILqPKxeBCDRloBO2hoAgB5sIoJHobUD8bnz/xNM/pMMyqEJ7ewyxOX
         qVRDtNYlVM8C6rE8lRXW1x+/9Ui41Ut01quScsJ7Ru7Yl6p9F43pi0cTL0eVJjATEPje
         YKJHFBXdj5yFkCrQqVWQSmVpQi6Cylv8Xmr8lEsKhA7si25kga9oBufI7imUHkzdTRNC
         X/UOo0so/ORFW6JW0VmC8+r+GZzHWH4ksBA7ZAwNWruIkYEOMXwNFhZhfNlob6hWJYbv
         ZXmZ9QaGKUrhXUS2Gou58gmySgGcrIE4Hw2ymA7Ot3yt4Qpkr8AZYCMcmhGY9NHoNGJl
         rNpQ==
X-Gm-Message-State: AOJu0YxtMQv7VYCBkcZC+AvAupVD+hiDzf93TQwXdtn/SnLN1UE1xPPU
	EwXeGHvho5DWukuDNV7fJKWfb7uk6r8LlpyRkq5GCrJUaLGdbnre48IZb3FTiSs=
X-Google-Smtp-Source: AGHT+IE5p/dElV8MPvX5Z+KxId+N7DYaOhQnGAen5y2yV1ICqZ5gVRXXzuefdWRfCisV+ymJmgjFfw==
X-Received: by 2002:a05:600c:35cd:b0:412:989a:f6f5 with SMTP id r13-20020a05600c35cd00b00412989af6f5mr3420946wmq.38.1709364912110;
        Fri, 01 Mar 2024 23:35:12 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id u22-20020a05600c139600b0040fdf5e6d40sm7942900wmf.20.2024.03.01.23.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 23:35:11 -0800 (PST)
Date: Sat, 2 Mar 2024 08:35:10 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>, 
	Dylan Jhong <dylan@andestech.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: mm: Fix prototype to avoid discarding const
Message-ID: <20240302-84b126d91dac9f73f5efebaa@orel>
References: <20240301201837.2826172-1-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240301201837.2826172-1-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_233514_905205_F1916266 
X-CRM114-Status: GOOD (  16.56  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Mar 01, 2024 at 12:18:32PM -0800, Samuel Holland wrote:
> __flush_tlb_range() does not modify the provided cpumask, so its cmask
> parameter can be pointer-to-const. This avoids the unsafe cast of
> cpu_online_mask.
> 
> Fixes: 54d7431af73e ("riscv: Add support for BATCHED_UNMAP_TLB_FLUSH")
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> 
>  arch/riscv/mm/tlbflush.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> index 893566e004b7..07d743f87b3f 100644
> --- a/arch/riscv/mm/tlbflush.c
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -99,7 +99,7 @@ static void __ipi_flush_tlb_range_asid(void *info)
>  	local_flush_tlb_range_asid(d->start, d->size, d->stride, d->asid);
>  }
>  
> -static void __flush_tlb_range(struct cpumask *cmask, unsigned long asid,
> +static void __flush_tlb_range(const struct cpumask *cmask, unsigned long asid,
>  			      unsigned long start, unsigned long size,
>  			      unsigned long stride)
>  {
> @@ -200,7 +200,7 @@ void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
>  
>  void flush_tlb_kernel_range(unsigned long start, unsigned long end)
>  {
> -	__flush_tlb_range((struct cpumask *)cpu_online_mask, FLUSH_TLB_NO_ASID,
> +	__flush_tlb_range(cpu_online_mask, FLUSH_TLB_NO_ASID,
>  			  start, end - start, PAGE_SIZE);
>  }
>  
> -- 
> 2.43.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
