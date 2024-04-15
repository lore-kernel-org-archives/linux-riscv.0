Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD06C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 13:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uc99P3r+1EFn8uL/rB2FnTHDwBvuQIIiTx7FKSCiRDU=; b=PThLSN6ZVcSU4u
	Aums59EfvEj7cETB9U/062uaLeIDTxyMWRyLMLxOQWubLALXjXxQ+p9/+ziO/cQCJnyZuAhicA71F
	SzKgOnMwWmEWQNDxPGR3haU/oa32U1C3UkGvM3aAFt0WyEmrSQ1x5dkj8kHkfX1FFJkZL1e7yzbC9
	ZKVeV5qEOK2Cx7/AXDXSeu+jxqlq2oML5lck4k4kAwWztX4VXC1uVqeyue88Ttc6Hy/ybFcv9xC/4
	yMI4fQqngZ5JWzeCgK324sPqIuZXU3S8BV/UepWqNCqR1ASzHOitedYIFxAhJQHP0A8qeMdKNeWDl
	/T908VFlFM0bofc8tY/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwM2p-00000008NIi-2jG8;
	Mon, 15 Apr 2024 13:06:47 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwM2i-00000008NEu-33rC
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 13:06:46 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2da888330b1so11388481fa.1
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 06:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713186397; x=1713791197; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0+QRCDHPbz+mQnU+rPEOfZ5PlBfWp32GZiq6bjgpQeA=;
        b=V5n+2KkWGQb2Nm2VN/p2w5/SQNGecj36XUMpAVPiO72MWFhB8IOFDQVEZWotOPQvft
         fqEIDFzcwG8rj7kplF6WHb0NpcbkHKV7WNqRglXp4BxoM5/hJ2gNdMghp4w7SGAS+bhI
         TocvFipmIJ57XSOgUrXNgyBx+jWsi8buTpFJZB0jLWf52xfdAoPovQVQHl45a8f2wKmg
         dAq/l+SDQCnxP9Pzinv0jK1LpU85Ijt7jeUoyL1H/6fmTyR1ScXFMQSIURT5RVpCjTkt
         KUAuBi/8hDT2H1i3YOCosjOe1QGRafUdIT3PJanFnllQ144ShRQvPSxCLR8LfTs/ELQj
         YBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713186397; x=1713791197;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+QRCDHPbz+mQnU+rPEOfZ5PlBfWp32GZiq6bjgpQeA=;
        b=XZGc9jF5omOyXWq6rs/PwHALTwC1geoTcOkVGN4t0Vk+DxFRMVuuyB1bvRiorgMTvo
         /h7o23PeKPizIXxXIIPlVXp5+zlTrQvlmfOof/+GlypIEAwpq/LnzB4/gGBvwJkLNnWN
         1njZW8LfGvucdvzaWyXgio6E7VqQ6dye2RwUg9um58HvqJW8nnnE3O0ocVs8TFTc5BZZ
         WZosVT01Gdyi8d6SA/vgj4dD7+vdsrbgNcPwSb5Dg59pWKQR9674jQj6xejVjm/5FzIb
         YHDMAy5Jj9/gaE2wMf6Q5vNokYOJtauHwGZfdSiXtP6hv47ArQKFlFKiHlSoBo9qy6QD
         jF3w==
X-Forwarded-Encrypted: i=1; AJvYcCVifZ9Ou9H9xdemtYQGVlS4dFj27hmrff5gWv9CpOzUj6eTqCi+N4Wj/LwT0efiimy08G9DTS+179zKwqbBPpzndsA7xtviys7kzxfr5+SN
X-Gm-Message-State: AOJu0YxSvaNpS8WwhpOA/mODKFBPq7ir9Uk72MfzI5v1NZszyNaALa9m
	gExL4fNcF+wDyan14NWNr64eu+M9qEQITv9aPf6QLXhjLBLJl34taO7lrOHA39w=
X-Google-Smtp-Source: AGHT+IGFmVnC0mQLQib6YvAkM+B394OqmZQ8G1VQ5hm0jgJqcVKUD4C5OhCM3fHue9y8M9iXA9JCIw==
X-Received: by 2002:a2e:be8b:0:b0:2d8:dd28:878e with SMTP id a11-20020a2ebe8b000000b002d8dd28878emr7797631ljr.2.1713186397221;
        Mon, 15 Apr 2024 06:06:37 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id o4-20020a05600c510400b0041624ddff48sm19436126wms.28.2024.04.15.06.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 06:06:36 -0700 (PDT)
Date: Mon, 15 Apr 2024 15:06:35 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Alexey Makhalov <alexey.amakhalov@broadcom.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Juergen Gross <jgross@suse.com>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Shuah Khan <shuah@kernel.org>, virtualization@lists.linux.dev, Will Deacon <will@kernel.org>, 
	x86@kernel.org
Subject: Re: [PATCH v6 07/24] RISC-V: Use the minor version mask while
 computing sbi version
Message-ID: <20240415-e229bb33ad53ce43e3534f5a@orel>
References: <20240411000752.955910-1-atishp@rivosinc.com>
 <20240411000752.955910-8-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240411000752.955910-8-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_060640_801248_389F3321 
X-CRM114-Status: GOOD (  19.81  )
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

On Wed, Apr 10, 2024 at 05:07:35PM -0700, Atish Patra wrote:
> As per the SBI specification, minor version is encoded in the
> lower 24 bits only. Make sure that the SBI version is computed
> with the appropriate mask.
> 
> Currently, there is no minor version in use. Thus, it doesn't
> change anything functionality but it is good to be compliant with
> the specification.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/sbi.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index f31650b10899..935b082d6a6c 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -367,8 +367,8 @@ static inline unsigned long sbi_minor_version(void)
>  static inline unsigned long sbi_mk_version(unsigned long major,
>  					    unsigned long minor)
>  {
> -	return ((major & SBI_SPEC_VERSION_MAJOR_MASK) <<
> -		SBI_SPEC_VERSION_MAJOR_SHIFT) | minor;
> +	return ((major & SBI_SPEC_VERSION_MAJOR_MASK) << SBI_SPEC_VERSION_MAJOR_SHIFT
> +		| (minor & SBI_SPEC_VERSION_MINOR_MASK));

The previous version had ((major & major_mask) << major_shift) | minor
(parentheses around all the major bits before the OR). Now we have
parentheses around everything, which aren't necessary, and no longer
have them around all the major bits before the OR. We don't need the
parentheses around the major bits, since shift has higher precedence
than OR, but I'd probably keep them.

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

>  }
>  
>  int sbi_err_map_linux_errno(int err);
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
