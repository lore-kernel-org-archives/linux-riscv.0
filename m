Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80DEBCD1288
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 18:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Q4+Y/QuEZ9FiMEjLaD0mwINCqhLkuB+cddQb0Gy307M=; b=gQjf3+qQueOxS/xA1lchsCM8UI
	fY350oS9csUQH+v6ByDRZ5iL1SdTQLF9MYjfikXnadgty1Vg/5Zj/AdkvQkVFGekSqTtf1jx2/P7U
	0R18BaXJ2d8kSkpH3tTxw7ojrXeguvZsGwWAXEmavlN8ukTQChfW0d0pMs+jN6GoFmjfbLaoGE6nQ
	8oGbPdRaWRPfJ65LLoLlUOXK7EbCBHFwbaPov1xWYN7WHivpdFEygjphpl3KaPGzlNbwGJD1x8h1a
	1FVnMhY4SdB3EC62JaDYlxeJPkS4x7FUaXY0F2q2q7M8BF0AD2djJrMRZQk2sVf6yc2Q/Sihl2xuH
	VQHv+gbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs5FX-0000000HMmO-1JdI;
	Wed, 03 Apr 2024 18:22:15 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs5FQ-0000000HMip-1Wmb
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 18:22:12 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6e6b729669bso82257b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 11:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1712168527; x=1712773327; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LoPxyy6ZZevKYMVQQwthSJ0EL7SyRC2E5s9/TcAwzlA=;
        b=AsrIfDkpueXSmREIAwY43Ad6Ycdh6PKVaPJT+k87y0+Zh5tXjtbJ3sNYWaiPUp+sZV
         X0Zj5Kb+NzcOifa08JjcrcS5k1Q1wgv6sGzyejetffTRCjhul2cWA3CVNiGpnXD/aA0O
         3HAHkAORKL07BFGBSRqfHIV2a7qCUczgs0ynEmRImEnP5PvVjS2scVixDqzDFloX86ae
         X9EbCNl89KPdHWZ7ImvIBMfAmiAzSeM/87V9SdID/1izsYHOsZhXyxKScPVxj8NaYauo
         DipvLUlr1yKO9KTAdFfR1+0RrniEJ7Bb7S+suuLZisAEqL2nfiZHx10R1htdzrEFq5dx
         dStA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712168527; x=1712773327;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LoPxyy6ZZevKYMVQQwthSJ0EL7SyRC2E5s9/TcAwzlA=;
        b=rS1YtNUv9KrhiP/MK/FDb7H9nFGdl7yjEXApCo9wZAY89oENKcZeYxnJi6nc40LSgD
         N7Yo/DGjlUAKRAGSUAYOGjKSlmMaph4FWIdmA3Qno0ae5n/0o3BinrDmTRXtyNTeXHV3
         +H0FAnpiKXe9spU6iJ63ngVgJ65kdzoXtlsTISbSewm2KwjLa0iGK/PHBb5brI7fn69e
         ycnTO0aut+JmH1i/TtO56ZC5n/NFWEUuJ92nR6FSGFCAgdHE4+LhL3FUJ35cSNfEwjo9
         4rmq+uicXUt0IYB4EhuGxJIFhs24UMnFaLzfFGQW9ixUegwslAsnPA2MiD42zgRHC/nc
         TLyQ==
X-Gm-Message-State: AOJu0Yxzvzchir+1vMg31arnYUTowIh7WkITyT36r7baHBHLPQLMDCc1
	6LauaK49I70rlrvoNzyqNu68Y+8AjV/8+8EvBGYX7PvTiNT7+thFeydLJYeEgiRVS+esMr4EG1o
	+
X-Google-Smtp-Source: AGHT+IE8xKPk+Cg4ycXY4vSQCypFZ4Jw5ScQiKmu4H6BcqJa4Y6mRodZymA7cXolnlaayPoU0XPjww==
X-Received: by 2002:a05:6a20:734b:b0:1a3:48da:1090 with SMTP id v11-20020a056a20734b00b001a348da1090mr568998pzc.14.1712168527301;
        Wed, 03 Apr 2024 11:22:07 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d9-20020a17090ad3c900b0029b77fbeb7fsm14038311pjw.16.2024.04.03.11.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 11:22:06 -0700 (PDT)
Date: Wed, 03 Apr 2024 11:22:06 -0700 (PDT)
X-Google-Original-Date: Wed, 03 Apr 2024 11:21:50 PDT (-0700)
Subject: Re: [PATCH v6 00/11] riscv: add initial support for Canaan Kendryte K230
In-Reply-To: <tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com>
CC: linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>,
  dlemoal@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, guoren@kernel.org, mturquette@baylibre.com,
  sboyd@kernel.org, linus.walleij@linaro.org, p.zabel@pengutronix.de, linux-gpio@vger.kernel.org,
  linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cyy@cyyself.name
