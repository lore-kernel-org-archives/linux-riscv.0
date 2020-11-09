Return-Path: <SRS0=l+yF=EP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF9D1C388F7
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 15:32:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31236206C0
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 15:32:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CQyXIkbF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31236206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kc8W5GvUIoinNOaC1jZYZkH7WsCQylRYDoJkPoLmdDU=; b=CQyXIkbFTX8p4+OHbFksdkZso
	GkFKP7XAsq6pD/9E6uzTqi0oz0GKT68B/wYEC8cV87JGZH8Upqmf4/Oai1ijZJHlUQNru/U8hB29M
	WLxspqXDPnbJ/+XsRlmi7Isp0spUZy57SvukmOVsRatFefei9rICozws+xwilwXOU1J3yg4WCIZAc
	hJsiuOq72tHh8JWbFBz+GV6XpwVjWesMcZw5n/wg7cvldSflKzncidm/BFSk2WKk50CAIM8QFOu3s
	63pitjbJWghwS4k9yuhm1gzNnsC3XJMSooeG3Yn3luOzgVg55sGEpsMLhw2aZapRCnG1QX3lwR5jZ
	mo7SNICDw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kc99U-0003ou-QR; Mon, 09 Nov 2020 15:32:16 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kc99R-0003oP-Fo
 for linux-riscv@lists.infradead.org; Mon, 09 Nov 2020 15:32:14 +0000
Received: by mail-ot1-f66.google.com with SMTP id j14so9300631ots.1
 for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2020 07:32:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=O/MhRiDM2XLsUq3m1Qal43ednQtGsrnCRzGf4Dwfv8A=;
 b=s7aFCVtg9Gbifhv4gRkwR9IMO3ebSvDYMOmOCQxY8W6Bhmc50mPZpkxsRA3CzBBp/m
 5zfTO80/+KfcE7lXSW+kf2gwV8+s9WHEGkyjT7ko0KBRk/ebmE76ERyRyGRUQxIR3rUD
 7achnTuSwLd/tDnhxDT/vH/UpY+xzteqaut2mLl7K/+cRGmHNKkU9Vim+7Y20Mu/0niX
 vJ63i/kGbaueji2cUf2QwYYEvaRU5ko3LyQRO7jNZXJCi0nJiV+DwkIij9wjuybZwo6w
 pK4N/o7OzJM6CZ7Ckp70IACxFJ0hstD3uDRHkdlgoFNoXGzutiQxG0UrJHNPYVc5u8p2
 62Gg==
X-Gm-Message-State: AOAM530p1fxXvyATlSnbA3MLoYXHCANWkG0nQVUFZlgYKypV9YHZ1pWd
 5HzrqB3hRPcxiWs/bthgluTd/MUnLg==
X-Google-Smtp-Source: ABdhPJyVDlLobHGRODhe5D+jhGh+NZj7eFU7nY/tPIVmlrM37y0bv23zcdQvuPUcKBTpMfyTSN1GOQ==
X-Received: by 2002:a9d:64c7:: with SMTP id n7mr10134080otl.137.1604935931440; 
 Mon, 09 Nov 2020 07:32:11 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id g18sm250938otp.23.2020.11.09.07.32.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 07:32:10 -0800 (PST)
Received: (nullmailer pid 1330007 invoked by uid 1000);
 Mon, 09 Nov 2020 15:32:09 -0000
Date: Mon, 9 Nov 2020 09:32:09 -0600
From: Rob Herring <robh@kernel.org>
To: Damien Le Moal <damien.lemoal@wdc.com>
Subject: Re: [PATCH 22/32] dt-binding: Document kendryte,k210-sysctl bindings
Message-ID: <20201109153209.GA1329063@bogus>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-23-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201107081420.60325-23-damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_103213_536702_8580B23F 
X-CRM114-Status: GOOD (  13.86  )
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
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Sean Anderson <seanga2@gmail.com>, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Serge Semin <fancer.lancer@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org,
 Frank Rowand <frowand.list@gmail.com>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 07 Nov 2020 17:14:10 +0900, Damien Le Moal wrote:
> Document the device tree bindings of the Kendryte K210 SoC system
> controller driver in
> Documentation/devicetree/bindings/mfd/kendryte,k210-sysctl.yaml.
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  .../bindings/mfd/kendryte,k210-sysctl.yaml    | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/kendryte,k210-sysctl.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/mfd/kendryte,k210-sysctl.yaml:23:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/kendryte,k210-sysctl.yaml: properties:clocks: 'oneOf' conditional failed, one must be fixed:
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/kendryte,k210-sysctl.yaml: properties:clocks: 'anyOf' conditional failed, one must be fixed:
		/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/kendryte,k210-sysctl.yaml: properties:clocks: 'oneOf' conditional failed, one must be fixed:
			'minItems' is not one of ['maxItems']
			'minItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'default', '$ref']
		/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/kendryte,k210-sysctl.yaml: properties:clocks: 'oneOf' conditional failed, one must be fixed:
			'items' is not one of ['maxItems']
			'items' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'default', '$ref']
		'maxItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'default', '$ref']
		1 is less than the minimum of 2
	'minItems' is not one of ['type', 'description', 'dependencies', 'properties', 'patternProperties', 'additionalProperties', 'unevaluatedProperties', 'deprecated', 'required', 'allOf', 'anyOf', 'oneOf', '$ref']
	'maxItems' is not one of ['type', 'description', 'dependencies', 'properties', 'patternProperties', 'additionalProperties', 'unevaluatedProperties', 'deprecated', 'required', 'allOf', 'anyOf', 'oneOf', '$ref']
	'items' is not one of ['type', 'description', 'dependencies', 'properties', 'patternProperties', 'additionalProperties', 'unevaluatedProperties', 'deprecated', 'required', 'allOf', 'anyOf', 'oneOf', '$ref']
	'type' is a required property
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/kendryte,k210-sysctl.yaml: ignoring, error in schema: properties: clocks
warning: no schema found in file: ./Documentation/devicetree/bindings/mfd/kendryte,k210-sysctl.yaml


See https://patchwork.ozlabs.org/patch/1396076

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
