Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A1BECAAD4
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 12:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fNw4vWqxls2wY1EldVRvS5U9M4pXuHWW/cy5HwSI72s=; b=xCzUGPWu2/fl2BJFw8IMkBkH7O
	o//AotvV93zpYu+mF9oKMpERRMzRM3Tf6lEQ/8cxEDfipzGpcIdlZ9FqFoLuyvq1FuLnWyeFbDnxU
	Xe6U7thdur++di5qOJ/3xNQY2JAluoT3fxv7o9xxbWTtzggHDu5v2DXYa5OSDwUPHYFk/Z1SIOVdY
	tjINQT9cTRpX03yN9QaCWK1jfq9KQAMKKOYz/eXe2+tcMWEx6fP7TnpS+KGPwT/PoRrYAaMLLLN6P
	aHwak1A6O4fHtdAkWZ/Q/xaRy7S7rcMP0fBsuqnPc4wJlfzXPR0GOgSq1ic7W1Pxq6rxoKdMGB0Kl
	rfMB7ZPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT0ot-00HAkM-NJ; Tue, 30 Aug 2022 12:58:19 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT0oq-00H9Wj-Ds
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 12:58:17 +0000
Received: by mail-wr1-x431.google.com with SMTP id b16so6479491wru.7
        for <linux-riscv@lists.infradead.org>; Tue, 30 Aug 2022 05:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=YGmkAZyavh+X9La7k+CFGGjIc+C3jV0M+2ia4/QWjpk=;
        b=nAszEbPHvTpl4eyJg2fuRS7ZObScYrqd1N/RhNUC43Hyeu3SMZO5iY+wvqOFUaysJx
         siq91yP79RGZRyAGXtSxRYbHENA2EZBjnR1mOUY1QjbRvpGf9fFltg2PUNK8w+viOecx
         hiMOOsVI5a4/nrqi4vJmuXhAOmdFSRay5yXiVueQ90Pob6BdW3OdkeYXrxkKZuRH/Gkh
         3IWJsU/KZOXZzR5MpVFluwpvqJQU2wu8DHSXs2PT1Lf1fHbBcywk0YDQAqTSp/Oxjnb4
         raN3nvqUR6nMgoSIzAj+b7rHtuvpT3TJTdraYkNRXrj7kxguhup/RPD1rl3YCj3KX9tw
         SgoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=YGmkAZyavh+X9La7k+CFGGjIc+C3jV0M+2ia4/QWjpk=;
        b=fxK5JVUv6IxtCys4M/lX0X79HCVbeb0bRGXfc0u8py4byIgQeHIh438Fsrn0+yOrEs
         Gggt/lHxBLZtQrQRDcu1y4+oFl+mgRUEa/pyVVtRGV3Z3jljicbuy+SsFCVXW9iHE4d9
         Nf3lHOkzWF1i8dTXZh6Qto87LZtrBjdmIRE9NeI/NwvVW9Pmgy957oRNZNpJR9xbX8MN
         tbd8GX5dg41alTuToediiYOSVmR5Cde0Kx86o+KNBdyy59WdeQfqvhu3JUo+mTAxhFDH
         +jtAwBpn5l3QAEP90lVNdZo0V7mofeVyLXH4d4+2sqzMpDW13PTMk71wnLMn0m/EGYgx
         Ul5Q==
X-Gm-Message-State: ACgBeo3ZStn7TtbIfXGEMaUjiLW8k7HnetNC8t05C/iYDodQj38UyubH
	rs6JjY0n8E4ESGJafdtDoE/5hg==
X-Google-Smtp-Source: AA6agR51p0EDWKeeNESKGCHV+BZqCfWQ96nO9J+kb64Y+l4lI4KMbkrcUhW3hqrmrES73N832iz+dw==
X-Received: by 2002:adf:e18a:0:b0:225:8c08:2411 with SMTP id az10-20020adfe18a000000b002258c082411mr8631521wrb.548.1661864293933;
        Tue, 30 Aug 2022 05:58:13 -0700 (PDT)
Received: from [10.35.5.6] ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id q28-20020a056000137c00b002205cbc1c74sm9543475wrz.101.2022.08.30.05.58.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 05:58:13 -0700 (PDT)
Message-ID: <6b6837c1-5a2c-567b-ba64-72a1dca38807@sifive.com>
Date: Tue, 30 Aug 2022 13:58:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.1
Subject: Re: [RESEND PATCH] dt-bindings: sifive-ccache: fix cache level for l3
 cache
Content-Language: en-GB
To: Conor.Dooley@microchip.com, palmer@dabbelt.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, greentime.hu@sifive.com,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 devicetree@vger.kernel.org
References: <20220829062202.3287-1-zong.li@sifive.com>
 <20220830125133.1698781-1-ben.dooks@sifive.com>
 <b810d354-18f3-9ae0-6310-57d9e36f4f9b@microchip.com>
From: Ben Dooks <ben.dooks@sifive.com>
In-Reply-To: <b810d354-18f3-9ae0-6310-57d9e36f4f9b@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_055816_520872_4292A230 
X-CRM114-Status: GOOD (  14.70  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 30/08/2022 13:56, Conor.Dooley@microchip.com wrote:
> On 30/08/2022 13:51, Ben Dooks wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> With newer cores such as the p550, the SiFive composable cache can be
>> a level 3 cache. Update the cache level to be one of 2 or 3.
>>
>> Signed-off-by: Ben Dooks <ben.dooks@sifive.com>
>> ---
>>    Documentation/devicetree/bindings/riscv/sifive-ccache.yaml | 2 +-
>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/riscv/sifive-ccache.yaml b/Documentation/devicetree/bindings/riscv/sifive-ccache.yaml
>> index 1a64a5384e36..6190deb65455 100644
>> --- a/Documentation/devicetree/bindings/riscv/sifive-ccache.yaml
>> +++ b/Documentation/devicetree/bindings/riscv/sifive-ccache.yaml
>> @@ -45,7 +45,7 @@ properties:
>>        const: 64
>>
>>      cache-level:
>> -    const: 2
>> +    enum: [2, 3]
> 
> Do we want to enforce the cache level like we currently do for
> interrupts and cache-sets?

Not sure on that, for the P550 cores the ccache is going to be level3
and my colleague has said it does confuse some tooling if the level is
not set correctly.

-- 
Ben


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
