Return-Path: <SRS0=7IGV=XB=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CB3BC43331
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  6 Sep 2019 22:27:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 618DB207FC
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  6 Sep 2019 22:27:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NbPwuGQ5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="YupL3jZr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 618DB207FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RYWhHbta98aP4m+n+WWmJtGi//l7rwRc9kwVf5WcE9Q=; b=NbPwuGQ5DPL8db
	MPucxfkiyym5wLlMUPTn5+sGOhZJXJfto01MrP4PAQOGvwIMnQBde9D5nVfOZbXcEZuWRw7C1ZcQv
	fTcR7EesBGmHJxXRTvf56T/BUmXjbkM9JmCl/DOyW1e9/6+oVd8VhYNYlsZhAVe2VLG329o/80Lxo
	mXqmP5srSpzpLqDyE0sYPbB+VIYBkIgeU7/VK6s+k3igIkO9w1I9rz8+g5Ircrchgy1HtDJFIZ0EI
	XofhSlKj1ozmOqeJAcPkrLDHAEH3ZjameEryIzpUaUA2FmzUfh1SgByeJCh5f7EIeF4HTNkThwoA5
	IZOzmFJO3nT6RBrjaVIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i6Mhr-0001ax-It; Fri, 06 Sep 2019 22:27:51 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i6Mhn-0001a8-Vu
 for linux-riscv@lists.infradead.org; Fri, 06 Sep 2019 22:27:49 +0000
Received: by mail-io1-xd44.google.com with SMTP id b136so16377470iof.3
 for <linux-riscv@lists.infradead.org>; Fri, 06 Sep 2019 15:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=8UChFRti7FriSKfd749PLP6AnWejrsOvB1UAiDMJe3s=;
 b=YupL3jZr/TWgAojD2Ci7M0GvJ+WdRcFE8WDZnIFv/N6RgArGLyiY5qbGsdraqSuraE
 iWP8AtBHFnAGhl+d9fk3PrEQSwnEJNt7BxH5d/IH/ty5yXUttOKB0kUoHUNAlHGOHM5A
 BKl7Z9xaKLYVKf0oWs4Fi1LhyoqHwisD8upJ+TE0CNInnHWeaeqRWBkz996JdLrsTrjK
 Lb1uHuAOnPqgGGjP6EH0xCFZXzryDbi6UWLrc7Aydx3kPdr5KtqgIR+wRonLB1jbhNmN
 Wj3eFnVJ3sVfXKXHfuVPrhlOR7vK/YKTEJ5ZHT8xTHJcWaZviYwoXONTcr9QxXNrbriK
 XQzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=8UChFRti7FriSKfd749PLP6AnWejrsOvB1UAiDMJe3s=;
 b=BfGOZ5fXp6UG8q/J/8kClyXIRbK6G83Iz4DyEfeBirIzOLq1WW3l0tXKbMIDGFv116
 icaGwRec/SzfGP8eSTY1Bv3VMfyqxizv9xmfJS8QfGsEkA4z0YkqXPzPRvOtfqo7yXlD
 inQcGvXP6QefPqbagVrrsh1Mm7vNvtQSJEXA+Yi8TgOPCs4b6GmCpevxV22cCl6y8aOL
 DuOnt75HiD9ESxTQN945aS5NORh/3CzG5afKwS2noyuwO1/kE0mVnuoE2MnhLfYIyP5L
 TZF7ONyJa0pMG9uT+E+sC38JtzkshIJhFjGuWOR6GH9tD3jf5r/cB4s9NUQoWLrufCXz
 uyKg==
X-Gm-Message-State: APjAAAW+ne3jyBddUz8YS+0jTzHEsIuDXz2r5Iokp9ycHV8MgBfjnI82
 BJtecRs9XKEI/tBL88f6JDcWrA==
X-Google-Smtp-Source: APXvYqz6f3d1f7tO/KV0O5SAVfRLbfjlx9lkm8ZmPnAeOjQ8XT1oSirK57IB5SNTZ6UgHwq6dHAj1g==
X-Received: by 2002:a6b:c947:: with SMTP id z68mr14000572iof.132.1567808866295; 
 Fri, 06 Sep 2019 15:27:46 -0700 (PDT)
Received: from localhost (75-161-11-128.albq.qwest.net. [75.161.11.128])
 by smtp.gmail.com with ESMTPSA id a22sm5346826iot.80.2019.09.06.15.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2019 15:27:45 -0700 (PDT)
