Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB77CFC265
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 11:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VOUlAoKp+6WnoKZgIJf6imscrH71A9ejNFIcP+jwNn4=; b=wtByPn/zbOe5qb
	2/JOZ2k+uSIWCpCigrgVnQ1WllOZsN1+KKTvGTnVoVeQ4cpyxMFDgLj89rsOGXJinJZOqSsiu7X2+
	+CPuwbttVF0SeW58H176Li4LmHsAPFq6q7EFtYwrbgqNRI6/xghtSzm0uSnQeP4wy9WdliCGtbbt5
	JYRlF47buaEZPO4sxePF4g4hLZ7oposxkUHMmBXw37RNCMyKW07Iqiac/iF1jOpCzLhkKaq6Kv2C5
	N9E+n7eY28knb+5AUA56Bc9iOpu4nsyr7J5IJ4TFBy2aa8Ml7Ra6iYiBNEj2z5+OOf3pZEs9Rgy7U
	dj4VgO8JOwNyG+y/ze+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMPfY-00000008KJt-0U72;
	Fri, 21 Nov 2025 11:51:16 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMPfT-00000008KJO-40VB
	for linux-riscv@lists.infradead.org;
	Fri, 21 Nov 2025 11:51:13 +0000
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 13A9F3F942
	for <linux-riscv@lists.infradead.org>; Fri, 21 Nov 2025 11:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1763725867;
	bh=WGDPbHQuHpY9+gw1iYDyOy2Eg2j2SkEl13GO1wQEzZ8=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=dyJi1ZW2jmxIUb1I027niJwsOGB3eQ762Vzq2EVeajlVetFg+9jIOD2mnc+48W7Wy
	 4AOzyD/Tn7Z9/nfD0DXNQBvkyFa7OOVInLZM4FircP5vFrvcDCSNDGIhjpSxUNkeDK
	 NFswL+sTbNFMQjj+9jfD1JQEpiSuuh/RWMugJu5JW1MgIUFQLLme8g9RR++FdjFMMo
	 knOEwtKKhTGYBk809hJgQ36Brz9M6NQ3cyNnHYCe80XZtaqC/IzwcfJAP/nY+LrFeW
	 HimOitzKP2wC+5n/FU1K/7Hfm+8I2k+Xa56cjkQE6Fdek18w2l1ede0BVtbT8jzZMT
	 g36Ko2mqbtq8pGQZXHZze1Aju8LEgKVJOBbn2ZwTux/3ac/IUEpa3ThzxUmtg1haWB
	 bAU3hCppY+nuYy7NVrLqDLIQWC9tUIRgh/OCevb7csaEx1An2YVbMissOnecceeA4y
	 20FC1XgWBRkt6HSHcvtpMs5cto4kfy9Ok3iNGyyQGAf/4ODsGWG116JJvTtcIAf4zY
	 /5iOsyGAlYm2N/itcaJzvGo1r63kZFPHEdWQJvoBtRyPVA1qmJ8rGrKPIKiFx2Jgs9
	 Kv9IbCZJNXe44zMGqznLc5iats21n4+QipE+vpJwXsIfVBScanBb+rDnuYBfAxvXdm
	 Nf0yhJ4MmTv1Wuy3XxvuyXzA=
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-b72e06680d4so288895966b.2
        for <linux-riscv@lists.infradead.org>; Fri, 21 Nov 2025 03:51:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763725866; x=1764330666;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WGDPbHQuHpY9+gw1iYDyOy2Eg2j2SkEl13GO1wQEzZ8=;
        b=gvgEGmLFne3RGGKDa4ZdH0xyJziBWHyDB8nK4H57dVE9X898plX92c7JNNMS1kDNHX
         G3DhiSc+76/nEpnASW6qx1YRIb5oZLdCDV5ftQLnvBHn5MM9zSDo9lq14gq2q2Zi0++8
         SjY+d89r9X/AjRfi5HzLo+NfLGAD/+A0Q4itnBNBU4ZquZRFcaoCqjhkEbS9uhpoj7Mk
         ZCjeqQULvoAvyKZuO42tGWzZCPq4GCX0pzlfvgFBDbrMJcGw6tHAmFg8dGsFmgKxScN4
         JzJLqfekPtCrcQa0aKbNVJt6Wc2fZA/srztxmVYwwe7PuBrcJgIXOkMOTCbYlWB73j0P
         dCEQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+UbPgh+TYnb55iiXrxiIbeXIZMDk6WjJFboNMjyEZ19t8dnR4sC2RhYRVJy5iO07ZYuXn9eHIwTEDjg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxHmlHoIf/F20dasxdmsioQ/iB+arNaBUUIitlAUnFHKk99sXMR
	ZuLX1UtgB8wm/6Mh8JD55QgY+op6/B9D5PVh+hQ0efm6WBU/yoHLr/gnqCoJs7TzB+hwh571S0m
	/K8oUKfsSHHdqDwP0x3wAmjQ8VZejz/zswUPIYtBWB9u/eqMD1yvBOjlMeqTwWtQvfgxvn287fB
	lXuIteEn3P7bd18uTdYJTRGQ9XtPrFMjzvNiCopd2TNfufYS3Ulm605poVEI0z
