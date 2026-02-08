Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A9CEE0AF7
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Feb 2026 01:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tHHNxPpIiMZYmY8quZSLv5nwmgmLMHACQWUEBIR8fMo=; b=odp0JSO1FAnzJu
	d3rCJ76TyoFc30X9n/k2gNw1XF7moAaTxnIbyA4BJD33hUDyBAr9MY2+bN4COnQkWuNnnlumgVO7e
	G2wxX5sFX8B5umg1Akm65iFNhSeSDtJwme7klmO0KQO1qVlX934O5zAJBce9wSXaokaMaTsn6xzBt
	OuQCUCcxaul6ilMlh+YkHi7qaK3TPlNdMaUpxFtF5c7abQHImhmCzHsAy6Ui9776Se/C/3lxxvG63
	cgYvTcA2wYrVsrzB7qX7/RIIC6Rg+heUshx3NOhIEIfO91sZiltsySvn8Vq+69/V6YHcTJKDEh8p5
	+/+O7Yndvi38JTAcNLug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1votBi-0000000CtOp-2tse;
	Sun, 08 Feb 2026 01:02:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1votBg-0000000CtOj-2OH4
	for linux-riscv@lists.infradead.org;
	Sun, 08 Feb 2026 01:02:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 90DB96012B;
	Sun,  8 Feb 2026 01:02:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAF01C116D0;
	Sun,  8 Feb 2026 01:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770512526;
	bh=dmAowi9aBngZxm8LYXV0oxX4jZfE0VJFFDxamQqu1fQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yckrp0mgabJYi/PSf5N5Rs/kNDEqlDEugxliHeUMID41bB6sGOI4hi6e95mny7a71
	 8+9NhNZVTMfetn4WDg+pSPCi86Y/ae3R9AdNdaMdcMkL0yZr+CIpZeoTf/4+4YJYmx
	 a6JGSVK7awTFXcZRAgM5YyZfaCnz77eSC0eXMSZFCzfnnzvBF6bN8URrcpRxirvEuf
	 irjkMQfdqtDRBQEoYaeBclNuzEF2Azc8KtdQqcR+4ol0IDq+OoFBgbvMmxntJ/ehu8
	 VVeqOAy5mK88auufJq8oJKaWEqWxoXu7RE3LlMbirrHn6PH7d8OM74/3ujswDYHqG5
	 P3yNuyUVin4/w==
Date: Sat, 7 Feb 2026 17:02:04 -0800
From: Drew Fustini <fustini@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v7 0/8] Verisilicon DC8200 driver (and adaption to TH1520)
Message-ID: <aYfgjMVHXpCAOOj-@gen8>
References: <20260129023922.1527729-1-zhengxingda@iscas.ac.cn>
 <ccb973b8-4b13-4a70-be48-06b2cbe0adf8@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ccb973b8-4b13-4a70-be48-06b2cbe0adf8@suse.de>
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
Cc: dri-devel@lists.freedesktop.org, Guo Ren <guoren@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Michal Wilczynski <m.wilczynski@samsung.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Yao Zi <ziyao@disroot.org>, Jonas Karlman <jonas@kwiboo.se>, Han Gao <gaohan@iscas.ac.cn>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>, linux-kernel@vger.kernel.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>, Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Feb 05, 2026 at 10:30:55AM +0100, Thomas Zimmermann wrote:
> Hi,
> 
> patches 1 to 5 have been merged into drm-misc-next. In patch 3, I replaced
> COMPILER_TEST with COMPILE_TEST in the Kconfig file.

Hi, do you think there will be a pull request for the upcoming 6.20/7.0
merge window with these patches?

I'm trying to decide whether or not I need to send in a late
thead-dt-for-next pull request to the soc tree maintainers.

thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
