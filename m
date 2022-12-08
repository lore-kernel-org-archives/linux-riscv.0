Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E49DC3A5A7
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 13:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AsLir8q8rXHGrVcwzB8ohB7sh2t1FJimjP9K+d0qi68=; b=4JhoD0Gb3rIlMc
	0+Jql+g+s45gpRpLQ9YNlWSH4avVqK5eu+iD8SOWmlY8mZQBA+HUXMKnHZCEkxHYuWJQf4++ADijA
	4TKHuR8gBsGI3ZdF+jQhMDET7Es5hRvAa8WMtzawJGsRnE/N7eBtJqOCaUeJh88XY1vb5/gbsQ9Pg
	LKWUgVAFEBCfJeeNdDJVcdeKXMh5CKMr/XaKGu1u8awKyrHIoFkcim+00BoRjmRjjF4irSIjA8xSk
	odZfyg+R2kZkSMUp2BY3j0AHIiubDI3fWrVoOlPIxPqRYClo8LKcGHxNnHXDN4Z02KyzSTC5HRyGP
	cO4SaBCaqL3BeNBpNK6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3H08-000pf2-UU; Thu, 08 Dec 2022 13:31:48 +0000
Received: from mail-oa1-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3H06-000pdA-6h
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 13:31:47 +0000
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-14455716674so1819719fac.7
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 05:31:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wdryjHBfKth8/hD6fCw95fsa+h8Ry8TUfw1B23x19eA=;
        b=mT6J8tozgiyte8PKyBgAKJmKzv33W+Bmk8xd53Mx41om0vt+bODLD+fykOXbmSdB/H
         rHZQgphWFgSetDVhu9HfQTPTD49JP5Ohdl7TvKVPdUnuhjTJPVLEFuS6wX4xFZhC31kG
         JB3VnBjEZJuEhhgIWKemrOXHRfcmD13VU5yMLt5Cx8Z7KKG35vH4QlqoKitB7cVpnh39
         OVuqw91is4d5HIO6YBreeF5M7/YeGYKGa4+H6SJahR47EuiEayGPQ0CDdUVofBdxo9od
         9rfBZm8hnaD/Z+Tjqzit1gIewPbgcol+6MWt9YrtiHAMfc8XR3+rG4m3acp2GM6mnUPo
         A+gg==
X-Gm-Message-State: ANoB5pmqV0AHawmKx9PE3guCBriECtAJk9i7cY8CUNSffxJPjaskETAw
	k4yEyaENLQWoPzJRbaoQaA==
X-Google-Smtp-Source: AA0mqf5jYIx6OuCiREELp2iTWD6/DFP6YpGy19CgJhpulghI/ol7bDHOxjgZBOg0u/Ao9SYOXOztYA==
X-Received: by 2002:a05:6870:1696:b0:144:7a85:63ea with SMTP id j22-20020a056870169600b001447a8563eamr1404205oae.23.1670506301925;
        Thu, 08 Dec 2022 05:31:41 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id g13-20020a056870c14d00b001375188dae9sm13560046oad.16.2022.12.08.05.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 05:31:41 -0800 (PST)
Received: (nullmailer pid 539976 invoked by uid 1000);
	Thu, 08 Dec 2022 13:31:40 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Walker Chen <walker.chen@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-pm@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Emil Renner Berthing <emil.renner.berthing@canonical.com>, "Rafael J . Wysocki" <rafael@kernel.org>
In-Reply-To: <20221208084523.9733-2-walker.chen@starfivetech.com>
References: <20221208084523.9733-1-walker.chen@starfivetech.com>
 <20221208084523.9733-2-walker.chen@starfivetech.com>
Message-Id: <167050594063.531467.3185697679617153248.robh@kernel.org>
Subject: Re: [RESEND PATCH v2 1/3] dt-bindings: power: Add starfive,jh71xx-pmu
Date: Thu, 08 Dec 2022 07:31:40 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_053146_274885_C131DE98 
X-CRM114-Status: GOOD (  10.48  )
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


On Thu, 08 Dec 2022 16:45:21 +0800, Walker Chen wrote:
> Add bindings for Power Management Unit (PMU) on the StarFive JH71XX SoC.
> 
> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
> ---
>  .../bindings/power/starfive,jh71xx-pmu.yaml   | 45 +++++++++++++++++++
>  .../dt-bindings/power/starfive,jh7110-pmu.h   | 17 +++++++
>  2 files changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/starfive,jh71xx-pmu.yaml
>  create mode 100644 include/dt-bindings/power/starfive,jh7110-pmu.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/power/starfive,jh71xx-pmu.yaml:18:7: [warning] wrong indentation: expected 4 but found 6 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/power/starfive,jh71xx-pmu.yaml: properties:compatible: [{'enum': ['starfive,jh7110-pmu']}] is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/power/starfive,jh71xx-pmu.yaml: ignoring, error in schema: properties: compatible
Documentation/devicetree/bindings/power/starfive,jh71xx-pmu.example.dtb:0:0: /example-0/power-controller@17030000: failed to match any schema with compatible: ['starfive,jh7110-pmu']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221208084523.9733-2-walker.chen@starfivetech.com

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
