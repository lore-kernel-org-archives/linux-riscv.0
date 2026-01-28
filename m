Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E0CED46BF6
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 19:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZI4yiJpPCRYmK4GI8KWwK7p3lZ7263+xrlzeBxQrU7s=; b=T+ywabm+0OWgFd
	0o1dkFno3ThRz9hNef2QV67wxgxPj+rukjY5VnT8gDRRwHL4UsLInz1JC4PtBJvdyXdmaeqO5U1R3
	Rt8FZiWrjg/OMlbUyf8+lXnAst7X1hbik4FV2eaRIpPr1gaYE7MLi1bZYuAkUhk3HWWbn8/22+SKA
	tis9iP/q8KrOQLdolmhZmALLWFkwxISTBWiQqe73/Mq41X5lf36pEG6jqnJrdXcUcUxP7rKxJ8HrH
	Qmvs2m8m6c/vg9CXTw2nPVloAFYVwwgC2W0sYhPiy6WKgdHuiF7wAGKYK1X62fqttE9TSXEN8Mizz
	7JFrVD/2qSWCQi3f4BAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlBTc-0000000Ggr8-1mfC;
	Wed, 28 Jan 2026 19:45:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlBTb-0000000Ggqy-1596
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 19:45:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 94E086001A;
	Wed, 28 Jan 2026 19:45:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4D6BC4CEF1;
	Wed, 28 Jan 2026 19:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769629518;
	bh=bZ7dJ7gqhVeTmkm1nqjpOk6NE87IYlDZBHUJKo/GhV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r+zDLcEjn6EhyS1eEIqj+F0YNY9xGGoJZNuWB67b5PhGL4hfyeaw0d/wYYmlvqVGl
	 EeIb3GqRWtIb1wonosEAACd4E+6EnuUFqNbO6sEzDX7jHm8aB+oWWxJXUJw0Y+riUm
	 Z5hgGV5qt6ybl3rAg7MoaUq9du/F3njB4YQ7kdVfw5KSxhfxRnpOR3Ml3KfT8UHXhT
	 wi35Gd2hfDxrPwRm0FGgOa6eGbtZJywcYVLJr27u+VZiHOxuZbcgadOH+IzR8vLfpa
	 Uldr92B5GbnHSha8B2bzrNtUez7AYPI2yy6EZrHrTlGf+y1idGxOs8tRX4kUtv1lMn
	 7FBQEIQu51YIQ==
Date: Wed, 28 Jan 2026 11:45:16 -0800
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH v6 7/9] riscv: dts: thead: lichee-pi-4a: enable HDMI
Message-ID: <aXpnTDSowoW+8UzN@x1>
References: <20260123092830.4046009-1-zhengxingda@iscas.ac.cn>
 <20260123092830.4046009-8-zhengxingda@iscas.ac.cn>
 <aXpbBq3TwuiP9Qry@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aXpbBq3TwuiP9Qry@x1>
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

On Wed, Jan 28, 2026 at 10:52:54AM -0800, Drew Fustini wrote:
> On Fri, Jan 23, 2026 at 05:28:28PM +0800, Icenowy Zheng wrote:
> > Lichee Pi 4A board features a HDMI Type-A connector connected to the
> > HDMI TX controller of TH1520 SoC.
> > 
> > Add a device tree node describing the connector, connect it to the HDMI
> > controller, and enable everything on this display pipeline.
> > 
> > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > Tested-by: Han Gao <gaohan@iscas.ac.cn>
> > Tested-by: Michal Wilczynski <m.wilczynski@samsung.com>
> > ---
> > No changes in v5.
> > 
> > Changes in v4:
> > - Rebased on top of v6.19-rc1.
> > 
> > No changes in v2, v3.
> > 
> >  .../boot/dts/thead/th1520-lichee-pi-4a.dts    | 25 +++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> 
> Reviewed-by: Drew Fustini <fustini@kernel.org>

I've applied this to tenstorrent-dt-for-next

https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/commit/?h=tenstorrent-dt-for-next&id=0075f4c3aade0d436925026eaefb14be1ec52a69

Hopefully we can get some testing done with a next release once the driver patches hit next.

Thanks,
Drew


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
