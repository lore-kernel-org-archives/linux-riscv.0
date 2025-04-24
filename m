Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A315C369D1
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 11:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o+qa1ypGYF8coeX7iOA9SLxgA53u6gseq7BhejH5GYk=; b=BDn1k0F8KTDx5U
	Nzj6b8+PqOJRycaDJ3EKTtrqqzDfaGsHWYaT7gpHap8wkmMrSX4zDhiycs0Yt9Udc19uFcxPFHSVb
	+Cz5klyri4wNrOvlFmcNE0iMeiVneKWuaXNoY2uQA3VC4fR/WWFnnIUpSFJ6SaVOKvaYC6fyorLJI
	lz41D9U+2ldwpwtaDZKv5sNHgtCuq0zWbq5gZMUReSVAuuaK8dLRJF4aNksxmppvlDt4yjqX0GLEo
	XBZi9+g+FNWdD6wSoDmyPc6a/AtyNXq355oRXxl0OjmHrcgbNm5FgePnWo+bmTc7XG7GjRSbWnDJK
	1I4b6JbJwU3aDuELXrpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7utL-0000000DspA-09LW;
	Thu, 24 Apr 2025 11:37:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7sDQ-0000000DOUQ-2tJc
	for linux-riscv@bombadil.infradead.org;
	Thu, 24 Apr 2025 08:45:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=cpfniZwlegMvSvblIXZcmgKGzHhGwzkwQ2fo2qopaps=; b=W1JW6vZrOR4Fd6ph8DU+WzBbW8
	LDHQ+2yLPKEH7RGxCJfYsHpJdR5lOo7hRyewfVLwO7pPaupASo7GzDbZTLm1hRv5lNuOezzbDzQSS
	Vv2+2Xc7K151Y/p+kJJl/E83VHoNRdermLs4+Xs4XIxRv3Cn8UQF2tufLBDLdC3Wd/gmjAbQRcc3Y
	C/T1alemQhUByRmN8S+SBr3lfZm00uJhjk2hIsBvUz88U8r5vovFZrzVmEsgqi+MfAB+E5EXA8Jpy
	aWz1vOrnBckewJo++mHzgYYi+IRkQ/Co0cTOSlrfGuIJsrad/zZPqBHzquVnRa2Xpga2UuZtVDKJt
	KcEcEQZw==;
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7sDN-0000000BdeD-3ehT
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 08:45:51 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-39c0dfba946so498786f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 01:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745484348; x=1746089148; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cpfniZwlegMvSvblIXZcmgKGzHhGwzkwQ2fo2qopaps=;
        b=U7Ne/QCoFOvPfubDudMSCmpgzRj6s/6OcA9HiY23T/Bu0FEflE1muwkNe6oNV/2QRu
         Fc3R7K7e93b0Nl6BLHwfNzCUKp+lrpNbAw1QdMKjLVZIri6wIqxKg+npLjUy9c/+6+5T
         5dCptEoEf0WnVdbEch5wcCWaSfDhdMVmgh9koBNiG8psIOyfwzm+8buDJ6XwbIxsqk6N
         Moq9HAm4ywqjr7XQlF95qMb64fYpBfVSwDaagfH6MyV6/AIJfdafBQlF8AZVFuEI1IXy
         3Nh6DZZTT1mcczMYlCLBsZ7W35sNA28N6xQ5Qxcf//YvVNOb7jB5zKb8OCeTXuv2FxpZ
         nN/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745484348; x=1746089148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cpfniZwlegMvSvblIXZcmgKGzHhGwzkwQ2fo2qopaps=;
        b=v56NReeUGI3hxplfPfSqSugu+qgamYaJg6zih87o5cvG06fN1fhIjCPUjAYEMKVObL
         eMh9jYAuok6NEvqC+c+lOfw9kfxwIfRwfrtW2EMiOguJKb3KLEBhfP17hv/CE/WPBHi0
         58NGpscU4I1vCs3NUIcQflQCw8zgTGyqzN5Fojyb4kMyeN5LdmnS+6N6wDSVjOoTrYya
         8MarP/niYsfjCQ/I0wVgOXgSfx/TOnG41UJeGwN24aoS6Wf0cd5xn0ss5ID5IRdIPzRx
         GEPqzybxao6VpcaVteqIQYzO21UbwylzyrE3gMngAcBoxHH/2JAfZhL56LvmR/t4wk7D
         G3lg==
