Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A971C4332F
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Jan 2023 15:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PeCeJQa8VoczqJ39+AFHFeHOU56QPJ4pyHv5ETSZLD8=; b=OCytdToIS0dEnZ
	VavTs7MiB3dk8mPu2puw4Qpy5CvVf8osyxP6CCOb8PB1z8T7eFGTccDy8s7i0yXVLukXMQXyHLJPB
	5/YrCnFbU4cjE88iOR4u2XF9l3y014uqlB/KZUJPlP/NaiGq/9Bykg1bnp6FIBQ9EX/4easftud5c
	jM3VpnERwGapjveqmmNkr4bCegxAOtUVPsr5yG/D36mc3bJGJ/qeijD7p7ur4e8t0zF1KmzYWs/fG
	h5PiSjy464ZyX4kqklKfPjl2HhRfx3KOkP4NqjjXbviNoMJr38tcX5WyvKX/7z0NqH+W/IUaJ3Woq
	GpJx1cmsE16mEnGsb0MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pC0in-002Pc4-TJ; Sun, 01 Jan 2023 15:58:01 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pC0ik-002PY2-IA
	for linux-riscv@lists.infradead.org; Sun, 01 Jan 2023 15:58:00 +0000
Received: by mail-lf1-x12f.google.com with SMTP id y25so38430313lfa.9
        for <linux-riscv@lists.infradead.org>; Sun, 01 Jan 2023 07:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nT/wNs755CbJKKo2LqAykZZrkcpLMwiTj6TNgle5VUo=;
        b=eo2daS8tNzHeAfX1ggtEjRelM1E2AF/hZuQKDrbXvG1nlNzr7BJmfDltGHTHO0zhhA
         pEwxywhyUViXLBBhaaJne7jZg4rbdon105hNzvzu1hDwdJ1FPuSnCUD99OjEwXnqu1xu
         qd4fLi8h7SEG+geon3hCdA1oARaMljmezubuIdioM/6Hxbfih/IGvbaRb4jLzsJeRBIo
         QJtULYJpdbgUz8q4AL2fOnfpO3f92H0Xb1W0bIKcmz4Kksztm0XFozAwUtafmUVViydn
         79Gza9o6Jxy3UzLBA1F65XWVPsK3VDfRXMFwwWGaPwxoYOrXuWFwoMya2wCXReopzVSy
         7+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nT/wNs755CbJKKo2LqAykZZrkcpLMwiTj6TNgle5VUo=;
        b=NYsM+/UGhTHw/c2F2LypmbIsBHJLhZseo3lEzFJ3J4BULCld5JVe1wm6gcG5UoDouY
         WEDiJ8opu6lr3cCQW/kIli/lRfYN7uqI/vsxMmQlYApHZhZn9NVNE2x5PCIveyTj5Jlt
         G7M5PXUVIuHMnKZxfQVINbky6hQUirRKMsrDubHo/qyjun9KtYcG3XCOlcraMzlNlyqZ
         m/VgFgBJVP7ZQ6BP9zLvyddODWndE5BKaOqEynyU4y7u8FmDZ+H2fnrxOomhdyICQ758
         qTgGZcTgwG8DYYRR8wJ5knL/6HHFcmkGk9G1oJ0gq+uR+X5hXLy2GIbSg2ITQGQfGglY
         W/Bw==
X-Gm-Message-State: AFqh2kqElsSCj0CLeptXVGNBmP/Vl4/40jv8PK4SfFyzem23eNOAUe6s
	lI+WAUzr83XWxIvFGrbUOj/ZHg==
X-Google-Smtp-Source: AMrXdXvmDgwvA1xnXZ9dJ32ybmiv38vs5VFBCn8qj8MqbxNP93P9wdvJlMzbkINyTln+UR426UlIWw==
X-Received: by 2002:ac2:58d4:0:b0:4b5:9e70:ca6e with SMTP id u20-20020ac258d4000000b004b59e70ca6emr10831226lfo.17.1672588676468;
        Sun, 01 Jan 2023 07:57:56 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id 7-20020ac25f47000000b0049482adb3basm4199109lfz.63.2023.01.01.07.57.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Jan 2023 07:57:55 -0800 (PST)
Message-ID: <ce838de7-4dfc-4631-8f87-1fb311dcc739@linaro.org>
Date: Sun, 1 Jan 2023 16:57:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/3] dt-bindings: crypto: sun8i-ce: Add compatible for
 D1
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>,
 Corentin Labbe <clabbe.montjoie@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20221231220146.646-1-samuel@sholland.org>
 <20221231220146.646-2-samuel@sholland.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221231220146.646-2-samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230101_075758_712587_BE9EB3E2 
X-CRM114-Status: GOOD (  12.18  )
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

On 31/12/2022 23:01, Samuel Holland wrote:
> D1 has a crypto engine similar to the one in other Allwinner SoCs.
> Like H6, it has a separate MBUS clock gate.
> 
> It also requires the internal RC oscillator to be enabled for the TRNG
> to return data, presumably because noise from the oscillator is used as
> an entropy source. This is likely the case for earlier variants as well,
> but it really only matters for H616 and newer SoCs, as H6 provides no
> way to disable the internal oscillator.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
