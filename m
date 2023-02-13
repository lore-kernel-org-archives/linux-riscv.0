Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 330BFC636CC
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 09:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eygOsfy0gjoMMbR1GPIRavesB7mnuDELzBn4Z4Xhxuo=; b=QbQ6bTNAb3Lf1d
	uk399MSLWkx2tDLXamCIWD0u6nu7Ua4NrzN/nuc54U8ZeDeLXjM5mu3BX4Rx1l0fh6nO12FJvQ/TE
	LSt9El+X9qHzsxXMb6jONI1oyvIJMxUm21OGdXzSkZdRz6qciubm/xJjZu2xHxt+YEs60QxOvv9Aw
	/yy08Y7sa3bZqOpAY/xkqW7ClITS8Wl8HRtMsYZBadKW6hn03XVn5L5RZsVSEmlRZuJKrEvt9QcVY
	Ag/2mwhED+Ze2OLDovwwp7NzjyITm/1bRzphFYr4JZ2BfaQUAC2wWl/UpLOneazXQU9bGKCa/QMTY
	tCXOotmnWj2f/O/Bjd9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRVBN-00DslK-SJ; Mon, 13 Feb 2023 09:31:34 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRV5Z-00Dq3i-0D
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 09:25:35 +0000
Received: by mail-wr1-x42e.google.com with SMTP id k3so3771565wrv.5
        for <linux-riscv@lists.infradead.org>; Mon, 13 Feb 2023 01:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xSldNry3NWzuJ0zp8Ypcr2h0zI4yvHSm7LEOUZUqMKw=;
        b=OQ5yMzSQ7q+ZY08Q8rg+9cPVvhvYSSpp/vgo+xhT/XLgxQ/r+zI7EO5vb9rcYSCQSt
         mbwcinxALpM0bjyKNRslIzyCJ/W5VfVvQePr6ntDxS2Czpnc4xSvuNK9evWMsL6kgOG5
         7XNEk1Sax2GzoIzMCkBFUhHPPFJzmx6HozvsrAnDkRYfTF6EbjNFKjXCtUwpJgWpyfSA
         0AALWPB3KjKEnbaJ6qHbUeDasMdAKurhOD0sebSQpuEru2s4c1AEk1NpF3Si+vrZpTYh
         x5XIeTK4Gopo5SoJnGBLlxFVsw9oDMeTgid+4sYvjUT1YE2LPQh3iohtL7skakEG52eX
         m1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xSldNry3NWzuJ0zp8Ypcr2h0zI4yvHSm7LEOUZUqMKw=;
        b=npAG2hJB9+sFdh0W4dAQQpUZ9dKBt/d4CaCNrRARok203XoEt0s2own0ibvm6fDWuP
         uUOoJn0j4kqJfInL6LtGCMEpvG9c6NYTWLD1xGs2ALJWZ3TsKTazvpFn+WD9rNgUm6AJ
         2se6MfP4SfLiULW3kM37V7JPVu431nyTnsKLzEZU5OdS5Zb5yrFgDWeWD4fJCNdnUVUp
         iN1ou3uhtl7oHdh23CopC532tBQxrDpSWod5UeipSiVGDrn2LUTJh7v87/3gxddpUU9f
         8boWRXOUbMjjuCgtyggt09vkYGlLJTES+pdyIGqv9QvHonimfsrVyTg2k+/rjzDQ2PuP
         cheA==
X-Gm-Message-State: AO0yUKWt3pP+PLrGumRyGGW1fByOwokx5s41s5H7WDe+WSygmF+2Jpiq
	nUGbUNkyEJP5X5utYZJmL8Ih5w==
X-Google-Smtp-Source: AK7set9ZqU8XLcewYFcYk+YS1UR5EMjdCdUAe+0yn67Ao2gAARnvEvunO2pnpdKZ5aph1W8194djhw==
X-Received: by 2002:a05:6000:147:b0:2c5:3cd2:b8e with SMTP id r7-20020a056000014700b002c53cd20b8emr10262827wrx.1.1676280329198;
        Mon, 13 Feb 2023 01:25:29 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id g9-20020a5d5409000000b002c558228b6dsm2670211wrv.12.2023.02.13.01.25.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 01:25:28 -0800 (PST)
Message-ID: <5e7cf78c-9402-1b27-6a19-8326fe5c8e18@linaro.org>
Date: Mon, 13 Feb 2023 10:25:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 07/12] dt-bindings: net: Add StarFive JH7100 SoC
Content-Language: en-US
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Sagar Kadam <sagar.kadam@sifive.com>,
 Yanhong Wang <yanhong.wang@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-8-cristian.ciocaltea@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230211031821.976408-8-cristian.ciocaltea@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_012533_280191_AEFB5452 
X-CRM114-Status: UNSURE (   8.77  )
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

On 11/02/2023 04:18, Cristian Ciocaltea wrote:
> Add DT bindings documentation for the Synopsys DesignWare MAC found on
> the StarFive JH7100 SoC.
> 
> Adjust 'reset' and 'reset-names' properties to allow using 'ahb' instead
> of the 'stmmaceth' reset signal, as required by JH7100.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml   |  15 ++-
>  .../bindings/net/starfive,jh7100-dwmac.yaml   | 106 ++++++++++++++++++


FYI, there is conflicting work:

https://lore.kernel.org/all/20230118061701.30047-5-yanhong.wang@starfivetech.com/

It's almost the same, thus this should be dropped.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
