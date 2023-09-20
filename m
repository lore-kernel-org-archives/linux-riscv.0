Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C753CE79AD
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 05:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lYwKvHLwkd7XYEFpRJefQb80kR49EgTlplIePgEabZs=; b=CbtpR6MZsZbH+Z
	k4/Cp8pcQFsA9iKXQiPfKcE2f5y6EzG2gsSuTH2lKdXOoEWBn98SG8IAFDhjq2550aKayGlBCV4ja
	L/wmoH+q8BMknKteWcYr3UNaE2uPPeBvmkeu6Sg+YBkw6IejPB48rf9hl+dw6DsgaFfScI33coTPQ
	qftw9ezjt0giawHPvMwKbO9s45HSTVmXGW8Skpw4NkPxaorKKZ6oDGGBz+DsJCVlmpzeB4+JgLnuF
	sCgYX/R6QIdnQAHOG47l/j8UZ+xhVJRJZkbYUqI2w/mrlWYgEVfZYsfGzCrnJ10Y5YIGpac6ObMZL
	WjUPTGmuelLrL6dZBQWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qipOS-001sw8-2e;
	Wed, 20 Sep 2023 05:04:56 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qipOP-001suV-08
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 05:04:54 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-32003aae100so297746f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 19 Sep 2023 22:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695186290; x=1695791090; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AEB/+sTWkenU048pGBgzJ6Jvl2oPst1aTirG4EAC08Q=;
        b=CEMIRMukJR42g7uggRMcmZdAZm22sQ2r/1PN1C8YKsDaGRmn9mzVPDMKbafmy51mH8
         e3sTUGVRxtsHptTPhtAHUXN24GVoCaC2srNgXPLvT9dnXAKUE5WHWsGZpMLCr7R10uTN
         q/meZmr/0ISxhCdjlHiX89IJphqo1oGvvKL5tI8k5oHTMhE7LE55opDSa3J8r5w4e4ku
         lMRzhSmj37u7/SqG90TjKhEe022bauoIb/BzxvzogO8obC+D7YihEzXvml3rvLij78Yf
         OMeBSp8OwtCg0m3MLUtDasK0EVSGuLYvkOAsjATACEmId2S9NxqwZEtC0Kk3fPvO2JHg
         CoAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695186290; x=1695791090;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AEB/+sTWkenU048pGBgzJ6Jvl2oPst1aTirG4EAC08Q=;
        b=D9HJrOwQ3vccWciVo/NGGUgX0aYwtEzTuLv4rhrJogruRDApsm/N/CC4Tea1thgNnc
         B4pzRc34a7ZHOdsuxBLcdkGa4HsABJyUjOWM3/reQoQonPOkfYknhiqVszg7+lpSFaO5
         bsTJAr019P00RipYqRGRyqjkuz8sbwi22YQPySxmwMgYKhtRarCfHDQpGzWtHzXV+fv2
         lfo2DaBvpoGU7nIpVOJxMoj+naYfSZbPkWiEYAUog7iZVgQ23pyM/l1x0Sk1IUciHgPa
         U4uucDZ8cq56ZYYt2cQ6RHeBj6dXs3efJto1JmIeTxhrYeiiKayF8I8+kHngnOY3frvm
         /piA==
X-Gm-Message-State: AOJu0YwoMv1i/J0kc+YItZmINZbxvbMHz2kGB5KOvKUfZPsS/S80MrAp
	us7x0KIGKmNbc+mJOYIEjeaoZg==
X-Google-Smtp-Source: AGHT+IHXyPOuAuTi8aEkKO3moX8fQpaU0lfGW1nRZkQaf15yWDuJBf3mHzKEV7pGHCYUkUS0KuWetQ==
X-Received: by 2002:adf:fad2:0:b0:31f:f8a7:a26c with SMTP id a18-20020adffad2000000b0031ff8a7a26cmr889677wrs.25.1695186290202;
        Tue, 19 Sep 2023 22:04:50 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id q30-20020adfab1e000000b003177074f830sm15881840wrc.59.2023.09.19.22.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 22:04:49 -0700 (PDT)
Date: Wed, 20 Sep 2023 07:04:48 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/4] RISC-V: KVM: Fix riscv_vcpu_get_isa_ext_single() for
 missing extensions
Message-ID: <20230920-baeb582c4f56bc5c59e23086@orel>
References: <20230918180646.1398384-1-apatel@ventanamicro.com>
 <20230918180646.1398384-3-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230918180646.1398384-3-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_220453_084264_DF7EFD39 
X-CRM114-Status: GOOD (  18.57  )
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

On Mon, Sep 18, 2023 at 11:36:44PM +0530, Anup Patel wrote:
> The riscv_vcpu_get_isa_ext_single() should fail with -ENOENT error
> when corresponding ISA extension is not available on the host.
> 
> Fixes: e98b1085be79 ("RISC-V: KVM: Factor-out ONE_REG related code to its own source file")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/kvm/vcpu_onereg.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index e7e833ced91b..b7e0e03c69b1 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -460,8 +460,11 @@ static int riscv_vcpu_get_isa_ext_single(struct kvm_vcpu *vcpu,
>  	    reg_num >= ARRAY_SIZE(kvm_isa_ext_arr))
>  		return -ENOENT;
>  
> -	*reg_val = 0;
>  	host_isa_ext = kvm_isa_ext_arr[reg_num];
> +	if (!__riscv_isa_extension_available(NULL, host_isa_ext))
> +		return -ENOENT;
> +
> +	*reg_val = 0;
>  	if (__riscv_isa_extension_available(vcpu->arch.isa, host_isa_ext))
>  		*reg_val = 1; /* Mark the given extension as available */
>  
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
