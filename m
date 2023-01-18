Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FA7C38147
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jan 2023 15:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CoyfpJC2NSf/Lf8g6Nmx1+YXTxEwse7eS0oftfywN24=; b=466R96Ba3EbnkW
	Li+QZSxx+bJ0RgJKLuOO6jP0ymjw9Fnhaah/xmXcbd6pzv32ngJnH3cI3ILFeCOX6rHf+KBe3V9S6
	Ceoku376GUGKqs41wG23zUUobGEKiCnzcAf/10jR8Gq6T83pmABr9FVoJ9HrC72d/Mf8UwZV/a73O
	7+9vZGIdCaOe/tKjJOSR8KnXz6sdl9jLAzv08/fnwjkabJzRhMBC4g9sgaBaecKlzTHQll5wcpfa8
	GfsHRpVeCC0Tp5qh5GwLSAkdi1HkC7bTfHRz2b6vVWs2D02ucxJOKJzVNW2RuUbA5FHTe6C4CBarg
	z37N7pdH6dpRrqEdfuYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIAi0-001gOn-SY; Wed, 18 Jan 2023 15:50:41 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIAen-001ec8-2H
	for linux-riscv@lists.infradead.org; Wed, 18 Jan 2023 15:47:22 +0000
Received: by mail-wm1-x336.google.com with SMTP id l41-20020a05600c1d2900b003daf986faaeso1838920wms.3
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jan 2023 07:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S2/UQrgOGDC4yyfTe65BG0yHQo36ScKkbVDK3v1/MZo=;
        b=mrVJV+kB5VAmsLR0HzGPNRZVEDyPQUkOac7by1QPdbs4IP2edcljWRjDfnCLbugduL
         iEf0CxU9MtxEkMnKTOZ+0ZF4Q6wr3LXEqwN5tvvJFP/cRITqrXSS2mYSFy6X/uxUCj7m
         47cE1fGF/T4wagcylEKWyNbuv4EWLb6mfDftIxQWRZGf0C6aG0ZqAtQ1a1AUM8BLUNI1
         Q2mBUa8iCSIzuehqs/S34L8y6rcjvdkP60SxzgqJD/Mw5v+qgwJtLyn7qg87zZTSx5pF
         7qellwUyrkUpUfY3TL1CAKLO07tcaqNoddT5K3Q8ovdsjETTmJ92bD8m45cpGlHhbYBq
         KJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S2/UQrgOGDC4yyfTe65BG0yHQo36ScKkbVDK3v1/MZo=;
        b=vDBGWLnIuPg8u63L0h74ZsDdq/gHpBwntpYY5g6Vw0mfhGhM/JWn2VSbQcQZwWu0Mu
         PQLRNzMAZ0pfUqg2GFBvykMu4vsCYEmdX3TMQiDvfXPpAqFMs2YDKVmc47PWmjGd2bMt
         et75X1c0b2f7t4M74y0exV8iAlxD8WM7lgYJALgmN0XbTjS4Kj/blI7QbrHmmYWAcdhE
         Wy8Mi8lk2vt+IQU4NWE7nmPMFCbEKkXeU4iGp2C4w9XtHaxDzdhzkDcZuEyAERGYTp24
         J9X7fnybpdXUGvs5P4P56jygI4OPh8oFR6mu5DH2XdxpoTygokiGjVmC2D2DcKAFd5kV
         2fpQ==
X-Gm-Message-State: AFqh2krFKEW+Ibv8NpNmK59l3jnl3SxoWL8r/abAyJP+l2uabQT5zzpm
	b3qeNCEJJZ/ePKC90tdauFlGIA==
X-Google-Smtp-Source: AMrXdXsDMnxhFvV+nCjEhypB+Fmw+62+IqPHnHN/TbzV9By1tMAd/W+ZxVs1DheIWw4fUU/IKRLGHQ==
X-Received: by 2002:a05:600c:5252:b0:3da:2500:e702 with SMTP id fc18-20020a05600c525200b003da2500e702mr3163123wmb.32.1674056831854;
        Wed, 18 Jan 2023 07:47:11 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id z2-20020a05600c220200b003d9a86a13bfsm2218870wml.28.2023.01.18.07.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 07:47:11 -0800 (PST)
Message-ID: <15a87640-d8c7-d7aa-bdfb-608fa2e497cb@linaro.org>
Date: Wed, 18 Jan 2023 16:47:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v4 2/7] dt-bindings: net: snps,dwmac: Update the maxitems
 number of resets and reset-names
Content-Language: en-US
To: Yanhong Wang <yanhong.wang@starfivetech.com>,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>
References: <20230118061701.30047-1-yanhong.wang@starfivetech.com>
 <20230118061701.30047-3-yanhong.wang@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230118061701.30047-3-yanhong.wang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_074721_150795_4723862D 
X-CRM114-Status: GOOD (  12.87  )
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

On 18/01/2023 07:16, Yanhong Wang wrote:
> Some boards(such as StarFive VisionFive v2) require more than one value
> which defined by resets property, so the original definition can not
> meet the requirements. In order to adapt to different requirements,
> adjust the maxitems number definition.
> 
> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
> ---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index e26c3e76ebb7..baf2c5b9e92d 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -133,12 +133,9 @@ properties:
>          - ptp_ref
>  
>    resets:
> -    maxItems: 1

Also, this does not make sense on its own and messes constraints for all
other users. So another no for entire patch.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
