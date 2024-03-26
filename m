Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD333C6FD1F
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 08:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w8q5GUsk5Vf7OgmauXYjjiD8oQvguAm2gF/vqWQUJJY=; b=ZsFHQP02SwxQWi
	V70G18cLSb3xvRUcWZMpQ2ax78dK+ZIdm8KWdatb1nnIAZXrnI3V0/xbsw8zSfbLifksYWXaaNbLw
	sCGL9h+GSs2JmdXhOiNuJwJBtCdgz4yhbifEe70yiPI6oTZpzauQASqIK6c4wafz+avX1Eoi5kvlk
	6Dv4J/rklNC9f8i56M4biV1MVDucyWRsgRxgTpuh20Es/fDjsDWSGiZXEcya2kNspsMmXO691qxAb
	V70Cmkj7BqB8cwXettWzQHdDjJ2ka8z5hvJIYUSzvCtruMbQzyCHNA4ajKwcWIOE9xhC2B3WUXzEp
	eYjWUIE5YcNJceE3IWdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp2YY-00000003gNz-0nsk;
	Tue, 26 Mar 2024 08:53:18 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp2YV-00000003gNI-3cBH
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 08:53:17 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-56845954ffeso7353246a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 26 Mar 2024 01:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711443192; x=1712047992; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=A72GqcohDI7Dvn2lSRVPpUnirl+ZJXgMHX/nxLWx5GU=;
        b=qQy2N45vLrDphfXQ9bkRfCbtAtIlaYRoi/FtxQaXC9c5Sj5fVWoroIPyRM2fpIkeQw
         fqIzG9Ud6fRWsWKHDZlFLo1+GYCyWf88fjVwrzVIvr2SPIvFM2yYbHTR9rBTq2GIhqBY
         4Bg/u2juulHE1xp542/kkUd8DlMAVUIDefFib4D1x0aEXibWEDSNTDNF/LmOAH8vujiT
         f9Eg0/yodKL/u4a+tNxcQH/H0sTd+7AWYAnm/nvC6QOVos5O+ZtTRkQzPloittbRU25w
         c2VyknM3G6rAvbKE3DS3VLxik+enVCkj0CIUH0B0skPsp/H58wajfgPlcSn4B9WdOUCG
         3dcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711443192; x=1712047992;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A72GqcohDI7Dvn2lSRVPpUnirl+ZJXgMHX/nxLWx5GU=;
        b=ig1cC+GzE3Ap7krPMAwvDrkRm63JvTYuCrKrQjXQRkf+0FDVKr1pFWNoLy5s6DskAg
         GTNFqRzs6DFVAn+3rqMiaqLrfoTKr4ZCtD68Fwb7R1kvekK1N3WEM33uECXHEkTbQqAy
         4kLTn25P0NV2OFcIzrS6kCNJO47ldMgl6mG1ZOjnUeZL28DQs4d999NPdQ3yftoHXK4k
         tF3yq+i0MEmm+zRZCUWU266EUEIjrLbDoSENeDeZbfZGOsj5XZgVAG7UkSuUeFwXQU6q
         obRa8n6AWPZSr8ReZfmBWnbtmt6e1qxiNObr+SSD7R2ZqzKFEXvB1q1woVIY6TvQuPzs
         y6tA==
X-Forwarded-Encrypted: i=1; AJvYcCV8oOWmhS1A7+aACJELxsE1feadgnMAeaIhPb5enPDilNY8W0NTCYrfmFD8TdR3jhqgairbPfUV6okR/krYL1MD6NBPwFS8K9P2fSyGzPYg
X-Gm-Message-State: AOJu0Yx/YBBZnjDXaTl/8MNhoW0Qwhe/LHnUcNSlGDZzhExTxz1mdtpO
	Bt998wzy/qGolZp6MTM9yCpmfI1N0ajJ38DAl9L/D0h24t7X5bpVIJMFl3uFcx4=
