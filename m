Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8834FC6FD1D
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Mar 2023 06:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R6ks9RBIySAUKoIwYssbOo+ivK9M0TwK0uloigbP07w=; b=FT/vCWxC7rTTOf
	/F+tASN2+xIwMdbh/yEr6NeqN2I21XrrMlJGY62xuQ/uZpO6FF9w9rGqlB+xAx/wxGM7mIbxV0n2X
	0i7vkp8+77iHsZ4Zlg/6fo5M8XwoOYy7WJDw/IKnFgJgchc5kPRzrC7aAepAynEABaMVGkHLG6EBz
	5nWUHdMTURl9UiLC8W0/Dk2QFPJ6DDtj1chAM6PS38SNwK1TjUmWMh+KIjwDDw1F7zjncI0Owtkvh
	eUCFEW0PUojUW1FR9stbAAEZ9mWFykfLFEhBv96WWl7g5IBLLOnmGBnOlh8NiAPA6TnF2Y2PCWI84
	QKWPHxeKdEjdMUW/PwoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pe9N3-008Fgc-2k;
	Mon, 20 Mar 2023 06:51:53 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pe9N0-008FfZ-2o
	for linux-riscv@lists.infradead.org;
	Mon, 20 Mar 2023 06:51:52 +0000
Received: by mail-ed1-x535.google.com with SMTP id eg48so42431006edb.13
        for <linux-riscv@lists.infradead.org>; Sun, 19 Mar 2023 23:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679295106;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nwbSUlA3zxhSUQTAKIITpjLxnW9LRkO1uNXODCdYZpY=;
        b=TJUA4HSk2vyI9uvLAda9IAbvHowKju3Ud7/DXFgBBR80st2dGVOk45Uwl5Va9IOjjd
         60Fg7d1RElyizsQ7Xn8CQklSl/L7xdryMA13aiw8RDTjzDX0hBYwH94vyMo23ak4WxP8
         qrO44K9jkavktz5l8YFgl0F+8dzybddaQiU37RcymS7bGAS7CH+nNfXLIr8U8tkJ4z04
         QcbV7SHE0kqpFcAGpc3spwEFft8EwdSMVPXUbP8tCx1pxHcgrnzvrRukgGz40vAG+EyK
         82GfMoREnRGKvHqRodNjc5PZe71AseLswOVGwKILOdkEYvI9gLONMieIHRKOmpreWKqK
         dYsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679295106;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nwbSUlA3zxhSUQTAKIITpjLxnW9LRkO1uNXODCdYZpY=;
        b=jxMP72dqdNeKMEhdkOPuUEPuHtGQbZuxB07Bf2EL12U4eY2Wuqnm04et+4B+ajQeKJ
         fCDCU5TSDsDICevcgrdr0X4FC1X7PPCBOiZGG2FZMzG8k0PpbqtDbzuM6hw8SuhKpaF4
         k2mk9chq2Fqe6CbxTpIE67onKcdSaglO2bs1F81StmrIdTgLnVLdcALVguBepoO7jVga
         nb+tiLs1gvVqBCzzNja0EGTze9KSyVYFguqkRadh2WwPDxjae/3ogMfi++G9qLOuTSSc
         fv+P9b26euaaL2d9EWzCWSNYmXuHkKYV/XDwymoE16Z+8s6FXyU1apjdJdWii6IQykkO
         Nugw==
X-Gm-Message-State: AO0yUKX4ieKNwgOkJGc0RgI4H6+w8rhJKR8tyobr7bJ6QhAM6d5+QdPu
	1Qbkeqk9azQNl9ziSsGN7KalJw==
X-Google-Smtp-Source: AK7set8Sjm75w1NkHTe1vkKDO/DxHYYy69GkFCJ6+mezWU4SeCxP3PBNqIc3uz5JtTX1pbrqswwBjg==
X-Received: by 2002:a17:906:cedd:b0:932:4cbf:5bcc with SMTP id si29-20020a170906cedd00b009324cbf5bccmr7853610ejb.37.1679295106132;
        Sun, 19 Mar 2023 23:51:46 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:4428:8354:afb6:2992? ([2a02:810d:15c0:828:4428:8354:afb6:2992])
        by smtp.gmail.com with ESMTPSA id g1-20020a1709061c8100b0092669fb4ba1sm3983391ejh.130.2023.03.19.23.51.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 23:51:44 -0700 (PDT)
Message-ID: <170bc10c-143a-86d8-91b6-7841584b8f0a@linaro.org>
Date: Mon, 20 Mar 2023 07:51:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 3/4] dt-bindings: arm: sunxi: document MangoPi MQ-R
 board names
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20230320005249.13403-1-andre.przywara@arm.com>
 <20230320005249.13403-4-andre.przywara@arm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230320005249.13403-4-andre.przywara@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230319_235150_940313_7CB75F3D 
X-CRM114-Status: UNSURE (   7.78  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, =?UTF-8?B?QW5kcsOhcyBTemVtesO2?= <szemzo.andras@gmail.com>, Belisko Marek <marek.belisko@gmail.com>, Fabien Poussin <fabien.poussin@gmail.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 20/03/2023 01:52, Andre Przywara wrote:
> The MangoPi MQ-R board is a small development board, using Allwinner
> SoCs with co-packaged DRAM. There are versions with a RISC-V core and
> ones with two Arm Cortex-A7 cores.
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
