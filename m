Return-Path: <SRS0=mZrj=NK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB8B8C4338F
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Aug 2021 17:29:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A62266108E
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Aug 2021 17:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A62266108E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bm3OHOgMmA9aeCvPSB5kF1n8S6fSsOkvcrhFjOwOIgU=; b=wFaKTVr1Tr3hWa
	sRXuRwXdN/DK8xO3E5N7tbc6jR8DMsu7G0ydRV0dwlywSbT1gPd8RQcWU3fCD8TF9Werr6NiWtF0x
	3qLMIynu0JJBfOuO7fie3OhKXMmymw4yUJBYffQs55w5J0LU3U2wC6Tw9aUm5ZZ/4F3hrJc9NkAfH
	bWPfjfar/Bw2qhLT5LEuX3IakGTP7RPvDa0yziP7TL4PdIMrhywPZBHt34plNJ+tu8eAaAhQhH582
	pihludnYj5+6T2nUMeRWO2rL6l4CRurlDc4CJLguhTGlr1yLJ1tYLblTWJANyYdlUQz/qwEMMrS0e
	pjj32Vc2gx4eOog3TwHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGlqu-0098Tu-KT; Thu, 19 Aug 2021 17:29:16 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGlqo-0098Pi-FP; Thu, 19 Aug 2021 17:29:14 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17JHSuqr102147;
 Thu, 19 Aug 2021 12:28:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1629394136;
 bh=9wm20UrD06qQHwEXtF7BbUvRLzoMUVujfUi73UTq5+4=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=fKdtQX+V06GOSGKQgO9RivIvFwsW5j32CBCUwxDAeAEsDKz6VDZ7abpNRydEIRNtT
 MC93+Jj6dvTI5iYc3c/qElfGyC8x5eoevn8p+7fwEKR7y3sOTv/J2mX6MkECM6Zrd+
 Y8N5Wwj02ZNX0A3nG2LbgIQqX4lzsdJc6tv9kc0Q=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17JHSuXq117014
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 19 Aug 2021 12:28:56 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 19
 Aug 2021 12:28:56 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 19 Aug 2021 12:28:56 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17JHStHH055693;
 Thu, 19 Aug 2021 12:28:56 -0500
Date: Thu, 19 Aug 2021 22:58:54 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@wdc.com>,
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>, Tudor
 Ambarus <tudor.ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 1/5] dt-bindings: mtd: jedec,spi-nor: document
 issi,is25wp256
Message-ID: <20210819172852.b26mybrdr33wso62@ti.com>
References: <20210819165908.135591-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210819165908.135591-1-krzysztof.kozlowski@canonical.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_102910_733611_0D97FF48 
X-CRM114-Status: GOOD (  15.76  )
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

+ Tudor (you should be listed as a maintainer for this file IMO)

On 19/08/21 06:59PM, Krzysztof Kozlowski wrote:
> Document bindings for the issi,is25wp256 SPI NOR flash.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> index ed590d7c6e37..0db64ac7dc33 100644
> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> @@ -33,6 +33,7 @@ properties:
>        - items:
>            - enum:
>                - issi,is25lp016d
> +              - issi,is25wp256

I don't think we want to add any new flash specific compatibles. Why is 
"jedec,spi-nor" not enough for you?

>                - micron,mt25qu02g
>                - mxicy,mx25r1635f
>                - mxicy,mx25u6435f
> -- 
> 2.30.2
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
