Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE0B8EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 10:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DH2Wc/jVk65n9k7OAys5EAgxOP6Fu+Tj9GR58Iv1d10=; b=MHo6/huUWZ6dgA
	glqLVMON9xoEElBsk3QmFzsOljvFX/sZ2vI2FG1EFol5AVuL+jaolq0QfRjiro0+RWGEvWFspPUPk
	J0CKbQWxB4CaoW0/kHRjkc+4pw88Cysi1VcRfcaM4ngiaWDo6usz/88XltzylwhjH0KbKgi+0knMa
	+WMap9x5Gz+j4PPxgO1MDZag+ZcEXPGz7tQTbr6IG6cEgvMIG0vL9LQCdduCvt9gGx9x4XpWSTbxR
	E9vKs+gbLA/awjXSQRuAfo4cTFkDLn6H48wqyoxT0QxKikP1QnFCfsIZZNma24O4MVTZXhWxIM2RV
	ixh0KRt0r+e0I5cZYNrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qA6xB-0008T6-24;
	Fri, 16 Jun 2023 10:45:17 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qA6x8-0008QR-2Z
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jun 2023 10:45:16 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-98281bed6d8so77903466b.3
        for <linux-riscv@lists.infradead.org>; Fri, 16 Jun 2023 03:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686912313; x=1689504313;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CCG5A6ajXLTLE10xD/EwQtRbiFYAr92BjqbfBvbs0JM=;
        b=Cx8hqyXEUK5n/F62ME4CFIQWOYqMOsvyeK757+STYBi0A9mA22sCgVtbAKNgMDmWMD
         KfEynGMuCfXSlNJ5DV0IEagQ91+r8zLn6dzyd2769QJ+lagubdNtu65uUeLDN3IGtDNN
         oDxDctQHR+auluwdqh/kIlGLiCuUzRViTl6TIdAwZ4a3JM+XMHgM5942iMj+dssyMhKb
         NKqNJ80dcdIidj+M5FgoCPqQPN96kKGGaUNu5hwKdmzn5awhUAdZJHZG5WE1a6+J2Izm
         8vssm2rgCrbFScEW9FraY2Ehl/1CKjarUvOEuXRLRYDq+9GG3E5jENuuNFSPj7FuuN/p
         XsEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686912313; x=1689504313;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CCG5A6ajXLTLE10xD/EwQtRbiFYAr92BjqbfBvbs0JM=;
        b=dMvlGCddbFSFJLubJe66mFKu5BnL60kPuUOd1O//O+2GfiupgTLJcJKiwGy+g0Im5U
         b/Ixa/vEguWxIA8f0QL/ekTwKnqCtlgERjnGR0jTYIpkFm4bm6s52pxjDstGi5CprWOA
         o2+8tfI9tR6C+68HYqHHQmbilQJn4qWMk6w0HJxJtnYLGnktPOiF90ijnati7AonOs29
         cEZvv7XFFr78uIdRpVJolKbMU6ha1knY5jY0Ry/Z94fQe5+KXOBwENz+if6cdNwXg3z8
         FE0zbWe0bEYcqruPC4Onfxu+/XcmOpO4tex/38e4HrEcBmFtnKVqBiFDL4y3vr+NTzbo
         Vyew==
X-Gm-Message-State: AC+VfDx7+5wLracvXJoIMq1nANL0uW1awW/xYrRbGxvYhhgO02U8bc1X
	MPYdav4ozTaNKAyt/ftx6L7bFA==
X-Google-Smtp-Source: ACHHUZ5pBhc4PkJsgZKTk6SpG5tqfoPODaHd3C6shKQL67g4PPNJz+2J9HtBtcwGuo+hUVy5k5aKlQ==
X-Received: by 2002:a17:906:974a:b0:982:7735:436d with SMTP id o10-20020a170906974a00b009827735436dmr1948610ejy.7.1686912313065;
        Fri, 16 Jun 2023 03:45:13 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id k10-20020a17090646ca00b009827b97c89csm3130806ejs.102.2023.06.16.03.45.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jun 2023 03:45:12 -0700 (PDT)
Message-ID: <2437bda9-bbdb-ad80-7201-1e16e1388890@linaro.org>
Date: Fri, 16 Jun 2023 12:45:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/3] dt-bindings: riscv: sifive: Add SiFive Private L2
 cache controller
Content-Language: en-US
To: Eric Lin <eric.lin@sifive.com>, conor@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu, maz@kernel.org,
 chenhuacai@kernel.org, baolu.lu@linux.intel.com, will@kernel.org,
 kan.liang@linux.intel.com, nnac123@linux.ibm.com, pierre.gondois@arm.com,
 huangguangbin2@huawei.com, jgross@suse.com, chao.gao@intel.com,
 maobibo@loongson.cn, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dslin1010@gmail.com
Cc: Zong Li <zong.li@sifive.com>, Nick Hu <nick.hu@sifive.com>
References: <20230616063210.19063-1-eric.lin@sifive.com>
 <20230616063210.19063-4-eric.lin@sifive.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230616063210.19063-4-eric.lin@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_034514_844463_DDDBA1F0 
X-CRM114-Status: GOOD (  16.62  )
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

On 16/06/2023 08:32, Eric Lin wrote:
> This add YAML DT binding documentation for SiFive Private L2
> cache controller
> 
> Signed-off-by: Eric Lin <eric.lin@sifive.com>
> Reviewed-by: Zong Li <zong.li@sifive.com>
> Reviewed-by: Nick Hu <nick.hu@sifive.com>
> ---
>  .../bindings/riscv/sifive,pL2Cache0.yaml      | 81 +++++++++++++++++++
>  1 file changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/sifive,pL2Cache0.yaml
> 
> diff --git a/Documentation/devicetree/bindings/riscv/sifive,pL2Cache0.yaml b/Documentation/devicetree/bindings/riscv/sifive,pL2Cache0.yaml
> new file mode 100644
> index 000000000000..b5d8d4a39dde
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/sifive,pL2Cache0.yaml
> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright (C) 2023 SiFive, Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/riscv/sifive,pL2Cache0.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SiFive Private L2 Cache Controller
> +
> +maintainers:
> +  - Greentime Hu  <greentime.hu@sifive.com>
> +  - Eric Lin      <eric.lin@sifive.com>
> +
> +description:
> +  The SiFive Private L2 Cache Controller is per hart and communicates with both the upstream
> +  L1 caches and downstream L3 cache or memory, enabling a high-performance cache subsystem.
> +  All the properties in ePAPR/DeviceTree specification applies for this platform.

Drop the last sentence. Why specification would not apply?

> +
> +allOf:
> +  - $ref: /schemas/cache-controller.yaml#
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - sifive,pL2Cache0
> +          - sifive,pL2Cache
> +
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    items:


You have only one item, so no need for items... unless you just missed
proper fallback.

> +      - enum:
> +          - sifive,pL2Cache0
> +          - sifive,pL2Cache1

What is "0" and "1" here? What do these compatibles represent? Why they
do not have any SoC related part?

> +
> +  cache-block-size:
> +    const: 64
> +
> +  cache-level:
> +    const: 2
> +
> +  cache-sets:
> +    const: 512
> +
> +  cache-size:
> +    const: 262144

Are you sure? So all private L2 cache controllers will have fixed size
of cache?

> +
> +  cache-unified: true
> +
> +  reg:
> +    maxItems: 1
> +
> +  next-level-cache: true
> +
> +additionalProperties: false
> +
> +required:

required: goes before additionalProperties:.


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
