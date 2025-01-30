Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEDE1C0218A
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jan 2025 08:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WTwQnShY8d5CeLK2q3I2Zz6QgKKRZnF+sZ1dbr/y+o8=; b=dY8/ziBO8CNYLT
	cfZQ6gAqFaeqssjUTPslFnRnvp1cQJ6tXRjzXcG/Kh04uXkiXk4EhLNE3ocLb50kpk+Sjf43HBzH+
	PDptn256WAcUGcuKUXRubcsmp1Kl+SwsUj8+Wn7KM8HT5cEevyhPeW6sNXwx1FKzz3Fkhhbl3Qr1P
	symM+zNgP/UpHabT+Mk4jqWVHscizepKNQmeM9vuTsWC1sLoVNEN0LTaZdWhzbbE4prf6t+odWqIW
	qSR7ahVTXUAlkg3tNhN5TZPBlczUjH0+nfFASAoWfGIlWxpwC6w/ooczZu8R9iQM8I4T2jL+rXH4Q
	DjHmfQf1skNwqZ4ZzBog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdQFl-00000008S4l-2FPi;
	Thu, 30 Jan 2025 08:50:25 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdQFj-00000008S3m-2COl
	for linux-riscv@lists.infradead.org;
	Thu, 30 Jan 2025 08:50:24 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-38633b5dbcfso497521f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 30 Jan 2025 00:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738227022; x=1738831822; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dsy4uJKogIVKQPzs6Ct+upQYMgDG3MEIF1C0cRa7EYs=;
        b=C9+VeRkPYNyDs+oNg4BXn2rJa4fXkquVVbqJJKH5/ldP5jw43rtqj16mBd9eDfmELH
         yexr7hYReKAr2RgIfoAx0Pjp0MF0Vj2QzzM3+kiSDgX4bUH0T0zDbBRsPDXO6vYR6a4q
         3PaLBDRCNFehlbK1KmN+Ho/Y1hxrHpkDYf4FEdG+reTbvZTv0K1kiZJladgllsS4T96d
         JopHi+XOoMdLXnCz5NL3PH6GBKbaIVIRCTDceD/NWPRRlJ6ZONRvN35tocKuucfoAliK
         RHPNxFG7YwuBgCIvZ6epR0dMCqQeMzQP0k+d0i49wQej8RnFWvf3Wfyf1r8H62my+lW6
         qNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738227022; x=1738831822;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dsy4uJKogIVKQPzs6Ct+upQYMgDG3MEIF1C0cRa7EYs=;
        b=Ow+fg51cGiBHBH5gVeArSsVNUfV8cnTrom5/qrt0hq9t23lZFoFi760LtZhnccNQA5
         4VqpqHiy/Xvrwt9w0eXKFZbPgvm6i8NNXD3xFlSTPSGDRQCszgQ9k9XnOqDpe1gc8my0
         s9h85S/qCDKuODVS8u+GqEmpDc5MezllNu90oi7cbDq2j/2d9R9JvUvbwBpRQrcNOKQ9
         NYr6f6V3ZSTzthfdDkx2CRlkSY4fcS2CstJpx1+6k29LHctmFh1IpbCkPqvVt/y1Kddg
         O2sOHwhoh8ueJVvxEJ9R09ndZroLtwgRYtFrGE4Kt/jrhWtgb9oeismkZywEL2CuePBT
         kwFg==
X-Forwarded-Encrypted: i=1; AJvYcCW8KGVOhgPFN66St5psXMvohzNgGRPMkl59HLMD3o7LDrZI0e250iHgF7w8rk6628N5eYBljEbALUDQ6Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn6BS5pM3E9it6j1kPTMqs9ldFxSGhCmBQx+tQBKgkh1gr4YbK
	BGTwao12QOpfBw06wFXwxF17491ks04/IyJpU2isD3hFi4il5pyEvxtXWrJagak=
