Return-Path: <SRS0=u9qy=P3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F129BC4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 21:10:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8834611C0
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 21:10:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B8834611C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zevfeNfgL3mIlOhGJ1VXGr/qcv1M+oMcDZQEkFmJoAY=; b=LWzZeFjN/9X7GQ
	K+NLQRzjrQhRPSH5HpBQz0tOxvQ7sODE0axvVEqO3y/TTVxxqbGa3/vsTtX2wVDFGsjgn9GniVeat
	TdbhiUFONM1esSqm2WWJ6WbJDlc7XKHm9zzaZuFY4l2IRe3ddPb1Jb5ZNbaHssM2p/gnjh/vbCMlw
	kQodTpNyqShFMlxEdIcpc+S0qoSby/LZ7xx2mKsmTgxB/MGqpcYnYji2LEP6X5M8pyy8V7JxmuTvb
	ixTZSNo/j0EfIqGwpKpmw+5WD0pYJC6WY9q4p50yYMHZiEsz5rY0lxhCKH8jZDFWBeeudzzt3kDf5
	FOmlWBZuVUqO03zbbQww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkBub-00HSVO-6f; Mon, 08 Nov 2021 21:10:41 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkBuY-00HSUI-Bg
 for linux-riscv@lists.infradead.org; Mon, 08 Nov 2021 21:10:39 +0000
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 27E1A3F1EC
 for <linux-riscv@lists.infradead.org>; Mon,  8 Nov 2021 21:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1636405837;
 bh=mwPFRn0AEGOneXePTnmoZQRi4asMCrfCLz0IrMjqCXA=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=L06ce1S7CebcXKfk9w/1VnAZa7HKWSH/CDXoHgwnJNpRXbIA4LkMXXo/uLR2uZR+o
 mTqQ6tqWADK91HZ09kylWKlDO5Z1hwD4Yr9FtemJNEeIzRbil2SFH5G88JgA6PPRVD
 xpKS4o0LVdYFgyCpuXLezU6PF0IYNPyLvE3Yh+wcUfLP6u9qM4IzovYy8mgq1lJohv
 TCQqJsyDaQ2c5P+yqkuJ1EU70gOgKKCyr9am8xb7cPC2vKSZXFtpe/EaaEvaT9fr/U
 Z/9wEEblC1nOh8QAgN8Hlx//5ASWi6tKgJEmbNOu/YoYg805vuHU2UVWVU2zn32Qji
 GMhCeEN0ITeYA==
Received: by mail-lf1-f71.google.com with SMTP id
 f15-20020a056512228f00b004037c0ab223so1190543lfu.16
 for <linux-riscv@lists.infradead.org>; Mon, 08 Nov 2021 13:10:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mwPFRn0AEGOneXePTnmoZQRi4asMCrfCLz0IrMjqCXA=;
 b=cZIQpSov7qm1xMxS4ySzrYGH+9g6bDDrHYcEtlB7toBatVugwLYWRrMGjI31Plen7j
 2P1eRStJC2udlPwrCFadeEkmmIiWeODT/s2oegLZa7WyRly4os+xGPQj6PPtYC/Wdi4v
 Zku3nhvLbSYsym/o9gSny8R4Z+rTxbH+cHXoGQdOHPojdfFMQYoM59K+kCGf5rUjaICT
 kFQQAtvRMsPKN5oIOnir6wGJ8AOR/rlMu9KTLXhWcCPnToOItPkjwjYlt9TP22hCQn/8
 TL8mkAhj29C7SWLi4qZ3C7ZtO8CHTyH82pGhfvRyMMyJ1ls4N0EkvCL7tfdgSiw0y94L
 Bv1w==
X-Gm-Message-State: AOAM532citkMItC5o+7LmbAjFjCSxWlUG/rIQUZ8uPyIrxplcFVodiY9
 nmYZuMfj9BjCqUyyXIpd/2zilv3GtmKHbuU+Zv+eoq5D/P3SXM24goxUtep2SGficF/n5iCyAYn
 4/V8num4iH1lMNQOWpFZ5MOZcY7MspWR4Z6uWqSiB57/cqg==
X-Received: by 2002:a05:651c:246:: with SMTP id
 x6mr2094953ljn.49.1636405836526; 
 Mon, 08 Nov 2021 13:10:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyZb4LKcW1A1+MA8CuLWPJQDB5phDB0potg5NQYQwGvOUd0o3C/EZkqT0mWfTObhT2/wWNBag==
X-Received: by 2002:a05:651c:246:: with SMTP id
 x6mr2094920ljn.49.1636405836357; 
 Mon, 08 Nov 2021 13:10:36 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 a16sm1929374lfu.274.2021.11.08.13.10.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 13:10:36 -0800 (PST)
Message-ID: <8343f11a-89e8-c043-6296-000f7ba3e3d2@canonical.com>
Date: Mon, 8 Nov 2021 22:10:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 04/13] dt-bindings: riscv: update microchip polarfire binds
Content-Language: en-US
To: conor.dooley@microchip.com, linus.walleij@linaro.org,
 bgolaszewski@baylibre.com, robh+dt@kernel.org, jassisinghbrar@gmail.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 a.zummo@towertech.it, alexandre.belloni@bootlin.com, broonie@kernel.org,
 gregkh@linuxfoundation.org, lewis.hanly@microchip.com,
 daire.mcnamara@microchip.com, atish.patra@wdc.com,
 ivan.griffin@microchip.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Cc: geert@linux-m68k.org, bin.meng@windriver.com
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-5-conor.dooley@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211108150554.4457-5-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_131038_569599_66E52C8E 
X-CRM114-Status: GOOD (  14.35  )
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

On 08/11/2021 16:05, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add mpfs-soc to clear undocumented binding warning

What warnings? There is no such compatible used.

> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/riscv/microchip.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/microchip.yaml b/Documentation/devicetree/bindings/riscv/microchip.yaml
> index 3f981e897126..1ff7a5224bbc 100644
> --- a/Documentation/devicetree/bindings/riscv/microchip.yaml
> +++ b/Documentation/devicetree/bindings/riscv/microchip.yaml
> @@ -21,6 +21,7 @@ properties:
>        - enum:
>            - microchip,mpfs-icicle-kit
>        - const: microchip,mpfs
> +      - const: microchip,mpfs-soc
>  
>  additionalProperties: true
>  
> 


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
