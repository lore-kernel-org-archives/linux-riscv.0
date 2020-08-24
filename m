Return-Path: <SRS0=MOMo=CC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 038F4C433DF
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Aug 2020 17:36:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEEEB2067C
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Aug 2020 17:36:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fvzGwIyT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEEEB2067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KiSwlK0tA7AmpY/+0Cb79g/e94LtjG4NAJJPLWY37ZU=; b=fvzGwIyTReYPJjoh62f0q2Xjg
	0y2tY5lxdVD2xoxGQXviFDHgeFOGg7Ul46jYUczgG0HXFrxiWREMdVtQ/4OzOw1cKN0wT1lEqOZu/
	9iJ/WhXakE+Bmaq6qdNu4nuGShnd2aU3QoFPG2X9z8UB4jH9zeyXIys0O1eHOq3xyJsZD89lTYSux
	zIxh7IPDpoSpNrzgBZ9Z2lxLM+jKmoVhyPTEGosm920gsqgwGzytVQK/KqBwbKLBxYrxBMVnnOJI0
	5Ztr6qq4Dkv14TUZTs7uHnXxfxOD5jrNHyPQyWDJVXt2CMQNARwq6hy1VNtgVwfvDA0BluzDIFz8c
	RowTqkqnA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAGNo-0000FV-7D; Mon, 24 Aug 2020 17:35:48 +0000
