Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C42E7716B
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Dec 2024 11:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5p1rk/9MGbFdlph1dOpS4vecSvyuzRb9cj7AOXPN7Lg=; b=ngN7vanCmPMS3eoxa/w2L4OZW6
	N3FJXFYAvJXOEx625Ktvt8kGoUYuXl1gH+Qb8RUTM5OeQXZRRf2zfdvVyDay79tKdTpy+fDSue4+F
	JyQZ/2GZGa/8ygvg1B+ySYEuIq2af+r3UYL8P8yNo5K3TvC9/1VjnrGCTIrYt0ylckFyTuQxGgMD3
	n7UOEj9JnDltahra19hijH9o/C1xEOVLQX8MEMQ8oou7t+POojncFG3oG4jno7VEPB3z8Zceid5Qb
	PWweiuf6FFcuFQBQgJ+DVofWinVPtITdQEWsrWSs2djXBiNW9K89Z5eskasQ+LInb1zZa6Xw0BzeO
	uIdNdrBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tInxj-0000000CRt5-49GY;
	Wed, 04 Dec 2024 11:54:35 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tInxg-0000000CRsg-3A8F
	for linux-riscv@lists.infradead.org;
	Wed, 04 Dec 2024 11:54:34 +0000
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E87EE3F763
	for <linux-riscv@lists.infradead.org>; Wed,  4 Dec 2024 11:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1733313267;
	bh=ZZ0KuXCkwVIsgqmnVBvqG5NLt7HlyOEZfYjDmvMmLyo=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=cE2j7htDZmzYRn/9l8iH9MpxMb3IOgJbLcUThR98BK2dp7k4pF3LmwKwTRYjTD1Mn
	 NUrJrzyYZWmCdK++u9IZxEPK1HOS0MYfQreY1udJKZNnyeXpYunLzPwCXgskpex/nC
	 B19q95phFHFI0R/7agXn63GrACzyHF7dPQv/+7YsWUiOOM3AavDsP0GOrRgJyBYS7H
	 JPLXrhvZ6ZtggToMUfaTV2T3DFG93PeGhxiG80C3Vn/cl/1nFs+G7mD6H+PGMOr6N2
	 BdrSYxDgYDTyQroUCSaJqRNcOfrHXVgjeo7K9YWkzDePP7Xnr+yyU69O6exk0Ww/2H
	 wJJyE0saQgGTg==
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-29e8910b87cso1709698fac.2
        for <linux-riscv@lists.infradead.org>; Wed, 04 Dec 2024 03:54:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733313266; x=1733918066;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZ0KuXCkwVIsgqmnVBvqG5NLt7HlyOEZfYjDmvMmLyo=;
        b=sJGNybJAsPgfzeiM5eA2BXomvBIcs2WDTN90BOtaaPe5AggAd9/iulkmqDxJ7vPVD9
         4e6QIaHXJzrazq3g3MRKhI3HMUWCN97XHrSwLpvzkbx3DWgHQYs/6kjpVCJHpoNvwBzZ
         oiiJuLd5Q8zMT3XTRMkAHKUR9RhyjVMYd1yOuIOAeY0k4flPHXKevdwA1pW1VzmaXkbZ
         9K+ojEp7NSPstNQAGfpCdQrs/c3UZfsZii+8/uC0mekSJvYTnO8351N1oN1cT0a2xA/v
         YY+mnCrdXsgpTdaOcyQV49hnLiz/n1/FWlSKQCQ1f69B1OTVPKC38vXAX+LL5UX6XmHR
         Xzng==
X-Gm-Message-State: AOJu0Yy5ByTazbpvISsmoD5EAzaxO33HgFTKcci4X4nCfpMGZXv4mGx/
	pFYJDQzEPsMPm8r3JPbNvWGy/Lj/ApxUDDAZ4WWP0LnXSuVf03XFBtG0CJc3zCBahWNCVOuQd8e
	rpPr+dpwtEKjEs39d9XrYWdpAjDc11kVdN8APYWw109PO2flhBbCXao/GSbyfOQk2Vq7GKE9d/5
	GlfwPwxZL4w81aP2lRA3Q/SS56nOazo5qxAmR4ocRurLNg5EUb1FryS9OO
X-Gm-Gg: ASbGncsQtKl+XFGy50we9ZZMnsKBnhiEPrD+l/aLiNZgPBHx81yMDlELCtzQdllPnOT
	Hlfo8K1uMp2147hHhzJRdoaH7+LTJNnk6pIIj+/f4bUkDT/YCPt4et9rG9sEd
X-Received: by 2002:a05:6870:96a7:b0:29e:509c:3711 with SMTP id 586e51a60fabf-29e88611583mr5475016fac.15.1733313266396;
        Wed, 04 Dec 2024 03:54:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwNtBRj1a6Oig1wQNPMOX7J3gElLahKM+e/WFt9W2DcJnKUJX69cF+v6/fGKa1JigCuGVZtni+R40UsicskUU=
X-Received: by 2002:a05:6870:96a7:b0:29e:509c:3711 with SMTP id
 586e51a60fabf-29e88611583mr5475008fac.15.1733313266148; Wed, 04 Dec 2024
 03:54:26 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Dec 2024 03:54:25 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20241126143125.9980-2-heylenay@4d2.org>
References: <20241126143125.9980-2-heylenay@4d2.org>
Mime-Version: 1.0
Date: Wed, 4 Dec 2024 03:54:25 -0800
Message-ID: <CAJM55Z88=jq4brJeDuXF37yAHqQKCCs7L8gVOdHQhjVT7r-eZA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Add clock controller support for Spacemit K1
To: Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Haylen Chu <heylenay@outlook.com>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Inochi Amaoto <inochiama@outlook.com>, Chen Wang <unicornxdotw@foxmail.com>, 
	Jisheng Zhang <jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_035433_049056_36E09B7D 
