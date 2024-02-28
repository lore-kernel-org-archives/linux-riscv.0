Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C717C5478C
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Feb 2024 13:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mDPx6sxd4hdUqrkGAx0g874QCChbfFMD02q9OGQb4Rk=; b=JAF7bRJYFEGatd
	UzkCqL4eofgBNbfjUKjC1btrKJeGCcT+BCRwiMk3PTamcWGKfrfodLBuCZckHZgIRcCk3RVLrUSP4
	TdTzIUc5gA551T4bvaBRYJyIyeiYVgvgYhUS/6U9jEXvdlpfaFXY7P7CZfWbYXzEslwfI3U8x97Bn
	PfKgnjQy28b1Bfwsbf/jWXnXv9097Lfz56uaL3o1OzkcZ94fNVA5FbiLTp702a1DpLhmdq/8xawJo
	+dq6O+pjYn1g2Fdb1rqNjiO8rqUAulvnsalS4vxxaD4w0WK35Xlw9/M00XMPBxLL9IUraeGqYUD7J
	V1l8EBwAQXZZqMBli4MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfJf4-00000009Opm-44pM;
	Wed, 28 Feb 2024 13:07:50 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfJf2-00000009OoZ-0Y5o
	for linux-riscv@lists.infradead.org;
	Wed, 28 Feb 2024 13:07:49 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5661b7b1f51so4029922a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 28 Feb 2024 05:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1709125665; x=1709730465; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uyEO6boa+xJ/OQch4N2V/Css5OUzCe/Ii8yKVOFLc2o=;
        b=Ng+r002zPZTIjuWmNht1xXRr+gXEaIGxyaXpDM/y82iLPJ0hbjhkdT7H2y096lHFQJ
         D6hg3IbVZ3lIeqzDtM17d4QH4ri9b+cuadtfJg2UXNrDpjJ0o6TFAJtYLTHcae1vfpfY
         9+3+hKc/OrdPFuRVTwtwQJC3mCrpcMAkk9XK0b3hx61j7Mr+P2RIw3R1A9iayYQn2+at
         8HfV4CnkyLHjpZ7s7Sx0vu2a+BLLcdpV4wtWbUSl1XldTuXbImqcxqaL0/SISWfMJJR5
         7iVXO5J+TX35kaUeDGA7M+XPYkE4RnGoij8FoVMbKb51NbJu8BblIrWsZtAyVBizc/eR
         rIBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709125665; x=1709730465;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uyEO6boa+xJ/OQch4N2V/Css5OUzCe/Ii8yKVOFLc2o=;
        b=FfzHOk2zRqdkhY53/bvwTldfK10xxcDIXOVa5Z/5o4fp5lokixBYOe7WdTJhBo1Ch1
         kMEiHfnibU6YJv4NOSr5zhk77W56Qcgkv97dFXrBVwyZIcic0Za+QRmDtyg8hL5SSxqU
         E1dPtbLnDaKjZ16fQbaE3IL6qxn7jiZ8w/MR825F/jXa4JTo/SL3+0grkixzaCvtDM3Y
         4Erx8RUmLPTPcS6CkakXSqlzAkFt504WdMhl4ncasTEL4eKDy9HPLBr6cwGiNu9LXrmW
         X4WGvmJsMT4+gQuboF75k+yeGXpvOr08x7Av03BXvPSKjM4kuc0PcCaq3aWSqLjW2hiD
         ArFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdeCgUFD0ryv9ikYy/zyucBwLf7WSfJCLJEn7vVl4lhBUWNLfpvlgg6jb91fYkfEId9/muPLPQlennGaQDjtFPLu3PwUvINWbz2CeIVxfY
X-Gm-Message-State: AOJu0Yxf5WU7elnk/KuuXdTQeyUNUfeuT5PsNngZcsIKoSD38lJp8T53
	WsDwpk0zjxHdpvM6oM4uhLqdz8lQS1/ZoX0gP84qHTX2bMDDjTltYYM6fiMBS4j3AHDruw7X0CX
	b
X-Google-Smtp-Source: AGHT+IHz6Q/4cwrnVSPpcLF88omhchUxt+jZb2vdilR4dpr1cIS/m3RQ1nQ+HOnDHiBkqjyTNNA/5Q==
X-Received: by 2002:a17:906:5651:b0:a43:164c:cb3a with SMTP id v17-20020a170906565100b00a43164ccb3amr6249584ejr.53.1709125665459;
        Wed, 28 Feb 2024 05:07:45 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id ts7-20020a170907c5c700b00a43f4722eaesm705990ejc.103.2024.02.28.05.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 05:07:45 -0800 (PST)
Date: Wed, 28 Feb 2024 14:07:44 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 3/5] KVM: riscv: selftests: Add Ztso extension to
 get-reg-list test
Message-ID: <20240228-8e0f8611d2f45f71c04ead57@orel>
References: <20240214123757.305347-1-apatel@ventanamicro.com>
 <20240214123757.305347-4-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240214123757.305347-4-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_050748_195864_3F980453 
X-CRM114-Status: GOOD (  14.32  )
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

On Wed, Feb 14, 2024 at 06:07:55PM +0530, Anup Patel wrote:
> The KVM RISC-V allows Ztso extension for Guest/VM so let us
> add this extension to get-reg-list test.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  tools/testing/selftests/kvm/riscv/get-reg-list.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> index 9d9c50b68207..5429453561d7 100644
> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> @@ -73,6 +73,7 @@ bool filter_reg(__u64 reg)
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZKSED:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZKSH:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZKT:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZTSO:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZVBB:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZVBC:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZVFH:
> @@ -436,6 +437,7 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
>  		KVM_ISA_EXT_ARR(ZKSED),
>  		KVM_ISA_EXT_ARR(ZKSH),
>  		KVM_ISA_EXT_ARR(ZKT),
> +		KVM_ISA_EXT_ARR(ZTSO),
>  		KVM_ISA_EXT_ARR(ZVBB),
>  		KVM_ISA_EXT_ARR(ZVBC),
>  		KVM_ISA_EXT_ARR(ZVFH),
> @@ -957,6 +959,7 @@ KVM_ISA_EXT_SIMPLE_CONFIG(zkr, ZKR);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zksed, ZKSED);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zksh, ZKSH);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zkt, ZKT);
> +KVM_ISA_EXT_SIMPLE_CONFIG(ztso, ZTSO);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zvbb, ZVBB);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zvbc, ZVBC);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zvfh, ZVFH);
> @@ -1010,6 +1013,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
>  	&config_zksed,
>  	&config_zksh,
>  	&config_zkt,
> +	&config_ztso,
>  	&config_zvbb,
>  	&config_zvbc,
>  	&config_zvfh,
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
