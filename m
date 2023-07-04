Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA88DEB64D9
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 03:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=asputSpz+UoCh2zDl2uUasYTZc/jepx060Swg05KJo4=; b=LEGC8BhS4Q8zov
	0NjpcKQby6rcekcB1smv192xx3bsFgqXrM5M56PwAPSawBe5nxLvScyu0ecds2IMNc3G4+jZuFgu6
	4GEwo+OGNQd0KU1CHfGLyYSRF27hY0I3gTeyvo5aZEUC+xRqXWlUzYrKq5qILhbmUPX4kEioaqspg
	g4b3seHQ7KUHt59M+ILmWaINjgFXf8rC2kegzdtiXEt4P5uyd93uSwWjqiS+V/XMV4v0z+2/kgEXs
	lY+sJBkBKaz4e2A+pK9bNdqZiDk32JkZCnYyIryDp5YHJsjMuJz+jPJY862OZaqrhZs6pdiu3wKlN
	kCAEoFymGIHZUhvr1e1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGX5W-00C4jP-2a;
	Tue, 04 Jul 2023 03:52:26 +0000
Received: from mail-il1-f171.google.com ([209.85.166.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGX5T-00C4iT-1N
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 03:52:24 +0000
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-34568286979so27358885ab.2
        for <linux-riscv@lists.infradead.org>; Mon, 03 Jul 2023 20:52:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688442740; x=1691034740;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IXXXDTVnhiGaQdLwuFieMKLCVwc40SyI0FbqGubyrKA=;
        b=O5qk+bTxZVMFF8C+cYsL5GAAH3FlYhl9J1/LQk5hyU/u6VmBbFOTuf817ie/drXQQi
         zz1/8HCNqWmUDrlpA5Cu2gmA53FOmwlUpuiRrFDd9eYTewrt/D68qNrZArV9Fgigh2ev
         nYuiMYVCGI5P+xtv6lc7ZdhyLg4MxVN/PR9A+7VcOOlmCs6rhN/5JjErQzlhFhW2wv3F
         77DqATbF1Ntbj5rjUbieUQi+zFNYwippc4MhLqQop9soc2C46OSJa+7SSbXXEHDZSxHR
         yeBcnOASuOlIBOZBRCXpJKtOuK97A9ugJPAnIFk2apY6VDMoBVAohDXoDjy/RBdiUIK1
         Kb2A==
X-Gm-Message-State: ABy/qLZ9NLBwlnnIDhR39bwgbI4Mv5zCXKqTiSRQLV5JUSghrGECtPUQ
	CddheoL06kEe9PjizfZa5A==
X-Google-Smtp-Source: APBJJlFisZIe/mCHVFeOU6gtwM361wCFX79fK+RHHjG0iFC8fAd+9ogQkO+uKBCPLpsfr4mdrftZCQ==
X-Received: by 2002:a92:d4c7:0:b0:345:a201:82c0 with SMTP id o7-20020a92d4c7000000b00345a20182c0mr10514925ilm.32.1688442740419;
        Mon, 03 Jul 2023 20:52:20 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id t14-20020a92c0ce000000b00345950d7e94sm6626965ilf.20.2023.07.03.20.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 20:52:19 -0700 (PDT)
Received: (nullmailer pid 800694 invoked by uid 1000);
	Tue, 04 Jul 2023 03:52:16 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, William Qiu <william.qiu@starfivetech.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Hal Feng <hal.feng@starfivetech.com>, Stephen Boyd <sboyd@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, Philipp Zabel <p.zabel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20230704020239.288500-3-xingyu.wu@starfivetech.com>
References: <20230704020239.288500-1-xingyu.wu@starfivetech.com>
 <20230704020239.288500-3-xingyu.wu@starfivetech.com>
Message-Id: <168844273679.800666.7152631195397313900.robh@kernel.org>
Subject: Re: [PATCH v6 2/7] dt-bindings: soc: starfive: Add StarFive syscon
 module
Date: Mon, 03 Jul 2023 21:52:16 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_205223_468027_53584C64 
X-CRM114-Status: GOOD (  11.70  )
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


On Tue, 04 Jul 2023 10:02:34 +0800, Xingyu Wu wrote:
> From: William Qiu <william.qiu@starfivetech.com>
> 
> Add documentation to describe StarFive System Controller Registers.
> 
> Co-developed-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> ---
>  .../soc/starfive/starfive,jh7110-syscon.yaml  | 93 +++++++++++++++++++
>  MAINTAINERS                                   |  7 ++
>  2 files changed, 100 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.example.dtb: syscon@13030000: reg: [[0, 318963712], [0, 4096]] is too long
	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.example.dtb: syscon@13030000: reg: [[0, 318963712], [0, 4096]] is too long
	from schema $id: http://devicetree.org/schemas/soc/starfive/starfive,jh7110-syscon.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.example.dtb: syscon@17010000: reg: [[0, 385941504], [0, 4096]] is too long
	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.example.dtb: syscon@17010000: reg: [[0, 385941504], [0, 4096]] is too long
	from schema $id: http://devicetree.org/schemas/soc/starfive/starfive,jh7110-syscon.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230704020239.288500-3-xingyu.wu@starfivetech.com

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
