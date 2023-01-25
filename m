Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 463EDC27C76
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 20:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F20P6rQcDGkHADaPGpo2XHZ3iydetaQFgTi0VgvHqXo=; b=XU0RBh0dEkRNvz
	VJyKD2mXIGeH5iXiLnw27jTuuK7vbTLYPnGP7aOsiEOb65bRNNtwjmbQnfeOitaUIDSXakjtW08sC
	yD3emhgDIo9c6oWJULZsHPUc6BZLBOtnNLMo6qIHeimCB7WYQMpwUzLoUmTC/LmVQ4vZLUdzCW4Jh
	3evViKMtIlEhgP1u/q7gAEdRPms6noK3gOXsZRlM4UCPuPySCMsuCNvuGMys5P++2nsYz6jZEyQA+
	Bc4afwoFmfqHC5r4Hm4ry4EALABYsIspP94R+iJfGqIuh+eMwBQDGZ6HImoTf1DDf03A64dXPEQzy
	nLRBlZqIKzkTWItbffkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKm6i-008bAB-E0; Wed, 25 Jan 2023 20:10:56 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKm25-008Z1H-6l; Wed, 25 Jan 2023 20:06:10 +0000
Received: by mail-ot1-f49.google.com with SMTP id f5-20020a9d5f05000000b00684c0c2eb3fso11771330oti.10;
        Wed, 25 Jan 2023 12:06:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8zQJwCHfiFi6VH+BLN1bNPbxexl2oTTiePtVA10gjBQ=;
        b=eVMAtSjGAYCKdX34T+ZPZPElH9Ud08UvA+pbcq4b1ykdIgdx8AtnfFZ6URMGLH0JB0
         w/oW5zfbBsbrmAuaghq9Sr/osHxDg9RZh2uC16nnBQmA/mvjEbBF92tMfn1/gkw1cC+a
         f3/hC7h9r8nZ6jEPZLNxGlTKW53nmJXTByTCmtrqct6vZQYl9yS5clWRRw9Lk+f0pGjk
         n+oE6NbWpA38BjcUEJSMKHvTZqY3NsAL5Yu/0wQZ+QxQXN2fua39G8QJewBhp2yutm8U
         CLuZqX0h/Y9PAidh/qVGLNEDlMvvlW3TISKgw4KgC7jI6Xtwo6Kl+upqpM5XHEjbh8oi
         vxKQ==
X-Gm-Message-State: AFqh2koIhlyfoROvuS1UM9ZsVnqZMg3GLjIAc+WNJDHW4+giIHqaehKE
	XhAvNQ1TTs0IRJPMSUREBQ==
X-Google-Smtp-Source: AMrXdXs6SM7I1OOUhLLfrwCPfKfHkcE6ouDZkfhmfkKp+JRlJHR3k7KwOPhsLyrO6hSP5EAouQVPpw==
X-Received: by 2002:a05:6830:1652:b0:686:4382:13aa with SMTP id h18-20020a056830165200b00686438213aamr17366869otr.32.1674677166280;
        Wed, 25 Jan 2023 12:06:06 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id g16-20020a9d6490000000b00684e09b43bdsm2567325otl.13.2023.01.25.12.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 12:06:05 -0800 (PST)
Received: (nullmailer pid 2769611 invoked by uid 1000);
	Wed, 25 Jan 2023 20:06:04 -0000
Date: Wed, 25 Jan 2023 14:06:04 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-stm32@st-md-mailman.stormreply.com, - <devicetree@vger.kernel.org>, 
	Peter Korsgaard <jacmet@sunsite.dk>, Le Ray <erwan.leray@foss.st.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Fugang Duan <fugang.duan@nxp.com>, 
	Pragnesh Patel <pragnesh.patel@sifive.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	linux-arm-kernel@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>, 
	Kevin Hilman <khilman@baylibre.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michal Simek <michal.simek@xilinx.com>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-riscv@lists.infradead.org, 
	Lubomir Rintel <lkundrak@v3.sk>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Vignesh Raghavendra <vigneshr@ti.com>, NXP Linux Team <linux-imx@nxp.com>, linux-amlogic@lists.infradead.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Tomer Maimon <tmaimon77@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chester Lin <clin@suse.com>, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2 01/12] dt-bindings: serial: amlogic,meson-uart: allow
 other serial properties
Message-ID: <167467716404.2769558.11154438108014258073.robh@kernel.org>
References: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
 <20230124091602.44027-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230124091602.44027-2-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_120609_287452_6475C2F6 
X-CRM114-Status: GOOD (  13.17  )
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


On Tue, 24 Jan 2023 10:15:51 +0100, Krzysztof Kozlowski wrote:
> Reference common serial properties bindings to allow typical serial
> properties:
> 
>   meson-axg-jethome-jethub-j100.dtb: serial@23000: 'bluetooth', 'uart-has-rtscts' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> ---
> 
> Changes since v1:
> 1. Add tag
> 2. Use local path (not absolute to /schemas/serial/serial.yaml)
> ---
>  .../devicetree/bindings/serial/amlogic,meson-uart.yaml       | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
