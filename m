Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D66A2CE79AC
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 07:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QAdjGDQTRans9tRIGNQ68YUra0L/5jBK1Xag+W+LOwU=; b=D6/H98O1Xda4jL
	bnboaVmgC1TXwHl581auMRCS6w+p1pOmbNDr3MPFYkJerBxAYFr5hWH8YYOVpKNQYSAcmzOgmCvZI
	xwuZM+MaXuMVW+32OrOnJOMriKE5Yf2VbW/tjkNxT7lCmFNiApcMQvnLULK4IBC7StOIw/tqJax1u
	7z8r1gkcBmD3rOUqSWkAaL2mvHtuUdxtg/3fmCKzbeb2XZ8t29hgdcY0Ol0Bd9Dr+fpDaxiHIbnFW
	VwTBbjB67vypr2l67m/NPZvovj5x8UTTRTMdihLWwRxyetfpCUSlQ3lW+FuuHsVfX+7qHpzAMWPzy
	yOWfCROacXDWs6pZajaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qirmq-0029WZ-0q;
	Wed, 20 Sep 2023 07:38:16 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qirmn-0029Ul-1I
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 07:38:14 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-403012f276dso70084725e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 00:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695195490; x=1695800290; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zz3/ecOKh4XgsJl46wvd3sKyjYtoix9I3w8gro1wfuw=;
        b=DcedHQxn4+CX4g3+5/i7GJoVzLkRoPoJoi7fbR8ysSOVJObpJopKNVM5V8v6mDm0xE
         5Ybj6xPU+K1oRVbK61Wz9p+f32TrB+TQBFCFIvrdqDhtYp7wzkCQcwjLYlP2ffIHVY8R
         a+UmRS60n3OKNmdNRE/iXrtRb1JbOw2s5CwhvfHfJmz3tq+SMvQCkBFLMeQpzI0p1D7h
         6GqhrMASipDk/gB+cz+VymlNQWLzqRf79ecDvGbZdEkB6zqKQmPCyTABRf3eMM9ZGtHs
         EGJ7LRtDAUcnYJDxSw91lZ3ONiJ/KdcT+G71YsbuJOdHyvMzqEBb2ubIF3A8VhYuQ6Dv
         edSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695195490; x=1695800290;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zz3/ecOKh4XgsJl46wvd3sKyjYtoix9I3w8gro1wfuw=;
        b=Td6B3xt7jbjXzkl28zaXrgZRHvzoJ8LdYZFmmMPPEOnL6r6Lj2Ha27hRXjmnVaMGNf
         fuuVrI1gsSLMcTugVzcCPdkIDBmWsMR6AKivULDcPG9MpqQU7p2wLt5rFnnP4SCc7/1I
         lhgn2tVD/GHvvY4XuG/cs+SF73Hquyz0AQjG2CWHKPiE2aXh/NDEKjQ08VP01cx24X9p
         h02+iJjFlxHgvIIoNfQDXbv9YDv8MDNi75mn5BfyuZenb5hvuRzX6NQN70npjE41G4TK
         W7HBoM88hd6KMRk/c55JVqnQMsOzSNhA5ueAKDy0x4HcFZDuK89yB6dmdSb5sJsK7QM0
         Vv/Q==
X-Gm-Message-State: AOJu0Yxr3qFwdOvTfj7BpuP04x2u02xlIo9/vUFBaVQf1z6CICh8NWcN
	xkQv/9VmLQGAxtC4LzVJHmdkEQ==
X-Google-Smtp-Source: AGHT+IHTqEA03iyluOTE5KNwlZAgRLI+hQhb/1jCFIbu1+TPY1ZpietUNW+El8NpgjOI/gBNn23OCQ==
X-Received: by 2002:a05:600c:2909:b0:401:2ee0:754a with SMTP id i9-20020a05600c290900b004012ee0754amr1614112wmd.13.1695195489693;
        Wed, 20 Sep 2023 00:38:09 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id o5-20020a05600c510500b004052093a8f6sm1176515wms.25.2023.09.20.00.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 00:38:09 -0700 (PDT)
Date: Wed, 20 Sep 2023 09:38:03 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Shuah Khan <shuah@kernel.org>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/7] RISC-V: Detect XVentanaCondOps from ISA string
Message-ID: <20230920-ab82cd5fbac7606ba747afa4@orel>
References: <20230919035343.1399389-1-apatel@ventanamicro.com>
 <20230919035343.1399389-2-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230919035343.1399389-2-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_003813_444338_1CAA2C9D 
X-CRM114-Status: GOOD (  17.73  )
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

On Tue, Sep 19, 2023 at 09:23:37AM +0530, Anup Patel wrote:
> The Veyron-V1 CPU supports custom conditional arithmetic and
> conditional-select/move operations referred to as XVentanaCondOps
> extension. In fact, QEMU RISC-V also has support for emulating
> XVentanaCondOps extension.
> 
> Let us detect XVentanaCondOps extension from ISA string available
> through DT or ACPI.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 7 +++++++
>  arch/riscv/include/asm/hwcap.h                          | 1 +
>  arch/riscv/kernel/cpufeature.c                          | 1 +
>  3 files changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> index 36ff6749fbba..cad8ef68eca7 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -171,6 +171,13 @@ properties:
>              memory types as ratified in the 20191213 version of the privileged
>              ISA specification.
>  
> +        - const: xventanacondops
> +          description: |
> +            The Ventana specific XVentanaCondOps extension for conditional
> +            arithmetic and conditional-select/move operations defined by the
> +            Ventana custom extensions specification v1.0.1 (or higher) at
> +            https://github.com/ventanamicro/ventana-custom-extensions/releases.
> +
>          - const: zba
>            description: |
>              The standard Zba bit-manipulation extension for address generation
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 0f520f7d058a..b7efe9e2fa89 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -59,6 +59,7 @@
>  #define RISCV_ISA_EXT_ZIFENCEI		41
>  #define RISCV_ISA_EXT_ZIHPM		42
>  #define RISCV_ISA_EXT_SMSTATEEN		43
> +#define RISCV_ISA_EXT_XVENTANACONDOPS	44
>  
>  #define RISCV_ISA_EXT_MAX		64
>  
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 3755a8c2a9de..3a31d34fe709 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -182,6 +182,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
>  	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
>  	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> +	__RISCV_ISA_EXT_DATA(xventanacondops, RISCV_ISA_EXT_XVENTANACONDOPS),
>  };
>  
>  const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
> -- 
> 2.34.1
>

Besides Conor's comment about splitting the patch,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
