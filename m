Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35347C6FD1D
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 18:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N0boxaKgtp+MiCwvaIX5/VZ4c7C4Qy+Tcv3ANZdJTJ4=; b=2zj447F7aGmzWb
	g9iZ2H2hWGsKzNKE+oKgw0YGKUX9Q3GhoWAHBaA0FbwE8XuDXleAgg6d2ZPZik/wrc1RMXatrSU9t
	5hkwPrhrcOSpeF/m5x+2sqb23xWmE/a/Xa4uvGAbkTUgnwQfuxHb1TAdU+vrNa+epQHsOMXRoz6k0
	9hQvZQKnLWTOZhHMcdrRQ6rKdYR4x+nufmOtlCEEti1hSpIwHXcAT3AOQgMrt5VZ2OsRk+o2uoSXL
	CbyGqTutHeE66efNuWijvuMtD6zWHoWjSb+0CC4qpDlYpC1UdYyT0crFX30QY+zNI6BbCt8y45YLx
	PMoO/9sNGGBghx06BzzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgrwr-00C7Wk-13;
	Mon, 27 Mar 2023 18:52:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgrwo-00C7W2-38
	for linux-riscv@lists.infradead.org;
	Mon, 27 Mar 2023 18:52:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 91A656147C;
	Mon, 27 Mar 2023 18:52:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E167BC433EF;
	Mon, 27 Mar 2023 18:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679943120;
	bh=yR3kBWWj+U4PCxXjD6CdcYK2bWLqQYhs47tXIHYqMvw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=NC9QQ16qy9f3He7b9VpqRElXD2n+2W9PC/SN5tohM5BqvqtqPcUmRktUsu96CewxP
	 d4Hce0GMDAsjd+fgSsBLryg7Nrhff1CF0HpA+m0qrBwf6hMR9fUs7VOIOnzTs9pvGn
	 jCVIW/V77Jw6CBV4TqagW4g4gkpkXeJSmY6phLGwo6afeNQ0jS8JAzmCuTdpdN9y5g
	 0pIa0SyISjKxCTweAde4md1bxjfxXgyukpISyJvZ+g5ITPytSs2feqf0n7aU16owj8
	 BresQCt9n5+XRwAA72/I6flnPVsuxt91wtg9SpI/V8mXSEPv+0Q1zDRBW8e1I16f7X
	 /i8k/7mUwZ8Tw==
Message-ID: <53f2bd239c74bab3079be3185abc4909.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230320103750.60295-14-hal.feng@starfivetech.com>
References: <20230320103750.60295-1-hal.feng@starfivetech.com> <20230320103750.60295-14-hal.feng@starfivetech.com>
Subject: Re: [PATCH v6 13/21] clk: starfive: Add StarFive JH7110 system clock driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, Hal Feng <hal.feng@starfivetech.com>, linux-kernel@vger.kernel.org
To: Hal Feng <hal.feng@starfivetech.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org
Date: Mon, 27 Mar 2023 11:51:57 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_115203_047471_EA4FB4BC 
X-CRM114-Status: GOOD (  11.14  )
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

Quoting Hal Feng (2023-03-20 03:37:42)
> diff --git a/drivers/clk/starfive/clk-starfive-jh7110-sys.c b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> new file mode 100644
> index 000000000000..f98a508969c3
> --- /dev/null
> +++ b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> @@ -0,0 +1,450 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * StarFive JH7110 System Clock Driver
> + *
> + * Copyright (C) 2022 Emil Renner Berthing <kernel@esmil.dk>
> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> + */
> +
> +#include <linux/clk.h>

Please drop this include.

> +#include <linux/clk-provider.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/platform_device.h>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
