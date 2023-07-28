Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBDF9C001E0
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 13:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0y65vW6GosxwGBiN5UpDXvOFXlHBCFcaPmOAfX65EQM=; b=l/e3pTg0izE2+n
	Yx3Ei3yHDVr3CnVrG6EbyDMJVLdECbdRg0Pw6kgJAf8p+dZbKtcjxdd6XDg2YIuVH0lf+0zqBJ68R
	fM7OliWwzxEaxo43OqFfgco7MDlxZyt/YzxbKVgRcJT3mkxO24aXhdZ2LvegPLOVPif801M32PrYm
	ZyCYFgxOsgDvsiOur134YBxrKsl1Z7Z7/ETEC/oF69QR4ojTXptwuc6aGXi/4itu4GLDpo1KmDYCT
	82AlThrw1MWN9ts5L9nBZA1RtePjwMOLZVWPOFkhvRb1ZBO+SAjAB3KXoYnBToTet+cpcbLCWUa5v
	TZKrqtVgqizjkhNQLbhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPNi2-003YU8-2c;
	Fri, 28 Jul 2023 13:40:46 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPNhz-003YSr-19
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 13:40:44 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5221ee899a0so2760812a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jul 2023 06:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690551642; x=1691156442;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dOr1yk/G929iC/UP6Gxb6LGjnTgc9novxErxvxKlMFA=;
        b=IQ3Zqni+xYE1E5lTEQCioxb550A8Se+B6M1Ky+b3SqepfB3cIr/HCWGJX+F1OF9wFY
         Z4yeLGUnJ/oTaoCRLbn5dO6tb8bTXejCeBqLZ7/D40XmUa8r3M/Ybd47vGLBGzJPlPDF
         wythpCmiNF6GioB3CydtOcNhd+WykncVDXx47mMWaLhkYrxT2oNi3amn7v+9lDKXD4TX
         c3u12ZTfhWRCNqyovbhmli3c5z3wUupr6p/p3pgDv2ocqNMCb0yEFtAuhpPo3u4Jn6Xr
         VmnoMR+9E7F3gazk4FFRopYBoipA+G//nAndzJXlx57BZFwsVE/j/hlNPlJ5PE+YqjLL
         YOBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690551642; x=1691156442;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dOr1yk/G929iC/UP6Gxb6LGjnTgc9novxErxvxKlMFA=;
        b=IyCtplmeJXmW4OtC3Fd12XK0W7NL98mD1VyfbXM1nJjbHVX9cOPnBKaMl377g5jckY
         5S11S08Lv+o5B2r3w5W2UgP7f2/dCrRl9wWze7QAA8k4l8+T/NikN0QigI51XFSjzA7A
         m50gxyjyUZw+7ZVQJK2KcADuaVxLMEqMlgTfS9Jh06ND6+gsuAVzUI8uOr6Da4p+NvSn
         QbGdZfid9A5KGcZ2rVlWb1qRhRZcMAJ9zELGDe7l1qIIacQentCdKCIta/MYtEabzHeK
         zM0he/A5BUpVeboSjV0dHZc+k2vCvbmkj0IP+/PlkDU1WCqtdNu1V+IeCEK31ABQfj7d
         aZlA==
X-Gm-Message-State: ABy/qLYtu2E5/hOHCr5PzBiBQW3e+LZ6FsU9+f1hVyqb9uyAmSXocQ4J
	ZW/7R2HmA5OCHpTFn4qrb5ffhA==
X-Google-Smtp-Source: APBJJlEYSSoWqY1AZEvMkgejX1YVuSwDTsDWEeWUKTMmJ78xen4aK3pxBR2H/MQNoqMbOAxqyZGevg==
X-Received: by 2002:a05:6402:1148:b0:51f:f1a4:edc6 with SMTP id g8-20020a056402114800b0051ff1a4edc6mr1701888edw.37.1690551641712;
        Fri, 28 Jul 2023 06:40:41 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id i23-20020aa7c717000000b0051bed21a635sm1822857edq.74.2023.07.28.06.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 06:40:41 -0700 (PDT)
Date: Fri, 28 Jul 2023 15:40:40 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Nick Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, Vincent Chen <vincent.chen@sifive.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] riscv: Improve flush_tlb_range() for hugetlb pages
Message-ID: <20230728-50d247a7253aaf9468cd8b3d@orel>
References: <20230727185553.980262-1-alexghiti@rivosinc.com>
 <20230727185553.980262-3-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230727185553.980262-3-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_064043_401762_FE514A63 
X-CRM114-Status: GOOD (  18.65  )
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

On Thu, Jul 27, 2023 at 08:55:51PM +0200, Alexandre Ghiti wrote:
> flush_tlb_range() uses a fixed stride of PAGE_SIZE and in its current form,
> when a hugetlb mapping needs to be flushed, flush_tlb_range() flushes the
> whole tlb: so set a stride of the size of the hugetlb mapping in order to
> only flush the hugetlb mapping.
> 
> Note that THPs are directly handled by flush_pmd_tlb_range().
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/mm/tlbflush.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> index fa03289853d8..3e4acef1f6bc 100644
> --- a/arch/riscv/mm/tlbflush.c
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -3,6 +3,7 @@
>  #include <linux/mm.h>
>  #include <linux/smp.h>
>  #include <linux/sched.h>
> +#include <linux/hugetlb.h>
>  #include <asm/sbi.h>
>  #include <asm/mmu_context.h>
>  
> @@ -147,7 +148,14 @@ void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
>  void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
>  		     unsigned long end)
>  {
> -	__flush_tlb_range(vma->vm_mm, start, end - start, PAGE_SIZE);
> +	unsigned long stride_shift;
> +
> +	stride_shift = is_vm_hugetlb_page(vma) ?
> +				huge_page_shift(hstate_vma(vma)) :
> +				PAGE_SHIFT;

We want the size below instead of the shift, so we can just use
huge_page_size() and PAGE_SIZE here.

> +
> +	__flush_tlb_range(vma->vm_mm,
> +			  start, end - start, 1 << stride_shift);

Shouldn't need to wrap this line.

>  }
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
> -- 
> 2.39.2
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
