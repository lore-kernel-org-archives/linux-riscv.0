Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A6AC4829F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Feb 2024 11:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DB4abJgnjgrQ1jGl+KKR2xDbzfwJdefx7ZpQZdvQsVw=; b=sBSyu2eIGmnOvE
	L8WtpHfaInuggaArZdjEGGlW7a/YRsB8KBCEZjVxhkHMI9X61yUzaAB88VrJk2T3E0GVlPQ0yOW+B
	+0qd1SYaGEBnuD7K4f9SH52X2Cvt9ebFsJezVATp7MCV7dq0Nxx16s2KdLlX9Qy2+wFosABa9f+YG
	NsHvLW+5uYynBsP1xWijdm3Bb2LVPGphCPmcu4sLwK418MPzpcQcOGGDNRjcYK8Y1BT/T0wHWlFS5
	2qMyHgqdEmIESV3OF1fbmhOUJNwuCAZro1MKfQHGNcI+x3Y4f5jemAuybRZuHJ+t/S6GEkB3xXbLN
	GAeuyt5NsHPR9NPpfuZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYPVQ-0000000Gunf-0Vlo;
	Fri, 09 Feb 2024 11:57:20 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYPVN-0000000GunK-2MQr
	for linux-riscv@lists.infradead.org;
	Fri, 09 Feb 2024 11:57:18 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-410504b5cf3so7105325e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 09 Feb 2024 03:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707479836; x=1708084636; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s1AGI08loNSP5zs2tQjZO2F5Z+x9CwlZlooCUALsHSk=;
        b=PoVOP+yiUyrG6/3X5fVH++3AssZ1ezK05/HVqFIK/cJE/dN4PWSbcLHfGdgFYS75sZ
         iQpRfMRbiDbNRBXm7foWi1HkPP1RgwYi0FNBfC1O6qFRRzRzk+BfYLmCmVkABcL1SZ3H
         2Zi6evfxV6XD76jc+EEeJLdv0Fjf4LOjopASGXClT0Wtxwesz1MFLdpGlmbcEzX8Zha1
         cPGo+70nBMO0h6D9UMFI4rWNKfzDwNvoZ4vnDLftn+cPl1BRD1pT+gqKC/uVWcxn3xRc
         x+0SaGMMQowlVewC4xavfF9skwSIJ90xHyDJk+OajbIIjVy/IAASlHpIceMvKF+CUOqM
         0QRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707479836; x=1708084636;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s1AGI08loNSP5zs2tQjZO2F5Z+x9CwlZlooCUALsHSk=;
        b=p8MDYZZDf2Zyhr53KGskebdEgtMvdpE353/vpK0IpsWU+hPLoDjDs9WWkn2i/6F6h8
         V3168uJRX4YE/9frEvVxNk2iS9guenzlnbJ+GKFRVaIKHTS0zR/bcTZNrA55zpELPbf1
         K7LPbWTRGCws6EAOK+/PM1tX4Ulv3CUPjCM4tOWoNZCZf1/fS1jkMwWRH5TZ/YDTPTOT
         8tRLmgBu4hACXI6fOdpb2MBjZoI39ssgJf44TDrAGIwVzB0CqrJMRZ0jBm4hkUqwlbIl
         Y00gfw4AR5y9IcH7KF9jqaLSFwjlq3pjm4sp17fuqIknXDC8XFvvMB/w7BcumiY0X6yo
         gq+Q==
X-Gm-Message-State: AOJu0YwqKiqpvu8gSuGtR/8zXIPcVPjP3e3vx/aGjzlqKyBJRza43aNL
	5EhtIMsRPLtxKqU0LFVHXZzLEF0TKcPkbqAMJHq56nXugW8GTxTlJG8dkwDUR1g=
X-Google-Smtp-Source: AGHT+IEKzu4OuFFBCPwKZoMQia7OUvrZSIFd3Jvmqto4G+RVfQMhTVHmnKJdeyHKOtvS5NI6eTUdog==
X-Received: by 2002:a05:600c:19c7:b0:40e:b447:ae7d with SMTP id u7-20020a05600c19c700b0040eb447ae7dmr947456wmq.33.1707479835728;
        Fri, 09 Feb 2024 03:57:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWaqRlja5LmVmSLBC34yIDZX/OpKcoeNWEH/++uyCsiufhNaTzwB+ruJGChVPLdlAc6+inB2hhNBlnXPee11Vspf7mMh/6ALqIHyj/GUhdqXNqNTx81mvyuBGyu1p/4sO8hfpuGuGk1UuEOH3bjQ0hs1xHFlt1zdTg79SEH2xqEaZs8q1sngx8EVRTb/p7TGpRzwjNOjcF/EnNOX2ER2X8bChWnGpKXLRtPBI7iF2YDRXbE0wmRk3LSOfKzC1eyVIMoy0tUZI/BtZczJHiy6NtyG0ChhsZR086Elt2Qa6xaASy0CIoBm2Q9PMwIpkGCY5yVczBepGfG7JpD1sa19dk5CfjxOiEVRYTeoP6TdnT2gpu1EA5aTEzApEf1JaxmKPmMXYEOg9moAwW5bimJHnIoa9nstIu+AegPhZoT1GxiZV8qoFkfeTDfBM+QQ6mwISC40lO1LrtIO/9J+bWchpDs96iY/H1QXSL/N/7LMm7FGvXfthIlbK/CtqmbAFllEeXXsXdzjFEPBDDj3/CsqqLYOOkt7x5c9+X7uTqtI9GlluFYfhD+EQ==
Received: from [192.168.50.4] ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id c11-20020a7bc84b000000b0040f035bebfcsm412491wml.12.2024.02.09.03.57.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Feb 2024 03:57:15 -0800 (PST)
Message-ID: <a280eb6b-e7ee-4136-a555-3c9ec19dbb8c@tuxon.dev>
Date: Fri, 9 Feb 2024 13:57:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/17] dt-bindings: clock: renesas,rzg2l-cpg: Update
 #power-domain-cells = <1>
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 magnus.damm@gmail.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
 <20240208124300.2740313-7-claudiu.beznea.uj@bp.renesas.com>
 <2ca67a77-b51c-4f7f-828f-8d91d8971c75@linaro.org>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <2ca67a77-b51c-4f7f-828f-8d91d8971c75@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240209_035717_734019_795F88C0 
X-CRM114-Status: UNSURE (   9.84  )
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



On 09.02.2024 09:56, Krzysztof Kozlowski wrote:
> On 08/02/2024 13:42, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The driver will be modified (in the next commits) to be able to specify
>> individual power domain ID for each IP. Update the documentation to cope
>> with this.
> 
> You are affecting existing users, so you should explain that you keep
> ABI intact or if you break it, why it is fine to do so.
> 

OK, I'll improve the description. The ABI will not be broken with the
changes in this series.

Thank you,
Claudiu Beznea

> 
> 
> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
