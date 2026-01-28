Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49506D46BEE
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 18:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oHFnO+ofkkW8K6VzZzZSiUAhqK4TNxy1zqtjuUohnC0=; b=a/d5AafJDGAW+F
	cLmqL0I/l3FmCjnaH0eqMW68K7zSgeSC445HXlfZ8ANFB4vMLwb1881ZzzJQEk8ysFv1KyRoMNlhe
	089oeAekiY0r+uKTOlaTDJ/0GHPKwu1eLbF1wPfoKOXIX7Z2D/QXv1G8IdcGdW88CdIan1rFtvqP+
	Lis0+VGsisgmlQUZd42idgFCxPwda+XDtUmTroREXmMCWAm/+E76MxRT5MOr/gQ4KXEP6/PNAGRq7
	HBPRwM3rUwEbchRQuWiOlNQ9kDg+hvHtZupKLjeU/2Se4Y/uFSvDcJyfs5+RzlTOsk18jfTUDrOOn
	NS7njWJuS0w3VVm6uqCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlAeR-0000000GeED-1oGT;
	Wed, 28 Jan 2026 18:52:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlAeQ-0000000GeE6-1a3X
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 18:52:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 270F260054;
	Wed, 28 Jan 2026 18:52:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70F36C4CEF1;
	Wed, 28 Jan 2026 18:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769626344;
	bh=qYdsLkJmWzAx8CeoVe1L2Nyi34pxrjLE9TJYh/PLc9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m6Sy7bRi1PjtYcGumDDu+ZFsu9cvXZkn5cbnagcm+s134rYQCRM4sWBgA6yWPwfjN
	 DnSXv0tcmoAeYrFAVDu83qUl0CySZDIbhanLKEZX/1xoK0tzMk7/zClwitfi5VI7vE
	 uVzCrgKVVLAscJwFvEzURcuZXFXebhbOh/6AZa4G1sbaVLolxuQTuFbG425yUGV9NP
	 yBify23EksWp/ucSpEniP7M1M+r4tOA+WZ+j7s6zgznAhDSC9X9IWcUnSsczLJ6Dz1
	 uHe6y2g+mP0PjsVIrkBKvbGlFZVbPvGRTBmiHKGRtDdKzMSg7vBuZXp6s2lKvFklMs
	 Y0MyfJgBBMvlg==
Date: Wed, 28 Jan 2026 10:52:23 -0800
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH v6 6/9] riscv: dts: thead: add DPU and HDMI device tree
 nodes
Message-ID: <aXpa5zPWNOM1oP/C@x1>
References: <20260123092830.4046009-1-zhengxingda@iscas.ac.cn>
 <20260123092830.4046009-7-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260123092830.4046009-7-zhengxingda@iscas.ac.cn>
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
Cc: dri-devel@lists.freedesktop.org, Guo Ren <guoren@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Michal Wilczynski <m.wilczynski@samsung.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Yao Zi <ziyao@disroot.org>, Jonas Karlman <jonas@kwiboo.se>, Han Gao <gaohan@iscas.ac.cn>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>, linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, Han Gao <rabenda.cn@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jan 23, 2026 at 05:28:27PM +0800, Icenowy Zheng wrote:
> From: Icenowy Zheng <uwu@icenowy.me>
> 
> T-Head TH1520 SoC contains a Verisilicon DC8200 display controller
> (called DPU in manual) and a Synopsys DesignWare HDMI TX controller.
> 
> Add device tree nodes to them.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> Tested-by: Han Gao <gaohan@iscas.ac.cn>
> Tested-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
> No changes since v4.
> 
> Changes in v3:
> - Adapting to the changed binding.
> 
> No changes in v2.
> 
>  arch/riscv/boot/dts/thead/th1520.dtsi | 66 +++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)

Reviewed-by: Drew Fustini <fustini@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
