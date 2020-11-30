Return-Path: <SRS0=EtLq=FE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F6CC63777
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Nov 2020 16:39:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45C3C206F9
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Nov 2020 16:39:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KB/GGmAV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45C3C206F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=f7fncF73V+Q8Lqezy/bkQamW4pclwb5L0VjbPnNZ9eY=; b=KB/GGmAV4zG3Gkp1/FNMcqxBw
	rUHUnQsWb0ILr3OxpbJw8+ZQtW+ywgN2ZG/Ps5YUbNkPmEYKpqvLqDPNSAa4qY4jiF0Oy+aZCU1Dz
	R5YfwbpS+ZboA93RG+g2jnEaU0a4d6Q7D+ji5jaD7S2BdRCNkKw0LrMO2z2778EWhXbgfRBTdXzkG
	NRgX/Zkdqiqvsa9wz6BJH5/0Dr1TmayxgbsbYRW1/tCYHUQbvOW+N7zAYoY4cUb/XHvARZT1iN1yR
	ar/QEiAviVzrJPaqygXvgl0QQgmrQFPodd9JMQGOKDSBlTjfPb7eoNzsBxP3kykD5Da0QQg6c7uIa
	Cz3sswjqA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjmCw-0004HV-9p; Mon, 30 Nov 2020 16:39:22 +0000
Received: from mail-il1-f193.google.com ([209.85.166.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjmCu-0004Gb-2D
 for linux-riscv@lists.infradead.org; Mon, 30 Nov 2020 16:39:21 +0000
Received: by mail-il1-f193.google.com with SMTP id v3so11896107ilo.5
 for <linux-riscv@lists.infradead.org>; Mon, 30 Nov 2020 08:39:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GxbcPm40Z/OfvA3tX+RN9PfY6ghzBrA55YxrDnO7ysY=;
 b=gh7j6tqhX604oN80pWpwrnWJd9LxhEClenH8GGiSNHr1YBY635RdVJysfxnyOwhY5r
 rEjscpXEQNORW3hxuknag5T08HC1WrsdNBpyOxvRtM3NvWQtgY+2QFN5mJpkYBg6Cr13
 F1eBB70LfPSxgqaqLhJNv8wVFbG9l8cuFH0xWOIinoEIi2TAR0RV5nYGW2kwwmVv6SWy
 aV2lzK4MZw/SXZ5qcKluazBCqDaTDjmjIfgCYfMNBK8XtjqdHVeVaHvhHE/P3hrvkZ/M
 PT5B4Wp+aIVEk3/QF5YdnE2zQDqNpudZdO0dwxFYLy+IzQAvN6alKKkJmBiaEUb3Rbk7
 jVag==
X-Gm-Message-State: AOAM532P/HyWpG6N4MPI0B/tJsjeGDMmnBuWKNtvKtw3EOm/YDyxenKQ
 aHId3Wo15BOCgfyA6vNJXw==
X-Google-Smtp-Source: ABdhPJzY9MzktBK1OkYtWSDkzwOcRYCFt2VHyLCC7bUEJXijT3EkfPx6av4RZ3T4OMflXGgu5ppcjw==
X-Received: by 2002:a92:607:: with SMTP id x7mr18906592ilg.34.1606754358863;
 Mon, 30 Nov 2020 08:39:18 -0800 (PST)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id b9sm4311464iok.20.2020.11.30.08.39.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 08:39:18 -0800 (PST)
Received: (nullmailer pid 2593543 invoked by uid 1000);
 Mon, 30 Nov 2020 16:39:15 -0000
Date: Mon, 30 Nov 2020 09:39:15 -0700
From: Rob Herring <robh@kernel.org>
To: Damien Le Moal <damien.lemoal@wdc.com>
Subject: Re: [PATCH v2 09/21] dt-bindings: Document canaan, k210-fpioa bindings
Message-ID: <20201130163915.GA2593105@robh.at.kernel.org>
References: <20201124043728.199852-1-damien.lemoal@wdc.com>
 <20201124043728.199852-10-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124043728.199852-10-damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_113920_142390_CD81609B 
X-CRM114-Status: GOOD (  15.43  )
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
 Linus Walleij <linus.walleij@linaro.org>, Sean Anderson <seanga2@gmail.com>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 24 Nov 2020 13:37:16 +0900, Damien Le Moal wrote:
> Document the device tree bindings for the Canaan Kendryte K210 SoC
> Fully Programmable IO Array (FPIOA) pinctrl driver in
> Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml. The
> new header file include/dt-bindings/pinctrl/k210-fpioa.h is added to
> define all 256 possible pin functions of the SoC IO pins, as well as
> macros simplifying the definition of pin functions in a device tree.
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  .../bindings/pinctrl/canaan,k210-fpioa.yaml   | 165 +++++++++++
>  include/dt-bindings/pinctrl/k210-fpioa.h      | 276 ++++++++++++++++++
>  2 files changed, 441 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml
>  create mode 100644 include/dt-bindings/pinctrl/k210-fpioa.h
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml:59:1: [error] syntax error: found character '\t' that cannot start any token (syntax)

dtschema/dtc warnings/errors:
Traceback (most recent call last):
  File "/usr/local/bin/dt-extract-example", line 45, in <module>
    binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 343, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 111, in get_single_data
    node = self.composer.get_single_node()
  File "_ruamel_yaml.pyx", line 706, in _ruamel_yaml.CParser.get_single_node
  File "_ruamel_yaml.pyx", line 724, in _ruamel_yaml.CParser._compose_document
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 731, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 904, in _ruamel_yaml.CParser._parse_next_event
ruamel.yaml.scanner.ScannerError: while scanning a plain scalar
  in "<unicode string>", line 58, column 11
found a tab character that violates indentation
  in "<unicode string>", line 59, column 1
make[1]: *** [Documentation/devicetree/bindings/Makefile:20: Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.example.dts] Error 1
make[1]: *** Deleting file 'Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.example.dts'
make[1]: *** Waiting for unfinished jobs....
make[1]: *** [Documentation/devicetree/bindings/Makefile:59: Documentation/devicetree/bindings/processed-schema-examples.json] Error 123
make: *** [Makefile:1364: dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1405241

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
