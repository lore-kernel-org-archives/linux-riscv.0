Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14AB5C41535
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 17:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uc8EEJcANu4gruxYG7B5xpmPJ3HBM4ub+dfv0uvOd/E=; b=mWKUCFRg8XeAlJ
	mU1Z6bqCF96upyWQfRdj1vIhTdNipEkyqfNXBv0+Hmxas9+QCVgym9eGNOAuMTEgRYLBPKCMJnVzo
	fYeiWTAaiGJYYelakRR/bCEURJu3T7bNgXWF/dJwjCLbanb9aPJc0If/viVTsZUuiKnY4fpZ9/4mB
	HCO2dQrjVbdkntyPIllLJarj9m1TzI/kgSyjQyy9jrHu0UcNaD6DYk2WBe2hFW2EObRUz/l/dkTS9
	YZZA9Q7ixPHNnkQNf7/O3RKJGjjSjtzb/L16agf3vTToBo/L5gkqutCxfz3qupkbNEZz4GsbNxNR3
	iPN97ww629mh239pA91w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFdfV-00EtGp-2Z;
	Tue, 19 Dec 2023 17:14:09 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFdfS-00EtFw-2A;
	Tue, 19 Dec 2023 17:14:07 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a268836254aso39970166b.1;
        Tue, 19 Dec 2023 09:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703006044; x=1703610844; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f9vtfVLly14ekhlTunGy1vRxwLpd8U5NIsSj2AVK3Vk=;
        b=ejzJL42HG/VPR2aq3bNF8N3ZD3o9jR4J7L6IgAnsmJzrrDYgSHl4U4awGUCTkt9rf9
         yhHGIOExb4EWq6HDTad+86ezHN8OIR5oVKu5wBP8/XhnYjo8+mFgI8ANQ88hwR9p6oHS
         9OkSPA2KstT1rArR99Zuw+Xx+OB56ArwhNCXCajroBlsYgNiCs+xHY/KkmWzw/NzIhgE
         H3O5g1wSsFGqBDkUD09JuqpF5EYe04lnDMgcY/2pKQ7zOIJezZpEiflNDSohfEHgZMmK
         8V/It9u1OrvcS+zrxWZ5e+vgUfrm69R0wXqR0WXvCJ3LdewBThsYilym4+IKdoc6bktn
         MFGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703006044; x=1703610844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f9vtfVLly14ekhlTunGy1vRxwLpd8U5NIsSj2AVK3Vk=;
        b=SC4OxRqQ+o7A9JO/V93Yre5MzSZeQOouP0CxnVD3Eh7XLUlwaNhAQenxEUzVLFtU4V
         rTYCPn+PJaqt10i7WfoCI16ltGo9+Jq+slvgGQ6KzQYAmEWIN0UcdegvXfGFJVCVFZg4
         G7Ttj5/3+jKJV26Bn2ZuqH2l3W40GZVNxPhOUX4V8kp0vBuGEdpQqu6gYsJLe02I3jnf
         oMKVjD1PkG/UakQrVbzNkpUN7hj6FDZovIL8MQFKVNRAsZsV1pMKPJo+jNMSVGVnCv6c
         ll4QIxv1SY250nbdZ4vSL0T8afQVq1mf9GhY150K9PUqMfRS10fiqHZzbG5nRk3e0RtI
         bD7A==
X-Gm-Message-State: AOJu0YxpXIVhR22XNr8UidpRPfj/cjIs7hLPaWePmQz+xgw/bzorPKWV
	xlsShv4YwTMNiJoV4TTid0U=
X-Google-Smtp-Source: AGHT+IG4srAKNtlRLgacln5AazC7R1jIUPMIg1CJHj5l9uMv+Lm+7DWv6+igpI5lY+xNGDiLnRvPEw==
X-Received: by 2002:a17:907:3d91:b0:9fe:57b3:bc08 with SMTP id he17-20020a1709073d9100b009fe57b3bc08mr11848783ejc.41.1703006044090;
        Tue, 19 Dec 2023 09:14:04 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id cx7-20020a170907168700b009fc576e26e6sm15541544ejd.80.2023.12.19.09.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 09:14:03 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maksim Kiselev <bigunclemax@gmail.com>
Subject: Re: [PATCH v6 2/3] thermal: sun8i: Add D1/T113s THS controller support
Date: Tue, 19 Dec 2023 18:14:01 +0100
Message-ID: <1950771.PYKUYFuaPT@jernej-laptop>
In-Reply-To: <20231217210629.131486-3-bigunclemax@gmail.com>
References: <20231217210629.131486-1-bigunclemax@gmail.com>
 <20231217210629.131486-3-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_091406_709577_2F369383 
X-CRM114-Status: GOOD (  10.62  )
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Yangtao Li <tiny.windzz@gmail.com>, John Watts <contact@jookia.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Zhang Rui <rui.zhang@intel.com>, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux-pm@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh+dt@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Maxim Kiselev <bigunclemax@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Lukasz Luba <lukasz.luba@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Dne nedelja, 17. december 2023 ob 22:06:23 CET je Maksim Kiselev napisal(a):
> From: Maxim Kiselev <bigunclemax@gmail.com>
> 
> This patch adds a thermal sensor controller support for the D1/T113s,
> which is similar to the one on H6, but with only one sensor and
> different scale and offset values.
> 
> Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
