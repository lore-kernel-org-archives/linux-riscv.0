Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 931D7C4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Apr 2024 09:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=k4kx3S4d1esSSkgJEDdkXawAQg/7k8w1PCcJvCvlPj0=; b=Mbla7l8bWJUAke3fAIt8C0llaj
	FWZZ5+gPNsVJlfn4xQtEk6NwRNLAO1Yx/7rQAmJtYJzDo5HQTbVsE9PA6a21LYZKp3XWtWmHBTSme
	ajk5Dk5iyLgBGBQGjqE9XyibdEnD3VqOoW3q+nCQufAZe+flBBDAOV3uKgxW3TfXsvob8zevXQict
	4Cwy/ujzrw7Kkb53kBH1cJZuxwAtNo4qgZXYqfXPKGkeG8I4bU38t0WbR0Ln1Xu8pLRFh/onALtWN
	z0LhhYn/oEndq1DSy/0xMKubHvU08DEq03toFxp5GJUNMauRQOMgnz98lmYYJ2wXvIaK3RkkKQDR3
	XIhF/rHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx1Rr-0000000FNvs-46vR;
	Wed, 17 Apr 2024 09:19:24 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx1Rm-0000000FNv8-49Ac
	for linux-riscv@lists.infradead.org;
	Wed, 17 Apr 2024 09:19:22 +0000
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id AE9623F85E
	for <linux-riscv@lists.infradead.org>; Wed, 17 Apr 2024 09:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1713345554;
	bh=qhuG40DJvZsmT8TFUp63E0ooH+vwf0bt2nPoDMSQGaQ=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=e3TkAZNHL8arYvr8SHLD5jGt7V2LgYBfwTYE7+dUemE2ct9hlBtez4kDRlRp9BeDx
	 PE4ehOKw64qJlGcAp5N7L8L3id0INnAoLEXhQjOO19EfKyePSsc5B0kB7KxNj5r16r
	 S6k2u20IAZc6+IArN5fsnsH5Zo0KKadkBela4WfpXzn0gBXc1h4Xme7ZoNz6qn780G
	 hUKRFJpEmAppsu/Z+DIVAtdWEWgj3acVqdrhOX4Up51o8M9OooI5QmlDJENBwgEFmb
	 VyfHO8qB3uY92CKX5Zrwnvpcr3jnedmdam05myGHRlt33P0ETqyhHs7Rjvj0fxhEEL
	 8oLrMKxz/6+lQ==
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4377949a027so3805661cf.0
        for <linux-riscv@lists.infradead.org>; Wed, 17 Apr 2024 02:19:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713345553; x=1713950353;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qhuG40DJvZsmT8TFUp63E0ooH+vwf0bt2nPoDMSQGaQ=;
        b=VS999pMT8OKpZaES0Fkf7D3Uy22vgytmWjJNoHW9/L+3kknvQFCcDQFgMCdeuNjDxd
         F6xN5IHBJv+0HoRnKfHAi9+KRUhhLFCoi7ATyHD4kCZ7NmAh2XSfxmRGpw1Vvfx6F1x9
         jrp53cfmOCZqQ/HBfU/35QklKKWJRxpTAtSYQXzQQRc+gtvE3j1tVbSv0IFy/B4UVvTM
         CI08wNz3tOC7w7kXZceUsfAP2eOeacJMKEDZzOit34CPVGlKGgxgC8W4/lGzaTSuH2AG
         +VLGUDPjLz0v8euhskRoDclsJv8gDr0AUvAwKlt0ZGMdFejrsOqGfzM0IDBQU+BeT30A
         F1Vw==
X-Gm-Message-State: AOJu0YxMidxxhDQd/JSiuUK2lEHnEGiusgxD7RvZj4s4swlRWx8WFZ97
	No+T5K9jw/z9cWE7KkvBMonvw8iI6tSV/s/qXVXp1htkAaoRfuUGA+RpH7Jjforkhs3zNAI822f
	e7Ps2LUEmEKwbESGF708qByhdIzdlRQHVL5twq3H7aINEqheQujoUpI92bQsIZH6PrzS+bma/zt
	5bZZTHDkrpPCt/NzuPgNGyZZkS+oLPNOywzUdeuPHd7fULm0ApbfNLDdkx
X-Received: by 2002:ac8:60ca:0:b0:437:3676:b3f with SMTP id i10-20020ac860ca000000b0043736760b3fmr7318923qtm.4.1713345553755;
        Wed, 17 Apr 2024 02:19:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHC3w5YmtmoerVBKqzM3Bbvc/a6n2Vl+sG5Y1pQzXcyvnGkE+tQR+6lfnc3jEGRiIPflmLz+jl7Td3noJPP7Oc=
X-Received: by 2002:ac8:60ca:0:b0:437:3676:b3f with SMTP id
 i10-20020ac860ca000000b0043736760b3fmr7318904qtm.4.1713345553432; Wed, 17 Apr
 2024 02:19:13 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 17 Apr 2024 05:19:12 -0400
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240417065311.3881023-1-michael.opdenacker@bootlin.com>
References: <20240417065311.3881023-1-michael.opdenacker@bootlin.com>
Mime-Version: 1.0
Date: Wed, 17 Apr 2024 05:19:12 -0400
Message-ID: <CAJM55Z8D7K5KA_POE8aUCPEHn9xXHL3Q=T7fs79eLAJyzsJ6Mw@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] add initial Milk-V Duo S board support
To: michael.opdenacker@bootlin.com, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>
Cc: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_021919_556035_CFD971B5 
X-CRM114-Status: GOOD (  17.75  )
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

michael.opdenacker@ wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> This adds an initial device tree for the Milk-V Duo S board.
> Last tested on linux-next on April 17, 2024.

Hi Michael.

Sorry for the late reply. It seems to me like spaces are usually repaced by
dashes (-'s) in device trees, so I would have expected milkv,duo-s and
sg2000-milkv-duo-s.dts so it's not confused with a Milk-V Duos board.

/Emil

>
> - Changes in V5
>   - Fix the commit message describing the board DTS.
>     MMC is not supported yet.
>
> - Changes in V4
>   - Remove mmc device (&sdhci0) as not working yet with linux-next
>   - Use "sophgo,cv1812h" compatible as on the Huashan Pi board.
>     Should I call the DTS cv1812h-milkv-duos.dts instead
>     of sg2000-milkv-duos.dts?
>
> - Changes in V3
>   - Fix enum in devicetree/bindings/riscv/sophgo.yaml
>
> - Changes in V2:
>   - Add a first patch to register the new compatible string
>     for this board.
>   - Use a correct SoC compatible string
>   - Add "disable-wp" (disable write protect) property
>     to enable write access to the external SD card.
>
> Michael Opdenacker (2):
>   dt-bindings: riscv: add Milk-V Duo S board compatibles
>   riscv: dts: sophgo: add initial Milk-V Duo S board support
>
>  .../devicetree/bindings/riscv/sophgo.yaml     |  1 +
>  arch/riscv/boot/dts/sophgo/Makefile           |  1 +
>  .../boot/dts/sophgo/sg2000-milkv-duos.dts     | 34 +++++++++++++++++++
>  3 files changed, 36 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/sophgo/sg2000-milkv-duos.dts
>
> --
> 2.34.1
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
