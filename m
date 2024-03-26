Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E49C6FD1F
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 12:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k0NfK2niU3mpa3C3u3HGLvKHJFafBogi5zBHDF5fx5Q=; b=URA4DOEfakEzTv
	gDuVNNP/l7k/zycZ3fESx4gxFCYMxZSdSulBGefZ/vWNWKbWM510MFGzVbqgT4pjlf891+57Ls6wM
	FaahAZYs/O1QgvvS+hBpci7dZJH7wVy2caj4smP/iALnvHmY2TZtH2PEc4b6TIQFoGR5ztjkdxZqJ
	1zRIgfk8mocJ/Ub305oWXhV1mqFQx6gke9ra3G6wfZulUdEA0jRAg6YwEX7tLctfVuBA3v+8ONGv/
	LtRYkuzNZmTk5lDT1PbqLoau2P5KGdhpPOGfL3nawP8V+XBrG2drHp/qbCeu3s25wPf9y8B4QJ33u
	XKPuneH1dsT3zPsGe2TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp5h7-00000004Q2C-2QJ6;
	Tue, 26 Mar 2024 12:14:21 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp5h3-00000004PzF-1EAv
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 12:14:20 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-56c2e2e3100so418898a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 26 Mar 2024 05:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711455254; x=1712060054; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=n+xRraxP+bzgIPI3MdZw8Y3QkcTMlVCI6ec/G9jP36k=;
        b=J7EpTx1CtK3onESM4+wwIW4sOTIAdGbbs4l84HyDUsT0nV89QU0pGLRC1MMw+IexJQ
         9t9v/Q5mnRemE5Gm62UScy3z8n0MzSVb8hFpXbeFbyuXGZKL7+TANImHggLGD3y3S0wr
         AM3AScXx+xvD/9cVb4dCIM50bmGPJcFTGt57anHc41equ0xhwvrYg80IFCx04VJiJohz
         YEZhfo+5zZNKIJZfIf5njqtFsPbuq1jfl3SPX3+uCtSSzFkIHfAX7WQEhpS5NQWS/dC4
         XrQ7yEc/N2uyTrxaQgKEjPjPSousVBrsR3/5C5Cdq8vtMDYZRLSd9GHIKdRiPwkHVBwE
         I8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711455254; x=1712060054;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n+xRraxP+bzgIPI3MdZw8Y3QkcTMlVCI6ec/G9jP36k=;
        b=VeeDn7fvaTrlLi7fA2bJ1sI/fRRuxJ5yagqHleaAZMbVgT/4lHS6eOHuqsQDr0pXLq
         6l1SPXszKKgxCcqjMx0T6iT7K6RGABwUrB19/vbBqr3kk5Q6zQ5/5/Eziy2gNOL7C5Wi
         o/fnoxsbdMH1/2WDmrQKCksuv7oif1yg8CA6WIU3xTIey3YzxJUgr1R8atZFfIhskgTp
         zXK/oWe0NR8FpIXao8sLh0+KJ1ARmzueYUltifv3kJPpl7XraEAqPl93qPgSL/N+D3we
         xjklGkKbYTthqBswhxKNdhDQ1WKdT94hc8JPtPs1Jjphns2XioKVNMsVk6znKY6c93Ef
         NodQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBlpgbSleOmEtsWBaZphgT3nrVT1N/+wGIQCwxwiw0kdMplK6C3Ddnghffy5svRfM13lgwlPlPHwL4n06IZDZYX9r+LLjW5hUR37C5JkRk
X-Gm-Message-State: AOJu0YwYbZrHZ01GeA46emnpfUBw3Eblm4sddK5KvPQslnbKEkHabIEn
	UE0naZilSf5gGp7aluXI1d/nnZZ7Db7dBua5OqgFvIdBjsGQlMFFxYuoIj9L0O4=
X-Google-Smtp-Source: AGHT+IH/MgInk+k3u49jHeevl2UiL4GVMPUggit2XjgmfeFWoEWXGOl904XBCuiLR4twfUC4QHm9oA==
X-Received: by 2002:a17:906:ad0:b0:a47:3b7b:e7a1 with SMTP id z16-20020a1709060ad000b00a473b7be7a1mr6054945ejf.49.1711455254479;
        Tue, 26 Mar 2024 05:14:14 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.44])
        by smtp.gmail.com with ESMTPSA id i10-20020a170906264a00b00a46a27794f6sm4158924ejc.123.2024.03.26.05.14.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Mar 2024 05:14:13 -0700 (PDT)
Message-ID: <f7f6fcd8-5f49-4685-8488-9d51bb1210f5@linaro.org>
Date: Tue, 26 Mar 2024 13:14:12 +0100
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
 <473528ac-dce2-41e3-a6d7-28f8c53a89ef@linaro.org>
 <IA1PR20MB4953517450F0E622A66E9A7DBB352@IA1PR20MB4953.namprd20.prod.outlook.com>
 <cf42e020-9a5b-48bb-bc14-c0cc9498627b@linaro.org>
 <IA1PR20MB4953EA589A0FF36DC6FCF0E8BB352@IA1PR20MB4953.namprd20.prod.outlook.com>
 <1525c377-af73-4204-8a2b-983c6d99316c@linaro.org>
 <IA1PR20MB4953D3A70237A5395E61C170BB352@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <IA1PR20MB4953D3A70237A5395E61C170BB352@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_051417_576879_AF990655 
X-CRM114-Status: GOOD (  12.74  )
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

On 26/03/2024 13:06, Inochi Amaoto wrote:
e.
>>>> +	regmap_set_bits(dmamux->regmap,
>>>> +			DMAMUX_CH_REG(chid),
>>>> +			DMAMUX_CH_SET(chid, devid));
>>>> +
>>>> +	regmap_update_bits(dmamux->regmap, CV1800_SDMA_DMA_INT_MUX,
>>>> +			   DMAMUX_INT_CH_MASK(chid, cpuid),
>>>> +			   DMAMUX_INT_CH_BIT(chid, cpuid));
>>>
>>> I think this is.
>>
>> So where exactly? I don't see any define being used here.
>> CV1800_SDMA_DMA_INT_MUX is not in your header. DMAMUX_ is not in your
>> header. So what are you pointing?
>>
>> I don't understand this communication. Are you mocking me here or what?
>> It's waste of my time.
>>
> 
> I apologize for my misunderstanding and your wasted time. I had 
> previously thought that hardware constants is also binding. This 
> leads to a weird communication between us. Since I agree and 
> understand this file is not a binding, I will remove this file in
> the next version. Anyway, thanks for your kindly explanation.

OK, no problem. When I asked where do you use header, it should make you
think... remove the #include from the driver and everything still
compiles, so obviously header is not being used.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
