Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D5DBC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 21:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9ohT7T7pZPusYC65xP+EkPWQ1J5HFlXZaB2WtuI9lec=; b=ho+CkxUKX0xzE8
	08Yu6Ufn3sDAntxDrZtOzkJ6G0Bi/fXi/25Kd92I8+5EygJPyz1Llj1EBD4eApd+F0qMxvy/N3tG6
	i/T/1LbDF11AA6zN0yA/H3K18sMU9nO44IQEWMP68nNhOb+BTc4oA/k5NFSN/af4GHCQiSPBF/qT2
	0MX/33GsbFzD9XWLJxfM9i/PSQ2b+1wO6zeY9X4Uq3wdlskEdhud6DrZnNmSTDNkP08vXvpginzeC
	ezMWa7npH5ku030Uif9UctJr/FJTLRqc3B/NG5j55ansIRb9rX73/yDPRLW2fFtRUL8x81EBUEZSY
	rZyT6eHTRKx1UilTX3Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJiVF-00Gv6k-0C; Mon, 14 Feb 2022 21:03:21 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJiVC-00Gv5v-E5
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 21:03:19 +0000
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 76ACC407C1
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 21:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644872596;
 bh=2bp2Rosxu6+8ZhH/EAY6coxFH5lGR8Dxl8BwV5vJAno=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=o41X+zynfUPUcd2sbWIPFOg1A/wLabhJFwt2emay8OHXBMq+IpXsK9PQ4WpqL6v52
 dGDAXTUiEwd/BE52L95/3m1QJwsYkNjay9CCId6gXRBmAMTPJlxqmweS8FaD2qzosa
 1OzLzqsAGldJPgYECAGj67Sr9p5BswLC5qeRhL18IpsDBRkHeJflTYWdi/78bgKQCK
 1AlGIdOBUqvp86qf6iaMkshb0SWciC/pMF9qyYDdZQb3kU6Wiu2Cb4nbzNZ6iTb2k7
 X8lGKaL9MQlTG6Gq3QZaL5bHs4dV2B32BCYHZKfLystEa/c6dWBaqMuYaCbZbA4bRI
 ZSd6KkfOMLeiA==
Received: by mail-wm1-f70.google.com with SMTP id
 r187-20020a1c44c4000000b0037bb51b549aso196595wma.4
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 13:03:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2bp2Rosxu6+8ZhH/EAY6coxFH5lGR8Dxl8BwV5vJAno=;
 b=ZvDqB9cjdHTfCjmL8Np8sFghsphPRbLBEgeY1ALlVmeutzl/rFr0zkCxEU+B7cq/Ck
 kvr2rgIGa0th6cw+JMK5hWKw3eONdjmdFY5YbIO6+42sOoBNmhlUXdnS6AGx4qeFVgQC
 Nr37GwaPmdhb27jxRb8WdQ7TGS8YgJgx3jRXz28AwzePsS+ZDYFcVwY22GiRo10NTsmQ
 qB8RWqTo3K5ZYUkrw4leK+Sk7MJuBXURrdBkw/EHut6RXMpbAOdanSXyD34+BJm4nAfP
 DldNy6FTpxyBMH7eqdFrVsFy4M8YxjRQV7tIObWtzXb0s815ppyWUlH9o2OdxlICqTie
 x3eg==
X-Gm-Message-State: AOAM530vYN75t/cGwouDu4r1GNkBWopHpdK4KbJUW+uXO/vDLtZ3BDvk
 q/rDAy9j3zVU9WrVzurkGK19BhzCto3RoMzDtrFVhWxNfeW/QfHzzEOtgh5VFacvgFzS/FAR2WO
 QIVoz8HSmXqtgmT6qVpiOu/GbXyp91P0/5biyEe+lqLvScA==
X-Received: by 2002:aa7:c3da:: with SMTP id l26mr727113edr.294.1644872586133; 
 Mon, 14 Feb 2022 13:03:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx2FJZ3WFrmr3yKtdBu95hKE7kW2/adNT3dVxtT4u/B6q+4CQFvbOXViM594Gt5SL7EJZdGvA==
X-Received: by 2002:aa7:c3da:: with SMTP id l26mr727056edr.294.1644872585884; 
 Mon, 14 Feb 2022 13:03:05 -0800 (PST)
Received: from [192.168.0.106] (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id j21sm1153464ejj.193.2022.02.14.13.03.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 13:03:05 -0800 (PST)
Message-ID: <f9cdef5e-a52b-03ba-a069-e0bc16ccd595@canonical.com>
Date: Mon, 14 Feb 2022 22:03:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 11/15] dt-bindings: pwm: intel, keembay: do not require
 pwm-cells
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Heiko Stuebner <heiko@sntech.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Philipp Zabel <p.zabel@pengutronix.de>, Anson Huang <anson.huang@nxp.com>,
 Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>,
 Rahul Tanwar <rtanwar@maxlinear.com>, Jeff LaBundy <jeff@labundy.com>,
 Yash Shah <yash.shah@sifive.com>, Sagar Kadam <sagar.kadam@sifive.com>,
 Vignesh R <vigneshr@ti.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-riscv@lists.infradead.org
References: <20220214081605.161394-1-krzysztof.kozlowski@canonical.com>
 <20220214081605.161394-11-krzysztof.kozlowski@canonical.com>
 <20220214182824.gevtqbtv4qrddjqb@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220214182824.gevtqbtv4qrddjqb@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_130318_619468_8E168065 
X-CRM114-Status: GOOD (  11.82  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTQvMDIvMjAyMiAxOToyOCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gSGVsbG8gS3J6
eXN6dG9mLAo+IAo+IHdoZW4gSSByZWFkIHRoZSBzdWJqZWN0IGxpbmUgSSB0aG91Z2h0IHRoZSBw
YXRjaCBpbnRlbnRpb24gdG8gYmUgd3JvbmcuCj4gTWF5YmUgbWFrZSB0aGF0Ogo+IAo+IAlkdC1i
aW5kaW5nczogaW50ZWwsa2VlbWJheS1wd206IERvbid0IHJlcXVpcmUgI3B3bS1jZWxscyB0d2lj
ZQo+IAo+ID8KCkFoLCB5ZXMsIHRoaXMgc291bmRzIGJldHRlci4gSSdsbCBzZW5kIGEgdjIuCgoK
QmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
