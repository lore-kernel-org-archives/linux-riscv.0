Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA9AC43458
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 17:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bo/oBbykBTFZDaHt+Z1izqAYDB+VUHNvv1MYwdCy/uo=; b=N6hRkbwx1RK+qf
	j6x54U13mKhHbyj5kLdnqWRD0EjYD+hJV/07rqEsKqa4g4U+NoqyT9fYB7RQPRONSawSrkNTqieUj
	OA4Qta2Tf0BYquChIZs51MPGTwvNcEfEfZryyNrwmqR8hFyw9r7+wT9JQqm0paPsMuZ7Yj/lyiqF8
	zbZ61jqH/9mtFpYoG0uVF3pHxAWA36xvXPsghvYprf7cbH53nvJB37nU0DhdO/yW74h9+SaqXEZOA
	VjgnJiFINsiMwtoV0ckRCHdkbafLLWoqD7StOVlU988dZqKwd5KLC4y6F/w9lT55mYLpvgoKAvlLe
	UqGBRUD5ggh2uaQ8HFxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh9qB-0000000Fa1t-26OZ;
	Tue, 07 Jul 2026 17:44:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh9q9-0000000Fa1c-2WYF
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jul 2026 17:44:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 952AB60018;
	Tue,  7 Jul 2026 17:44:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61AB81F000E9;
	Tue,  7 Jul 2026 17:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783446252;
	bh=Zt8E+1trE9oRAcQDrpe/0wnlVS0OZnmKDKkcj23hYuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D957RX0IpErWZM/MCZ+ps2XaOcETGk2gKfxVfzgiLneaVo7T+VH1Uc9StyaeZB+je
	 PHDetHBGPW/SHtcjF4t8RGP6sJmxXpu0ymGHAY5I4vfXa9jhJOAmD+TbsyLiOjF72k
	 nvnoTwZ41987n85WR17vI7qz+SZc2HX3xOd8BzQQZOmIzreGfN86ZXoVGbUwv4DbbP
	 4fUj77fsRVx+FGU9QdrOJQUxxTOOIxPTrkKhZMr7AjtWT3nboRC8bMj24Btg+kX2Gb
	 A0C6OznbzqpN+jV6FYxbHfLGdDQ3Mr3WU4IVtpudOEunxW0rNtgJ5AK8yIGYSEFljD
	 mgkxYa+7Q6dVA==
Date: Tue, 7 Jul 2026 10:44:06 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Wende Tan <twd2.me@gmail.com>, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Nam Cao <namcao@linutronix.de>, kernel test robot <lkp@intel.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] riscv: vdso: Do not use LTO for the vDSO
Message-ID: <20260707174406.GA991448@ax162>
References: <20260701-riscv-vdso-lto-v1-0-89db0cd82077@linutronix.de>
 <20260701-riscv-vdso-lto-v1-1-89db0cd82077@linutronix.de>
 <20260706210158.GA73349@ax162>
 <20260707080753-4e88aca1-b88d-4f6c-b37a-f7f3064bda5e@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260707080753-4e88aca1-b88d-4f6c-b37a-f7f3064bda5e@linutronix.de>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jul 07, 2026 at 08:10:19AM +0200, Thomas Wei=DFschuh wrote:
> On Mon, Jul 06, 2026 at 02:01:58PM -0700, Nathan Chancellor wrote:
> > On Wed, Jul 01, 2026 at 11:21:22AM +0200, Thomas Wei=DFschuh wrote:
> > > With LTO enabled the compiler assumes that the vDSO functions are not
> > > used and optimizes them away completely. Currently this happens to
> > > __vdso_clock_getres(), __vdso_clock_gettime(), __vdso_getrandom(),
> > > __vdso_gettimeofday() and __vdso_riscv_hwprobe().
> > > =

> > > Disable LTO for the vDSO, as these functions are hand-optimized anywa=
ys.
> > > =

> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes: https://lore.kernel.org/oe-kbuild-all/202606301855.WvkSC4kD-l=
kp@intel.com/
> > =

> > While this change seems correct, is this really the fix for that report?
> > It seems like that error happens in clang but I would expect this sort
> > of issue to only appear once LTO has run through ld.lld?
> =

> At this point the vDSO userspace library has already run through ld.lld.
> That has optimized away the futex symbols, which means their offsets are =
not
> defined when building the regular vDSO *kernel* code.

Ahhh, thanks for the additional clarification! That makes much more
sense, I had missed that we were in kernel code, not userspace.

-- =

Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
