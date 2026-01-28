Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC61D46BF9
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 19:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xBXlibJukItexcz0rCyJfsIgJTcGae/kOBhOK5KBfYc=; b=LLWD8yhRAERZ0O
	B6TmKqv1pL30yCdZjOtWYHvmAz5LXnzZGooRxd7gY8UWmVRl1oqCOfb8eOlnLaYVcWPC9Kr2NDEGu
	rkefCUsD3tNMBTl42Dbbzs2ZdOcL05nzJHbxk474In41dIFadO0k4DyD9vBJtyvdBwa7pLo5v/GXH
	H7BT8zxg6V4NpqfkkHZp0tx7Y50AFDNItroEDouEBIc/pwki7v63XabLiO9xeudtaLov81Js1XZ6j
	TZ/A53+GzaFrH1UmEq/8ZLVIk5kTzNmviGziQDeihFHEnP6g1ZYzT0Xz/wP97m4qnkGYMyasTq0Ph
	wKOLmyy8EORUBGPpqW+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlBX1-0000000Gh6K-41e4;
	Wed, 28 Jan 2026 19:48:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlBX1-0000000Gh6E-1kJH
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 19:48:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 82D6B60007;
	Wed, 28 Jan 2026 19:48:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF4C4C4CEF1;
	Wed, 28 Jan 2026 19:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769629730;
	bh=4zt9hc3BBEaGcxjfty65LgYWsANjQMrfkrl4+EdZevs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZR4m4kSBzAMSHsbeBQ34bIcwQAsZVK+OE178Cx8QjpLqVZ645Gg5NOBjPTVif7Wdg
	 2jtmumLgu2VZ0EGB2gpNcViq/IV89Fa1xx0J5gGG97RPg+tPberSBmPjrWO/dDKu90
	 U2ELtlQtf3PCUr3Z/h1gMGZJA1fqKAE7fbY4TW8EPMqhTOYzAviYnQLwUJyNVTdI53
	 BTTAPgp24juLsdVvHNX5vePreHHTKj74IykwKaEUjcLWXD4tb7N9CFVCvuptLhIPdI
	 AXs7ZbXMkSsODGCnPZDFGwMA7ex1Lk3gA/3kncgyGU8osDrXaXu+8E1Z7sR2L2lYou
	 SvuvlPDbk+0WA==
Date: Wed, 28 Jan 2026 11:48:48 -0800
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH v6 6/9] riscv: dts: thead: add DPU and HDMI device tree
 nodes
Message-ID: <aXpoIBxC6vwZ27By@x1>
References: <20260123092830.4046009-1-zhengxingda@iscas.ac.cn>
 <20260123092830.4046009-7-zhengxingda@iscas.ac.cn>
 <aXpa5zPWNOM1oP/C@x1>
 <aXpnGA80OYY+aoMy@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aXpnGA80OYY+aoMy@x1>
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

On Wed, Jan 28, 2026 at 11:44:24AM -0800, Drew Fustini wrote:
> On Wed, Jan 28, 2026 at 10:52:23AM -0800, Drew Fustini wrote:
> > On Fri, Jan 23, 2026 at 05:28:27PM +0800, Icenowy Zheng wrote:
> > > From: Icenowy Zheng <uwu@icenowy.me>
> > > 
> > > T-Head TH1520 SoC contains a Verisilicon DC8200 display controller
> > > (called DPU in manual) and a Synopsys DesignWare HDMI TX controller.
> > > 
> > > Add device tree nodes to them.
> > > 
> > > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > > Tested-by: Han Gao <gaohan@iscas.ac.cn>
> > > Tested-by: Michal Wilczynski <m.wilczynski@samsung.com>
> > > ---
> > > No changes since v4.
> > > 
> > > Changes in v3:
> > > - Adapting to the changed binding.
> > > 
> > > No changes in v2.
> > > 
> > >  arch/riscv/boot/dts/thead/th1520.dtsi | 66 +++++++++++++++++++++++++++
> > >  1 file changed, 66 insertions(+)
> > 
> > Reviewed-by: Drew Fustini <fustini@kernel.org>
> 
> I've applied this to tenstorrent-dt-for-next
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/commit/?h=tenstorrent-dt-for-next&id=b6a400f45aaf391d15d70758df207bbf5a63811e

Sorry about my typo mistake. The correct branch is thead-dt-for-next

https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/log/?h=thead-dt-for-next

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
