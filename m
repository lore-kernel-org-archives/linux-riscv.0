Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBDC10D14B1
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 13:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EMyyUUWj687KOW79ywbvZ794tk+dDpdb4AVTP4ADcL0=; b=IE3nbR9+wxdu1R
	V72Umm0LaT4W3yOLExJ9ZqWUYeV+qhpNQcL9H58N/02clL8PIwbiGwrBWT7Idm03x5lBplHwaMawB
	PdfaptbVaKpnyyIyFVx8vg+DkXdajLQsf5TXJgHp7Um88XhDn8SUaX1CASyY2bghzv0OQQLcNeWuk
	qvxcD9RXjBEN0JXGY4Bf9SGGuvT/lac5PE6CSlkFvXyj/qQWOEFJDKLUxYl5DwpqQSMt5xe/f6oZZ
	s1mdrqDre2R85WIeGiOa/cBLnZ0UWv14v0iULd23peuidZn/FKBnrcJqz0G44xgDbZZ46XB5dkD52
	LWhkAJ9eQ9pKyjXEuVpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7CWs-0000000BKwo-3RHh;
	Mon, 30 Mar 2026 13:19:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7CWq-0000000BKwB-42UK;
	Mon, 30 Mar 2026 13:19:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0FC0860123;
	Mon, 30 Mar 2026 13:19:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCF4BC4CEF7;
	Mon, 30 Mar 2026 13:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774876778;
	bh=Xt08PXymCs4YwVjpcynOD9Y9BtXPNMqPh7FYH0XBhoM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tQMNoMlj1NRnTs9ZoEczeHKRYMoX5a+Z2tQ+dI8ELcy1g1k55rFExNZj/XJUrwar7
	 syT3h7GHUTt1HRLmW4etNkE+JZlDSQ76EMLxJi+sqnm7V23ANlSN1JjmuPnvi/36Sz
	 W+Qoa8hF1tyo5SxMJWYeOAqcIeqXyclLnV4HabqQ=
Date: Mon, 30 Mar 2026 15:19:35 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-usb@vger.kernel.org, netdev@vger.kernel.org,
	spacemit@lists.linux.dev, UNGLinuxDriver@microchip.com,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Peter Chen <peter.chen@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v6 phy-next 03/28] usb: add missing headers transitively
 included by <linux/phy/phy.h>
Message-ID: <2026033028-squint-yield-4c23@gregkh>
References: <20260327184706.1600329-1-vladimir.oltean@nxp.com>
 <20260327184706.1600329-4-vladimir.oltean@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260327184706.1600329-4-vladimir.oltean@nxp.com>
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

On Fri, Mar 27, 2026 at 08:46:41PM +0200, Vladimir Oltean wrote:
> The chipidea ci_hdrc_imx driver uses regulator consumer API like
> regulator_enable() but does not include <linux/regulator/consumer.h>.
> 
> The core USB HCD driver calls invalidate_kernel_vmap_range() and
> flush_kernel_vmap_range(), but does not include <linux/highmem.h>.
> 
> The DWC3 gadget driver calls:
> - device_property_present()
> - device_property_count_u8()
> - device_property_read_u8_array()
> but does not include <linux/property.h>
> 
> The dwc3-generic-plat driver uses of_device_get_match_data() but does
> not include <linux/of.h>.
> 
> In all these cases, the necessary includes were still provided somehow,
> directly or indirectly, through <linux/phy/phy.h>. The latter header
> wants to drop those includes, so fill in the required headers to avoid
> any breakage.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com> # dwc3
> ---
> Cc: Peter Chen <peter.chen@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> 
> v2->v6: none
> v1->v2: collect tag
> ---
>  drivers/usb/chipidea/ci_hdrc_imx.c   | 1 +
>  drivers/usb/core/hcd.c               | 1 +
>  drivers/usb/dwc3/dwc3-generic-plat.c | 1 +
>  drivers/usb/dwc3/gadget.c            | 1 +
>  4 files changed, 4 insertions(+)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
