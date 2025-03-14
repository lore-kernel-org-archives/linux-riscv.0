Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B15D7C282EC
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 23:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S5vB/AdleksaavIks0UVRwTuH5FNRveCCI1XQ9rRpRg=; b=3SjhudRk7Wjnxt
	o7V0fq47V9zPmY53bUFW/w3cZ62tPNPLi6efmtfgZI8DR4K8zCKhxIydLeOzGUYRLV2bzn8WIlhEB
	0DQfu/tZLO4XMRz3KtNaoHGMrkTgdZdPrUnI9bBn9EcJ9HR5o40HFe33mJWLu7cgYhQOSRh2UXuq5
	WNiYjIyuh7OFMu4fnyvNT3iT3Lihhs07xqa1CgUWwUSZAHkgEXvBtvxAXwWzAM4k2En+AJ8c+B4y4
	nyrH/x9t+3/Wj2qpb6z/q704/SzozHXns7n25m2NwosT2ZOlbpJuQc0RiJ8ix+LF/2heBmdv6bRX5
	bEe6x4MzW1pBYnDq1tAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttEQA-0000000FVgr-00dd;
	Fri, 14 Mar 2025 23:26:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttEP9-0000000FVbr-0Cgo
	for linux-riscv@bombadil.infradead.org;
	Fri, 14 Mar 2025 23:25:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sdyx7hE8sscSdz69bHxTvwB2IZmxb2bltK2V4PpfXJo=; b=G8bY27lXsLvpcYupzoJMf+RF/D
	AT8uuOoEZURmLyxUr8rzfj3O2ku9usRV+lwtKm4zkEsry5fI9lX//qTp6NbadkSDyV5Yd/xsuhdD0
	YoHFeNUfOTJJI312z1FMDg9ZSYAb80Z4iPu1xY/3TnE6q2LCB1S9IPWjpybwfVCNWMgpA2PZonW/r
	6xZGJlOmKbNfKh6FLK91aLikfH5Kn2p2x9Ln06umxr0WNigchtRXy0FuGBIqJxUz8gPca5u0ZrrPX
	FYIMqJypntKwcZBOya6Cn/EhguY5O1HjvVALEDtFLDCYA4Ha+9bT0TNHCnkIQG6z/oS07uyZfmXUV
	Znnow7Xw==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttEP5-000000030RK-2Xof
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 23:25:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 90A71A45158;
	Fri, 14 Mar 2025 23:19:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3607C4CEE3;
	Fri, 14 Mar 2025 23:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741994720;
	bh=Cty/226PgKZsCVk/Xe3DBWuQQLcVWkAPJTZqcDVhSLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gahfdjbXCKI1r8hLV3782odEP7znP+mqjlXUa5nA/SFbfZjNMEFUcBScsZbiX8s1R
	 +X3F0yO7txvA3eogQT0xy9XYClSvqpOsEzMbdUlV9jfl1ICYOPo5ghPBjeHlxljDas
	 BksI6Qkeb+OLzdDz9zWWh7zPd0gNV1dIHR2tCmmjbGOQ0Odyhqw0YSeUJcDstEr42G
	 ul/XDC28VBkdkNFWxIm9F73g3SdtgCxDHEyOxcMZktlGu7uodRngEEGXVMdIG7sDv9
	 GSVf7rhFiHZGTTzeuFM5Jtm5eCf3nZB/ffwGILeOpoXghex5mZxJ6LVTv/Wjij0fj6
	 uY1ZTz/jccGOw==
Date: Fri, 14 Mar 2025 18:25:18 -0500
From: Rob Herring <robh@kernel.org>
To: Nick Hu <nick.hu@sifive.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] dt-bindings: timer: Add SiFive CLINT2
Message-ID: <20250314232518.GA2513550-robh@kernel.org>
References: <20250314081255.3718-1-nick.hu@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250314081255.3718-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_232524_109527_E890EACF 
X-CRM114-Status: GOOD (  14.39  )
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

On Fri, Mar 14, 2025 at 04:12:54PM +0800, Nick Hu wrote:
> Add compatible string and property for the SiFive CLINT v2.

Conor asked about being backwards compatible with v1. Please say why it 
isn't here.

> 
> Signed-off-by: Nick Hu <nick.hu@sifive.com>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> - v2 changes:
>   - Don't allow sifive,clint2 by itself. Add '-{}' to the first entry
>   - Mark the sifive,fine-ctr-bits as the required property when
>     the compatible includes the sifive,clint2
> 
>  .../bindings/timer/sifive,clint.yaml          | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> index 76d83aea4e2b..4b9dad11c1e9 100644
> --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> @@ -36,6 +36,10 @@ properties:
>                - starfive,jh7110-clint   # StarFive JH7110
>                - starfive,jh8100-clint   # StarFive JH8100
>            - const: sifive,clint0        # SiFive CLINT v0 IP block
> +      - items:
> +          - {}
> +          - const: sifive,clint2        # SiFive CLINT v2 IP block
> +        description: SiFive CLINT v2 is the HRT that supports the Zicntr
>        - items:
>            - enum:
>                - allwinner,sun20i-d1-clint
> @@ -62,6 +66,22 @@ properties:
>      minItems: 1
>      maxItems: 4095
>  
> +  sifive,fine-ctr-bits:
> +    maximum: 15
> +    description: The width in bits of the fine counter.
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: sifive,clint2
> +then:
> +  required:
> +    - sifive,fine-ctr-bits
> +else:
> +  properties:
> +    sifive,fine-ctr-bits: false
> +
>  additionalProperties: false
>  
>  required:
> -- 
> 2.17.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
