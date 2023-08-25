Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D10C3DA66
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Aug 2023 09:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GKzjmSD/26G4QjwGJi6dfgsaI0yYot59tHINgZBRZi0=; b=pl+yAzd86GNKkf
	7AfTRJmu2aTqy0oAG4a9nTmJ3M7m07tQVrYb/EfYK6SkntVE/V8BjO5Ct4KsEVc0SVZRhHt209l7L
	yNuEWsypdIoqZeOoaV7J2bVovOrSnlL1714lDz5SqzzBJKsPSG4ScsyMn5w49X8Vv9LSlN2xdU8z0
	6MzhxFop7q7Duo+/RvFF01h+v5+j9BbbT1M5qhGbLl/KH9CmdvTHR7w5uQKMmvv4uesN2bB9bDC0p
	5beBJjGvhHzEiLy6juPSCqkWopid/dmk0QbhWQ+J7QIqlBp7yyugznRWKtmL3qb7i3s+acwVKoSxD
	tyFTy7L2Fq2cpqxiJZMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZT0X-004iqi-2D;
	Fri, 25 Aug 2023 09:21:33 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZT0U-004iq6-0O
	for linux-riscv@lists.infradead.org;
	Fri, 25 Aug 2023 09:21:31 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-99bfcf4c814so83375666b.0
        for <linux-riscv@lists.infradead.org>; Fri, 25 Aug 2023 02:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692955288; x=1693560088;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BZgZaMT5PxJw7tH308zexA8qRHLlWqjM6kGNr72Z26s=;
        b=jgOPuKgBX8LsnrVBpxagR7rRtJfRP/bebUcJD3vsbi9xMm9l58gC5cw0r9Rwle91RV
         Wja0F4kONox6Ip3jRnT9XV1l0mvTExirg4luRv4XJDQm2JvV9/i18ZZPEhs3fb8wp/EA
         Wxi/KVB6lDqtjacSQIuEtNyipWhI37UPSYngi9L0IhEotJPJIBsZrQPxd+O2kFkqjPap
         Oyj83NsoppXK2usstyN2s52q7Xr8jf836fC2pwmfwgYphLNfckGneihT7c9/Z5C1tu3I
         pJV+fMDodmM9NYPDGckACE9KsEhilTtRo1YK5WuEF22EomDIDkAmJ9enp9I9A6eEpXa/
         D9dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692955288; x=1693560088;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BZgZaMT5PxJw7tH308zexA8qRHLlWqjM6kGNr72Z26s=;
        b=EtwlVmXWl0xphuwC8DcWVLDMG1mOxxszIqNNIKn2WCVrqLMQU0IjJ6sBmS0eJmiDMJ
         Jl3X2aNprSN9S7/F/T0Vw+SRtqceYf7R3s+M0SzfsDj8GV0pPfUptI1Z9r0/j1KgEtf6
         IN6hpD8eNngMKPOMxFV0K6iWlz4iBES9BBBJcsLWpU1FFFYcnne2sriO78v0dve0093y
         TSokZJPu+qzB7KJTqA2PsnShAD8/Rdxz8AU1Ye4No9+xhxZqGKkAwLR6xuax//354HNy
         YaghfCExDJHC+kJ2O/GRjMkBvRBXC0nCU7kdssT346TpwouoFsHouKkillD1stweDe21
         /iNA==
X-Gm-Message-State: AOJu0YzLKJk8VbCMoJrNfwmJGqmUEgnEbHmGhPxfRj+P1bqdy+DMDZje
	PDggx3zLX32gfIm4sQI7nwv8xA==
X-Google-Smtp-Source: AGHT+IEo+aS/DfSwbspGBPf6zJxemZO9RG5G7PRer+UtxBoyL3dwDOJaiFVu4h7L5dLcZvA/9TmNCQ==
X-Received: by 2002:a17:906:76cf:b0:9a1:b98a:c723 with SMTP id q15-20020a17090676cf00b009a1b98ac723mr9218632ejn.4.1692955287927;
        Fri, 25 Aug 2023 02:21:27 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id ck16-20020a170906c45000b00992b8d56f3asm738608ejb.105.2023.08.25.02.21.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Aug 2023 02:21:27 -0700 (PDT)
Message-ID: <f04b6606-6ca9-28d1-6a10-1e543a5d5fb7@linaro.org>
Date: Fri, 25 Aug 2023 11:21:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 09/11] dt-bindings: PCI: Add StarFive JH7110 PCIe
 controller
To: Minda Chen <minda.chen@starfivetech.com>, Rob Herring <robh@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, linux-pci@vger.kernel.org,
 Kevin Xie <kevin.xie@starfivetech.com>, linux-riscv@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, =?UTF-8?Q?Krzysztof_Wilczy=c5=84s?=
 =?UTF-8?Q?ki?= <kw@linux.com>, Mason Huo <mason.huo@starfivetech.com>,
 Conor Dooley <conor@kernel.org>, =?UTF-8?Q?Pali_Roh=c3=a1r?=
 <pali@kernel.org>, Daire McNamara <daire.mcnamara@microchip.com>,
 linux-kernel@vger.kernel.org,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Albert Ou
 <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Leyfoon Tan <leyfoon.tan@starfivetech.com>, devicetree@vger.kernel.org
References: <20230814082016.104181-1-minda.chen@starfivetech.com>
 <20230814082016.104181-10-minda.chen@starfivetech.com>
 <169228685644.1140409.12427674208274594176.robh@kernel.org>
 <5450650c-3750-a0ee-72a1-bfa0a4545e0a@starfivetech.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5450650c-3750-a0ee-72a1-bfa0a4545e0a@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_022130_229205_8D18B409 
X-CRM114-Status: UNSURE (   8.44  )
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

On 25/08/2023 11:06, Minda Chen wrote:
>>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>>
> Hi Rob
> Thanks. 
> I see other PCIe maintainer have not reviewed PCIe driver codes(or no coments).
> Could you help to review PCIe driver codes patches? (I just commit new version 4). Thanks.

Please relax, and help out by reviewing other patches on the mailing
lists in order to relieve the burden of maintainers and move your
patches higher up the list.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
