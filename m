Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5791C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Jul 2022 15:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/SF33B92KEPkDyKTn2OvRz0wttz//YWFUqqCNcg2WV0=; b=l1b85BVVA+cDxC
	4bDeYUsZjByLcDcydzUr2zymj3pU69QEoVXZSb+IVqW8a17OmAEwGX6Y6lsLYVrtTesQ8svw8W7uw
	5B7O5ot08VQgyGJHBMEw95ADNuWbolQxRVpqD0HsrzUXAIBymXB55Q0+ua1nk85lrlo8x/zlrxx+X
	bILiU0Yq0bVZiIeJVg24o6sK+veI3FWJHngB8MgLe4q07yZw5+CHwj7yF7lisskT7UaCg8X4CW2ty
	smHLIVkcIdL17XegsWs+TkiZkO1IOKzg48B6/qkIEN2KcjATsbx6Vrg78Pi4xEVBttpRrDS9bavvR
	hXSTs4tLhpK0v9+Uy3PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBIIQ-00CTmC-PX; Tue, 12 Jul 2022 15:59:34 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBIIN-00CTep-HP
	for linux-riscv@lists.infradead.org; Tue, 12 Jul 2022 15:59:32 +0000
Received: by mail-lf1-x131.google.com with SMTP id a9so14669453lfk.11
        for <linux-riscv@lists.infradead.org>; Tue, 12 Jul 2022 08:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=j6+PXk8lV1TXVHUADsHXPNfDWOMk0hNuY2THqh6dtzw=;
        b=WCaWesZaI9ZooJ3Eti+u5meFenVeVAykhce3G/w/pyzUZuu3XyOH943ZxO27OBSzUN
         L7aEBgK/W8Alrcw+AuHvhvJBl/OC/H4k6kdNlZbo6jhkCaJqTK7hCmTzkHNzbvzYVtcn
         PN106bKvlQlzPhQaDqC7MtCmYYnBIOgtrXHj45OyCn88zBWfUzQQAAacAqajTCQ28ew4
         6fwJ2xPHLOFs4Di4yVIYOc9g5wL7+O6L/QiKIsT7ZeLmoKrbxkwuTxUMvsfpVAGyIMTa
         m6XQCiDHwOTuem6TGtmHq/lZwIMgrfUaLTR6wfTib7UNU9mNmTho1uTwhI+yBXQ628nu
         r64A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=j6+PXk8lV1TXVHUADsHXPNfDWOMk0hNuY2THqh6dtzw=;
        b=7STnKqrRhkW6ESJaf3R7vv+LDNCtyg0UZd39DLcSlE2zamn5Y1Xo1/eXUtvS2ynOOX
         XcRv1KIfsScPByhUZcRPOMT7MvfC/huN0TYsyfQc0//bVQF//A3ygrlXAd0SMZUO0zeA
         AExD/q+qQWVSGBW9U9KV7HiqwPXe6/PmaMmdHAeveAzvlqKx4o5cZ3yeaPdMf0Hdk1Mi
         E/yGlZquAjPmKMv4LM0f5dRIcayv78kxiRgMwB5njH70wgV2rmSc4A3cavh8p9y64L/i
         THYMFGrNUWK0TMs+6AFjm1Xrjt27a3LBuqbgekjiOsf3coK+xfkTkzofaU5u7MEIu1Mg
         xe2A==
X-Gm-Message-State: AJIora/ZLlw7yxajmJEjuI9EJuwJ4tKOZb7/vpGbe/xwhHHLWHG0CTjj
	QTKS5x7MHMWf/kNJz1PjDoCNow==
X-Google-Smtp-Source: AGRyM1sXKSwY2kqCkXvSTvsJkmso8Nd0IefLuqwg19gmixZGRWhA3P4R74SYwesubgb1pAJocgzMAA==
X-Received: by 2002:ac2:4e03:0:b0:485:74c4:97ce with SMTP id e3-20020ac24e03000000b0048574c497cemr15199250lfr.13.1657641566787;
        Tue, 12 Jul 2022 08:59:26 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id t21-20020a056512209500b0047f84ecae2esm2235047lfr.236.2022.07.12.08.59.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 08:59:26 -0700 (PDT)
Message-ID: <eeed43cf-7bd6-9d77-9e1f-e018a236a058@linaro.org>
Date: Tue, 12 Jul 2022 17:59:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 04/13] dt-bindings: memory-controllers: add canaan k210
 sram controller
Content-Language: en-US
To: Conor.Dooley@microchip.com, damien.lemoal@opensource.wdc.com
Cc: daniel.lezcano@linaro.org, Eugeniy.Paltsev@synopsys.com,
 sam@ravnborg.org, daniel@ffwll.ch, paul.walmsley@sifive.com,
 vkoul@kernel.org, palmer@rivosinc.com, airlied@linux.ie, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, robh+dt@kernel.org, masahiroy@kernel.org,
 geert@linux-m68k.org, niklas.cassel@wdc.com, dillon.minfei@gmail.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-riscv@lists.infradead.org, fancer.lancer@gmail.com,
 thierry.reding@gmail.com
References: <20220705215213.1802496-1-mail@conchuod.ie>
 <20220705215213.1802496-5-mail@conchuod.ie>
 <a516943f-3dac-70a0-3ebd-9f53fd307f25@microchip.com>
 <b8b015f0-d16f-8528-719a-1a3f74d9f176@opensource.wdc.com>
 <969567fa-77ec-48da-ef63-c5d18de4b213@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <969567fa-77ec-48da-ef63-c5d18de4b213@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_085931_619451_2EDF6790 
X-CRM114-Status: GOOD (  11.99  )
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

On 12/07/2022 17:54, Conor.Dooley@microchip.com wrote:
> On 11/07/2022 00:21, Damien Le Moal wrote:
>> On 7/11/22 04:39, Conor.Dooley@microchip.com wrote:
>>> Damien, Krzysztof,
>>>
>>> I know this particular version has not been posted for all that
>>> long, but this binding is (functionally) unchanged for a few
>>> versions now. Are you happy with this approach Damien?
>>> U-Boot only cares about the compatible & the clocks property,
>>> not the regs etc.
>>>
>>> I (lazily) tested it in U-Boot with the following diff:
>>
>> If both the kernel and u-boot still work as expected with this change, I
>> am OK with it.
> 
> It's all yours so Krzysztof :)

It's too late in the cycle for me to pick it up. If you have alternate
tree to take it through, go ahead with:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Otherwise, I'll take it after the merge window of v5.20, so in ~1 month
according to crystal ball.

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
