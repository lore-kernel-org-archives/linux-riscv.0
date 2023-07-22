Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61502C001B0
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jul 2023 09:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lTDKusOuz0G+w19yGR/cIBA3MWRTCsm2XqddIdK01xo=; b=pKeHAK9i9Ljhoy
	oS2vH+cUULmRPljmq3mGmmDR78xl5VLGC836vJinAPn6uVyG3zlfu15JmQvO5afdvBLBTDds4Gajc
	NriWXl8/P5CykA+i3Slai5qI0dMbsJ4Vd/n33e29gGgeEWUPqNO9G6K2F3mGlpdk7UHLKEvOvNA4A
	Ju1zBGmwFHJjTIJY31/2YSC5teLiX4kkOcuuIYV77vErJRYuOHQ3bz4SPHGJUXIkUj/D/MROI7WgY
	B1ILsgOMeTjyGKeNKn/nBe9kKxGZEuSmvD/+yiieEDPDaSkkuDoqVkg6Z/aLf08vMGi26KAFjyiBD
	mDnwDUucAZlEv1HTk2/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qN8w3-00GFvf-2d;
	Sat, 22 Jul 2023 09:29:59 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qN8w0-00GFu5-2z
	for linux-riscv@lists.infradead.org;
	Sat, 22 Jul 2023 09:29:58 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-98de21518fbso437984766b.0
        for <linux-riscv@lists.infradead.org>; Sat, 22 Jul 2023 02:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690018194; x=1690622994;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WjVqeX0y//4nrDSpiCRGlr32t9U96I9NgVlq9whIyS4=;
        b=c/lWRogWO7Qdah02C1MkCGhNJvgGrif4oTCaPGdiK7W6NLpgxId3WwbMLqpuO472V/
         hv+v+JpG78Ij/VjrLudZjSb9znRBygfAX13gn7AW9ZXgckupA3UpSu77hFE43mLYi2Fa
         dTmzQqzoJTB+XVZxAcFcRNvrKHq8cPn3QNxRcXjlHczYx/PagKU2z79FFJsETjma5XPk
         WNjKvgSkT7hDponNZI1p983MhnTS1Cst5EKzwhQIk1ixI2QEL4OsiIASZnodOuY3q33i
         DzXo6i6W7Gban+p5Kj2vaFzbtu1B80PDCgmkgfzP8TzJaF9uqIgupXTYoalJZ8ajHxDt
         bdvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690018194; x=1690622994;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WjVqeX0y//4nrDSpiCRGlr32t9U96I9NgVlq9whIyS4=;
        b=EitBcOtRpKKJvHK/Y/MwFMOJSXyBIDu+NFgdwTj2XBLxNMhIncRNRwZYDlAFUnqxcW
         Xna02XLMqG54deCleHqCxsGbOHbLphBHLq+rX1d7Jg6ff92rIpoZ9yCj8N/HKe7piVg5
         6ovzqhIDUpFnbqL1M6UfSTyl5Wm3LzKw3DuGBlQU8AOqq061N47Rv/DYPB9J5BklRfyJ
         wouS4wumKhGRRNOHg1wx1BgoGm24vp2UhX2EEnDg6pPdhxgfuMphf0lTqrdELcblGj99
         1cM3CzqTs/PNV+xUwImiO5bwqVIMV0R90guXOdjsY87dR6/HLKavECH57aXti8BrprPk
         8BBw==
X-Gm-Message-State: ABy/qLZsa+n35Cm/nFQe/tLRQ/6b4sbwl5HIH0T8zKBBuiKeXFLcLJaj
	IyBz5CqsZZCtVTHmWdzh2Nhhrg==
X-Google-Smtp-Source: APBJJlE7HknlGAjPgKT8dkx6J4YpoyIOaTkrnSeiX1f1kudR9TNvxMzo3HNczgig+NEQVx/A2dTm0Q==
X-Received: by 2002:a17:907:778c:b0:997:d975:64eb with SMTP id ky12-20020a170907778c00b00997d97564ebmr3847932ejc.35.1690018194587;
        Sat, 22 Jul 2023 02:29:54 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id lg26-20020a170906f89a00b00992b50fbbe9sm3307981ejb.90.2023.07.22.02.29.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Jul 2023 02:29:54 -0700 (PDT)
Message-ID: <9fc41843-3dd6-7b22-edd7-1a22b937f646@linaro.org>
Date: Sat, 22 Jul 2023 11:29:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/4] dt-bindings: net: can: Add support for Allwinner
 D1 CAN controller
Content-Language: en-US
To: John Watts <contact@jookia.org>, linux-sunxi@lists.linux.dev
Cc: Wolfgang Grandegger <wg@grandegger.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-can@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20230721221552.1973203-2-contact@jookia.org>
 <20230721221552.1973203-3-contact@jookia.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230721221552.1973203-3-contact@jookia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230722_022956_971029_B3E3A0CB 
X-CRM114-Status: GOOD (  10.03  )
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

On 22/07/2023 00:15, John Watts wrote:
> The Allwinner D1 has two CAN controllers, both a variant of the R40
> controller. Unfortunately the registers for the D1 controllers are
> moved around enough to be incompatible and require a new compatible.
> 
> Introduce the "allwinner,sun20i-d1-can" compatible to support this.
> 
> Signed-off-by: John Watts <contact@jookia.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
