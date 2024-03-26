Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A9E6C54E67
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 06:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kYKDqpjt66ncllpBvvnyzmssjkoQqppolz9VqYSp7IQ=; b=HdVjJpyU7GlpPN
	9M++VrjwtRGX3itqpejGWOGLDxiBu0ImSlDRThV/w7c+bvW1DkFoivLDfLycME3DrfceFEjEj6Ht4
	IsdyM9ygEhcZeciQwx5yDEJ973R2JH4zXdJxB1KuCEfwYsixpa3pdxOJDlSai0C+uTgYQPGkoL12K
	bt91OG6ID/NiRXS7vfWuW20oRm+E4GaDqQhIcxtmgFKkFavR5z8XoJjrLjoouOYvsJaVJsbEJ/J08
	6EwY567bRBl38WuT5vfmyQxRFFxLt39Sy9ShlwptymCHseq3R9GxuI62tDOk0to/WTMTQWwhXPPRc
	MoHLMA421p9nMjzytBHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp0e5-00000003Kwc-3zGF;
	Tue, 26 Mar 2024 06:50:53 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp0e3-00000003Kw5-0orp
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 06:50:52 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a46dd7b4bcbso624535266b.3
        for <linux-riscv@lists.infradead.org>; Mon, 25 Mar 2024 23:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711435848; x=1712040648; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CcYszJVzk4g1YlTjCZo19PYSJoJO6aoTmeXZSldpIoM=;
        b=Uc9iDSRvXukdPeEbkO4vWuKheRoqZFk24PWHeborUF+Ny/H20ovB7umXO8Z+r9mDMU
         bGxAvz90IcBjT1JxXCeKamHm1NMfC7Xs91wpf27v0PstfzGr6Qy5K6t9cmt4tYA+2zOM
         0bflTQqmHbbY9g1T2WRmXTlvgDn4o+oyHSSKOlSyK8yL06dsZK2RZZODwaifRA++V8sD
         hp8oBErYKZ3WrdGm/OwIFa+8jqROx0ScajJRsglBNPjjfSb9H32O6C6Zoaj1V2hSZz17
         wvCQT2+aXkX1MoWo++1Qfc0/yrHCPoAakDNf+imC/RwjuJn5t7fOaKXaVRmHYO6pGzL8
         rlOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711435848; x=1712040648;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CcYszJVzk4g1YlTjCZo19PYSJoJO6aoTmeXZSldpIoM=;
        b=Fv+XOIKZXPAMifjozO4wrhTfphQIeds7cujxA2PAy6dDMJyXPof1Js/won21P8fiQy
         5HRedGyOdpmGq3TBsKs4caueoqR6dtHokod+ydz22W6tpWHhvMMukPzk0KsLNRDKzIxz
         o4ZyTj/Lpf6Zp9NmC0Bp/KwMV/zP9aFPltLOhwDoS619l2NicK2ACPxJ+btFds9eUs6w
         VUuKcVracmUS5Mm7DNEBX4lQSW2FpogMkNMMgRpgK6wbphcdugH46KY7cMMJVd7/C6j9
         WtWLNHd4yqmxOfs01rqBdFvTegieul9WJzPH1HHx28ybxSWxpOdAscu1Y5ytD5IO21ti
         Z2BA==
X-Forwarded-Encrypted: i=1; AJvYcCUUY+MR/bltnuGViyF+bNvelxtqqOL1YjQREamKmQubbbKDpjMpHknZuIh8ecqqu7V06gBQmAkuh8L8w7JpcCP8aa4ClmcJ9hY7+/et79OZ
X-Gm-Message-State: AOJu0YxRS8n17PkPO9Gewu+KhJT5gqZgAqo+HTkwMtzTutn7QWFua8K7
	L/1F9MrY58bla1QY6YRWAtPQs6kVsg+v74ULNh+H3FnPfzw3dtSPLoC9r/JpNdA=
X-Google-Smtp-Source: AGHT+IE4HfWUGwxqmUfayIT22jk+nqjwUsI8ApUyR9/HchWuudDay05zuCJfHGFE1BreKgJVEwWcTg==
X-Received: by 2002:a17:906:b257:b0:a47:39c6:8970 with SMTP id ce23-20020a170906b25700b00a4739c68970mr205641ejb.39.1711435847894;
        Mon, 25 Mar 2024 23:50:47 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.44])
        by smtp.gmail.com with ESMTPSA id h22-20020a1709060f5600b00a473a1fe089sm3867467ejj.1.2024.03.25.23.50.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 23:50:47 -0700 (PDT)
Message-ID: <4a30ce5d-c308-4983-8c7b-d83ced6a9ef1@linaro.org>
Date: Tue, 26 Mar 2024 07:50:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] dt-bindings: dmaengine: Add dmamux for
 CV18XX/SG200X series SoC
To: Frank Li <Frank.li@nxp.com>, Inochi Amaoto <inochiama@outlook.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jisheng Zhang <jszhang@kernel.org>, Liu Gui <kenneth.liu@sophgo.com>,
 Jingbao Qiu <qiujingbao.dlmu@gmail.com>, dlan@gentoo.org,
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <IA1PR20MB4953B500D7451964EE37DA4CBB352@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953E2937788D9D92C91ABBBBB352@IA1PR20MB4953.namprd20.prod.outlook.com>
 <ZgJDCL+aq3ZTE6/1@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ZgJDCL+aq3ZTE6/1@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_235051_379825_192D4A9A 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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

On 26/03/2024 04:37, Frank Li wrote:
> On Tue, Mar 26, 2024 at 09:47:03AM +0800, Inochi Amaoto wrote:
>> The DMA IP of Sophgo CV18XX/SG200X is based on a DW AXI CORE, with
>> an additional channel remap register located in the top system control
>> area. The DMA channel is exclusive to each core.
>>
>> Add the dmamux binding for CV18XX/SG200X series SoC
>>
>> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
>> ---
>>  .../bindings/dma/sophgo,cv1800-dmamux.yaml    | 48 ++++++++++++++++
>>  include/dt-bindings/dma/cv1800-dma.h          | 55 +++++++++++++++++++
> 
> I remember checkpatch.pl require .h have seperate patch.

Why do you insist on that? Bindings header should be with binding.
That's incorrect advice.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
