Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 661FCCE79AC
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 08:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hQx8GegZ/Ygj55J0MMEFUeNuVjR3Pbinhd8NSfdNCcc=; b=MfQMew/luylkb8
	G+MsaRu6kObAnYx16Be1LXpIsgJIU9Xqlsph8wr7Bdpx7W/EzG2KynthqnjnnTYzSfi6y8xAzq2mT
	lGgE8agk6cA+7ckBUbTqVggBRq7hwqru3zEMo1gEgo3k0A88aco0PhKwM7gDCKVqNSKn6OwT+kKlx
	F5TsSb9baLJ+Fc1ADJu4a0VKVgkmWqMv7BDmcpMYzM2oZP6jML9VpDc+v5cHTAV1A7t3ANzl2cDlU
	RRyd+t7MaIsaY9UDK2IvAnbx0EY2liTb8VvNlZs64YIGxjg2Kx/+/c8u4ftg4u9Z/kI5GY99hf5/M
	kvcQXZcj9rxHm0qTtZhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qisQD-002Fzm-05;
	Wed, 20 Sep 2023 08:18:57 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qisQ8-002FyC-2I
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 08:18:54 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4050bd2e33aso31550845e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 01:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695197931; x=1695802731; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LqBFN5FLB49lnK/5qmtGVnKUxCOh5CXzqPeEzI92Gus=;
        b=mLvNHWHAy0CpfssWcgXIQ0yS3wBuJiJsLxt+g7dCErgIKFgckLNxc9VgnHY6cK4u0C
         g+8PWGdbm4vcwIvu9Td9U94XhsJDVOwPwYo93X01ZZ3rAmhjY2tD9tEaOLb3m1zeCdUK
         vXHtcWwPJY060s7SN5yByNFiQvXeX/sIWOJmb2Q5lPsnTIaoAYY6nQItXBrToRdSxVOY
         ju4gU0DkCRs3q40qLTSt8F2qih1S8gzeQeajPEWzaLZnzDtBV2+R2R0I65Tvbdrhl5sl
         iHN0utzGyIHQ6CKWwdKUGNIzY9auE8rsxkKx9G8yXQCQKJjOZ/hVNLCPGieQrJ4IVoQx
         4s+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695197931; x=1695802731;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LqBFN5FLB49lnK/5qmtGVnKUxCOh5CXzqPeEzI92Gus=;
        b=TGfsJJexISjpTq+3twv+gYsjyp8ZHFvAK3H8yMprcS8C24RL6Wrsk9oWWhQhM56apL
         +PbIHGNF6qJFbGfspkszKjuTVgorb39QNxe870H0Xr/NVS12eSbhKhxpxfK05Yszyast
         UPygKQD4g9YqUTVLPyvs4NHilCPWjNJ6zwO+/0G3i12vBpjw6XDy1eTBO/P15w8wv6R6
         +ErEcsPTMpdK+gQygTzn0Pi1/Gcl4KRDatoOr5QXOEBJw/30B+z936Vuy0OF9BDO1mYy
         aanqOazffmAsxGHI2IFv/hZ5LbwSaXb6NBB9a5JWSCYrs9k+pv7yPkReQDU5WuNo77t6
         3m9g==
X-Gm-Message-State: AOJu0YyzTNVtv8KUDqjNajkFO6E2/mok2wq9DoerS4Ug2wXg+qU9w3o6
	70OQZyopel/V+/phiumNhgGicg==
X-Google-Smtp-Source: AGHT+IEL6XDWeA1RRkJT2O9NGVoH7Skvq4BGuzq8l9Y1wg1d+Qpftyi3lW7iMmOUd4m4gogg1F9R8g==
X-Received: by 2002:a05:600c:ace:b0:401:b53e:6c40 with SMTP id c14-20020a05600c0ace00b00401b53e6c40mr1791966wmr.10.1695197930897;
        Wed, 20 Sep 2023 01:18:50 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id c26-20020a05600c0ada00b00400268671c6sm1250996wmr.13.2023.09.20.01.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 01:18:50 -0700 (PDT)
Date: Wed, 20 Sep 2023 10:18:49 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Shuah Khan <shuah@kernel.org>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 7/7] KVM: riscv: selftests: Add condops extensions to
 get-reg-list test
Message-ID: <20230920-d30b398a99804418792264c3@orel>
References: <20230919035343.1399389-1-apatel@ventanamicro.com>
 <20230919035343.1399389-8-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230919035343.1399389-8-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_011852_753028_925517F5 
X-CRM114-Status: GOOD (  17.16  )
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

On Tue, Sep 19, 2023 at 09:23:43AM +0530, Anup Patel wrote:
> We have a new conditional operations related ISA extensions so let us add
> these extensions to get-reg-list test.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  tools/testing/selftests/kvm/riscv/get-reg-list.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> index 9f464c7996c6..4ad4bf87fa78 100644
> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> @@ -50,6 +50,8 @@ bool filter_reg(__u64 reg)
>  	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIFENCEI:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIHPM:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SMSTATEEN:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_XVENTANACONDOPS:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICOND:
>  		return true;
>  	/* AIA registers are always available when Ssaia can't be disabled */
>  	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(siselect):
> @@ -360,6 +362,8 @@ static const char *isa_ext_id_to_str(__u64 id)
>  		"KVM_RISCV_ISA_EXT_ZIFENCEI",
>  		"KVM_RISCV_ISA_EXT_ZIHPM",
>  		"KVM_RISCV_ISA_EXT_SMSTATEEN",
> +		"KVM_RISCV_ISA_EXT_XVENTANACONDOPS",
> +		"KVM_RISCV_ISA_EXT_ZICOND",
>  	};
>  
>  	if (reg_off >= ARRAY_SIZE(kvm_isa_ext_reg_name)) {
> -- 
> 2.34.1
>

Don't we want to add test configs for these?

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
