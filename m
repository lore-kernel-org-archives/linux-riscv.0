Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA001C3ABDD
	for <linux-riscv@archiver.kernel.org>; Thu, 15 May 2025 17:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zLhuXZIXiaScTUI1NCTazUe2c+s8un0yBBPZltHHxXM=; b=SfQLGeandvEGWyrIbbeXy2GCFm
	ZXveEKt4myKEUpP7J28rYn91VlLmZi/DDRQeoB9w7Jw1krcHrK8nbfdqwFaYj00kxEVkCXmtFiV3p
	dppFHJV+IYESI1l8onl4LNeufLEA8foYJ6HqXqJ9+4E8DWegW2T2qngpPXwl1ELZvpPwqIpXb1xHp
	bUzlk+sYrfhG2/U8FfsUJkwU2Z2hQA9x0JGo1zZbHn2X1PlbxRpspRXzGHJ+lEJfXKo6noliyu5SL
	V0iZ+0tdrundf+/Fqv9iiJciNAjmwTniKQd4miA/RU8l0qCfNtwNkKLWwR5hkQb7OvqfgktGsJA+l
	Hhgpl3rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFcbM-00000001SSF-0P1a;
	Thu, 15 May 2025 17:42:36 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFcbI-00000001SRf-3nyZ
	for linux-riscv@lists.infradead.org;
	Thu, 15 May 2025 17:42:34 +0000
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6FE87497A5
	for <linux-riscv@lists.infradead.org>; Thu, 15 May 2025 17:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1747330950;
	bh=So1CFTxNLLyhmef/KyhBYu0LuKyl9nOCmDgIo++41wk=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=vL2cIm0q5H2SHZn2hxJ71bFfGAoXibms+Z1luCokxVfS78/XrgbI4ynN4FNoBEzrn
	 s/yqTrgq3FWDqvB0O/e6kdkaPBOvzoBIqiSlLKyzGun/ajiC3OG9X3o/oxHlfOHsZH
	 y/gyRyTUssP5f2tTrZ5obOx6GMtIMoL68PsfNq2lVUexqdp4FKwujBMOMy+uAlYZaa
	 jqhlb83CXhrZmsTi5epcqHmn1PD3gAnJlbaYXEROyNRjTORiJ++CsIQZJ1FJENFy7o
	 ogWLxyuOV/tuKpJgO3coMEg472S/VgbnG9Jc316iLwv3GoFbWPKZwAkMVoZfPvLEwU
	 SmpMe8RzLyEBQ==
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-609f0ff6da6so348850eaf.2
        for <linux-riscv@lists.infradead.org>; Thu, 15 May 2025 10:42:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747330949; x=1747935749;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=So1CFTxNLLyhmef/KyhBYu0LuKyl9nOCmDgIo++41wk=;
        b=YWUre6IoPiF5KO+WX/+wRIjkWiYwrE74RmOvZPyk/KQN1+3OefcKbvoxQ7MbTNQVPM
         BkYGXB7wtMDkJ+iYEpxtLryQnyiYNAN2JTtxr/07U8npAsvg+F7163Vkrlikz/qmfcUw
         MidXEYxkAzsh99GP+9GShYUsdJn1pl3AP8Nm0SJkUyksanUFS32UkNXN+riM+jXEEXM2
         OLSlW9Pqcgx3SHipPoPdahQmnBkrihRmmrST3GDvuiBZe7qlYrlKVL8II6ndQz5NGP2o
         Gj/xxNEWQTItgLnqhXclV54ypEudYD5qMX2Yb7VuSUorhL+dZhVEWLPwQ80suTeOZ2D+
         Z2oQ==
X-Forwarded-Encrypted: i=1; AJvYcCXL0JmXgNQJ+bWISDV2hLTHJuoc2gtxlc/EPI70Uk+3BFONPrY8cMOnSN0LrBiY5SPZCFJu9EWZ7K8ClQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZ9SPgYTMYNkXrLdTGwrqCzn/f8Dl08LRQOeDkmZvT+5j5jDpu
	tZ4gKw13jOYzx54LrlbqQFvmQY3OaSIFKnuBNG0rx38sTPbooCYRJpaHvQPhoUKrv0m4kBBWy4K
	RfLTvrQXfemi565aIXPNLyUY+akgUgPHe8QT9O4Bl9d0paSqj71v2KCGHpYMFEQZCNSkwpac06+
	trjBPsPC7z6xDt4oBZTgSVi4Y/4pmOksZ3eXuMbBcDHfF63cSkqNq3GVl1M9H4
