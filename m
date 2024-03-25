Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F3CC54E64
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 16:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FhHfb/hy+VWOg3P9p5HkFB3QnOnJBAniZ+ZWOkPJNxM=; b=3jb19SjOEWI1U5
	J8tSd39TY3w8n3CdQW2gV9PEeOaSmMJfsCQWsxqpZNwg3QQZ2Ey0MwUetrzegjHAb6A2+xY8b29uO
	MTa3s4VhwDEJYweGUA0dThrdaBcASi3GxU3Arr/N3SdIFnTDVtJE5j6g8IVthRZ9g369p59iFnQIq
	GTsjEtZ3RsH3nu71MxSWdKhjHNs5Vjt+T5SQ3ihCmtXHN56lFlFGIWt+eZoG72hrqKWC4FqTRI6Ap
	Yn+dXhsvO9AefnHlYBuZZBBQj2KZKlAMoidOEeRTTk7FGEMONTNPpWFeC5NTZXtKUBU+W2BNaGJZc
	BuP9OsLGJ/HWRS7hMwfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ron66-00000000jk2-2dFi;
	Mon, 25 Mar 2024 16:22:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ron60-00000000jgE-2U60;
	Mon, 25 Mar 2024 16:22:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C889A61172;
	Mon, 25 Mar 2024 16:22:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E0D8C433C7;
	Mon, 25 Mar 2024 16:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711383767;
	bh=xE6KNpCOn2OEaSo250Fbx8HQD0Ki6bF5GBxHx8kHNfc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M64/jWNfngnT3K2O0pepQWlnUxOW6YNPcpROJY1+gM/c8i3VywFpfoLk0JTo00PKW
	 iXf9f7G6lCML6+X9GtBSPg18JyUpmFZB/PMdRYUq1+iS4ioyDjuBjjSI4Mir22hRpF
	 1XPxZQjSvs0lak8qEx48f2iE8MCI35aAn3A3zr9SwvtBOEsbWUqJFSUneSB+yWu4hx
	 fS4pjsv6BfTmJPYkUo9LeFkuFdLoq42jOWyHOO3oU3J8O3BLHOKL3YintLT7xUkhxk
	 VyaH2lzmc8VzwK61/yHWMmumaF3jOWkFlb9vO9atzVOh8RPRImz5vS1PFa6i/ybMYl
	 AX0z34uS1hFuA==
Date: Mon, 25 Mar 2024 11:22:45 -0500
From: Rob Herring <robh@kernel.org>
To: Tan Chun Hau <chunhau.tan@starfivetech.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Simon Horman <horms@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andrew Halaney <ahalaney@redhat.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Jee Heng Sia <jeeheng.sia@starfivetech.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 1/1] dt-bindings: net: starfive,jh7110-dwmac: Add
 StarFive JH8100 support
Message-ID: <20240325162245.GA4167001-robh@kernel.org>
References: <20240325085131.182657-1-chunhau.tan@starfivetech.com>
 <20240325085131.182657-2-chunhau.tan@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240325085131.182657-2-chunhau.tan@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_092248_798843_37744494 
X-CRM114-Status: GOOD (  20.57  )
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

On Mon, Mar 25, 2024 at 01:51:31AM -0700, Tan Chun Hau wrote:
> Add StarFive JH8100 dwmac support.
> The JH8100 dwmac shares the same driver code as the JH7110 dwmac
> and has only one reset signal.
> 
> Please refer to below:
> 
>   JH8100: reset-names = "stmmaceth";
>   JH7110: reset-names = "stmmaceth", "ahb";

It's debatable whether JH8100 is compatible with JH7110 if the 2nd reset 
was not optional. I guess if the Linux driver treated it that way, we 
can get away with it. It would simplify the conditionals in the schema 
if the schema also treated the 2nd entry as optional on JH7110 as well.


>   JH7100: reset-names = "ahb";
> 
> Example usage of JH8100 in the device tree:
> 
> gmac0: ethernet@16030000 {
>         compatible = "starfive,jh8100-dwmac",
>                      "starfive,jh7110-dwmac",
>                      "snps,dwmac-5.20";
>         ...
> };
> 
> Signed-off-by: Tan Chun Hau <chunhau.tan@starfivetech.com>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml   |  1 +
>  .../bindings/net/starfive,jh7110-dwmac.yaml   | 82 +++++++++++++------
>  2 files changed, 58 insertions(+), 25 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 6b0341a8e0ea..a6d596b7dcf4 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -97,6 +97,7 @@ properties:
>          - snps,dwxgmac-2.10
>          - starfive,jh7100-dwmac
>          - starfive,jh7110-dwmac
> +        - starfive,jh8100-dwmac
>  
>    reg:
>      minItems: 1
> diff --git a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> index 0d1962980f57..da3cc984fec9 100644
> --- a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> @@ -18,6 +18,7 @@ select:
>          enum:
>            - starfive,jh7100-dwmac
>            - starfive,jh7110-dwmac
> +          - starfive,jh8100-dwmac
>    required:
>      - compatible
>  
> @@ -30,6 +31,10 @@ properties:
>        - items:
>            - const: starfive,jh7110-dwmac
>            - const: snps,dwmac-5.20
> +      - items:
> +          - const: starfive,jh8100-dwmac
> +          - const: starfive,jh7110-dwmac
> +          - const: snps,dwmac-5.20
>  
>    reg:
>      maxItems: 1
> @@ -83,29 +88,13 @@ allOf:
>    - if:
>        properties:
>          compatible:
> -          contains:
> -            const: starfive,jh7100-dwmac
> -    then:
> -      properties:
> -        interrupts:
> -          minItems: 2
> -          maxItems: 2
> -
> -        interrupt-names:
> -          minItems: 2
> -          maxItems: 2
> -
> -        resets:
> -          maxItems: 1
> -
> -        reset-names:
> -          const: ahb
> -
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            const: starfive,jh7110-dwmac
> +          allOf:
> +            - contains:
> +                enum:
> +                  - starfive,jh8100-dwmac
> +            - contains:
> +                enum:
> +                  - starfive,jh7110-dwmac

There's no need for the 2nd entry. You just need to check

I would something like this structure:

  - if:
      properties:
        compatible:
          contains:
            const: starfive,jh7100-dwmac

    then:

      if:
        properties:
          compatible:
            contains:
              const: starfive,jh8100-dwmac
      then:
        ...
      else:
        ...


>      then:
>        properties:
>          interrupts:
> @@ -117,10 +106,53 @@ allOf:
>            maxItems: 3
>  
>          resets:
> -          minItems: 2
> +          maxItems: 1
>  
>          reset-names:
> -          minItems: 2
> +          const: stmmaceth
> +
> +    else:

I don't think you need the else. Just do another 'if' entry.

> +      if:
> +        properties:
> +          compatible:
> +            contains:
> +              const: starfive,jh7100-dwmac
> +      then:
> +        properties:
> +          interrupts:
> +            minItems: 2
> +            maxItems: 2
> +
> +          interrupt-names:
> +            minItems: 2
> +            maxItems: 2
> +
> +          resets:
> +            maxItems: 1
> +
> +          reset-names:
> +            const: ahb
> +
> +        if:
> +          properties:
> +            compatible:
> +              contains:
> +                const: starfive,jh7110-dwmac
> +        then:
> +          properties:
> +            interrupts:
> +              minItems: 3
> +              maxItems: 3
> +
> +            interrupt-names:
> +              minItems: 3
> +              maxItems: 3
> +
> +            resets:
> +              minItems: 2
> +
> +            reset-names:
> +              minItems: 2
>  
>  unevaluatedProperties: false
>  
> -- 
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
