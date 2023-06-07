Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5184EC7EE43
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 20:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=orFZdCgi0k8uO7gswWd7mMT1OhxncMhm9uB77xxemtA=; b=eKCknBlIA+Y6nf
	H5L54s5nGKFDgH6KHrlENtS0MPqF4FeNUsssCntBJZXOK/PeGVtK1uHuQMRH8RQLmHMPVCpGLA2ZV
	LeDjyUupWQfdlz9NnmtqQ7NtVvof5w3Ke8GSj8AOdc2QRRTO/hVO8MEcjQFWBR0ZK8LzeqMifDqAE
	ickAgIE9lffVMkYFjV3IPNJWoRHuajVxvFYQTxzuux+Fr9JC+O+h2xynrNm1BK2CNkzLCOdmaMWvr
	n4OnbeyWFqDYef2ZBSk/37q03B86h5VkyqNBzOct66k7/TupDzxZqRX9nUkaZ222kXoNdvh08cQfH
	kDAWL0z0bAuIz5Y6cG3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6zOC-0073NU-08;
	Wed, 07 Jun 2023 20:04:16 +0000
Received: from mail-io1-f47.google.com ([209.85.166.47])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6zO7-0073M8-0v
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 20:04:14 +0000
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-77ac2eb07a3so55823839f.2
        for <linux-riscv@lists.infradead.org>; Wed, 07 Jun 2023 13:04:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686168247; x=1688760247;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=raWNAi0peUWVI3Y9OrLkCkchq3HuytUBPEeFbP0ENuk=;
        b=VF867/bIcGW7zPM8dYip5H/Yqn6NzAaH95TVEUyXwq95oZ5cGtNO4mrce9+1Y+RV1f
         9yGh15L4/791FkqPE+Ijt2dhlWUzr8IUeZXze0K+NedcmjZEqaXD3S4ssSh27soRaxvm
         B1pB3lGa0fCjjH0guJpfsN+AEZdrZLEm9fiQeQMg7T+6dkEVl9tqRTd9R/HE5iPa4itu
         aBb7o5kYUyIRAo5sn3PEb+ZH9pLeQbZB6s8NK8nPaEsBHw5zSPuUswcJe36OzpJnru+/
         5fvnPBOkUplGumONq/fnzT/BOE6jW6NZvPPYLOgF6rc5ywvrzfYQn3Bk2AhPriLBr8HE
         qk6Q==
X-Gm-Message-State: AC+VfDwuVXaCkr3jBkerU483Xm5l+00IJx/5Q36/NpEccDEKNf4Qgo1m
	H6FbXxvcYIF1X0nfAGSLNg==
X-Google-Smtp-Source: ACHHUZ45IDkIGT2Q9JMkxSSYM+aG/391kCQL1L54WXzc5BgP8ucqjIEn8nrFNK3DEjXExINnGSY8NQ==
X-Received: by 2002:a5d:8703:0:b0:776:fc02:184e with SMTP id u3-20020a5d8703000000b00776fc02184emr6236322iom.14.1686168247383;
        Wed, 07 Jun 2023 13:04:07 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id n7-20020a02cc07000000b0041cce10544dsm3696709jap.123.2023.06.07.13.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 13:04:06 -0700 (PDT)
Received: (nullmailer pid 3931893 invoked by uid 1000);
	Wed, 07 Jun 2023 20:04:03 -0000
Date: Wed, 7 Jun 2023 14:04:03 -0600
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Jisheng Zhang <jszhang@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, linux-serial@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH v4 06/10] dt-bindings: riscv: Add bouffalolab bl808 board
 compatibles
Message-ID: <20230607200403.GA3909108-robh@kernel.org>
References: <20230518152244.2178-1-jszhang@kernel.org>
 <20230518152244.2178-7-jszhang@kernel.org>
 <c6e44e14-35b2-da09-5e8c-4d47e7a7a055@sholland.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c6e44e14-35b2-da09-5e8c-4d47e7a7a055@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_130411_324271_1D3BAA66 
X-CRM114-Status: GOOD (  32.02  )
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

On Thu, May 18, 2023 at 10:31:35PM -0500, Samuel Holland wrote:
> Hi Jisheng, DT maintainers,
> 
> On 5/18/23 10:22, Jisheng Zhang wrote:
> > Several SoMs and boards are available that feature the Bouffalolab
> > bl808 SoC. Document the compatible strings.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  .../bindings/riscv/bouffalolab.yaml           | 29 +++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/riscv/bouffalolab.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/riscv/bouffalolab.yaml b/Documentation/devicetree/bindings/riscv/bouffalolab.yaml
> > new file mode 100644
> > index 000000000000..3b25d1a5d04a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/riscv/bouffalolab.yaml
> > @@ -0,0 +1,29 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/riscv/bouffalolab.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Bouffalo Lab Technology SoC-based boards
> > +
> > +maintainers:
> > +  - Jisheng Zhang <jszhang@kernel.org>
> > +
> > +description:
> > +  Bouffalo Lab Technology SoC-based boards
> > +
> > +properties:
> > +  $nodename:
> > +    const: '/'
> > +  compatible:
> > +    oneOf:
> > +      - description: Carrier boards for the Sipeed M1s SoM
> > +        items:
> > +          - enum:
> > +              - sipeed,m1s-dock
> > +          - const: sipeed,m1s
> > +          - const: bouffalolab,bl808
> 
> As mentioned in the message for patch 5, "The Bouffalolab bl808 SoC
> contains three riscv CPUs, namely M0, D0 and LP. The D0 is 64bit RISC-V
> GC compatible, so can run linux."
> 
> I have also been running U-Boot and NOMMU Linux on the less powerful,
> but still quite fast, "M0" core. However, this core needs a different
> DTB because:
>  1) The CPU is different (T-HEAD E907 instead of C906).
>  2) The interrupt routing is completely different.
>     a. The M0 core contains a CLIC instead of a PLIC.
>     b. The peripherals in the SoC are split between two buses. Those
>        on one bus have their IRQs directly connected to M0, and share
>        a multiplexed IRQ connection to D0; and vice versa for the
>        other bus. So each bus's interrupt-parent needs to be swapped.

Can't you include the dts file and then just override 
'interrupt-parent'? 

> Using some preprocessor magic like we did for Allwinner and Renesas, I
> was able to share most of the SoC and board DTs between the cores[1].
> However, this still ends up with two DTs for each board. So here are my
> questions:
>  - Is this acceptable?
>  - Is there precedent for how we should name the two board DTs?
>  - How does this affect the board and SoC compatible strings?
>    - Should there be a separate "bouffalolab,bl808-d0" in addition to
>      "bouffalolab,bl808"?

Probably. A DT is ultimately the view of the hardware from a CPU's 
perspective. Different views, different compatibles.

>    - Is it acceptable to use the same board compatible string for both,
>      since the _board_ part of the DT does not change, only things
>      inside the SoC?

Yes.

> 
> It would be possible to avoid having two DTs per board by guarding all
> of the differences behind "#ifdef CONFIG_64BIT", but that seems wrong
> because you would end up with two totally incompatible DTBs named the
> same thing, depending on how the DTB was built.

You can't have CONFIG_ options in .dts files.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
