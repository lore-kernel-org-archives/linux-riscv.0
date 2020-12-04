Return-Path: <SRS0=IlQS=FI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52962C4361A
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Dec 2020 15:11:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C54DF22B3B
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Dec 2020 15:11:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C54DF22B3B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hSJqf8TnaM4g4Chf8ZcZ3TPaN8ZG2B30nRKtWPwMCbk=; b=idCUpkB4hZOsrn+1oNLYVO0ks
	UWdpPWKHrzy7gB7tlEAACeI85+p/rTLFfdPE6thYYGSCIMSN4FKy32HkU1oDdRC+cgGBCoPQsy3Sc
	9h5NenVRqksDF7ge3K2K7BcueM+WG2SBfBT9DLcWPcnYstK/ldtz659t9CVo6THePnT35VPBv5hiv
	6xtWu+73SDAmDJS1uH6ARbSGNw86ClE0XRAaKTGlyS24Qs5TK30oP7tFmdufXgcQQSKwhH6zsIf1r
	VYNugGtwXqvgUW4FZF9p6Y7LIBEWuWvJbv5j8m1Cnv/xAwPYot3VaGNN8cDkC6MhRv0SiGmEq2ggn
	0sbW3pKLA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klCk3-0003LA-Br; Fri, 04 Dec 2020 15:11:27 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klCk0-0003KP-LW
 for linux-riscv@lists.infradead.org; Fri, 04 Dec 2020 15:11:25 +0000
Received: by mail-ot1-f65.google.com with SMTP id y24so5470846otk.3
 for <linux-riscv@lists.infradead.org>; Fri, 04 Dec 2020 07:11:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mx7p3eLmIuWMmtE6mHb2ILEA4Fig5dyz0WFMcFJkzUI=;
 b=Exx0s+jG+MGam7YF+knK9HSQ/9s5BNwDbL1anMTrmj0butYQ+6VQDISdJVuTX1ou10
 wZ9F5afOJiD6LL93R+/NXfCu6z4xHcy5D85jwB6lHoiVY3dxgWXB9vguzY7I2wLzRxbQ
 lcTZUzNbx1j2km8nAPSOlV+xC1Bis6LpmarCep0aI59nTdYxwQo+f/RKweV0fhmR2g5y
 EfrZ4oIRk2+UFnwUpRXHJVdvpd6H4bvVftC0xpvpMsudQPmTC+/VLiFDQXpHdUMUmwA2
 KQK44JoYuja8uvu7lFXZYWKKXPUyFeTqq+bfC1VAEzuWI+KswaDQ/NUxycwEfacbahXQ
 aU/w==
X-Gm-Message-State: AOAM533J6maenJ6MXV/TrXU3Fb3gcrDI4cx8ktoatFkyVQ+IBnkfb4f8
 qz2TAnDskb2SLXy4T/aVitzCqEXykLBUGdVJfJg=
X-Google-Smtp-Source: ABdhPJxwYLy9vqmxnrB8JtTc3YLu6dtlxp2mecVJQlpJfWk1truKlk75tY3Yz7qtoFs+L8+WzUHpvf/9+jzvBbV6wYE=
X-Received: by 2002:a9d:2203:: with SMTP id o3mr4000589ota.107.1607094682844; 
 Fri, 04 Dec 2020 07:11:22 -0800 (PST)
MIME-Version: 1.0
References: <20201202032500.206346-1-damien.lemoal@wdc.com>
 <20201202032500.206346-5-damien.lemoal@wdc.com>
In-Reply-To: <20201202032500.206346-5-damien.lemoal@wdc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Dec 2020 16:11:11 +0100
Message-ID: <CAMuHMdUyA3gobmcUjPr6JM8KLpcM0WKhd6Gfk5=tCfneBYJWMA@mail.gmail.com>
Subject: Re: [PATCH v4 04/21] riscv: Fix builtin DTB handling
To: Damien Le Moal <damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_101124_741786_D3DD5510 
X-CRM114-Status: GOOD (  16.44  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Anderson <seanga2@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Damien,

On Wed, Dec 2, 2020 at 4:26 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:
> All SiPeed K210 MAIX boards have the exact same vendor, arch and
> implementation IDs, preventing differentiation to select the correct
> device tree to use through the SOC_BUILTIN_DTB_DECLARE() macro. This
> result in this macro to be useless and mandates changing the code of
> the sysctl driver to change the builtin device tree suitable for the
> target board.
>
> Fix this problem by removing the SOC_BUILTIN_DTB_DECLARE() macro since
> it is used only for the K210 support. The code searching the builtin
> DTBs using the vendor, arch an implementation IDs is also removed.
> Support for builtin DTB falls back to the simpler and more traditional
> handling of builtin DTB using the CONFIG_BUILTIN_DTB option, similarly
> to other architectures.
>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>

> --- a/arch/riscv/boot/dts/kendryte/Makefile
> +++ b/arch/riscv/boot/dts/kendryte/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
> -dtb-$(CONFIG_SOC_KENDRYTE_K210_DTB) += k210.dtb
> -
> +ifneq ($(CONFIG_SOC_KENDRYTE_K210_DTB_SOURCE),"")
> +dtb-y += $(strip $(shell echo $(CONFIG_SOC_KENDRYTE_K210_DTB_SOURCE))).dtb
>  obj-$(CONFIG_SOC_KENDRYTE_K210_DTB_BUILTIN) += $(addsuffix .o, $(dtb-y))
> +endif

This break compiling a kernel for non-K210 systems (e.g. defconfig),
as reported before in
https://lore.kernel.org/linux-clk/202011151230.QP1ISPQo-lkp@intel.com/

I think this can be fixed using:

--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 subdir-y += sifive
-subdir-y += canaan
+subdir-$(CONFIG_SOC_CANAAN) += canaan

 obj-$(CONFIG_BUILTIN_DTB) := $(addsuffix /, $(subdir-y))

(yes, I've already renamed kendryte to canaan ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
