Return-Path: <SRS0=wDqN=IJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E34EFC433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Mar 2021 17:43:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6360764F97
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Mar 2021 17:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6360764F97
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JOlsgCYg/btfgyQQCTV6X+tp1u6B1NuJXRHRdRkmQaI=; b=Il5QXW92U7BnbaubBLkRicRak
	/L+vMRZFOenfUCTbLOsLXJQo0FDh1ABSqBoft9Q7OHZUflhaYBdZMwTOlYzQxqQuKGR2MAy1miWBP
	39AJ9epMoiT7+VEqeaE1hDrOCjxWnSr3xmOoxq+TNeznojdozqLCXDjhvWRs28Z+NgUdgXs2dfHSq
	0htHzS69DQ2hXxuRPZgz095SgKtMpDZmX1LvFx6MpFAM0NbfED56um3lprjc2vQ4I9eytx9UmqlHG
	2bgpY+n43ayaqAWn++jKb4lOQrdI8UNMCRNsXdP/hL7QjCG3g0GCFGZVsnzj5BFU2cmOkT2zoGic0
	QL8zw7xaA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKPL7-009lNE-BV; Thu, 11 Mar 2021 17:43:13 +0000
Received: from mail-il1-f171.google.com ([209.85.166.171])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKPL2-009lM2-K8
 for linux-riscv@lists.infradead.org; Thu, 11 Mar 2021 17:43:10 +0000
Received: by mail-il1-f171.google.com with SMTP id d5so62342iln.6
 for <linux-riscv@lists.infradead.org>; Thu, 11 Mar 2021 09:43:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yrYLvM9Tk00cK77S7tm4qU2hYr/Evchck4qsfs1uG0Q=;
 b=e/ZcJBJecI5R/Qdh9ksVcjgqvWckYAJ0kZgOw9XxUZq4+D/MDi6qBMQ2w0zPpARRe4
 YYdqaLMBF2fOU2rTBLRwrUZs0Hl9Pve9vS7vIP/gjA83jfBjdLSH+tD0De0MYW02qS90
 hS75BXdTELwjK5YwJX32/yuqL441LGaDdml1alYDbv67qKryOEbHrRmLMEY4V1xqE2B8
 4E7EMAgYiXXuQUoSGHQbaUt1E8iaA+WC98obpjRI1IDIP+jSQNiULhVHne8sHLYPa1VB
 /acEQSbPv4hWBTuFGGMJKV6EsXFPCGwlTA5O43N5eMhGXjHpK0OJrsm+/anv5N6/s9Ox
 fz9g==
X-Gm-Message-State: AOAM531TRug+jQf+k7nq8B0Of1e43IWN2vJRgLby5apVna3ZxyDVtVYP
 /QEOO7smUOVPqVLyHRLq/Q==
X-Google-Smtp-Source: ABdhPJwcdWOdRO6FAGc5GOVurtNLD92CTCrAhvDr8p59zjYYmNUBBir66nEeHVcZdl8bkA6WEyu+ZQ==
X-Received: by 2002:a05:6e02:1b05:: with SMTP id
 i5mr5848513ilv.167.1615484587466; 
 Thu, 11 Mar 2021 09:43:07 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id j4sm1667885ioa.18.2021.03.11.09.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 09:43:06 -0800 (PST)
Received: (nullmailer pid 936312 invoked by uid 1000);
 Thu, 11 Mar 2021 17:43:05 -0000
Date: Thu, 11 Mar 2021 10:43:05 -0700
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Cc: damien.lemoal@wdc.com, jassisinghbrar@gmail.com, aou@eecs.berkeley.edu,
 paul.walmsley@sifive.com, palmer@dabbelt.com, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, j.neuschaefer@gmx.net,
 lewis.hanly@microchip.com, cyril.jean@microchip.com,
 daire.mcnamara@microchip.com, atish.patra@wdc.com, anup.patel@wdc.com,
 david.abdurachmanov@gmail.com
Subject: Re: [PATCH v4 4/5] dt-bindings: add bindings for polarfire soc
 system controller
Message-ID: <20210311174305.GA926017@robh.at.kernel.org>
References: <20210311113456.15686-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210311113456.15686-1-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_174308_925125_75EF32C1 
X-CRM114-Status: GOOD (  16.96  )
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

On Thu, Mar 11, 2021 at 11:34:56AM +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the MSS system controller on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  ...icrochip,polarfire-soc-sys-controller.yaml | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml
> new file mode 100644
> index 000000000000..222557f96a13
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml
> @@ -0,0 +1,36 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/soc/microchip/microchip,polarfire-soc-sys-controller.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Microchip PolarFire SoC (MPFS) MSS (microprocessor subsystem) system controller
> +
> +maintainers:
> +  - Conor Dooley <conor.dooley@microchip.com>
> +
> +description: |
> +  The PolarFire SoC system controller can be accessed as a mailbox device.
> +  This document describes the bindings for that device.
> +
> +
> +properties:
> +
> +  allOf:
> +    - $ref: /schemas/mbox/mbox-consumer.yaml#properties

This defines a DT property 'allOf'. This would need to be at the top 
level with 'properties' dropped. However, you generally don't want to 
include consumer schemas. You need to define 'mboxes' property here 
because you need to define how many and what they are if more than 1.

What does 'can be accessed as a mailbox device' mean? Is there another 
way? Is it a mailbox device (provider)?

> +
> +  compatible:
> +    const: microchip,polarfire-soc-sys-controller
> +
> +required:
> +  - compatible
> +  - mboxes
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    syscontroller: syscontroller {
> +      compatible = "microchip,polarfire-soc-sys-controller";
> +      mboxes = <&mbox 0>;
> +    };
> -- 
> 2.17.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
