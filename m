Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7902DC77B7D
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 14:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uiLdvWapDb7mmJL3dqtVaTAw0IIllYTXcwVzm9YoJb0=; b=b1Uw3zlrsx89aL
	y4uO+gxosx+ZhvEOZ3hjQFT7eKZWu0KfjFttlp2KC4V+tivxZ4VcPfKgsOwsxVGkBI//e0l/Unr36
	Ujfz0qqi5PfvDdKGKwyQQiR8qIfrYfKRsI2gLwKgKrXq5mohAsBdmb62T6fBhgPskSHnBJeT9BrXx
	uNK9uFpUs8yjG9DpnATdhii2pTPMIH7++95oufvvlqT9PA27Yk6MTOWhRKLtq7XtqbspiX786SMYz
	G07Js6pSzxjoFWtHcUnQbZUe52UjikM3/CPzi/ctduEFNsLHY4aPNA3FwMXYYAMaQcND+s7aaascX
	qcvzuuljaInIMbdW7Qcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwkkI-006Lml-1X;
	Wed, 10 May 2023 14:24:46 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwkkG-006Lm0-25
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 14:24:45 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-96a2b6de3cbso125373366b.1
        for <linux-riscv@lists.infradead.org>; Wed, 10 May 2023 07:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683728681; x=1686320681;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tvB6tNxqC+RYJpA9ZkTv4yGns/HAirmepb3vyqxfld8=;
        b=cuvSVTLAzjvxPzP2eQEyxnBQ9b9sbdEsM+eTlDCijm+UJ+oDk+jbKJeKnQ9yC+fRmh
         4gMNHEY2sfILpe6MUKrxswaTJ3fY5HLnsiBd9fAu1Pg2WF4Y5+yZnN3mAMGRBYg6vuiF
         X5WBlo1OSnDspWv8dbJBFfzxsUFycZml+L71jBtWcCyfVl7FklG6X3rWwEKwlYy7ogWC
         aYBjJ+3T3ZvEm+9PX8BoCe+89KY5/E+ThQOEV8SP6pOCcSZhWEiMwBquk5JQDpyUEa4x
         WUMXFR+RFM+mgPGPK57teS2jSUHilzspbeveQ2v55huQN6IPs6s0U5EZ7UbWixyukGxl
         2DDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683728681; x=1686320681;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tvB6tNxqC+RYJpA9ZkTv4yGns/HAirmepb3vyqxfld8=;
        b=HFJvEltd1uSsabImvMTzS3AE2CKcR4IlPBHOWUff/pCU1CsIM/Owp0l9b6oqyP112B
         W/eXJEsMiFJdR5tIVsI9854+TEd3ZM3hmZSd5HRNWzkKMObwKPbDWIHC+qir+rj4vu5R
         t4ZntMI4IjrX+Wg8WPinEVXiOPwo9vbeCirjR98tpmtntULzwWWr+4sxx6MTufkQvanl
         UOx+yeacb4V0cHa0xNZVF0mxBqlPjkn+xocuGZX5YiuyH6JfXLE62AobUUt5h7zhbUJf
         zbUEe8Y1xR5rEIqJ8+2U1SypReyCtgy5QpAPDc7X9iDaE2LUo6MEncxwjjHMyySLiEx3
         05Zg==
X-Gm-Message-State: AC+VfDxeEV7y1D4gS0pMyatdXuuJShunUUjf636jNKovc2UmIvref4eS
	ar7NqpHnZcqxNGfRDg0DyfPVUQ==
X-Google-Smtp-Source: ACHHUZ6Qv4Y02gb55kWr55DrSPWGUN7xUPG9NIW+geR7568HZ2/XgyLyLHnDcpnL7kBUuhbrxLlChw==
X-Received: by 2002:a17:907:9285:b0:958:489f:d050 with SMTP id bw5-20020a170907928500b00958489fd050mr16608835ejc.43.1683728681013;
        Wed, 10 May 2023 07:24:41 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c175:a0f9:6928:8c9d? ([2a02:810d:15c0:828:c175:a0f9:6928:8c9d])
        by smtp.gmail.com with ESMTPSA id gv28-20020a1709072bdc00b00965cfc209d5sm2759068ejc.8.2023.05.10.07.24.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 07:24:40 -0700 (PDT)
Message-ID: <8e777515-4a5e-daa3-4881-51e003c9e865@linaro.org>
Date: Wed, 10 May 2023 16:24:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] dt-bindings: timer: sifive,clint: Clean up compatible
 value section
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <40ff1fc7f5220db7d527c57ac4bad16c3945ae08.1683725179.git.geert+renesas@glider.be>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <40ff1fc7f5220db7d527c57ac4bad16c3945ae08.1683725179.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_072444_704259_252CD272 
X-CRM114-Status: GOOD (  10.31  )
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

On 10/05/2023 15:27, Geert Uytterhoeven wrote:
> Replace the sentences in the description listing some supported variants
> by comments on the individual compatible values, to ease future
> maintenance.  While at it, restore alphabetical sort order.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../bindings/timer/sifive,clint.yaml          | 21 +++++++------------
>  1 file changed, 8 insertions(+), 13 deletions(-)
> 

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
