Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7DFD16260
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Oct 2024 13:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l7RsAVVlGoYKzK6x4K1d3V1a7ptmj/zU65s3UKSMQd0=; b=nTa77YUXGelSpJ
	IItR5LJgP90QqEhLjRpcf4pUrQWEC47ESQWaEFiewES4qfKInpVs1EAP19zW4CeBVaXZ5EQ30E5dA
	hLaIuPcGU3wn0hmKb8E+UUkRQaZsaKQl4j8f/0p64p2G3FQ96WjTCGs8jDENnDnagXCMQAaIRPzRy
	bBwraaNAOXCOGiMQU+pwMyYdPyB1AFNgPSz0P7CvmLAZ+N8uRug/Bvh5v6XgemyrxrnHOkkZXoMep
	9J8B9dZ4vrSSaVts0Kd4vjXh6lc6DAT9+/LFsny3oNXF5LBqDKcy0UiIc5RAs5NIYoInohQ9CEJte
	nn1wxe9FGlm72MLMTWLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0L3f-00000005Fzc-2QbG;
	Mon, 14 Oct 2024 13:24:23 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0JM3-00000004wdY-2q8y
	for linux-riscv@lists.infradead.org;
	Mon, 14 Oct 2024 11:35:17 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-20ce65c8e13so8094325ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 14 Oct 2024 04:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1728905715; x=1729510515; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=snz/6shGNFzAdeteNvkrsQdTR7sYmyEMdXJIej7ZazI=;
        b=Pr03yYLm+wq6TvsITFj2DiJwiA5DYT1srubQJAPP6+dlUwayoDY0iSdvcll4jN5KyL
         UWUUZLAbyOuYoschgBmy3ttPc5uT8F91am7r38ZPupjrZVM8ebq3NyT4ax74ZFJ0ccMR
         LeV3/pq47gbzo6EqP8unayb4pRGK0K5A8YC6rP8/CMHzXTePvpqN0Lr7u7QLkZUmJBuI
         YgYf+lHwtDlXt8Tr2T4tdbxdXXJiNmzBCUny9I6CUi09QMYg1NmFHftdj5dHTSzH+QHW
         K4WvFAE/L2FMVGtfnQjQWGnrrIlU4kk1w78c4CX0o4Rw6Ax3bQ4HETnhR3DOPi6fY+ZL
         LzKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728905715; x=1729510515;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=snz/6shGNFzAdeteNvkrsQdTR7sYmyEMdXJIej7ZazI=;
        b=I+RBO+1qAUsJueG3kBMsAiGyex2gG4qtWF4m7fPNtk3jeQujHGKHQUbmcS4PmrcGkm
         vs4lo7/thjOT+ZyjZleYyipCWPulasppAj2eSBh20MUzrHQ54nhKDv3RBwDpIsPCruPx
         wAN11RoWHuBuIuXSEwPryTnH6vIjSWZRskzjv2Unfh7peKWwy4ELUjdagD9db3zWR3QV
         qGOwnNuW8ldA1V8W0gSH6VOIVLSRI2OkPsFpoPE3A0IZorBYbz9K07UtJtL5ZFa8RTwH
         ufi4JSPkHzhZT4NBl2TyPdMRT5NrJ0HU1JX5mM3Jvy38I4nZu49Hjs51At93gvXleweG
         NTkg==
X-Forwarded-Encrypted: i=1; AJvYcCXXB4sHISAzZNbFBntV3Fot62mjfg2eSE455+BIvIK4iugdUUg2iPhuG3MhEYVdOOtx3UH6dPlXfO1vOA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxty4N+0de/OLqtM8fGO8hViJOY0UsK35+bLHQo7cv0GFdXpRN7
	I5QRagpsbkJN8jCLarSnENKcN146jFmb9NWU2oW3jS7B6pLfRdgBYOiL6YunExY=
X-Google-Smtp-Source: AGHT+IGKqFRVq7FAJ5tVZzOxYuKOJPgD+oJeoyWNOgNGtSMTpyAoZrNEO24fTtipgTDktQfY/8QGaQ==
X-Received: by 2002:a17:903:40ce:b0:20c:5c6b:2eac with SMTP id d9443c01a7336-20ca16d2da4mr154491475ad.49.1728905714839;
        Mon, 14 Oct 2024 04:35:14 -0700 (PDT)
Received: from sunil-laptop ([106.51.192.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8bad3385sm63925665ad.42.2024.10.14.04.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 04:35:14 -0700 (PDT)
Date: Mon, 14 Oct 2024 17:05:07 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: punit.agrawal@bytedance.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, ajones@ventanamicro.com,
	alexghiti@rivosinc.com, jeeheng.sia@starfivetech.com,
	haibo1.xu@intel.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RISC-V: ACPI: fix early_ioremap to early_memremap
Message-ID: <Zw0B6_k7ejVtBTRC@sunil-laptop>
References: <20241014094705.71775-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241014094705.71775-1-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_043515_746659_38D26F99 
X-CRM114-Status: GOOD (  17.83  )
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

Hi Yunhui,
On Mon, Oct 14, 2024 at 05:47:05PM +0800, Yunhui Cui wrote:
> When SVPBMT is enabled, __acpi_map_table() will directly access the
> data in DDR through the IO attribute, rather than through hardware
> cache consistency, resulting in incorrect data in the obtained ACPI
> table.
> 
> The log: ACPI: [ACPI:0x18] Invalid zero length.
> 
> We do not assume whether the bootloader flushes or not. We should
> access in a cacheable way instead of maintaining cache consistency
> by software.
> 
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>  arch/riscv/kernel/acpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
> index 6e0d333f57e5..3177c9af8764 100644
> --- a/arch/riscv/kernel/acpi.c
> +++ b/arch/riscv/kernel/acpi.c
> @@ -210,7 +210,7 @@ void __init __iomem *__acpi_map_table(unsigned long phys, unsigned long size)
>  	if (!size)
>  		return NULL;
>  
> -	return early_ioremap(phys, size);
> +	return early_memremap(phys, size);
>  }
> 
I think __acpi_unmap_table() also needs similar change. You might need
to typecast to suppress the sparse error [1] then.

[1] - https://lore.kernel.org/oe-kbuild-all/202305201427.I7QhPjNW-lkp@intel.com/#r

Thanks,
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
