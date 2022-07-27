Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98211C19F2B
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 15:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dSS3h/J3+ipr2nBbdbK9RFZiitPhh+5t288NIEoAQis=; b=eJykKAInPCRibq
	BnJFelzFkWgbGJmfo0ScPTZqfwVa1cZNnOoY6iImF6DqOKuCj14z3fVfmJ/k0lkZoLBKJsLcRoRi+
	vuLzywfpgfIfTaTyJIGM4ybLE0uooS+L9jerNf71Ya71lA9fE1IL0GHaH1jy2yr8LjAa9TPDF556s
	GXqshSkuanEOjtitVIVs7dtPxKh0514m3e7GLTZp+KPJzdr3JTy+oT1N+Ij7PZqPSQJ/TeA/tiWh5
	301DQ4Xr9BAErJfwYxB1vV5YAc5DV1Uj9R2MqEBW1Mdfe+Ezmp86kDdxfsdPGfZ29nx6dDtvdtMJ+
	b+FvZK8PTPuayLj6nH+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGjCc-00FAvV-0d; Wed, 27 Jul 2022 15:44:02 +0000
Received: from mail-il1-f174.google.com ([209.85.166.174])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGjCY-00FAsk-SW
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 15:44:00 +0000
Received: by mail-il1-f174.google.com with SMTP id p5so1831266ilg.9
        for <linux-riscv@lists.infradead.org>; Wed, 27 Jul 2022 08:43:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EBPsyq8xCTUIGHkDPSsIKhxwmfJ6F+duXUDyo4llVo0=;
        b=mjscbx1/6i1Ztw5XWPQYDVdDOzRetL9wNAuhPv4a33WJNAFDzO3y6641/t0PQU9ILE
         kfiKvd9TXHqifpwwti5RkdcIiC/Nc9p4g5lRWUaLoJmyP0/tCwQVXFXtHDoWoULPDyfz
         7DxnBqzCz4AhXA6bkeSRBCvsdhPK206Yw6PMDoDfHse5F4Rlpw7glyxDzqB2Pfej5Mda
         8anF0yLybAA2cCdmKFKMzdFXODBH9KNHbbe3D/vxrSvMai1B3oALHOiLDW43TxDYsLoS
         h8aO0ayahewN+CIeemt22urVh06LjJ0f1aA/DSWYFY9cBbNs2mUebz+LOcFU1Jb7ipgP
         OILA==
X-Gm-Message-State: AJIora8hOApw2tdYEod/i2er08jUuOEeydgAp5cOw6eBBVPneZeI6dSe
	xmF1DQ9RQcz3k4+9a6HbxPHb9kD81w==
X-Google-Smtp-Source: AGRyM1sP6a08WkTCUGcmRvfX3ijrTpt7NEQ6DQj6lTIcMRgPCXMgOcSJmDPAyD1mwUTjZKCujuIgzg==
X-Received: by 2002:a92:6504:0:b0:2dd:8201:fdeb with SMTP id z4-20020a926504000000b002dd8201fdebmr3968342ilb.98.1658936637261;
        Wed, 27 Jul 2022 08:43:57 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id a20-20020a027a14000000b0033f5e8dab90sm8092861jac.143.2022.07.27.08.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 08:43:56 -0700 (PDT)
Received: (nullmailer pid 2728328 invoked by uid 1000);
	Wed, 27 Jul 2022 15:43:55 -0000
Date: Wed, 27 Jul 2022 09:43:55 -0600
From: Rob Herring <robh@kernel.org>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 1/6] dt-bindings: arm: renesas: Ignore the schema for
 RISC-V arch
Message-ID: <20220727154355.GA2723077-robh@kernel.org>
References: <20220726180623.1668-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220726180623.1668-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220726180623.1668-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_084358_964800_74CA4CA8 
X-CRM114-Status: GOOD (  12.81  )
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

On Tue, Jul 26, 2022 at 07:06:18PM +0100, Lad Prabhakar wrote:
> Ignore the ARM renesas.yaml schema if the board is RZ/Five SMARC EVK
> (RISC-V arch).
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/arm/renesas.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
> index ff80152f092f..f646df1a23af 100644
> --- a/Documentation/devicetree/bindings/arm/renesas.yaml
> +++ b/Documentation/devicetree/bindings/arm/renesas.yaml
> @@ -9,6 +9,15 @@ title: Renesas SH-Mobile, R-Mobile, and R-Car Platform Device Tree Bindings
>  maintainers:
>    - Geert Uytterhoeven <geert+renesas@glider.be>
>  
> +# We want to ignore this schema if the board is of RISC-V arch
> +select:
> +  not:
> +    properties:
> +      compatible:
> +        contains:
> +          items:
> +            - const: renesas,r9a07g043f01

As I've said, this doesn't work without tool changes I proposed.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
