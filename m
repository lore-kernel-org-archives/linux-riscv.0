Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FDF9FC5904
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 07:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nGEig2pUvjB4A+gKK6rAR32ir793afcomc9aqPncgfk=; b=bQFJ/fKvKujvYa
	UwTT9ZTxZmGBumzykAETk245I9YAaGuGXMYm3ixuK2ZOZNzslJj6y2JAaZWUThohrNb69V+BSu7z0
	K4xQzHO56HCgg/dhKPBLW9PsPDMMcCPB2HZ3hE0Bvc4uBZxTeaL84WSwVrEsTfugNUoV0R92FiNiS
	PlRCaI+QPXPHJUERjpkBXNEjcY522k+EQiBAGQUct1MwHXBmHoqp+HjPL40YxAbG0SN1GrE1tuawV
	AIPM2XPPeqh1Bw3Svbocoa6JosLoOXe5tPnZpMk2NbVmEBrWGB2xqIodR0ePZP8/5s44nogw9/ZnF
	h/UkH/HIEM+ttcXbylQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvVRc-00000005XQK-0Z6E;
	Thu, 26 Feb 2026 07:05:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvVRb-00000005XPt-1OPM
	for linux-riscv@lists.infradead.org;
	Thu, 26 Feb 2026 07:05:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 67D1860054;
	Thu, 26 Feb 2026 07:05:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61791C19425;
	Thu, 26 Feb 2026 07:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772089554;
	bh=r8kkku+RUrykKo8TzZsoSH0+1fI5bqsKXvST33G+y+Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fVOUerUrp1sd8OJYr/FayxxGSv+keS2OvEIftB8YxZm/B44KcMB+dWGzHdh+iJtgO
	 Edo8ini3/qBAM2bn5TmdJj1j1rKeleWMYfuWf9rV6KV+pb0cmS/SmKMS6eW/uit2lo
	 HqJI9P4wGKuDz+rWyZxJUIMD3I6LQ9Dy0rw2afNEhI5apJgSZerdALhTDfs2N+bl/C
	 UwLL1W9rU91dKI3UICn0T4lNP4Etpj+B/RJ7YFjHXr+iwSmFk3j4+mroZ/61Hpc2uu
	 hPfPqiMDaJxOAqPFA3jdRN/Njbu7Q8AemmGO4mMTjtWKanxil+gsr5tJHfWYOSs4Cw
	 gURkzrb31HbDQ==
Date: Thu, 26 Feb 2026 12:35:50 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Longbin Li <looong.bin@gmail.com>, Ze Huang <huangze@whut.edu.cn>,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@kernel.org>
Subject: Re: (subset) [PATCH v3 0/3] riscv: sophgo: allow DMA multiplexer set
 channel number for DMA controller
Message-ID: <aZ_wziVgEPGOSAd3@vaman>
References: <20260120013706.436742-1-inochiama@gmail.com>
 <177201865381.93331.6104381063514168222.b4-ty@kernel.org>
 <aZ9z0gV8ZrfpL2JG@inochi.infowork>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aZ9z0gV8ZrfpL2JG@inochi.infowork>
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

On 26-02-26, 06:13, Inochi Amaoto wrote:
> On Wed, Feb 25, 2026 at 04:54:13PM +0530, Vinod Koul wrote:
> > 
> > On Tue, 20 Jan 2026 09:37:02 +0800, Inochi Amaoto wrote:
> > > As the DMA controller on Sophgo CV1800 series SoC only has 8 channels,
> > > the SoC provides a dma multiplexer to reuse the DMA channel. However,
> > > the dma multiplexer also controlls the DMA interrupt multiplexer, which
> > > means that the dma multiplexer needs to know the channel number.
> > > 
> > > Change the DMA phandle args parsing logic so it can use handshake
> > > number as channel number if necessary.
> > > 
> > > [...]
> > 
> > Applied, thanks!
> > 
> > [1/3] dt-bindings: dma: snps,dw-axi-dmac: Add CV1800B compatible
> >       commit: 5eda5f42d2fee87127b568206a9fcc07a2f6eab6
> > [2/3] dmaengine: dw-axi-dmac: Add support for CV1800B DMA
> >       commit: 02a380ea7ed2d737a42693d7957ec8c33a92d9fd
> > 
> > Best regards,
> > -- 
> > ~Vinod
> > 
> > 
> 
> Hi, Vinod
> 
> I guess you applied the version 4, but replied to the version 3?

Nope, I had already picked 3. so reply went on that.

-- 
~Vinod

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
