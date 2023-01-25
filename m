Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 047EAC54EED
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 20:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sm9aaGNIwaFdrtYHNUjHEJPxO4zo/1686OBP0Sm+FK0=; b=EKWa+7fLpwPIPJ
	ilTLPBZiSQZj/5GQIQoxCL0LfwYPqmTebG1GZ5C+ncB58WLqWV/3o6SHKcgw5mKbWAuFncu1gnpTV
	5lPuW9gix/Ph77XRKCC3rn52dUtA2ZJTmcJSKqVu2zZBCAG1vVwseWpPglldKuCw7WSf2sCR2bD0c
	7mKFF0CRzduI4lFyVjCzmWX0aXdFhFCL5F/tl1e2lCt5kPJWeMcy+OeeAWHDSHanpjReJdlockgh4
	1Y9i78yRq2oL8y0DzSS8Dj2MTojUfrES95JNP7lZcVpIZCi57uz5k8kJakzKwf/dZGXkmyhoA70dh
	5vSVKNYRHQyT18x5jwwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKmE8-008eS3-9I; Wed, 25 Jan 2023 20:18:36 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKm4J-008a1q-00; Wed, 25 Jan 2023 20:08:28 +0000
Received: by mail-ot1-f42.google.com with SMTP id x21-20020a056830245500b006865ccca77aso11786361otr.11;
        Wed, 25 Jan 2023 12:08:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cWgaUXrrfuDciYk4fQKTg/r1Izy/Hz1zVjtkeDOPneI=;
        b=HQZJPzDpEG0PmaIOlunapaAxv+iPRIgwAFqu0SFVi7xCsR6VA8l1e/7bUrigiTbqnL
         aRkwk36GMW1bOmGt+TBAuGzPICyEDMQZD3bUxaLxlo4gTpqCw6FwfBQ9Tk9bm1Xei/Fd
         vY/R0ctkaj5hBiktDMdd9su5/hPfn1cNZ0DeEeftZpfV+1J0Xb7wWBqx2bngr2T4BMWs
         fSMfSj71+ozU7WKHv/oeQl6h/ZKjWBwh7X+g2LKfPnbYmwWUAt3UxhPMlwkuBecg2S8e
         atJSAEhdbVbRFUVrDymLshvPEK9Z2EizKafFrG0hJdpMU0o9A+0VcFYOxiXjmWwTpwac
         0g8A==
X-Gm-Message-State: AFqh2kpNjH7V2+rcBZxAsdIvcUNCtmIJGsES19D4pe7G9pxIF8cb1ipI
	aNvitKKU58KQDLsskT16RA==
X-Google-Smtp-Source: AMrXdXus3Z4ceRGOdNX1UqMgR5Jf06MXM2+F28K1Q1mS/DZ7M+aspNZLq1GQou47O7HCV+kd1rd9xA==
X-Received: by 2002:a05:6830:1d6e:b0:66c:6c78:27f4 with SMTP id l14-20020a0568301d6e00b0066c6c7827f4mr17518733oti.3.1674677304813;
        Wed, 25 Jan 2023 12:08:24 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id j25-20020a056830015900b0068657984c22sm2553323otp.32.2023.01.25.12.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 12:08:24 -0800 (PST)
Received: (nullmailer pid 2788919 invoked by uid 1000);
	Wed, 25 Jan 2023 20:08:23 -0000
Date: Wed, 25 Jan 2023 14:08:23 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Lubomir Rintel <lkundrak@v3.sk>, linux-stm32@st-md-mailman.stormreply.com, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Shawn Guo <shawnguo@kernel.org>, 
	NXP Linux Team <linux-imx@nxp.com>, Michal Simek <michal.simek@xilinx.com>, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Kevin Hilman <khilman@baylibre.com>, 
	linux-amlogic@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, 
	linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>, 
	Le Ray <erwan.leray@foss.st.com>, Fugang Duan <fugang.duan@nxp.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Chester Lin <clin@suse.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org, 
	Magnus Damm <magnus.damm@gmail.com>, linux-serial@vger.kernel.org, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Pragnesh Patel <pragnesh.patel@sifive.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Tomer Maimon <tmaimon77@gmail.com>, Peter Korsgaard <jacmet@sunsite.dk>
Subject: Re: [PATCH v2 08/12] dt-bindings: serial: fsl-lpuart: drop rs485
 properties
Message-ID: <167467730194.2788619.6626868986212724244.robh@kernel.org>
References: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
 <20230124091916.45054-6-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230124091916.45054-6-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_120827_106045_809EADFD 
X-CRM114-Status: GOOD (  10.43  )
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


On Tue, 24 Jan 2023 10:19:12 +0100, Krzysztof Kozlowski wrote:
> The binding references rs485 schema, so there is no need to list its
> properties.  Simplify a bit by removing unneeded entries.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 3 ---
>  1 file changed, 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
