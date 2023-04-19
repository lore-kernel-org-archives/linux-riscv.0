Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00716C77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 18:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2YFGduaQ9k5dOgyUZEYHhTBw+GTnUpOtL5N8M1vQNeQ=; b=QCi+UikNq7PjAa
	Ixytvaojcwz6cPbp3sWhw16l55p19XmcpvmS7PjU4HviMoeSemAhSEpsCgnjGKIfDpAA+PZrWO1n0
	gBg+aC3kdWutPd0RYmX9XnzHaaNFiA5wOcMlaItHzE8aQHwmz6zKo/n0GODQsXP/RG+zYOfz8Qi5V
	tgwLMPw6cPbLJodmco81DcxWdlaUCYK2gL5KTDZiMOkHf+/NYIc2vCHrmakIQRvKaT61xSqw0NRxP
	ObZ7C5JpudEq90rZ7FG8X/KVqlD6nfHuCbGuvLSf3LZr2eCItmd8ODqnus/H3ejubcXNzw+pT9cff
	NpmqwZ21d71tlda8OB9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppC6a-0066Tz-00;
	Wed, 19 Apr 2023 18:00:32 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppC6W-0066SN-0p
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 18:00:30 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-506bdf29712so858832a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 11:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681927222; x=1684519222;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2I2Wa/X6Ddr2CE5rQy/YNbr0tj1O7f8j69D9Dt8gE8A=;
        b=KgWFma0xE4JrAty0GXMD93VqdwMMQIlJ/WTBKlcDPSiu2gr2ApC/KBIL5x5MzOoOaT
         zuk+E+XH70UbzTgeMvkyYHBjzgsDbJXH6f9KskUTlEVotUPiy/51lmikd0CA2zw4KfxA
         blhu0oGCRtDvKCEo1CJMEszRr7mdLRfVGIPPBgwtgj40ThdEz3hVE6CxZIzKvrxylG05
         c/it9ENcHlXEJJMnjc8CVl1b1stylRltWTKg1RDZq4ulfnC2KUukSwv2iaDI6tPGNgDg
         HBlNwZxjNbwPVIqvQz1Fxu3hSDF7ONd+61B7zLtnj+RDOdGDHDplqBILRkCOQG+iLpHo
         fRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681927222; x=1684519222;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2I2Wa/X6Ddr2CE5rQy/YNbr0tj1O7f8j69D9Dt8gE8A=;
        b=Ya/iI5DZ3XP8RwlbVixOFhYjBWv6ctCGuyT3sJ7udQl+vsVDIEBe6fkud5+5kFdOpm
         z22/8VmAg4hzxtj6/CrNMqRDcS/dEN9SU7t2c7BZjRySrpEjBhJdm4danfMfaSHuWvBb
         +S0zn3VMrS9SZD+m72naBMWHREVOw1yz6SiAnOsACwlQz1iJvcOuqJTmATTbgHiGrIWu
         aJ73IHL9TLVQbfcnLvDeyz+zNLXBmhva2WoQ+CwzUe5Hl2EL/MZX4C3yhfDSzA/KRbz2
         LTnbJ2v1ESHVlBR/ppzBVbE/HI++Wi/pwaOn2vciHFJ/8GAj5HL7uPmR7e3gJqYu0Obk
         58Kw==
X-Gm-Message-State: AAQBX9cfyBV776iqIpjHDNzFoKT2aBCnLDSGo6Ker7LrYSiC93Sek0e2
	3kXBKfwXVIhDIBkcAtNKqUeqLg==
X-Google-Smtp-Source: AKy350a42tEOCE3He5e94ySjqTXikL5UDReEMgplEfXFidB0B095T+B4soS12NaB+U7/9uOpgw8fEg==
X-Received: by 2002:aa7:dbd5:0:b0:504:9e79:e86f with SMTP id v21-20020aa7dbd5000000b005049e79e86fmr3031031edt.18.1681927221879;
        Wed, 19 Apr 2023 11:00:21 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:b7d8:d88b:1fac:c802? ([2a02:810d:15c0:828:b7d8:d88b:1fac:c802])
        by smtp.gmail.com with ESMTPSA id m20-20020a50ef14000000b00501d39f1d2dsm8260610eds.41.2023.04.19.11.00.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 11:00:21 -0700 (PDT)
Message-ID: <d655a748-4022-8d77-2f40-83bace7394b2@linaro.org>
Date: Wed, 19 Apr 2023 20:00:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/6] dt-bindings: power: Add JH7110 AON PMU support
To: Changhuang Liang <changhuang.liang@starfivetech.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Walker Chen <walker.chen@starfivetech.com>,
 Hal Feng <hal.feng@starfivetech.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20230419034833.43243-1-changhuang.liang@starfivetech.com>
 <20230419034833.43243-2-changhuang.liang@starfivetech.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230419034833.43243-2-changhuang.liang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_110028_299608_91F7EE18 
X-CRM114-Status: UNSURE (   8.86  )
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

On 19/04/2023 05:48, Changhuang Liang wrote:
> Add AON PMU for StarFive JH7110 SoC, it can be used to turn on/off DPHY
> rx/tx power switch, and it don't need the properties of reg and
> interrupts.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../bindings/power/starfive,jh7110-pmu.yaml       | 15 +++++++++++++

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
