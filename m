Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5449C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Nov 2022 08:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WRmVOmodVNVj+dlDlsmYAID0sm+GJmg2YLj3s1SXnbk=; b=mSQRGMmZztSEaN
	g5aHiARsw6slMtm1aTNtMjNjkTIr5LNvoSUrrjWT3vCEl20OujU2ixCacqv6Sas+KrrqOqsQsr6wy
	93bswtTWVxtRjG+uZGpczFoPj83vieb9PNXuqyGBThTkxWa2gZXBuj4rNl54ZBjQmOoTfWpg0Z3l4
	oIvA4hyZUVCJd+SaWJUy2eUoRKa4kFMO9WPzCq8cyZDbN9jzTjoQIjJlAn5Q43vOnLWmIbuMf2o3+
	mViSKZBVd9aY9GSU48vEGHoCiL10orrinjLy2pfwGiengYgpM23wTS+3br1l37txK2tEJJjfBLwsv
	kKVrDJk7TzJ+IZtTKSDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq8tX-008nOl-Ce; Wed, 02 Nov 2022 08:14:43 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq8tT-008nMV-DV
	for linux-riscv@lists.infradead.org; Wed, 02 Nov 2022 08:14:41 +0000
Received: by mail-ej1-x62e.google.com with SMTP id b2so43226795eja.6
        for <linux-riscv@lists.infradead.org>; Wed, 02 Nov 2022 01:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D14YT3XLwuvaV8kqztxV7M3vETwAqi+zmM/96cR0AHc=;
        b=GpxpLcagq0joGePZScEoh0i3uH5ugjVvEjPoxt6kBCBuuyzlqo35cKCnfHJbdie61w
         5924bp2eq0lkMdv6rrVStc/1EDNUfXLLfHgyzrWuin2h2jlj4y0iYMtNajL4TmLzDdNs
         qH3BGDP7oIMrRmR4ievX+HdXwMyP9WjFo5MJtElo6QNB+baDZ1ZOxIBLHWQ/k3DKhnyC
         cqwwEIMjTqU7dz+O55o01joMEgDoWIbpj7ggH1OouJ/WJT6ZtBCwS9BmiyxqWwkSvWW2
         vcpFf4ICDsu+KcmJO0q9Wc+movMbILbPOvqFKyHIv6XByLlDdw4aOKUzACk+rlX6nORq
         RzJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D14YT3XLwuvaV8kqztxV7M3vETwAqi+zmM/96cR0AHc=;
        b=CVW4ZyZ74fnuN17EDN52q5c1HIvBfj5ADrs5Q+nqtH/9+odCLMVurcekO+gSA5Tbzv
         G6EKkb5ssMWRj2A72Lz6mtZlxD7GbNuT9+VmF59YwglDaN4rU0qEH/KpQwWawtmzwshG
         GBP6EixQjJdqnb4g7919LSkHolOdA9uAWL970OEBsNwnu1Vf5KCSY3rnynsKWzbz53g7
         NuboLRaCPEOB/cHAUobcRsCO7CN+ZDpcXlzvzfvXt3/gF6+KupZ3e3WWSOdzDYuBaIjB
         bcf4l7E1hTjzLZtCl3/fGxlpi2PR1abYA6i/DtibOwrsRe4xYMafQbbrdDHRM5oX7hJZ
         uHtw==
X-Gm-Message-State: ACrzQf2H2Jp/rvs6zii/RmEadPiK7fghgMsvHq1+0em9mtIEg8ISLs97
	nUTvghEMNu2sMdKbv3oUJneKpQ==
X-Google-Smtp-Source: AMsMyM4Hi9Yx2VNLrU6zltuTqYjap+HJCkqA9L0ASaNW32WvbmixRlXRCpjN14oizcYbeHci3HBLOw==
X-Received: by 2002:a17:907:1b24:b0:76d:7b9d:2f8b with SMTP id mp36-20020a1709071b2400b0076d7b9d2f8bmr22307335ejc.414.1667376877280;
        Wed, 02 Nov 2022 01:14:37 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id w25-20020aa7d299000000b00463bc1ddc76sm1522773edq.28.2022.11.02.01.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 01:14:36 -0700 (PDT)
Date: Wed, 2 Nov 2022 09:14:35 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Bo Liu <liubo03@inspur.com>
Cc: anup@brainfault.org, atishp@atishpatra.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RISC-V: KVM: use vma_lookup() instead of
 find_vma_intersection()
Message-ID: <20221102080749.dcp76ow2sfv5hhx3@kamzik>
References: <20221101053811.5884-1-liubo03@inspur.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221101053811.5884-1-liubo03@inspur.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_011439_469076_770DD852 
X-CRM114-Status: GOOD (  16.79  )
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

On Tue, Nov 01, 2022 at 01:38:11AM -0400, Bo Liu wrote:
> vma_lookup() finds the vma of a specific address with a cleaner interface
> and is more readable.
> 
> Signed-off-by: Bo Liu <liubo03@inspur.com>
> ---
>  arch/riscv/kvm/mmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index 3620ecac2fa1..5942d10c9736 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -632,7 +632,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>  
>  	mmap_read_lock(current->mm);
>  
> -	vma = find_vma_intersection(current->mm, hva, hva + 1);
> +	vma = vma_lookup(current->mm, hva);
>  	if (unlikely(!vma)) {
>  		kvm_err("Failed to find VMA for hva 0x%lx\n", hva);
>  		mmap_read_unlock(current->mm);
> -- 
> 2.27.0
> 
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
