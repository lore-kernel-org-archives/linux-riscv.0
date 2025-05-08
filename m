Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E64C3ABC0
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 05:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zS8rOBoXkmQZHB0GvNZ2PBeICEyXWVNyScpqPB8+kUw=; b=hs19q2nZXl+M8k
	wNvdrqjtLEhR75TVRPSlvUjjy+up1E3dQyvx/ww39kl+qSLwEp+bTgbxToOsJcPAkH35zxcxGYR1N
	+3xr8f+jTepsxpA1rRXQmteEhkc0ZINbOF4AJFjSInQDv/Ko29OhgXDxfR3TxpRdxJzO/LGUQsKAo
	+v8cTcE/GSPWbbEmJ+DjicN1vZYu9U64HyvV4ZG9RBrANzncVI03M7Md8//hfOLjfb3cBJR657bh7
	n0tz8oHRSS00nC8SUpPJ9Za+BdSyPgu0U+LlNgA31/LEt78BmvW69rcxtIzY1X9sTDT9itZ9wEgvR
	09K8yAfzRVvU5LL67jbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCtzT-0000000HO7A-0oB8;
	Thu, 08 May 2025 05:40:15 +0000
Received: from bayard.4d2.org ([155.254.16.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCtyB-0000000HO25-1Yoo
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 05:38:56 +0000
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 96FA612FB444;
	Wed, 07 May 2025 22:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1746682733; bh=dDCrl7bkwo/0S+4APKJnm3R6af9SQELqg9M5HZnlgFc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bnXy1y85/b2c9u9GelQ+EWxYmOcP25x/X4mu7n3Hk7WxQvGvHJTEKvMRInDeQGJON
	 CJydroNKSYlW2P7BMVwe/YZsoPToMgaBv1AZQhOe4MJ9rZ2T3YKi3APDRyiStx2jB6
	 8mblpqic/vFCLea7qgCZ8lrUA7iDUqsTZ3cBen8ckgA57SMXpbI2OjUfl/qJA1rV/1
	 Whhf+bHiDao2TW1lh+UJ1ngRYdzfYU9Kp0krWuZA+EOAQhA/IOY6RoqBvAPWCMiBD+
	 A76ndalXqqA/XDH1iao5VF9INz7gn2GDNBBKwSpa1zMapbYS1LlHzKoS4ex+QC1Vpi
	 j0pMZEGkzPzeQ==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oLEJHnSxcwgL; Wed,  7 May 2025 22:38:19 -0700 (PDT)
Received: from ketchup (unknown [183.217.82.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 7773212FB404;
	Wed, 07 May 2025 22:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1746682699; bh=dDCrl7bkwo/0S+4APKJnm3R6af9SQELqg9M5HZnlgFc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1ZCSTR2UamB34rz6a0We4Hxm+i7shGD78C0zzsPrCYtO4ElKKXZ5B1r9CyF1Bnwvw
	 3xhCO7GIr8ibHgQMnZKZJwMbIijgOg3JD/gtXWviUPE+cCwYtaKhJcIX8DVs90Z3Av
	 it6iWm2SnKOY3j1fjQ3XUtkJLCPMaKxt6g93++gr1gJa5FqEe761gCbSIYgkX78atw
	 j87r5jc5yIgagwzEmUGRnlzgZY1Vq4E1ENA5TUDStsGuFSrXbCCj70r+5sh8NAS6Si
	 yPuNjkXVh5c7CWQmp0ZAygwvP6ei3Cq2evvtm3qUv7szHCke/dFSTDew6PEkysSGcS
	 q1J5WYq0dbQpA==
Date: Thu, 8 May 2025 05:38:11 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Alex Elder <elder@riscstar.com>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	p.zabel@pengutronix.de, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	dlan@gentoo.org
Cc: inochiama@outlook.com, guodong@riscstar.com, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 4/6] reset: spacemit: add support for SpacemiT CCU
 resets
Message-ID: <aBxDQ1_2xJjGlwNf@ketchup>
References: <20250506210638.2800228-1-elder@riscstar.com>
 <20250506210638.2800228-5-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250506210638.2800228-5-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_223855_744728_4B5B2B10 
X-CRM114-Status: GOOD (  22.88  )
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

On Tue, May 06, 2025 at 04:06:35PM -0500, Alex Elder wrote:
> Implement reset support for SpacemiT CCUs.  The code is structured to
> handle SpacemiT resets generically, while defining the set of specific
> reset controllers and their resets in an SoC-specific source file.  A
> SpacemiT reset controller device is an auxiliary device associated with
> a clock controller (CCU).
> 
> This initial patch defines the reset controllers for the MPMU, APBC, and
> MPMU CCUs, which already defined clock controllers.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  drivers/reset/Kconfig           |   1 +
>  drivers/reset/Makefile          |   1 +
>  drivers/reset/spacemit/Kconfig  |  12 +++
>  drivers/reset/spacemit/Makefile |   7 ++
>  drivers/reset/spacemit/core.c   |  61 +++++++++++
>  drivers/reset/spacemit/core.h   |  39 +++++++
>  drivers/reset/spacemit/k1.c     | 177 ++++++++++++++++++++++++++++++++
>  7 files changed, 298 insertions(+)
>  create mode 100644 drivers/reset/spacemit/Kconfig
>  create mode 100644 drivers/reset/spacemit/Makefile
>  create mode 100644 drivers/reset/spacemit/core.c
>  create mode 100644 drivers/reset/spacemit/core.h
>  create mode 100644 drivers/reset/spacemit/k1.c
> 

...

> diff --git a/drivers/reset/spacemit/Kconfig b/drivers/reset/spacemit/Kconfig
> new file mode 100644
> index 0000000000000..4ff3487a99eff
> --- /dev/null
> +++ b/drivers/reset/spacemit/Kconfig
> @@ -0,0 +1,12 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config RESET_SPACEMIT
> +	bool
> +
> +config RESET_SPACEMIT_K1
> +	tristate "SpacemiT K1 reset driver"
> +	depends on ARCH_SPACEMIT || COMPILE_TEST
> +	select RESET_SPACEMIT
> +	default ARCH_SPACEMIT
> +	help
> +	  This enables the reset controller driver for the SpacemiT K1 SoC.

With auxiliary bus introduced, Kconfig entries for both the reset and
clock should select AUXILIARY_BUS, or building defconfig will fail with
undefined references,

        riscv64-unknown-linux-musl-ld: drivers/clk/spacemit/ccu-k1.o: in function `k1_ccu_probe':
        ccu-k1.c:(.text+0x19c): undefined reference to `auxiliary_device_init'
        riscv64-unknown-linux-musl-ld: ccu-k1.c:(.text+0x226): undefined reference to `__auxiliary_device_add'
        riscv64-unknown-linux-musl-ld: drivers/reset/spacemit/k1.o: in function `spacemit_k1_reset_driver_init':
        k1.c:(.init.text+0x1a): undefined reference to `__auxiliary_driver_register'
        riscv64-unknown-linux-musl-ld: drivers/reset/spacemit/k1.o: in function `spacemit_k1_reset_driver_exit':
        k1.c:(.exit.text+0x10): undefined reference to `auxiliary_driver_unregister'

> diff --git a/drivers/reset/spacemit/Makefile b/drivers/reset/spacemit/Makefile
> new file mode 100644
> index 0000000000000..3a064e9d5d6b4
> --- /dev/null
> +++ b/drivers/reset/spacemit/Makefile
> @@ -0,0 +1,7 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_RESET_SPACEMIT)			+= reset_spacemit.o

As RESET_SPACEMIT is defined as bool, the reset driver will never be
compiled as a module... so either the RESET_SPACEMIT_K1 should be
limited to bool as well or you could take an approach similar to the
clock driver.

> +reset_spacemit-y				:= core.o
> +
> +reset_spacemit-$(CONFIG_RESET_SPACEMIT_K1)	+= k1.o

...

> new file mode 100644
> index 0000000000000..19a34f151b214
> --- /dev/null
> +++ b/drivers/reset/spacemit/k1.c

...

> +MODULE_DEVICE_TABLE(auxiliary, spacemit_k1_reset_ids);
> +
> +#undef K1_AUX_DEV_ID
> +
> +static struct auxiliary_driver spacemit_k1_reset_driver = {
> +	.probe          = spacemit_k1_reset_probe,
> +	.id_table       = spacemit_k1_reset_ids,
> +};
> +module_auxiliary_driver(spacemit_k1_reset_driver);
> -- 
> 2.45.2

If you're willing to make the reset driver buildable as a module, please
add MODULE_{LICENSE,DESCRIPTION} statements and possibly also
MODULE_AUTHOR(), or modpost will complain,

	ERROR: modpost: missing MODULE_LICENSE() in drivers/reset/spacemit/reset_spacemit.o
	WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/reset/spacemit/reset_spacemit.o

Best regards,
Haylen Chu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