X-Forwarded-Encrypted: i=1; AJvYcCUy66Bg76rn4EHxj6wQ/Hrx5ftXPUUx6SehQSsqQc7CNkMDxTdhvmdmygYmNQQLhnyZemaejZq7eHHgSQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4+cQW57tPOqgoeF8Mr6Tx9dgjparJzLW7MohBvDnEwrgvy9co
	uEaoFo/aLOjM3GPnl9z1ySRK7/HhOUvUor/BAvquvQtr44k55K5s2Qg3ODkwXFM=
X-Gm-Gg: ASbGnctAqmJPoI4/M9ifMqBMSay0I3guFwBXKTZCUrGrXTyJBnHouGB8rRYhmpFT/mj
	IcO67itEG3JBMbhPFqBtHMkFAAKaiktxfl+wIqxQXTe/Y7A/IZKAdbelsJogH5NmBYr/56zVfyE
	u3pJJmcG5P9CHb86OZlRFY5zVfjMSIXW6fZQW3BRYRw9ebnNaONnPxtEdNey/gx5u0fvix+f6Wb
	geFxvUmJ/r+KsKNwLIUf7yORZDpN05JfOTbop1oKX7kL6OcupNfRyn9tQvPwYuvRbBjEqY5mtDh
	QrxcCHeeZbJEUA0bZsHDMYgVjOnE
X-Google-Smtp-Source: AGHT+IHa85PG4qEjs29oVTV0lIFZzwktXz39JAxGkANuBNfdNGLagzd4Kpk6GR7N5o12prPoNooS8w==
X-Received: by 2002:a5d:47ab:0:b0:39c:1257:c96f with SMTP id ffacd0b85a97d-3a06cfab9bdmr1392834f8f.59.1745484347709;
        Thu, 24 Apr 2025 01:45:47 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a80bbsm1362860f8f.11.2025.04.24.01.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:45:47 -0700 (PDT)
Date: Thu, 24 Apr 2025 10:45:46 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
Subject: Re: [PATCH 2/3] riscv: Strengthen duplicate and inconsistent
 definition of RV_X()
Message-ID: <20250424-f322adab22126ae97dd7c5b4@orel>
References: <20250422082545.450453-1-alexghiti@rivosinc.com>
 <20250422082545.450453-3-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250422082545.450453-3-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_094550_008840_0C22EE48 
X-CRM114-Status: GOOD (  13.25  )
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

On Tue, Apr 22, 2025 at 10:25:44AM +0200, Alexandre Ghiti wrote:
> RV_X() macro is defined in two different ways which is error prone.
> 
> So harmonize its first definition and add another macro RV_X_mask() for
> the second one.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/include/asm/insn.h        | 39 ++++++++++++++--------------
>  arch/riscv/kernel/elf_kexec.c        |  1 -
>  arch/riscv/kernel/traps_misaligned.c |  1 -
>  arch/riscv/kvm/vcpu_insn.c           |  1 -
>  4 files changed, 20 insertions(+), 22 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
> index 2a589a58b291..4063ca35be9b 100644
> --- a/arch/riscv/include/asm/insn.h
> +++ b/arch/riscv/include/asm/insn.h
> @@ -288,43 +288,44 @@ static __always_inline bool riscv_insn_is_c_jalr(u32 code)
>  
>  #define RV_IMM_SIGN(x) (-(((x) >> 31) & 1))
>  #define RVC_IMM_SIGN(x) (-(((x) >> 12) & 1))
> -#define RV_X(X, s, mask)  (((X) >> (s)) & (mask))
> -#define RVC_X(X, s, mask) RV_X(X, s, mask)
> +#define RV_X(X, s, n) (((X) >> (s)) & ((1 << (n)) - 1))

Assuming n is arbitrary then we should be using BIT_ULL.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
