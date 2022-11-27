Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E7BC43217
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Nov 2022 16:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YRpyFiY6ODzDmlzSeox3A2NoihyZU4qNFw6YBo86+Jc=; b=S6172mvJ5w1OEB
	mMiiT9FkwH2iKx0g1zHivj+8J5j2LTR62q5uZ3hXJYbN6eOcG8iGR4nJBGCTRzUdiWDoVNu1FEypj
	us6b+VDFtTsEs5K/9iyKBbif6gMm2/W9hdgIxn8DGwhZZgYKNqN+dOEtrPTLbrHytqTwQgbcPh4Fu
	iFSZ904YqT6OHfIFIAFPMLrS4K9NFk8/7cvg42JiwPDB/IP07HQR9JqXMVMNUBPRNUdpkuctlScg4
	xeQ064cNVHSDGQuZM8DiFkW6wdZEOWRrt8kMFUCCM+GVdoWVAELwF4F/SlUl/AkzO2NR05et8fuE3
	Ug6zdLD7Ylk9e4IksUrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozKTR-00CHeg-Bw; Sun, 27 Nov 2022 16:25:45 +0000
Received: from mail-io1-f42.google.com ([209.85.166.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozKTI-00CHb4-9h
	for linux-riscv@lists.infradead.org; Sun, 27 Nov 2022 16:25:37 +0000
Received: by mail-io1-f42.google.com with SMTP id q21so6093147iod.4
        for <linux-riscv@lists.infradead.org>; Sun, 27 Nov 2022 08:25:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4iphqB3V3njdrZMtNw34CrJe3N2iDEl+tDNQa/YZi+c=;
        b=aeZK9Tw5GheENRrWWd2UY08k2WZS/E2c+Yh6GI02zJ/FEV3uQSXPrIfsKC/B6RRj35
         wXlTYEpDbAHBkFU33KTC00qHRjBZF+ob+qYfL1sjJSMoYJ7XxxUaqlL8Vh4d2xEb51gp
         8EMZ9o4nKMkcU+ZQr1mxRGrm2nagofMbfKTil7qCbi7/BjJLxrvqMBR8LwFXN7CuWJw/
         5RpegTXmNVuHKrcT7KdZUm6Ri5LhoBCcrsWv9JbCUH+YliOC2t+Ih1t3hEGvaarlptzs
         PDoHT3R2C3Gz3RWlY417eZbHNwV4q5xwrfcPaNCnon9QJYLzqusrl67HBQ8pKoa5Y/bY
         ivOg==
X-Gm-Message-State: ANoB5pl6bNb/LePZFeooeN0nvvGCp82G1sGcrzdsko2Hl2tXnZ8OAUlg
	gxkIZB/aT+q77y/V2GinGJyP38XAmg==
X-Google-Smtp-Source: AA0mqf5lRxAYsVtOblQJx782nbVWv9R6LXYMbMBaqudpFkDUV0f2N191eAUEFpzjYklx5TzPd3089g==
X-Received: by 2002:a05:6638:4709:b0:389:e195:e8fb with SMTP id cs9-20020a056638470900b00389e195e8fbmr214618jab.254.1669566333650;
        Sun, 27 Nov 2022 08:25:33 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:80c3:406b:3c03:158a:46b4:95c8])
        by smtp.gmail.com with ESMTPSA id z15-20020a056e02088f00b003029afc3672sm3083058ils.36.2022.11.27.08.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 08:25:32 -0800 (PST)
Received: (nullmailer pid 7242 invoked by uid 1000);
	Sun, 27 Nov 2022 16:25:30 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, linux-serial@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, =?utf-8?q?=2C?= Ilpo =?utf-8?q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Jiri Slaby <jirislaby@kernel.org>, Conor Dooley <conor@kernel.org>
In-Reply-To: <20221127132448.4034-6-jszhang@kernel.org>
References: <20221127132448.4034-1-jszhang@kernel.org>
 <20221127132448.4034-6-jszhang@kernel.org>
Message-Id: <166956617880.3839.1241284612339331336.robh@kernel.org>
Subject: Re: [PATCH v2 5/9] dt-bindings: riscv: Add bouffalolab bl808 board
 compatibles
Date: Sun, 27 Nov 2022 10:25:30 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_082536_357558_C45A381C 
X-CRM114-Status: GOOD (  12.64  )
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


On Sun, 27 Nov 2022 21:24:44 +0800, Jisheng Zhang wrote:
> Several SoMs and boards are available that feature the Bouffalolab
> bl808 SoC. Document the compatible strings.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  .../bindings/riscv/bouffalolab.yaml           | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/bouffalolab.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/riscv/bouffalolab.yaml:20:36: [error] syntax error: mapping values are not allowed here (syntax)

dtschema/dtc warnings/errors:
make[1]: *** Deleting file 'Documentation/devicetree/bindings/riscv/bouffalolab.example.dts'
Documentation/devicetree/bindings/riscv/bouffalolab.yaml:20:36: mapping values are not allowed in this context
make[1]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/riscv/bouffalolab.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/riscv/bouffalolab.yaml:20:36: mapping values are not allowed in this context
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/riscv/bouffalolab.yaml: ignoring, error parsing file
make: *** [Makefile:1492: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221127132448.4034-6-jszhang@kernel.org

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
