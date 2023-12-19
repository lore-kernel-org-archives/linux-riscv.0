Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B29C46CA2
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 17:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1qLsm8l3KD3oi1bz3Y/ADC9uFf3n+s60Gh0eceXUNNM=; b=lLbclxEXSBv6Soi87Nnz1Ue0tM
	PpViUKP87hZowlQJrsFuXop2pTxccxGlCjuVy5IHts9smRdD4AGlNqUGgwienRCk990GsW9f7oqZK
	d4UkVt/HDtacAoODjLUeBWG9e4XHT0V7KQkDIULvV5YzfIv2pNaBBk1KJefFUX9LVnzemTsktvpR2
	x56v8kkBiGtnKEpTnxmSp5up40ND1GZa0fCyKggurYwoic+/p/4qpI8stSFYP1gZGULN/d0gYIKd1
	FBNlr1ZoVJvCHlrJmudj1wybLlLgn7xSj0DuL+CahjYrPtw3C2PZwlB8Q8HZfmsDmgFd1WsxqAI6d
	T+0iEZgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFe7X-00F04z-2s;
	Tue, 19 Dec 2023 17:43:07 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFe7V-00F03z-0H
	for linux-riscv@lists.infradead.org;
	Tue, 19 Dec 2023 17:43:06 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40c41b43e1eso61172535e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 19 Dec 2023 09:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703007783; x=1703612583; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TRnmGv8xzBtREryt49zmigJAc9uozsvO/KimVQjMLww=;
        b=ygWn2rneet+i3KAXzCZ2BkXmFiPPSjr9Xf4bVfSql18PWUZ4thcfdPCiWqZX7qpwqo
         t0ll5AMN2hcF2RtWtJM1yjfT5tVxhln07ZaBDDJUwa+x5Ee5aQ7HE3Lh8kFlMGuJe9OX
         QFcQKfKQiVLhhrjuZ92NkrtS+ZeIfVwHYSfrvkoGPaXP0vt0n7+vuN1C1drKa60G5XCX
         Sf2JkKi/pibrpmJFoWMNgUKaiccKpfcu6PPvI9GJK/bldr81TUCD/IPgoJihbnWzZsQ8
         NspUI9T08w70cM4g/MoZfqMFHVDiEZnw/FHQcLZgKT0Q2QoohyJqhZkx0qHZckr0vDUK
         4tWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703007783; x=1703612583;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TRnmGv8xzBtREryt49zmigJAc9uozsvO/KimVQjMLww=;
        b=EYR7CTrCA8vjWuKsPA8+7qJjowRufIcLM1bOAvg+DBHn3e5RsPWcMh4OJZP5MuttYK
         mGA79D84UMTaNMnrxnwbAKUUR9q+MlWKp1y85Kw0jHij9OCKuRbTQt3bS7FYDnlz/mME
         /p/dmuwMZaNPQHB2Um+BKesMsspNCviqhY+4R1pIRg68xQRWF5H0yL9WZW+VFzidiorC
         OXYiBanC/Y9sIn0e1YnfBjNDzJ534wJwbccMJqnNMF+RS6TJijYgiNbzcpm7BaGQnEtc
         KQ5fOXJOMyQ2OzSEh8X6hJfr7qpVLF71p9AFoCLqDW4bIZAUMPFn5KmYl8QVMkA8RJ9u
         +UqQ==
X-Gm-Message-State: AOJu0YwoT5pkJQwfLzt/mBCFM98/wCPQ+hrORH+rB3Vr6ffDuzYS9+m2
	KCCaVWt9xw1R0BAJgtXUKk4UnQ==
X-Google-Smtp-Source: AGHT+IFuUu0ohM0DgqSQKkmxColi/SAtbH6YHORkgyaGUdrSffYDo7d3mbYVlsllH+lOmS2Eou5MzQ==
X-Received: by 2002:a05:600c:2051:b0:40c:6924:5f2d with SMTP id p17-20020a05600c205100b0040c69245f2dmr4379823wmg.231.1703007782984;
        Tue, 19 Dec 2023 09:43:02 -0800 (PST)
Received: from [192.168.10.46] ([37.170.14.102])
        by smtp.googlemail.com with ESMTPSA id c9-20020a05600c0a4900b0040c6d559490sm3942666wmq.3.2023.12.19.09.42.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Dec 2023 09:43:02 -0800 (PST)
Message-ID: <4ed663b6-6c1d-43ed-8417-1704b9adfbae@linaro.org>
Date: Tue, 19 Dec 2023 18:42:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] Add D1/T113s thermal sensor controller support
Content-Language: en-US
To: Maksim Kiselev <bigunclemax@gmail.com>
References: <20231217210629.131486-1-bigunclemax@gmail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20231217210629.131486-1-bigunclemax@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_094305_130008_57D3ADF1 
X-CRM114-Status: UNSURE (   9.21  )
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Yangtao Li <tiny.windzz@gmail.com>, John Watts <contact@jookia.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Zhang Rui <rui.zhang@intel.com>, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux-pm@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh+dt@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Lukasz Luba <lukasz.luba@arm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTcvMTIvMjAyMyAyMjowNiwgTWFrc2ltIEtpc2VsZXYgd3JvdGU6Cj4gVGhpcyBzZXJpZXMg
YWRkcyBzdXBwb3J0IGZvciBBbGx3aW5uZXIgRDEvVDExM3MgdGhlcm1hbCBzZW5zb3IgY29udHJv
bGxlci4KPiBUSElTIGNvbnRyb2xsZXIgaXMgc2ltaWxhciB0byB0aGUgb25lIG9uIEg2LCBidXQg
d2l0aCBvbmx5IG9uZSBzZW5zb3IgYW5kCj4gdXNlcyBhIGRpZmZlcmVudCBzY2FsZSBhbmQgb2Zm
c2V0IHZhbHVlcy4KPiAKPiB2NjoKPiAtIFJlYmFzZWQgb250byA2LjcuMC1yYzUKCkFwcGxpZWQs
IHBhdGNoIDEgJiAyCgpUaGFua3MKCgotLSAKPGh0dHA6Ly93d3cubGluYXJvLm9yZy8+IExpbmFy
by5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwoKRm9sbG93IExpbmFy
bzogIDxodHRwOi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vib29rIHwKPGh0
dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo8aHR0cDovL3d3dy5saW5h
cm8ub3JnL2xpbmFyby1ibG9nLz4gQmxvZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
