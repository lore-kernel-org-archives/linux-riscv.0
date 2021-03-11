Return-Path: <SRS0=wDqN=IJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56AB1C433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Mar 2021 16:41:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D18B764F9C
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Mar 2021 16:41:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D18B764F9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:References:In-Reply-To:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2b2Ol6L6OaOBixR7akDrAqbs5vYE28QaWaODAG39wyc=; b=RKsDX25xWeoG8ZO4sx0JLcICsl
	GopBtGYi7FWSHDfDNVFYq/pyokYC5bNxwtzUZ8m0g68EknoegOFc5XRBG+FtRWzicXGeW9JzwkfAM
	bsZI9Tf7bwmiebidiqyep4doGeJzSo/dSN9UwJuP/DgNgaypUGnEyr6qT93Qij3lYlupPsABS0Xp1
	cgMcVjKwhfTjcQdIncyWQ+vSHRJoPLDgxdnoSKwwMztm70Z5xhlioThAfUPAsMqero244zzjITf6R
	dO2XnF663NdcimzP5IaTFMByTLzHdEZNgCumBp/yYNiLfxo6NGsuSYgUWlxdn8wxONOSQmwqSF/b6
	4AfV2pug==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKONP-009bK6-47; Thu, 11 Mar 2021 16:41:31 +0000
Received: from mail-il1-f182.google.com ([209.85.166.182])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKONK-009bJ9-Aq
 for linux-riscv@lists.infradead.org; Thu, 11 Mar 2021 16:41:28 +0000
Received: by mail-il1-f182.google.com with SMTP id d5so19489348iln.6
 for <linux-riscv@lists.infradead.org>; Thu, 11 Mar 2021 08:41:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=CQUA7lEsNCIZfISGDNEPQTNkkXBr5JGsY/FpaftPSxY=;
 b=gubqecY8kgsc5vYjjtlEEXTg7RewWh5BPbjejxdLqF6CLIQi7wJ88TFCEGUN1Q5HAF
 Rm7l5u755yvOGi68Ik6Hcn/t67im0InHrgMdVPhh4kneFtsrLmmnDykDS16OMNuBMoxb
 Ai2Q9oAhQSFNVVqQ5sTnk96ParRoAdb4RCBIt0cddttWryAwA2fg1yMkjY060HRAHc2d
 fo23d0UQokL3tKalrl1BbKC5Uy4XqUQqJCscfQ8wX6Jk59ArNcqUEj5Vp1awN7lEMe5O
 qlXVyUyVBTv+3+WFf9CGRqTLvDvzLjn/ON2XCKWQatQa8Hs1dDoMQxCpom7I8OjaYanI
 Bx8A==
X-Gm-Message-State: AOAM5332lRRPuRLO74umXF/gjxAyVsOOxQTDuJiiBbFmuy5Jp7/uNno4
 7q6Gvov4+EUZzaJz8CcLvQ==
X-Google-Smtp-Source: ABdhPJyi0lwoASwp6Gw1iZAwZwk3BpNQK40+2XPRSdT6ofNRjp1387XWkmBt1PpoQsvu9856sgnvDQ==
X-Received: by 2002:a92:7311:: with SMTP id o17mr7643444ilc.231.1615480884878; 
 Thu, 11 Mar 2021 08:41:24 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id d3sm1564188ilo.32.2021.03.11.08.41.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 08:41:24 -0800 (PST)
Received: (nullmailer pid 841939 invoked by uid 1000);
 Thu, 11 Mar 2021 16:41:02 -0000
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Cc: devicetree@vger.kernel.org, palmer@dabbelt.com, atish.patra@wdc.com,
 daire.mcnamara@microchip.com, anup.patel@wdc.com, aou@eecs.berkeley.edu,
 damien.lemoal@wdc.com, robh+dt@kernel.org, j.neuschaefer@gmx.net,
 cyril.jean@microchip.com, david.abdurachmanov@gmail.com,
 jassisinghbrar@gmail.com, linux-riscv@lists.infradead.org,
 paul.walmsley@sifive.com, lewis.hanly@microchip.com
In-Reply-To: <20210311113456.15686-1-conor.dooley@microchip.com>
References: <20210311113456.15686-1-conor.dooley@microchip.com>
Subject: Re: [PATCH v4 4/5] dt-bindings: add bindings for polarfire soc system
 controller
Date: Thu, 11 Mar 2021 09:41:02 -0700
Message-Id: <1615480862.550948.841938.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_164126_471164_C15331D5 
X-CRM114-Status: GOOD (  11.12  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 11 Mar 2021 11:34:56 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the MSS system controller on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  ...icrochip,polarfire-soc-sys-controller.yaml | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml: properties:allOf: [{'$ref': '/schemas/mbox/mbox-consumer.yaml#properties'}] is not of type 'object', 'boolean'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml: properties: {'enum': ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'deprecated', 'description', 'else', 'enum', 'if', 'items', 'maxItems', 'maximum', 'minItems', 'minimum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'propertyNames', 'required', 'then', 'unevaluatedProperties']} is not allowed for 'allOf'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml: ignoring, error in schema: properties: allOf
warning: no schema found in file: ./Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml

See https://patchwork.ozlabs.org/patch/1451082

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
