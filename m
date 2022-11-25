Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E00C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 12:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7o21e4O1/jvt4A2YVbS4/tmNRnoHmkKNZSU37jFfrNc=; b=h7trlL/PNoXuMJ
	v4TuzMO32rWwmrcPSghuFpeLcVlNWtyXbAGhDVdfNn4OUJLZAmsCAV2KI0v2wNS5IjfjdfKYrlQVY
	ASvUCSVI2fbbvAMkQ2ARGqu8lclI+sxfJLxlGHo6kIUxw3G3sOBVoklBC+J/CbmfUKmPJVm/3L5Sg
	KMwxbJz+G+pHZcG0A/1xvQikHwuZ60pyIl9v4ckkOmVo62pYwMx6ly+zrdX1/FCAnfJyxyW839URt
	OzM4WfHXDWstfGArshiL+w9xJGF8Vli4zc8QYzzKAet6cKnkGDvjzUtGjiR7Kfdz+QPCVDSRWdMxf
	KKgnvdCfQXYrfMrb69Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyXZE-00GL08-Gl; Fri, 25 Nov 2022 12:12:28 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyXZA-00GKwp-MJ
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 12:12:27 +0000
Received: by mail-lf1-x12b.google.com with SMTP id c1so6595054lfi.7
        for <linux-riscv@lists.infradead.org>; Fri, 25 Nov 2022 04:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WIDCe1F2pbbd2Mgy1MXrte4UDEybWJsDPNOb5ZCnmZQ=;
        b=UoBk6bEFZdln6Gqli1w+RnWCFscF0VbAqS8Ag3LpE2o4H48mryNm6HdqsmHags6EXS
         xWOJNeT6QcZWbiloClD2sl8WKeKQxA/oVklAnjTYhvwL0MBIZZbi0m/y1XM39p/LtRe6
         XpN1GYXTREaIVvk1MIvWnXe6oVJVfxwCY60WiH5GTVCDt+JtTHdJqv9kjD34DsxOgiC1
         Ri5SWYvCQFnsJDigQUQa3BP50L8u1oWeVq90QxGOBOZSPsFaFjX7LT0bkVQILYZGu9Bo
         HB0m3lHG9D9VJ2rtsyhYlFf8TOnWdfoUOZnhPu5vISCEQa0tbrgHTG6kp+nI0tM8MpRc
         P/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WIDCe1F2pbbd2Mgy1MXrte4UDEybWJsDPNOb5ZCnmZQ=;
        b=IK9OBis34T3ei/JmOenHFFt0rduWkzBHChzKrZLiTU1T2u+eWXzu3mpHQRUmN49vTi
         sqzUq3V0ZFfs0F1MEJ7g/ptDQu4nP0L/g4T3My2nOuwFyRBe8QMnFrzLdS3Jrl47pRIh
         8MQeniBBJm10nlV8IYmxuQ/FsJK9THtEkxex5xFTWKj5wdMkJp92xg7PWy/oRMRfpA+5
         lcrMy/yb4vSEw0QNTqnxkEYDkB27YKcYrbJafbioFohbHz0/Pe50UG/uiNS5peTjSM3W
         KV82oObsS/B3mIdM+iwDLxE3zsv//DBE0P2Sp3rQhx7bv9KqUxNsvPlbAajKIWU27Bun
         lLPA==
X-Gm-Message-State: ANoB5pkw0vO0y52Qs0U2aAQtPJRB8OLdrGSusihqB4+HdKGkqNWWtRon
	Y57/Rqv4axe5G30reB6bwoOX5g==
X-Google-Smtp-Source: AA0mqf7AYDN1omQtlSSqKyibMA+E7LIJY49giATJQ8eBdw3MdfOTWsmmF57QotBfyUz6z3524orkhg==
X-Received: by 2002:ac2:4f0c:0:b0:4ac:2f5f:5c9b with SMTP id k12-20020ac24f0c000000b004ac2f5f5c9bmr6226180lfr.206.1669378340651;
        Fri, 25 Nov 2022 04:12:20 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id j17-20020a056512399100b004b257fef958sm508060lfu.94.2022.11.25.04.12.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Nov 2022 04:12:20 -0800 (PST)
Message-ID: <9b0f8312-2caa-b9f3-edf3-1b720532f559@linaro.org>
Date: Fri, 25 Nov 2022 13:12:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 6/7] dt-bindings: cache: r9a07g043f-l2-cache: Add DT
 binding documentation for L2 cache controller
Content-Language: en-US
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>, Atish Patra <atishp@rivosinc.com>,
 Anup Patel <apatel@ventanamicro.com>, Andrew Jones
 <ajones@ventanamicro.com>, Nathan Chancellor <nathan@kernel.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221124172207.153718-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221124172207.153718-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <70d1bfde-f57f-1741-08d3-23e362793595@linaro.org>
 <CA+V-a8s2awLp=YvbhA1Ohe500Oh1easLUcG9V4_FWov7Pf2i6g@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CA+V-a8s2awLp=YvbhA1Ohe500Oh1easLUcG9V4_FWov7Pf2i6g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_041224_797242_0799A3A2 
X-CRM114-Status: GOOD (  12.51  )
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

On 25/11/2022 11:34, Lad, Prabhakar wrote:
>>> +/* Device, Non-bufferable */
>>> +#define AX45MP_PMACFG_MTYP_DEV_NON_BUF                       (0 << 2)
>>> +/* Device, bufferable */
>>> +#define AX45MP_PMACFG_MTYP_DEV_BUF                   (1 << 2)
>>> +/* Memory, Non-cacheable, Non-bufferable */
>>> +#define AX45MP_PMACFG_MTYP_MEM_NON_CACHE_NON_BUF     (2 << 2)
>>> +/* Memory, Non-cacheable, Bufferable */
>>> +#define AX45MP_PMACFG_MTYP_MEM_NON_CACHE_BUF         (3 << 2)
>>
>> What are all these? They don't look like flags, because 3 = 1 | 2...
>> they don't look like constants, because we do not use shifts in
>> constants. Are these some register values? I also do not see the header
>> being used in the code, so why having a bindings header if it is not
>> used (DTS is not usage...)?
>>
> These are register bit values for the MTYP[5:2] field. The DTS example
> in the binding doc (above) uses these macros. I haven't included the
> DTS/I patches with this patchset yet do think I should?

Then why storing it as bindings? Bindings headers describe the interface
implemented by drivers and used by DTS, but this is not implemented by
drivers.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