X-Google-Smtp-Source: AGHT+IE3GYQsAD0T4ft0yc5Tkehkoxt5puQRArsnAY9e3ACvMoNJJdvAtKPZu6xylnDBmUENUl4fLQ==
X-Received: by 2002:a50:d697:0:b0:56b:b5d6:1efc with SMTP id r23-20020a50d697000000b0056bb5d61efcmr5823637edi.18.1711443192518;
        Tue, 26 Mar 2024 01:53:12 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.44])
        by smtp.gmail.com with ESMTPSA id x19-20020aa7cd93000000b00568c613570dsm3925247edv.79.2024.03.26.01.53.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Mar 2024 01:53:12 -0700 (PDT)
Message-ID: <473528ac-dce2-41e3-a6d7-28f8c53a89ef@linaro.org>
Date: Tue, 26 Mar 2024 09:53:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] dt-bindings: dmaengine: Add dmamux for
 CV18XX/SG200X series SoC
To: Inochi Amaoto <inochiama@outlook.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Jisheng Zhang <jszhang@kernel.org>, Liu Gui <kenneth.liu@sophgo.com>,
 Jingbao Qiu <qiujingbao.dlmu@gmail.com>, dlan@gentoo.org,
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <IA1PR20MB4953B500D7451964EE37DA4CBB352@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953E2937788D9D92C91ABBBBB352@IA1PR20MB4953.namprd20.prod.outlook.com>
 <57398ee0-212c-4c82-bfed-bf38f4faa111@linaro.org>
 <IA1PR20MB4953EDEEFC3128741F8E152EBB352@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <IA1PR20MB4953EDEEFC3128741F8E152EBB352@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_015315_998736_3CFFF521 
X-CRM114-Status: GOOD (  24.04  )
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

On 26/03/2024 08:35, Inochi Amaoto wrote:
>>> +
>>> +required:
>>> +  - '#dma-cells'
>>> +  - dma-masters
>>> +
>>
>>
>> I don't understand what happened here. Previously you had a child and I
>> proposed to properly describe it with $ref.
>>
>> Now, all children are gone. Binding is supposed to be complete. Based on
>> your cover letter, this is not complete, but why? What is missing and
>> why it cannot be added?
>>
> 
> The binding of syscon is removed due to a usb phy subdevices, which needs 
> sometime to figure out the actual property. This is why the syscon binding 
> is removed.
> 
> I think it is better to use the origianl syscon series to evolve after
> the usb phy binding is submitted. The subdevices of syscon may need
> much reverse engineering to know its parameters. So at least for now,
> the syscon binding is hard to be complete.

Some explanation why dma-router is gone would be useful, but fine.

> 
>>
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    dma-router {
>>> +      compatible = "sophgo,cv1800-dmamux";
>>> +      #dma-cells = <2>;
>>> +      dma-masters = <&dmac>;
>>> +      dma-requests = <8>;
>>> +    };
>>> diff --git a/include/dt-bindings/dma/cv1800-dma.h b/include/dt-bindings/dma/cv1800-dma.h
>>> new file mode 100644
>>> index 000000000000..3ce9dac25259
>>> --- /dev/null
>>> +++ b/include/dt-bindings/dma/cv1800-dma.h
>>
>> Filename should match bindings filename.
>>
> 
> Thanks.
> 
>>
>> Anyway, the problem is that it is a dead header. I don't see it being
>> used, so it is not a binding.
>>
> 
> This header is not used because the dmamux node is not defined at now.

In the driver? The binding header is supposed to be used in the driver,
otherwise it is not a binding.

> And considering the limitation of this dmamux, maybe only devices that 
> require dma as a must can have the dma assigned. 
> Due to the fact, I think it may be a long time to wait for this header
> to be used as the binding header.

I don't understand. You did not provide a single reason why this is a
binding. Reason is: mapping IDs between DTS and driver. Where is this
reason?

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
