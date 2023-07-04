Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88133EB64D9
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 12:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HWD+UFnJKVWoGoo/4Bl/SNzbjtwxTjwUsgSsOjM7TXM=; b=zoa9i/oUeS8h3q
	HQRzEIyjSd7i/8hVEYAWZmG1lqp9wBo1eYnmcW/t7ANiC0iCXYI6YvGIe70QgLSfNp6Zr8sB/NgDf
	RoRmmUSwrRAAgMUpmCbygk01PMgD+li3/WAE90q6no53iCOIF8N455+w3RA/VnyWGcVkHfKbk4ami
	vxGPsqVSh+qFA62FO4DycVY1ND8btMZgyjGFixqJnmG4v5sBI1yq8izNXka+3X6VtqT0EdboOaDTy
	YxEYXTNuyr+pBRo/uDoIO2sgaXdH5Hysyv/ufPaNo1H1AswkfVXqbxsP/AhMJQLPET1uvGp2Z92VB
	XmVlHM3Okav/0fdkCe9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGf8Z-00DGao-2A;
	Tue, 04 Jul 2023 12:28:07 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGf8W-00DGZw-0I
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 12:28:05 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-992ca792065so580806966b.2
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jul 2023 05:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688473679; x=1691065679;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SevSQ95ow3GtjYpqXgCPnMrECe2jzasM0xVgVLW819c=;
        b=fgwp2G4rHlpBpyYwQHFN+c8PamgAxQJjZb4Ph8qKhZ4M9mCE+NXFd3tZR1OJpdYl6y
         j879K72BdCsDrvRi0s9o6ClSTHUarfwo5MGBAA/UrKyS4/GxzvJCPMg8rcNHy2eeBSC0
         /wLonHBc8XRHaXnVfPbU2B6GUcv+kT+If8UJd952WhXDhZB38pnXvjUiPj2Dhumqx5+f
         zBcPDWbHSCNfuv47yjqbmmKcDsGE2SX8zqHdlKYwhSXtHrClDiTUqJ0XvPsJQ6x8f/r7
         l1v6HYZPX2jgk7UoO+Gdde6BRMSN3o4AtQtufyp7fxcJAXZh041ggRIYBIPC/wgKFroc
         Okag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688473679; x=1691065679;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SevSQ95ow3GtjYpqXgCPnMrECe2jzasM0xVgVLW819c=;
        b=iiZ0g3mIUPe8JwjWxpuJfqm16uHy9AeL9r0SCjKHkj40rE9JNYyEBn4WCVSnROtbkg
         30LuoBCzP1qr3idZOfx6ErQzAZOKlXKyVCenVnBdVhqtcyfPo4APpkEvuDLFwmsPGtly
         3R98W0AJ6u7BcKDQ4xqsY8VMMYihg9L0V0lf0gl3JEpl2RZgoLacQ1YdRrxI8ANpj4si
         PiVjj60v9THOLATyV+yD0/M7HYUqFWgRn71IkDvnv6AeFJwHwG7wKVkfjLv02x3MhpxQ
         JgeMIxbWN/5ZjzWb6LmeMWSwQp1Mb57ToGTTq8cV3YjCLul3Eyyg8hGAihXReWgQa14f
         dFAQ==
X-Gm-Message-State: ABy/qLZi6YnxyfVjcyY/hAug+5AAI9kMWvwWukfCGSeXJ7dboqQbGxx2
	coNGgi2HHZ4E0a5b4Vu93avheA==
X-Google-Smtp-Source: APBJJlH19su5vA9EyL6D7MtXA5VlLwKOm8UcW/oRKW1bw+rDa/li+5szobRKvBCIOYgZGAJ6K98IAA==
X-Received: by 2002:a17:906:5296:b0:977:e310:1ce7 with SMTP id c22-20020a170906529600b00977e3101ce7mr10322466ejm.38.1688473679643;
        Tue, 04 Jul 2023 05:27:59 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id n5-20020a1709061d0500b00992b2c55c67sm6979176ejh.156.2023.07.04.05.27.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 05:27:59 -0700 (PDT)
Message-ID: <4afd90d9-f1bd-f40d-1c79-50fef1406ab7@linaro.org>
Date: Tue, 4 Jul 2023 14:27:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RESEND v1 2/2] riscv: dts: starfive: Add spi node for JH7110 SoC
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: William Qiu <william.qiu@starfivetech.com>, devicetree@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Linus Walleij <linus.walleij@linaro.org>
References: <20230704092200.85401-1-william.qiu@starfivetech.com>
 <20230704092200.85401-3-william.qiu@starfivetech.com>
 <7f3b600d-d315-22d6-b987-eabfe1b04fdf@linaro.org>
 <eba1e868-6371-42fe-91be-bcbee54d1aff@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <eba1e868-6371-42fe-91be-bcbee54d1aff@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_052804_171145_45A1512C 
X-CRM114-Status: GOOD (  10.06  )
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

On 04/07/2023 14:26, Mark Brown wrote:
> On Tue, Jul 04, 2023 at 11:39:29AM +0200, Krzysztof Kozlowski wrote:
>> On 04/07/2023 11:22, William Qiu wrote:
>>> Add spi node for JH7110 SoC.
>>>
>>> Co-developed-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>>
>> Missing SoB.
> 
> It's fine not to have a signoff for the codeveloper of codeveloped
> patches, see case (a) for the DCO.

Also see:
"every Co-developed-by: must be immediately
followed by a Signed-off-by: of the associated co-author."

https://elixir.bootlin.com/linux/v6.4/source/Documentation/process/submitting-patches.rst#L467

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
