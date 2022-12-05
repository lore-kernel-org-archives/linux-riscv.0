Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC20DC4321E
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 20:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=14ooEOe929Z9qWV392quHDFUAw5onOTQNjjEs9wtUf8=; b=X0q8n66w7k9DhV
	oaxT0eEgxH87JQBRnk5bgNDxGtUyP3XttKnjSGaprxRnOoexaz/zx1ZOVxwbqDysw3Ztb0qQDj4lw
	pnEsZD93dJqzIoOFMXCyYhu+nJjWw+dUNVNvph4FcI1W7696J3VEoXycpNOJDAnNVN56rZayIk7Zm
	mvYvkRaTFmgaUDbSd+rr/BbSrbBv2qDwYIaCM/7sOpl/WuwfPmP7pUVScDcubky028Sk6M2S4Dnzi
	f3V78WU1bLdVFi3oTp2sQVyP6hqHmL82BGhkXM0taR6Qme+hiP1vxd4es6AruRWY4YRnT9RbWMSUL
	36GyN0ZestZIof5L5cFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2I8r-00AIud-5a; Mon, 05 Dec 2022 20:32:45 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2I8i-00AIrS-4K; Mon, 05 Dec 2022 20:32:37 +0000
Received: by mail-ed1-x52c.google.com with SMTP id r26so17430795edc.10;
        Mon, 05 Dec 2022 12:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gTQXUN+wCe+JcbeHhRBc8YaP/cWNJYqc3/JHgweB/7s=;
        b=eJbMydvvO3awrVg4S0NKuHBUTa464s6VAuVN0K9UYGOZJVtoM2FRo11yyVUVa/xMCv
         y1bPEUT5JL3DamSuImf0+xJ2eDGiDArAqLeA+xqiGbRo9Dj80PIwmLDo0JkK6DO9tUfe
         /Cy+Z3MyKBNWjGAZKoAoTQxa92FMBExLydUqRUynRTr8bCkRuFF3WoXNjrvdRbGAke3v
         9J7+rZvAXlsQSkRPNcw/u5Gy94kZAagNzLPmSOkOCyIlGKu1rPjzy+TT9FrmA1MgX1EF
         ix479cb9iolG/9gV194NtIjOPvMvJAgVqgc5zcCShEhgXwRqEJY9SLFLNzzgpU/WIKQz
         ZcLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gTQXUN+wCe+JcbeHhRBc8YaP/cWNJYqc3/JHgweB/7s=;
        b=laad9CBX6NmOkpH3v/sYlChuCyoUowP905/6tT+mVeM4mQTfzPl5l8iUKIBN5aUpCk
         JJFj3xWcpQmdZBqCXn/SiRZbt0kGDdESuQ+yihdOrwEry2fB7v5V3cMA3TfNGiBB7doI
         xN6XJYSPChFzk2sj1sXZL1IJzXKtAifHeoXyJxbF2PlVNm/RbET46FxiT8BdiztpHsZ+
         OoTSrXWur3k84LY/YuHNdBY3Z4NpgR+24dt+TKwj45aP/4MYKr3mfWfMEm2v4E//07gZ
         0LQ65+f+1xu0ZtljBeXACVZFsmPeJNit0L6EO4aj1u8xauE0IWJvWs2AdYRCqg5Mo4Tk
         UvcQ==
X-Gm-Message-State: ANoB5pmk5C2gRjOqEae/CR8wE9BI5jxzz0qddRQZNl2nVLqXwAUUTsll
	IbpiPw/nve2x7s7aQGFQbMo=
X-Google-Smtp-Source: AA0mqf60d6jUSas5D6q/PR4Q7d6BaJJbLfeHZDdlbJ89AgCKuzGTDZEoy0HPtGTgbqM+7C33Ydhz0Q==
X-Received: by 2002:aa7:cc12:0:b0:462:79ec:55eb with SMTP id q18-20020aa7cc12000000b0046279ec55ebmr2675878edt.151.1670272352519;
        Mon, 05 Dec 2022 12:32:32 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id n13-20020a05640204cd00b004615f7495e0sm209632edw.8.2022.12.05.12.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 12:32:32 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Jisheng Zhang <jszhang@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, Samuel Holland <samuel@sholland.org>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, Christian Hewitt <christianshewitt@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Linus Walleij <linus.walleij@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Stanislav Jakubek <stano.jakubek@gmail.com>
Subject: Re: [PATCH v2 05/12] riscv: dts: allwinner: Add MangoPi MQ devicetree
Date: Mon, 05 Dec 2022 21:32:30 +0100
Message-ID: <1912378.PYKUYFuaPT@kista>
In-Reply-To: <20221125234656.47306-6-samuel@sholland.org>
References: <20221125234656.47306-1-samuel@sholland.org> <20221125234656.47306-6-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_123236_216031_B026FEBB 
X-CRM114-Status: GOOD (  10.67  )
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

Dne sobota, 26. november 2022 ob 00:46:49 CET je Samuel Holland napisal(a):
> The MangoPi MQ is a tiny SBC built around the Allwinner D1s. Its
> onboard peripherals include two USB Type-C ports (1 device, 1 host)
> and RTL8189FTV WLAN.
> 
> A MangoPi MQ-R variant of the board also exists. The MQ-R has a
> different form factor, but the onboard peripherals are the same.
> 
> Most D1 and D1s boards use a similar power tree, with the 1.8V rail
> powered by the SoC's internal LDOA, analog domains powered by ALDO,
> and the rest of the board powered by always-on fixed regulators. To
> avoid duplication, factor out the regulator information that is
> common across boards.
> 
> The board also exposes GPIO Port E via a FPC connector, which can
> support either a camera or an RMII Ethernet PHY. The additional
> regulators supply that connector.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
