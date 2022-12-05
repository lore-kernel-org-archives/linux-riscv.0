Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0FBC47089
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 20:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z5eYDhFewCH427fFK0fQkN8Sb+KJH+R4/y7uMnzxT1U=; b=fdFRbeHQMa04Fn
	PTWnJRa8Szj1Yiww16GTwd1OfZOxM6bg/L/hzIWliPf2ibIHNDaeAPS0TPJxdkR0pv3bHMlZJgBRl
	cK2Shs/RH0eNj4uo8/tm8ZG+KsXjK33Po9Zb/00FwLZGqUfL35bdlLb4sZ4stBFjCgn42TQNcYKcU
	lEz2Po9X4EwpoqUAL1xM1nGe/tXyBKRX6+bavz/7SQODjSGNsQZjFqBMd2hVyt04MoYah477jYulD
	o32Opt6wT7nyVpE4yBJtYgrPMvw/Ds3QOQ3f7QTsvfwH5ZluV6PZomHw7C2wIcqoZpmiQ9PPP+z30
	jkXuuKuSntANpR2jBQjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2I9J-00AJ7A-81; Mon, 05 Dec 2022 20:33:13 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2I9G-00AJ5H-DC; Mon, 05 Dec 2022 20:33:11 +0000
Received: by mail-ej1-x635.google.com with SMTP id t17so1370749eju.1;
        Mon, 05 Dec 2022 12:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1y4+o5+3VTQ2cJHFB9l2XaUG0/wHW8D/s+vsN99BVaE=;
        b=iOXDEcLuqwSherSXE4U5w9gQCgyvR2cm/LugX2hw47DYz1qiypw3Az7NEAsK9etGZ1
         R9Wc7jHvQ1EDOovASiJdlnEZGoS+sZ55uSBB0iBfoFUKeUQsE1Co9JftkJgDgt+zhpVp
         A9TV6HOF3p7oJWQ8fnSast3ZANpdE1lqxkLUJZGE4YaIktmGrooce/zw3aTJCl9ZR/Aw
         +Iy2UZXquCzjBtHeODlWshoR6nVHh0cUPm9VnYmACQXSHaMbg7muAuZnY/P5n1J35DfT
         PmM405Xz/pL16rowVhHyRjWe2vqChetT73pJ564SYg1ChclWQJG080/7wX6OPnvshXWS
         nuDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1y4+o5+3VTQ2cJHFB9l2XaUG0/wHW8D/s+vsN99BVaE=;
        b=Q0gLb28TvyNxwyfDfdnjnIVBtZMxTRQLImWOEEGHYyBhChaF+O898lW+sAms5OOjkj
         BDrgKcVB02R8Oq3YkZDdNmmVs1r5jrt3jCwT425x7YLDsFWgB9GcS8BHK5AGbNjHojUW
         o8LmPYToXusnLr5VfwpvfrzvgtMNYOx6x2XqLb68fcV+eLwDPunX1sCmv7AmcFizqfy1
         a2PzI+4SChUqKeM8sN6jifUkZZL3sQqJEcSk69w2XhHfkMFxikMhZGLRE46EFnBOnXQw
         qwU9D5Q6Mtt+DiGJhO1+NlZ4D2CDNzW+bK2rU4EmTZHxkYKTalCB6V4Lt2Fbn/ePp6ll
         1dCw==
X-Gm-Message-State: ANoB5pmvqzALtjojwhwOB36TeYVg+jQkFKmDxwCXeeVSB8E5fY+OjQZS
	g5GOr2jQH01nSZkUSyb78lY=
X-Google-Smtp-Source: AA0mqf7L5DepZPykpakDz8MEhCAqHhMgcvBT0fnFKGlH2luNDKCM3xQ0hRd5HOR5Fvc1yUeli+Pdog==
X-Received: by 2002:a17:906:3da2:b0:7ac:a2b7:6c96 with SMTP id y2-20020a1709063da200b007aca2b76c96mr68446980ejh.412.1670272388905;
        Mon, 05 Dec 2022 12:33:08 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id r1-20020a1709061ba100b00779a605c777sm6581013ejg.192.2022.12.05.12.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 12:33:08 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Jisheng Zhang <jszhang@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, Samuel Holland <samuel@sholland.org>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, Christian Hewitt <christianshewitt@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Linus Walleij <linus.walleij@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Stanislav Jakubek <stano.jakubek@gmail.com>
Subject: Re: [PATCH v2 06/12] riscv: dts: allwinner: Add Allwinner D1 Nezha devicetree
Date: Mon, 05 Dec 2022 21:33:07 +0100
Message-ID: <7457885.EvYhyI6sBW@kista>
In-Reply-To: <20221125234656.47306-7-samuel@sholland.org>
References: <20221125234656.47306-1-samuel@sholland.org> <20221125234656.47306-7-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_123310_492031_2281D55F 
X-CRM114-Status: UNSURE (   7.22  )
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

Dne sobota, 26. november 2022 ob 00:46:50 CET je Samuel Holland napisal(a):
> "D1 Nezha" is Allwinner's first-party development board for the D1 SoC.
> It was shipped with 512M, 1G, or 2G of DDR3. It supports onboard audio,
> HDMI, gigabit Ethernet, WiFi and Bluetooth, USB 2.0 host and OTG ports,
> plus low-speed I/O from the SoC and a GPIO expander chip.
> 
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Tested-by: Conor Dooley <conor.dooley@microchip.com>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
