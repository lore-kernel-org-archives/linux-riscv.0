Return-Path: <SRS0=l+yF=EP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62F85C4741F
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 15:37:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 092862074F
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 15:37:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pT4MpHPw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 092862074F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=R711J8ICibVdYoVspOCh/pnVCjdvZgyVK4cO2PcZjhs=; b=pT4MpHPwkNx59d8BFse49ZaWT
	w/Dr4ajioZiCbTZoR4gcmOEWn+3HGV60YnDXghY0JEMzOH4oqom0UQ0EVjRVnNsI2AvrN4YBrSs6G
	TuEZWOsg6X7MHiFSgtmGD852hCgBDcaYFFdMzMfGC5tRpdM9GWam0+/govwvZ4qWgt9a/gMKLOw8G
	sTrALa9WkWzq1xpATifIgK/oivX58QcnmND2G4bmcpCHPMjb3E8dJN85DbbwMA87wrSeDpyegtOCc
	SpfsqM+Z5onfR3yyCSzvk+zzHQ9DarZ2dnv9Er6kH71jrVeU7AAxGowj/sWiHpe8yGGtJZeXvTmMD
	UV6Qw6ouA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kc9EE-00044v-Vs; Mon, 09 Nov 2020 15:37:11 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kc9ED-00044a-13
 for linux-riscv@lists.infradead.org; Mon, 09 Nov 2020 15:37:10 +0000
Received: by mail-oi1-f196.google.com with SMTP id m17so10629097oie.4
 for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2020 07:37:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5slTwVhSNDVMLD7tCbB4PGMpIyRmJcLd067yqXtkj+g=;
 b=lPhSHvDpdbWniCDSkN3D6l0J2FadgH6fN35jeEud5kp8V5S1yn6keVjMBY7Ah8qxRK
 xVbod+DShLSe7cVivYSlZUExsy6nmMAvn8VYgEuaVRVqN8gvt5yFh2UXNrVeE5l9gXRP
 riQdu3LJU1j1zCgOZkt3LLpU4RK7c+fPQ2GF645kQY6jNn75ORtmWo6GxFDx/8fUZwgM
 7bG6rVz4YW97sHxOfreRWbPeXM2G5TWGSMeWfszECbymqk7bdSfj8ArFBZ4/2FebuHVb
 Mh3s9xzmBmcq88BWzBqOkOG+qcqccSOgtPFkI4n+eSEI88oMGEQohq8ud7SWZYWIAteQ
 SSlQ==
X-Gm-Message-State: AOAM532M7HEtzOaLq/7zPU3N4+MFCuyje1NJhn7TT3CoBYYHJfS/aBGO
 ta5vXHz2ahIL2sMtBf17PQ==
X-Google-Smtp-Source: ABdhPJxHInpvbaRcnyGlAnIy6yItKltYP3NNIO8viuEKZcwftEcK3bqtQnCT3XfuHU1Tvf3tE0/A/A==
X-Received: by 2002:aca:4e02:: with SMTP id c2mr9607216oib.97.1604936227723;
 Mon, 09 Nov 2020 07:37:07 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w18sm2582679otl.38.2020.11.09.07.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 07:37:07 -0800 (PST)
Received: (nullmailer pid 1335757 invoked by uid 1000);
 Mon, 09 Nov 2020 15:37:05 -0000
Date: Mon, 9 Nov 2020 09:37:05 -0600
From: Rob Herring <robh@kernel.org>
To: Damien Le Moal <damien.lemoal@wdc.com>
Subject: Re: [PATCH 25/32] dt-bindings: Document kendryte,k210-rst bindings
Message-ID: <20201109153705.GA1335181@bogus>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-26-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201107081420.60325-26-damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_103709_101469_D8A38212 
X-CRM114-Status: GOOD (  14.35  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Serge Semin <fancer.lancer@gmail.com>, Sean Anderson <seanga2@gmail.com>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Mark Brown <broonie@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org,
 linux-spi@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 07 Nov 2020 17:14:13 +0900, Damien Le Moal wrote:
> Document the device tree bindings for the Kendryte K210 SoC reset
> controller driver in
> Documentation/devicetree/bindings/reset/kendryte,k210-rst.yaml.
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  .../bindings/reset/kendryte,k210-rst.yaml     | 78 +++++++++++++++++++
>  1 file changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/kendryte,k210-rst.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/reset/kendryte,k210-rst.yaml:24:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/reset/kendryte,k210-rst.example.dts:19:18: fatal error: dt-bindings/mfd/k210-sysctl.h: No such file or directory
   19 |         #include <dt-bindings/mfd/k210-sysctl.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:342: Documentation/devicetree/bindings/reset/kendryte,k210-rst.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1364: dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1396082

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