X-Gm-Gg: ASbGncuqzaTfQWwbsCjZijEf4uC8tO3/cTa2UVANnLUsectfxW0Z72rpaQML/YCzBuI
	sFWmNa31OJWAZYlQl4Y2A/U3qH160Vu7LEMk7LlxGrglzFEJbkzWetaQHC4tQ6uT/yf6oc+Ef4n
	H2uOLvrUZ9S8FRSJO3iHzs4fQGV8dzlbzSDBc38rlGPRzI3OgKMzPhdlya511mE1jUL05xxDkY3
	ZBOeWAAXEFd0hR8gx4Ukl/XT06zSEAuLf/Oy6ZamYs/Qi4NvPnwrw12K24HWgHwefUAjonWaeAg
	FFQ=
X-Google-Smtp-Source: AGHT+IGFTRL2KbdYIq3lZmW40A2vF/C6ptAw5dWdjhbhxqUZ/ka0NH0NQk5FJYnWzTdk9Dk9H8tYmQ==
X-Received: by 2002:a5d:47cd:0:b0:385:e88a:7037 with SMTP id ffacd0b85a97d-38c51939740mr5747204f8f.6.1738227021805;
        Thu, 30 Jan 2025 00:50:21 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::76fd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec7e6sm1332565f8f.19.2025.01.30.00.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 00:50:21 -0800 (PST)
Date: Thu, 30 Jan 2025 09:50:20 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Chin Yik Ming <yikming2222@gmail.com>
Cc: conor@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, charlie@rivosinc.com, samuel.holland@sifive.com, 
	cleger@rivosinc.com, andybnac@gmail.com, alexghiti@rivosinc.com, 
	peterlin@andestech.com, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Simplify base extension checks and direct boolean
 return
Message-ID: <20250130-77bf6cf799f468b43fb5382e@orel>
References: <20250129203843.1136838-1-yikming2222@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250129203843.1136838-1-yikming2222@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_005023_569431_ADF59FF3 
X-CRM114-Status: GOOD (  17.41  )
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

On Thu, Jan 30, 2025 at 04:38:43AM +0800, Chin Yik Ming wrote:
> Reduce three lines checking to single line using a ternary conditional
> expression for getting the base extension word. In addition, the
> test_bit macro function already return a boolean which matches the
> return type of the caller, so directly return the result of the test_bit
> macro function.
> 
> Signed-off-by: Chin Yik Ming <yikming2222@gmail.com>
> ---
>  arch/riscv/kernel/cpufeature.c        | 6 ++----
>  arch/riscv/kernel/vendor_extensions.c | 2 +-
>  2 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index c0916ed318c2..32525b69ab99 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -49,9 +49,7 @@ struct riscv_isainfo hart_isa[NR_CPUS];
>   */
>  unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap)
>  {
> -	if (!isa_bitmap)
> -		return riscv_isa[0];
> -	return isa_bitmap[0];
> +	return !isa_bitmap ? riscv_isa[0] : isa_bitmap[0];
>  }
>  EXPORT_SYMBOL_GPL(riscv_isa_extension_base);
>  
> @@ -72,7 +70,7 @@ bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, unsigned i
>  	if (bit >= RISCV_ISA_EXT_MAX)
>  		return false;
>  
> -	return test_bit(bit, bmap) ? true : false;
> +	return test_bit(bit, bmap);
>  }
>  EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
>  
> diff --git a/arch/riscv/kernel/vendor_extensions.c b/arch/riscv/kernel/vendor_extensions.c
> index a8126d118341..62f55bc779e9 100644
> --- a/arch/riscv/kernel/vendor_extensions.c
> +++ b/arch/riscv/kernel/vendor_extensions.c
> @@ -51,6 +51,6 @@ bool __riscv_isa_vendor_extension_available(int cpu, unsigned long vendor, unsig
>  	if (bit >= RISCV_ISA_VENDOR_EXT_MAX)
>  		return false;
>  
> -	return test_bit(bit, bmap->isa) ? true : false;
> +	return test_bit(bit, bmap->isa);
>  }
>  EXPORT_SYMBOL_GPL(__riscv_isa_vendor_extension_available);
> -- 
> 2.34.1
>

Since the changes are harmless and I do prefer the way the code looks
with them,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

but these types of changes are pretty much just pointless churn...

Thanks,
drew


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
