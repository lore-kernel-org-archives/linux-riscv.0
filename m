Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D55C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 18:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=sF27JwFqOPIgaCP85RdjZvKWFt07sCmf7CM1jO5cR7I=; b=2OaZUlKca+ogUMczGGuvyIscQs
	tCmcmOlRCtM/Z/WWX1vcUFi0s4QgLsbgdG5XN+yMfuO75F27NYWXSOQM2zprE3wgA46yO7d3/G94i
	hAXacZ9xlRskjNvM0BV98x+SHSJ9dR/F3KjaSv6RZnbQ0ykpvRvOrVblHggZmuEFdw2tHFXCGttbc
	cnp5FBgy0Y8UmzYKrw55hGsMZab70UoAiEyyOTuRVmBgsmlm6h5zxoS1HDh1Vr4+dLzWtds5a5ZO8
	HeoRhlfFyncxp8MzuHVoMsSY9jUuest3IS1CiC16qHe+OvK5tUEAPnrk+wP5OHRcLWR4p5VvhSpvH
	ylUTXkog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAcXP-00Crco-6V; Thu, 20 Jan 2022 18:51:59 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAcXN-00Crc7-1J
 for linux-riscv@lists.infradead.org; Thu, 20 Jan 2022 18:51:58 +0000
Received: by mail-pj1-x102a.google.com with SMTP id
 my12-20020a17090b4c8c00b001b528ba1cd7so1613313pjb.1
 for <linux-riscv@lists.infradead.org>; Thu, 20 Jan 2022 10:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=aAElqll6HcGOKdu1l+4BDFs74fKBxBPJQ/1HSNtgISI=;
 b=3brA5+YFUK34MXcTtFKlB0aLLKO/YP/rq83VzW1SYf97Ri8DZxIuLQ4zJJxwQBLzpJ
 NW2oj/gcvtvpHEohXKo2pPEI+iFeXuhv46Kcdz/axsh6dtmzisEW9Gt67C2H3i7+Ux84
 52FatSauhcQOgh/AX8D67demVSYOQ73JyUaFzaVqqAVZIV0ZZG+IzN8GxxR1xg1oRZ0z
 Spm5+2c37GczUWkqlbNAKiU3S0wBzSmTDiZuWTrrAkEtBc1+WS8AxWA0uVozybduJYVQ
 QZsFbHfOtUoY7ClI0w0j2vIUJgVdj3rfifazeMMLqypQd9pozZIezwatL6C3oSNPATj7
 jT3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=aAElqll6HcGOKdu1l+4BDFs74fKBxBPJQ/1HSNtgISI=;
 b=QD/JIsX7fXtYQvDIli2CXC9og745UCKIrWAU9Mv1LyYjNCoez48cJPxVat/USu3Hpo
 t8h5fTLsf0rruVSUTPFxSCzcn2mZvhBVrf2qW0fF1vVdhpbXM0j/1/fBJrrJr3ivySup
 cBSfGIKqrSSTb9QpdhEuGaRn8OBcoqZSwJLovw7Ydpcel4wSky+DC4nshNtfbVUomgNK
 CzhSAtVoekZj1z/BDaHBfH9+p5adDR3jx5sbksi46QVP/T7gtD2D1ryFZ1n5C+wtGe3+
 2Oud7nFDSmcNEvdmz+c+Ow0N8kHxCaERw/kwxkERmLZbZk6GyAXm5GaIeg1epHS3/F+/
 8UIQ==
X-Gm-Message-State: AOAM531IufFWHOw2Xj7IRhy0iCSTxh1mHMbqVbzp/gvZ16RhpiVQZl/R
 LEafniL9/dGGfkrqAfE+0wsy/iSTYtOy3w==
X-Google-Smtp-Source: ABdhPJx0HnJkGKqfD4Kv3vqyguY0PXPBkZwjEjaFA0kzfYMCst7atFsorC+k0j7udcuzCzvQAS+25g==
X-Received: by 2002:a17:90b:4c89:: with SMTP id
 my9mr416443pjb.74.1642704716407; 
 Thu, 20 Jan 2022 10:51:56 -0800 (PST)
Received: from localhost ([12.3.194.138])
 by smtp.gmail.com with ESMTPSA id x25sm3816569pfu.205.2022.01.20.10.51.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 10:51:55 -0800 (PST)
Date: Thu, 20 Jan 2022 10:51:55 -0800 (PST)
X-Google-Original-Date: Thu, 20 Jan 2022 10:45:50 PST (-0800)
Subject: Re: [PATCH v4 2/3] dt-bindings: Add dma-channels for pdma device node
In-Reply-To: <5db314b798cd9cfcb5cb61bc56515220b7d50315.1642383007.git.zong.li@sifive.com>
CC: robh+dt@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, krzysztof.kozlowski@canonical.com,
 conor.dooley@microchip.com, 
 geert@linux-m68k.org, bin.meng@windriver.com, green.wan@sifive.com,
 vkoul@kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, zong.li@sifive.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zong.li@sifive.com
Message-ID: <mhng-e5e649a2-96bf-4244-a29a-a75c913111a2@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_105157_108083_06155945 
X-CRM114-Status: GOOD (  17.35  )
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

On Sun, 16 Jan 2022 17:35:27 PST (-0800), zong.li@sifive.com wrote:
> Add dma-channels property, then we can determine how many channels there
> by device tree, rather than statically defines it in PDMA driver

Maybe "statically defining it" is better here?

>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  .../devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml    | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml b/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
> index d32a71b975fe..3dbb8caefc17 100644
> --- a/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
> +++ b/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
> @@ -34,6 +34,12 @@ properties:
>      minItems: 1
>      maxItems: 8
>
> +  dma-channels:
> +    description: For backwards-compatible, the default value is 4

Maybe "backwards-compatibility" is better here?

> +    minimum: 1
> +    maximum: 4
> +    default: 4
> +
>    '#dma-cells':
>      const: 1
>
> @@ -50,6 +56,7 @@ examples:
>      dma@3000000 {
>        compatible = "sifive,fu540-c000-pdma";

IMO we should have a "sifive,pdma-1.0.0" (or whatever the versioning 
scheme ended up being) here, in addition to the SOC-specific DT entry.  
It's kind of odd to start extending the SOC-specific DT entry, as the 
whole idea there is to let us have an out in case we find future 
compatibility issues.

>        reg = <0x3000000 0x8000>;
> +      dma-channels = <4>;
>        interrupts = <23 24 25 26 27 28 29 30>;
>        #dma-cells = <1>;
>      };

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
