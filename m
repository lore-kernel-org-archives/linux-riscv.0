Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F11CE7A81
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 14:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/KHnMyk48QCM3dHwnp/Fz0JAtIEE+GP9sI9uZtrcJ1c=; b=F1pxNMtaVTEYFw
	b/v6e+Upfuts99JybHD7RdBlbrcgXqetZ6TnGunilbwi1y5/G0WlTg/W0C1PucggkeaaIMCRt3IId
	ogkd+kS1SPkJzZ1dL50bVPPmPSAMve2yyJa6T04d567AuEFwFDAgB0vvTWz0FgN4PLoQ6J4VzfJTK
	BARuxWzwjnNSk7ai5hxlRc+V8AI8+5EVmH4sFtr+jSxoj65UCGEE0LW1C7FiwqM30khoQGm9KQnUI
	M182qk9InDCVea2JHncji6F7Ia4P0IPUBNoH0gDNarB0ef3/QImE4t8Ye6g2HFfMxZZxIpYACQX/7
	/rp10H+u1Z33R2qJe13g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkmJt-00EPbG-2Q;
	Mon, 25 Sep 2023 14:12:17 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkmJr-00EPZW-05
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 14:12:16 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9ae7383b7ecso1183812666b.0
        for <linux-riscv@lists.infradead.org>; Mon, 25 Sep 2023 07:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695651131; x=1696255931; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p/rofqFh8NF2bW6Oc7Qv5lPSnTwmY73T4eLOI12vOJ8=;
        b=cfN+5SR+8Po689jbh2K6K6dUDW1UX6xkwlIiIHeit6IuMexvQtsuhs5sTgHJ2Ldu32
         jItTFVOM3nDWUAmG2/w1bP/PVLz9Fq4EtmE89VpfvdZcTk79C21V7kfN4ktuVfNGyFre
         g01/GSDVhE3lJuXrhjP9LHVMgdcyimTm06dGM7a+gtVvF/KXS1Tcfk5aVsYdUgeDtSk7
         2q5C0j1n/YRYZJ/Z14By6L0UxVtMg8Rx0mu+a3dxaCr6lkX9RY4Cu6wpkX0RYmos2gYg
         DNU3ewTxA39EXJEt1GZMubuseZOk/erBdH6gu+i0+zvJhEBJFKQPUzigJYx4EL//toIx
         mHCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695651131; x=1696255931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/rofqFh8NF2bW6Oc7Qv5lPSnTwmY73T4eLOI12vOJ8=;
        b=Ri3vdm3fZYD1UXPdE0tN40PqFyaHJiWnpAtkl6WiUPomQ5b3+YQkhTP1ZvdShXZrOT
         kT3SeAAU1V7p87JZHlp6suZpuIDWv5L5Fed2QwA3Ou+1pqoyDDqYrGpK4Li5j7iIni7p
         acyFyufJljpcMZwNyv5FojP9gidKN9qiNx288l0GBMtGmYgi+TIN/qAzj/wZ8OzON+BO
         e8cN6VUmD6B9K1vSG8oqGqjgm4aQYJqrOwjWWPCRmlsJc4Uj7cKggHZBonf/ATMy+dto
         o3QK8BB2hum013+Vfhq5y9fm+ql4njiQP9DqIU0jBGbtF46P3IoDVcFpt+8BuHg71+Mt
         A5oA==
X-Gm-Message-State: AOJu0YzNp4fHiHw83+vsTDdKrcYuyKD0LxZJZhM7ejlUdYPbBbSWXdJ6
	xx2Hjr36QMYUNLeYKlSSJ+3OSw==
X-Google-Smtp-Source: AGHT+IFc1y5XpN3d0KtV5nTRC/Wd4d8VRWVBVtMw1jlx1Qoo6mIZn+OlkXm+iBDkHp3bx2ipX7q9qQ==
X-Received: by 2002:a17:906:768f:b0:9ae:4a8b:fe2f with SMTP id o15-20020a170906768f00b009ae4a8bfe2fmr11054575ejm.11.1695651131376;
        Mon, 25 Sep 2023 07:12:11 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id sa21-20020a170906edb500b009add084a00csm6314532ejb.36.2023.09.25.07.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 07:12:10 -0700 (PDT)
Date: Mon, 25 Sep 2023 16:12:10 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Shuah Khan <shuah@kernel.org>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 3/9] dt-bindings: riscv: Add Zicond extension entry
Message-ID: <20230925-4a65c32623adcdf50c496005@orel>
References: <20230925133859.1735879-1-apatel@ventanamicro.com>
 <20230925133859.1735879-4-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230925133859.1735879-4-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_071215_065218_A827ED7A 
X-CRM114-Status: GOOD (  15.97  )
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

On Mon, Sep 25, 2023 at 07:08:53PM +0530, Anup Patel wrote:
> Add an entry for the Zicond extension to the riscv,isa-extensions property.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> index cad8ef68eca7..3f0b47686080 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -225,6 +225,12 @@ properties:
>              ratified in the 20191213 version of the unprivileged ISA
>              specification.
>  
> +        - const: zicond
> +          description:
> +            The standard Zicond extension for conditional arithmetic and
> +            conditional-select/move operations as ratified in commit 95cf1f9
> +            ("Add changes requested by Ved during signoff") of riscv-zicond.
> +
>          - const: zicsr
>            description: |
>              The standard Zicsr extension for control and status register
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
