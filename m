Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A23C00140
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Aug 2022 15:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c7svzj8wTlcQBsFULKqnACYKblqskIwDeAPic1WdI1c=; b=xYlWdXIbP73HcO
	EikfeFNoHJDYUWLFL7cbEKBycSCq6ERCgEIJ4AJkOTy2SxKYyh/sPkVcZ9RP0XeYZzxkLArKQTuyl
	U2JqD8xRFsEMX392Ri7ppX/VynXTttCZmj2aRQYu3na+dj7irXeRGXyXbD2dnrglTewq0EcRyw6dK
	Q4q05q1y4tLneJtE67F9n63VjSca88xoxWt6PU3cV+R57vALqLTeYYNP+eYHGC47VBycgl+UY67IL
	HES7QGLsg5kasUfF2z++UU6OYOTOqPeqKprpGMStSgs7fY05ywJ6VMc9/+ATSKQhQgGfg+91kZTUi
	SD5XsJfRwpSVEfFQXSOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOh9i-006SQ7-TY; Thu, 18 Aug 2022 15:09:58 +0000
Received: from mail-qv1-f46.google.com ([209.85.219.46])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOh6f-006QXW-LN
	for linux-riscv@lists.infradead.org; Thu, 18 Aug 2022 15:06:55 +0000
Received: by mail-qv1-f46.google.com with SMTP id q8so1371294qvr.9
        for <linux-riscv@lists.infradead.org>; Thu, 18 Aug 2022 08:06:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=R/U2IBOmuOYUnAlD0g8GnvyYlwS/o8azETiK5CuXS9k=;
        b=lDQ5WZGibekCI2m7C6ksbWIJ7iBK+MMdrw0C65DQpvUzzyDLLMxK4H8Nz8rH63Pfpw
         XyKnmLOEUzfSWMWp949P5VnAl34n7xcDkcy5KKGS925Ugyt9mpYJXuSYY39cc8KXkMlh
         a+JTOZTQO4Lku8x5CFgAmLI9lvb1Akkj/DLz4WB9MEmSdfOZuXxmKXAvvfGQqfghhnvG
         wfmaga0hq/iF2tkF4csiODWgJkKac5Ijhz7scZJYiII16q9rUPpR/ANH4BJAB2uXqDHw
         LryC9yX56OtuRPN6JCcXwagn0Mfd09s9p/I7Nl/dKs1W7imuzsEHKjZgARBCIXViHGnO
         7i3g==
X-Gm-Message-State: ACgBeo0xehd93RH1g3YBVjulZSINJtaY+PeWBwWvT+jfYpM9bSo/I19e
	rtbw8e+9xmjPTTnyULJdOA==
X-Google-Smtp-Source: AA6agR6gVKIy8t5d6GRbn5GV0AsGrWcjUGteoJZwZZ0GXaadLL065WXo3TvZe22l7DzyPrKRW0hn3Q==
X-Received: by 2002:a0c:c684:0:b0:494:d65c:f495 with SMTP id d4-20020a0cc684000000b00494d65cf495mr3145337qvj.24.1660835207884;
        Thu, 18 Aug 2022 08:06:47 -0700 (PDT)
Received: from robh.at.kernel.org ([2607:fb90:5fe0:b4f5:6e22:4704:df60:73a3])
        by smtp.gmail.com with ESMTPSA id dt2-20020a05620a478200b006bb024c5021sm1755015qkb.25.2022.08.18.08.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 08:06:47 -0700 (PDT)
Received: (nullmailer pid 1870414 invoked by uid 1000);
	Thu, 18 Aug 2022 15:06:45 -0000
Date: Thu, 18 Aug 2022 09:06:44 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <mail@conchuod.ie>
Cc: Daire McNamara <daire.mcnamara@microchip.com>, Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Greentime Hu <greentime.hu@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/6] dt-bindings: PCI: microchip,pcie-host: fix
 missing clocks properties
Message-ID: <20220818150644.GJ1829017-robh@kernel.org>
References: <20220816182547.3454843-1-mail@conchuod.ie>
 <20220816182547.3454843-3-mail@conchuod.ie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220816182547.3454843-3-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_080649_742171_4C4F0CDA 
X-CRM114-Status: GOOD (  21.50  )
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

On Tue, Aug 16, 2022 at 07:25:44PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Recent versions of dt-schema warn about unevaluatedProperties:
> arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: pcie@2000000000: Unevaluated properties are not allowed ('clock-names', 'clocks', 'legacy-interrupt-controller', 'microchip,axi-m-atr0' were unexpected)
>         From schema: Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
> 
> The clocks are required to enable interfaces between the FPGA fabric
> and the core complex, so add them to the binding.
> 
> Fixes: 6ee6c89aac35 ("dt-bindings: PCI: microchip: Add Microchip PolarFire host binding")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> dt-schema v2022.08 is required to replicate
> ---
>  .../bindings/pci/microchip,pcie-host.yaml     | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
> index edb4f81253c8..6bbde8693ef8 100644
> --- a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
> +++ b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
> @@ -25,6 +25,31 @@ properties:
>        - const: cfg
>        - const: apb
>  
> +  clocks:
> +    description:
> +      Fabric Interface Controllers, FICs, are the interface between the FPGA
> +      fabric and the core complex on PolarFire SoC. The FICs require two clocks,
> +      one from each side of the interface. The "FIC clocks" described by this
> +      property are on the core complex side & communication through a FIC is not
> +      possible unless it's corresponding clock is enabled. A clock must be
> +      enabled for each of the interfaces the root port is connected through.
> +      This could in theory be all 4 interfaces, one interface or any combination
> +      in between.
> +    minItems: 1
> +    items:
> +      - description: FIC0's clock
> +      - description: FIC1's clock
> +      - description: FIC2's clock
> +      - description: FIC3's clock
> +
> +  clock-names:
> +    description:
> +      As any FIC connection combination is possible, the names should match the
> +      order in the clocks property and take the form "ficN" where N is a number
> +      0-3
> +    minItems: 1
> +    maxItems: 4

items:
  pattern: '^fic[0-3]$'

> +
>    interrupts:
>      minItems: 1
>      items:
> -- 
> 2.37.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
