Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B054BC77B7D
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 06:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PdT4Ql/pmoLq1afxSnxpKg+i7mfOPxAEx4iodk1GrCw=; b=VTEJXQQsCovmZ/
	QqRCEpOiLuWxQtVSoIG1pp2hSve2Zc1Br2wJfvPeQrqYfsIc8Frij+Fba+DUVfyYIDUvw0PvsHvCW
	9HfvZX6qUu9oxqX5N+p8VKEcGPB/JAdhnZMojth7ssSD1mbNMaKVZtc14xzt0AzJ2m8xT0Y+qvBL3
	J8XJ8iGEgTCKVGa3qsUgb/irFyjks59tske6R9EglHkr6FMEKUNvxcIJFNXQqEJVesuCy/2ZV3B9a
	WG9LcVJbpFMydCiT5wSXw1wqtuSttrJlfurLZ8Xhe2dKm6EHWv2Ypa307RLCWltEPxn1s5JWs/EIb
	w4jTTLp4yQ4rx0rHiYXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyRbv-0017YU-28;
	Mon, 15 May 2023 06:23:07 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyRbs-0017Wa-0d
	for linux-riscv@lists.infradead.org;
	Mon, 15 May 2023 06:23:05 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-50b8d2eed3dso18571360a12.0
        for <linux-riscv@lists.infradead.org>; Sun, 14 May 2023 23:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684131780; x=1686723780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s7mkOa7RGOem2p2FaaquTYyaUy5EE4ipdPRCvshSlyQ=;
        b=tbnef+kOmfZW51v+VNLQOSV4rx0+Ic5xV6exhELIbvUKRc/eu3CdhPMnLF0QRpaLPR
         b6BuYGsYuiW5TaqV6sdpYB0NlKFcQBvRceEPAIL4EbxTKvmTOGod5sZoZfGlKBIN9Yag
         elk/zHRDMqYWldbnPJwKb6auScsj9622DBxQws2SXDJHDZ0E0DE8tRrZmnzGPT5po3Qh
         BnhVgwkR7uMCOvPV5D2Oy/x4yUSBVqhLtCP/KF/qJ9y3v3QUkyScOkGHg4tzM2EZIx2+
         XydmRp8rwX2xV0jKBUEyajSS2uQMQj3uHteOj9ZdDpGP1WA0kXc9KSrwZ4TBVn9Worfg
         qyEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684131780; x=1686723780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7mkOa7RGOem2p2FaaquTYyaUy5EE4ipdPRCvshSlyQ=;
        b=jWLyO2NOLDRJi/NJHAeqq3VeQSolLWUkWKAqEUnJxuSKwnti/eSzShhtUS+4my2Mh5
         wStedt2/DeIXs/Lb2br/sdEDfeqbLEiWKo2w0u7S2wvjiaxJSVSZN/De53CY2XLzBT7W
         cdonw5nbQH/LbI+GmcgxPVigdLlfwurpFjkZDJvb8ONJuSHeK7EYqM/xhQgh5N+ldTP4
         EexSfi56IV06eOUUMxKVFgp7nw1HEilq6B7o13mVi3Bw+5V1XS8e8OYqNB6nDpBaK9Z3
         ejjt+S7YWCiKcbvnI+52Pq0r6oOJa4PIB2cLzCkT7s2HcC+npbd1sO+r9jfvq1J9HSuu
         w6+A==
X-Gm-Message-State: AC+VfDwY/1zbvC1iMU2BtJ4D6kIxvVyOa1ni12G+emH1GfTucwt9jDtC
	pBZVgCk6W5jWrTfgmhFHuafBTw==
X-Google-Smtp-Source: ACHHUZ493IcGLkpWFXY2aFpoX+MXDo+VhdhEdKZ5LMwrRSbVU98BaRHoVr2JBOCbMqRUPpa1vkUjYA==
X-Received: by 2002:a17:906:fd83:b0:94a:845c:3529 with SMTP id xa3-20020a170906fd8300b0094a845c3529mr27604916ejb.9.1684131779897;
        Sun, 14 May 2023 23:22:59 -0700 (PDT)