X-Gm-Gg: ASbGncuUlc2WewNcnG7Dc1TnNXs0wBW90pspR2yW0YBwWfH7opVw/GOlLW5ElQHdvN0
	FYRNl/k8UiFp3z3zEXqh02dPZL/dPM5xe/aAGUcp+QC4p7f3ICv3W9mwiV2v3+Q1dICfY5Q==
X-Received: by 2002:a05:6871:4001:b0:2cc:3d66:b6ea with SMTP id 586e51a60fabf-2e3c1fb2766mr261853fac.34.1747330948661;
        Thu, 15 May 2025 10:42:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/OAz819UIHR7o2qpAdFNcz3GjooPhXbSZIsnIvoJM8E3oMutbyhPZIRnkN9DpFMjxtLmZ0O/4DGUc5r1eDrE=
X-Received: by 2002:a05:6871:4001:b0:2cc:3d66:b6ea with SMTP id
 586e51a60fabf-2e3c1fb2766mr261840fac.34.1747330948238; Thu, 15 May 2025
 10:42:28 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 May 2025 10:42:26 -0700
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 May 2025 10:42:26 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20250424060605.638678-1-uwu@icenowy.me>
References: <20250424060605.638678-1-uwu@icenowy.me>
Mime-Version: 1.0
Date: Thu, 15 May 2025 10:42:26 -0700
X-Gm-Features: AX0GCFsKao7zo32U6hevQ8RxcB-ZJSuK65r6ZvSZhpxa-_wyIbzD26PrLzWWrI4
Message-ID: <CAJM55Z_OZ6PSn3YQrrc2bz-PqKvfm76b3+dOjmuJrqGr+HZnQg@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: use macros for MMC0 pins
To: Icenowy Zheng <uwu@icenowy.me>, Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_104233_201418_C0ED3BF2 
X-CRM114-Status: GOOD (  14.47  )
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

Icenowy Zheng wrote:
> The pin names of MMC0 pinmux is defined in the pinctrl dt binding header
> associated with starfive,jh7110-pinctrl .
>
> Include the header file and use these names instead of raw numbers for
> defining MMC0 pinmux.
>
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>

This looks good to me:
Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Looking at this doesn't the contents of
arch/riscv/boot/dts/starfive/jh7110-pinfunc.h also belong in
include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h
or am I missing something?

/Emil
> ---
> This is only a prettying commit. The resulting DTB files have the same
> content with or without this patch (verified by doing sha256sum on
> arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.3b.dtb).
>
>  .../boot/dts/starfive/jh7110-common.dtsi      | 21 ++++++++++---------
>  1 file changed, 11 insertions(+), 10 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> index c2f70f5e2918f..a2c72b385a905 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -8,6 +8,7 @@
>  #include "jh7110.dtsi"
>  #include "jh7110-pinfunc.h"
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/pinctrl/starfive,jh7110-pinctrl.h>
>
>  / {
>  	aliases {
> @@ -428,16 +429,16 @@ GPOEN_ENABLE,
>  		};
>
>  		mmc-pins {
> -			pinmux = <PINMUX(64, 0)>,
> -				 <PINMUX(65, 0)>,
> -				 <PINMUX(66, 0)>,
> -				 <PINMUX(67, 0)>,
> -				 <PINMUX(68, 0)>,
> -				 <PINMUX(69, 0)>,
> -				 <PINMUX(70, 0)>,
> -				 <PINMUX(71, 0)>,
> -				 <PINMUX(72, 0)>,
> -				 <PINMUX(73, 0)>;
> +			pinmux = <PINMUX(PAD_SD0_CLK, 0)>,
> +				 <PINMUX(PAD_SD0_CMD, 0)>,
> +				 <PINMUX(PAD_SD0_DATA0, 0)>,
> +				 <PINMUX(PAD_SD0_DATA1, 0)>,
> +				 <PINMUX(PAD_SD0_DATA2, 0)>,
> +				 <PINMUX(PAD_SD0_DATA3, 0)>,
> +				 <PINMUX(PAD_SD0_DATA4, 0)>,
> +				 <PINMUX(PAD_SD0_DATA5, 0)>,
> +				 <PINMUX(PAD_SD0_DATA6, 0)>,
> +				 <PINMUX(PAD_SD0_DATA7, 0)>;
>  			bias-pull-up;
>  			drive-strength = <12>;
>  			input-enable;
> --
> 2.49.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
