Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697E0C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jul 2022 16:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o0wrz7TwR6oebcGLpY8WG1tztGDPLywLwekgqRy+Z+8=; b=5BPTz+Bdu1tKC6
	CbIu9oeil/mWY/8UiItUp0NltB4B7XkUlUnb/G/jnVi5XR+fGu61pUjGNgYJVC8s1lsher+IkJFyq
	Ycj94kfNI6Q2oMWTz4Vo3CyVEAlu7LLzX/xbWjSuQQQf6GmrUcOjFy7sMCHMpxsJWrXJVC4TQ7o0V
	OwA/TTVqNRCsFDhDXkmY/NNlPuI+Zr6qkiEqpE9IWCFQutTeKde+8fndno3hmlqbM7DvdzcptaejQ
	6/7l9kAVEpkr+la3ctC4lOJQJOYK8hHc96ukfP7HA764StzeAOdTG/uBCBK/r3GOxcGP3AXvwqKoM
	9olq9S9wsEyHi06lKJdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEYda-009Vs4-Fq; Thu, 21 Jul 2022 16:02:54 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEYdX-009Vr5-BL
	for linux-riscv@lists.infradead.org; Thu, 21 Jul 2022 16:02:52 +0000
Received: by mail-lf1-x134.google.com with SMTP id bp17so3519725lfb.3
        for <linux-riscv@lists.infradead.org>; Thu, 21 Jul 2022 09:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=qju+Xo1cDVvOX0Uo3QlgOkFxB3TmGBZn1gqhX1HAvMs=;
        b=dPzlvv2YI6S+L8my5ZJJqz8/Y1vffPlYXyoiqwnXFwNO0Y92d0APBqWDPD3DeYq04b
         KtX/BVK6Ch8jKrcMhZKrWTTVuSZskQWBLkDb/VDhB2rfDYp8O6xlzoLjiKMOtE43vUjc
         9cqLPILxivW7mU+v96rD+R8MfsjNgSkqB+qsB6T2EU3OdijBcj1ebuecLpufKgjXcPEB
         PbykVBceBN1GPWxBVUGUo7rAouOU/oUYnZc009ySavHh5MkI1xIH9UOQ7SGnHG+il+Rr
         d0N9Kg3gis/BBYzdUwtCQyOtY/sA3iv8mdHQ76tggwtbguCYJs6NY5QtQ2BfExZ4z149
         3klg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=qju+Xo1cDVvOX0Uo3QlgOkFxB3TmGBZn1gqhX1HAvMs=;
        b=nsfGa7RC/v5Gvbe9305i+Ciy4hMYqAH0TExj/xT1iclvXSJoG7q5borLpxEUvLYxIP
         DRE2bY+HzcHUbyMII2eSZ2+Q6DMb+eQlhfEEhECK9hWJx6MqGle1nfVYx3ZTg6Ytk25T
         QnJfGdOJETUnC+K+g99WKkNKTcqJEgnYfDGpORyZe3tUoJsvaBCcOpl8TMlgi9HO+5Ph
         zlhHXn4eTmhjFKaCEEs9lTgbI2+ADWguDwpCE0gNMCvlCuq0tfwGyPLkYDWDiFcKCoGD
         qfUwYIINQDObauY3HQYV6aAKynMbhpDLKDSpKJ/kNPWo3bkWKbYUp3OW2sbYOG2dOpOT
         QdTA==
X-Gm-Message-State: AJIora8sAO47Z2/+Z/iEFfaAb5G2oIwkPS9415n7GWh8dsGfFlJgZqOj
	uHuVq4qx74lGseAQXl+Cn9vHNg==
X-Google-Smtp-Source: AGRyM1trY5ITtNlO72gsUBhEzJI3nk8oObNgljwg8ZoF82En3k3x+Nlrp2Fdllm3cPQdQB6BN0HlmA==
X-Received: by 2002:a05:6512:3b0a:b0:489:da13:180a with SMTP id f10-20020a0565123b0a00b00489da13180amr23094700lfv.489.1658419369592;
        Thu, 21 Jul 2022 09:02:49 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id 18-20020ac25f52000000b0048910301774sm33339lfz.307.2022.07.21.09.02.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 09:02:49 -0700 (PDT)
Message-ID: <22bd8bc2-9d47-b7a6-6d3a-9c1ecb62cc7f@linaro.org>
Date: Thu, 21 Jul 2022 18:02:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] riscv: traps_misaligned: do not duplicate stringify
Content-Language: en-US
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Anup Patel <anup@brainfault.org>
References: <20220623112905.253157-1-krzysztof.kozlowski@linaro.org>
 <CAAhSdy35972j=qpqQWak1Ot1nZb0iiURzYqhrbZ1bfuuAdpw_w@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAAhSdy35972j=qpqQWak1Ot1nZb0iiURzYqhrbZ1bfuuAdpw_w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_090251_421492_21EB067B 
X-CRM114-Status: UNSURE (   9.38  )
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

On 23/06/2022 15:11, Anup Patel wrote:
> On Thu, Jun 23, 2022 at 4:59 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> Use existing stringify macro from the kernel headers.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Looks good to me.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>
> 

Thanks!

Any other comments or reviews? This was sent a month ago, so maybe it
could be merged?


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
