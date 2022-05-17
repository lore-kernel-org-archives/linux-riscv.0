Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 904F4C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 17 May 2022 14:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R5dev6JAQi1es77DENFgVqq1MiHd7PY6NqJCjeOeiRY=; b=OzwdaNkfNn8RWd
	GMDYZC1GkLDRZtPfi0pnqmEfWpuWiu8WxM51nHtDhD5aGRsIV+DJReW/v59GR5+lDxGPI8MO59lLU
	uLkdgYDKJh7ANt81KRbo+dpcQR/twInjAdep4OZx5XGk2H7jhFBIWW390Nhyh6nD4QraW26/nnGT1
	u4XcBJ1LJV476A5+VFuTByqUe/hYl6IR8aGu/qvGta4RNK+6lWOGJnPbkAHxEtTbJIO/BGPDDiYyb
	JCYJsmMK+HU1DVKABg4zQiZ8mOE9rDCBuG/1P9uIxfxQOS+1eGL8vDRwnp6+3ZIzHsYLXjqXMrysl
	mom3T4u/FjTFN4Ko3l4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqyXI-00EXBk-Sr; Tue, 17 May 2022 14:50:56 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqyXF-00EXAl-Tv
 for linux-riscv@lists.infradead.org; Tue, 17 May 2022 14:50:55 +0000
Received: by mail-lf1-x12d.google.com with SMTP id b18so31739664lfv.9
 for <linux-riscv@lists.infradead.org>; Tue, 17 May 2022 07:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=JvPPeITm36j9y991h9lR/vh8G1Vi3ahi8GlMgTU7Oqg=;
 b=I5IwfJIEtWxScs5NdyuHqwZwPe6asXoK8vw8bbfTTG0hlqRtf/dmca4GYlxO3fis3S
 HVkz40F4lSh701U99YG0KPmW2y6eNS9feZE9CukAFJG+j6LZDg8vMf+HKTpRcFrk4jfK
 kKbIhvXTf9cpvsVz2TxY5AYlNmtt8i7RwLP/EtSyxesP+0Ci1+1qmZy2rd2erLsEdonS
 Le3xmfpelpFELrp98qfjSzFvv77ZVHaLUQX5G/MgdCTsG4Mm1nuZMEpYvnsp2ga2awZu
 h2nMNDWjBFq14iF8p2aliCBt/LWbE1oSJBq8VoML94HMh9uDISDPlLq0E/Wt4Daxn7sO
 tyaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JvPPeITm36j9y991h9lR/vh8G1Vi3ahi8GlMgTU7Oqg=;
 b=L6TSumZHvifHZNyNme4m/mislj9SmJtarpFmlW1FzZ84LPEX80Jx3ja30+j4jOi0Vo
 4jk1I1TnE5v/jYgTKrbP71b2kEQAW4859rjykLm9lKs0bLhVwRzG4WUN7WmLWeXpJw0u
 QcfrCwerHemw77cCr/6jdLiZWkutqy9B3N+q0iHxA4Hx46RA5uWqX4EGSVK1Oz26XHyx
 MUNxAumwaTCRX5URlEabnLr0xnDRbDFUdxG4OBiqZut4r8hNBnE4cdI7CpSYs+zLQvw7
 ATFUAQnfJAEz17qEnU4vXe9kP5gObeAhV1lhP+G7hkVeRGNotgY1KwaDpBt8az6e0jDi
 12FA==
X-Gm-Message-State: AOAM530c1R20Ik71IpLVcU7KQle78szFgjnILBIrfVBMlm2nHLSIRZlW
 9oAcysfK0ZMO6u1QUtwDqLUk0Q==
X-Google-Smtp-Source: ABdhPJzu1zg8LyvM1WHN7zP1MfLbfRFx5uOhZmJpVp5inti3GTnbHKe5ASAQ5gyVUQjYt3XgvJMWsw==
X-Received: by 2002:a19:4343:0:b0:474:d7a:634d with SMTP id
 m3-20020a194343000000b004740d7a634dmr16925292lfj.168.1652799051750; 
 Tue, 17 May 2022 07:50:51 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 e7-20020a056512090700b0047255d211e4sm185030lft.275.2022.05.17.07.50.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 07:50:51 -0700 (PDT)
Message-ID: <75ec12e5-eb6b-96f9-a476-b194622defb4@linaro.org>
Date: Tue, 17 May 2022 16:50:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] riscv: dts: microchip: fix gpio1 reg property typo
Content-Language: en-US
To: Conor Paxton <conor.paxton@microchip.com>, conor.dooley@microchip.com,
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: Lewis Hanly <lewis.hanly@microchip.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220517104058.2004734-1-conor.paxton@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220517104058.2004734-1-conor.paxton@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_075054_012016_67EA246C 
X-CRM114-Status: UNSURE (   8.38  )
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

On 17/05/2022 12:40, Conor Paxton wrote:
> Fix reg address typo in the gpio1 stanza.
> 
> Signed-off-by: Conor Paxton <conor.paxton@microchip.com>
> ---
>  arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 2 +-


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
