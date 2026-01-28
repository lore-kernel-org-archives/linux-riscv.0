Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21183D25B77
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 13:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=77Hn+slGl8MjyKc1GoxNBifGDWPaLWaZp3rr7IFEUtI=; b=Y6UDIE36m6NIEc
	0jiLUS1F9oThu4FDMkSJVMR3KfUaodc1YPgRICVnErnCJdUXJ+vwECo0qVqXObPRYiKguY9HWjjJw
	+deChupmNa54QpBR4dwZX6pFKIddGupXF7pV+aQ5b1Wv9L/wDnrHyQogUeiGSOfuIMk86JLKi6I4X
	Et9Zm6qjd1tGKEdsbVEhDr2A+JIzCCSqxODXijUwVj7ilVBXw/DDscf1HI9YnTd20n3ldb467TYtI
	H8Vig+W95envHvm9ENaUs/0eT6wED3IeQL5lhYMqVeg+siZheopPxS3kPuruXRt5flmFGtl3EefVw
	MQLuizKQSmF4/pmtrdqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl5bO-0000000G49X-07u1;
	Wed, 28 Jan 2026 13:28:58 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl5bL-0000000G48N-2Twj
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 13:28:56 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-6610e72112bso2834153eaf.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Jan 2026 05:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769606935; x=1770211735; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l7l6hZpxqhowIar9wP3g3p3H24Q2QksV27F6NMf90mY=;
        b=oaxEcw4Ui1bQeUtNG2nTS/HjEeIpdESQPcBH8VfKlJDMXvU6WvQynegskVnL+d6BsW
         rMd7/xn2rWj0j80UMafBCP7yljrI8kLub4wJgxOM06rfK9fRZ7PVp0StddO2mk7BoL/v
         dM2Kvi+KQEWkdRS5CLZRg8m9aerikCBHSkEpCT2oQwMlbam/KpRhC27MTemBfcZZESlU
         BQmXw1AdfGulv/6otDVSVMN7UBSj9jgnWYRbgmC5M5J/bfGfOJgF6MWqgATmuxMd6nlt
         SX+oDukXjib9b2eggA1GAruu3dMR7zBvg+haTJr8xhNmHK8/OLKjsuPuNjRBSB+ng0cb
         1WfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769606935; x=1770211735;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l7l6hZpxqhowIar9wP3g3p3H24Q2QksV27F6NMf90mY=;
        b=u30hszlKTmDFyQcnurJRi/WFCoddlBowAxqrXRXI4HNaQ2Y/mnxMS1uFPTwq5PSq05
         DdxeTwoUxkaO8pByis7oyiukIRk2wTM6iH0OAUn9VhZImJI+0UyxpRtEgV+kn8hXTxqY
         zHg/cdY3iNZntw7kamcqGhhD4Iy7dYV9ASElMEhaSHHwg6P2av0Fs7X7SJXzJv/ARgpc
         6XKcXa9YhJNKuYTp1Hbpm4sUi+RgZ7u4WHfFmRA/GrpD35XDeMrO69iyW+gF9LoUEd59
         DIg975Db4kVUAbX2J+cLRj11ZsnDP9YV1GIuPU1luftaLmGUHXifNfV6FfmZgYexFuEc
         DVsA==
X-Forwarded-Encrypted: i=1; AJvYcCU3hCF9rA3Ku/6XtPUn2eV31AZG5U6RJoByy8pusqEhuCCAwEX5YHomppvSr0uQAtRTHVLLmOg4zpUwJQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/+unT5DfHvu9TUs4LiwfvDaCUvR7LUuU85acDu7EQ5EX67ytl
	0gRQs6u8UIm1oRbbNIv/7x7SR95KAPc5oUzGx6k8/4p1BWyv8pNCp7DUfvhw9vL39ug=
X-Gm-Gg: AZuq6aJLaxvBIDZ5/krHjqHVm9ydP1CFg2Tbou7l245WuoN2go2Yqt+zsB7wNO65djS
	p+OI1wZWD5IlMXQ1dvMCpQIuKWXvgHhx6NH8go9fcMopKOfMcZTWyocF3xPoVME/ijQJJlq+llF
	sP9jWP80wPCLbJqQRjLpz8Q7v0hbx0exIAYmkGGKJqOujxD/2KFFQTxXCx2oTghBX15yOyMS/0e
	nc8sH+b1JBVyyMxmSlMbcQfOQ/C+Usj9ylmgKJJ21TzB7/y+X1JIqWdTuRGUTkYsGCWVuX7tOJo
	UlHymJXmyOiyjyW8Jl96pIDs5xv94U7vF+0NCbD7ynhKzGxTVmAUVVBI4NAdrj/K1+EkQKwq7OZ
	58oH4FE/9iIv45vI3dQsU9l0lG3bhETJzzCOn7Qam8SwQjyKwov+Oe9fD34rZUazmFjHtKBvwB6
	Lk2PTBfPL4SRkWpMcZ/yXOoKp5326vaGrYQ8RfTMovCNf8ekQHBSs=
