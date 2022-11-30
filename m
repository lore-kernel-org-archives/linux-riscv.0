Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B5EC4708B
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 13:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Li/lDg58aPzb8qfy9hv7V1sr0Hu5tFJhCQaUaO/c8Ms=; b=MtFvXpoo+awSW9
	zB2Pw9wf9X90RwwkOtkWqQTZhUcg/mWwABtkJtc64JmKoE0mA92rZbGiZZTRNDcwbrft0Kt2v7uWT
	pm0D2CK6kKWwOM7XJfSfL+6yoi9527an2u5jcc8ZfIKe+Ar8eQGIX88d6gOj1sofC8S6dtLilcpqc
	pipvwZ+1UUF3YUefHh+kpk4WQRctDTfRqwrFG+jyhgkJcwJXNrg2e8nhoMX281k1EWrLB4hYqBivy
	Pd7qy6PnjkFK8EvaD6SMfOcrLI3irh8pDi2XpKtUCh0y1Ij76zCJ5JoMuQw1juAj57L/tZ7f02AgE
	t5BLurCl/cvJWraDi64Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0NR6-00GbD9-Jo; Wed, 30 Nov 2022 13:47:40 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0NR3-00GbBb-Qc
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 13:47:39 +0000
Received: by mail-ot1-f53.google.com with SMTP id p24-20020a0568301d5800b0066e6dc09be5so613551oth.8
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 05:47:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pwsp0BCLF4G1JEdG9NKeOCGZGdSktiRv5CDdT5GJHns=;
        b=1wN7zakH1vdY5dlaEOQLelyo/WYbYnuf1Da0u21W05TDQMO6dVbLEAOffxEIWHBjhO
         QF5NrtbxjiTs9XiL02TQy0vablM7DhQeFjU4L+Kp6rRrL7TD6+25vQfshJ5z/H7nevLB
         NgS5WHjsUSMIpQAmDVa/+GkmX67B0QYKpRjzDPKpHGbThYJw/a31c7PN7iOFrzhMk//x
         mi06c4nqesAcS6dVOGyMq8Akp3QL0zH7to00iEqddJzd9uzoXp2Jr/gfS99KrA4XO6JL
         kyQLa9Tnxhp7p5tg8o1asEwu/Ar3BG4WdbavR1J35UzX2ECXSQyLaWQIZOEhYFb1+fXs
         jC7A==
X-Gm-Message-State: ANoB5pmw27dd8x9A0ZsBv1J2Sbc88xZV62i+pwi9Xcsp9Z4up+f8sgIu
	9o/dwxcOPFbQPy5js1fBHg==
X-Google-Smtp-Source: AA0mqf4Iea2320DugkNny8LrmH5N7sAE+JXLN+W1/nvbJiY+HXtFU/iorCneJYuX2wvnDbjwB21NAA==
X-Received: by 2002:a05:6830:1048:b0:661:b7d1:e4dc with SMTP id b8-20020a056830104800b00661b7d1e4dcmr24091673otp.80.1669816055951;
        Wed, 30 Nov 2022 05:47:35 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id b19-20020a056870391300b00142fa439ee5sm1164346oap.39.2022.11.30.05.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 05:47:35 -0800 (PST)
Received: (nullmailer pid 1848608 invoked by uid 1000);
	Wed, 30 Nov 2022 13:47:34 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Jia Jie Ho <jiajie.ho@starfivetech.com>
Cc: linux-crypto@vger.kernel.org, linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, "David S . Miller" <davem@davemloft.net>
In-Reply-To: <20221130055214.2416888-6-jiajie.ho@starfivetech.com>
References: <20221130055214.2416888-1-jiajie.ho@starfivetech.com>
 <20221130055214.2416888-6-jiajie.ho@starfivetech.com>
Message-Id: <166981596611.1846501.537832446745968339.robh@kernel.org>
Subject:  Re: [PATCH 5/6] dt-bindings: crypto: Add bindings for Starfive crypto driver
Date: Wed, 30 Nov 2022 07:47:34 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_054737_912616_1C4BF104 
X-CRM114-Status: GOOD (  12.94  )
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


On Wed, 30 Nov 2022 13:52:13 +0800, Jia Jie Ho wrote:
> Add documentation to describe Starfive crypto
> driver bindings.
> 
> Signed-off-by: Jia Jie Ho <jiajie.ho@starfivetech.com>
> Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
> ---
>  .../bindings/crypto/starfive-crypto.yaml      | 109 ++++++++++++++++++
>  1 file changed, 109 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/crypto/starfive-crypto.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/crypto/starfive-crypto.example.dts:21:18: fatal error: dt-bindings/clock/starfive-jh7110.h: No such file or directory
   21 |         #include <dt-bindings/clock/starfive-jh7110.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:406: Documentation/devicetree/bindings/crypto/starfive-crypto.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1492: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221130055214.2416888-6-jiajie.ho@starfivetech.com

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
