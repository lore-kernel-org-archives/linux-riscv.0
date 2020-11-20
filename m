Return-Path: <SRS0=Au/l=E2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A893DC2D0E4
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2020 20:53:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B66322252
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2020 20:53:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gguv1xoJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B66322252
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SmCWLq9pGs0MynvcUPPmKKnfZdgG0gGDXSCHl/CtaSg=; b=gguv1xoJnbYZ9GkevA9DceyKD
	uN1xA/8huxIKOiMPVoCdXkUoka7e9iZDJ+6OX9Sqlhu5XcjHWvYMUqemi3uQheNE3vHMU6foBE94v
	O5le8JTfNPH3z01eQHFhgnyKwlUm8+GYsD426EBhgtEBKkoxbIx9rvbJHKDZ+BgYWnEa6oUq0a6rF
	k2A3wlqwa9gPfclAVot24H1jEXAsUTIqNMkQKObWYa2UOED1FkO0U8LwODTVRwzeo80CoiuYhevLu
	5y7BR/VUMTrFPUPxo02s5sTYav/s5O2w5qj0/OgLtLxQ0b5Phh0QuGeEJQWtNDh3uiwlhBqY8+euY
	puyh63T2A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgDOp-0005ul-UA; Fri, 20 Nov 2020 20:52:55 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgDOn-0005u4-Fn
 for linux-riscv@lists.infradead.org; Fri, 20 Nov 2020 20:52:54 +0000
Received: by mail-oi1-f196.google.com with SMTP id d9so11965665oib.3
 for <linux-riscv@lists.infradead.org>; Fri, 20 Nov 2020 12:52:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=t4c6d/Yt7xR4VIHjjdABt0P2c1fVQUXpF8BBSro6fGQ=;
 b=kECh2GWWeCzhCK9wMOI8d6a5uiOW9EeBgsbGzcoEaRhEZu/O9k2iBwUSZEuIaxaFbR
 X3ReXdh5u1z99sygEJD+NBca2S+7IbNKGfmEV6v+c/xeJ0NinRNz1nYDs2Ry7TfDIdxe
 tLON88vwd3FrLQaxbaskJRQ+Ks/SNNbU2b4xa+qG+cftpqw4ROlCBXMvyVY29oLsP7mb
 /FdGPE6i7V7hjZ9qmHKzjEyg1fdGjcbG9V9ZZ+fIZYJYmxrQYnWdv6YSq3CYgFFDgRqZ
 nd3yZfgi20OgZDDsJkxTTF/hlnFJMNvB0GnWPejcoVK1BOKIDXMcBoERr/hX22xiRXXT
 cjtg==
X-Gm-Message-State: AOAM53384XXX+PovosupJr+UrQj9bOynXQeHh26nFZc24XgLbaYseVT0
 xJXWf6ytSJvZxA8rwIZTLw==
X-Google-Smtp-Source: ABdhPJxOX6lcwnNmZNL3qHNljOtF1tg+nrK9OZSb1aj+XdwCq/3qvDun1Sr1YyQijOO5VUr8tQNCMA==
X-Received: by 2002:aca:4989:: with SMTP id w131mr7393391oia.82.1605905572337; 
 Fri, 20 Nov 2020 12:52:52 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id z19sm1926709otm.58.2020.11.20.12.52.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 12:52:51 -0800 (PST)
Received: (nullmailer pid 1721004 invoked by uid 1000);
 Fri, 20 Nov 2020 20:52:50 -0000
Date: Fri, 20 Nov 2020 14:52:50 -0600
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Subject: Re: [PATCH 3/6] dt-bindings: add bindings for polarfire soc mailbox
Message-ID: <20201120205250.GB1716438@robh.at.kernel.org>
References: <20201119170432.18447-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201119170432.18447-1-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_155253_550773_D75ACC10 
X-CRM114-Status: GOOD (  17.48  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 lewis.hanly@microchip.com, david.abdurachmanov@gmail.com,
 daire.mcnamara@microchip.com, jassisinghbrar@gmail.com, atish.patra@wdc.com,
 anup.patel@wdc.com, palmer@dabbelt.com, paul.walmsley@sifive.com,
 cyril.jean@microchip.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Nov 19, 2020 at 05:04:32PM +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the MSS system controller mailbox on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../mailbox/microchip,mpfs-mailbox.yaml       | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
> new file mode 100644
> index 000000000000..5d6ccaa13dc2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/mailbox/microchip,mpfs-mailbox.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Microchip MPFS mss mailbox controller
> +
> +maintainers:
> +  - Conor Dooley <conor.dooley@microchip.com>
> +
> +properties:
> +  compatible:
> +    const: microchip,polarfire-soc-mailbox # PolarFire

Comment is redundant.

> +
> +  reg:
> +    items:
> +      - description: mailbox data registers
> +      - description: mailbox int registers
> +    maxItems: 2

maxItems is implied by size of 'items'.

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  "#mbox-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupt-parent
> +  - interrupts
> +  - "#mbox-cells"
> +
> +unevaluatedProperties: false
> +additionalProperties: false

Only need one and in this case additionalProperties.

> +
> +examples:
> +  - |
> +    mailbox@37020000 {
> +      compatible = "microchip,polarfire-soc-mailbox";
> +      reg = <0x0 0x37020000 0x0 0x1000>, <0x0 0x2000318c 0x0 0x40>;
> +      interrupt-parent = <&L1>;
> +      interrupts = <96>;
> +      #mbox-cells = <1>;
> +    };
> -- 
> 2.17.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
