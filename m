Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2126606A327
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Nov 2026 14:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wt+wQIzp;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=chDf08NL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yRa4Aiir0uwfGFI+yN/MhplW9CWX/Ruyj85A3NCxNdY=; b=wt+wQIzpneRfOmmWhuP+LI0kgy
	hp9/EV1ewEpYE7wM4I6anG01MTQgpbMJ+te17VevCVo8jhnyRi07iojwF8Qje03A11gobuiYjofhH
	O+r1fwsKhHN88nmvT3QO/SBf5nrhlBL/WH6UtQ9EVOhrC2yGrhBilvVf85favn6cY0fKF9VURnvT3
	O+AxSRSXvGe+sqA/MxHKumQvl6aLZcWnPT9eOm1edJnQsfvG5wXN5Wks8nV+fK9OSr8Lo196pxXXG
	JA1SZnjFevkxgno0Kj0ewzGxT/pJ4rcC64sPbiVSHPFbhgputpadlnoncc17FYtF8VUsvhAbGiGSI
	XNMONpfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSb46-000000001q5-2B6S;
	Sun, 15 Nov 2026 14:18:42 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSb3z-000000001o2-3ql4
	for linux-riscv@lists.infradead.org;
	Sun, 15 Nov 2026 14:18:40 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso29626785e9.1
        for <linux-riscv@lists.infradead.org>; Sun, 15 Nov 2026 06:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794752313; x=1795357113; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S704AU5qbUN5VbRr+2O0ZeqFrfEN5c1p3S93iVWr7So=;
        b=chDf08NLI9rUrlfzjEkhn/tkXAzg05FZCpGXU7jXysTyRKTlzhFl1hk1yonfKONSuQ
         ZWXADhOMQHwhuRvOPuI5Ex+hlXJ+MU8E1vbg0pRgMB4l+f26z7FeyLeVgcdFiLqqeNN5
         m8G0vu7n2geRLCgYVNkajm7KIP6BlpEPw2M4+qvHrxuyoB69kBwkUIfScbOiDH8lQY4V
         x2X5FpygrS5ufYsiLd4AxMnSl4zHsjIcAI6isTvndPZHqjhj6gs8q+y99zHRDHcOuGci
         Nm4gnw104dfD82SmttK5I/noRRcfG+G7xFyuZZUFRDfOhhHSCr7xFRCQVvGvBKKTZFKR
         Iy7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794752313; x=1795357113;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S704AU5qbUN5VbRr+2O0ZeqFrfEN5c1p3S93iVWr7So=;
        b=Wf9/RcxZJGVi6SzJlwn2PV713UgjxKWKo1saxy4hQFClLm4RjFH75egU9A1aR7qJ+4
         olm+IV90hUgYrlQb7HDhdLP6cSu6UoAMZmxCyQ28lx7fXYu2nd3crvkPKK9/igzciJLE
         KGNEUKSgMK4OKDc4X8/5HJCDX/FCdx2BgC+d5SWccIl6FHvv/gtiitg8zmYCB9O5A0KH
         I4DAN4vgfr1si+x9DP9vtUVgZJads/d854YBOHQy7v+ZONyX493C5zmGaXbOwF0lSvM+
         9T+CjZqEvoFSaXvFumR/s7kO87d7c5zoZKvyF27pOKrI+UbmL7hhoIi8pvkam064i+6Z
         lRdg==
X-Forwarded-Encrypted: i=1; AL+hErGhESCDmYEmL1NYwNRJ3odOB/YP+bG8WIVrB+ed41ov4h9A+i1RX7guX08l1UbDde88vpBuDOi0A02xNA==@lists.infradead.org
X-Gm-Message-State: APuU4Z/eiVaZWnE1lGbZjMCPP+zjXfUcb8/w0L6wPEDxX6vAF1uQPvpy
	wNcMqlE+0tLusCYTHE+tsRzmYMn3wXJiL2lnXh99/8Z2Ad+8dS4Jr63I5+opSCTMv3E=
X-Gm-Gg: AYBFou2UR5Uj2hxELs3IkatjXu2bd000ibwaYsUFRwVXv3Cog4Hk5qKcYVScZuiV78o
	ui9N9mUBWy9MzalNzs3A6wn0nyFyzJaqESMN7RdREul/XT7DoDPz+uimkcztHE+zhjqHm+g6C4x
	inslyvVwXYEK6+PqbhlmJv+62OLUcTxn7JvxRF+GxYWtuir291m4Gh3BJwGcWGiHCRxFEju3F/8
	MtZIw+qb7daFvhrGr//0MEAurvIV26TZhwM5OzWTcOY7vTNLs/bEigCioPjICWXojiCAEpm/kmj
	fhaVbZ+46zZZ8hfBnYSc1U0Z8FbReBnd5XIzdZzsXXhRCgAmu1D5LQv2XQzJVwuoN8JAphpPhV8
	Edh6PZuhrRf/+h16xbb06tAxjVCqQ1GVTAzg9DmjX1+YxIidUmuqwFj1NVmgKMZnSNBYXI3frfg
	FjavMqCs/NYoOHS/qeoUJgb8gxrq/ToMKCGklyVWBRX3OekelDjbifoUGpsCZ4b0aV/T63l91Yg
	iQWZRDp7wvo47+yloOk/K10eR9NJDgZpJND2+JPxEH1OMizZDPlJhJyUdHc9+pmwLv0Y1Q4dOZ8
	XHcHrl9HbpOFi95iQwhhYsp9j8x8GlyLjOYfo6Dm39CrjAqR+w==
