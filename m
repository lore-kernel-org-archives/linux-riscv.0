Return-Path: <SRS0=1JZA=NQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F6B0C4338F
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Aug 2021 12:57:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2674261052
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Aug 2021 12:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2674261052
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=GEs5J9xcexNwYhIn1paHgdQP52WxRWtJgPxAdXFXJOU=; b=W5N6Bus25/RSRVhAzARGh7DOa1
	rkt/dattNiRoZilFmKkKTIbPiY4F5Q2wjQDhNyTK1qvKzSziL4Z6eMle7A03SsP2Aj4bRid5frSgc
	ReEqN9WIyRKtZwG1CzbAUZ/GMslnwTMpXpBZhcM0WqzFu9h/mqXbMqed/Kum1JDYnM7EKJi5mx0KY
	vy9521mnc8sHzIkioiQAeiWU5W+PWrGKr8JNaQZPol6MG+XKnqX8ITGsJNv1rKxNyioMtvw1/xakk
	cHARUJeOOYvfHXCv17DnxpBabkfJNjM5rzFjdTBfe9x7tgB2DaUQmz6oxrBm1yxIebN0EVtj0x4dJ
	cAKDi8lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIsT2-006yyH-8P; Wed, 25 Aug 2021 12:57:20 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIsSi-006ypq-Bf
 for linux-riscv@lists.infradead.org; Wed, 25 Aug 2021 12:57:05 +0000
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DAA1C407A0
 for <linux-riscv@lists.infradead.org>; Wed, 25 Aug 2021 12:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629896212;
 bh=J/tSZXGbbVX7jq/a3ssqSdjqxH4DgxG+yQPijZgaVeg=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=qK2zxW07oVUKSM30tMetlfFFQwiZPNf97uO/7VTd0LhNpmwCFPcnc41KtXGAORyvF
 Y1m8423oIma0suhOOt7MisvPqmUuNOiwEOpKbfdeYUWPbMkJ5UcdUm1lAUvJ8vqOrV
 rgpztMO2/x5KFrKh3u3s41Whcrf+dVHhRCeSuspNWncgDlq7d5wnJ/M69r8NPNxA1W
 d268r00obI0K22jFuBp1I3SKUuBRLh5wpWnkbaJ3wrHIQ3yK+l6C/Rcy5UX0RaVrWC
 ikt6fu/YaMmHqdLX89P1VNjzm8lPnaZ7ovMgnxYcrKuyQ7NNnfp09YHntZYorIXn4W
 EumEt8LAXnanw==
Received: by mail-wm1-f69.google.com with SMTP id
 y188-20020a1c7dc5000000b002e80e0b2f87so2819865wmc.1
 for <linux-riscv@lists.infradead.org>; Wed, 25 Aug 2021 05:56:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J/tSZXGbbVX7jq/a3ssqSdjqxH4DgxG+yQPijZgaVeg=;
 b=DpAtDzuamglEdFIBfR9xDzIrVvQ5MWG4WvYymIM5lAtil8fAtqiKHCH4U0PDD+SUaI
 MPbvCo6wRvRJPCMkR1YQjjnuO0gi+bAKhskM1HHhvQzrmaRiAXN1MwVU9JwIWLRW1zJn
 +6UKYaSE1X2MnDa9V6m3PlCtmh13RrH1ELxCGHlRKJhVLmStPZ3v5aCuVuuRb6m26qVJ
 DwV+44ssSfmKmd+3jqhZm3dm5ywcd1Ai7L5ZiAvjkEaeCTQPNDjNaU9eZK1NzbgfymN6
 BfA15zYzJ8kQ07biErHlw1X9y1aovdGH1s4CCI+PygCCmyN7RMSBrNDGMHxT6HBIdE99
 UF8w==
X-Gm-Message-State: AOAM532SCf2BvUu2RlT0tXeDz1pPY4GaavFfwpKRLXvw33gdWLew9yXa
 FYJvgCfImqiz+4H+xLiOGFXK7QGdCdY+59nv6cXoMusOQoLBVHwjX8OLK7MMDmyIymqNczpaoHu
 lBgAAPFqv4W94ix25PJjBjMuRjjlWrWcXrOaHj1XY6zjx1Q==
X-Received: by 2002:a1c:2702:: with SMTP id n2mr9151047wmn.78.1629896212255;
 Wed, 25 Aug 2021 05:56:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx19exlQXFyThlRhadSTOudioZ5LJmmgmFwb5+25rV2AcBZRK30aXzWxi2nBrwdS83mcw53+g==
X-Received: by 2002:a1c:2702:: with SMTP id n2mr9151037wmn.78.1629896212095;
 Wed, 25 Aug 2021 05:56:52 -0700 (PDT)
Received: from [192.168.0.103] ([79.98.113.15])
 by smtp.gmail.com with ESMTPSA id k18sm5294991wmi.25.2021.08.25.05.56.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 05:56:51 -0700 (PDT)
Subject: Re: [PATCH 1/5] dt-bindings: mtd: jedec,spi-nor: document
 issi,is25wp256
To: Tudor.Ambarus@microchip.com, p.yadav@ti.com
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, atish.patra@wdc.com, sagar.kadam@sifive.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20210819165908.135591-1-krzysztof.kozlowski@canonical.com>
 <20210819172852.b26mybrdr33wso62@ti.com>
 <5bff5a0c-48e5-3721-5595-836ce0562c6f@canonical.com>
 <ae4c58fe-0af5-3f1d-cc16-27b78772cbb5@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <abd7496d-7aaa-7f23-bdae-441906277577@canonical.com>
Date: Wed, 25 Aug 2021 14:56:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <ae4c58fe-0af5-3f1d-cc16-27b78772cbb5@microchip.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_055700_579270_A107E583 
X-CRM114-Status: GOOD (  16.70  )
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

On 20/08/2021 15:28, Tudor.Ambarus@microchip.com wrote:
> On 8/19/21 8:36 PM, Krzysztof Kozlowski wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 19/08/2021 19:28, Pratyush Yadav wrote:
>>> + Tudor (you should be listed as a maintainer for this file IMO)
>>>
>>> On 19/08/21 06:59PM, Krzysztof Kozlowski wrote:
>>>> Document bindings for the issi,is25wp256 SPI NOR flash.
>>>>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>>>> ---
>>>>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
>>>> index ed590d7c6e37..0db64ac7dc33 100644
>>>> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
>>>> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
>>>> @@ -33,6 +33,7 @@ properties:
>>>>        - items:
>>>>            - enum:
>>>>                - issi,is25lp016d
>>>> +              - issi,is25wp256
>>>
>>> I don't think we want to add any new flash specific compatibles. Why is
>>> "jedec,spi-nor" not enough for you?
>>
>> It's fine for me. I had impression that specific compatibles are still
>> preferred and one of boards is using this one. The other way is to
>> remove this compatible from the board DTS.
>>
> 
> Pratyush is right, we prefer to bind just to the generic "jedec,spi-nor"
> compatible whenever possible.

Thanks for confirming this. I'll fixup the dts.


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
