Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41BCAC2BA18
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2024 16:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mxA+AjvYdps6vhMUNHefdHxP4laX4mxp2wMQZlEDxB8=; b=Xnjawl6WKyaU/I
	SGqa36lMBcWW81BAVmxKyAEs2njJSWE+UB3hzuQKM/gvmfAXDaErArZIg9CCDqjvcDfhaPxw+LQEu
	xyanfRUX2CXA+cPjH9H7iiHLzhOmI6BrQew1wfM7Rk4YZKB0eIwrNiDD81C3Mdmov3rjrKzYNv9yV
	Zi4W0IObVLIEAONFx6w4tPU+070R0HGzd2fldpxNqi5JPp202/bSeXeb5S4P0KPOAjhnvDXIOZ4AH
	aMxCkRp8stAm91fcRCh9jHj+F6vlmP1nxoQ0ykTUH04chmSUqkQ/iBr5sxdL50AlwQcjQrC8rIMl0
	TtthwlPD/J2rNH2Sl7Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJEoA-0000000BdS7-0EuM;
	Mon, 17 Jun 2024 16:02:14 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJEo7-0000000BdRD-0cpY
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jun 2024 16:02:12 +0000
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-7eb01106015so201703239f.1
        for <linux-riscv@lists.infradead.org>; Mon, 17 Jun 2024 09:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1718640130; x=1719244930; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uqgkhvJDnWklw/NEi6lAiqs+H2Sv/nOzZyxuIfPIpJo=;
        b=WTa9pxWceH7+PK1hOrxOP3THa+Q+UvKeyvkvmNzJuCajY/N9WD+x4KOdLPspjYk8rv
         PWjeEZjIjX/Cp++H2bJiUkumXJNTMzIje9ZJOaeOA55/3++bJesUKKIzDjTsGIaISs2Y
         ad7SETviDMWPyi0TAjIutSCwerpzwBshF/CqpyOUNuazAAIxEkvqnsYehGjlvV/QRrSE
         7vHuRgl0Mi/3ntJMIoK8Jhv5Ai33KFNaVYznGw1zyK+L7BpF/tQXOvpXL9gkz3XmyWHF
         2cSMbuwwP2C/NbrV3tVp8H1E8GZxrCRJ5FBRyn9lm/TKCOO1vP7mifuLOM13hPPMy3iI
         bnwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718640130; x=1719244930;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uqgkhvJDnWklw/NEi6lAiqs+H2Sv/nOzZyxuIfPIpJo=;
        b=m0nzbLpWlgN1Fzumm1FCoInXb7hyUSqilS4lssomrIUwWEghdmIh0GjaOAT1RWvXAn
         mbfk+JnK6zQHYFeu/DU4U6i7EfL73HV3cE/B8Sv+UV2RQybNJC+dSrX21hRyepL4dcMK
         wmn3Yo69NDtv9Z/1tLHArce90uYFsiVMYmPZMKxM+WgNm90XWPcXChxyefsEZQZUGLii
         GSw0VoZa1aWmgzdBMNM6Yu/gp8o7Vntj4Met/mju43POVZpChRhtAbRqo0k/m/Zb6p2l
         a3ZpBRoG6UnmPHZ2Dn4LonGdPP7VP1s1kkp6mh00K4LlZrCTf7z0WnOCyvGGznJ5sncF
         9OFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWY4h5sUMrdyNofuubYIVoUXsaBivrZ/EoI0cO3L9zyfUrsVWPTRNpEJ104eAkw/GGVjXebA8csCE9ts6NljidOOTs3OD3ML+IK9yEKOncN
X-Gm-Message-State: AOJu0Yw4Zau57+SPwKxutn4XGkKg5M4I7+zj+f17sj/9dosNMaSOau2H
	HtrFxp1qro7yDlS5qCcA21c8ysK+p3zU1t7keJu1xtHyl8nPjD+geE1aFpZk72M=
X-Google-Smtp-Source: AGHT+IGKbQLdD/JERZVBeB2s/YJiMwN6RbVW3XS9jI0ypwFKcJ3JZH9gjestGTkJCAXWkeSpQzy60w==
X-Received: by 2002:a05:6602:6c07:b0:7eb:7ebd:1fa4 with SMTP id ca18e2360f4ac-7ebeb4921e2mr1182859539f.1.1718640100005;
        Mon, 17 Jun 2024 09:01:40 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4b9569ef011sm2720523173.103.2024.06.17.09.01.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 09:01:39 -0700 (PDT)
Message-ID: <b5c4c938-2278-4bba-a0e8-2f5838941302@sifive.com>
Date: Mon, 17 Jun 2024 11:01:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] riscv: dts: sophgo: Add initial SG2002 SoC device
 tree
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>,
 Chao Wei <chao.wei@sophgo.com>
References: <20240612-sg2002-v2-0-19a585af6846@bootlin.com>
 <20240612-sg2002-v2-5-19a585af6846@bootlin.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20240612-sg2002-v2-5-19a585af6846@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_090211_222101_166E3E80 
X-CRM114-Status: GOOD (  14.45  )
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

Hi Thomas,

On 2024-06-12 3:02 AM, Thomas Bonnefille wrote:
> Add initial device tree for the SG2002 RISC-V SoC by SOPHGO.
> 
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> ---
>  arch/riscv/boot/dts/sophgo/sg2002.dtsi | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/sg2002.dtsi b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
> new file mode 100644
> index 000000000000..0fc80da7c139
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
> @@ -0,0 +1,34 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2024 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> + */
> +
> +/dts-v1/;

While it doesn't hurt, you don't need this directive in both the .dtsi and each
.dts file. It looks like it usually goes in the board .dts file only.

Regards,
Samuel

> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include "cv18xx.dtsi"
> +
> +/ {
> +	compatible = "sophgo,sg2002";
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x80000000 0x10000000>;
> +	};
> +};
> +
> +&plic {
> +	compatible = "sophgo,sg2002-plic", "thead,c900-plic";
> +};
> +
> +&clint {
> +	compatible = "sophgo,sg2002-clint", "thead,c900-clint";
> +};
> +
> +&clk {
> +	compatible = "sophgo,sg2000-clk";
> +};
> +
> +&sdhci0 {
> +	compatible = "sophgo,sg2002-dwcmshc";
> +};
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
