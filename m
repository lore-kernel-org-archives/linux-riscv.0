Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 443D2CE7A94
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 14:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QbfqJCYW5XnE/M7o9isZ2uhDMLFu6YZYpOhB4cqGBAU=; b=k2nGE2rErKzTbx
	HIvuril+1+0846/9IjgF8usfKOBGK2ppyd2gFOOSp2QyxLf1sumHw+kdtgkz9e1QxP70uywpRX/dl
	vOpsYeYCul38paVRHXYaS3BrOtne5z5cwv7Jd0VTuFgy4S9mvXL3RjH34sYpNiO5hRykFgVa8ogiB
	PENQ5js9GwPorM1zgTMbUGEE4vcJNNycp8HN2/hBEzFI2dvZFAQF8FBARCwMjiAI4GvOm0jU6NGbG
	175xlQI5gZ4Q7lKOvgteCEeTJC/P+cm7bWEvEX2znGDECz/0TDHhN/HWkmBT4ZjLgCINEDDJGjWRc
	xsn2Lw15hJyEvioU/BrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkmJQ-00EPX2-1M;
	Mon, 25 Sep 2023 14:11:48 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkmJO-00EPVZ-1P
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 14:11:47 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-50307759b65so10685768e87.0
        for <linux-riscv@lists.infradead.org>; Mon, 25 Sep 2023 07:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695651102; x=1696255902; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lBOvC0K9KP7qMsTGJs/XlB/BY83dr7+2ydlkGk5mVEI=;
        b=aCHbaLR2AhkMWieQ2tpwQdiIUdJod9C6phiHhnEK83DLk3BUDw8gOTCaW5jPdsuHn4
         98PI7OaaZPvxPnDBgQwmdUFyaKecT5JB03konOPG3dCN7GpTCHmwGjjHj1AdzxKKy2We
         wNu/6i71OxBjyobhcahX+iWJImMVkop1RdtYPVVlvF5tgQCHw+zHqN0iNeWcPy4IWYSP
         4OIiiWV6zVzfFvpFvv+jCgLAvtURWQ9eTf1wsNpmWsLYqhUOwvdj21zbHrxQCNEbTMF8
         UX2g+JkZei1FIw5a4lKPNcfv9ZIHrOrrbpNXe6icvJQQLLJpHv+qs0+3/3bAYQKkPynv
         INaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695651102; x=1696255902;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lBOvC0K9KP7qMsTGJs/XlB/BY83dr7+2ydlkGk5mVEI=;
        b=XBpUza0FINLtmqrbjIMr/XdVFxsnihTviQv15uUqU+kG1HkEdMv/DCPcofHi7dOQ4u
         1h9i0brNgmbFDl4y2onTDUdUaYIA2RkRfBLBsOor52Lis6xwXav39CVCTzyKUP3RBiRn
         EZ97BhVqnmyFakM4JwTNB2d0pDP+KJ6n46sGGxlV4U10yNEgltR1CYQtnl4np5g9OSm5
         KbH8f43L5E/eM9IDKB9YRnl7yoioAS5Ur6L5KT/ssRXBpx6GWE6TH2h+NKwYjJcdqbAG
         Gg8BztwpmECKO/YHRMz97yP5mzsLPhcmp/DdgzcsCO1DK6TB/wVCpcLGxcqeF1lGW6Sn
         P8/A==
X-Gm-Message-State: AOJu0YyosEq1PsFhVlAwXrNt6UauRIAfzBRE1JHXK7iqefIs27q2l4tj
	J8GWv/LAlhwI/VnN2oyVe0qV/w==
X-Google-Smtp-Source: AGHT+IH/enSkU0B+xx17RFHSrcUfQKwrTeyF3VIzAeMXRjn8t4tSgmAPSe37mpYZRA3+eXRrZXDAYg==
X-Received: by 2002:a05:6512:2089:b0:500:9d6c:913e with SMTP id t9-20020a056512208900b005009d6c913emr4888703lfr.52.1695651102197;
        Mon, 25 Sep 2023 07:11:42 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id x13-20020aa7d38d000000b0052fe12a864esm5562105edq.57.2023.09.25.07.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 07:11:41 -0700 (PDT)
Date: Mon, 25 Sep 2023 16:11:39 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Shuah Khan <shuah@kernel.org>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 1/9] dt-bindings: riscv: Add XVentanaCondOps extension
 entry
Message-ID: <20230925-e2aee59a5ea91fa14fab12ed@orel>
References: <20230925133859.1735879-1-apatel@ventanamicro.com>
 <20230925133859.1735879-2-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230925133859.1735879-2-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_071146_474174_DFAD60E8 
X-CRM114-Status: GOOD (  16.46  )
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

On Mon, Sep 25, 2023 at 07:08:51PM +0530, Anup Patel wrote:
> Add an entry for the XVentanaCondOps extension to the
> riscv,isa-extensions property.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
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
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
