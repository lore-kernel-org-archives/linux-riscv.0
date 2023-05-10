Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B7BDC7EE23
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 14:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lhy+0ZUc1BaQM+y7CeBOF8bI3iXD/H1Z8wKmFdPAfOs=; b=ozaPXcNxJlR5EV
	pSrzX0hsLnZp6OwvXpKAnCoN+6lUaWFZn/ZN0ij37h34whcKAev0yjiHgW2sh901XTST0JbWSf0hr
	zZ8A2iQZBq1uSmvorxXraCTKiq78uUcrnfniM2MIkJjPzw2fb5o/PM6bAV3pbG0aCPrI8fcKLmHcT
	OYyFZgv0NR7p1WMWGWfsh5oCuXFg1/0ua8zbCnvBpwcrgaQN5tdupsimTNuU88SOX8vzdmVoKLHIG
	fulGF9CTfcFDFjUwkcsseIzEe0e0UoUq9lW4zDFwe71v2/Inku5wECBhcMlP/JqXZyFl1m0jDg/H7
	qCAdsYp6XJRR4qOJRzZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwkiX-006LT7-27;
	Wed, 10 May 2023 14:22:57 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwkiV-006LSi-0E
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 14:22:56 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f4449fa085so8710515e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 10 May 2023 07:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683728573; x=1686320573;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2etb/3I2MMTTEdePIkDu+D/ncnvNpSe07jedu4cHhMw=;
        b=XiJ3vEXc0eQhohhnvIRe7rSWcI77b7CFB4NaadQeej+vhgI/w9xWw/z7C37g75qvip
         +qFBvHW/Pg3dBtGVBKYnkqj6CWrWsehNqL40cu9FW24LMuR0/H+PHYef7/yPi9mm7oDK
         mNJqVGdnypP+bUh6Xxa4ObdFNUyOGLWhF4rF3F6yVQXd6B8rg6VUjkCFP56xZgM1nqxm
         GYcD87btvVdi7qZmArMs7znzNLGMZuUqsfjtTvcQIRVb1VeTj1LkmCAlcxWg7HkoFoZh
         vtOLvsF9/ner+VmNy7WpQ0ryMiPgXDHD5B41fCAngWrB2WgZedr8KhHQRMVfXYHIOBB3
         XtMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683728573; x=1686320573;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2etb/3I2MMTTEdePIkDu+D/ncnvNpSe07jedu4cHhMw=;
        b=gsCk1cEwj6h0Gx/DauKt8l4oDbnQdEjlz1GhmJLvXuBeZrst9Lg60IVFLPELkG3jNd
         xbgYEwh9bsHpkGxAS/gujXaP5oi8wlpLJC91YRxtC3+LnNsd3ouSBBjSpzUwo/rAQoY6
         +z4Op0xxc7r/Agtsrf8g1In+g0IVbmIFYjVh8L/C9pJE6+EbLZgNMbcac6MV9WCKh+N1
         fRRhV/7XjStaxIzl2cfn4/EDqEv4nyVyc9JjN8uixtvLJy8zDElde9GOuOJbcuGcEKM9
         AZhVevZLDpX7zXCbLVVMCYMiAaHhfxstqyo+k2SF+nK/0oi6h1gDqRiQv0vqIa7LrlE/
         SDCQ==
X-Gm-Message-State: AC+VfDz4p3MOwSeQy5JIR/IYwtkTYeFKIp1sSrJBCNU74MmrAGGIBqHM
	CEt3cwzEkazNQiuQH5UJGkM+Mg==
X-Google-Smtp-Source: ACHHUZ62HNQerWbsxoK3MwqdchiGC1yKERqEYCSw8RQj+Kyl8r7fDPUS6W9MOzl+5BvfE/Q4mrE2/Q==
X-Received: by 2002:a05:600c:3658:b0:3f4:2327:53c2 with SMTP id y24-20020a05600c365800b003f4232753c2mr8083597wmq.19.1683728572981;
        Wed, 10 May 2023 07:22:52 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c175:a0f9:6928:8c9d? ([2a02:810d:15c0:828:c175:a0f9:6928:8c9d])
        by smtp.gmail.com with ESMTPSA id h9-20020a170906584900b0094e597f0e4dsm2705011ejs.121.2023.05.10.07.22.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 07:22:52 -0700 (PDT)
Message-ID: <08ebfa39-63b0-9db7-bd94-39a1822f3c7c@linaro.org>
Date: Wed, 10 May 2023 16:22:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] dt-bindings: interrupt-controller: sifive,plic: Sort
 compatible values
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <9cbf54da1ace03d7a45f28230fd99954d8c0d141.1683725029.git.geert+renesas@glider.be>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9cbf54da1ace03d7a45f28230fd99954d8c0d141.1683725029.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_072255_105470_1ABE8541 
X-CRM114-Status: UNSURE (   7.80  )
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

On 10/05/2023 15:26, Geert Uytterhoeven wrote:
> Restore alphabetical sort order of the supported SiFive-compatible
> values.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
