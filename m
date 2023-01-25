Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29CFBC27C76
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 20:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aOykQkJiDeSoc5n6yjhVQdh9PtwLSjHN6J3qY2Mj+1A=; b=08/rNFBUrhs1ri
	86KPcUbUk9NpGa6ODw1TpUcxAAKZtvYYKQByNJ5lcDWfts1he7M6q2AJFnG+Tex8MSWxKY3Kcngyh
	J1gzaS0KHbt2MEbj++pK4OsYqLs9Boy6kOccURmbp+TuiVGilhJmZMWlQAB6HVZ4iJT8rKX09ScAV
	Ry8RWqkRXL2zWbpP7GdAvoCjL2jOLrMbPpPqX+HbbtSEkJBFFfHozfKsGn697SF7mqqr0TKEnB/1J
	OuzNx6awwYPj49iwZcal1VpDf5+5mEn9Y2ceAK4p9+cBR/BkmL+9oX8iwN9iXk4Q33Dyih33qJWXb
	wcuEwgYHdJA5219YaZow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKmBb-008dMa-1k; Wed, 25 Jan 2023 20:15:59 +0000
Received: from mail-oa1-f43.google.com ([209.85.160.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKm3P-008ZcG-77; Wed, 25 Jan 2023 20:07:32 +0000
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1633e6f83d4so16196fac.0;
        Wed, 25 Jan 2023 12:07:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XkAXkDhEfbbO8vL4jcgXHdApyqSqXlGnBUofEqsLMzQ=;
        b=wr7sB/F0J5aTXPUGQIdUJ2NICH7sOGukiDnbowXFBnSybnWSlfR4Ro5BMvrOmd31iR
         zaVw3DMaD2PrVfCqVtXIpQd3aTbALk7SXBNARyLeF71b6eRqRFNYDmZZjnDV14uNK0NU
         THobhWlNP9eQkv7Xf/Fihmc69SxzKDcLAccQTgueqRblBPMJ9fRQnPiMrNKBfTudmyTo
         j0nXW/+yIBOIbeClE8efrh8YvAdATPCT9yr2QUZxnw58VI7O8OwS1veqkUgJEJ3SLxGt
         x91ve+E7uFa4Z1TgfBuMbZrs85oGt58W3DddJrmnLcr8b392fZMa08anclamuSI0oPS0
         lR/Q==
X-Gm-Message-State: AFqh2krCLGutsuOFZ0YgHo6dF2UwArTv1t+hQ9AriNbCpO2STFtNtWOV
	/fqqQqn+CyG2HJmSHln8pQ==
X-Google-Smtp-Source: AMrXdXteyM0OPwTs5gB6Am2eJ/aHWrEwxvp1bRY11quUm5b1g3LulC49my3RB8kmiOVdtzemE+Uh7g==
X-Received: by 2002:a05:6870:bace:b0:154:bfcd:e86e with SMTP id js14-20020a056870bace00b00154bfcde86emr16295491oab.2.1674677248733;
        Wed, 25 Jan 2023 12:07:28 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id fw9-20020a056870080900b00143ae7d4ccesm1886575oab.45.2023.01.25.12.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 12:07:28 -0800 (PST)
Received: (nullmailer pid 2778134 invoked by uid 1000);
	Wed, 25 Jan 2023 20:07:27 -0000
Date: Wed, 25 Jan 2023 14:07:27 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Michal Simek <michal.simek@xilinx.com>, devicetree@vger.kernel.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Fugang Duan <fugang.duan@nxp.com>, 
	Pragnesh Patel <pragnesh.patel@sifive.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, 
	Chester Lin <clin@suse.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kevin Hilman <khilman@baylibre.com>, 
	Le Ray <erwan.leray@foss.st.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Peter Korsgaard <jacmet@sunsite.dk>, linux-kernel@vger.kernel.org, 
	Michal Simek <michal.simek@amd.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, Lubomir Rintel <lkundrak@v3.sk>, 
	linux-riscv@lists.infradead.org, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-amlogic@lists.infradead.org, 
	linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 05/12] dt-bindings: serial: cdsn,uart: add
 power-domains
Message-ID: <167467724645.2777996.13882955684476906730.robh@kernel.org>
References: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
 <20230124091916.45054-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230124091916.45054-3-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_120731_304258_684CDFC4 
X-CRM114-Status: GOOD (  10.18  )
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


On Tue, 24 Jan 2023 10:19:09 +0100, Krzysztof Kozlowski wrote:
> Few Xilinx DTS have power domains in serial node:
> 
>   zynqmp-zc1232-revA.dtb: serial@ff000000: Unevaluated properties are not allowed ('power-domains' was unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Michal Simek <michal.simek@amd.com>
> ---
>  .../devicetree/bindings/serial/cdns,uart.yaml   | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
