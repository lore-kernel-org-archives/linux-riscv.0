Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A86FAD4A605
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 06:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZP0HPrDlTvI6k4Tw6e4vrPD0noW6sI/oUeVDHAfkiAc=; b=zvhQlf1i5dcZnr
	6Gipr0T/C2UNTwxE0PsZDeWaVcnQI8agp/NW9LN0Ejy0KDwIWHv0AhbIg6evRIplxtyIGQBYutSK1
	XksOdVI3bvmaoUP4sMfCplYKVyS9YZOnNmT/XxaZrd9+wPeIyN0KT+NSSGABy6aP+VBzx3BJFrRJU
	kpq9krzl/bn/g4lLX6eEJToTi4KldIHQX2es3p28gAFKQmZ869LvyXG3H1EYAkyjuIbXxNCKnyebz
	6LzCxX0GkSEJgpszMnV2QfEZUNT/50esRX3i9LE0JoGbFKTvhlt35DFP1iC9Iwe37YuCart7rKRsw
	Riby+6rwmND3S7LV7L3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgdiC-0000000DfrD-0ceB;
	Fri, 16 Jan 2026 06:53:36 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgdi9-0000000Dfqu-1fnf
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 06:53:34 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4801d98cf39so4842955e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jan 2026 22:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768546411; x=1769151211; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CZBgjJWFOo/Oc5syADkh6oxfyzw6Z60jrJfIeTvBdx0=;
        b=ZOtDeJvRvnyM2nywUjH1rR4lB+m9pAOR8NVL3Llepu20NDMOOlLi5f+dPKCXOLrneo
         0fLd7S4KYc4QYcOxNip30sikkoO5ceReUoZarkHrPMXjyW1XgGaElVZ6gVNaJlUfEwBQ
         x7bd/5AwOudOHmcWEhvzBrxOC/XuXDp8y4KmoHk+bE/X3ME2kmgUVict/sREjRAavejw
         Ce84iPg1L4FXxfXms43va19MV1Ef1xsX0iQ/bLTMR89RMIg/rL/ZHyc1rEwvrVOFcb5y
         wKS0u7f9a8nwIEOReQEBsb2ndHQzfsG9USRLh6mNILCYx5HsWLwOruf1Yq4i1ZaQvpKy
         HnAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768546411; x=1769151211;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CZBgjJWFOo/Oc5syADkh6oxfyzw6Z60jrJfIeTvBdx0=;
        b=kwI4LnQZEHvZ6OXvm1/3PNwMJqdBGijPjXUcfyyYzEt4hVVKHGPOYoDyHbvikBmY75
         XdEFw7qszebnr1GdiI1bP/CXmkpRwuB6n8H557UBxfnzAKYSg5wwjrGPcRC2MmmD0Sf9
         wtmrJ8oAVImTHm3etk8x57p3iKNwdotuUGeOkpuxYitSMcoVKDv4fT43SOndX/gGR/YR
         x79EbIAuT8RFCm1+q3JjPdSthHE2I9WReDKYCkloC4WNLBLMkRzaGfdg+71xAMNvWpPc
         O75AdfW6BsjdwpNyl5wX5tUGlkC7cz8UImVj//xKvgmlfHDIOZArt/+ynD8aRcqesml2
         a+cg==
X-Forwarded-Encrypted: i=1; AJvYcCV3IyuVPKXluaKNKtiLHEBruiIx88XQ0u0PoOPYUVGpToXbW9FRKudp1k0fWFbz81MQZIHFq7QVqbIvMg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZcPShM0i3ryyEtTpzPVd0u9Y966f1aGix7/rO5TaFnruqYidM
	FKwbEDwaMBFie+vAYvSVe90U0taezH8ddKd0BVEycAfQ9foUIc+Xmz/cnI2CudpZRUlc3Nk+HX7
	Jy7GO
X-Gm-Gg: AY/fxX7gOZdvNPszr/zdCcaY5PZh3jD0Pb9hIMJho66L5nnu1ySF9ICqWiknjfivFSW
	uKKTbME1dZEV1+dgF2IUmicwn66Tw0LiqIVvEMJIhBWPSR+M10FT0KWT4YqfqdDoYFaq3HLSTTS
	jSYs570HRLaZoT+jHv2kUbg9VW1w96pXxZtGClW3mKN33Sm8hSaGdyr4jQ5XBFibl1g0xLN0rGa
	JC0qdK45+DdaK78aiEmawwSK5ln7SYPTh6eimfWs4AlesIh3OTgVMx/pIgnSQASwsRxyhzI1oN5
	8mNSMg3SMwUOUaWrl7QgQa3CVvoiUi1AnUVJy0Bz1SOiNpmr2JH6DXFP7wzLDiqkhZmgDspG9Nx
	ifOLWaXwx6GECcM4Z+Og0xa/C6u5GlMsky81rGDms013NHOFsFamajNaOEvjDtTgUzA56fzc2ur
	dQl2mMlAp0D/c2Yr3565eTwW3mfOXi
X-Received: by 2002:a05:600c:35c3:b0:47a:81b7:9a20 with SMTP id 5b1f17b1804b1-4801eac0617mr16897055e9.9.1768546410639;
        Thu, 15 Jan 2026 22:53:30 -0800 (PST)
Received: from [10.31.13.216] ([82.77.28.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8c0475sm33584445e9.10.2026.01.15.22.53.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 22:53:30 -0800 (PST)
Message-ID: <6113b444-329e-455c-aeb9-71025746d44c@tuxon.dev>
Date: Fri, 16 Jan 2026 08:53:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] dt-bindings: clock: mpfs-clkcfg: Add pic64gx
 compatibility
To: Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260113-snagged-blemish-52af3d00d88e@spud>
 <20260113-glue-justifier-566ffab2ffd3@spud>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260113-glue-justifier-566ffab2ffd3@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_225333_610779_F84FAC7A 
X-CRM114-Status: UNSURE (   7.07  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi, Conor,

On 1/14/26 00:11, Conor Dooley wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> 
> pic64gx has a clock controller compatible with mpfs-clkcfg. Don't permit
> the deprecated configuration that was never supported for this SoC.
> 
> Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> Co-developed-by: Conor Dooley <conor.dooley@microchip.com>

 From Checkpatch:

WARNING: Co-developed-by: must be immediately followed by Signed-off-by:

I moved the Co-developed-by: tag before you SoB.

> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

Here.

Now, the full chain of trust is as follows:

     Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
     Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
     Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
     Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
     Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Let me know you have anything against.

> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Thank you,
Claudiu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
