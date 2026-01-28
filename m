Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 426BAD46BEB
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 18:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h459G+SLe10GrYtRbwY2oww5tMOln9xYrWGG80gRTl0=; b=vwU1q6Y6RAuBgu
	q/Npv4JkFmkcSgAqm8l/Sdd5DrE5vs+5HvUe+wrcQAicuT7LklCn5SZxgK3ewHgszWjXgHa6PkjNg
	EtjSp9d8E/WZ2AMEhvlYmNhBwAhlrJVEP9xHgSwndIjoSBdCnpNABKXwaWHp5Eucf1j2NyYSAp925
	p5+GttCXqMDmrnrX0VC+y4hM/RzZozdsSS/DwOceHKnAxIkz7htdc1fXcLAA0cM12QvTHle5bcctb
	vCVRCVRhhED3sXZVvV788eSFDcucHoR7E4BM3L3Dl9PXc41P09NNabXltX4tTLkQjlo6Q4ZxcBP9Z
	e0tVPef7PYS3g0+OxzKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlAew-0000000GeGp-39D0;
	Wed, 28 Jan 2026 18:52:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlAev-0000000GeGX-1Jdt
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 18:52:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6682C60126;
	Wed, 28 Jan 2026 18:52:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA408C4CEF7;
	Wed, 28 Jan 2026 18:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769626376;
	bh=FpN2GeKkLPq5QvKft5Ke2BDw8HtI7yEWOSKliy0KiDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mbFpiGD35Co3WMyUN29gQyYQImVUpu7KXjh6ycwH0vxJlov/y5hOT4UHHD0ck0C1I
	 Dk619LyJIgRJMAkjESGDtQzmah2HRfd5uNuXwCbZkSm2yaY/D9P6DH+DSc4eueZ2Hw
	 NTt0kNlKP7NOInx0F92fANjwhf4OY1+/OTn2EYixTYUY78Qq4kY/QyEJJRwRvADSjL
	 RwUJDDvBGHhQTDJhUrcf/Pmhxl6QP/jupCnxkpZ9jtrNrRRhb58+NKT25eNLI5yRBI
	 Ca+q1OJXLjP0fE75ad2CSpMEQ5quN5OcFYXrib22DcXCVooyT+Rigy5mq430eqN7Oq
	 5mm40+SU49Zog==
Date: Wed, 28 Jan 2026 10:52:54 -0800
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH v6 7/9] riscv: dts: thead: lichee-pi-4a: enable HDMI
Message-ID: <aXpbBq3TwuiP9Qry@x1>
References: <20260123092830.4046009-1-zhengxingda@iscas.ac.cn>
 <20260123092830.4046009-8-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260123092830.4046009-8-zhengxingda@iscas.ac.cn>
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

On Fri, Jan 23, 2026 at 05:28:28PM +0800, Icenowy Zheng wrote:
> Lichee Pi 4A board features a HDMI Type-A connector connected to the
> HDMI TX controller of TH1520 SoC.
> 
> Add a device tree node describing the connector, connect it to the HDMI
> controller, and enable everything on this display pipeline.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> Tested-by: Han Gao <gaohan@iscas.ac.cn>
> Tested-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
> No changes in v5.
> 
> Changes in v4:
> - Rebased on top of v6.19-rc1.
> 
> No changes in v2, v3.
> 
>  .../boot/dts/thead/th1520-lichee-pi-4a.dts    | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)

Reviewed-by: Drew Fustini <fustini@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
