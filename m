Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B67E1C021A7
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 13:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=TEcKkCk2N0zFmikxLqj2sTyWGVE07QqynnSedmgWx9I=; b=DvR9VuNUZAidEf1ygh4hX/mlpg
	mPfzjhSDr1IuvikQ+toIbVeci2jcRWwFmd9hEodQEH6pqqDkMyZRzxXKSajPDmghQf0T2lOK/kHLS
	OzvJ+anSoUj8005MURWbFoa/pfeS6w7HH5LPeSYP/lI2X2DtoYjTgz4aVcW770HUmnxl7kbnouTgW
	K9piQVBLiigUZ2Atdk7XogAIBrl+33hT6lhzU+8g8xGNq+w5Kxz7yMnRqx8kRb1YAi9uhzafwthuD
	JPY8VFg8pFX7xpCG+ymk1PLSqxmJT+rwhZUoa6Ad2Sgp9+gtwE/uQ6ysu1ZHJ+uEAbtaz3M0gIPwd
	vF22vGlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqXsh-00000006CCi-1K00;
	Tue, 17 Sep 2024 13:04:35 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqXse-00000006CCA-0Gna
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 13:04:33 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7193010d386so3676853b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 17 Sep 2024 06:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1726578270; x=1727183070; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9fC01ApAI2xiRo01+6ZsMz3W1Z0be43G8VgU22JuKOg=;
        b=n0DRDt2cVKZGPUd4UJl5NTsLvGSTbKsPLQ3zSWHCn4b238NVmPLpBfbHYK1Dr5F4wB
         Gm7gkkCdVXTiJpF8o+iaLGbAP3SN1EAtWjoJrtmj/V6HgjYgU0ZLvvGg3sztLKG583Q/
         Hl60zE9vIj64xKa24ZoD9CXaUEBNgo7IBnew8hHXeIqP48gWxT5Js1nahOc4v6UfX5qV
         2sIeh6WprKoY6Y//iJm4fxkvYM4yLWpKhXAixK+7jBx7m1uXJ2duGiKsbr2Oc2od6nrN
         lH/s+ptUtAogi2HhyQ0WnGZKtxnbKgE8mcj8Zzc+9pn0TRLgIVo2YmC4cgrkD/f8HZTH
         CkCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726578270; x=1727183070;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9fC01ApAI2xiRo01+6ZsMz3W1Z0be43G8VgU22JuKOg=;
        b=H6i3Y1rKWsOeaiN05xJL61nMYW2/4CFsU8DzmrDXaQywj5I0UMN2mw20WuNwcOM0KA
         IbiCBMys6dJLMlvAzkYE+4P+Ym0Gzaa/oiZPWtlYz/qN5cO05Qx37QM54DNURhxY988Z
         9fbCFmiI6u+ee5QtdEz0nnaJtPDB16UJz1TpuIvl7eC07N0mNe0M8q4g3Pt1oCjAyVHX
         v/nBzZGtxkdqqUjdP7/ktRIMIvOx5t1jji89sxTUzsYa1EoKZzbXRQM7LbVAHt/rkPZq
         SngpG67/FW5PFZKKhKdvQOzqhWcYfO99iMPfxeaKa+1lQjTinAIMBzjvwQsqLTEJTiK7
         jgmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWu5cUiA5ROHCMzIXmO8Xhxq7TAcMAo6s/P90ZjtyiBR9jHi1dyvd/+cwb2PiZesLa4EWJlnSRz17bb+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2Uh0LWYghKIP9VC5LLDvkbvLcQyOyNAdn0wiIGwtOGLi7xrJp
	yPlmKw6w89vdYSNUGFlhWDDgzRysfsalDnGip0X/E91jmJTp3XN2vOo773Lro+g=
X-Google-Smtp-Source: AGHT+IEJWwmnIQGoJxuHkNWb54HgOHUJ5HPr7nQy44p04MsUVikXslcg4GRjyMp4pqihjfW9E+yrbg==
X-Received: by 2002:a05:6a20:43a0:b0:1cf:4679:9b97 with SMTP id adf61e73a8af0-1d112e8beffmr22291992637.37.1726578270424;
        Tue, 17 Sep 2024 06:04:30 -0700 (PDT)