Date: Fri, 6 Sep 2019 15:27:44 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] riscv: move sifive_l2_cache.c to drivers/soc
In-Reply-To: <20190818082935.14869-1-hch@lst.de>
Message-ID: <alpine.DEB.2.21.9999.1909061525040.6292@viisi.sifive.com>
References: <20190818082935.14869-1-hch@lst.de>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190906_152748_098044_8809CC1D 
X-CRM114-Status: GOOD (  22.12  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: palmer@sifive.com, linux-kernel@vger.kernel.org, bp@alien8.de,
 linux-riscv@lists.infradead.org, mchehab@kernel.org,
 linux-edac@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 18 Aug 2019, Christoph Hellwig wrote:

> The sifive_l2_cache.c is in no way related to RISC-V architecture
> memory management.  It is a little stub driver working around the fact
> that the EDAC maintainers prefer their drivers to be structured in a
> certain way that doesn't fit the SiFive SOCs.
> 
> Move the file to drivers/soc and add a Kconfig option for it, as well
> as the whole drivers/soc boilerplate for CONFIG_SOC_SIFIVE.

The code in the patch looks OK to me.  However, two topics that need 
action:

- Since the patch doesn't fix any bugs, there shouldn't be a Fixes: line.  
Please let me know whether I can drop the line locally before I apply the 
patch, or whether you'd like to resend it.

- Since the patch touches drivers/edac/Kconfig, it needs to be acked by 
the EDAC maintainers.  I've added them to this message, but I need you to 
do the work of chasing down the ack, as is standard Linux practice.

If we can get those within the next few days, I'll add it to the queue for 
v5.4-rc1.

thanks -

- Paul

> 
> Fixes: a967a289f169 ("RISC-V: sifive_l2_cache: Add L2 cache controller driver for SiFive SoCs")
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/riscv/mm/Makefile                                 |  1 -
>  drivers/edac/Kconfig                                   |  2 +-
>  drivers/soc/Kconfig                                    |  1 +
>  drivers/soc/Makefile                                   |  1 +
>  drivers/soc/sifive/Kconfig                             | 10 ++++++++++
>  drivers/soc/sifive/Makefile                            |  4 ++++
>  .../riscv/mm => drivers/soc/sifive}/sifive_l2_cache.c  |  0
>  7 files changed, 17 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/soc/sifive/Kconfig
>  create mode 100644 drivers/soc/sifive/Makefile
>  rename {arch/riscv/mm => drivers/soc/sifive}/sifive_l2_cache.c (100%)
> 
> diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
> index 74055e1d6f21..d2101d0741d4 100644
> --- a/arch/riscv/mm/Makefile
> +++ b/arch/riscv/mm/Makefile
> @@ -11,6 +11,5 @@ obj-y += extable.o
>  obj-y += ioremap.o
>  obj-y += cacheflush.o
>  obj-y += context.o
> -obj-y += sifive_l2_cache.o
>  
>  obj-$(CONFIG_HUGETLB_PAGE) += hugetlbpage.o
> diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
> index 200c04ce5b0e..9241b3e7a050 100644
> --- a/drivers/edac/Kconfig
> +++ b/drivers/edac/Kconfig
> @@ -462,7 +462,7 @@ config EDAC_ALTERA_SDMMC
>  
>  config EDAC_SIFIVE
>  	bool "Sifive platform EDAC driver"
> -	depends on EDAC=y && RISCV
> +	depends on EDAC=y && SIFIVE_L2
>  	help
>  	  Support for error detection and correction on the SiFive SoCs.
>  
> diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
> index 833e04a7835c..1778f8c62861 100644
> --- a/drivers/soc/Kconfig
> +++ b/drivers/soc/Kconfig
> @@ -14,6 +14,7 @@ source "drivers/soc/qcom/Kconfig"
>  source "drivers/soc/renesas/Kconfig"
>  source "drivers/soc/rockchip/Kconfig"
>  source "drivers/soc/samsung/Kconfig"
> +source "drivers/soc/sifive/Kconfig"
>  source "drivers/soc/sunxi/Kconfig"
>  source "drivers/soc/tegra/Kconfig"
>  source "drivers/soc/ti/Kconfig"
> diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
> index 2ec355003524..8b49d782a1ab 100644
> --- a/drivers/soc/Makefile
> +++ b/drivers/soc/Makefile
> @@ -20,6 +20,7 @@ obj-y				+= qcom/
>  obj-y				+= renesas/
>  obj-$(CONFIG_ARCH_ROCKCHIP)	+= rockchip/
>  obj-$(CONFIG_SOC_SAMSUNG)	+= samsung/
> +obj-$(CONFIG_SOC_SIFIVE)	+= sifive/
>  obj-y				+= sunxi/
>  obj-$(CONFIG_ARCH_TEGRA)	+= tegra/
>  obj-y				+= ti/
> diff --git a/drivers/soc/sifive/Kconfig b/drivers/soc/sifive/Kconfig
> new file mode 100644
> index 000000000000..9ffb2e8a48cd
> --- /dev/null
> +++ b/drivers/soc/sifive/Kconfig
> @@ -0,0 +1,10 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +if SOC_SIFIVE
> +
> +config SIFIVE_L2
> +	tristate "Sifive L2 Cache controller"
> +	help
> +	  Support for the L2 cache controller on SiFive platforms.
> +
> +endif
> diff --git a/drivers/soc/sifive/Makefile b/drivers/soc/sifive/Makefile
> new file mode 100644
> index 000000000000..9b4a85558347
> --- /dev/null
> +++ b/drivers/soc/sifive/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_SIFIVE_L2)	+= sifive_l2_cache.o
> +
> diff --git a/arch/riscv/mm/sifive_l2_cache.c b/drivers/soc/sifive/sifive_l2_cache.c
> similarity index 100%
> rename from arch/riscv/mm/sifive_l2_cache.c
> rename to drivers/soc/sifive/sifive_l2_cache.c
> -- 
> 2.20.1
> 
> 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
