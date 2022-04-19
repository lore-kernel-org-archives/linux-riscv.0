Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13862C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Apr 2022 13:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tCrOxIrA6gbdnM/KvQ/nQdhylwalyVGv/clBgNyMcx4=; b=1k0lLozoJhGvt3
	qXuD6tglWH3qpnnZOgq8OLGTtW01uC8IQ2LNVE5lntsqS4gBYAOQVAdcpk66JxR/nnMGZZoiIq0gs
	YOn3wyCjE02Kt6mMnCodVzzfge+y3lqbOPAzT3zKwL4NjYlIrbes2S/3NCMBzycHtHctFVVqH5dIa
	ZGJGYQ4OeIyP/zkZYkdXFSxyTAAXOkmuGPXleQmKTPRrlSQNaExYm8P1ZtmAwinZf6R8YjnMyTsjs
	RD7000eJ5q2I771F7p2Wi1ThH8GqRHRrbYKwZxFcdl+ke8Zuu0wfJjevNF+0jpZGlBSeWNXOszjx9
	vq4fNHcCCBoYfJczLRng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngnfO-003kSn-Qb; Tue, 19 Apr 2022 13:13:14 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngmVh-003Ip7-Pg
 for linux-riscv@lists.infradead.org; Tue, 19 Apr 2022 11:59:11 +0000
Received: by mail-ed1-x52b.google.com with SMTP id v4so20920449edl.7
 for <linux-riscv@lists.infradead.org>; Tue, 19 Apr 2022 04:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6oA1XojTBV3oA9r/HKQ3Tl1fWWX+00CTBT2nxTWPymY=;
 b=hDR9Sem7MlKGIbYOPdZKzDLQQoA1Ps1MPKQgOl4DfL9ZhR6uk4ow7cmRujEgHca4+z
 LHrJQUqfAnG+GYinLCxhNo021USDj7Ay+o6y0eMUirw3v0TDkylvC1rrYu3R7sew6U7T
 VtcSna4j2XI0YFrEtXDsTUt4V2Wk+cKcq0laOt/lrz/5RB+epAI9zeWa+5t83oL5XEdp
 ejNyYqxtaDaInpvPZUufRCcnRaAx7mYhj2rVmbty5tG9Ez4ZjDArimtgstQTFnThs2PK
 qkEowriCnuaEJzFjB25g2rYeXlCrryjPVUyCzonmIymb09b/1bJhE5oHJOxkH4jQTQFC
 09mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6oA1XojTBV3oA9r/HKQ3Tl1fWWX+00CTBT2nxTWPymY=;
 b=UwJKSsMxpg3TGpK8E7kIQ3KWRSL9DM8bI/pC1cRogmcifZByLI4oZl/DJCf/zWmOGM
 cTiTdnQuDy3whBB4+Tf3K+OVOY4yJtZuee2jQAdpZDma7T3UaUN4p7dZNFOHYkY7+w+E
 plbzd4KCsqSCTzlm+mEg3QtxMV56gwLdXNrx/Bc9TAvwH+lW7zUQ2c3iXjYjE/z6yJ5S
 9/orhOQJHP8s7pwuXQlumtx9CjuXHinhNctX8ylsIxVVYzr7AYOnYq3FGcW691CV5UA5
 6QOaYcf6HzAjsTKiOhaixFKXbuIgqZE2Gh9h5BVpch/GXiGuq+eOau49YOAkv6UMPjuZ
 XSPQ==
X-Gm-Message-State: AOAM5303uTcd8N059Smx/AqdQZ1TN37bsNrA/Qw1j8uYPJw2ne7T9uYb
 gfElKXkvLgrQpoivBDhRzxqrLQ==
X-Google-Smtp-Source: ABdhPJxS7yTBdB7NfvlxHjWxaLfiWZFzcz7EPz+lZ+OBcndTA1+SohbMymqQSLWiLrTaqWI7UtT/Lg==
X-Received: by 2002:aa7:c489:0:b0:41d:78a0:5b32 with SMTP id
 m9-20020aa7c489000000b0041d78a05b32mr16985415edq.305.1650369548476; 
 Tue, 19 Apr 2022 04:59:08 -0700 (PDT)
Received: from [192.168.0.217] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 p9-20020a05640243c900b0041facb9ac9esm8111757edc.1.2022.04.19.04.59.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 04:59:07 -0700 (PDT)
Message-ID: <4f31fc70-c227-f69f-8fbe-6fa8a1113258@linaro.org>
Date: Tue, 19 Apr 2022 13:59:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 5/9] dt-bindings: clk: mpfs: add defines for two new
 clocks
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>, mturquette@baylibre.com,
 sboyd@kernel.org, aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
 palmer@rivosinc.com, a.zummo@towertech.it, alexandre.belloni@bootlin.com,
 robh+dt@kernel.org, krzk+dt@kernel.org
Cc: daire.mcnamara@microchip.com, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20220413075835.3354193-1-conor.dooley@microchip.com>
 <20220413075835.3354193-6-conor.dooley@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220413075835.3354193-6-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_045909_899547_5CFA866B 
X-CRM114-Status: UNSURE (   8.52  )
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

On 13/04/2022 09:58, Conor Dooley wrote:
> The RTC reference and MSSPLL were previously not documented or defined,
> as they were unused. Add their defines to the PolarFire SoC header.
> 
> Fixes: 2145bb687e3f ("dt-bindings: clk: microchip: Add Microchip PolarFire host binding")
> Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
