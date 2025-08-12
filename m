Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E659CA0EC4
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 05:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RiL0ThBWuc3bNH6eibTQJsP6jicWgE9GIgmdV/0uyrc=; b=BSeUkwzuZbomZQ
	ex833B6fSqeiol2yuY4MWGsJCmiZWaE52m74m1KjfoDuN5a9YMhe2JdqsN+gZ+TaxGymQyVjUoLjT
	ysVteY7pfcWuKER/REH4Ig4ygXLySHQ6oMXxr7ljbfmHCwvJRp9mDlwuqdvUoiupjtiSVNVxK+EdG
	Xj76UYLAjfuD8DS0dfLuQJJrLRiaBhmmXvscSDAcyUh/P02k3Q0iv4RRGuweDnS1cRqYiAvnstKvj
	7q1KVP5FDQIOAAhGR3N76En7tlTohdjlW6kQnKfkL87knxXHFs/K5hgXJYLApFvIxCbaWv009SK1T
	DrzXP4aXEA3pSKuZ3pfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhjt-00000009trl-0DRb;
	Tue, 12 Aug 2025 05:40:01 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhjq-00000009tqc-3BuW
	for linux-riscv@lists.infradead.org;
	Tue, 12 Aug 2025 05:40:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C6427A55382;
	Tue, 12 Aug 2025 05:39:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A546C4CEF0;
	Tue, 12 Aug 2025 05:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754977197;
	bh=8Ka0sd8FxkjIz00jjTcMx5oRTqQPN4HlysV+S/vVdgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GE8wz8IMlrQ5frhZwhslxoZ05i34brKKZumRyQwF689QOSgTaFZ4QOtiuRFdLkKFo
	 T8FdEaLYiDtcdg0jBvfLspbmGk3B0Yvqb7JT8CYbJtUfaRLpE2UKWKHbihYErODUOt
	 BmPxM+qVmzdAwUiAch8OuSyRWgCO22dYFAbTPgOokj78zRc+EgY2yNpJkv90wiMYqu
	 /T6uG+wHR/R6gjdsAA8gftXTQmDlP8R+2BICsqJFlhtZfJVid+ODeHsFKviFyG0/Ud
	 HGDQkXVlBYcqGDPh8zSyl8U1T0opdAmMP1VLxRSuluHHibY1+mNyteI4yg644FX8XU
	 i9FhMfDk8ObzA==
Date: Mon, 11 Aug 2025 22:39:55 -0700
From: Drew Fustini <fustini@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Subject: Re: [PATCH] reset: thead: Scope TH1520 reset driver to VO subsystem
Message-ID: <aJrTq775sXTrsepl@x1>
References: <CGME20250810211419eucas1p173e5fefcfaae437d8b5531d1406ff6a6@eucas1p1.samsung.com>
 <20250810-fix_reset_2-v1-1-b0d1900ba578@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250810-fix_reset_2-v1-1-b0d1900ba578@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_223958_879827_28D740A9 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Guo Ren <guoren@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Aug 10, 2025 at 11:14:19PM +0200, Michal Wilczynski wrote:
> The reset controller driver for the TH1520 was using the generic
> compatible string "thead,th1520-reset". However, the current
> implementation only manages the resets for the Video Output (VO)
> subsystem.

Looking at Section 5.4 on Page 451 of the TH1520 System User Manual [1],
it does seem like we would ultimately need 6 separate nodes for reset
controllers:

 0xFF_EF01_4000: AP_SUBSYS
 0xFF_EC02_C000: MISC_SUBSYS
 0xFF_E404_0000: VI_SUBSYS
 0xFF_EF52_8000: VO_SUBSYS
 0xFF_ECC3_0000: VP_SUBSYS
 0xFF_EF04_0000: DSP_SUBSYS

Maybe we should take this opportunity to document the bindings for all
the resets that the REE (e.g. Linux) can control?

It seemed like that was overkill for the 2 resets needed for the GPU,
but, as Krzysztof noted in this thread, problems arise when bindings are
introduced that are not complete.

Thanks,
Drew

[1] https://git.beagleboard.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
