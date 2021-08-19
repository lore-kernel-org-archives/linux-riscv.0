Return-Path: <SRS0=mZrj=NK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06EB6C4338F
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Aug 2021 17:37:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC7F76108F
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Aug 2021 17:37:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BC7F76108F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=j50i+MuDmvpRGJuttQIFlXSEEsLfy0TUBYmZucIRGxQ=; b=QoIXq2PwbFxu+O+hQcg2aSKPEJ
	BU+NKQ/Z2BoZ20luvhTfRrWIzsflL+CsW+8iedhiO9QwkCBsOs2XSucGMxgw0kCtfmOktIVe3t66s
	rAZ2nkEEWSpXJYFPmIZMaUmaLxJCfwSD4mP3GJf+gM29nMpoobRGOOIWk4Rh7Fk4k0mFZo4FSTAdP
	KbRX/sgr1AanS7JrxrEP8OeyV7W0G5VNaXfYw1Cgy6ladeW12DilBBKZusU9Qew/HqfaFhAMLMg+3
	5rqMhUqjDywaj6lDbZjnOKBZNpILzB9BLEMnnp4kgcOooBv1UcdJ1ote+519sQ2RfvMof0E1FLbmm
	okZYjL7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGlyZ-009Ayk-6B; Thu, 19 Aug 2021 17:37:11 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGlyE-009At2-5R
 for linux-riscv@lists.infradead.org; Thu, 19 Aug 2021 17:36:54 +0000
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id C6C02411FA
 for <linux-riscv@lists.infradead.org>; Thu, 19 Aug 2021 17:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629394608;
 bh=iB4/HnIn+QRyTqSe3aTZUggGYaij6p5wJKKNJY87YsA=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=oi0lsl/e56+PTobv15v2o0sGANvhpPNBN3mXX7S/F8P95SWkvIUJc/uMfjRW0IQS1
 djqLElBr3U2oksksHwc0L6/EHx+ho0Gjc2vzdoUha1kILwsLnaDoy4o1ighsszw3rO
 ri16qQPqqWWKbwVOMmWRtmLUz3AM6KTigQqKACHlzEPKAqsMuy78VOWugD1G7y9iq1
 AmwzR7WXyd0Cq2vUIf7az+ViSx0awPjemaXOrqDBmS+M9nCpTCqAcHx/wbz+HSDZRC
 bkINSu9QP7Y8nQeQL6T1mlf8nWRtk2b0m44Ou3ivGiQnpRfJpeGuETv+euyG0DP856
 DbwGdW+0I9lFQ==
Received: by mail-ed1-f69.google.com with SMTP id
 j15-20020aa7c40f0000b02903be5fbe68a9so3201871edq.2
 for <linux-riscv@lists.infradead.org>; Thu, 19 Aug 2021 10:36:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iB4/HnIn+QRyTqSe3aTZUggGYaij6p5wJKKNJY87YsA=;
 b=SeFDTsekANqpl3SbED6uCQ72PsQzMGm0WVVuPqVv/NqYjK2iOiDRavsJ+KWaUbkZV/
 khF3TA/r5rHtOAE1A/lP6FSIzHnxrUwIpAfMwYXgF52oSNHXGn578DxC8cXCz7gQBMq6
 ltjGtwsrhkxaK35MZ9guvJkkptwGXZ+qM9IUvC7jM1kyTI1aBLxC7bnzlh62VoX6fa0a
 Dw4f++Kxk6y1bOCidQnMjR+QfvIlmj4XIPsEVSqAdm+dFS/b8+4AxVWhomZHHIBoaCBl
 kbCwsWSoTHCT68aJODzUqblobY9ijf/xLGQgzrO61eqnYaRnb7TTNzmtE9O9MjTt0HY3
 YQ2A==
X-Gm-Message-State: AOAM532RcLKIFxOCxfzsRkjFD48pfCJdkS5qdg+vR9xvgabUWtqosBP/
 BVzOomtmFrRemwTEXxt8uZkOm1CS/DE6HM67/t1ZD03fztHUYKYCyEeNfJcogPl9tp8mNMBu7SY
 bb8dQRRt8ExsYNF4Wd2tWWtHniaE/hqB1xUzJcoL5vysx8w==
X-Received: by 2002:a05:6402:51d2:: with SMTP id
 r18mr17952719edd.376.1629394608263; 
 Thu, 19 Aug 2021 10:36:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3HJpK5BEPVQFecqrxkkDpoqFxB6FotTSoqpiEW1uGqQvjEka4kyDCIm+7+hq8Q3VP1w+KqQ==
X-Received: by 2002:a05:6402:51d2:: with SMTP id
 r18mr17952687edd.376.1629394608068; 
 Thu, 19 Aug 2021 10:36:48 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
 by smtp.gmail.com with ESMTPSA id k19sm1581326ejq.42.2021.08.19.10.36.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 10:36:47 -0700 (PDT)
Subject: Re: [PATCH 1/5] dt-bindings: mtd: jedec,spi-nor: document
 issi,is25wp256
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atish.patra@wdc.com>,
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20210819165908.135591-1-krzysztof.kozlowski@canonical.com>
 <20210819172852.b26mybrdr33wso62@ti.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <5bff5a0c-48e5-3721-5595-836ce0562c6f@canonical.com>
Date: Thu, 19 Aug 2021 19:36:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210819172852.b26mybrdr33wso62@ti.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_103650_390615_7B504D15 
X-CRM114-Status: GOOD (  18.21  )
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

On 19/08/2021 19:28, Pratyush Yadav wrote:
> + Tudor (you should be listed as a maintainer for this file IMO)
> 
> On 19/08/21 06:59PM, Krzysztof Kozlowski wrote:
>> Document bindings for the issi,is25wp256 SPI NOR flash.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> ---
>>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
>> index ed590d7c6e37..0db64ac7dc33 100644
>> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
>> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
>> @@ -33,6 +33,7 @@ properties:
>>        - items:
>>            - enum:
>>                - issi,is25lp016d
>> +              - issi,is25wp256
> 
> I don't think we want to add any new flash specific compatibles. Why is 
> "jedec,spi-nor" not enough for you?

It's fine for me. I had impression that specific compatibles are still
preferred and one of boards is using this one. The other way is to
remove this compatible from the board DTS.

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
