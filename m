Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 366D6C41513
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Aug 2023 10:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tLoR1NeBC3bsrNcfo2xjcR8zVf3346GsLJMLWC87gpE=; b=Vz7DJU0BAhdVCR
	kj2NgFJlXbk7S6Lv3ozG8QZUdC5qRj2VoOsMZjkRsraHlyS4A7ldNirsxlk60M2+7k5BL59E/4vI+
	sc0ToSecfMazI2PjbwVLTgmKUhzr9oKmzUUvW4IwBXkrAcFdYs2z5n5M5rW1CbTadzNiTTt1k8nYG
	N6/qZQ1YiFwMyY9qm+PcQkYUOn7lKgvjaoshxU8zqkQAYD/vdaJoDdD/Xv52z6pc/EUepD+YgXgUI
	Mxh3Aa0aR5Z/ppuH0PaPnUNMqsbZQjpjgrvKdTHkSlow+jlot1ceNvOpvN4ywxoNLDXBEL2GUVt4N
	QJLYEsHIxwt/OR6OiJ2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSacW-00FANX-1L;
	Sun, 06 Aug 2023 10:04:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSacT-00FALs-0y
	for linux-riscv@lists.infradead.org;
	Sun, 06 Aug 2023 10:04:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3465261016;
	Sun,  6 Aug 2023 10:03:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FDD0C433C7;
	Sun,  6 Aug 2023 10:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691316236;
	bh=qQdlDvWcY55UI4xJZRVgfN/DeT4JnF2lo47IlKtWxBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fhstg5yZNrU6Mr63+O2DUHYI61MkDUhbHygY9MOVisRC5TpCh0P33b6bZnVOAka0v
	 KDLZ7CCsw/USQ6c6aJvH9vBbsidxD75f5QGsnI4X/GvbbxGimOsv1WlWwX8uw8whIW
	 OHrUHPeOX10w87kA4tuRWX9KWv3GMsbfecxCuZe6w0Ae2+FzzvJ0Pg5YLaMf/UNh4u
	 fx3LM8byNZsr3uzv79s/3Q0Ep76blL4BmT/2XzVRFuotXYkwL5S/JoLmDcJCiKojUx
	 s01l9brhiR3ulcENLKHstfHnBcShjIX+Cg35Cn52HisMlIyXdlM3lV5cRMzVDqVyAn
	 sgpGuGGu9SLLg==
Date: Sun, 6 Aug 2023 17:52:16 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Drew Fustini <dfustini@baylibre.com>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: change TH1520 files to dual license
Message-ID: <ZM9tUFddbRUglwfG@xhacker>
References: <20230724182129.843687-1-dfustini@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230724182129.843687-1-dfustini@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230806_030417_446856_9A4ABBE8 
X-CRM114-Status: GOOD (  17.35  )
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

On Mon, Jul 24, 2023 at 11:21:29AM -0700, Drew Fustini wrote:
> Modify the SPDX-License-Identifier for dual license of GPL-2.0 OR MIT.
> 
> Signed-off-by: Drew Fustini <dfustini@baylibre.com>
> ---
>  arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi | 2 +-
>  arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts      | 2 +-
>  arch/riscv/boot/dts/thead/th1520.dtsi                  | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> Jisheng Zhang and Guo Ren - I thought I would post this patch based on
> the discussion in the thread about the BeagleV Ahead patches.

I need Guo's ack to this patch. Hi Guo Ren, are you OK with this patch?

Thanks

> 
> Message-ID:
> 20230722-upstream-beaglev-ahead-dts-v1-0-ccda511357f4@baylibre.com
> 
> Thanks,
> Drew
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> index 4b0249ac710f..a802ab110429 100644
> --- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: GPL-2.0
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>  /*
>   * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
>   */
> diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> index a1248b2ee3a3..9a3884a73e13 100644
> --- a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> +++ b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: GPL-2.0
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>  /*
>   * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
>   */
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index 56a73134b49e..ce708183b6f6 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: GPL-2.0
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>  /*
>   * Copyright (C) 2021 Alibaba Group Holding Limited.
>   * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
