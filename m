Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1C7C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Nov 2021 09:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RSJjKp17ltQVvzlhHbRdbsacN3ccdsvqpUcAiiyxVSw=; b=U/kRDV0IJKOw7x
	BkofE1JZSKNNPz7DQDE4U+0UUP/l86T6tC4aWzXN1cJmL1+hG0IGqsGv0u0OIQqpwLDKv2ojR0Sj3
	PNwDEWZ9yeDHisniNXKlnT8hldbx7jta+PkOpZQ3XjXSUcS2rW+aFOKonJKzGtbCCtcNmzoWyekCh
	vGuyu+78ghzwHxAtKZ0exdy2Px0qRYYR7+gPEINfnmZuLxJuShV5GQARVXFiBQfE9+mCdvVS5I3xC
	cKHuOQPn4Q+zckmASeXMs+WNhfE5hbkU9woT+AHLpdGRbH/LluwvsEs6XpVN1zx+hhqyfS9vE6A6l
	wHQ+zCKApd10E7RxgSQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqXrQ-009n3M-Ct; Fri, 26 Nov 2021 09:49:40 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqXrN-009n1k-Ae
 for linux-riscv@lists.infradead.org; Fri, 26 Nov 2021 09:49:38 +0000
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D863D3F1D6
 for <linux-riscv@lists.infradead.org>; Fri, 26 Nov 2021 09:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1637920174;
 bh=sE+21yp5XuA0m6/mKv6GHYQ5eoofrn3B/lwuqx/vUt4=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=SK6RlR31XXSDwYHvw4XlwSsM0a3hQp1lamHYKxWZMtGfdgyfMJn6WQ/N8v7LKBCu4
 A5tEJmXkTvFx2b+nxbu9YHJdRbf6yOBAnRjrRtEtbvgUWld37uQn8+n0D+slKaOYGP
 Tok1mlzHVbUoI19/SITlOWh4vXtSv+WDINQifBuikfnwrjcuA7v+hvCcXxzT6f/zIn
 PkViLhwcwh4h0HktKaulnIqTnNfJqj5H8vXuDIGeQEDxwX+QxfOlpkGvS9/NnXv/CX
 PYYdXlJP7p8DPvQba7bTe8L/swHy+/RyWpefUxwJpTdu/NCyznHzfu9HPvV8hu9k/q
 TD0K5emT9pBJw==
Received: by mail-lf1-f70.google.com with SMTP id
 h40-20020a0565123ca800b00402514d959fso3994075lfv.7
 for <linux-riscv@lists.infradead.org>; Fri, 26 Nov 2021 01:49:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sE+21yp5XuA0m6/mKv6GHYQ5eoofrn3B/lwuqx/vUt4=;
 b=baV67Rmp4FwpSmkJIOY5dmkzipgJ/xjRDBPLXpXkagnoOhVfu5ZnAjSnpJIVa4bI1m
 O9sPQIw3G5o1YQRjSyWf3MNygwGnm9hd+KCWjxjAEjCv5djikGBIWr6EsIIPBaIwnbik
 gEorilNYjEkFUz1jUxq6NnkCAqsSxC8uo1J4PLdeWNLDxrdgg7Fh6tzzqLbLZrbGgUhF
 BMzVaMsebIqsB6mA+RRqlXkLnnziELZq/CB9f6A16nXp+Cd09je0QpFb+SqOGCBlkMZb
 6heaNiIi7qD5a1ABZKJ0bzqhHk5Ioa2YzcXgoEoz9Pgs2nZmGB+4DmAFVzG/miJ9ODWy
 zZ4w==
X-Gm-Message-State: AOAM531OTJj490TNLRxryLHvXSDtJglML3kTjnYI/m4y72gQhBDDRBDn
 bl3tzvfsy+NC1C8phzUMPARoAxLYyGlW2cBbg1FxsnFcDuB6pr0mwBl8unf0bHeDoF4ArRDZhDG
 LEppHYeVNZLDU3a+z/6XyI5M2vlIh9kCTlyTxWcSEJ3d/OQ==
X-Received: by 2002:ac2:4e02:: with SMTP id e2mr29253590lfr.264.1637920174328; 
 Fri, 26 Nov 2021 01:49:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx12K+xmZh8dFi4zHt1zNxDLGcfPH5+2AlqkY91xnHZk66myQvMaa/ql3PRSXSiUa4CPWsQRg==
X-Received: by 2002:ac2:4e02:: with SMTP id e2mr29253578lfr.264.1637920174182; 
 Fri, 26 Nov 2021 01:49:34 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 e11sm463422lfq.65.2021.11.26.01.49.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Nov 2021 01:49:33 -0800 (PST)
Message-ID: <0fb9a8ab-4074-ec72-6e9e-9f6dd937d39a@canonical.com>
Date: Fri, 26 Nov 2021 10:49:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 5/9] riscv: dts: microchip: mpfs: Fix PLIC node
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 Lewis Hanly <lewis.hanly@microchip.com>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20211125153131.163533-1-geert@linux-m68k.org>
 <20211125153131.163533-6-geert@linux-m68k.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211125153131.163533-6-geert@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_014937_549463_72A6D4F9 
X-CRM114-Status: GOOD (  11.91  )
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

On 25/11/2021 16:31, Geert Uytterhoeven wrote:
> Fix the device node for the Platform-Level Interrupt Controller (PLIC):
>   - Add missing "#address-cells" property,
>   - Sort properties according to DT bindings.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

And similar for fu540-c000.dtsi?

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
