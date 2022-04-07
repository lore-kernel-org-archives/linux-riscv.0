Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0A5C433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Apr 2022 19:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NdhB7dWEDSs/1k8IfdqFacCdXPySRN7jnK/6xA6Dkco=; b=x4zQm5/xpPqnBN
	7VSLdHO2m482/yPUdYNViGeZl9bUAfK5m6BFCJYz1dKHa2Xat08izNbfBZ3fams2kh6+0bLMPuORz
	jbQgltwyWnEc1VEgnOdRAofsYLaxZWCzCyMoaEt7wh9+X0FEghENFTDqTf0zyV0yS417vI3gcrOEQ
	hWpGpLa41X6X/7xvkUNa/fGkg1jArwLvGx+S0HEJ8V15pXZXWKZzZBYvePHp7CT9Ih4YRTzk8oAig
	cz2HhbH3mdt3lU2DbzzMymaMHGIDUZg45ru8VaKPSCmj/Dy2Oi+noODrP8OucjgtD3uwJsM87hlzk
	e8f9YVGFEVeSY6aU9yJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncXqh-00DizI-G9; Thu, 07 Apr 2022 19:31:19 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncXqL-00Dis3-25
 for linux-riscv@lists.infradead.org; Thu, 07 Apr 2022 19:30:58 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a6so13071063ejk.0
 for <linux-riscv@lists.infradead.org>; Thu, 07 Apr 2022 12:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wB+5pL8Q6kh3phLfe/wl9bW/HyBhBBXGQDI+exqcUH4=;
 b=miUZU1+cai59rQSB0SoyRhIMCeXiMlIU/t3EofOJnChIBd78OGzRYQdlKTCLNATIPV
 BxNu8+ofPHsaqE48mXvnk+6jPCT6LIYSfMexoS8BcckKt2esUOLxGsSJa0lOkWumSBuU
 Y7WLWhGPIt2kyu6X7cqy/0jur7e7zZd6subdoM/RqNf/mnwbVjayRl/HvrzM2tbsKJzD
 FRxKJkAegctXz36lhFsXOMUaAtGvnDyim+6MkHsxp4vokyRKBLIbA5keQBk6Dnr1MDBb
 ti9px+SNuyPjzKmOkNa03CY+DlIx68rfwoBeRwe3j+7IF9gDBT6FIU+nKWJFxrXlM/Bb
 lq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wB+5pL8Q6kh3phLfe/wl9bW/HyBhBBXGQDI+exqcUH4=;
 b=guDCg/2oPL6q0mY8MZZtvFdSatBebn+yYuc0SRInAkSBmMLMJYxybxq/jC2T2oXTui
 ypSa5aH3IR589hbyCmHmyZoSaeHKoq2w/ZiuKtb5pHXz8Er8hU6b/sPtwmeBWGPZPvWj
 PwsujZjKiZSq6HZ+ruPekEjMQcr5/Ow5fzo4kMhGF1xPk7CeHpPytzZXJwpfGRGhiBXZ
 MPCiOOeBA5oM3VcNA+tZcCzLtHMuEbz/BVkfF/S5IGa/701416hNtAaw1NCHw3lerHOV
 fiGRHNZBtm2tXwFDziHyzWbrRboU9FNGewtomcdx14mN2GoqIbfPUrFx1JjUegClCWco
 8hfA==
X-Gm-Message-State: AOAM5300KaF2u1myBYHZC1bp/9LSRNHEFSxvd6IBiZM9yjMk2eC/rP1+
 Oeev4L7wiREdrFYiKLXOYdUB4Q==
X-Google-Smtp-Source: ABdhPJxRfXfrSIWn4/qr0nRuf4o2TE2+XC893QWxjZy3p6w3KQnOv0eLC+hpBVra32fzFfvUvTYUtQ==
X-Received: by 2002:a17:907:9711:b0:6e8:4a3e:692c with SMTP id
 jg17-20020a170907971100b006e84a3e692cmr261934ejc.296.1649359853838; 
 Thu, 07 Apr 2022 12:30:53 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 ds5-20020a170907724500b006df8f39dadesm7964617ejc.218.2022.04.07.12.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 12:30:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Paul Cercueil <paul@crapouillou.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Dinh Nguyen <dinguyen@kernel.org>,
 John Crispin <john@phrozen.org>, Tero Kristo <kristo@kernel.org>,
 Daniel Palmer <daniel@thingy.jp>, linux-riscv@lists.infradead.org,
 Marc Zyngier <maz@kernel.org>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 linux-actions@lists.infradead.org, Jason Cooper <jason@lakedaemon.net>,
 Krzysztof Halasa <khalasa@piap.pl>, Lokesh Vutla <lokeshvutla@ti.com>,
 Paul Burton <paulburton@kernel.org>, Imre Kaloz <kaloz@openwrt.org>,
 Sagar Kadam <sagar.kadam@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Bert Vermeulen <bert@biot.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Nishanth Menon <nm@ti.com>, linux-oxnas@groups.io,
 Linus Walleij <linusw@kernel.org>,
 Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Michael Walle <michael@walle.cc>,
 Manivannan Sadhasivam <mani@kernel.org>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Suman Anna <s-anna@ti.com>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Joakim Zhang <qiangqing.zhang@nxp.com>, openbmc@lists.ozlabs.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Lucas Stach <l.stach@pengutronix.de>,
 Birger Koblitz <mail@birger-koblitz.de>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 03/18] ARM: dts: socfpga: align interrupt
 controller node name with dtschema
Date: Thu,  7 Apr 2022 21:30:41 +0200
Message-Id: <164935983571.16396.7116611701613809087.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317115705.450427-2-krzysztof.kozlowski@canonical.com>
References: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
 <20220317115705.450427-2-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_123057_153433_C66A56A7 
X-CRM114-Status: UNSURE (   7.74  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 17 Mar 2022 12:56:50 +0100, Krzysztof Kozlowski wrote:
> Fixes dtbs_check warnings like:
> 
>   $nodename:0: 'intc@fffed000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
> 
> 

Applied, thanks!

[03/18] ARM: dts: socfpga: align interrupt controller node name with dtschema
        commit: c9bdd50d2019f78bf4c1f6a79254c27771901023

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
