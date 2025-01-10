Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60457E7719A
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 02:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PCUSxTWhSAlFNpg4X2d0SgV2dvooVnqXi67CIjw6M6w=; b=MfLvlkgOcYqik/
	8inGYzolKUJ6y4Lv2I0BWDNtrGSfPpRCO8H7YWVck+U8G2FSpoH5QMl+mIfwuQ4hRp/qDSlo4DoQz
	iuMGCkL2kHiWpMIOJVZnct7RLx5bBIjlpTG+aFpE9kzi9EYWv9uXn5gulAAx98+GDSDc5yQPVMWxd
	s2fvtbKGJ96PW/GsfA+kdjmy/E7Qcj7xqPZAEhYzJvYtIH+Gc49pB+KyC399xXT0+9c0t5Y+4pnxP
	Lq6uvLG2Wr0DyvNBR4/TgXTbxwifj7g/LABetJchB7pwMjUi7i5bwhgjQhYEY+v81FP2YFUM5Y0bO
	cb1KwSSlHfcnSxlW1IxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW50v-0000000DrNn-1hM2;
	Fri, 10 Jan 2025 02:44:45 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW50s-0000000DrMo-3jSk
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jan 2025 02:44:44 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-21649a7bcdcso25020565ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jan 2025 18:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736477082; x=1737081882; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=caWTBlewbD0QAQDMzRt4/otJEJ5C2eutlx7bRA+hads=;
        b=X9OGfOneg6nY6Chr+4LS8x7SEgETcQqQD0qRQXk5CdwJQe6pobAH7SfEzBfAKuU7Xv
         pYgVx6tVHm4CMnvixXQ1t9XXZNZU/rT35YQD3vDShE1ixToH9waKR8nHANI9b0HMcibN
         I9+wox02u359kz0hC/NeskrPksU3SoqvVt7F5ds3kH04TZtOJJLq9QzJncBCzqo5NT51
         B4hEMF6/4QU39YDowITtrgeONkGT4epbQXDj0wkLQwFb4S0BYuYDopNVpNiPT60AhQnW
         XGfxHtCjsDpLis5Yt9BOs4KLrfj5plSc+TvCOC10SD20+IPNuwl19hiRuVlsgQEvLLxA
         oKHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736477082; x=1737081882;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=caWTBlewbD0QAQDMzRt4/otJEJ5C2eutlx7bRA+hads=;
        b=O7LLbwCImNDaIJoXWJIfv/miZsIlDEhJijsSsDmBAoXC651uXZbF/pFuhMt53ivT+7
         6JPpZqhGt9+C1fxkgyYSAoBz7khC3wimIUV0LMlgmFkhICm4ku3FgbN837oHR8UVueRM
         HES4Kk5D3pTX3eHvtFKerGPwvQbfm0hce+ag131j/bQ4hxYWUIeiJlTHyTNFW80h5N69
         AuFQhjdpsOryFQ5O31vi5EwAg7UbO6OnaLqK96iAh0U9X7Zch+DGJyqm+C/tZ3HU26EN
         qRdT28s00kVFakL1zYHFfKw2UeC72KNaQ8c4VwoxfEsZTvp3aNUSWgyU8yrBMe6vT7wZ
         Lk0Q==
X-Forwarded-Encrypted: i=1; AJvYcCW66vt30o1ydU4LukzQuWcJ7Cm5KZOYSjpmoj11z18nN7XTF8mxqilYKOSUniDIlMLiHLh0FwE3azW3SQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YziDVtQJpVeXS4iTRN4sW8Frr5ha1Z2JhFFjs+M4ocsKR4LOhM6
	XXx1pVaitrzo36ep5liRDFv2g8dDC5KcRhhUdiXL5tE13r/7QVOnZxf1/Pxbfi4=
X-Gm-Gg: ASbGncvwkf0KZQw5N1h/Sssd7n6LeXVMWpBk8yHsm6+V9w7OtHU424uv+n0/cnjqJQD
	sgGx3rxV89Yq0c49HElJqJoDCF1xlxImSaFn+cSstAJtYhz6VLlazj9x5JfKO+YL8EC2mBIhQL1
	DPreiTwZXVxwejd+16suyA7MiPezfyuzbrivWn6IXSQZTbiacEfYQ4zjR2DIerSgQJjSyNj9c11
	ptBUlQ0w+7vK1zvQJQVcwBWA7tjFbIRFp3abIZqC/9UO42mTQjF
X-Google-Smtp-Source: AGHT+IFlRtu6l5mEzMt1KG7rnqNGqfPFXArBqJ0XQuS/Gm9ftFlurHOHzbdJUCjSRTmC9tm9lxKH6Q==
X-Received: by 2002:a05:6a21:168e:b0:1e0:ce71:48e0 with SMTP id adf61e73a8af0-1e88d2f69d8mr13896318637.39.1736477081989;
        Thu, 09 Jan 2025 18:44:41 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:691c:638a:ff10:3765])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d405491b8sm535145b3a.9.2025.01.09.18.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 18:44:41 -0800 (PST)
Date: Thu, 9 Jan 2025 18:44:39 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: guoren@kernel.org
Cc: tjeznach@rivosinc.com, joro@8bytes.org, will@kernel.org,
	robin.murphy@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	baolu.lu@linux.intel.com, zong.li@sifive.com, iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH] iommu/riscv: Fixup compile warning
Message-ID: <Z4CJl264jMZAIogB@ghost>
References: <20250103024616.3359159-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250103024616.3359159-1-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_184442_926671_B328BEFF 
X-CRM114-Status: GOOD (  17.10  )
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

On Thu, Jan 02, 2025 at 09:46:16PM -0500, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> When __BITS_PER_LONG == 32, size_t is defined as unsigned int rather
> than unsigned long. Therefore, we should use size_t to avoid
> type-checking errors.
> 
> Fixes: 488ffbf18171 ("iommu/riscv: Paging domain support")
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Tomasz Jeznach <tjeznach@rivosinc.com>
> ---
>  drivers/iommu/riscv/iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index 8a05def774bd..38d381164385 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
> @@ -1270,7 +1270,7 @@ static phys_addr_t riscv_iommu_iova_to_phys(struct iommu_domain *iommu_domain,
>  					    dma_addr_t iova)
>  {
>  	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
> -	unsigned long pte_size;
> +	size_t pte_size;

riscv_iommu_pte_fetch() expects size_t so even though ILP32 isn't
currently supported in the kernel, this change makes sense.

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

>  	unsigned long *ptr;
>  
>  	ptr = riscv_iommu_pte_fetch(domain, iova, &pte_size);
> -- 
> 2.40.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
