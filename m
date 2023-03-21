Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 180E0C74A5B
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 06:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UU2UiJUV9a6mrCxCq8aECbR58Rq6o+anrWstYVOD0zA=; b=oA+UoFhxNROe2q
	y3qlK5UOH0Rl9LUQvlRgK0JSMSR5XahpjzUc0QJ4Jfr6CfeyPi7w9Whet1DBaNuar+LvQp/uDgebg
	2HPZd3UX3hwHUNkoBACmDjrEhY7SMBaTqIanCke3WDTxNapXiedL4EfAP5CIbkDI54AXqRHA9pZ9Q
	Gq8sK3PB6K5gL1IPQ1xKErFF5azN3RyBzjM6NTkO+xBwPgmGvDfF0l6SRTVfE3Ll96x1t075YG/jo
	IjmzcL5gHwfFzBo+ps0nYIq7rs5OA++MPQdHlj0SSdiRFmgkqpti2PYgZ0sq7JNGQfLFD9/WnNqVQ
	NZHD2k5EVDx6kLc7XxTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peVoU-00BQrS-1o;
	Tue, 21 Mar 2023 06:49:42 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peVoS-00BQq4-04
	for linux-riscv@lists.infradead.org;
	Tue, 21 Mar 2023 06:49:41 +0000
Received: by mail-ed1-x52a.google.com with SMTP id eg48so55603589edb.13
        for <linux-riscv@lists.infradead.org>; Mon, 20 Mar 2023 23:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679381378;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d46q7mbE7eGvKOHkcknhDyVqT7e0qJyrZrZoT1VlZtM=;
        b=UW24cX+tDjHgGuES0CzY/aQ8qiV8T3Ex/HHylIOxDDw900b8rT1cCQkqFkoJpCLobN
         6wPjxlQE0+CXx4K7hxDTFHd/3OxkV5mzCgC5aqFPHg6y2MEc25fUG5HC+8EecJi5FT1J
         3N89Apuqtpm4jg3EDkLYv39zQ84Th5tIDu3GPPRma1IQdZbn07m8nq6BxZ4pUpQHQgMg
         85BF2WSoo/GYBxYxtLe8utyZaahlZftzxd/rGQ3Aik1i1dZeHkb0Q7gGBPpNUBzdv1n7
         C2q5Q22wQzpziRjZwOviaEq2ZsYFMC9d3zDNTqSXwBZ2lcHNRAYg75TxoEU2XSKvMnjJ
         SZxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679381378;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d46q7mbE7eGvKOHkcknhDyVqT7e0qJyrZrZoT1VlZtM=;
        b=lX+8elnOtu0ss2sZEWKe48WXFVZ1iO6ETWdDg9LRwVSNiQ9q9xGbMCywYajNF9IJER
         9OQBe++UqB5UagrXHTCEq3y7QeKWHB0FRgciwNtTir/V03EYJD221xigYUi8CPwuA8X8
         +qMz2zZSJw66dDxYQgUhliDnhNEQ9w3905fKvuyGkfW3iZr6L4XGlFHjfMDaWCqNLN3O
         nT1xefqJqT676Bf5zD5P+od9UNwrt6AJdW/dJYLrgef3GUZbi4K1YxR7Jhz6jKycWtej
         aUhIFYogNViO5nQib3rynr+opYWO/DLNyWByuzwhYvQPj4O5iuC1NmrGEIheOhEID4rP
         AR5w==
X-Gm-Message-State: AO0yUKUK5Bf8j0+JzFByhTc0TCMf55FCLS4lO26V3H0EkPQ2EbF1v4mU
	NooH3fu50hhSyPBkHpOCvRIXKA==
X-Google-Smtp-Source: AK7set/KgeAkYLPx+137qJunN79pE3HjZQV5l2dycZzDA885FimWjCNPMtRRZWh/FHVwjsX9GBYuEg==
X-Received: by 2002:a17:906:b14b:b0:929:dc63:3b9c with SMTP id bt11-20020a170906b14b00b00929dc633b9cmr1797674ejb.32.1679381378748;
        Mon, 20 Mar 2023 23:49:38 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:2142:d8da:5ae4:d817? ([2a02:810d:15c0:828:2142:d8da:5ae4:d817])
        by smtp.gmail.com with ESMTPSA id la18-20020a170907781200b00914001c91fcsm5345866ejc.86.2023.03.20.23.49.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 23:49:38 -0700 (PDT)
Message-ID: <d2889882-e44f-c0ca-9b46-65d2af1bc9f4@linaro.org>
Date: Tue, 21 Mar 2023 07:49:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: interrupt-controller: Drop unneeded quotes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org,
 linux-riscv@lists.infradead.org
References: <20230320233928.2920693-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230320233928.2920693-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_234940_064253_57EA825C 
X-CRM114-Status: UNSURE (   6.44  )
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

On 21/03/2023 00:39, Rob Herring wrote:
> Signed-off-by: Rob Herring <robh@kernel.org>

You miss here commit msg. With this fixed:


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
