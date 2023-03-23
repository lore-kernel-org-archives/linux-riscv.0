Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 378E5C6FD1C
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 21:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0TS2wgOgNgeyD989T8Ya6GT3F9g9XJDZ43+99sFHLfQ=; b=jsHW/MuKdXZSJy
	/BKiIcqlm7Qmx7Pv3f+kkNDlvZSHNQb/De1uKJk2nug+uk55GDlL4RuXOvJbK8LTiK3IeHVzo8SQt
	4IUfdqVveJDXVxt2WA+WDx/yBIxa9wGWB7ZZ7meFBlrbZnG8ZZzCSKfH/1nplBLygwJXx19flf+hx
	4PlHV/Zf/QFkHVfLSBW89PCkQFvu+XINMQw4a9fxbzqsLQQBYmW6NKHxYKppmEeBRoAg2Vd2dL+3J
	ZGoCuUoo3v9Aw4Mf/UxYWBoMMdSky3fllf39rPG3meQ/hp/NijatoHjYviHbz+pOuGSpqAk+Zb7xq
	G2qrriej7kZayGuUGfUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfSJG-002zqT-27;
	Thu, 23 Mar 2023 21:17:22 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfSJC-002zpm-2l;
	Thu, 23 Mar 2023 21:17:20 +0000
Received: by mail-ed1-x52a.google.com with SMTP id b20so543728edd.1;
        Thu, 23 Mar 2023 14:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679606235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3+99Id4vlxpRMOhGjaSB6bloNnr3EAmVVri5OUB3HI0=;
        b=Z0OU4zaxuMlq76Gk4nh+Y3sS3l4JuzykQcrJRFgVcU4j3G99BBLVe5F8T31Hs1pnfF
         hYPLX9iuFec7w3kEKsmgrOGm7M0dfAXgq0u6Tw2FglaTMif9h7HGqo306Nz6FSKUfdxs
         /E8CtpxeTvNfOIVx8LcKy/9AU6GDQj6pOXr30TAad6lh0Qw7dNL+V3CC17p0hpWI1PyJ
         JP+dWjVOA3cB6bETXZ+L4xHytwjWrUfnrcmTWlxCLf9N6fpPp2lsvVpEmoGzz4RtQw9c
         OcTeKFFPxCbmCtyYq2tUArCpX7wefJwkmGb4fS18m3V5qswE+8F7KsDwk4+R3De956Ie
         uSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679606235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3+99Id4vlxpRMOhGjaSB6bloNnr3EAmVVri5OUB3HI0=;
        b=xVMP22XvBekVT4yb48GXiDmkjUeCtpl3v/Oj81hCWaYod+TKrBkYIBbGADBtsOMRqH
         imC/d0L39Ds686RJzNGVUuW2cCZoIzEfd3/PxQcE/5p20e9cQ+oBZAau0QEwvrRGUle8
         4d+n5c6hepVdRAL4+wraoB1QhLaw/m3jB9troYTnM6/lWtMEvxQVRMZleeKnHpOEX2um
         EY4n4XBfTBjgs3Jbt6SOtrk28cW3zNXKCPfeQLK3DOwf43+uirE5K3jvX3AU+nbyQkYn
         8BP6VlbnhaRMjbiW7wZPpQexAM/MDyYnnuWoXlULSPay+Tr8rVP27z8BPH7AS9iPBKg5
         cBDQ==
X-Gm-Message-State: AAQBX9d2DN20OzbpKaLfveM99Du8+FLU8unnsYRlDnE1V7g/QBj08otN
	R4oalxSXlbefc1BSh17ju4E=
X-Google-Smtp-Source: AKy350YXV7OnGGHypgylfPA7W/z5nJ+1x5GYw3D1Ob/zxZAWqv391Qz43ld0dBcs8lA0IxMw54UvSQ==
X-Received: by 2002:a17:906:fa0b:b0:8b8:c06e:52d8 with SMTP id lo11-20020a170906fa0b00b008b8c06e52d8mr404362ejb.36.1679606234729;
        Thu, 23 Mar 2023 14:17:14 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id r5-20020a1709064d0500b00923f05b2931sm9111409eju.118.2023.03.23.14.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 14:17:14 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v2 2/4] ARM: dts: sunxi: add Allwinner T113-s SoC .dtsi
Date: Thu, 23 Mar 2023 22:17:13 +0100
Message-ID: <13227090.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <20230320005249.13403-3-andre.przywara@arm.com>
References:  <20230320005249.13403-1-andre.przywara@arm.com>
 <20230320005249.13403-3-andre.przywara@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_141718_908286_88128785 
X-CRM114-Status: UNSURE (   9.68  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, =?ISO-8859-1?Q?Andr=E1s_Szemz=F6?= <szemzo.andras@gmail.com>, Belisko Marek <marek.belisko@gmail.com>, Fabien Poussin <fabien.poussin@gmail.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Dne ponedeljek, 20. marec 2023 ob 01:52:47 CET je Andre Przywara napisal(a):
> The Allwinner T113-s SoC is apparently using the same (or at least a very
> similar) die as the D1/D1s, but replaces the single RISC-V core with
> two Arm Cortex-A7 cores.
> Since the D1 core .dtsi already describes all common peripherals, we
> just need a DT describing the ARM specific peripherals: the CPU cores,
> the Generic Timer, the GIC and the PMU.
> We include the core .dtsi directly from the riscv DT directory.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
