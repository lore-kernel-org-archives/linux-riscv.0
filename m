Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CB6606A31A
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 00:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P/V8w6rN;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=E9fJI3Ds
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=l8i8M0/Bw5FwK/dIecs+oe9/7xNmtKZwnhZ0xOeoIdc=; b=P/V8w6rNDL7q4+3MAkz13NVE2V
	sCs7hDhWYLrtAMPaSmoXbPLC+5c4l39dPcuRiAPCt+yMOCx41t3jS1G3gFwYZv5YUwVsvG0LkgEiS
	ckYvnvUs2XBj3SA9qmnKqGMsHuUcRt8udD5n5D9MAQjKxsQDqz6U7TViHom6GlidTdqZX7FEa1ov1
	fPE4OPAOTC2QcRwd5WWIwdeXLxd4bHZ4A+s+iIuVEwtuDN31dB7cl+ZDcSDK2ijs4knW1AN0B+ZiE
	18p4n5Vx/906YFYHDN4EiYMmTja8ZKa7DvRxqHUPD77BTWGM0FyevGIQTsr/7Ue6vBDU9aPyzyoi9
	yOrznqcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVIMu-000000022cD-321D;
	Mon, 23 Nov 2026 00:57:16 +0000
Received: from out-51.mta1.migadu.com ([2001:41d0:203:375::33] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVIMl-000000022Wq-1um2
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 00:57:15 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=eWEFZWHZfFCAhK2XmNa/wVqm+6q8zSGaxKeXW6zWVNY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795395423; v=1; x=1796000223;
 b=E9fJI3DsDB5cz5isO/HQiSAo1jOm3YV9R/iPtuUpw2slYkkPM0HkaIM4ab8iCv8piiKJAk3y
 ZOZQ+Dg1c6jNCTN2wjfaruu1fLN4F7b/FeoILjEt84Acn6qMWaHoER+ZmzJvVe63hnDg7KDAzHx
 vexa9QqkEWgeWIDb3m1lisUw=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 8e70aef377a98481;
	Mon, 23 Nov 2026 00:57:03 +0000
X-Mizu-Trace-ID: 8e70aef377a98481
X-Migadu-Flow: FLOW_OUT
Message-ID: <40455616-b1af-4801-865c-187bcb2e0c39@linux.dev>
Date: Mon, 23 Nov 2026 08:56:56 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] riscv: dts: sophgo: make sg2002-milkv-duo256m-eth
 overlay generic
To: Hiago De Franco <hfranco@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Chen-Yu Yeh <chenyou910331@gmail.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261104-milkv-duo-eth-overlay-v2-0-e3d2d39cf229@baylibre.com>
 <20261104-milkv-duo-eth-overlay-v2-1-e3d2d39cf229@baylibre.com>
From: Chen Wang <chen.wang@linux.dev>
In-Reply-To: <20261104-milkv-duo-eth-overlay-v2-1-e3d2d39cf229@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_165707_955644_35E0F6E9 
X-CRM114-Status: GOOD (  13.99  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/4/2026 10:52 PM, Hiago De Franco wrote:
> The overlay only enables gmac0 and the MDIO mux, which are common to the
> CV180x and SG200x SoCs, so it can be reused by other boards such as the
> Milk-V Duo (CV1800B).
>
> Rename it to cv18xx-eth.dtso.
>
> Signed-off-by: Hiago De Franco <hfranco@baylibre.com>

Reviewed-by: Chen Wang <chen.wang@linux.dev>

Thanks.

> ---
>   arch/riscv/boot/dts/sophgo/Makefile                                   | 4 ++--
>   .../dts/sophgo/{sg2002-milkv-duo256m-eth.dtso => cv18xx-eth.dtso}     | 3 ++-
>   2 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
> index 49639cb0888b..440acd0aa55a 100644
> --- a/arch/riscv/boot/dts/sophgo/Makefile
> +++ b/arch/riscv/boot/dts/sophgo/Makefile
> @@ -1,12 +1,12 @@
>   # SPDX-License-Identifier: GPL-2.0
>   dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
>   dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
> +dtb-$(CONFIG_ARCH_SOPHGO) += cv18xx-eth.dtbo
>   dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
>   dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
>   dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-milkv-duo256m.dtb
> -sg2002-milkv-duo256m-eth-dtbs := sg2002-milkv-duo256m.dtb sg2002-milkv-duo256m-eth.dtbo
> +sg2002-milkv-duo256m-eth-dtbs := sg2002-milkv-duo256m.dtb cv18xx-eth.dtbo
>   dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-milkv-duo256m-eth.dtb
> -dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-milkv-duo256m-eth.dtbo
>   dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
>   dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
>   dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v2.dtb
> diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m-eth.dtso b/arch/riscv/boot/dts/sophgo/cv18xx-eth.dtso
> similarity index 66%
> rename from arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m-eth.dtso
> rename to arch/riscv/boot/dts/sophgo/cv18xx-eth.dtso
> index cc93746d932c..cdb8db063977 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m-eth.dtso
> +++ b/arch/riscv/boot/dts/sophgo/cv18xx-eth.dtso
> @@ -1,6 +1,7 @@
>   // SPDX-License-Identifier: (GPL-2.0 OR MIT)
>   /*
> - * Enable ethernet on Milk-V Duo 256M with the USB & Ethernet IO board.
> + * Enable ethernet on boards that use the internal ethernet PHY of the
> + * CV180x and SG200x SoCs.
>    *
>    * Copyright (c) 2026, Chen-Yu Yeh <chenyou910331@gmail.com>
>    */
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
