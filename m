Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38077C77B7C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 16:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h5Q4v63/SVOPYLng65YVkkQwAjRnZGTuuy2fI6dPGvw=; b=Duxv56ZOJJp2tf
	c2B4FEhu0jlUkALTOvwJynPspNgY1fugg9epXloFSzhsGoR6+IiIQgCKnZCZYtFCpH/ujB01MaMcX
	U7BkJF9cHL8FO4RdjdHhhcAMgDfxmSRdLPnw+XG1P2Dinc/vLmvo11DPgmw/2/+kExKoQF5/eUJaK
	KtXO/6cJ2m53P8f3Aw0n5dKRZ3cigsOTyUtM55lfTysBVsw1Lsd5HnwH868OdUFl7Ama+0kZxOow9
	ZXtjTt6/KQKSOIIFzpUfECAx5hA8zoLSIAOrz0Y9htUFQ5rsyWUQpf2uxFtpVAKKtg/sje4OAOVN8
	/RWOTetquA0zqomEUMRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxVQQ-00CSjQ-0U;
	Fri, 12 May 2023 16:15:22 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxVQN-00CSiX-1X
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 16:15:21 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-50bc4ba28cbso17951401a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 12 May 2023 09:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683908115; x=1686500115;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hUq6/DZf13eTt0uNBk3s77EkqNPgzOna1aPYktM8nTw=;
        b=kBUkwgxaZvyrfNKUDntJk6u1EOyyeVTf8HJWeOMB6SZ9rdONr8Oe2K2T7OKWDaNT8G
         VATv9aNeZynsG8bHCMHBDbCQ9918ijbrtIqqOrWDcnos81MyU0BovNVVXxlkIm+ObGN9
         9gvBMLTML36e6o5MQtwEEOngCNwsdQ0wKPu7Ol3Y4ldWCpIJ6LT527AqN+DGMxITpAPd
         OR7CZhQa/WMOI4mcqi7lMWjESnGCpO0sKK0f1j5kHXpsdpEyN4OUIRAidrcaI7/rBKnO
         OikRxKdIF4s2Slm7029f4wiTdRPifsKMPiTTIMC+cJEkqYXxkTfwuHOminwCNVZX0QR/
         pjMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683908115; x=1686500115;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hUq6/DZf13eTt0uNBk3s77EkqNPgzOna1aPYktM8nTw=;
        b=AkqBiY/kKCb8ujzpDO5Kddp+fcAyTfINSAgLYYlOrbNMFUvRzJ/P/xsokIbxAhH8bu
         pEGyd/RFdEzraJo2jbIubk9Ts/MbgkQcRtjQrHUwu20lpYpjcb/e11sINkAblT3cJYm7
         +U3pcZAcfnoDR/2Jt49Pn08cHAfPetj5NJ5a9dhxfPTazlC+NPwvwG5wVku8lBz8gl6C
         Oo24wqlFupQHy/3GtKbl7kl3sYMeNRDU07r31I2xeTHXSfe3RLYDfdCOd7vmVOmx3AS6
         tfawixprYYrSHggWiZj+YbJLbcuOt5/7WlKRPQKm2u4Rq0f2/a9HnEOLrDXIerXRP8QY
         hgJQ==
X-Gm-Message-State: AC+VfDxLhy4vl5hA7ds31Y4GJd0efqRDB/jzyONMalDjKIgPZHtPn8ry
	jc1NLWgv0x55++zJ+W4jYaKNxw==
X-Google-Smtp-Source: ACHHUZ5sgulPYe5AhCZyHfJGTCnGic0FeB3uppKq4p/w0ozgyCOZ9N6sAHz3JhMS+OVeOmz1kVSx2w==
X-Received: by 2002:a17:907:16a5:b0:957:2e48:5657 with SMTP id hc37-20020a17090716a500b009572e485657mr24821909ejc.68.1683908115463;
        Fri, 12 May 2023 09:15:15 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7ede:fc7b:2328:3883? ([2a02:810d:15c0:828:7ede:fc7b:2328:3883])
        by smtp.gmail.com with ESMTPSA id e26-20020a170906845a00b00965cd15c9bbsm5625220ejy.62.2023.05.12.09.15.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 May 2023 09:15:15 -0700 (PDT)
Message-ID: <053b4f08-5a3d-b88a-c808-babffd78aed4@linaro.org>
Date: Fri, 12 May 2023 18:15:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 5/7] dt-bindings: soc: starfive: Add StarFive syscon
 module
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: William Qiu <william.qiu@starfivetech.com>, linux-clk@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Conor Dooley <conor@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring
 <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hal Feng <hal.feng@starfivetech.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20230512022036.97987-1-xingyu.wu@starfivetech.com>
 <20230512022036.97987-6-xingyu.wu@starfivetech.com>
 <20230512065046.bhblj4uci7hnjoof@krzk-bin>
 <6cb0a92b-df60-7b04-775e-d7f0147ce737@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <6cb0a92b-df60-7b04-775e-d7f0147ce737@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_091519_523051_74ABACD0 
X-CRM114-Status: GOOD (  15.29  )
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

On 12/05/2023 09:51, Xingyu Wu wrote:
> On 2023/5/12 14:50, Krzysztof Kozlowski wrote:
>> On Fri, 12 May 2023 10:20:34 +0800, Xingyu Wu wrote:
>>> From: William Qiu <william.qiu@starfivetech.com>
>>>
>>> Add documentation to describe StarFive System Controller Registers.
>>>
>>> Co-developed-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
>>> ---
>>>  .../soc/starfive/starfive,jh7110-syscon.yaml  | 67 +++++++++++++++++++
>>>  MAINTAINERS                                   |  7 ++
>>>  2 files changed, 74 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
>>>
>>
>> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
>> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>>
>> yamllint warnings/errors:
>>
>> dtschema/dtc warnings/errors:
>> ./Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/clock/starfive,jh7110-pll.yaml
>>
>> See https://patchwork.ozlabs.org/patch/1780353
>>
>> This check can fail if there are any dependencies. The base for a patch
>> series is generally the most recent rc1.
>>
>> If you already ran 'make dt_binding_check' and didn't see the above
>> error(s), then make sure 'yamllint' is installed and dt-schema is up to
>> date:
>>
>> pip3 install dtschema --upgrade
>>
>> Please check and re-submit.
> 
> This patch need patch 1 about pll clock driver binding.
> Do I need to merge syscon binding and pll binding together?

No, bot has hickups due to failures in Linus' tree, thus false positives
are possible.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
