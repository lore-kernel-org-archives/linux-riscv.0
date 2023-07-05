Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F329EB64DD
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 06:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VrvS50xxoHrY6rHf/uXwc6CEol7bFPZtW+9rTtl0zNk=; b=Tbb0hR2kJV2nRa
	pWEW+M2w6xZKmEPg5iOkpXQEyVCL5ZDBEZme2KaTXRhD01H7/Rrmizb0TNGEmOacMfKjZj/syVose
	EOOHkETus/+LJ1Gy/y/ynLSip3BTEOyWKjc2ahepvssqXxHypxPY3qybTYIFVwN1lNweji/0EHaGJ
	mlD2qguy9RrXZW1+XJDrst1/XwDAQN9cXMTYb4bR1sD6vCl5jvnCe0TgKlOPIKzOAMMCgkpNh9TFA
	uLqqIXvp4yLw1qbRduzVCADEHc1Th9V93HTXp+6nd56lOqNRe/VMWJEhuUsczSORPa6L83XEFQZbg
	/fLzo6JldTTuLq3F2mzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGvyw-00Etj6-2T;
	Wed, 05 Jul 2023 06:27:18 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGvyt-00Ethw-1C
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 06:27:16 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-991f956fb5aso611326966b.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jul 2023 23:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688538431; x=1691130431;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GWMLJagL2+zk2i2GBf2yDl1/DHyLFspRTfvbcgg1QfU=;
        b=utB3kWgihnetwAPSEidxUjsfhoMA0hNBtnsHu8/372Rs3/YJr1wcCawJMdJS4SHkhU
         PRpSx0P3yVV1PAUCUv3vrvUhKwqJ3KU8b02qD82RIXORc+g8tHt/CqjQ26DupioKpAsD
         UqaecJoMyJ+vix452drJNpsk/CJPuQ2DkmBiyLW+vLW/jWfxgAck6KsghNMGL48j7a1Y
         1e7RLWjRfu53hu/2Fu1ryp01SjX1oj8caBoCennZI0RIfQhFxyfO4lL4RDAR+RgWWLU5
         ix0VA3jQM1hajCQxKk9/imIXnSRSx6xHn8DO573QchLNC4j3o+YCTgWfqp7I3M6RTTNp
         84pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688538431; x=1691130431;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GWMLJagL2+zk2i2GBf2yDl1/DHyLFspRTfvbcgg1QfU=;
        b=JbAixyLYMp2XldUDbQzZf1zDFRjWMr+MjffC3MDb353/hgQKG/HuSUfvk2hkDh8UgF
         Pmg+x/5Uq/XKVhdxYT9k0ZL02eswjj3t3Y5qDwEFKisn7USEAkwxJ1FQ4IdzADR6geen
         hV+8xWByOgB1NbIdoNd7J++FmJXC3SDocXbjqBlMHZp2qEtzn5cxgivbLSZ5v1U+D/zp
         0aPDGjNLqp7PGyFzsjyaAIm1D6U02fxeqFEth1tlCHaCxOZuDkVkvgTlRnvkFAN3RLsD
         DsKiTJF66eWfIqmYHbTBEOidFsBdaa272qVkq0ms5VwhE6vgK+aaHPQPfEaBCsmxGCDY
         KU8w==
X-Gm-Message-State: ABy/qLb1Cufb1PAhjJjpBhk9vxTwpLkw/YtipPQIuQ86vua+U2ctMv+0
	gr2/qIVbSCRbNona7EURCj8AUA==
X-Google-Smtp-Source: APBJJlFDD3LoaJkWiKAi3c5P1svDd86EsaEHQLS373mb2GLHBrmie9T8qSarWyPJmQHFFxBuwlgwxg==
X-Received: by 2002:a17:906:5f91:b0:992:1233:9c45 with SMTP id a17-20020a1709065f9100b0099212339c45mr10047072eju.69.1688538430911;
        Tue, 04 Jul 2023 23:27:10 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id a18-20020a170906191200b009930c80b87csm6119058eje.142.2023.07.04.23.27.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 23:27:10 -0700 (PDT)
Message-ID: <913206a5-3ce2-3ce1-774e-3a4a9030b0e2@linaro.org>
Date: Wed, 5 Jul 2023 08:27:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RESEND PATCH v6 0/7] Add PLL clocks driver and syscon for
 StarFive JH7110 SoC
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Hal Feng <hal.feng@starfivetech.com>,
 William Qiu <william.qiu@starfivetech.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20230704064610.292603-1-xingyu.wu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230704064610.292603-1-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_232715_444126_95E1E4DB 
X-CRM114-Status: UNSURE (   7.91  )
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

On 04/07/2023 08:46, Xingyu Wu wrote:
> [Resending because it has a error about examples in syscon bingdings
> and has to be fixed.]

Resending means you sent the same version. If you did not change
anything, then it will fail, right? If you changed something, it is new
version.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
