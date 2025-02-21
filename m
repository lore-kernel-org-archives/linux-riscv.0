Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D0FC021AA
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 11:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T6rT5Q7Ike66qxUz2L3SggkNNLlkNOQyQ6RAEoqdRH0=; b=XqkDlxBgIVuL2W
	Y7pPrVhaO77b0iS/Kz+hSWkbXF1mEU+rC91giKXQric3m4I0CynDceaJaV3RstcJ0b7XgjnEoKz04
	Oy0LYjhduwpWg6g6HjravOUTwiinP4mLCAq9u5J/dcNWBEt+z7v6fjSv5dPzATLoXRSROG82F87yo
	nhenzKk9Dhar7J+dqBMvvbYpK5PFsF+nLuZzDBoHIGFJ2/iUVrabB4chQt5dYSUJnSI/oF96R1jIK
	4BhHvQORkDh7Niqy1WKIF/bogQ+EYvIhUgutlVNCQa/I3TwLFsbmA+2ncYkAJ4cZW73WQgTJLa2UT
	/kacS3kF9Eh9/nbeSYNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlR24-00000005JCR-13i8;
	Fri, 21 Feb 2025 11:17:24 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlQwL-00000005I7Q-0wCO
	for linux-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 11:11:31 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4399a1eada3so17075335e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 21 Feb 2025 03:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1740136287; x=1740741087; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jSsWiZSoq00eYWyXg0OJO1m3DP0gspy/2ZFYEnCczbE=;
        b=Zdfq0b/A6UfZOxKZfXgkXNA2qKDf2lAWWw4NmaB/5kv2vYEzVnixXSx9Jbwk2Y5w5H
         wIIxlKIrHJKVe50u8AuTOoP4ot+YicnH3TpCmYFljsEjZqWqTNCByQIURsrq/ElafAZW
         vEgrp3vnoy9+8NaF3gKAQnjdBC2qru6isQLgKP6L7cNZ8uyvJPV43jAFfppayrbVT5sE
         xHcF84ozQ/WMNfVWEW5HD9EylNpc+xTDcya53xnQSdIoSmiywQLvVH3eoSF6jIrT6xkd
         K2lCDfPkwx5pUDjx6gwioB6N+heDYrPyIXe5RhACVMpgH4iiWh6fUREaw3KSscn34Q8G
         WxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740136287; x=1740741087;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jSsWiZSoq00eYWyXg0OJO1m3DP0gspy/2ZFYEnCczbE=;
        b=jN8vltQ+kgfjqvKrWZoydZFPvyqJWCos77nZFbAnc+xM7ZuK10dRC4RjF8BX/sRG2y
         S+zz3c8Ox30hwPLoluZKK+wVvQ6LKchbywgOtBw4723vKI4wXSdU3yZye1WN4O5Pj4yV
         O6kkoY3NB/IwOQs6haHbSmbxCxVCPKuWWifi/847KbDqMM5mc71t591S6PE9qk2xbIVT
         9zef2FQf6NPWhbJV+lwS2zmJH5mgWJEWhxvKBLXc8xnkr/0wMP/+hZyZQ5jE2tf91pZg
         7y25P5X/vRrz538O9gjAqcRFA+zYZXbSPp2bplG5m84O1rUQQw6OgjQ6OD3rWnhLIF/Y
         aE8g==
X-Forwarded-Encrypted: i=1; AJvYcCUI1xmWefqBk46FBcoZeZQnUuy+fxeJ+OoVC8RFI0ua3hEnltRuvn3pkhMofHQZEhxi66SIIlNYz3opUw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzHDy/Fk80BzEGx3T+Vh2hDv+FKLAH4WNSPDnJqqbkUIQ4O1xzs
	OwrCVQ3xD2S/JjhkoMoYFFPGQZMqs+ewZ918ApKNPtO72EiMZTHo/dfNGNH+M8E=
X-Gm-Gg: ASbGnctXs+1Imxqz/BsMKVTDwFEp0aeNkpmrPjP7zaCJRKumP0gj0R3FTZXcjTjnLmX
	D+1AyCUzZyrGBHerwf4spEFZcN/r5JeqA09+zyRHojhQLR/7udnjQzzhhYetvc5k5VKTj95WvE7
	8nYbUhYoOvXX385iuv2yWyx4j5TOTvRmCaljkBDKCPkko7Y7+xlwmzHceNlOIrMRY+j+E9vqG/2
	Yw3jZcTrQjyolOfNvcPUyfoJQWAFbYSIpWEJhLRRp0IxjxTH7h95VH6r9mvdQpYVW2cpNoQFOQn
	h7N3lGeoFQsjUA==
X-Google-Smtp-Source: AGHT+IF0uAlwa6gBu1gPr2dqwSyuIZZV/tSdbeIren4YqG3M6YP4kMXrRqTqSrM5G5BkGMJt/vM5Cw==
X-Received: by 2002:a05:600c:1396:b0:439:6d7c:48fd with SMTP id 5b1f17b1804b1-439ae1d877dmr24012595e9.4.1740136287415;
        Fri, 21 Feb 2025 03:11:27 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::766e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b439dsm22921657f8f.8.2025.02.21.03.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 03:11:27 -0800 (PST)
Date: Fri, 21 Feb 2025 12:11:26 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: BillXiang <xiangwencheng@lanxincomputing.com>
Cc: anup@brainfault.org, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	atishp@atishpatra.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, rkrcmar@ventanamicro.com
Subject: Re: [PATCH v2] riscv: KVM: Remove unnecessary vcpu kick
Message-ID: <20250221-11926c4f2ca3fab3b565bc92@orel>
References: <20250221104538.2147-1-xiangwencheng@lanxincomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250221104538.2147-1-xiangwencheng@lanxincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_031129_277653_4614C38E 
X-CRM114-Status: GOOD (  19.29  )
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

On Fri, Feb 21, 2025 at 06:45:38PM +0800, BillXiang wrote:
> Remove the unnecessary kick to the vCPU after writing to the vs_file
> of IMSIC in kvm_riscv_vcpu_aia_imsic_inject.
> 
> For vCPUs that are running, writing to the vs_file directly forwards
> the interrupt as an MSI to them and does not need an extra kick.
> 
> For vCPUs that are descheduled after emulating WFI, KVM will enable
> the guest external interrupt for that vCPU in
> kvm_riscv_aia_wakeon_hgei. This means that writing to the vs_file
> will cause a guest external interrupt, which will cause KVM to wake
> up the vCPU in hgei_interrupt to handle the interrupt properly.
> 
> Signed-off-by: BillXiang <xiangwencheng@lanxincomputing.com>
> ---
> v2: Revise the commit message to ensure it meets the required 
>     standards for acceptance
> 
>  arch/riscv/kvm/aia_imsic.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
> index a8085cd8215e..29ef9c2133a9 100644
> --- a/arch/riscv/kvm/aia_imsic.c
> +++ b/arch/riscv/kvm/aia_imsic.c
> @@ -974,7 +974,6 @@ int kvm_riscv_vcpu_aia_imsic_inject(struct kvm_vcpu *vcpu,
>  
>  	if (imsic->vsfile_cpu >= 0) {
>  		writel(iid, imsic->vsfile_va + IMSIC_MMIO_SETIPNUM_LE);
> -		kvm_vcpu_kick(vcpu);
>  	} else {
>  		eix = &imsic->swfile->eix[iid / BITS_PER_TYPE(u64)];
>  		set_bit(iid & (BITS_PER_TYPE(u64) - 1), eix->eip);
> -- 
> 2.46.2

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
