Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1480D73E88
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jan 2026 20:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nl1ofwt4481MJDrWQYJ5sDtCLDfdl+O9FXUcyP38V10=; b=O+Qjn8dd/pghip
	M3Y33gDEw3mjhYCOURJaopq8fXNqbFVDe6KyLp5Ffeokrv0YEc9viM9fvyKc+IDck/tBigqzLPyC1
	VO02dpVN3BRWf4GhhPOVfjRgjeVO8k+MMXPnERTS2rg+atfS6B8tbGiefSK0xVrePWpkHZjf86sgb
	s6q8SI/bkDRQOR/0WGDX6nlVtP1WO66+OcBoPEjzHOKGIhdvmHTKw3UrZztGTke3M4ThugApbexz4
	X7Al1l5ejBH9Sl3n4+qkisv+InR74OVSbJD3z4lUnD1f6n4FRqch3nbMo4o8pH8qO7hRUqbfb2b6Y
	BBygQ4MMxTBm/R0vSf4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlYoD-00000000cxx-3tuN;
	Thu, 29 Jan 2026 20:40:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlYoC-00000000cxm-1sAx
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jan 2026 20:40:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 866066001A;
	Thu, 29 Jan 2026 20:40:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE757C4CEF7;
	Thu, 29 Jan 2026 20:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769719207;
	bh=LAb5bVXMPi41pVUrYORqBL7gghLLXdUQzzwJ6WaC5JM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hugHyr+590rN9O8LXTJJbbKHZHH8Hr+igVKqJ1fHEe1ApNsw3T5Xlx5NZpLolWIHV
	 B/S/E+IVF7mOAUoj8ZIyRal8QihzDgPxOQ2uvtlK9gYiO02yFk/mvhEoLqZ7ZEoU9b
	 H/nYzmyZvrp4m4O/X99bOj+yAetENcG1ITuBvtj68dio4ydStSULuWp9x5+mEFGv3y
	 2lHQYhtnVBBo/3pIiC6Q+9eJg1QnwEvX160y6ZrMoXb/mEx4+PAX820Rk+NNt2jD6P
	 n6lV1zbThikCUOcDikHlBK2VyZ6cwUlwgpw4beeVLJy4eqGlqIg6dQd4+mbvGt+9JA
	 LwGPX7pQFq5sA==
Date: Thu, 29 Jan 2026 12:40:05 -0800
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH v7 7/8] riscv: dts: thead: lichee-pi-4a: enable HDMI
Message-ID: <aXvFpSNCR1WQbjp0@x1>
References: <20260129023922.1527729-1-zhengxingda@iscas.ac.cn>
 <20260129023922.1527729-8-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260129023922.1527729-8-zhengxingda@iscas.ac.cn>
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
Cc: dri-devel@lists.freedesktop.org, Guo Ren <guoren@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Michal Wilczynski <m.wilczynski@samsung.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Yao Zi <ziyao@disroot.org>, Jonas Karlman <jonas@kwiboo.se>, Han Gao <gaohan@iscas.ac.cn>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>, linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jan 29, 2026 at 10:39:21AM +0800, Icenowy Zheng wrote:
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
