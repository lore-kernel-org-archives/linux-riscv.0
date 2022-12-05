Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E91D2C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 20:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c+xB4DPNqv0W388BxLT7XS195Sm9Yd0BmdOSRXK6LNw=; b=0v3XJUsZjc6Rl7
	WkcwbfK8gZ606j0lUp8ZzwbmHKX52UQCofNs939iarPkk00YG0jivtoFOn+r/JOPS+Ivd8dGPBD9s
	8hymTs+bn1AAV7bBaNoMTnDzf+DoyvJBOq5XDMMWNzE9If5WQg1OEqtjS8idR/RXCwRaB8VPvGfH2
	oIq8WYmUfpyXURF49JAEc6TZLdg+6R6xvy+rcc1df1ac8XG/QrcuSgOThJBw7CA7Ek/DRjIbkvyU3
	H25Q1AU23Y22R+p1xAmD76j0kP18TJWFmP+50/miOuqNui/4rIqCCh03SSY0nT0GJqc3YhSbQ0CFH
	RbF7AcqWK/ZsoT91buOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2IJ7-00AQFh-Hr; Mon, 05 Dec 2022 20:43:21 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2IJ4-00AQAb-3g; Mon, 05 Dec 2022 20:43:19 +0000
Received: by mail-ej1-x632.google.com with SMTP id n20so1509501ejh.0;
        Mon, 05 Dec 2022 12:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QnklUjZR0c0LO76Qxp3fFJe2+d2XTdjb5Unf9l7Eej4=;
        b=JisIvPJPKq8kJkC4FZ65uRGFoc8C2ST0BWcamsPcGoJVojWLeuhkcdcBu8kWzrSGxW
         FnoK/OwPhoIIaQHiIB8OBNrWD0BFgDf2uAYDl7NjhqgjRYBRPpyqwQTglWZFHlzuORab
         VTIOYZhUjAvIz604UoXuhX0vT1yApC0HEYvaKhqf0iajLQttT4p49iBarJ9a8BDa9N1F
         TZPhez1EI8nO8hJLG5G8G1SaVlyntKsYFmiNS26EM1BowF6XLqjC5NHmd6Nmpg5M9iAC
         XEixmz6/1CB2jQR7DIT5ZnyVGTMTPJhgwJIl4XHXBa7DbstdN21ktJRal/w57uzCLu3C
         qIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QnklUjZR0c0LO76Qxp3fFJe2+d2XTdjb5Unf9l7Eej4=;
        b=aYYd/zMYbA9r6Fq6sz57WgGy47yXc2nb3tN4L/V6iH+5PfjHD9QKjCeBFKUrWZnXC7
         cV9C3oWjWbUhUbu+OPf3PcYhbnSFVE7Gydrze+5WR3w+UkZRZImMOEGLarvljEbTabns
         z1eYwHaNfyFEE6jU37Ks4zAm7wJ5Kw7FnBnN1tFk2sCUKny/taJ673q7KlS9vGAl6TFY
         gLU2oHaKYiwuUQ+CoMesX4GGquZHrO4gzVLxB5YG4PF7HBvNnKWfIA4qjcs4Z5ZY3PKs
         H3x06lEjpZhnoHti0MzqD7IfFjRos9M9aI2Q/A3u6UEf8w+MWY3Qna0kha0kS/z3peeq
         CioQ==
X-Gm-Message-State: ANoB5pnhRVurtePzsYlNIzZmGiySSbHPz9xqO8kvTzhJ6+g+x+wgxsiT
	MOMOm04pMj7CeHruNMsGrT4=
X-Google-Smtp-Source: AA0mqf4Rgh0vFFu8IOxnenPhjBpxMR088qnLDKQ9JbQ9ahZsFefNRzOOwPqw+kMG9BcdAGy3Tb4GJA==
X-Received: by 2002:a17:906:dfe8:b0:7c0:8711:7a4 with SMTP id lc8-20020a170906dfe800b007c0871107a4mr27160145ejc.667.1670272996604;
        Mon, 05 Dec 2022 12:43:16 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id lb14-20020a170907784e00b0077a11b79b9bsm6583034ejc.133.2022.12.05.12.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 12:43:16 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Jisheng Zhang <jszhang@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, Samuel Holland <samuel@sholland.org>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, Christian Hewitt <christianshewitt@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Linus Walleij <linus.walleij@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Stanislav Jakubek <stano.jakubek@gmail.com>
Subject: Re: [PATCH v2 09/12] riscv: dts: allwinner: Add Dongshan Nezha STU devicetree
Date: Mon, 05 Dec 2022 21:43:14 +0100
Message-ID: <1742993.VLH7GnMWUR@kista>
In-Reply-To: <20221125234656.47306-10-samuel@sholland.org>
References: <20221125234656.47306-1-samuel@sholland.org> <20221125234656.47306-10-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_124318_202974_B18AC18E 
X-CRM114-Status: UNSURE (   9.43  )
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

Dne sobota, 26. november 2022 ob 00:46:53 CET je Samuel Holland napisal(a):
> The 100ask Dongshan Nezha STU is a system-on-module that can be used
> standalone or with a carrier board. The SoM provides gigabit Ethernet,
> HDMI, a USB peripheral port, and WiFi/Bluetooth via an RTL8723DS chip.
> 
> The "DIY" carrier board exposes almost every pin from the D1 SoC to 0.1"
> headers, but contains no digital circuitry, so it does not have its own
> devicetree.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
