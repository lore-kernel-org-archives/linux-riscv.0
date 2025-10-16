Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A584CCD194
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Oct 2025 09:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=matxY9B8fXfWMUlEQR77zH1cJDIBsaF5+DiHGRDNzjo=; b=BqQN+wtBIEyPVM
	HqVOWpuZbaDqR36MNGzpt9ORqtyHzm1vIn6edZs0oS8AnIAgPO7gxuOnMaBpFfos9p0tnD1zVPps0
	XAYmVmx6k6FlLwEX0DGg/Az8cOn7M1SH0bgMnLh4mqzxe0IMRifRcnmr0aLTMvcWd2fZnhlURi2hx
	yELIZAkY+ZuJPmAwYTyN7OTGYadvJP/ooxBTHkL37CzwyfBtX9wRsQAL6y4Mqu/DCRcHqFoQjIAVg
	cKb0z3Gp4nZ6DM8czKH38+VEVPEz5cbrks0Z4BZmOTrT8LxOubORgfTHLuQ9nwlfYQkNwRKHFdHyg
	GVrkF1Pb37kkp91Emv3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9KVD-00000004G4Z-3ybn;
	Thu, 16 Oct 2025 09:42:31 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9KVB-00000004G2y-1KcN
	for linux-riscv@lists.infradead.org;
	Thu, 16 Oct 2025 09:42:30 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-781251eec51so490785b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 16 Oct 2025 02:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760607747; x=1761212547; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XT2WFxsGOH83YnSrOTwI7TIxuKSwIlmbX1n8UfKEr10=;
        b=QeS3ay9l89BbrCpT1S3myYPngVYKRTp5PkThGNC/kpmwB9KfmCRrXWF8kuYoW7mN7O
         mCujkkIBdh2q38x+YOZVpiJOl2Pvy1+wyG6ZEfRVpXPeatptjEGqPMyYap3TKPgoUTJr
         ZMOVz9osHkWefwRAIqS+T3ijrseMbyLA4oPLJfG0mE4xeB0b6ERzJ/r8+WlzMzROBoPM
         42HGffr53caTVGIWcxPoDhBsMJ/0QgF7dW65PmA+3Ot+I/nz/DNH5OJiyVbkHZJNO7WB
         vW8JLcO2dt8WMeXgfPC4HtorgN2qEYYy7NLhoEvyJbjLW6QvT299x0mZYps+sGToz5B/
         pA8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760607747; x=1761212547;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XT2WFxsGOH83YnSrOTwI7TIxuKSwIlmbX1n8UfKEr10=;
        b=BOCHe2Uks7a9NDzuaOQ/sw2O0blH0q0zxMALRuzEzixeySGvBD0Khyj6DM9Zrbe+E3
         U0M4oes67XaIzkqp8vYv6nOzdppiSaVnjAYnUq3J1iNvGLitsaZS7XCEEwS14JxMnfNF
         L7WHAeieEIjtelin1JEAqHl90kZeN++t8IEqAqDLXDbKoJ9nj8Rx2Gxd6UVPxJYuhlTR
         8r/sclEbrh6SkRNxj2bkYJww4FmTDlHzXkcN/wuSItactpjX6d/dYx05Q/jr0OHDWt42
         ad+YyVuGZxQDHS6X/IxH99nMk5YKgXJK87FnlczJp/1GWvXsRXUR8QGvFYox7PpNsXo2
         29Rg==
X-Forwarded-Encrypted: i=1; AJvYcCXSfAUIfinozkjW/wGUQVJmFjhoVORi0KqnIGRrkaPX5BJO2ZPwQZioef4UF17B8UqpJaxDHehMc4jKjw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxFU9KnVFJtIf1yrQRanMnFza3VIU85e+EVz+RedVy34O6RRjC/
	ZD5gmR1KpGrPl+auMqmDYa9mfa41GRkUWk0B5qV8S2vddEvAhtw9CypnhR89Qx/nHN4=
X-Gm-Gg: ASbGnctK5FzO66hLDYhof7/ISqISrcFj+Bw0GFDnxQ3kHRylcCTTwdmMEyvVD2usemP
	1NWLs9xwfypQqciZHkxNgQiJPTGSGKYoeJZ+4PdesSCSiv9LGcyG3POEcvfASW9S72hMfZ+gzUQ
	ZkgU+u/qA4S+dndXEqFp0un4U96y+kqs12jDGTLYQ51jPrrkEhWlcX4t88FBWRifkA5wxgeIlWc
	Zj6XeZmGUnWcm9JRII80C7X58p+/cLaiD9q2Ch5DniqItX048pNaKuFYX5DaTJxkVD6sQnto/hR
	nWRGQzR3ihlgSJiRYY1mnugykHGpTdcaqSXaeHAmqkpuQqY2Zt4d5h7SegxrH5OOC6wTaA8Lm6H
	W/PSHLhbdbM79WLETPcMkfCXLMy+fuCiDr7/r/FeVlaRjF4AelXoUODgGok8rs2+afk2NDjnLit
	RUHLgjwUJt7O2P
X-Google-Smtp-Source: AGHT+IHCkThTNuYCNDPFDMoaZ326MNb+xnCy44BX/ER0JzSky2C3Wp9VABYjJvXunm9KzBwzZGmmPw==
X-Received: by 2002:a05:6a00:179b:b0:782:2b62:8188 with SMTP id d2e1a72fcca58-79387242eeemr41932448b3a.15.1760607747335;
        Thu, 16 Oct 2025 02:42:27 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d9932edsm21496728b3a.73.2025.10.16.02.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 02:42:26 -0700 (PDT)
Date: Thu, 16 Oct 2025 04:42:25 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] RISC-V: KVM: Fix check for local interrupts on riscv32
Message-ID: <20251016-7a89633477ad3dd0ae6eb969@orel>
References: <20251016001714.3889380-1-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251016001714.3889380-1-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_024229_424341_97FA76B2 
X-CRM114-Status: GOOD (  15.02  )
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

On Wed, Oct 15, 2025 at 05:17:09PM -0700, Samuel Holland wrote:
> To set all 64 bits in the mask on a 32-bit system, the constant must
> have type `unsigned long long`.
> 
> Fixes: 6b1e8ba4bac4 ("RISC-V: KVM: Use bitmap for irqs_pending and irqs_pending_mask")
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> 
>  arch/riscv/kvm/vcpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index bccb919ca615..5ce35aba6069 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -212,7 +212,7 @@ int kvm_cpu_has_pending_timer(struct kvm_vcpu *vcpu)
>  
>  int kvm_arch_vcpu_runnable(struct kvm_vcpu *vcpu)
>  {
> -	return (kvm_riscv_vcpu_has_interrupts(vcpu, -1UL) &&
> +	return (kvm_riscv_vcpu_has_interrupts(vcpu, -1ULL) &&
>  		!kvm_riscv_vcpu_stopped(vcpu) && !vcpu->arch.pause);
>  }
>  
> -- 
> 2.47.2
> 
> base-commit: 5a6f65d1502551f84c158789e5d89299c78907c7
> branch: up/kvm-aia-fix

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
