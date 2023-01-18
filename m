Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3787C38147
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jan 2023 13:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vlzUq0qZeG4eMnzVoUyCcAQd+jWRyQgO4e5kuHVb96I=; b=mor6G94T9FnKoL
	WgHj6MZAQ37ifI2rHxn8fcKE+oMq6dQutpDA3y3Q7iUQ+0eqx2BcyDLu3fDNFmi6Cep8O1USWYiC4
	S/GX0lC/VOTQ73BpY7Dp9vql6rzcMjY+wo/cnJUx6rrC0f/2TQrCJlPvd6jqm70rYCTpeZzKkgRNY
	3SjbT/BOtvwOmVxKyJ4ngUYTXCjC0Tq7VHvZCklTM/CkIYxN0wC3VGI3OZpZ7/KY9wYlmRBg+eFW4
	RJF2ZoZ/2g8Zdt3CRiH/LNvKxjaz7E3e4jxULhudH55dycL6tIiwFkM5dhWstabeMxwX/a8TN8Qg5
	bUV0Kkyaw6c6Bwt5emEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI8Dc-0014uO-PP; Wed, 18 Jan 2023 13:11:08 +0000
Received: from mail-oo1-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI8DM-0014nz-8p
	for linux-riscv@lists.infradead.org; Wed, 18 Jan 2023 13:10:54 +0000
Received: by mail-oo1-f49.google.com with SMTP id h12-20020a4a940c000000b004fa81915b1cso824050ooi.4
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jan 2023 05:10:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LPXKE4fWh08xIviaGRGhwlFYvgu/9wGipKwIrtn3ERY=;
        b=U/CN8EwKPP081VsjuxrNm2krRkVj2WRExDThSWc8RG6hycgeGK1a8F5ThuK2sXTOYy
         TJK0q21vOkgqzTT4kSNikkro0Wt62IFL/nEXxffTEfT3H62KUUXWKu1o+mkoZqxA0WK2
         d9Le34wD3EocNkfJexfiR6Ndat9162bniG+GEOPjVPJeuIoahHZGXzAReiOWlLhRP8Pr
         yp1rxtCZoMtAWtuuPhvkc8pWo/xcNTcu8CdmfH3JZ344taMeKOAXnI2qsjVZT7H6z6FN
         vNB4DUAPaP+eyBIm08wuZYBpjI+memg2U1PhxzmiVAa17TW7TMKlDcV4QysjbI+aevB/
         pnIQ==
X-Gm-Message-State: AFqh2kqP1JFQZI3gK4YFyVUZm+q6UWhmsn+bxvimgd5NazLZrfk7DtRS
	N5cvz8k6jgRZw4pcgH0vwg==
X-Google-Smtp-Source: AMrXdXuaVkiDYUFtNuNfPCSPfjF3RtDj8mtkMncMjSfU5aOhhpiJCxGNF68RjD5jl+wYaaUCe+TGSw==
X-Received: by 2002:a4a:1ac4:0:b0:4f2:21f7:cd93 with SMTP id 187-20020a4a1ac4000000b004f221f7cd93mr3356508oof.0.1674047449990;
        Wed, 18 Jan 2023 05:10:49 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id s23-20020a4ae557000000b0049f5ce88583sm16470775oot.7.2023.01.18.05.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 05:10:48 -0800 (PST)
Received: (nullmailer pid 1459876 invoked by uid 1000);
	Wed, 18 Jan 2023 13:10:47 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Yanhong Wang <yanhong.wang@starfivetech.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-riscv@lists.infradead.org, netdev@vger.kernel.org, Peter Geis <pgwipeout@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Richard Cochran <richardcochran@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, "David S . Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20230118061701.30047-3-yanhong.wang@starfivetech.com>
References: <20230118061701.30047-1-yanhong.wang@starfivetech.com>
 <20230118061701.30047-3-yanhong.wang@starfivetech.com>
Message-Id: <167404705359.1390391.205840489556921087.robh@kernel.org>
Subject: Re: [PATCH v4 2/7] dt-bindings: net: snps,dwmac: Update the maxitems
 number of resets and reset-names
Date: Wed, 18 Jan 2023 07:10:47 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_051052_377475_D2293AB7 
X-CRM114-Status: GOOD (  10.87  )
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


On Wed, 18 Jan 2023 14:16:56 +0800, Yanhong Wang wrote:
> Some boards(such as StarFive VisionFive v2) require more than one value
> which defined by resets property, so the original definition can not
> meet the requirements. In order to adapt to different requirements,
> adjust the maxitems number definition.
> 
> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
> ---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.example.dtb: ethernet@1c0b000: Unevaluated properties are not allowed ('reset-names' was unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.example.dtb: ethernet@1c0b000: Unevaluated properties are not allowed ('reset-names' was unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.example.dtb: ethernet@1c0b000: Unevaluated properties are not allowed ('reset-names' was unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230118061701.30047-3-yanhong.wang@starfivetech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
