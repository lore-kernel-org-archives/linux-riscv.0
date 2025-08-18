Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FB8CA0ED1
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 13:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cScbEGB8IbGZ2hRlF0x9sdGZ6i5M5ssvmmA6925IllU=; b=jh5JAicDne+lOC
	b+zSXVFENGo3JKh6ejTiRZpxJBsj24pKGTD57sUYk53rlj0GEjeI0ax5LQfGYqxSBBLhqYFpHlw6x
	gNEjjoESfsUBL69+k4WQdlTmFKNEkSUYl/12WsODZGUKNAjcwG0fK+uySEeK1Mz78H7G0bDM/GDJr
	bNhlEqLXdBYMhW8svQQxjhN812dYyoSMPu+nHy7ZqKJw7c70+m8QtloK94IS71/JubiLvlIEwJ7KQ
	NpARLvCquEIQkVh+5wx2eaJCr+3p7Rq766KLpmdqAywsHv+kBr/qd7XSkIih15A5BQrYRUZDCAeSC
	C1gxbww4wOknm9WmUwcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo070-00000007a5w-3aMI;
	Mon, 18 Aug 2025 13:41:22 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unwOt-000000075K9-2bU4
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 09:43:37 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 3007720E37;
	Mon, 18 Aug 2025 11:43:31 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H-l89fRMrwVf; Mon, 18 Aug 2025 11:43:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1755510210; bh=kvFLkZd49qaINmgLXux3yvrYr/hxKrrvscnAQB/WUng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TlcEiIHoMtlAl2saN8yxYLjXkbcsm6JBdVLGzc+jl2AS1b+an/MmtxcFAE/xU7iYd
	 8jwo4ADl77uY9jj2HxO+oa0lFgL8EDGDKAAj4hgOyN6KhUOqCnBq8VTERoMolFJURT
	 gQ5yClMwtpJ5p/GxejAUoS7yvD4hTDxp2R85+2D8Sw2UULzeltB6AYUT/1dz7fa7yX
	 TUINM9Ab/8mb22RQXEAZvtrw85FZtARc8updoorB/uviX7ICX8dKUir2+2syzhlJm1
	 /ZmnuCr7SpAyQVnEId4dDWa7FodzRHV4dCxwbcnXp081DxwbUzUMlQrQRKK8olBMAE
	 HuSNR/2QyTMWg==
Date: Mon, 18 Aug 2025 09:43:13 +0000
From: Yao Zi <ziyao@disroot.org>
To: Icenowy Zheng <uwu@icenowy.me>, Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Sebastian Reichel <sre@kernel.org>
Cc: Han Gao <rabenda.cn@gmail.com>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 1/2] driver: reset: th1520-aon: add driver for
 poweroff/reboot via AON FW
Message-ID: <aKL1sTutiMZPAd70@pie>
References: <20250818074906.2907277-1-uwu@icenowy.me>
 <20250818074906.2907277-2-uwu@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250818074906.2907277-2-uwu@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_024336_068439_5A572508 
X-CRM114-Status: GOOD (  18.89  )
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

On Mon, Aug 18, 2025 at 03:49:05PM +0800, Icenowy Zheng wrote:
> This driver implements poweroff/reboot support for T-Head TH1520 SoCs
> running the AON firmware by sending a message to the AON firmware's WDG
> part.
> 
> This is a auxiliary device driver, and expects the AON channel to be
> passed via the platform_data of the auxiliary device.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  MAINTAINERS                             |  1 +
>  drivers/power/reset/Kconfig             |  7 ++
>  drivers/power/reset/Makefile            |  1 +
>  drivers/power/reset/th1520-aon-reboot.c | 98 +++++++++++++++++++++++++
>  4 files changed, 107 insertions(+)
>  create mode 100644 drivers/power/reset/th1520-aon-reboot.c

...

> diff --git a/drivers/power/reset/th1520-aon-reboot.c b/drivers/power/reset/th1520-aon-reboot.c
> new file mode 100644
> index 0000000000000..8256c1703ebe8
> --- /dev/null
> +++ b/drivers/power/reset/th1520-aon-reboot.c
> @@ -0,0 +1,98 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * T-HEAD TH1520 AON Firmware Reboot Driver
> + *
> + * Copyright (c) 2025 Icenowy Zheng <uwu@icenowy.me>
> + */
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/firmware/thead/thead,th1520-aon.h>
> +#include <linux/module.h>
> +#include <linux/notifier.h>
> +#include <linux/of.h>
> +#include <linux/reboot.h>
> +#include <linux/slab.h>
> +
> +#define TH1520_AON_REBOOT_PRIORITY 200
> +
> +struct th1520_aon_msg_empty_body {
> +	struct th1520_aon_rpc_msg_hdr hdr;
> +	u16 reserved[12];
> +} __packed __aligned(1);
> +
> +static int th1520_aon_pwroff_handler(struct sys_off_data *data)
> +{
> +	struct th1520_aon_chan *aon_chan = data->cb_data;
> +	struct th1520_aon_msg_empty_body msg = {};
> +
> +	msg.hdr.svc = TH1520_AON_RPC_SVC_WDG;
> +	msg.hdr.func = TH1520_AON_WDG_FUNC_POWER_OFF;
> +	msg.hdr.size = TH1520_AON_RPC_MSG_NUM;
> +
> +	th1520_aon_call_rpc(aon_chan, &msg);

It's possible for th1520_aon_call_rpc() to fail. Should we check for its
return value and emit a warning/error if it fails? Though in case of
failure there may not be much we could do...

> +	return NOTIFY_DONE;
> +}

Best regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