Received: from krzk-bin ([2a02:810d:15c0:828:6470:25b8:7c2d:1992])
        by smtp.gmail.com with ESMTPSA id ks16-20020a170906f85000b00947740a4373sm8872377ejb.81.2023.05.14.23.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 23:22:59 -0700 (PDT)
Date: Mon, 15 May 2023 08:22:57 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Yangtao Li <frank.li@vivo.com>
Subject: Re: [PATCH 1/3] dt-bindings: clock: Add thead th1520 clock
Message-ID: <20230515062257.zjwtbl4xjbzj7qdh@krzk-bin>
References: <20230515054402.27633-1-frank.li@vivo.com>
 <20230515054402.27633-2-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230515054402.27633-2-frank.li@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_232304_241867_F5F1F582 
X-CRM114-Status: GOOD (  14.97  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, sboyd@kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Wei Fu <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 15 May 2023 13:43:59 +0800, Yangtao Li wrote:
> Add devicetree binding document and related header file
> for the T-HEAD TH1520 clock.
> 
> Cc: Icenowy Zheng <uwu@icenowy.me>
> Cc: Wei Fu <wefu@redhat.com>
> Cc: Jisheng Zhang <jszhang@kernel.org>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  .../bindings/clock/thead,th1520-ccu.yaml      | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/thead,th1520-ccu.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/thead,th1520-ccu.yaml: properties:clock-names: 'const' should not be valid under {'enum': ['const', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'minimum', 'maximum', 'multipleOf', 'pattern']}
	hint: Scalar and array keywords cannot be mixed
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/thead,th1520-ccu.yaml: properties:clocks: 'const' should not be valid under {'enum': ['const', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'minimum', 'maximum', 'multipleOf', 'pattern']}
	hint: Scalar and array keywords cannot be mixed
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/thead,th1520-ccu.yaml: properties:clock-names:const: 2 is not of type 'string'
	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/thead,th1520-ccu.yaml: properties:clocks: 'oneOf' conditional failed, one must be fixed:
	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/thead,th1520-ccu.yaml: properties:clocks: 'anyOf' conditional failed, one must be fixed:
		'maxItems' is a required property
			hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
		'const' is not one of ['maxItems', 'description', 'deprecated']
			hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
		'items' is not one of ['maxItems', 'description', 'deprecated']
			hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
		Additional properties are not allowed ('const' was unexpected)
			hint: Arrays must be described with a combination of minItems/maxItems/items
		'items' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
		hint: cell array properties must define how many entries and what the entries are when there is more than one entry.
		from schema $id: http://devicetree.org/meta-schemas/clocks.yaml#
	'const' is not one of ['type', 'description', 'dependencies', 'dependentRequired', 'dependentSchemas', 'properties', 'patternProperties', 'additionalProperties', 'unevaluatedProperties', 'deprecated', 'required', 'not', 'allOf', 'anyOf', 'oneOf', '$ref']
	'items' is not one of ['type', 'description', 'dependencies', 'dependentRequired', 'dependentSchemas', 'properties', 'patternProperties', 'additionalProperties', 'unevaluatedProperties', 'deprecated', 'required', 'not', 'allOf', 'anyOf', 'oneOf', '$ref']
	'type' is a required property
		hint: DT nodes ("object" type in schemas) can only use a subset of json-schema keywords
	from schema $id: http://devicetree.org/meta-schemas/clocks.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/thead,th1520-ccu.example.dtb: clock-controller@ffef010000: reg: [[255, 4009820160], [0, 4096]] is too long
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/thead,th1520-ccu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/thead,th1520-ccu.example.dtb: clock-controller@ffef010000: clocks:0:0: 2 was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/thead,th1520-ccu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/thead,th1520-ccu.example.dtb: clock-controller@ffef010000: clock-names:0: 'losc' is not of type 'array'
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/thead,th1520-ccu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/thead,th1520-ccu.example.dtb: clock-controller@ffef010000: clock-names: ['losc', 'hosc'] is too long
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/thead,th1520-ccu.yaml

See https://patchwork.ozlabs.org/patch/1781099

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
