Return-Path: <SRS0=qQBT=NP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1C0FC4338F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Aug 2021 14:35:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BA816125F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Aug 2021 14:35:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8BA816125F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VYOQzkd0WpkS9mf01UzL/eEgJTRSJ5QEiaKYdL1sbxQ=; b=Q5EttKuCXLH1M7
	v2Ba5w37MFTc+xccx/8IFFXZyNCsrIhnx+6JeZgxldIfce2l95JNtPhjPdY1yHbdl0VYpYTtkv3DX
	Fawxdif02TGFwYbQOWQIdaZLtJQ9cW8AInk8TCJcy//W6EOxfynlYAH8rQSqhZEOAetJ3Z6VIvP2c
	w1MYTseJiCcXVaSKjPJ5IkOrTxdSmL4O4DEjJWYx5s81BaLn3gv0gOFhj/5aZr/XWAnCJb2vKC/z3
	1miCMsNLHFe32LhLKKhYn7cSdEZdWPb0hH8QUveQOtS2LI6NBzhueHDrdBngQwH6OAihQf3nPntVs
	HdmcOUmsF1lKxXXCs6HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIXVh-003WfT-57; Tue, 24 Aug 2021 14:34:41 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIXUv-003Wd8-1U
 for linux-riscv@lists.infradead.org; Tue, 24 Aug 2021 14:33:57 +0000
Received: by mail-ot1-f51.google.com with SMTP id
 x9-20020a056830278900b0051b8be1192fso25882129otu.7
 for <linux-riscv@lists.infradead.org>; Tue, 24 Aug 2021 07:33:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9kldX5LSk1AeNzh82BbMV96MR54hwptzA7Wk7T/NXSI=;
 b=fWN+DjQQ3BzoLAqR8pm42zShlObuUP71oCfiq56lIsjAOA3gjL+usgaNOALy2OAsVW
 7kAknldQYeLk+aRiTRQqLBiEz3H5RUYXJz8gjV7q3iniySswv/uL/fpSzWiCBBbyeQTh
 eILszlhifO1fc7+JnoFXhmc+1DPpXjAvPtLQjzwJ4HAoB3Wlrl9jAj5aThqH/HEZ7G0U
 kReSdzf+/RYcxQn0VDlew65FKu/JFaWbZ+t7c+14KSEInheEh+3/b/vc5mh6tynsMwJW
 1KaLk3akaFv4rKxGMTo20hybmwKT9+gewZ4mDKrW29J0pHL7N1r9sv9DonUBOrBj9s5L
 dVNA==
X-Gm-Message-State: AOAM532pzqkicc9ZnQMa5UAO6gHT0koMbE/r/sjVNXxIodWj/dkMW5d/
 zIOUJZVMTXRVhf+FcZmevw==
X-Google-Smtp-Source: ABdhPJx7YaMi06Fse66vJ/pNEcdzY1UiZ22EuP9LQFco4+TJ7Jlv2NLgfPAmKdyaXBvYoPpG8oWoNA==
X-Received: by 2002:a9d:5548:: with SMTP id h8mr12471244oti.370.1629815631667; 
 Tue, 24 Aug 2021 07:33:51 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id b11sm4033809ooi.0.2021.08.24.07.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 07:33:50 -0700 (PDT)
Received: (nullmailer pid 398737 invoked by uid 1000);
 Tue, 24 Aug 2021 14:33:49 -0000
Date: Tue, 24 Aug 2021 09:33:49 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Atish Patra <atish.patra@wdc.com>, Yash Shah <yash.shah@sifive.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Piotr Sroka <piotrs@cadence.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/6] dt-bindings: mmc: cdns: match MPFS MMC/SDHCI
 controller
Message-ID: <YSUDTSuNlsOmu/G+@robh.at.kernel.org>
References: <20210819154436.117798-1-krzysztof.kozlowski@canonical.com>
 <20210819154436.117798-2-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210819154436.117798-2-krzysztof.kozlowski@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_073353_130236_CF375F95 
X-CRM114-Status: GOOD (  15.00  )
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

On Thu, Aug 19, 2021 at 05:44:32PM +0200, Krzysztof Kozlowski wrote:
> The Microchip MPFS Icicle Kit uses Cadence SD/SDIO/eMMC Host Controller
> without any additional vendor compatible:

I think the lack of vendor compatible is the error here. Experience has 
shown that vendor specific compatibles are needed for licensed IP.

> 
>   arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dt.yaml: mmc@20008000: compatible:0: 'cdns,sd4hc' is not one of ['socionext,uniphier-sd4hc']
>   arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dt.yaml: mmc@20008000: compatible: ['cdns,sd4hc'] is too short
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml b/Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml
> index af7442f73881..0489aa92cb54 100644
> --- a/Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml
> @@ -15,9 +15,11 @@ allOf:
>  
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - socionext,uniphier-sd4hc
> +    oneOf:
> +      - items:
> +          - enum:
> +              - socionext,uniphier-sd4hc
> +          - const: cdns,sd4hc
>        - const: cdns,sd4hc
>  
>    reg:
> -- 
> 2.30.2
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
