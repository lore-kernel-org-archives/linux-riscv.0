Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE7E0C3DA7A
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 11:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RIgpIKhe6iYCtr5uVpg4hWd3P7AfPHP1SNsSwka+I9Y=; b=HsAOfWIhP4ucLA
	0fg0c7MuUkfl4vMXPNF3TpBTuTs+xNu9ej9L7nzZB0QMIm51p6uBVfIsqw5wzSjWT5pm1DiNAiQJs
	LmYNrY5poLFXDYJFEhXvtapp525j4mtUlpfUrZb6Ud6HELU6BZ5LieQQot6GBV3SjhISla38C2vwM
	a+iDiBa2L42a4O6nJBAma3HG9N5//C/I4qG9lO17OllLQDPrAmJZ96XjUSijtihzk1Kb+q+OiAST1
	E7waOgT6ELQ03hMDtrIMFsYPk0P1h0xz/mNpWyZRb7gqOXH3w93h/uLgaHVCfIfDuX0qCbvSn0T51
	avN2u+9hV7JRK2dkdQRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDkZh-007eD4-2O; Fri, 06 Jan 2023 11:07:49 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDkZW-007e96-N2
	for linux-riscv@lists.infradead.org; Fri, 06 Jan 2023 11:07:39 +0000
Received: by mail-wm1-x32b.google.com with SMTP id b24-20020a05600c4a9800b003d21efdd61dso830705wmp.3
        for <linux-riscv@lists.infradead.org>; Fri, 06 Jan 2023 03:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZY/0HK5vhWq1atET0Bpv4+WgmiEnLmZw9upWsDYoJe0=;
        b=PRH4h0KL0RGYsGtinEt5uGvc6yYjP2pMeE+oPGF9McFxEnYc0ZDgmzvz/k23/MOAPo
         WFcj8l0PV1k2XjUUOpSwHakFQzJXJJFMBY1uW6lKbNd5KXQPqgeIcfobd8o3mMC8BZXZ
         K2FW2/KL16WtuL4lGcSLo0I2OZBw6Aph3e9h3W/TEBC4bVOD0j0wJlus0S1MO5xuSTVd
         XQVx7NEmkytMub8399S5u5/aMsUVjxNxa3sYsdKnFlD5r4yjZVe/SQaA/aHK015HWNlv
         H+xRU/NrzNoNdeg/xKKq51dAcnb9/MsvgK+fO6Misr9OxcWwQ2/VPntOKPDt78bR1Esr
         Yg3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZY/0HK5vhWq1atET0Bpv4+WgmiEnLmZw9upWsDYoJe0=;
        b=MznAPW+IYqqv0VuB6ArhSP67vGo8fdQ0r1Jw5GXOkyoGsA9GdBtxy9LGpJIfoIrPFu
         cZE8RNG+tymnTXuanu8NVBQTfsJZwi0DwzlUtIASSyqJ+wxGXQdRyMNDmESIe+69E5Qz
         PSnFoA+TjSt7/iMqFHkbQ4X5Xs5Yi/YGumi9OWNb5UaLvfaAj4N7Tz7obObJAImdNY5r
         B/Ji0IohMrCrfFLzWOz/6eYBdtSiggqP2ixDl7HsEUHMKzYjMHLL/xDG7E2jeuk6h+SH
         O8EYL9E5k23Htvu9026SQH8HezRtTp6Vw/JZ6Uh+OYzP68HcT876HFBTUzVjv+Bxf48V
         o1yg==
X-Gm-Message-State: AFqh2koNLs01KZUqLcSQ/i8OdHeismg9bTEqHqhIBTPHLTfgF/fzXyiv
	56eeTFIR7KdjKnb85IsUfqoZRg==
X-Google-Smtp-Source: AMrXdXuhrDzIoOs4ugbIUgNEN4hS46pqg+RXmxWlx7qeJfIhwodH1pzfIbnE0OeoKrRikOwmN57Xtw==
X-Received: by 2002:a05:600c:1d03:b0:3d3:4aa6:4fe6 with SMTP id l3-20020a05600c1d0300b003d34aa64fe6mr37858456wms.3.1673003256258;
        Fri, 06 Jan 2023 03:07:36 -0800 (PST)
Received: from [192.168.1.102] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p9-20020a05600c358900b003cffd3c3d6csm1502418wmq.12.2023.01.06.03.07.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 03:07:35 -0800 (PST)
Message-ID: <8d1c49e0-1aa2-b08d-b68a-64d9beed54e3@linaro.org>
Date: Fri, 6 Jan 2023 12:07:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 3/4] dt-bindings: arm: sunxi: document MangoPi MQ-R board
 name
To: Andre Przywara <andre.przywara@arm.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230106010155.26868-1-andre.przywara@arm.com>
 <20230106010155.26868-4-andre.przywara@arm.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230106010155.26868-4-andre.przywara@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_030738_757176_591AEBDF 
X-CRM114-Status: UNSURE (   8.99  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Fabien Poussin <fabien.poussin@gmail.com>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?UTF-8?B?QW5kcsOhcyBTemVtesO2?= <szemzo.andras@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 06/01/2023 02:01, Andre Przywara wrote:
> The MangoPi MQ-R board is a close relative to its Allwinner D1/D1s
> siblings, but features two Arm Cortex-A7 cores instead of a RISC-V core.
> 
> Add the board/SoC compatible string pair to the list of known boards.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
