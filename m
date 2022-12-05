Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C01FC4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 20:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aO0nGssBet2vu0YF9Yw5BASKonyCvFWVsoEAerM7Eus=; b=x9iSzRP5EhybKE
	ERNPQ1GUcbOe2WaFcYcaSmh4JI9G8fd6IcXGF0MrBMDAQeueQGhcBcPpoSn4OLG/+pduwf35nhBTa
	Fn4uirSCqiM8v7RoSw6RGIk+gpofWchF7NQRRrgsvuVwKyhW2TVwEXOmetRVKEijcluk44EyaYbSI
	35NDGhlyJtpWRp8m80a60UQSpWzHhFUm7rWKC/CWcfNOmArhe+0Cy1Db5HyT/+U1ZFKduHb0MHSHT
	29MWyr6tjvn+2B5hfKjyLiHEIqVzWyx4EdFA0986FBTlrRpXYZMPmQJCjHtbq36k8lMjfHbiy6cwK
	byfcptR8a0O26LnVgM4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2IIT-00APul-Q2; Mon, 05 Dec 2022 20:42:41 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2IIR-00APtr-0R; Mon, 05 Dec 2022 20:42:40 +0000
Received: by mail-ej1-x630.google.com with SMTP id vv4so1417291ejc.2;
        Mon, 05 Dec 2022 12:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQzZj9QPO3FSSI2ENjgSMav7mWgYHgG+8g+KxcQQR6s=;
        b=Kgi5D4VGK5CLzDIpcF8arVuXaZx6m2bSHtg2ufyOSUffvRFom3atILD/HLSjye2ChW
         RRtjjir4IPzIKl09teqO9eDKbyp7c1ulRkg4ec8C4bouebg5szGnBHP5uX1rNvl5sc3o
         P9jLXXXs61s9pOKnK9LmYul4OsWakZ9HakZhXyu3Igv724ragHtcaSksnrTF52c3ScMT
         hpoMoFsi8fweKgP8/sVsygYQaniwJ+m/3pymG8qdpE4gSm5SmSJ8/XW/PtfxXtopM6L0
         mc+mSRaNycRTKsYXbCFBh373jAh7IjBB/Uwphv0ZCtI0vDmsN+oJxHyyp8sIkd6FEjOZ
         YxHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQzZj9QPO3FSSI2ENjgSMav7mWgYHgG+8g+KxcQQR6s=;
        b=DuXBd70VFPMmFoTVOON0M1QA9uZqWc0gQjO2eR1AqBoTbYWdyQkBZvcZE35X9BRd4g
         ZT4n08dz1hPZqY60YYLcE3Ebpk7itFfSidR8zn6iLKFfgIfqnd0DOCTjbSyW2KHNuBD2
         ynYArSOxlIDqUcxBOh+iZQSCVISx7S4IQIUnYb9zkrk4nK/cunCwnhUp1UB0Xi1QTa2i
         hX9OL8dxVTz3j4z8u8roEkFz1O3k108CmuGYiVf1t/w7vQx7dfF+ixfrbgcfSMecbWrC
         KgvA/VOxPaAzar9T1/FTol4Dw/MOcz8bZU2cKusO/H8QKcrfbV+PnWPt9DKUxi+dwM/i
         CnIw==
X-Gm-Message-State: ANoB5pmgxJtp5lm4/N1slZslEDqIX/c7j0rKPCUm+FQ7O/HdpygvQhXB
	MRxu1ITRUClv3ZVJYc4Y4evnOkdCloJ/Og==
X-Google-Smtp-Source: AA0mqf7R9dwO4bUeGZdSzi/mvPeNrR1HVKTQ1Ep2WHqQyvWYkZdx02/I6EE5f/uTULiBGF4Tb1rcXw==
X-Received: by 2002:a17:906:43d0:b0:78d:a01b:b474 with SMTP id j16-20020a17090643d000b0078da01bb474mr57943718ejn.8.1670272957878;
        Mon, 05 Dec 2022 12:42:37 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id 5-20020a170906310500b0073d81b0882asm6539342ejx.7.2022.12.05.12.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 12:42:37 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Jisheng Zhang <jszhang@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, Samuel Holland <samuel@sholland.org>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, Christian Hewitt <christianshewitt@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Linus Walleij <linus.walleij@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Stanislav Jakubek <stano.jakubek@gmail.com>
Subject: Re: [PATCH v2 08/12] riscv: dts: allwinner: Add MangoPi MQ Pro devicetree
Date: Mon, 05 Dec 2022 21:42:36 +0100
Message-ID: <3135032.5fSG56mABF@kista>
In-Reply-To: <20221125234656.47306-9-samuel@sholland.org>
References: <20221125234656.47306-1-samuel@sholland.org> <20221125234656.47306-9-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_124239_083048_A5417B53 
X-CRM114-Status: UNSURE (   9.04  )
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

Dne sobota, 26. november 2022 ob 00:46:52 CET je Samuel Holland napisal(a):
> The MangoPi MQ Pro is a tiny SBC with a layout compatible to the
> Raspberry Pi Zero. It includes the Allwinner D1 SoC, 512M or 1G of DDR3,
> and an RTL8723DS-based WiFi/Bluetooth module.
> 
> The board also exposes GPIO Port E via a connector on the end of the
> board, which can support either a camera or an RMII Ethernet PHY. The
> additional regulators supply that connector.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