X-Received: by 2002:a05:6820:134f:b0:662:ecc7:7193 with SMTP id 006d021491bc7-662f20d5753mr2863092eaf.54.1769606934872;
        Wed, 28 Jan 2026 05:28:54 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-662f994388fsm1374132eaf.4.2026.01.28.05.28.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 05:28:54 -0800 (PST)
Message-ID: <5a1825e3-3517-4d17-aa8f-b0261245d9bb@riscstar.com>
Date: Wed, 28 Jan 2026 07:28:53 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: mfd: spacemit,p1: Add individual
 regulator supply properties
To: Guodong Xu <guodong@riscstar.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, devicetree@vger.kernel.org
References: <20260124-spacemit-p1-v2-0-2c86b06694ba@riscstar.com>
 <20260124-spacemit-p1-v2-2-2c86b06694ba@riscstar.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260124-spacemit-p1-v2-2-2c86b06694ba@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_052855_644052_FA16ABDE 
X-CRM114-Status: GOOD (  15.56  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 1/23/26 6:20 PM, Guodong Xu wrote:
> Add supply properties that match the P1 PMIC's actual hardware topology
> where each buck converter has its own VIN pin and LDO groups share
> common input pins. Supply names are defined according to the pinout
> names in the P1 datasheet.
> 
> This allows different boards to describe their actual power tree
> connections in devicetree rather than hardcoding supply relationships
> in the driver.
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>

Your additions match what I see in the data sheet.
This looks good, thank you.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
> v2: Remove providers from the dts example.
>      Pass the 'make dt_binding_check' test.
> ---
>   .../devicetree/bindings/mfd/spacemit,p1.yaml       | 49 +++++++++++++++++++++-
>   1 file changed, 47 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml b/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
> index c6593ac6ef6a..c67b1c6e4e4f 100644
> --- a/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
> +++ b/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
> @@ -27,8 +27,41 @@ properties:
>     interrupts:
>       maxItems: 1
>   
> -  vin-supply:
> -    description: Input supply phandle.
> +  vin1-supply:
> +    description:
> +      Power supply for BUCK1. Required if BUCK1 is defined.
> +
> +  vin2-supply:
> +    description:
> +      Power supply for BUCK2. Required if BUCK2 is defined.
> +
> +  vin3-supply:
> +    description:
> +      Power supply for BUCK3. Required if BUCK3 is defined.
> +
> +  vin4-supply:
> +    description:
> +      Power supply for BUCK4. Required if BUCK4 is defined.
> +
> +  vin5-supply:
> +    description:
> +      Power supply for BUCK5. Required if BUCK5 is defined.
> +
> +  vin6-supply:
> +    description:
> +      Power supply for BUCK6. Required if BUCK6 is defined.
> +
> +  aldoin-supply:
> +    description:
> +      Power supply for ALDO1-4. Required if any are defined.
> +
> +  dldoin1-supply:
> +    description:
> +      Power supply for DLDO1-4. Required if any are defined.
> +
> +  dldoin2-supply:
> +    description:
> +      Power supply for DLDO5-7. Required if any are defined.
>   
>     regulators:
>       type: object
> @@ -58,6 +91,10 @@ examples:
>               compatible = "spacemit,p1";
>               reg = <0x41>;
>               interrupts = <64>;
> +            vin1-supply = <&reg_vcc_5v>;
> +            vin5-supply = <&reg_vcc_5v>;
> +            aldoin-supply = <&reg_vcc_5v>;
> +            dldoin1-supply = <&buck5>;
>   
>               regulators {
>                   buck1 {
> @@ -68,6 +105,14 @@ examples:
>                       regulator-always-on;
>                   };
>   
> +                buck5: buck5 {
> +                    regulator-name = "buck5";
> +                    regulator-min-microvolt = <500000>;
> +                    regulator-max-microvolt = <3450000>;
> +                    regulator-ramp-delay = <5000>;
> +                    regulator-always-on;
> +                };
> +
>                   aldo1 {
>                       regulator-name = "aldo1";
>                       regulator-min-microvolt = <500000>;
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
