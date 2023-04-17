Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8312EC77B76
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Apr 2023 20:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SSOLqY1HZi5Oeu88XN814EjPl3a9Vz1yyCwiPzGdUio=; b=0/D+0/++h43GF2
	Evkqjsb7CDjxz54ahlTHQDfD9gpfurj022FeWpdFTERUq3if8HsUHAqQitNJFSRQhvrVbE2CXjxXR
	fLqUGUyNkgzsfMclekFVV4/WeuqhZalh+1bc7MmcD0N7lk6Kp6QxQDnqlAN8UWERS4kRAFwYi96YG
	8Yuver5i5Ocga77ejSO29smVDHbo13HXkRXbbGVLJFX9WZysale0DrOmBg8MOytA+V25MpCBABY0Z
	J/uD8pt6u/k3L0stzGdtT1dP3mP/C86ZOkqulnab6lNFnXjMSwqFcsOG6oRr54rZdfaZ0tL5eqb0u
	tAkgXWxnuwDkEDYYBHlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poVat-00HY6K-0n;
	Mon, 17 Apr 2023 20:36:59 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poVap-00HY5k-12
	for linux-riscv@lists.infradead.org;
	Mon, 17 Apr 2023 20:36:58 +0000
Received: by mail-ot1-f51.google.com with SMTP id k101-20020a9d19ee000000b006a14270bc7eso10397222otk.6
        for <linux-riscv@lists.infradead.org>; Mon, 17 Apr 2023 13:36:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681763813; x=1684355813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e+QAWI6HAoCLsTSrdd3iRiJoq4aMeJmCh6mY2TAkIBc=;
        b=BNaxNGzhIEzNomcOQCnXPARjAMcIKxYrKcrArJG8oisUgvjRiA5pCj11EH4STsTwZP
         NvCEG2NlI86TlZNvSyENAI7cQcdaYbu/9mMjfQtgyGGv3VVoOjJlJlLRRW8w524HuYQt
         geBM4ZQa8m0R48V04hHlCx71DsLP/vIifYKUuKfeLhVFbWCw1Zy+zQJy+oKqdL0CSADQ
         DZaETIPSuc+cBBOVKEcxpvRduY/Em1U/WF0az+LNNG4j6kGW+K4wIYUqcdhN2L5W9qwI
         dgUbcbfPOLQ7NGLljq5kyKu3FZeYTb3kV89g4VNeuL63CgagAkHvbqNaQeJ8CFHd9fGP
         KvPQ==
X-Gm-Message-State: AAQBX9cPSUJ4py0YDSoI3LAiDOsVMzD5DXgG/jGlT3dTdQXCe3lAA1Rs
	KVCz1jHPj24LP6P1I57sYg==
X-Google-Smtp-Source: AKy350ZzPROXT2PlKvU2SU951qQVWLCRSEIxLBJC/mGvKH/rXm//HY70PVAU5Zz6bI6JxxuBMbXmxw==
X-Received: by 2002:a9d:6217:0:b0:6a2:49e6:9afc with SMTP id g23-20020a9d6217000000b006a249e69afcmr7537309otj.12.1681763813076;
        Mon, 17 Apr 2023 13:36:53 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id f24-20020a9d7b58000000b006a5e0165d3esm1789231oto.19.2023.04.17.13.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 13:36:52 -0700 (PDT)
Received: (nullmailer pid 3327898 invoked by uid 1000);
	Mon, 17 Apr 2023 20:36:51 -0000
Date: Mon, 17 Apr 2023 15:36:51 -0500
From: Rob Herring <robh@kernel.org>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: William Qiu <william.qiu@starfivetech.com>, linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <paul.walmsley@sifive.com>, Philipp Zabel <p.zabel@pengutronix.de>, Hal Feng <hal.feng@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH v3 5/7] dt-bindings: soc: starfive: Add StarFive syscon
 module
Message-ID: <20230417203651.GA3319886-robh@kernel.org>
References: <20230414024157.53203-1-xingyu.wu@starfivetech.com>
 <20230414024157.53203-6-xingyu.wu@starfivetech.com>
 <168147484896.3576391.17289619505417988717.robh@kernel.org>
 <8c396a98-a76e-cd68-4d26-15ae3a15a623@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8c396a98-a76e-cd68-4d26-15ae3a15a623@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_133656_594632_920EBEE7 
X-CRM114-Status: GOOD (  24.85  )
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

On Mon, Apr 17, 2023 at 03:43:48PM +0800, Xingyu Wu wrote:
> On 2023/4/14 20:37, Rob Herring wrote:
> > 
> > On Fri, 14 Apr 2023 10:41:55 +0800, Xingyu Wu wrote:
> >> From: William Qiu <william.qiu@starfivetech.com>
> >> 
> >> Add documentation to describe StarFive System Controller Registers.
> >> 
> >> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> >> ---
> >>  .../soc/starfive/starfive,jh7110-syscon.yaml  | 58 +++++++++++++++++++
> >>  MAINTAINERS                                   |  6 ++
> >>  2 files changed, 64 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
> >> 
> > 
> > My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > ./Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/clock/starfive,jh7110-pll.yaml
> > 
> > doc reference errors (make refcheckdocs):
> > 
> > See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230414024157.53203-6-xingyu.wu@starfivetech.com
> > 
> > The base for the series is generally the latest rc1. A different dependency
> > should be noted in *this* patch.
> > 
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > date:
> > 
> > pip3 install dtschema --upgrade
> > 
> > Please check and re-submit after running the above command yourself. Note
> > that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> > your schema. However, it must be unset to test all examples with your schema.
> > 
> 
> I have updated yamllint and dtschema, and tested it and didn't see this error.
> I asked william and also didn't see this. This error says the file:
> http://devicetree.org/schemas/clock/starfive,jh7110-pll.yaml was not found.
> This file is added in patch 1 but patch 1 should be applied after these patchset
> about JH7110 basic clock drivers. I don't know if that's the reason.

Yes, patch 1 could not be applied[1].

Rob

[1] https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230414024157.53203-2-xingyu.wu@starfivetech.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