X-Received: by 2002:a05:600c:34d6:b0:4bb:5c92:ce22 with SMTP id 5b1f17b1804b1-4bb5c92d047mr132126085e9.8.1794752313396;
        Sun, 15 Nov 2026 06:18:33 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223b21sm18530520f8f.2.2026.11.15.06.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 06:18:32 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v1 2/6] clk: starfive: jh71x0: Move reset controller
 registration to jh71x0 common code
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Brian Masney <bmasney@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20261013102707.9207-3-changhuang.liang@starfivetech.com>
References: <20261013102707.9207-1-changhuang.liang@starfivetech.com>
 <20261013102707.9207-3-changhuang.liang@starfivetech.com>
Date: Sun, 15 Nov 2026 15:18:28 +0100
Message-Id: <179475230833.3873592.13070196353304136001.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3026; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=SzFQdbzAtEZ1BnfFOUSY0w8toQFX6y0M+FCu3Ru7vsw=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFk/95vzHzn/Wm9uzcPMf6oFG0Wunll3x/DbhM5fr+XsQ
 iez9HiKdpSyMIhxMciKKbLUcFeLv5PU+jJrus5tmDmsTCBDGLg4BWAiLqEM/ysdn089x/jq+N6j
 4Q1p+dVaEm9m6+e/vf7hfrst902ebEGGv3Lhkd56y34ulv/k/zPkvat185OPuy6rGDg9z594TP/
 BXFYA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_061835_991127_046C0C19 
X-CRM114-Status: GOOD (  23.90  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> jh7110_reset_controller_register() is only tied to the JH7110 system
> clock driver by its location. Its logic is generic: hand the CRG
> register base to the reset driver through an auxiliary device.
> 
> Move it to clk-starfive-jh71x0.c as jh71x0_reset_controller_register()
> so that the clock drivers of other StarFive SoCs can reuse it, and make
> CLK_STARFIVE_JH71X0 select AUXILIARY_BUS accordingly.
> 
> While at it, replace the open-coded auxiliary device allocation, init,
> add and release handling with devm_auxiliary_device_create(), which
> already implements all of it. The register base is now passed to the
> reset driver as platform data of the auxiliary device, so struct
> jh71x0_reset_adev and the embedded auxiliary device go away.
> 
> The auxiliary device ID is dropped: every CRG already uses a distinct
> auxiliary device name, so the ID is not needed to keep the device names
> unique, and it is always 0 now.
> 
> Since the helper now lives in clk-starfive-jh71x0.c, the auxiliary
> device names are prefixed with "clk_starfive_jh71x0" instead of
> "clk_starfive_jh7110_sys". Update the auxiliary_device_id table of the
> JH7110 reset driver in the same patch to keep the tree bisectable.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  drivers/clk/starfive/Kconfig                  |  2 +-
>  .../clk/starfive/clk-starfive-jh7110-aon.c    |  2 +-
>  .../clk/starfive/clk-starfive-jh7110-isp.c    |  2 +-
>  .../clk/starfive/clk-starfive-jh7110-stg.c    |  2 +-
>  .../clk/starfive/clk-starfive-jh7110-sys.c    | 59 +------------------
>  .../clk/starfive/clk-starfive-jh7110-vout.c   |  2 +-
>  drivers/clk/starfive/clk-starfive-jh7110.h    |  4 --
>  drivers/clk/starfive/clk-starfive-jh71x0.c    | 24 ++++++++
>  drivers/clk/starfive/clk-starfive-jh71x0.h    |  2 +
>  .../reset/starfive/reset-starfive-jh7110.c    | 19 +++---
>  include/soc/starfive/reset-starfive-jh71x0.h  | 10 ++--
>  11 files changed, 45 insertions(+), 83 deletions(-)
>
> diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
> index bd29358ffeec..51716655554f 100644
> --- a/drivers/clk/starfive/Kconfig
> +++ b/drivers/clk/starfive/Kconfig
> @@ -2,6 +2,7 @@
>  
>  config CLK_STARFIVE_JH71X0
>  	bool
> +	select AUXILIARY_BUS
>  
>  config CLK_STARFIVE_JH7100
>  	bool "StarFive JH7100 clock support"
> @@ -32,7 +33,6 @@ config CLK_STARFIVE_JH7110_PLL
>  config CLK_STARFIVE_JH7110_SYS
>  	bool "StarFive JH7110 system clock support"
>  	depends on ARCH_STARFIVE || COMPILE_TEST
> -	select AUXILIARY_BUS
>  	select CLK_STARFIVE_JH71X0
>  	select RESET_STARFIVE_JH7110 if RESET_CONTROLLER

You've switched to imply for the new controller you are introducing later in this series.
You should probably be consistent and align this one too. Not in this change though, it would
be unrelated.

This change otherwise looks good to me. It requires Philipp's opinion as it is touching reset too.

-- 
Jerome


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