X-CRM114-Status: GOOD (  18.40  )
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

Haylen Chu wrote:
> The clock tree of Spacemit K1 is managed by several independent
> controllers in different SoC parts. In this series, all clock hardwares
> in APBS, MPMU, APBC and APMU, are implemented. With some changes to UART
> driver, CPU cores and UARTs could be brought up (see below). More clocks
> will be implemented later soon.
>
> No device tree changes are included since Spacemit K1 UART needs two
> clocks to operate, but for now the driver gets only one. I would like to
> defer the changes until this is resolved.

Hi,

Do you have a git tree with these dt changes though? It's impossible to test
this patchset without them.

/Emil

>
> This driver has been tested on BananaPi-F3 board and successfully
> brought up I2C, RTC, mmc and ethernet controllers. A clock tree dump
> could be obtained here[1].
>
> [1]: https://gist.github.com/heylenayy/ebc6316692dd3aff56575dbf0eb4f1a9
>
> Link: https://developer.spacemit.com/documentation?token=LCrKwWDasiJuROkVNusc2pWTnEb
>
> Changed from v2
> - dt-binding fixes
> - misc improvements in code
> - drop unnecessary spinlock in the driver
> - implement missing bus clocks
> - Link to v2: https://lore.kernel.org/all/SEYPR01MB4221829A2CD4D4C1704BABD7D7602@SEYPR01MB4221.apcprd01.prod.exchangelabs.com/
>
> Changed from v1
> - add SoC prefix (k1)
> - relicense dt-binding header
> - misc fixes and style improvements for dt-binding
> - document spacemit,k1-syscon
> - implement all APBS, MPMU, APBC and APMU clocks
> - code cleanup
> - Link to v1: https://lore.kernel.org/all/SEYPR01MB4221B3178F5233EAB5149E41D7902@SEYPR01MB4221.apcprd01.prod.exchangelabs.com/
>
> Haylen Chu (3):
>   dt-bindings: clock: spacemit: Add clock controllers of Spacemit K1 SoC
>   dt-bindings: soc: spacemit: Add spacemit,k1-syscon
>   clk: spacemit: Add clock support for Spacemit K1 SoC
>
>  .../bindings/clock/spacemit,k1-ccu.yaml       |   57 +
>  .../soc/spacemit/spacemit,k1-syscon.yaml      |   86 +
>  drivers/clk/Kconfig                           |    1 +
>  drivers/clk/Makefile                          |    1 +
>  drivers/clk/spacemit/Kconfig                  |   20 +
>  drivers/clk/spacemit/Makefile                 |    5 +
>  drivers/clk/spacemit/ccu-k1.c                 | 1747 +++++++++++++++++
>  drivers/clk/spacemit/ccu_common.h             |   62 +
>  drivers/clk/spacemit/ccu_ddn.c                |  146 ++
>  drivers/clk/spacemit/ccu_ddn.h                |   85 +
>  drivers/clk/spacemit/ccu_mix.c                |  296 +++
>  drivers/clk/spacemit/ccu_mix.h                |  336 ++++
>  drivers/clk/spacemit/ccu_pll.c                |  198 ++
>  drivers/clk/spacemit/ccu_pll.h                |   80 +
>  include/dt-bindings/clock/spacemit,k1-ccu.h   |  246 +++
>  15 files changed, 3366 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/spacemit,k1-ccu.yaml
>  create mode 100644 Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
>  create mode 100644 drivers/clk/spacemit/Kconfig
>  create mode 100644 drivers/clk/spacemit/Makefile
>  create mode 100644 drivers/clk/spacemit/ccu-k1.c
>  create mode 100644 drivers/clk/spacemit/ccu_common.h
>  create mode 100644 drivers/clk/spacemit/ccu_ddn.c
>  create mode 100644 drivers/clk/spacemit/ccu_ddn.h
>  create mode 100644 drivers/clk/spacemit/ccu_mix.c
>  create mode 100644 drivers/clk/spacemit/ccu_mix.h
>  create mode 100644 drivers/clk/spacemit/ccu_pll.c
>  create mode 100644 drivers/clk/spacemit/ccu_pll.h
>  create mode 100644 include/dt-bindings/clock/spacemit,k1-ccu.h
>
>
> base-commit: 2d5404caa8c7bb5c4e0435f94b28834ae5456623
> prerequisite-patch-id: 47dcf6861f7d434d25855b379e6d7ef4ce369c9c
> prerequisite-patch-id: 77787fe82911923aff15ccf565e8fa451538c3a6
> prerequisite-patch-id: b0bdb1742d96c5738f05262c3b0059102761390b
> prerequisite-patch-id: 3927d39d8d77e35d5bfe53d9950da574ff8f2054
> prerequisite-patch-id: a98039136a4796252a6029e474f03906f2541643
> prerequisite-patch-id: c95f6dc0547a2a63a76e3cba0cf5c623b212b4e6
> prerequisite-patch-id: 66e750e438ee959ddc2a6f0650814a2d8c989139
> prerequisite-patch-id: 29a0fd8c36c1a4340f0d0b68a4c34d2b8abfb1ab
> prerequisite-patch-id: 0bdfff661c33c380d1cf00a6c68688e05f88c0b3
> prerequisite-patch-id: 99f15718e0bfbb7ed1a96dfa19f35841b004dae9
> --
> 2.47.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
