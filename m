Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7574BC4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Dec 2023 13:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=DXfwd5yrflyV0Yh+y5R1vkkkEPRGd17r6l5ra4yR8ts=; b=plTKtsNntV1WeElE0pdBTlVKBq
	BHGSp14Clde5+md6IKDfsg+R8vgnfJJFoa9u++I+jQQJ4VC6CtJUUt2HkthlWD0tu/rqqOJwHMNg+
	uei50btmTtfLcHBCs45fG9i66On5qec7XWH583McMYoxPGM8YO0+Av6653TcADno8pq/AluX2Kuqi
	malbXSlhSZcWVKZjh3WneXSgvhNgYxNQTE8TcKb8VUY4EEZTpyM0uY7UgLRcjkqVfJtka7wm5JSDi
	FtE4Ik+rwkiL4Rra8tayR4rQO6hk9i5BgS44DG1YVVQ6HQ5CTTsfhzVLoFUn7YLH2jGdAMvmT2NYI
	+uWj9wMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r93pQ-00DqoO-0t;
	Fri, 01 Dec 2023 13:45:12 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r93pM-00DqnU-1m
	for linux-riscv@lists.infradead.org;
	Fri, 01 Dec 2023 13:45:10 +0000
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C2BA444448
	for <linux-riscv@lists.infradead.org>; Fri,  1 Dec 2023 13:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1701438302;
	bh=aIjaCW3pUrXp+pTpaK834thD0tFwpmqmqseWMXTUtMQ=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=kZIxeM50LLrBLEZTrwjfW73K9olVwgY7r70P49rCTYJ3Xsw8UoSES06PsIsANpcrc
	 0Es44ZtyQWo1cfS7t5yppQf3bk4Q2lL/phWR7Nl7kgVOSfHksKwoE0h6ju6eK6A01B
	 U4Kzy/lcjX88AVF+uKxNMkUfX/qtovTQS17nn6CC5bU9Bx5vYLGMSDmqgf7Epea6Gd
	 Pdc+svBI99x7RPzIFGCIvxR7WmfyfGnhTJh24lUyHmdFszRz8s96Ap1kY6v+7Iu3+c
	 fEqxjVNB6Y4uwzSKlteXbNvoeHd20OeE/gKHE7R3was9bZMxucwqGE/1CPVO81dQPf
	 oN4kAmKwDIEQQ==
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-423e22075f4so24317801cf.0
        for <linux-riscv@lists.infradead.org>; Fri, 01 Dec 2023 05:45:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701438299; x=1702043099;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aIjaCW3pUrXp+pTpaK834thD0tFwpmqmqseWMXTUtMQ=;
        b=u1JnZ9/HY3lpFt5bxp5f8wSSE6k8fSVwxJvBVy+DyoM84gecaJiFGkDS6s35IG7KaD
         PCvsaEQMndrN8c55w9ndkmJJdfAh8A5ND6pz9E0lmSYpNIzs25Z3mDy4YwtdaKA94r4F
         n7VECvye2ULdmILSwFuJ70FM0uNT3C0k0ax3CDUCz6NPlfDlyocGUWztlQQ7kBnKnpTc
         7m8qi4n9uA4fWvRbndNTfOCbaHeenvOHazfyd62BCpanBhDD/v+SsZzAkCDovxIwTY8/
         0ALXUxw7DXOSzpVqBSjDRQIFUyyBUqmxqZC0R8UMfeLzpRoX/iBQUyZGliwioEEJNjBr
         I5Tw==
X-Gm-Message-State: AOJu0YxIeLxu9FAOZq//hPcSx/2x5xbBUyJMh2CbtcU4c7TApFrI+wqo
	qPA3zMYXWi9OeiK3TqmJRCcKODx5LvX/FjlOf+/Sz1uWGF/NrwmTCWAwZ5tmd8IxG/bNbXFlVvp
	Stn0o1qaiPpbM5W6Wnywyw+EhDrlP6jBWW73KqQIw3XuS24hTbO6pUhJLooQhOKiDL/eIQg==
X-Received: by 2002:ac8:40c1:0:b0:423:a89d:df9c with SMTP id f1-20020ac840c1000000b00423a89ddf9cmr18752002qtm.60.1701438299403;
        Fri, 01 Dec 2023 05:44:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEHu8/CBHAQYpaT2ANfVt7np+IE7Kk+pb17J4F9RrGzYnoZjQle0hRYNK96EYSsKkM1msPRiaodJCBtMDr0rLA=