X-Gm-Gg: ASbGncsnNAkhumCP2k5b+5wk4kS7+sRJi9VcqtH3nIHW9z+0iSWnqq4Lnnk1Px58XSi
	1EsMGnZqjfdrAdgdmn+TSOyCi9lLFIYzALbSYE0FMRZruzYy8UYH5F9gcI7HT8HbI1a4Gvvogsh
	wGSGFviBEuIMzpW9cqaE8ZnHdwdZWmE2qxZKsCBYMfKqWlEofqQixNY1gfvXze6+I2
X-Received: by 2002:a17:907:3f9b:b0:b73:4006:1884 with SMTP id a640c23a62f3a-b76716d9fb2mr178971166b.37.1763725866309;
        Fri, 21 Nov 2025 03:51:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFbBNgyoucqTathPWkzu4EoA5RlPQZMx2IIcYS98GKu59Kbn0elIr7tVeULwuVlppymA6TBZmJxCGp0MFNTb/M=
X-Received: by 2002:a17:907:3f9b:b0:b73:4006:1884 with SMTP id
 a640c23a62f3a-b76716d9fb2mr178968566b.37.1763725865852; Fri, 21 Nov 2025
 03:51:05 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 21 Nov 2025 05:51:05 -0600
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 21 Nov 2025 05:51:05 -0600
MIME-Version: 1.0
In-Reply-To: <20251120082946.109378-4-hal.feng@starfivetech.com>
References: <20251120082946.109378-1-hal.feng@starfivetech.com> <20251120082946.109378-4-hal.feng@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
User-Agent: alot/0.0.0
Date: Fri, 21 Nov 2025 05:51:05 -0600
X-Gm-Features: AWmQ_bkaNRVs_IsWSLR3s4HRukSz_ikG2dyq34vaL1DCvYawBgn4_Mm40cBb9R8
Message-ID: <CAJM55Z8NsC_-jcrm+ndMonU6EtkSzhAQvoROXZwOWNi9FeQLXA@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] riscv: dts: starfive: Add common board dtsi for
 VisionFive 2 Lite variants
To: Albert Ou <aou@eecs.berkeley.edu>, Bjorn Helgaas <bhelgaas@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, E Shattow <e@freeshell.de>, 
	Hal Feng <hal.feng@starfivetech.com>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_035112_254937_62CFC5A8 
X-CRM114-Status: GOOD (  11.88  )
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

Quoting Hal Feng (2025-11-20 09:29:44)
> Add common board dtsi for use by VisionFive 2 Lite variants.
>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../jh7110s-starfive-visionfive-2-lite.dtsi   | 691 ++++++++++++++++++
>  1 file changed, 691 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110s-starfive-visionfive-2-lite.dtsi
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110s-starfive-visionfive-2-lite.dtsi b/arch/riscv/boot/dts/starfive/jh7110s-starfive-visionfive-2-lite.dtsi
> new file mode 100644
> index 000000000000..aa375c4a3fa3
> --- /dev/null
> +++ b/arch/riscv/boot/dts/starfive/jh7110s-starfive-visionfive-2-lite.dtsi
> @@ -0,0 +1,691 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (C) 2025 StarFive Technology Co., Ltd.
> + * Copyright (C) 2025 Hal Feng <hal.feng@starfivetech.com>
> + */
> +
> +/dts-v1/;
> +#include "jh7110.dtsi"
> +#include "jh7110-pinfunc.h"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/pinctrl/starfive,jh7110-pinctrl.h>
''
I'm confused. In [1] you said "remove jh7110s-common.dtsi, because only one
board uses JH7110S now." but this series still adds two different boards.

Also this derives from jh7110.dtsi rather than from jh7110-common.dts as I
suggested in [2].

In any case I'm fine with doing it this way, so
Acked-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

[1]: https://lore.kernel.org/linux-riscv/ZQ2PR01MB13076544E2136E7E7C2EEDA1E6CD2@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn/
[2]: https://lore.kernel.org/linux-riscv/CAJM55Z-MfpVX3EuQ_AjvDSk6FwR51R5cQdN5RybS9pbJ8r9NNg@mail.gmail.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
