Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0434C87FD3
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 06:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TgKGUkwCOkx/xYZAft7P1Kcaq497n/8IRbi1VLIeUos=; b=y/Z7574HA8/g11
	UsXMgtsekWb9LhWwhcBIkLI14YI8nOKgVjY00d2DtYATYoANBCdAF5vr3IGjSEnl5mMAuq6bIKTjO
	ZqZEj1QGlHsUh7XTsBCFoX6H1XHf35OBR8uhLO2uJASfG70r+dAsjCuqA/2+2glYI7zG5ybQiSewC
	pVMvICUq3ZJHD3RpwLsiGGYoisdlbaRe8mVGLu4fY92JL3/ImZlyTWN/y064dyj6Ok20nwZoLZ9y6
	SWbi1DsForxfXCGF/hSpGMsCd0pYS/wlLTQgIquzFDPdDfQ33ItfGruz7l1SntOqnAFofvc5bu361
	guTjF+FDZzLHTlzGvFLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uioSA-00000009iWx-1obw;
	Mon, 04 Aug 2025 06:13:46 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uioS7-00000009iWK-475v
	for linux-riscv@lists.infradead.org;
	Mon, 04 Aug 2025 06:13:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0F30EA554FC;
	Mon,  4 Aug 2025 06:13:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0401EC4CEE7;
	Mon,  4 Aug 2025 06:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754288022;
	bh=ouSCa63PfcibmTngtsiZfiLb80eCw/Ck6Mr/TiO6ydo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TiZ54x9nofxjzdr2CQm1i6/GPi3ANL7DIv32SIY1TpPIpjaLd/AiI0LjzGW4MjR03
	 Hx+9OFcVj/dBU3ucCMeaofpTPeF0OhJaahKDui/GKWMYiDZubl6qwLYZnXKsCjK4ix
	 fAuIZngS0SCWQWEG2MuQ3CySmkL4+A9VUK6ib7s6lBe2r0JMH7KqY9TwIjPI5IaEwP
	 DxfCpKirLm3HkobXEGNpQMwX1i0FlJ8w5MF3PoGiS9K/+RQ9fWbi8RyDgfYt+F0nMJ
	 SUA1kZ6q8GO33YjqacAOGtGsqqWznTz4CP2iuuDNlqn8aFAGX00N4dC6wGujI341FE
	 tWPHmccRgKGAg==
Date: Mon, 4 Aug 2025 08:13:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, 
	Matt Coster <matt.coster@imgtec.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Drew Fustini <fustini@kernel.org>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v10 0/4] Add TH1520 GPU support with power sequencing
Message-ID: <20250804-sociable-sceptical-snake-f5ac8d@kuoka>
References: <CGME20250801103104eucas1p1dae57601c48faae879b154f11af8a4f1@eucas1p1.samsung.com>
 <20250801-apr_14_for_sending-v10-0-e85802902a29@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250801-apr_14_for_sending-v10-0-e85802902a29@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_231344_085731_520F7511 
X-CRM114-Status: GOOD (  10.16  )
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

On Fri, Aug 01, 2025 at 12:31:00PM +0200, Michal Wilczynski wrote:
> 
> v10:
>  - Squashed the two dt-binding patches back into a single commit.
>  - Simplified the B-series GPU rule by removing the not clause.
>  - Reverted the removal of the items definition from the top-level
>    power-domain-names property, per maintainer feedback.
> 

You are using b4, so where are all the lore links for each previous
version? b4 creates proper changelog, so why are you removing them?

> v9:

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
