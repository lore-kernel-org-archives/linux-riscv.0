Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5352C7115B
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jun 2025 15:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J3pCrRUU6A6mCnjYPo5yrNny6YltqhRI7zfS0y0YKhk=; b=XNZOxX7BgqnW+A
	thau86QlPhlxTwmYikAu2b8dJ1KqY1An6BCzf6oTet8T5persBxMgVp3soTXD3WDOjkIRdt8sO423
	nTql78lZVoQ+PX/C5N1kRdgcYVmerrxvvWZZqc17DWJZZ5wBYWOpq1LET93wSRV3eTEe8TcL/5EtB
	SlJCmimVfCE93Pg8BIEYVyX1bLSh5fjQ25fTanxPi6xwGC6H1SY/IwqN+IL3eOkh7eIpWSL2/mHlW
	IEH8j7PzFhohstQZsfYYOEjAeHLTGXxvga7fqoNCQOvvK+MoeVzvpfcNwB8AKo4uEC4VeGfLS/ujQ
	clzWZ1aX1qkyGo6d73Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHRi-0000000DRlj-3e69;
	Thu, 19 Jun 2025 15:44:58 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSDJl-0000000Cqc2-40QW
	for linux-riscv@lists.infradead.org;
	Thu, 19 Jun 2025 11:20:31 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-e819aa98e7aso620769276.2
        for <linux-riscv@lists.infradead.org>; Thu, 19 Jun 2025 04:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750332029; x=1750936829; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PBUsi0YBNMAsSBVKTalCtjkPCy5c9CLBxMjhKRUhDZY=;
        b=OhViIR9+VfK47NaWtUC6AThiQucgu+1irL+BsUfnHKdMa9ILR7evK1iuI9uJV4aL3X
         VC6DgV5Wa+GMaB9zPhj+D/DaTH6B+wOIjh0Hh0bneu9RiqO65bQrUJSfWVa2Sc1VMlg/
         St2peBYqiYMILAj3BGP5kyNdZH8Lr+fx7rhztnCnyuP8G6K8OogzEkLtisAH3t0aDm6q
         E8HIuooOPGzSgaH9AEj1uY3YQ/7JqAmMsvT24Z7sMDl2K2t8+ia0FqufbI7Rn9W5f+hK
         Vk5d+ZYu64QGd6+BwFB35/IjqUnIc4H5p9/X1wBStm/Qz36d04qBjW/qQ+yqpl8sQJCA
         qqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750332029; x=1750936829;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PBUsi0YBNMAsSBVKTalCtjkPCy5c9CLBxMjhKRUhDZY=;
        b=Mz3GLO7xMKhmLd6YrFeYYg7xLlo7lBO6eFZ6f2JbIS/CRDOGI4yyVWl9eYJZUQZZAa
         eYoZp5yjfTVC6ufTUq4K2lxCVD1vy55zP/5DzpMG3G4QICCtvXcbEGWO+nO0+8tPOicz
         tB5kcOFDKumFdfmQ4vM5tLRWwy5yLJ0BuU3t8BJhIYttKAEY7R04Wu7dLX3QJxDmtVVn
         i5EsnyvED4EUY+CP/dgc4rvdiITjwOyUX46sHtCMN+vH/euHYHCDK3Qcp3qvd/OQjhPq
         gBEK40SVtItscKXv9krjnyCSzauLfMxc3MNkpqTH25724+9uKIn8SKDX392W9HXCm8Yi
         l43w==
X-Forwarded-Encrypted: i=1; AJvYcCW0m7iS5ctv3kgVNwgyJSl4uPqvb4WYwHpeUD68/rwB/EWkPgeoOtKTgYXEgTY1M0eoWkHXf30UtLcOjg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywf9rUEDGPgw25Y+/y/TGnb7QaSd1wpWfR99RUaBUzTg9B3nFqX
	lrw8sYyyNegmnUB1RhAcTapW0lnDNYwluNfrWptmgB4rcc83KEw5nr1aPp6XFZspxm44j0xIFeJ
	+6DvN/39jG6wJeQBMwBGUo8JCsn8hSklFvFSCcrJWNQ==
