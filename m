Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E93C64EC4
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Mar 2023 21:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=58JLFWrJ4VDhi55b1GnL8hZJnuvXZJKIHDVkKD4rWAo=; b=izCNMgeeLm1MOm
	zYghTyHcPtyc//S3RplbgzVV6IxgQcIHqfiJe30z+vraGp16p5cLqZzzvaZS42KVtdup+ALXhScuF
	OyRvGYjaXGzT1kgOYvnCg2WPFPEBvfnqEuvJw1AQxHDp8Fmtkm/U5poHkvqTLsxwmquV0ERbErllH
	tboCrRdJXhIn8I4XSSLV5USLbVQTZOapC8g6jhB6HZSJ74ZhFykOBhHcfq6PNy1wMIeNKVb4+x9d6
	LMDOI58Uw0DMreSyQIVhn3TaWaCp7Ghqu/W+ZYHJ7lje0uxCzsPkzabkzsWpXDl7Erhcjh9smK52s
	d96G2cfkrq5Rc6X7bSOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa1me-006uNw-Ld; Wed, 08 Mar 2023 21:57:16 +0000
Received: from mail-oi1-f181.google.com ([209.85.167.181])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa1mb-006uNR-Mr
	for linux-riscv@lists.infradead.org; Wed, 08 Mar 2023 21:57:14 +0000
Received: by mail-oi1-f181.google.com with SMTP id t22so167508oiw.12
        for <linux-riscv@lists.infradead.org>; Wed, 08 Mar 2023 13:57:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678312631;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YAS1xYRXj3cdPKcvjDZ+t7RtqFJmt8ftiUP9NIi5BhI=;
        b=rUVhxa67u+yZXrhXS2WixndUQJ8FuyHPH9zWfin3CqD/wjIs7QThJtqbLVDeJjr6ch
         etjBlX8amWNCpw2b+wgMeDzHf8N2LlE8sdc8CQmeAJJg1n1O2UAKEm1yh0CLDeC7sDx5
         wLKyPFQjGocuRFZexoHbVgtCOhbHjmjRK08rOH1fFdbi/8nmPCXZ04L+jYjaie56dyTG
         XDoayiRTc+eSu/TWgyb747+TTKf1CjsdWhC1xAiYHmZ0r6MmvCKLMZlBUrp/7g4HzVXv
         wgp0zmXJp+vlV4FZW8qg88oE/2p99ntkJkyftXOpGTmqFl/OCCQYEUJh81G2xa9++4HP
         +ljw==
X-Gm-Message-State: AO0yUKVF8By7wyTfokf+/SitddsVbMH4P+3YJtGImHgtdBIZ73biDRmP
	VF3ZqKIKbKflIUsgjGyfHPVsjHMztg==
X-Google-Smtp-Source: AK7set/wO6Hud4S7hIzFW35ljRId+eCmpPInzcvs2Ch8cPaIh2UOWciajGcHOgTRjHsb09N5i4I6pQ==
X-Received: by 2002:aca:1c03:0:b0:378:3a54:4418 with SMTP id c3-20020aca1c03000000b003783a544418mr7812947oic.49.1678312631513;
        Wed, 08 Mar 2023 13:57:11 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y64-20020aca3243000000b00383eaea5e88sm6820737oiy.38.2023.03.08.13.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 13:57:10 -0800 (PST)
Received: (nullmailer pid 3911485 invoked by uid 1000);
	Wed, 08 Mar 2023 21:57:09 -0000
Date: Wed, 8 Mar 2023 15:57:09 -0600
From: Rob Herring <robh@kernel.org>
To: Samin Guo <samin.guo@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>, Yanhong Wang <yanhong.wang@starfivetech.com>
Subject: Re: [PATCH v5 03/12] dt-bindings: net: snps,dwmac: Add an optional
 resets single 'ahb'
Message-ID: <20230308215709.GA3904341-robh@kernel.org>
References: <20230303085928.4535-1-samin.guo@starfivetech.com>
 <20230303085928.4535-4-samin.guo@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230303085928.4535-4-samin.guo@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_135713_763027_A29716D0 
X-CRM114-Status: GOOD (  15.49  )
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

On Fri, Mar 03, 2023 at 04:59:19PM +0800, Samin Guo wrote:
> According to:
> stmmac_platform.c: stmmac_probe_config_dt
> stmmac_main.c: stmmac_dvr_probe

That's not really a reason on its own. Maybe the driver is wrong. Do we 
know what hardware needs this?

> dwmac controller may require one (stmmaceth) or two (stmmaceth+ahb)
> reset signals, and the maxItems of resets/reset-names is going to be 2.
> 
> Signed-off-by: Samin Guo <samin.guo@starfivetech.com>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml        | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index b4135d5297b4..89099a888f0b 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -133,12 +133,18 @@ properties:
>          - ptp_ref
>  
>    resets:
> -    maxItems: 1
> -    description:
> -      MAC Reset signal.
> +    minItems: 1
> +    items:
> +      - description: GMAC stmmaceth reset
> +      - description: AHB reset
>  
>    reset-names:
> -    const: stmmaceth
> +    minItems: 1
> +    maxItems: 2
> +    contains:

This means 'reset-names = "foo", "ahb";' is valid. You want 'items' 
instead. However, that still allows the below string in any order. Do we 
really need that? If not, then you want:

items:
  - const: stmmaceth
  - const: ahb

> +      enum:
> +        - stmmaceth
> +        - ahb
>  
>    power-domains:
>      maxItems: 1
> -- 
> 2.17.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
