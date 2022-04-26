Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB29C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Apr 2022 07:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FEKdbcth7So/ycWSJhNs1qQaYX/arf8CMrI1yHmyJrA=; b=WiYOrCErWUac2i
	6DyQs7vVWEJ3/+FEKO+9z2OBDQvk7uuQv0WC/5202B00ukXFc+WoFZtAIQELivPKLXSP/tkW0bGe4
	90gdMz9O1NgKvl8/ADwjzYhzGBfudyrKLS4YvS31tbbXzvP6PYVooYXaLEf4hQGfJiyB0E++aYBaJ
	9gRYOZKPMpNPPLcTaQV4AlWEtOkb20cnI/q9Y2+rcRr55Vn7jpYG4AtRBk5WPly4OPnp/oNRFQzE3
	Tt3vfWDEISshiblI78nmZFo/n6O85EYp+iX1suxLHWRHKkSKVVOJeLGeEF5bFa+Vr9p3Sfgyc0QXD
	12wxL8YNGftItkSnwnVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njG4S-00D8ue-Pw; Tue, 26 Apr 2022 07:57:16 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njG3v-00D8Zj-8j
 for linux-riscv@lists.infradead.org; Tue, 26 Apr 2022 07:56:44 +0000
Received: by mail-ed1-x536.google.com with SMTP id y21so14379276edo.2
 for <linux-riscv@lists.infradead.org>; Tue, 26 Apr 2022 00:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=QCkAWQl5OzafSw/w5XY+gBWNToUQg7Ssi/Vfa8NOYnk=;
 b=C7g6N2Ew98GR2Heo34ZeLiYmawz0IxdKRnqMbuRY6WbxbEifgefRyaijaLZwhplkHV
 hO0ZNP3zWBK7PrXskFz4OTbNO4m3LLXOpH9Nh8B1zMxolgUodylxmvGj8wF8pCpt7xl+
 VOwCabNZ0NIVoTPWd2z4Q/I454EthoH+dVZgXHlN1sil3cYuNrZcNhcXLfOCFQ+hY44B
 FnUxvQjqQVatKedu5ZxggxkItCYmhJ9Gp/t4T9Y7FAA6AYtHISo6o/r6xUCrKBMun/M5
 L3M8h7ULHG3ysIa1U7ygR02UqXpv2mXlvAjMZFzNT3bJBRUip59WZVc0T+r5Md/SI9X9
 g9bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QCkAWQl5OzafSw/w5XY+gBWNToUQg7Ssi/Vfa8NOYnk=;
 b=qoHHGWY/J8paPiuoJZNWtvDsRxODO+vgoYv5ejV42TiSB/9sFZzPmfXimtNfesap5m
 iVV4zOuHvqqQ8dTIDQSUabxSn6vAXKnYhRr/LC5Q3XmnG5xYdNHtK3CRxpvT8CIrfA7Y
 aXUIWJhi14+HJvA4tYG7iNdDezJnRJgTKGxuCHVBYiDaOvZtYGTEINDGxvHPLl0H6+Sv
 eoxmmmdmWPK2fmgyMQMDUN+puKHCnbQrFtq0s5D95N/jp2t8wCNsuqBXxwwoyfewMAZ+
 mcjICXkvv6JL16R9kunqP9lJ5UfxhRVZ2iEpk4wgv22lNq64cq6JDNl+UaVqQAsHztry
 OiqQ==
X-Gm-Message-State: AOAM531+Zf7aTnir0uQdQSf3aPXmgPF4NoZSyQ44bZ1gZgZbVj7Rod3L
 T8mNOY67rTq2yzL3hJeaTWwaKg==
X-Google-Smtp-Source: ABdhPJyDmnBpx4hnM0HvEzf1tfmy38ZpvYc4jFzRem11dTFx48HGYzumITkBu9oT8cm7BelgqplEEw==
X-Received: by 2002:a05:6402:304a:b0:423:c3b8:cfc5 with SMTP id
 bs10-20020a056402304a00b00423c3b8cfc5mr23165580edb.406.1650959801194; 
 Tue, 26 Apr 2022 00:56:41 -0700 (PDT)
Received: from [192.168.0.244] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 dd6-20020a1709069b8600b006df08710d00sm4565877ejc.85.2022.04.26.00.56.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 00:56:40 -0700 (PDT)
Message-ID: <5ea0ddc9-c4b1-a2c6-059c-5e47ec076bca@linaro.org>
Date: Tue, 26 Apr 2022 09:56:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RESEND PATCH] riscv: dts: sifive: fu540-c000: align dma node
 name with dtschema
Content-Language: en-US
To: Palmer Dabbelt <palmer@dabbelt.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>
References: <20220407193856.18223-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220407193856.18223-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_005643_419892_6C3A8E27 
X-CRM114-Status: UNSURE (   6.66  )
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

On 07/04/2022 21:38, Krzysztof Kozlowski wrote:
> From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> 
> Fixes dtbs_check warnings like:
> 
>   dma@3000000: $nodename:0: 'dma@3000000' does not match '^dma-controller(@.*)?$'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Hi Palmer,

I already resent this patch, pinged. Can you pick it up?

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
