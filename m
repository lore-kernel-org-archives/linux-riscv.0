Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A36EACA0FFD
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Aug 2025 01:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9L5IH4DhrmXa+YuQiRQMqMNQzMmLsNIs0UWSGVaF1/U=; b=isqzwtIAIdBoQ3
	55NB1coEoHwvE91nhGLryFrQ/Qaqosb5KB3O70PY+qGhv13+0lVWdRTFtc8kI6XAu2y6tF881fyLr
	NtTMCusrt/smhrnhl3gRf+VfA6DRRquc2Nyhf6IlVzdYQWsEoncGhMsptJd9vl2T4E4cDNiJSs8Fw
	jx8FVl2bR4vQAoRU3E55bx8wkXxjFA3jNz6NYiKLxUacUEkR+0hTlev9ITaXT3cofevSf8yfcoRnW
	QA+N+uxk1Ye64Mx62PZScluMoZXYQ/EY3v54mYGtqlw8gWsJ92ZKwkgGU9/W4UoYrgQx9b6+O3t1s
	ijLh0+FmdasQM8GcPjRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urneP-00000003yID-3jMq;
	Fri, 29 Aug 2025 01:11:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urkbo-00000003QDh-1aQQ
	for linux-riscv@lists.infradead.org;
	Thu, 28 Aug 2025 21:56:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 868A760139;
	Thu, 28 Aug 2025 21:56:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6786FC4CEEB;
	Thu, 28 Aug 2025 21:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756418199;
	bh=dSngZWUPELR3QxYM2J7tSWcOG69It00KDI2P68gPg34=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fShS14ZU9g2uMtlXOdGlNrGxb1FPB+hi/AWsG5ubmCfFyjbAZUU45fSykZZ3AAsKp
	 fdSlH9u5yIumKzKidWWSSxxjE1MvRGOjiRHlQv6+39AlppwStNdKRCJKe8IeubgH3c
	 U1GR7WVWYd7MvEWoOE5wrosQfE5u2i4g9Ayj7gPgSm+or8wxO9hWBhYiTOR1ld9Obe
	 LBJz4uGDnarR22rkrKb+EiBB2c0w4AZ1vEctukS9blJFE8xIsDrmjHJgx5tCw87CUD
	 taZ2ayjCf6oGs/rfbRDftLlw+rrdqfE3jUC8a/lB3BTEODoIpoJHy2aaF5mOz78PrG
	 cM3mHAQFHGcEw==
Date: Thu, 28 Aug 2025 23:56:30 +0200
From: Drew Fustini <fustini@kernel.org>
To: Matt Coster <matt.coster@imgtec.com>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Frank Binns <frank.binns@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v13 3/4] riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU
 node
Message-ID: <aLDQjq9U_mDvMTJo@gen8>
References: <20250822-apr_14_for_sending-v13-0-af656f7cc6c3@samsung.com>
 <CGME20250821222023eucas1p1805feda41e485de76c2981beb8b9102d@eucas1p1.samsung.com>
 <20250822-apr_14_for_sending-v13-3-af656f7cc6c3@samsung.com>
 <aKjWiU4fQw3k77GR@x1>
 <aK-BwY8c-OR_WqNk@thelio>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aK-BwY8c-OR_WqNk@thelio>
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

On Wed, Aug 27, 2025 at 03:08:01PM -0700, Drew Fustini wrote:
> On Fri, Aug 22, 2025 at 01:43:53PM -0700, Drew Fustini wrote:
> > On Fri, Aug 22, 2025 at 12:20:17AM +0200, Michal Wilczynski wrote:
> > > Add a device tree node for the IMG BXM-4-64 GPU present in the T-HEAD
> > > TH1520 SoC used by the Lichee Pi 4A board. This node enables support for
> > > the GPU using the drm/imagination driver.
> > > 
> > > By adding this node, the kernel can recognize and initialize the GPU,
> > > providing graphics acceleration capabilities on the Lichee Pi 4A and
> > > other boards based on the TH1520 SoC.
> > > 
> > > Add fixed clock gpu_mem_clk, as the MEM clock on the T-HEAD SoC can't be
> > > controlled programatically.
> > > 
> > > Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > Reviewed-by: Drew Fustini <drew@pdp7.com>
> > > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > Acked-by: Matt Coster <matt.coster@imgtec.com>
> > > Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> > > ---
> > >  arch/riscv/boot/dts/thead/th1520.dtsi | 21 +++++++++++++++++++++
> > >  1 file changed, 21 insertions(+)
> > 
> > I've applied this to thead-dt-for-next [1]:
> > 
> > 0f78e44fb857 ("riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU node")
> > 
> > Thanks,
> > Drew
> > 
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/log/?h=thead-dt-for-next
> 
> Hi Matt,
> 
> Do you know when the dt binding patch will be applied to
> the drm-misc/for-linux-next tree?
> 
> I applied the dts patch but it is creating a warning in next right now.
> If the binding won't show up soon in drm-misc, then I'll remove this dts
> patch from next as dtbs_check is now failing in next. I can add it back
> once the binding makes it to next.

I've now removed this patch from thead-dt-for-next and will add it back
once the bindings show up in next.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