X-Gm-Gg: ASbGncuvFO+E2VyyQ1CziQEYCf/GHIzmk89yX1Mlgnyq2uvyZeL9zD3CNNk/qj7fV6S
	KObq/km74gzwEwkLgSZMxtb3i3S6mbhp6P7t9ikJEb0bx0He/imON8ZTpmOx/70ZYmfD22ePL+e
	WUsZeDNU4DrtANiasjXGnqibb2Ynuv0OMco22cJdAGNsym
X-Google-Smtp-Source: AGHT+IHX9ksGPdiWQPczJro/bAe1IGvypwqoP8WCOZDCwwHcVTV4TvNUdtBj0nob0BRaQUU78E2vrWhUpGn208sRiuY=
X-Received: by 2002:a05:6902:1b04:b0:e82:13f4:6156 with SMTP id
 3f1490d57ef6-e822acc6b88mr30435408276.13.1750332028965; Thu, 19 Jun 2025
 04:20:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1749127796.git.zhoubinbin@loongson.cn>
In-Reply-To: <cover.1749127796.git.zhoubinbin@loongson.cn>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 19 Jun 2025 13:19:50 +0200
X-Gm-Features: AX0GCFvvZQe_9Nix73DE7Q-G_-P34yyA4RJkioiqjIQNcE5PdVnCw3Am06hW7zc
Message-ID: <CAPDyKFqbCcHPN8yf9Rzo0b0Gr2uBwXUCJDQNkSnnBesESN+kQA@mail.gmail.com>
Subject: Re: [PATCH v3 00/35] mmc: Cleanup sdhci_pltfm_free()/sdhci_free_host()
 usage
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Adrian Hunter <adrian.hunter@intel.com>, Huacai Chen <chenhuacai@kernel.org>, 
	linux-mmc@vger.kernel.org, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>, 
	Ben Dooks <ben-linux@fluff.org>, Jaehoon Chung <jh80.chung@samsung.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Kamal Dasu <kamal.dasu@broadcom.com>, 
	Al Cooper <alcooperx@gmail.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org, 
	Michal Simek <michal.simek@amd.com>, Joel Stanley <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org, 
	Aubin Constans <aubin.constans@microchip.com>, Eugen Hristev <eugen.hristev@linaro.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Yixun Lan <dlan@gentoo.org>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	Steen Hegelund <Steen.Hegelund@microchip.com>, Daniel Machon <daniel.machon@microchip.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-tegra@vger.kernel.org, Hu Ziji <huziji@marvell.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_042029_993422_52E7CEDB 
X-CRM114-Status: GOOD (  16.57  )
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

