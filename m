Return-Path: <SRS0=EtLq=FE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC2FEC64E7B
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Nov 2020 16:40:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47616206F9
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Nov 2020 16:40:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SA2Z2ub2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47616206F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=t/gwofNUSadcGm2aBof6nNrS1mjfE26il6PR+2SC0Fs=; b=SA2Z2ub2KDmBJ8DY45BLOE6HY
	58qZIVNu+zXKzq/znFzapIeadBY2BoR6+k3iAZ6P66AHbc0OsxL8C22MJhTrY/VuMzWw5iyOaGrzW
	Hd86ApTaU6QarAvA2ksFkh3sw6JpNrJea9lG3rQtmQkVGMWVXXQki6GHGcNlOH+Z8T2cTwvvwhE8w
	jXjEpvsNryKVl2sYmsL9m4D+z65MYcLuH3PsAOe0sfJfUqn/uBCW405TjRgtmQfBV59p+I/K5LPdh
	7jJgDa5toNzDkweympSaSdBakPPdr3SF2US/+qQ/FfiW13JJSKMQM0ir2LY147FXKLNUpw9M5zUcv
	6epB0G9nw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjmDn-0004V1-6f; Mon, 30 Nov 2020 16:40:15 +0000
Received: from mail-il1-f196.google.com ([209.85.166.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjmDk-0004U1-TR
 for linux-riscv@lists.infradead.org; Mon, 30 Nov 2020 16:40:13 +0000
Received: by mail-il1-f196.google.com with SMTP id y9so11905181ilb.0
 for <linux-riscv@lists.infradead.org>; Mon, 30 Nov 2020 08:40:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bAYc28O40kbetv9cXus2ITFmscdZF+ewqzJQFnlg8NE=;
 b=GH0plwT/8Ku+BM2HnzNf1f6X9737WEVGWplIblENB+YPEZw0rqnT2JUoYfbn0GiY07
 D+M3U3pbPK2eGh70zEQCNfSnVawfJ4AMIeIbXK6vCWXWuzY9c07JIw7KfTqEFdnAMUFv
 LUhFPmHgJ05HhzAqMzJUu3aGz3Rds9DP+1nIbiQ2xHmaNpnK2yLMN1oUNCZMNJVl1G4Z
 t+bOcp5cumHJdXn8HLurpTmP/dVaSEh0mj3Sr1r1Qn92L/3JL23c6XTrnPXuy72yNKDY
 nx23/pLrvR0pEJqp1dSyj5R5WZZlZGScw1RLN2oqL8wsZ0xgIoMdnO8PAxk5wB9+Vhva
 8h0w==
X-Gm-Message-State: AOAM533wWju2KNRNee9f3gpCbcU6HqPimgD+3bmHGko/Y7+KnVP6K4je
 wWRu6eSnxoxLiNV92DzWRu3p9vgRiw==
X-Google-Smtp-Source: ABdhPJxRWZfczSYCVHlAHpdcSkC/qm5wJX03gIby4IS304rXTN1z3EjI2USfEgJ9eEXADu3AgXzv6g==
X-Received: by 2002:a92:c887:: with SMTP id w7mr18648555ilo.277.1606754411806; 
 Mon, 30 Nov 2020 08:40:11 -0800 (PST)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id u1sm11192110ilb.74.2020.11.30.08.40.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 08:40:11 -0800 (PST)
Received: (nullmailer pid 2594996 invoked by uid 1000);
 Mon, 30 Nov 2020 16:40:09 -0000
Date: Mon, 30 Nov 2020 09:40:09 -0700
From: Rob Herring <robh@kernel.org>
To: Damien Le Moal <damien.lemoal@wdc.com>
Subject: Re: [PATCH v2 10/21] dt-binding: Document canaan, k210-sysctl bindings
Message-ID: <20201130164009.GA2593992@robh.at.kernel.org>
References: <20201124043728.199852-1-damien.lemoal@wdc.com>
 <20201124043728.199852-11-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124043728.199852-11-damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_114013_021927_614AEDC5 
X-CRM114-Status: GOOD (  13.68  )
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

On Tue, 24 Nov 2020 13:37:17 +0900, Damien Le Moal wrote:
> Document the device tree bindings of the Canaan Kendryte K210 SoC
> system controller driver in
> Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml.
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  .../bindings/mfd/canaan,k210-sysctl.yaml      | 116 ++++++++++++++++++
>  1 file changed, 116 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/clock/canaan,k210-clk.yaml'
xargs: dt-doc-validate: exited with status 255; aborting
make[1]: *** [Documentation/devicetree/bindings/Makefile:59: Documentation/devicetree/bindings/processed-schema-examples.json] Error 124
make: *** [Makefile:1364: dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1405243

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
