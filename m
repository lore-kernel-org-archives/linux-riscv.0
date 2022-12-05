Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D780C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 20:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t/IwvRNQZ2NtGvP28JiPRSvnzWPZGVDf/kR3IUPXkDc=; b=eG/yE1x3cUwKAk
	i7d3D1CQ793gruaPrBXZ3CGGLsf7qn74oQw70aN6wao6jQMrEqDFrkzjO7h0Ne+ckEN4jwyEsgERN
	uNPi+imMy+8Rx2NXjFRhsOTU9346SN7mTwctgLSyUzz31+QVrZvEHhr8dEEAbsEi52pMepEpElXgV
	ve1QgnrnGDPyInfj5UgAMq5XdIjwbp1wx1LJUO0c16Xn6Oh2pv8qJVQZuhNKs5A/TaAu/asufSees
	bUSqwLOZM5Ta1Mv7nYvInGGrD3hRt+oQovXVt4+vABVFy2sK0yX4arf8RVJJ7ShFGQuuhWQEEdVqG
	LcyIdKFbHsw6/yyLeAYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2IHv-00APnR-O6; Mon, 05 Dec 2022 20:42:07 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2IHt-00APmx-Fm; Mon, 05 Dec 2022 20:42:06 +0000
Received: by mail-ej1-x630.google.com with SMTP id fc4so1306926ejc.12;
        Mon, 05 Dec 2022 12:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWNOm6qDMo1xXbSWez6F0Vr3ScX8LNHNqSo7KMJ1CZg=;
        b=WcyOKlKhgWRKmKCex9KlNc4vfbJR7H9xX1lhfVBHgrnjX9BxyDol24Beb/sw3+wrfl
         mcq+5f+42JfTTsKBIN+3/X7aXUJfdCdsi3t/AOgpNk5McBsN9bAqOMaSo6+UnShYLzof
         XEvPKBEPeYVl2RAHjS/TSCKSPoE6+N7IXSKVeNdWvsaPiIwAcCidfuYmpjgUlmMgq8ua
         JC+0lKYH9TLCiiBBFlEC9vYU5DPQcvVms7Z1Mq+7xZZBhko9icQUHK/XLhjNfS36BGzT
         9NpapC09/jdDbzgE2b3elsxEWUFveTv+GgE/W02C6nxz8cFP4E0zfq6K3FuFHvngzk2F
         ZAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fWNOm6qDMo1xXbSWez6F0Vr3ScX8LNHNqSo7KMJ1CZg=;
        b=CPUo94EuA5V3MPMfI4hIu6RnPomsjeSEdzW3S4ufnJGUQTF1/szKUdikhzn05wvAhe
         sg+2zDOpN9aDSPGdFFQ+gngieL1EuIl9ZQ7YAAeOTR6RDQGjni6rOo1dnXEJkf7TwOOd
         +K952qS1BE2p8N1R/gv95UpREE69gQFH+7qHp546Eur1S7uFfohVvXb44z7pfZS3CxNS
         bAjqx3ueybmIsVi79rFTN04Xp2DAjJ/Ud1qrPQT/JIzcFQxQ/N9+HQq7uTMBCPtS/Ktw
         pzkXrM65Nr22z7QZLqIGUlIlFn/MJTH+98obaxlXtWprFhS5kTo1fa1YAW3SsupL+8Gz
         zx1w==
X-Gm-Message-State: ANoB5pnR+ppiD9+c0IbGALXhSrwUgUiZmMg6uRSGZT4QU45wdIHQ1RHU
	ztnS9doAJQUDJVTW94+RB4w=
X-Google-Smtp-Source: AA0mqf5rroUoM42vHCkdHZZd5l3XiigQTzlVKoW/izJnAPaZeqagB11YRTTqF98uLV6H4yaznZoCtg==
X-Received: by 2002:a17:907:770b:b0:7c1:277:caf3 with SMTP id kw11-20020a170907770b00b007c10277caf3mr2397713ejc.247.1670272923966;
        Mon, 05 Dec 2022 12:42:03 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id 6-20020a170906310600b00738795e7d9bsm6582019ejx.2.2022.12.05.12.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 12:42:03 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Jisheng Zhang <jszhang@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, Samuel Holland <samuel@sholland.org>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, Christian Hewitt <christianshewitt@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Linus Walleij <linus.walleij@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Stanislav Jakubek <stano.jakubek@gmail.com>
Subject: Re: [PATCH v2 07/12] riscv: dts: allwinner: Add Sipeed Lichee RV devicetrees
Date: Mon, 05 Dec 2022 21:42:02 +0100
Message-ID: <3466608.iIbC2pHGDl@kista>
In-Reply-To: <20221125234656.47306-8-samuel@sholland.org>
References: <20221125234656.47306-1-samuel@sholland.org> <20221125234656.47306-8-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_124205_554346_47975188 
X-CRM114-Status: UNSURE (   8.72  )
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

Dne sobota, 26. november 2022 ob 00:46:51 CET je Samuel Holland napisal(a):
> Sipeed manufactures a "Lichee RV" system-on-module, which provides a
> minimal working system on its own, as well as a few carrier boards. The
> "Dock" board provides audio, USB, and WiFi. The "86 Panel" additionally
> provides 100M Ethernet and a built-in display panel.
> 
> The 86 Panel repurposes the USB ID and VBUS detection GPIOs for its RGB
> panel interface, since the USB OTG port is inaccessible inside the case.
> 
> Co-developed-by: Jisheng Zhang <jszhang@kernel.org>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
