Return-Path: <SRS0=l+yF=EP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 050A3C2D0A3
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 15:33:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CFE3206C0
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 15:33:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FtZyINMm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CFE3206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=u+Z/5X8XzvZVV7OpFhp+GRqfX7PdbCAFiSNkff8MD8M=; b=FtZyINMmDyB1I6nm9KRiAJAFU
	8aFT4o7oWbZ7movnTlg9kKgmxR2ssRkwUty3jdhjNZDS9jzlTWwyAOPGFCfyHfqBRqjXiEHNH1C45
	wbLXz9qnWeSHqi/u3n8krRM+VscybmMzPEVBJvxjFedRcP4fLNcZTbr/Ltu2/6BHC7UYoB4HvyD0m
	/dkk3Oz5gAEC79qa0O5r6OyfMiBVZp0/alvjW0nldHtTusXD49oPWgPplklV0MNYrnUkKBCMX3YA0
	pTZKBMOexKytIBU95nIWnTnAlaFwPye+9siqz04n2GkUInfGqFJTEkkbjob5NvBSJamp0TLhTJffd
	QUgsPk3Zw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kc9A5-0003sG-JH; Mon, 09 Nov 2020 15:32:53 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kc9A3-0003rK-6I
 for linux-riscv@lists.infradead.org; Mon, 09 Nov 2020 15:32:52 +0000
Received: by mail-ot1-f68.google.com with SMTP id n15so9288362otl.8
 for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2020 07:32:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Tw75G9a7V25EA3GXaIvjRHeBvH+Ysq7ymdHrpXMTU6I=;
 b=twyON7MP4GL2hq8sxo4dgQ4sKTrhF9otA97M37jQRM4y0zdjGeOPhFwPF3c5Jt4/X0
 iLXg5Znpn9LaJz1wpCPCEqKfmO8w3a1n2t/gg1EUOw7CUaGUKakN2fF6yXeQhEDKx/kB
 c1SM1vz8L6qg1Qq0FsvRfkgPfdQ/lff+VDhx7z6uRZJQNvUGgbAcjUCp1YlDIDxnTIQk
 D0UUZPqJV1kvxFF2UvtQMhINqfCjvWfVCfW6klzFAQxfLDQTyxRkSbYvdoO5S5+/kaeu
 DbK3UAnYuSUwnSNd8BSU9WdABLVN/DSSnkAkKsbPtXSvoFO6fCHVbEynMDrQU4YlMJxU
 ylJA==
X-Gm-Message-State: AOAM531LFMQsJKlJEBnQnarn+XARrbf9exJwbpALTB/Nw9t+nUvWrUuX
 VzZzuHnN9agpLaAMUv8ugw==
X-Google-Smtp-Source: ABdhPJwRiGrW+JjelyJhHBUlKu/+vl1LLGAK0xrUOMfZH4tQcVRAHs7VgoszCBsOt+we9xJQtMI+Tg==
X-Received: by 2002:a9d:f67:: with SMTP id 94mr11068345ott.282.1604935965006; 
 Mon, 09 Nov 2020 07:32:45 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e15sm1135751otj.43.2020.11.09.07.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 07:32:44 -0800 (PST)
Received: (nullmailer pid 1330824 invoked by uid 1000);
 Mon, 09 Nov 2020 15:32:43 -0000
Date: Mon, 9 Nov 2020 09:32:43 -0600
From: Rob Herring <robh@kernel.org>
To: Damien Le Moal <damien.lemoal@wdc.com>
Subject: Re: [PATCH 24/32] dt-bindings: Document kendryte,k210-fpioa bindings
Message-ID: <20201109153243.GA1330401@bogus>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-25-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201107081420.60325-25-damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_103251_256075_86260D25 
X-CRM114-Status: GOOD (  14.36  )
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
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Mark Brown <broonie@kernel.org>,
 Serge Semin <fancer.lancer@gmail.com>, linux-spi@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-riscv@lists.infradead.org, Sean Anderson <seanga2@gmail.com>,
 Frank Rowand <frowand.list@gmail.com>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 07 Nov 2020 17:14:12 +0900, Damien Le Moal wrote:
> Document the device tree bindings for the Kendryte K210 SoC Fully
> Programmable IO Array (FPIOA) pinctrl driver in
> Documentation/devicetree/bindings/pinctrl/kendryte,k210-fpioa.yaml
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  .../bindings/pinctrl/kendryte,k210-fpioa.yaml | 106 ++++++++++++++++++
>  1 file changed, 106 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/kendryte,k210-fpioa.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/kendryte,k210-fpioa.yaml: properties:clocks:minItems: False schema does not allow 2
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/kendryte,k210-fpioa.yaml: properties:clocks:maxItems: False schema does not allow 2
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/kendryte,k210-fpioa.yaml: properties:clock-names:minItems: False schema does not allow 2
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/kendryte,k210-fpioa.yaml: properties:clock-names:maxItems: False schema does not allow 2
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/kendryte,k210-fpioa.yaml: ignoring, error in schema: properties: clocks: minItems
warning: no schema found in file: ./Documentation/devicetree/bindings/pinctrl/kendryte,k210-fpioa.yaml
Documentation/devicetree/bindings/pinctrl/kendryte,k210-fpioa.example.dts:19:18: fatal error: dt-bindings/pinctrl/k210-pinctrl.h: No such file or directory
   19 |         #include <dt-bindings/pinctrl/k210-pinctrl.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:342: Documentation/devicetree/bindings/pinctrl/kendryte,k210-fpioa.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1364: dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1396081

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
