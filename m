Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D5A9C77B7C
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Apr 2023 12:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f5zrR5a9alNcsL481C9fG31Dq1w4MKKlfRrvD4vaDC0=; b=tAi208jkedyNvV
	CMViJ+8O991F/wxDdhDCJt6VIQBEXAtVAihlBuUmtmiQeLxquYRGX8beYhaZCtl40je6yVekEC0C5
	UOw5NK1qeeOfHoAmbZP5ShYKJBJPDOvyw5OLdH5b4ECoqPFs4UJdl782vDlJxVdVd1pYSWbJFfrGH
	EdqkzLt6xVK1tCO3/7Bula9anENGsFUty47prZRDAabqQHUBhdtLbNtzeHGdKol2dM9UN2z17c+JV
	SjxEmo4VLpJO95CrVvByEji4NNzhCYiyfxWPpDu2+ccvo54jTvOI7FAyTFdHX1Yp/QOcAMPoCFGIA
	PDFOv5Fmh1OpdzVgSxQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnIfy-009XZj-2r;
	Fri, 14 Apr 2023 12:37:15 +0000
Received: from mail-oa1-f53.google.com ([209.85.160.53])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnIfu-009XYJ-2j
	for linux-riscv@lists.infradead.org;
	Fri, 14 Apr 2023 12:37:13 +0000
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1842cddca49so21928148fac.1
        for <linux-riscv@lists.infradead.org>; Fri, 14 Apr 2023 05:37:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681475828; x=1684067828;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZwurFSObnee2kpIi6/Arxgkud3I9gBHLAMsi3ZlNypU=;
        b=FIA/j6ts64Ur9qwdLAAA7mYKKhmwUqmlmApvD9bhfov1C2rcJYPIg74bSGR7XC0byX
         aYbzYfSnVR2ZmJ89V+zad1fobfeWrUupCKymqGXJzkDDJiTcTNjW4Jw3tF+1WFAMTQDK
         h0qnuOtm7SClTEer6+ALLy633oxCubcUHGYley7rVYryHpcqk9bxkShnFaNNHlqFIYJr
         hgV8FQC5FNaAQhrYaingYpYdFrnq2xD8a1ddbmuwdd8+xRVNfhct/PZNGFwKiEfT5UM1
         bRS7NFuFGLfX4XbhJJ0tL9QtXb//yzK3wL2ttvIpPJDIpZ58z/wbNAwp2FrLmirlr87p
         yRVQ==
X-Gm-Message-State: AAQBX9ehRDUOwxSs7U/cjuYM34LMOv1E9ZcFHfntNwAgkwoSypFbU+Mp
	GZuSIqy9zfuDnIFIBVQhDg==
X-Google-Smtp-Source: AKy350bVVmrhvY61XM75nFRu62Wrf4ZG7s1mswZusecno/1qzJvuME7mfnOdLBD20yqZBjNKf+Kakw==
X-Received: by 2002:a05:6870:b253:b0:187:8f41:9971 with SMTP id b19-20020a056870b25300b001878f419971mr3824889oam.34.1681475827712;
        Fri, 14 Apr 2023 05:37:07 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id w18-20020a056870431200b0018045663fc5sm1712632oah.48.2023.04.14.05.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 05:37:06 -0700 (PDT)
Received: (nullmailer pid 3600809 invoked by uid 1000);
	Fri, 14 Apr 2023 12:37:05 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <paul.walmsley@sifive.com>, Philipp Zabel <p.zabel@pengutronix.de>, Hal Feng <hal.feng@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>, William Qiu <william.qiu@starfivetech.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-clk@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <20230414024157.53203-6-xingyu.wu@starfivetech.com>
References: <20230414024157.53203-1-xingyu.wu@starfivetech.com>
 <20230414024157.53203-6-xingyu.wu@starfivetech.com>
Message-Id: <168147484896.3576391.17289619505417988717.robh@kernel.org>
Subject: Re: [PATCH v3 5/7] dt-bindings: soc: starfive: Add StarFive syscon
 module
Date: Fri, 14 Apr 2023 07:37:05 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_053710_908978_032F382F 
X-CRM114-Status: GOOD (  10.75  )
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


On Fri, 14 Apr 2023 10:41:55 +0800, Xingyu Wu wrote:
> From: William Qiu <william.qiu@starfivetech.com>
> 
> Add documentation to describe StarFive System Controller Registers.
> 
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> ---
>  .../soc/starfive/starfive,jh7110-syscon.yaml  | 58 +++++++++++++++++++
>  MAINTAINERS                                   |  6 ++
>  2 files changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/clock/starfive,jh7110-pll.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230414024157.53203-6-xingyu.wu@starfivetech.com

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