X-Received: by 2002:ac8:40c1:0:b0:423:a89d:df9c with SMTP id
 f1-20020ac840c1000000b00423a89ddf9cmr18751983qtm.60.1701438299151; Fri, 01
 Dec 2023 05:44:59 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 1 Dec 2023 14:44:58 +0100
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231130-bobbing-valid-b97f26fe8edc@spud>
References: <20231130-bobbing-valid-b97f26fe8edc@spud>
Mime-Version: 1.0
Date: Fri, 1 Dec 2023 14:44:58 +0100
Message-ID: <CAJM55Z9=smqcZ=su1oNdk1YZL_XdYAKrwtrZS7ScS=cAVmxZOA@mail.gmail.com>
Subject: Re: [PATCH v1] riscv: dts: starfive: move timebase-frequency to .dtsi
To: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Walker Chen <walker.chen@starfivetech.com>, JeeHeng Sia <jeeheng.sia@starfivetech.com>, 
	Leyfoon Tan <leyfoon.tan@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_054508_989598_8B22AC4A 
X-CRM114-Status: GOOD (  20.09  )
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

Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Properties fixed by the SoC should be defined in the $soc.dtsi, and the
> timebase-frequency is not sourced directly from an off-chip oscillator.

Yes, according to the JH7100 docs[1] the mtime register is sourced from the
osc_sys external oscillator through u74rtc_toggle. However I haven't yet found
a place in the docs that describe where that clock is divided by 4 to get
6.25MHz from the 25MHz.

I expect the JH7110 mtime is set up in a similar way, but haven't yet dug into
the available documentation.

[1]: https://github.com/starfive-tech/JH7100_Docs/blob/main/vic_u7_manual_with_creativecommons.pdf

/Emil

>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> I actually have no idea whether this is true or not, I asked on the
> jh8100 series but only got an answer for that SoC and not the existing
> ones. I'm hoping that a patch envokes more of a reaction!
>
> CC: Emil Renner Berthing <kernel@esmil.dk>
> CC: Conor Dooley <conor@kernel.org>
> CC: Rob Herring <robh+dt@kernel.org>
> CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> CC: Paul Walmsley <paul.walmsley@sifive.com>
> CC: Palmer Dabbelt <palmer@dabbelt.com>
> CC: linux-riscv@lists.infradead.org
> CC: devicetree@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> CC: Walker Chen <walker.chen@starfivetech.com>
> CC: JeeHeng Sia <jeeheng.sia@starfivetech.com>
> CC: Leyfoon Tan <leyfoon.tan@starfivetech.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7100-common.dtsi               | 4 ----
>  arch/riscv/boot/dts/starfive/jh7100.dtsi                      | 1 +
>  .../riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi | 4 ----
>  arch/riscv/boot/dts/starfive/jh7110.dtsi                      | 1 +
>  4 files changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> index b93ce351a90f..214f27083d7b 100644
> --- a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> @@ -19,10 +19,6 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>
> -	cpus {
> -		timebase-frequency = <6250000>;
> -	};
> -
>  	memory@80000000 {
>  		device_type = "memory";
>  		reg = <0x0 0x80000000 0x2 0x0>;
> diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
> index e68cafe7545f..c50b32424721 100644
> --- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
> @@ -16,6 +16,7 @@ / {
>  	cpus {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
> +		timebase-frequency = <6250000>;
>
>  		U74_0: cpu@0 {
>  			compatible = "sifive,u74-mc", "riscv";
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index b89e9791efa7..7873c7ffde4d 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -26,10 +26,6 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>
> -	cpus {
> -		timebase-frequency = <4000000>;
> -	};
> -
>  	memory@40000000 {
>  		device_type = "memory";
>  		reg = <0x0 0x40000000 0x1 0x0>;
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index 45213cdf50dc..ee7d4bb1f537 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -18,6 +18,7 @@ / {
>  	cpus {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
> +		timebase-frequency = <4000000>;
>
>  		S7_0: cpu@0 {
>  			compatible = "sifive,s7", "riscv";
> --
> 2.39.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