On Sat, 7 Jun 2025 at 09:32, Binbin Zhou <zhoubinbin@loongson.cn> wrote:
>
> Hi all:
>
> After the first part of the cleanup[1], there are sdhci related
> drivers that need further cleanup.
>
> This patchset is the second part of the cleanup series, and since sdhci has
> sdhci_alloc_host() as the general interface, our main job is to clean up
> sdhci_pltfm_free() and sdhci_free_host().
>
> [1]: https://lore.kernel.org/all/cover.1748933789.git.zhoubinbin@loongson.cn/
>
> Thanks.
>
> -----
> V3:
> - Collect Reviewed-by and Acked-by tags.
> Patch-19:
>   - Use dev_err_probe() to cleanup the code.
> Patch-32:
>   - Fix build warning by lkp:
>         https://lore.kernel.org/all/202505300815.tjQRQD6z-lkp@intel.com/
>
> Link to V2:
> https://lore.kernel.org/all/cover.1748515612.git.zhoubinbin@loongson.cn/
>
> V2:
> - Collect Reviewed-by and Acked-by tags.
>
> Patch-01:
>  - Set sdhci_free_host() to empty, rather than dropping it.
> Patch-07:
>  - Set sdhci_pltfm_free() to empty, rather than dropping it.
> Patch-22:
>  - As requested by Yixun, retain the goto scheme.
> Patch-35:
>  - New patch;
>  - Since all calls have been cleaned up, sdhci_pltfm_free()/sdhci_free_host()
>    are now dropped directly;
>
> Link to V1:
> https://lore.kernel.org/all/cover.1747792905.git.zhoubinbin@loongson.cn/
>
> Binbin Zhou (35):
>   mmc: sdhci: Use devm_mmc_alloc_host() helper
>   mmc: sdhci-acpi: Drop the use of sdhci_free_host()
>   mmc: sdhci-milbeaut: Drop the use of sdhci_free_host()
>   mmc: sdhci-pci: Drop the use of sdhci_free_host()
>   mmc: sdhci-s3c: Drop the use of sdhci_free_host()
>   mmc: sdhci-spear: Drop the use of sdhci_free_host()
>   mmc: sdhci-pltfm: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-bcm-kona: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-brcmstb: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-cadence: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-dove: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-esdhc-imx: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-esdhc-mcf: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-iproc: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-msm: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-npcm: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-of-arasan: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-of-aspeed: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-of-at91: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-of-dwcmshc: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-of-esdhc: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-of-k1: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-of-ma35d1: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-of-sparx5: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-omap: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-pic32: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-pxav2: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-pxav3: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-sprd: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-st: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-tegra: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-xenon: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci_am654: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci_f_sdh30: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci: Drop sdhci_free_host()/sdhci_pltfm_free() interface
>
>  drivers/mmc/host/sdhci-acpi.c       |  3 ---
>  drivers/mmc/host/sdhci-bcm-kona.c   |  2 --
>  drivers/mmc/host/sdhci-brcmstb.c    |  1 -
>  drivers/mmc/host/sdhci-cadence.c    | 21 ++++++------------
>  drivers/mmc/host/sdhci-dove.c       | 12 ++---------
>  drivers/mmc/host/sdhci-esdhc-imx.c  |  3 ---
>  drivers/mmc/host/sdhci-esdhc-mcf.c  | 25 ++++++----------------
>  drivers/mmc/host/sdhci-iproc.c      | 18 ++++------------
>  drivers/mmc/host/sdhci-milbeaut.c   | 19 ++++++-----------
>  drivers/mmc/host/sdhci-msm.c        | 11 ++++------
>  drivers/mmc/host/sdhci-npcm.c       | 15 +++----------
>  drivers/mmc/host/sdhci-of-arasan.c  | 26 +++++++----------------
>  drivers/mmc/host/sdhci-of-aspeed.c  | 10 ++-------
>  drivers/mmc/host/sdhci-of-at91.c    | 30 ++++++++++----------------
>  drivers/mmc/host/sdhci-of-dwcmshc.c | 14 +++++-------
>  drivers/mmc/host/sdhci-of-esdhc.c   | 11 ++--------
>  drivers/mmc/host/sdhci-of-k1.c      |  1 -
>  drivers/mmc/host/sdhci-of-ma35d1.c  | 23 +++++++-------------
>  drivers/mmc/host/sdhci-of-sparx5.c  | 24 +++++++--------------
>  drivers/mmc/host/sdhci-omap.c       | 21 ++++++------------
>  drivers/mmc/host/sdhci-pci-core.c   |  9 ++------
>  drivers/mmc/host/sdhci-pic32.c      |  9 +++-----
>  drivers/mmc/host/sdhci-pltfm.c      | 16 +-------------
>  drivers/mmc/host/sdhci-pltfm.h      |  1 -
>  drivers/mmc/host/sdhci-pxav2.c      | 26 ++++++-----------------
>  drivers/mmc/host/sdhci-pxav3.c      |  7 +-----
>  drivers/mmc/host/sdhci-s3c.c        | 16 ++++----------
>  drivers/mmc/host/sdhci-spear.c      | 11 ++++------
>  drivers/mmc/host/sdhci-sprd.c       | 33 +++++++++--------------------
>  drivers/mmc/host/sdhci-st.c         |  6 ++----
>  drivers/mmc/host/sdhci-tegra.c      |  9 +++-----
>  drivers/mmc/host/sdhci-xenon.c      | 15 +++++--------
>  drivers/mmc/host/sdhci.c            |  9 +-------
>  drivers/mmc/host/sdhci.h            |  1 -
>  drivers/mmc/host/sdhci_am654.c      | 20 ++++++-----------
>  drivers/mmc/host/sdhci_f_sdh30.c    | 13 ++++--------
>  36 files changed, 135 insertions(+), 356 deletions(-)
>
>

The series applied for next, thanks!

Kind regards
Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
