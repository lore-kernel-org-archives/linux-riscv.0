Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A42AFC433FE
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Nov 2022 15:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jz1AGizSon0pS+qDKdeu1+AHKitOZpFNHMpEuGgd3MI=; b=FTeHPyMQo6oxFI
	o45fuGUqEGN0dPxTczUVVuJMx1kplEoJ8vZ3CIgv/T6MN3L1R0B7+aYWqlNDIsm9sqoYp5Yu4LyFf
	8K3NdPTiVeu3WfJenLJ9Z/+AzT5sXEfdsD58GBdkABd+PNeK0oSlwCuxu1y2v2OnoeR9Gvr0deZZ2
	1JtjrCq5xfbo22KYRwezBWybQzWaMO7EsyIUe8PJmZ9xRMfZ5phjUFgQw4shhuvYif4Zke2g6NGOA
	qvuaxXvfDCFGvTPvb1svzDiJT7wE/g+Oi/WzIIl0uYAi7poHQzGDsGgmfTG96um3vH79+l8YYGMfl
	o6ooTUL5qOn2YMj2Zr9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owluE-0058Jm-DH; Sun, 20 Nov 2022 15:06:50 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owluB-0058IL-Cb
	for linux-riscv@lists.infradead.org; Sun, 20 Nov 2022 15:06:49 +0000
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com [209.85.219.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 98FDB3F336
	for <linux-riscv@lists.infradead.org>; Sun, 20 Nov 2022 15:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1668956803;
	bh=63zAF8njkANWb8igjiBaT0d8rq+Da/5C67QfqYnl2t8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=hToLUdSsFlR5TRWbqcJqg8tcqoi5MeZDQ7hNgyip+ejupzQGvaDCQAjFynA6dJc4i
	 VeBAzucPe6/iCyLK89xFMV2s9G1RReHs5cXWWVQTgLNpsi1SzUIwNlyUlt2Ot1FClQ
	 7ecACEU0NSzjSEidIgJ0IaYJ2YLMZz/Wz9TouGAdJpwWm8hAXzbghSOt8NvzQ6RPYS
	 qVvKSzKSzD9uju5QCvUgVgsAb/S+TK5R/p5buh54u/YMpxdFzYpt+4i467c6cN5clZ
	 shBXZBrg2Qd6HuDADXJKMykHIcl7ulATdgZCSDqQjdW/6zWOD3nWTKjhQskYr0rRVK
	 Fi8+IxRaG0VbQ==
Received: by mail-yb1-f197.google.com with SMTP id f8-20020a25bd88000000b006dda2c86272so8967402ybh.5
        for <linux-riscv@lists.infradead.org>; Sun, 20 Nov 2022 07:06:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=63zAF8njkANWb8igjiBaT0d8rq+Da/5C67QfqYnl2t8=;
        b=eJcitDuCAtNr/Pt7GeeJvCttozeaAcnz4UppamFe5WtHe7NL3a+JStQKmpzWEqviHB
         /YLXwSOERUhAOcXWwnNGvcqoOJGlXdRi+28WZxNtD7OZdTAr3jI6nge8A72puXKhqn4s
         j/4etGDK31b1MKa6C0730ido4vN2x8fazvip/EnvRw/cMSNdQCnoiTZc/D8tSOKIff/J
         HAx1ZYfqeJYI76Wo1vg9gG4vb23h0l5K4mMY+g2KTSuRFFiZ5HNoW4jgGhEQRUFm/X/S
         DcrONZZkWWK2xUxXMSe8AMiUNmYpYy3utP81b5iH4KeDD3xbeq2SWMob8xzQN/4SVXiz
         pjBQ==
X-Gm-Message-State: ANoB5pkLSuzaNlfLRDc+cdcehmEeqQhHvA/0lBT1ovYjBSlgDrk9uqbL
	KKLa8x3Z36v+jL1yBqAHwLaP1M4lxyVrBKmCETnyKBI3Ts4w8QWJnDCLniQGTMCw33mwzgwRsGa
	lIDov4GzCTGOtpQrQPAfd6Fe1cEUP6RHyjSLTtGqVc6OyAYmDQhmPIyGDOX23RQ==
X-Received: by 2002:a25:510:0:b0:6d2:e45c:71c0 with SMTP id 16-20020a250510000000b006d2e45c71c0mr1159132ybf.153.1668956802566;
        Sun, 20 Nov 2022 07:06:42 -0800 (PST)
X-Google-Smtp-Source: AA0mqf55/6YijqPTdK5T7pQbmZ9YUNCO1Mc29Pp3Y0+lMw1fpsdcrNDEF/GdRZ3UT0Hk4JVi119cTfndkBPYGd+wvxE=
X-Received: by 2002:a25:510:0:b0:6d2:e45c:71c0 with SMTP id
 16-20020a250510000000b006d2e45c71c0mr1159114ybf.153.1668956802357; Sun, 20
 Nov 2022 07:06:42 -0800 (PST)
MIME-Version: 1.0
References: <20221120082114.3030-1-jszhang@kernel.org> <20221120082114.3030-7-jszhang@kernel.org>
In-Reply-To: <20221120082114.3030-7-jszhang@kernel.org>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Sun, 20 Nov 2022 16:06:26 +0100
Message-ID: <CAJM55Z_QA7a_jYYwy59W=ihZqK0ciS+FJ2Gsw_7469CW8wQ7nw@mail.gmail.com>
Subject: Re: [PATCH 6/7] riscv: dts: bouffalolab: add Sipeed M1S dock devicetree
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_070647_607669_EE998033 
X-CRM114-Status: GOOD (  19.56  )
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

On Sun, 20 Nov 2022 at 09:33, Jisheng Zhang <jszhang@kernel.org> wrote:
>
> Sipeed manufactures a M1S system-on-module and dock board, add basic
> support for them.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/boot/dts/bouffalolab/Makefile      |  2 ++
>  .../boot/dts/bouffalolab/bl808-sipeed-m1s.dts | 30 +++++++++++++++++++
>  2 files changed, 32 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/bouffalolab/Makefile
>  create mode 100644 arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dts
>
> diff --git a/arch/riscv/boot/dts/bouffalolab/Makefile b/arch/riscv/boot/dts/bouffalolab/Makefile
> new file mode 100644
> index 000000000000..42e17e1a97bd
> --- /dev/null
> +++ b/arch/riscv/boot/dts/bouffalolab/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_SOC_BOUFFALOLAB) += bl808-sipeed-m1s.dtb
> diff --git a/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dts b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dts
> new file mode 100644
> index 000000000000..64421fb2ad67
> --- /dev/null
> +++ b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dts
> @@ -0,0 +1,30 @@
> +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +/*
> + * Copyright (C) 2022 Jisheng Zhang <jszhang@kernel.org>
> + */
> +
> +/dts-v1/;
> +
> +#include "bl808.dtsi"
> +
> +/ {
> +       model = "Sipeed M1S";

On seeedstudio.com and everywhere else I look I only see this written
as "Sipeed M1s".

And to echo what Icenowy writes, this is better split as a .dtsi for
the Sipeed M1s module that can then be included by a .dts for the
using the module with the dock, which should then have something like

model = "Sipeed M1s Dock";

> +       compatible = "sipeed,m1s", "bouffalolab,bl808";
> +
> +       aliases {
> +               serial0 = &uart0;
> +       };
> +
> +       chosen {
> +               stdout-path = "serial0:2000000n8";
> +       };
> +
> +       memory@50000000 {
> +               device_type = "memory";
> +               reg = <0x50000000 0x04000000>;
> +       };
> +};
> +
> +&uart0 {
> +       status = "okay";
> +};
> ---
> 2.37.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
