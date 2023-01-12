Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C37C54EBD
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jan 2023 10:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hdg7QpUKNhAxU2TFsRe/FrgIXlfqJeeEiNHf3iyZlEQ=; b=Ie6C/50DF8FgR6
	8UaOHTtzM9csDmybvWx+lbMiCwwr/h6CV/1oed6o/spG9OuA9vCDYQ1hhOIwt5zyplYxJIpARUmdE
	NBFzv/h1lbrXYvUL9h52dI/zsHdxVp2Dg0PKVfZaosMhgL9mhpVVjwDFgBXcfW3IDuWxK6crM6gqp
	bmSuRboM3JHrOfQhbfZ7ajf4sEfWpj8yb5qSekF1r+X3vf2wg3u+Zo6wBdsQpN+vYRDzbG+REcPxR
	fbQKriwdRLjUwbmI2e9Jtyo/0yB7QFiejjuAYN7tNN3XZ1IPNyrbRvX1m/pIPXVSiiHu5LkoWDH6W
	Aw1LsaVgsjIQq+ORZM0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFupC-00Ea0J-Oz; Thu, 12 Jan 2023 10:28:46 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFup9-00EZy6-Al
	for linux-riscv@lists.infradead.org; Thu, 12 Jan 2023 10:28:44 +0000
Received: by mail-ej1-x62d.google.com with SMTP id u19so43556260ejm.8
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jan 2023 02:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yN+RLFgvhbz6KNBj4UOEkh6O3KRKmh1JWLTXowfNOQ4=;
        b=OGHK98KQTQCVgP5ZLb6uoWrVZz8ZRATpTGiM+GOa8RsP/vCZb2W/EQEp66Mlkp+gqB
         QNDhS/6bBgw9vsyeH9NAw+v27qnm4efliinHoe6pQ2ceKTcbnAqu1jyURCEweldo6cv2
         0Zg9csNpUlkSJh9q60VIzoxpgdAE69Wt/R3hRJITojYyhgz6DLwM8TeCnlDgwV7ASlZZ
         XaAxMT9OcLSA30eRd10vBWc3sCnCOREd3B2TLUJMfNbH5QyR9yUt6truxXqkiFr0mSGZ
         tGpS0D3wVlLxJdYzg4egxn3mCqPC1XiW4xp2BkHSX5lCX4uFMCHTJs6ZeQ1BJuAZAT6o
         i8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yN+RLFgvhbz6KNBj4UOEkh6O3KRKmh1JWLTXowfNOQ4=;
        b=eblQNPXtHGruWpzCIq8395Khi7z3RK3ZD1PkBQgCGWVMXBEPuc7B5+4eLrOsV2xGLU
         XLAKMqvVY2p3hN4lynZPkE/+sgQTmQ/fCrAhOg1VEo44NA0hP7ALu1N/Be5fqbLZ/VWt
         pzzhlU4CzDzpsNYLpp3Xo3M+onTONTczfWAd1Hgaro4ernb2wF/1szePuJDPBbzeQzmh
         YKW0UA65C6unC5T6c3So4JJY+hPGlAiKsALEulrNNhevlNJRQQIZ74nj0tBqbCHW5ZLq
         4phGqzGCSikn63FeUBKb39OHQfBJaQnty9XUcZ/tt6zomP1ClX94Fqv5or9DcNCd8qXy
         g0yg==
X-Gm-Message-State: AFqh2kosOFKMtVnM+Z7yfUe1He6on47jwVN0ocIJuuKQy3PuCePeNrDg
	d8HlWA2EMi5JFiYq0zhOxti0Dg==
X-Google-Smtp-Source: AMrXdXsT4YCuaRmd2Qwsk7Y+iEuMALRbwhOUriEVVCZqG2Xv5xsrjQVC9pGKzTU7opANpTCnxxgG9g==
X-Received: by 2002:a17:907:c28f:b0:83f:5f77:8ff9 with SMTP id tk15-20020a170907c28f00b0083f5f778ff9mr65134074ejc.12.1673519320459;
        Thu, 12 Jan 2023 02:28:40 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id p14-20020a170906784e00b00849c1e5c00esm7276648ejm.72.2023.01.12.02.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 02:28:40 -0800 (PST)
Date: Thu, 12 Jan 2023 11:28:39 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>,
	Eric Lin <eric.lin@sifive.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 03/11] RISC-V: KVM: Return correct code for hsm stop
 function
Message-ID: <20230112102839.rsabb2bah5lkkx4e@orel>
References: <20221215170046.2010255-1-atishp@rivosinc.com>
 <20221215170046.2010255-4-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221215170046.2010255-4-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_022843_689762_DA5751CC 
X-CRM114-Status: GOOD (  18.54  )
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

On Thu, Dec 15, 2022 at 09:00:38AM -0800, Atish Patra wrote:
> According to the SBI specification, the stop function can only
> return error code SBI_ERR_FAILED. However, currently it returns
> -EINVAL which will be mapped SBI_ERR_INVALID_PARAM.

I presume the mapping referred to here is kvm_linux_err_map_sbi().
If so, then -EPERM isn't correct either. That maps to SBI_ERR_DENIED.
The only thing that will ensure we get SBI_ERR_FAILURE (-1) is
anything not handled by the kvm_linux_err_map_sbi switch, as we
need to use the default.

Thanks,
drew

> 
> Return the appropriate linux error code.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/kvm/vcpu_sbi_hsm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kvm/vcpu_sbi_hsm.c b/arch/riscv/kvm/vcpu_sbi_hsm.c
> index 2e915ca..0f8d9fe 100644
> --- a/arch/riscv/kvm/vcpu_sbi_hsm.c
> +++ b/arch/riscv/kvm/vcpu_sbi_hsm.c
> @@ -42,7 +42,7 @@ static int kvm_sbi_hsm_vcpu_start(struct kvm_vcpu *vcpu)
>  static int kvm_sbi_hsm_vcpu_stop(struct kvm_vcpu *vcpu)
>  {
>  	if (vcpu->arch.power_off)
> -		return -EINVAL;
> +		return -EPERM;
>  
>  	kvm_riscv_vcpu_power_off(vcpu);
>  
> -- 
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
