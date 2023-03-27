Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF34C76195
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 20:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pgSuIntpeJRorBLIDa//RcDq0GpiOAPXceIyMADzvlA=; b=eg9Ib4kKy5MUcI
	K1LKjf0hEMrOBvRD0GqUetet+6FQ5WGroBwTS/DatyKdYoa5JsZBKqgXm/8fj/CH3Abb3khCoeKrg
	11qidnzba7X/+Dlpw0FfzewX1b+g5Kw6dq5puHY+AFgOZ8vER0CiukZJPLpkea1Mb8CQABWtd3pX4
	Cd09oEPDwLkGxMa+YCdDr7gTg7u+y+Ai3a/NCykXsvZAgGT8un+j9quE4BGBjl9fOsp4LfJb4OLCA
	UOGE7cWQXZvXlje8jZ4i08FevNqYfPNPlamMDdili0unPEdxC6Eu8hd9SJFOdzA0gLDZ0BG4sFY5H
	/9bGyP9KuBlBSVdaeieQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgtjt-00CLe4-0b;
	Mon, 27 Mar 2023 20:46:49 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgtjp-00CLdN-1n;
	Mon, 27 Mar 2023 20:46:47 +0000
Received: by mail-ed1-x531.google.com with SMTP id cn12so41451294edb.4;
        Mon, 27 Mar 2023 13:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679950003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n5VGGE40NcbEq8mDa+XnKTY8jKSu6LE7xtzGaY9kskM=;
        b=aY9n6MwEOjFxlplG/AmL1AhqIv6DAGPlesKsrSMZUOQfrazRbBVuLvn/maeIs9IH2S
         i1/4kALdIGyCdVYjF58Gmh/aZMsqpQa9ap/Awf9qSknI9le2GH+39R89RPlTFovdUaeD
         2n5eWhISNQsl73Zg7uh9pKQTVvFGP92WlUjlrwDaxO6rCLBmawXNB7SiPwyrJXWsCwJv
         Sv9YiJMkxpFyr3Kc8rgdHIQtzRZu3FvDzcAU7ktuas5gkar71JxZHt0bGmFxY4aKlPaI
         5jyNtYd6DM/ay/JufXUfyjF+12zA2R8QLofrVAL5DDFdcUQEdIRRxQedl1rnJY6jkSj0
         Nqfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679950003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n5VGGE40NcbEq8mDa+XnKTY8jKSu6LE7xtzGaY9kskM=;
        b=g9Bf70VLeitkJVGambrHChuwdSRU5+1Izy7d3lB4FcL3Hagilh+bjBr0BYQXWliKkC
         t+DfP3XqQF9YxqHHukoDOq/o4Ezrwtxvp41QrQTNrxRKoi42MCi8CQbpbfoKHSoaRGeX
         AuxXuPxUYGJIruu4OaofE2S9XUYz4yUZp2uMSv7cqbnJaOytSzQCepZ960MALW13YXVL
         LTNfP7zSlXGtvE5dunkaCxQA+Tt/4H1n+UYsk089xmIAtcWl4B3CBEGyGEwmK3HFCblO
         cKA00Vupqks7rLw+05xZwgMXRUcsfbYAAkMiIAPXgDzLFnBaLLz9RvYk7tjBTpjKi0Rk
         pItg==
X-Gm-Message-State: AAQBX9eJ+8NnmQrg0t1hphjQAgZSAktwm7+uwcGZwpWCo/GzZdFMYn75
	6jPPlgxMs+NiCyomsWNn85o=
X-Google-Smtp-Source: AKy350aK9Y63itdv4ewgSBQo+2OgFfKBT+Q+is5SeV+AA/eMwqp0tLtQc6vcwjQ/bGUVRwPpC2Gc3w==
X-Received: by 2002:a17:906:4d0f:b0:8b2:8876:6a3c with SMTP id r15-20020a1709064d0f00b008b288766a3cmr12973366eju.29.1679950002716;
        Mon, 27 Mar 2023 13:46:42 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id e3-20020a170906504300b00930c6c01c9esm14694983ejk.143.2023.03.27.13.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 13:46:42 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v2 0/4] ARM: dts: sunxi: Add MangoPi MQ-R board support
Date: Mon, 27 Mar 2023 22:46:40 +0200
Message-ID: <2673156.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20230320005249.13403-1-andre.przywara@arm.com>
References: <20230320005249.13403-1-andre.przywara@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_134645_674126_2F5AD734 
X-CRM114-Status: GOOD (  21.81  )
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

Dne ponedeljek, 20. marec 2023 ob 01:52:45 CEST je Andre Przywara napisal(a):
> Hi,
> 
> this is v2, mostly acknowledging the fact that there is an Allwinner D1s
> version of the board as well, thus splitting the board .dts into a
> shared .dtsi and a stub .dts for the ARM version. I don't have the RISC-V
> version, so cannot provide (nor test) this .dts file, but creation should
> be easy, being based on the shared board .dtsi file.
> Since the D1/D1s .dts files are now merged, this patch set should compile
> cleanly now.
> 
> ======================================
> 
> The MangoPi MQ-R-T113 is a small SBC with the Allwinner T113-s3 SoC.
> That is a very close relative to the Allwinner D1/D1s SoCs, but with
> Arm Cortex-A7 cores, and 128 MB of SIP co-packaged DDR3 DRAM.
> 
> This series introduces the missing T113-s .dtsi, which builds on top of
> the D1/D1s .dtsi, but adds the ARM specific peripherals, like the CPU
> cores, the arch timer, the GIC and the PMU.
> This requires to add a symlink to the RISC-V DT directory in patch 1/4,
> to be able to easily reference the base .dtsi from other architecture
> directories.
> Since there are versions of the MQ-R boards with the Allwinner D1s,
> there is shared .dtsi describing the board peripherals, plus a small
> stub .dts to tie together all bits for the actual board.
> 
> Cheers,
> Andre
> 
> Changelog v1 ... v2:
> - rebase on top of v6.3-rc3 (including now merged D1/D1s .dtsi files)
> - refine board naming, stating both RISC-V and ARM versions
> - move board .dts into a shared .dtsi (to cover RISC-V version)
> - fix 5V regulator node name
> 
> Andre Przywara (4):
>   dts: add riscv include prefix link
>   ARM: dts: sunxi: add Allwinner T113-s SoC .dtsi
>   dt-bindings: arm: sunxi: document MangoPi MQ-R board names
>   ARM: dts: sunxi: add MangoPi MQ-R-T113 board
> 
>  .../devicetree/bindings/arm/sunxi.yaml        |   5 +
>  .../devicetree/bindings/riscv/sunxi.yaml      |   5 +
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../dts/sun8i-t113s-mangopi-mq-r-t113.dts     |  35 +++++
>  arch/arm/boot/dts/sun8i-t113s.dtsi            |  59 ++++++++
>  .../boot/dts/sunxi-d1s-t113-mangopi-mq-r.dtsi | 126 ++++++++++++++++++
>  scripts/dtc/include-prefixes/riscv            |   1 +
>  7 files changed, 232 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun8i-t113s-mangopi-mq-r-t113.dts
>  create mode 100644 arch/arm/boot/dts/sun8i-t113s.dtsi
>  create mode 100644 arch/arm/boot/dts/sunxi-d1s-t113-mangopi-mq-r.dtsi
>  create mode 120000 scripts/dtc/include-prefixes/riscv

Merged, thanks!

Best regards,
Jernej




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