Received: from localhost ([213.208.157.38])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944b7b329sm5151248b3a.136.2024.09.17.06.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 06:04:29 -0700 (PDT)
Date: Tue, 17 Sep 2024 06:04:29 -0700 (PDT)
X-Google-Original-Date: Tue, 17 Sep 2024 06:04:20 PDT (-0700)
Subject: Re: [PATCH v5 00/10] riscv: add initial support for SpacemiT K1
In-Reply-To: <20240730-k1-01-basic-dt-v5-0-98263aae83be@gentoo.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: dlan@gentoo.org
Message-ID: <mhng-5bc45db9-5deb-4db6-8733-561768b2968c@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_060432_396849_483D1854 
X-CRM114-Status: GOOD (  27.03  )
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
Cc: cyy@cyyself.name, Conor Dooley <conor.dooley@microchip.com>, jszhang@kernel.org, linux-riscv@lists.infradead.org, jirislaby@kernel.org, robh@kernel.org, anup@brainfault.org, daniel.lezcano@linaro.org, kevin.z.m@hotmail.com, linux-serial@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, lkundrak@v3.sk, Paul Walmsley <paul.walmsley@sifive.com>, tglx@linutronix.de, zhangmeng.kevin@spacemit.com, dlan@gentoo.org, Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, jesse@rivosinc.com, samuel.holland@sifive.com, inochiama@outlook.com, matthias.bgg@kernel.org, krzk+dt@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 29 Jul 2024 17:28:03 PDT (-0700), dlan@gentoo.org wrote:
> SpacemiT K1 is an ideal chip for some new extension such as RISC-V Vector
> 1.0 and Zicond evaluation now. Add initial support for it to allow more
> people to participate in building drivers to mainline for it.
>
> This kernel has been tested upon Banana Pi BPI-F3 board on vendor U-Boot
> bootflow generated by Armbian SDK[1] and patched OpenSBI[2] to enable
> Zicboz, which does not in the vendor dts on its U-Boot. Then successfully
> booted to busybox on initrd with this log[3].
>
> As previous discussion in patch v1[4], maintainer expect more basic drivers
> ready before really merging it, which would be fine. For other follow-up patches,
> that are clk, pinctrl/gpio, reset.. My current goal would target at a headless
> system including SD card, emmc, and ethernet.

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

if you guys want to take this through some SOC tree.  I'm not really 
sure what the bar is for SOC support to get merged, but I'd be happy to 
just see this booting at all -- we've got a bunch of them floating 
around and the vendor kernels are pretty crusty, so anything's an 
improvement on my end.

> In this series, the uart node has no 'fifo-size', 'tx-threshold' property populated,
> will add them once this patch is resolved, see thread [5]
>
> P.S: talked to Yangyu, I will help and take care of this patch series, thanks
>
> ---
> Changes in v5:
> - fix cache-sets in dts
> - collect Rob's Ack
> - rebase to 6.11-rc1
> - Link to v4: https://lore.kernel.org/r/20240709-k1-01-basic-dt-v4-0-ae5bb5e56aaf@gentoo.org
>
> Changes in v4:
>  - add i/d-cache, l2-cache info
>  - squash uart1 dts node
>  - update tags
>  - Link to v3: https://lore.kernel.org/r/20240703-k1-01-basic-dt-v3-0-12f73b47461e@gentoo.org
>
> Changes in v3:
>  - fix dt_binding_check error
>  - fix plic compatible
>  - fix uart node name
>  - add uart1 dts node
>  - collect tags
>  - Link to v2: https://lore.kernel.org/r/20240627-k1-01-basic-dt-v2-0-cc06c7555f07@gentoo.org
>
> Changes in v2:
>  - fix timebase-frequency according to current setting
>  - add other uart dt nodes, fix input frequency
>  - introduce new uart compatible for K1 SoC
>  - add 'k1' prefix to bananapi-f3.dts
>  - fix k1-clint compatible
>  - fix some typos
>  - Link to v1: https://lore.kernel.org/r/tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com
>
> Link: https://github.com/BPI-SINOVOIP/armbian-build/tree/v24.04.30 [1]
> Link: https://gist.github.com/cyyself/a07096e6e99c949ed13f8fa16d884402 [2]
> Link: https://gist.github.com/cyyself/a2201c01f5c8955a119641f97b7d0280 [3]
> Link: https://lore.kernel.org/r/20240618-hardwood-footrest-ab5ec5bce3cf@wendy [4]
> Link: https://lore.kernel.org/linux-riscv/20240706082928.2238-1-jszhang@kernel.org/ [5]
>
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
>
> ---
> Yangyu Chen (9):
>       dt-bindings: vendor-prefixes: add spacemit
>       dt-bindings: riscv: Add SpacemiT X60 compatibles
>       dt-bindings: riscv: add SpacemiT K1 bindings
>       dt-bindings: timer: Add SpacemiT K1 CLINT
>       dt-bindings: interrupt-controller: Add SpacemiT K1 PLIC
>       riscv: add SpacemiT SoC family Kconfig support
>       riscv: dts: add initial SpacemiT K1 SoC device tree
>       riscv: dts: spacemit: add Banana Pi BPI-F3 board device tree
>       riscv: defconfig: enable SpacemiT SoC
>
> Yixun Lan (1):
>       dt-bindings: serial: 8250: Add SpacemiT K1 uart compatible
>
>  .../interrupt-controller/sifive,plic-1.0.0.yaml    |   1 +
>  Documentation/devicetree/bindings/riscv/cpus.yaml  |   1 +
>  .../devicetree/bindings/riscv/spacemit.yaml        |  28 ++
>  Documentation/devicetree/bindings/serial/8250.yaml |   4 +-
>  .../devicetree/bindings/timer/sifive,clint.yaml    |   1 +
>  .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
>  arch/riscv/Kconfig.socs                            |   5 +
>  arch/riscv/boot/dts/Makefile                       |   1 +
>  arch/riscv/boot/dts/spacemit/Makefile              |   2 +
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |  19 +
>  arch/riscv/boot/dts/spacemit/k1.dtsi               | 459 +++++++++++++++++++++
>  arch/riscv/configs/defconfig                       |   1 +
>  12 files changed, 523 insertions(+), 1 deletion(-)
> ---
> base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
> change-id: 20240626-k1-01-basic-dt-1aa31eeebcd2
>
> Best regards,

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