Received: from mail-il1-f195.google.com ([209.85.166.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAGNl-0000Dv-3N
 for linux-riscv@lists.infradead.org; Mon, 24 Aug 2020 17:35:46 +0000
Received: by mail-il1-f195.google.com with SMTP id q14so7998330ilj.8
 for <linux-riscv@lists.infradead.org>; Mon, 24 Aug 2020 10:35:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RvtZJRVLDDkAIrUgbsaYYYpc0rnswzQQW7bcfytrw2k=;
 b=g8DBG0hFE3ohnyHClS91BVuJ2yGf9RK2o32CS2LugAInWQo4OJNI5GBJVbd1G9StsF
 C+3p8oJyNk8wAcTFJ7tKxA0teFtUlIZVqKPVKpPg2XFV8sMBzOYd/k2ozu8QFXdOceyU
 VNprN9tquFdAUsLzdICJmah0DDemc3skUvZ/YAsOTq/8VP0oESkRZGkVSwVg/MVIVMKR
 LPlR+COPj9FQKUQXWEuo+TbUbP3Yhs8NT2d2RSWusP89lGb/uwCrYejmhATl+HdS/tnm
 EsIUQjniiKOePUVJZH8WVvfEt0duTHNP3JNPoifizvkX2spdtZNzK66ha6kYI4+Hp31c
 fRWQ==
X-Gm-Message-State: AOAM530PmVE/PghOvrl//k9ACtE9hxZtMUAwIKooXOxrprKxVoLmV+jE
 cP5B1gYLraoIHO96Ld124g==
X-Google-Smtp-Source: ABdhPJx3PuEeH9ZUnf9J9dEAAzUONc8w1DwyS3NKEIgjuNlhebcqOFLr3iHJXgxxkvBQXG3pOmyM1g==
X-Received: by 2002:a92:7b10:: with SMTP id w16mr5453892ilc.92.1598290542423; 
 Mon, 24 Aug 2020 10:35:42 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id p21sm7100806ioj.10.2020.08.24.10.35.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 10:35:41 -0700 (PDT)
Received: (nullmailer pid 2943902 invoked by uid 1000);
 Mon, 24 Aug 2020 17:35:39 -0000
Date: Mon, 24 Aug 2020 11:35:39 -0600
From: Rob Herring <robh@kernel.org>
To: Sagar Kadam <sagar.kadam@sifive.com>
Subject: Re: [PATCH 1/1] dt-bindings: riscv: sifive-l2-cache: convert
 bindings to json-schema
Message-ID: <20200824173539.GA2939042@bogus>
References: <1598255421-8274-1-git-send-email-sagar.kadam@sifive.com>
 <1598255421-8274-2-git-send-email-sagar.kadam@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1598255421-8274-2-git-send-email-sagar.kadam@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_133545_196421_3AC519F6 
X-CRM114-Status: GOOD (  10.91  )
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
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org, yash.shah@sifive.com, robh+dt@kernel.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 24 Aug 2020 13:20:21 +0530, Sagar Kadam wrote:
> Convert the device tree bindings for the SiFive's FU540-C000 SoC's L2 Cache
> controller to YAML format.
> 
> Signed-off-by: Sagar Kadam <sagar.kadam@sifive.com>
> ---
>  .../devicetree/bindings/riscv/sifive-l2-cache.txt  | 51 ------------
>  .../devicetree/bindings/riscv/sifive-l2-cache.yaml | 93 ++++++++++++++++++++++
>  2 files changed, 93 insertions(+), 51 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt
>  create mode 100644 Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dt.yaml: l2-cache: $nodename:0: 'l2-cache' does not match '^(cache-controller|cpu)(@[0-9a-f,]+)*$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dt.yaml: l2-cache: compatible:0: 'cache' is not one of ['sifive,fu540-c000-ccache']
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dt.yaml: l2-cache: compatible: ['cache'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dt.yaml: l2-cache: 'l3-cache' does not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dt.yaml: l2-cache: 'cache-block-size' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dt.yaml: l2-cache: 'cache-level' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dt.yaml: l2-cache: 'cache-sets' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dt.yaml: l2-cache: 'cache-size' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dt.yaml: l2-cache: 'cache-unified' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dt.yaml: l2-cache: 'reg' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dt.yaml: l2-cache: {'compatible': ['cache'], 'next-level-cache': [[2]], 'phandle': [[1]], 'l3-cache': {'compatible': ['cache'], 'phandle': [[2]]}, '$nodename': ['l2-cache']} is not valid under any of the given schemas
{'$filename': '/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml',
 '$id': 'http://devicetree.org/schemas/riscv/sifive-l2-cache.yaml#',
 '$schema': 'http://devicetree.org/meta-schemas/core.yaml#',
 '$select_validator': <jsonschema.validators.create.<locals>.Validator object at 0x7efcd84bc850>,
 'additionalProperties': False,
 'allOf': [{'$ref': '/schemas/cache-controller.yaml#'}],
 'oneOf': [{'required': ['interrupts']},
           {'required': ['interrupts-extended']}],
 'patternProperties': {'pinctrl-[0-9]+': True},
 'properties': {'$nodename': True,
                'cache-block-size': {'additionalItems': False,
                                     'items': [{'additionalItems': False,
                                                'items': [{'const': 64}],
                                                'maxItems': 1,
                                                'minItems': 1,
                                                'type': 'array'}],
                                     'maxItems': 1,
                                     'minItems': 1,
                                     'type': 'array'},
                'cache-level': {'additionalItems': False,
                                'items': [{'additionalItems': False,
                                           'items': [{'const': 2}],
                                           'maxItems': 1,
                                           'minItems': 1,
                                           'type': 'array'}],
                                'maxItems': 1,
                                'minItems': 1,
                                'type': 'array'},
                'cache-sets': {'additionalItems': False,
                               'items': [{'additionalItems': False,
                                          'items': [{'const': 1024}],
                                          'maxItems': 1,
                                          'minItems': 1,
                                          'type': 'array'}],
                               'maxItems': 1,
                               'minItems': 1,
                               'type': 'array'},
                'cache-size': {'additionalItems': False,
                               'items': [{'additionalItems': False,
                                          'items': [{'const': 2097152}],
                                          'maxItems': 1,
                                          'minItems': 1,
                                          'type': 'array'}],
                               'maxItems': 1,
                               'minItems': 1,
                               'type': 'array'},
                'cache-unified': True,
                'compatible': {'additionalItems': False,
                               'items': [{'enum': ['sifive,fu540-c000-ccache']},
                                         {'const': 'cache'}],
                               'maxItems': 2,
                               'minItems': 2,
                               'type': 'array'},
                'interrupt-parent': True,
                'interrupts': {'maxItems': 3, 'minItems': 1},
                'interrupts-extended': {'maxItems': 3, 'minItems': 1},
                'memory-region': {},
                'next-level-cache': {},
                'phandle': True,
                'pinctrl-names': True,
                'reg': {'maxItems': 1, 'minItems': 1},
                'status': True},
 'required': ['compatible',
              'cache-block-size',
              'cache-level',
              'cache-sets',
              'cache-size',
              'cache-unified',
              'reg'],
 'select': {'properties': {'compatible': {'contains': {'enum': ['cache',
                                                                'sifive,fu540-c000-ccache']}}},
            'required': ['compatible']},
 'title': 'SiFive L2 Cache Controller'} (Possible causes of the failure):
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dt.yaml: l2-cache: 'interrupts' is a required property

	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dt.yaml: l3-cache: $nodename:0: 'l3-cache' does not match '^(cache-controller|cpu)(@[0-9a-f,]+)*$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dt.yaml: l3-cache: compatible:0: 'cache' is not one of ['sifive,fu540-c000-ccache']
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dt.yaml: l3-cache: compatible: ['cache'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dt.yaml: l3-cache: 'cache-block-size' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dt.yaml: l3-cache: 'cache-level' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dt.yaml: l3-cache: 'cache-sets' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dt.yaml: l3-cache: 'cache-size' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dt.yaml: l3-cache: 'cache-unified' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dt.yaml: l3-cache: 'reg' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dt.yaml: l3-cache: {'compatible': ['cache'], 'phandle': [[2]], '$nodename': ['l3-cache']} is not valid under any of the given schemas
{'$filename': '/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml',
 '$id': 'http://devicetree.org/schemas/riscv/sifive-l2-cache.yaml#',
 '$schema': 'http://devicetree.org/meta-schemas/core.yaml#',
 '$select_validator': <jsonschema.validators.create.<locals>.Validator object at 0x7efcd84bc850>,
 'additionalProperties': False,
 'allOf': [{'$ref': '/schemas/cache-controller.yaml#'}],
 'oneOf': [{'required': ['interrupts']},
           {'required': ['interrupts-extended']}],
 'patternProperties': {'pinctrl-[0-9]+': True},
 'properties': {'$nodename': True,
                'cache-block-size': {'additionalItems': False,
                                     'items': [{'additionalItems': False,
                                                'items': [{'const': 64}],
                                                'maxItems': 1,
                                                'minItems': 1,
                                                'type': 'array'}],
                                     'maxItems': 1,
                                     'minItems': 1,
                                     'type': 'array'},
                'cache-level': {'additionalItems': False,
                                'items': [{'additionalItems': False,
                                           'items': [{'const': 2}],
                                           'maxItems': 1,
                                           'minItems': 1,
                                           'type': 'array'}],
                                'maxItems': 1,
                                'minItems': 1,
                                'type': 'array'},
                'cache-sets': {'additionalItems': False,
                               'items': [{'additionalItems': False,
                                          'items': [{'const': 1024}],
                                          'maxItems': 1,
                                          'minItems': 1,
                                          'type': 'array'}],
                               'maxItems': 1,
                               'minItems': 1,
                               'type': 'array'},
                'cache-size': {'additionalItems': False,
                               'items': [{'additionalItems': False,
                                          'items': [{'const': 2097152}],
                                          'maxItems': 1,
                                          'minItems': 1,
                                          'type': 'array'}],
                               'maxItems': 1,
                               'minItems': 1,
                               'type': 'array'},
                'cache-unified': True,
                'compatible': {'additionalItems': False,
                               'items': [{'enum': ['sifive,fu540-c000-ccache']},
                                         {'const': 'cache'}],
                               'maxItems': 2,
                               'minItems': 2,
                               'type': 'array'},
                'interrupt-parent': True,
                'interrupts': {'maxItems': 3, 'minItems': 1},
                'interrupts-extended': {'maxItems': 3, 'minItems': 1},
                'memory-region': {},
                'next-level-cache': {},
                'phandle': True,
                'pinctrl-names': True,
                'reg': {'maxItems': 1, 'minItems': 1},
                'status': True},
 'required': ['compatible',
              'cache-block-size',
              'cache-level',
              'cache-sets',
              'cache-size',
              'cache-unified',
              'reg'],
 'select': {'properties': {'compatible': {'contains': {'enum': ['cache',
                                                                'sifive,fu540-c000-ccache']}}},
            'required': ['compatible']},
 'title': 'SiFive L2 Cache Controller'} (Possible causes of the failure):
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dt.yaml: l3-cache: 'interrupts' is a required property

	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/power/renesas,rcar-sysc.example.dt.yaml: cache-controller-0: $nodename:0: 'cache-controller-0' does not match '^(cache-controller|cpu)(@[0-9a-f,]+)*$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/power/renesas,rcar-sysc.example.dt.yaml: cache-controller-0: compatible:0: 'cache' is not one of ['sifive,fu540-c000-ccache']
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/power/renesas,rcar-sysc.example.dt.yaml: cache-controller-0: compatible: ['cache'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/power/renesas,rcar-sysc.example.dt.yaml: cache-controller-0: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/power/renesas,rcar-sysc.example.dt.yaml: cache-controller-0: 'cache-block-size' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/power/renesas,rcar-sysc.example.dt.yaml: cache-controller-0: 'cache-sets' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/power/renesas,rcar-sysc.example.dt.yaml: cache-controller-0: 'cache-size' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/power/renesas,rcar-sysc.example.dt.yaml: cache-controller-0: 'reg' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/power/renesas,rcar-sysc.example.dt.yaml: cache-controller-0: {'compatible': ['cache'], 'power-domains': [[1, 12]], 'cache-unified': True, 'cache-level': [[2]], '$nodename': ['cache-controller-0']} is not valid under any of the given schemas
{'$filename': '/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml',
 '$id': 'http://devicetree.org/schemas/riscv/sifive-l2-cache.yaml#',
 '$schema': 'http://devicetree.org/meta-schemas/core.yaml#',
 '$select_validator': <jsonschema.validators.create.<locals>.Validator object at 0x7f26dd3928b0>,
 'additionalProperties': False,
 'allOf': [{'$ref': '/schemas/cache-controller.yaml#'}],
 'oneOf': [{'required': ['interrupts']},
           {'required': ['interrupts-extended']}],
 'patternProperties': {'pinctrl-[0-9]+': True},
 'properties': {'$nodename': True,
                'cache-block-size': {'additionalItems': False,
                                     'items': [{'additionalItems': False,
                                                'items': [{'const': 64}],
                                                'maxItems': 1,
                                                'minItems': 1,
                                                'type': 'array'}],
                                     'maxItems': 1,
                                     'minItems': 1,
                                     'type': 'array'},
                'cache-level': {'additionalItems': False,
                                'items': [{'additionalItems': False,
                                           'items': [{'const': 2}],
                                           'maxItems': 1,
                                           'minItems': 1,
                                           'type': 'array'}],
                                'maxItems': 1,
                                'minItems': 1,
                                'type': 'array'},
                'cache-sets': {'additionalItems': False,
                               'items': [{'additionalItems': False,
                                          'items': [{'const': 1024}],
                                          'maxItems': 1,
                                          'minItems': 1,
                                          'type': 'array'}],
                               'maxItems': 1,
                               'minItems': 1,
                               'type': 'array'},
                'cache-size': {'additionalItems': False,
                               'items': [{'additionalItems': False,
                                          'items': [{'const': 2097152}],
                                          'maxItems': 1,
                                          'minItems': 1,
                                          'type': 'array'}],
                               'maxItems': 1,
                               'minItems': 1,
                               'type': 'array'},
                'cache-unified': True,
                'compatible': {'additionalItems': False,
                               'items': [{'enum': ['sifive,fu540-c000-ccache']},
                                         {'const': 'cache'}],
                               'maxItems': 2,
                               'minItems': 2,
                               'type': 'array'},
                'interrupt-parent': True,
                'interrupts': {'maxItems': 3, 'minItems': 1},
                'interrupts-extended': {'maxItems': 3, 'minItems': 1},
                'memory-region': {},
                'next-level-cache': {},
                'phandle': True,
                'pinctrl-names': True,
                'reg': {'maxItems': 1, 'minItems': 1},
                'status': True},
 'required': ['compatible',
              'cache-block-size',
              'cache-level',
              'cache-sets',
              'cache-size',
              'cache-unified',
              'reg'],
 'select': {'properties': {'compatible': {'contains': {'enum': ['cache',
                                                                'sifive,fu540-c000-ccache']}}},
            'required': ['compatible']},
 'title': 'SiFive L2 Cache Controller'} (Possible causes of the failure):
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/power/renesas,rcar-sysc.example.dt.yaml: cache-controller-0: 'interrupts' is a required property

	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml


See https://patchwork.ozlabs.org/patch/1350111

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
