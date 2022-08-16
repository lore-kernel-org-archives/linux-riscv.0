Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C621C32771
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 09:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xAyuZsa1WOHr7UR0En6hL4ccbN2gponlkcNk1sLiF0U=; b=pZfkN1ADFvrCZp
	O0sxwzFgY1xr/QjSwJj4e3kUG+CeF5ULFImeZZBfgYX+9/YcFtCC3wHnqWk34KTpWlafpIoqWunHY
	L8tagyZRpFTfg4cw1wDggYTIY/1nx50qYcKEWbV7v7iZKo2MRtY91FpoEqGZ/15HxGQElyEXxOXbJ
	n479lkeG8nNv3vi29OJOho3aizt06jFXPGX6DfpZY3Hjrs75FPrEG+oN9lNcxhbuBPpt4JzrmEejI
	HfhUyBqCARp2NRittbpKO7qL9koh8oSm66g/jwHCSWOAryqgx4PmCpDAMw8EA6XdkxFNLpXhO5Aut
	RBRGbfHUeHHLTrqvMzZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNsqv-000IXZ-Or; Tue, 16 Aug 2022 09:27:13 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNsqs-000ION-TS
	for linux-riscv@lists.infradead.org; Tue, 16 Aug 2022 09:27:12 +0000
Received: by mail-lf1-x130.google.com with SMTP id u1so14093439lfq.4
        for <linux-riscv@lists.infradead.org>; Tue, 16 Aug 2022 02:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=YuhzrIsKzKoxljsJquJ+N3MzsaKkJkpZ8K+pC1+WTlM=;
        b=wvHYOe7vCMOWiQ0nymIOzn6F2Mne3tojRiURaRTfDlx8FNTjviNmtXGdZM75UXUnsI
         4IJv3jaEffif/5cR/jc3VDh/QkFxJ/mVnVnpvjn/oYVEMe2zWGUM0jzGCHv8NkZDcROz
         6Vk+KUYDHLL6g3rS7ddA57gEnvLXZoxKtLKPZ5RrmtNpILJQMwIzy7LZDxvUdy086HUL
         CV7KHiz9zQsx4F/1AbNzNU4AzslfxAnj7G76D02AoxRcoE1yWk+vm+b+RpiyetKqSKg6
         f0A/pYcy5s2efGQypmfyLv8jQT2zNLjBHrHR492VnDTElyGmysFM4varqCcY2u4yJ+wD
         qWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=YuhzrIsKzKoxljsJquJ+N3MzsaKkJkpZ8K+pC1+WTlM=;
        b=4oVHR5Qpsktp5muKEP0SgzkaiPeAmJTpAYrpbLGA8P/yhrlY+bXnFhVHfQM7YgRDVp
         krnSZCHuQFtmFh0r+44pWeYuynHb61Phz2Ejl/AGgbm+vgUPUuP7geSHh9Fc3q43Cw0h
         J1UewigsWMDI+wHQff4iHVnGQ/m01Mrn4bE3hjjuKJKBQAK+DUaDgzP9y4PnRYHmWIdP
         mPiGI+fEMm6dus+GKqbPyoiguxfVlAEYss6Qi3w+0VTEsagb05tHROX6ih2pyZf/AAp0
         xrOHnIpDlGrCSZYcywmwZUI6v4w89gAOFKtipoLxFZk8cv9/77Y6QzA3cw75uqCSxUd6
         +deg==
X-Gm-Message-State: ACgBeo0X/qOtNf6T3yrrjLwxJ22sHqnJzOr1KqZ8zIXXPvVUBhjMWbbZ
	u04lryB6dOyy9lgFEsUPIiK/vQ==
X-Google-Smtp-Source: AA6agR6s2p78Qi53zblpaHXfrGi//J3wJqGVT9FrxyRs6MqrWgTRPUjHp/ZhteJLKa8SqLm3gh6NhA==
X-Received: by 2002:a2e:7007:0:b0:261:6dd1:e0f5 with SMTP id l7-20020a2e7007000000b002616dd1e0f5mr6503137ljc.394.1660642025713;
        Tue, 16 Aug 2022 02:27:05 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:1782:dd68:b0c1:c1a4? (d15l54g8c71znbtrbzt-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1782:dd68:b0c1:c1a4])
        by smtp.gmail.com with ESMTPSA id e19-20020ac24e13000000b0047f8e9826a1sm1331015lfr.31.2022.08.16.02.27.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 02:27:05 -0700 (PDT)
Message-ID: <d6acd450-a3bc-d5bd-eda9-9664e6beadf9@linaro.org>
Date: Tue, 16 Aug 2022 12:27:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v5 04/13] dt-bindings: memory-controllers: add canaan k210
 sram controller
Content-Language: en-US
To: Conor Dooley <mail@conchuod.ie>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul
 <vkoul@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley
 <conor.dooley@microchip.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Niklas Cassel <niklas.cassel@wdc.com>, Dillon Min <dillon.minfei@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20220705215213.1802496-1-mail@conchuod.ie>
 <20220705215213.1802496-5-mail@conchuod.ie>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220705215213.1802496-5-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_022710_997167_ACC5D32A 
X-CRM114-Status: GOOD (  10.17  )
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

On 06/07/2022 00:52, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The k210 U-Boot port has been using the clocks defined in the
> devicetree to bring up the board's SRAM, but this violates the
> dt-schema. As such, move the clocks to a dedicated node with
> the same compatible string & document it.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---

Does not apply to my tree. Please rebase and resend.

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