From: Palmer Dabbelt <palmer@dabbelt.com>
To: cyy@cyyself.name
Message-ID: <mhng-08e43080-8679-43f8-80c5-b73304e4e680@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_112208_437709_DCB70D96 
X-CRM114-Status: GOOD (  19.78  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 23 Mar 2024 05:09:42 PDT (-0700), cyy@cyyself.name wrote:
> K230 is an ideal chip for RISC-V Vector 1.0 evaluation now. Add initial
> support for it to allow more people to participate in building drivers
> to mainline for it.
>
> This kernel has been tested upon factory SDK [1] with
> k230_evb_only_linux_defconfig and patched mainline opensbi [2] to skip
> locked pmp and successfully booted to busybox on initrd with this log [3].
>
> [1] https://github.com/kendryte/k230_sdk
> [2] https://github.com/cyyself/opensbi/tree/k230
> [3] https://gist.github.com/cyyself/b9445f38cc3ba1094924bd41c9086176
>
> Changes since v5:
> - Deprecate SOC_CANAAN and use SOC_CANAAN_K210 for K210 SoCs
> - Modify existing K210 drivers depends on SOC_CANAAN_K210 symbol
> - Reword dts commit message
> - Modify dts to use Full 512MB memory
> - Rebase to linux mainline master
>
> Changes since v4:
> - Reword commit message on dts that the B-ext version of c908 is 1.0 rather
>   than 1.0-rc1
>
> v4: https://lore.kernel.org/linux-riscv/tencent_587730262984A011834F42D0563BC6B10405@qq.com/
>
> Changes since v3:
> - Refactor Kconfig.soc which uses ARCH_CANAAN for regular Canaan SoCs and
>   rename SOC_CANAAN to SOC_CANAAN_K210 for K210 in patch [5/7]
> - Sort dt-binding stings on Cannan SoCs in alphanumerical order
>
> v3: https://lore.kernel.org/linux-riscv/tencent_BB2364BBF1812F4E304F7BDDD11E57356605@qq.com/
>
> Changes since v2:
> - Add MIT License to dts file
> - Sort dt-binding stings in alphanumerical order
> - Sort filename in dts Makefile in alphanumerical order
> - Rename canmv-k230.dts to k230-canmv.dts
>
> v2: https://lore.kernel.org/linux-riscv/tencent_64A9B4B31C2D70D5633042461AC9F80C0509@qq.com/
>
> Changes since v1:
> - Patch dt-bindings in clint and plic
> - Use enum in K230 compatible dt bindings
> - Fix dts to pass `make dtbs_check`
> - Add more details in commit message
>
> v1: https://lore.kernel.org/linux-riscv/tencent_E15F8FE0B6769E6338AE690C7F4844A31706@qq.com/
>
> Yangyu Chen (11):
>   dt-bindings: riscv: Add T-HEAD C908 compatible
>   dt-bindings: add Canaan K230 boards compatible strings
>   dt-bindings: timer: Add Canaan K230 CLINT
>   dt-bindings: interrupt-controller: Add Canaan K230 PLIC
>   riscv: Kconfig.socs: Split ARCH_CANAAN and SOC_CANAAN_K210
>   soc: canaan: Deprecate SOC_CANAAN and use SOC_CANAAN_K210 for K210
>   clk: k210: Deprecate SOC_CANAAN and use SOC_CANAAN_K210
>   pinctrl: k210: Deprecate SOC_CANAAN and use SOC_CANAAN_K210
>   reset: k210: Deprecate SOC_CANAAN and use SOC_CANAAN_K210
>   riscv: dts: add initial canmv-k230 and k230-evb dts
>   riscv: config: enable ARCH_CANAAN in defconfig
>
>  .../sifive,plic-1.0.0.yaml                    |   1 +
>  .../devicetree/bindings/riscv/canaan.yaml     |   8 +-
>  .../devicetree/bindings/riscv/cpus.yaml       |   1 +
>  .../bindings/timer/sifive,clint.yaml          |   1 +
>  arch/riscv/Kconfig.socs                       |   8 +-
>  arch/riscv/Makefile                           |   2 +-
>  arch/riscv/boot/dts/canaan/Makefile           |   2 +
>  arch/riscv/boot/dts/canaan/k230-canmv.dts     |  24 +++
>  arch/riscv/boot/dts/canaan/k230-evb.dts       |  24 +++
>  arch/riscv/boot/dts/canaan/k230.dtsi          | 140 ++++++++++++++++++
>  arch/riscv/configs/defconfig                  |   1 +
>  arch/riscv/configs/nommu_k210_defconfig       |   3 +-
>  .../riscv/configs/nommu_k210_sdcard_defconfig |   3 +-
>  drivers/clk/Kconfig                           |   4 +-
>  drivers/pinctrl/Kconfig                       |   4 +-
>  drivers/reset/Kconfig                         |   4 +-
>  drivers/soc/Makefile                          |   2 +-
>  drivers/soc/canaan/Kconfig                    |   4 +-
>  18 files changed, 220 insertions(+), 16 deletions(-)
>  create mode 100644 arch/riscv/boot/dts/canaan/k230-canmv.dts
>  create mode 100644 arch/riscv/boot/dts/canaan/k230-evb.dts
>  create mode 100644 arch/riscv/boot/dts/canaan/k230.dtsi
>
> base-commit: 8e938e39866920ddc266898e6ae1fffc5c8f51aa

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
