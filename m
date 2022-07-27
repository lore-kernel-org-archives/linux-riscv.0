Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1610BC04A68
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 07:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QRVCnYaryM8OEPrnjKSfqS0I46CgtzDRbgL9VJBZ2QU=; b=r+lPiidpB7Mk+i
	V2m7fSAEFkta0Q4yBO+hzMjdDvdg5FqjJWddjZzRslw1b1icCmf2+OZXYpJkb03GH0ECnv6CCRH0E
	ybq71WaRfzgulkpTIsIQX6syMnYp68kWNilRSmtgD2P9ALTzrhRXJo9Nsys8lDyJGnNseL6KcDwYI
	1QKeE2hFzDpyxNfRIqbvHJaLtb75Of2F7vTLowEnMugWQ1h5cxKsHMBxPa7ZqOR8vXT8S/+dPQbuf
	3JIJa0TiFSWxE9olOa4m0bejucUVahlFTNYCe+TDuGWXNOpWa9IkpMHWnCRMwapV7Earhiu6J+va9
	Y5GlC5ZntfYwCV/NXYyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGbEy-00AOY2-62; Wed, 27 Jul 2022 07:13:56 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGbEt-00AOUK-Kq
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 07:13:53 +0000
Received: by mail-lf1-x132.google.com with SMTP id z25so25912570lfr.2
        for <linux-riscv@lists.infradead.org>; Wed, 27 Jul 2022 00:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Ssg4tRasr4DBZJdl6J73astDPl5I4c2/6pZV2Ko1zDg=;
        b=p7y2YstySuGWCWGMOCXucGNBqC60lFvOVhWKJj4kFmbSertbFPzRAen3ld28vGIP/V
         cVqz0GdshAIp19Q85UxA3WWuPVbhMvIQDf1MsRsn1wc++jPYBV2he98aQaANdhUSbsMz
         bAQkNv0J7JIFzft9JYLrUjhavcW9aaw967EZQE8Qq3mDl+chdRUNerZj4Sp3l6FGHZjd
         t20+lQbIowTX0GJWhelQZFJueC4uDd7BuVgXuy1oV4GMXaOKmITg4q58+qBhnUy1x5u0
         yviK4Nz/cEvWTiLB8CcyqUXQFUVV5Vy/ofoqZXOH1EyhRzSIcMdZ9keZPHAEPKu/2L6X
         I/nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Ssg4tRasr4DBZJdl6J73astDPl5I4c2/6pZV2Ko1zDg=;
        b=J948YVY2fyDqCKjfwUjf20GH+L7X2iicShPOu+k3EvgJT3QiTESr6gZIsWBzUbRefl
         m2XI6XRv7117xXIzwnp/L8Gnk+KKTriBvJQosTI+L5JFN8IjCVjRZu61YdzgLzzMR9E7
         vwQ1fx96fQqTO+hNU+h5f1cyYL4eTiD13I8Be+XomiAdRYYgDS8sxlSQs/F8NlRf+6uI
         OhffbKR6iwTvAEnSXkOHX8Sb5eg/C5oj5fFw6PT1GRoHq6NAzuOn9DSFse2al9WfCTdV
         uiFNHIca13QZ87gtBi+H7ikl736u5LMdEYWqnZXYP7yzYIY716ojd5y0VZieqnGPdXUp
         Iu8w==
X-Gm-Message-State: AJIora9QiYRl6Cust8uMwcs8DHr06ImUHgcj7AkFAavRhfWEq93/isXE
	nqFlWHn/qMpN4UTzcitdEiUtPA==
X-Google-Smtp-Source: AGRyM1tnPRmGL8sIq6AcjbGyICwHFDjJ/A/xNKBKL5VlEN4NDa4zhRLe4k8vMTsts1cvocOPufsErg==
X-Received: by 2002:a05:6512:3041:b0:48a:9c71:8ee2 with SMTP id b1-20020a056512304100b0048a9c718ee2mr3208891lfb.369.1658906027938;
        Wed, 27 Jul 2022 00:13:47 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id u11-20020ac258cb000000b0048a884bdb84sm1756297lfo.52.2022.07.27.00.13.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 00:13:47 -0700 (PDT)
Message-ID: <bf470847-9e96-fc5e-0b82-d05068aaeb47@linaro.org>
Date: Wed, 27 Jul 2022 09:13:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 1/2] dt-bindings: sifive: add cache-set value of 2048
Content-Language: en-US
To: Conor.Dooley@microchip.com, linus.walleij@linaro.org, brgl@bgdev.pl,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu, atulkhare@rivosinc.com,
 sagar.kadam@sifive.com
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220726170725.3245278-1-mail@conchuod.ie>
 <20220726170725.3245278-2-mail@conchuod.ie>
 <246f132a-a23d-7c53-38a7-2bcec50d65e5@linaro.org>
 <c77f34aa-ff29-b18a-a3a7-9d90145364a8@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c77f34aa-ff29-b18a-a3a7-9d90145364a8@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_001351_712301_6EB286F1 
X-CRM114-Status: GOOD (  18.59  )
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

On 26/07/2022 19:39, Conor.Dooley@microchip.com wrote:
> 
> 
> On 26/07/2022 18:35, Krzysztof Kozlowski wrote:
>> On 26/07/2022 19:07, Conor Dooley wrote:
>>> From: Atul Khare <atulkhare@rivosinc.com>
>>>
>>> Fixes Running device tree schema validation error messages like
>>> '... cache-sets:0:0: 1024 was expected'.
>>>
>>> The existing bindings had a single enumerated value of 1024, which
>>> trips up the dt-schema checks. The ISA permits any arbitrary power
>>> of two for the cache-sets value, but we decided to add the single
>>> additional value of 2048 because we couldn't spot an obvious way
>>> to express the constraint in the schema.
>>
>> There is no way to express "power of two" but enum for multiple values
>> would work. Is there a reason to limit only to 2048?
> 
> Copy pasting from the cover:
>> I don't think that there's value in speculatively adding values to this
>> enum especially as (I think at least) the scala for this cache IP has
>> been released publicly:
>> https://github.com/sifive/block-inclusivecache-sifive/blob/master/design/craft/inclusivecache/src/Parameters.scala#L32
>>
>> The two compatibles in the file match only against two specific cache
>> implemenations: the fu540's & the fu740's. I would seem to me that, it
>> would be better to lock this to a single value per compatible since the
>> 1024 applies to the fu540 & the new value of 2048 applies only to the
>> fu740.
>>
>> I have not made that change, I simply wanted to repackage this series
>> in a way that could be more easily applied & restart the discussion.
> 
> TL;DR: I would limit it to 1024 & 2048 to match the only implementations
> although not in the way this patch did it.

The explanation in cover letter is good, but it would be good to have
one sentence like this in the commit msg. Otherwise your commit is
actually confusing - you mention that you want power of two and then set
only 1k + 2k.


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
