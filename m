Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB13EB64D9
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 06:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iGW6nomq7mn7gNb6JJuHFPlPFEmm9F+xh6IqEsrTRAE=; b=vjaqGyw3RvCf0L
	HamRoWPOd5X2yc0AF0EcuXvmjEDTcUwiE4VGus2FqGPz07edhHTymcqut+IwZRuPhDh5FZ2Pbj+09
	wkM4j/vIKGjY6MMGk35sm8FR0FX969xUvCTDUJIDmjRM3u0Fms4A0DP1E7Ylx+DLZvO4+tJFltc94
	hUNAjNKk7NMHPCuoi6kXLno4e1eDCUA6vfw8pCQV10V5ymV9nXVQvRrVYGsukeUoXMWkBzPwRoacr
	9NBF4CA50xqTGdtwC7l18Z1r0nEkVng2q7VuVekaD82b7TqsmBMJtLR8ESrNdtLMokfbCPyFX/yF3
	p8gM/pQ9DA9dSu34kFag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGZYX-00CJvt-2b;
	Tue, 04 Jul 2023 06:30:33 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGZYV-00CJvG-2Q
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 06:30:33 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-98e109525d6so946930866b.0
        for <linux-riscv@lists.infradead.org>; Mon, 03 Jul 2023 23:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688452229; x=1691044229;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g3yiVYKtVrIktx4ZXP2LxSktjdyjNOhoOg2Mns2klPY=;
        b=M6HUebP4sZYJ8sIy3Ulw8RejaiM+OUUBFDv0FnO16yEv5/tUV91WR4q1dWdzG/Bq/Y
         NlaQbI39uIzwqCfchN+Ff9c8SaNUWxjoL9ilI5LukBQBpVm8QJrEPn2FBPQe4cqbom0g
         fqknBmeYBapuhiWOH/4Yo6zBFNU0g1+9+bDRxpLdhCgFTCadvn0eVbLiwxh+Ep4TDZUt
         akG00H9lvXGVNRZ9trbrSY4qxK4jw6Utl/o9lCcromjvtwcaV7lG9WqZkfYkQhDS5YfG
         iy8vzgEF/QrxTFJ1mJGqyykCmjMxWPykEf/LuEqNLRD/68I8gr0gBMHRiugUdXjQ4roR
         19ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688452229; x=1691044229;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g3yiVYKtVrIktx4ZXP2LxSktjdyjNOhoOg2Mns2klPY=;
        b=jQRNoqvkosTlxMKvqAfR+7O0RjUBQldaXVyyny2J+WNsUgYCFQKAjXOynkXjmDKRN8
         7fxArpxD/tw/fgdxmqcTtPV6NYqcGiZwi2H4Oi/OVZ1ybuweiV1oIBblEXvbI1cpyVHD
         SUwnyntHkZaENNc1uVXb/48t69UYPU38VYP6uEdYANqzA55XPxK4WZ8qsxfmeWYaiagU
         dteJ33WW8EfLJkcLbXN75gIaZnLaLx9A2BBn7MI2VylnyGnxzj4YpfZJnqyv6Kbu1LdG
         9oUImQTlgSRBsHUrh6pAIM/g83Outsp5z27YJYz+Ehkbgqb7jt9CjPo79p3fgqr9xw7x
         HoEA==
X-Gm-Message-State: ABy/qLYgTFbD+edckyi+BRubgg50FQKNr6B0hBYmcevqy3561kSvECFW
	1OUsM+3Oe2/jVA/QefMAZqp1+Q==
X-Google-Smtp-Source: APBJJlHEb87nF2ukavgKodzV2jO99ruTM6e43xXxQc8WM7Dsu3Ys8LNXjWdApqFlzHUz/nR3g9drLQ==
X-Received: by 2002:a17:906:39da:b0:973:84b0:b077 with SMTP id i26-20020a17090639da00b0097384b0b077mr12490256eje.33.1688452229530;
        Mon, 03 Jul 2023 23:30:29 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id a15-20020a170906468f00b00992b510089asm6496258ejr.84.2023.07.03.23.30.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 23:30:29 -0700 (PDT)
Message-ID: <c2edda13-c674-df56-d1a2-cb47b405b896@linaro.org>
Date: Tue, 4 Jul 2023 08:30:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v6 2/7] dt-bindings: soc: starfive: Add StarFive syscon
 module
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Hal Feng <hal.feng@starfivetech.com>,
 William Qiu <william.qiu@starfivetech.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20230704020239.288500-1-xingyu.wu@starfivetech.com>
 <20230704020239.288500-3-xingyu.wu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230704020239.288500-3-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_233031_863376_DE063E67 
X-CRM114-Status: UNSURE (   9.03  )
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

On 04/07/2023 04:02, Xingyu Wu wrote:
> From: William Qiu <william.qiu@starfivetech.com>
> 
> Add documentation to describe StarFive System Controller Registers.
> 
> Co-developed-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>

I don't think there is a point in reviewing bindings which were never
tested. I hope you agree with me.

The patch just introduces errors. :(

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
