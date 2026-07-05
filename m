Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F6EC43458
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Jul 2026 00:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=efciYmLKCCN/cKoBWZ4O4d1Ct+CYQpLjsM9oNMrYGFg=; b=HOxOrYbhrj+xde
	6IzPXqFkadC7QbqdZ+5W55vZB0ZDoP7mxm1FPczvTYdscwlAMd2ANS5fjWqBgHbr6qkCUmOCEtRN8
	/BgHY9EuV6BMdPw80q/XC3++3yHEUH/wQStAiXi3juKnvxugOLU1hlUukuvxxXAHOOPHzO7XuDcvJ
	2huAGR+iHn0C7FZpq5LgWdUMfyxyNmuAXA/GeY2la1bOIfidYnYZuUBNhJCA3wXryvE3ggBjQbviz
	BFoS8WEdK4MG3ksC9NxqkrhAIZ4Ituikb1p+ZLdAZ/pp0zI9fOJn0bIAaRoQ762NULt9IzLL2O7Ya
	UpBZw3oidwmUDHzC3oSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgAsh-00000008sPl-2yy7;
	Sun, 05 Jul 2026 00:38:47 +0000
Received: from out-12.smtp.spacemail.com ([198.54.127.83])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgAse-00000008sPF-00K0
	for linux-riscv@lists.infradead.org;
	Sun, 05 Jul 2026 00:38:45 +0000
Received: from gurudas.dev (107-194-158-19.lightspeed.sntcca.sbcglobal.net [107.194.158.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4gt7rn4SRMz2x99;
	Sun, 05 Jul 2026 00:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gurudas.dev;
	s=spacemail; t=1783211915;
	bh=M633SL93BCN0PrL2e/cwx2xlbDs4y1U/AlCmHMhb3AI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NSAOyNTLPtXZ/k1vM23d4mp6kcF0MfY7hjEozE9ESHWUStbSSsqzbmiiD9bT9KmME
	 xnAufNEJYHbKrfK7MERrVnvmbFeMgkIx6GxHLHSyiCFyy3RCzqYObOgb2IM2gkSkEl
	 n5ETauFMijv8KmS/jXdluLdYQvgxUilcbOPVqAPT8FXUj6yRzgydyIO9gJ4MdAtdnt
	 cxQgrF191paqd10Z5zniDfAmO76GJCGEoWxy3mQV3UO+ca0IHbz6G7bc9o/6KLFbTN
	 eEaQWUGbFQiNK5sG4hbYbqVp7dDxT5pfkoyvnPCLpGPi6eDF8GCzqSTJ/ZeBQ4F+xV
	 T2FbStM6b4UEQ==
Date: Sat, 4 Jul 2026 17:38:31 -0700
From: Guru Das Srinagesh <linux@gurudas.dev>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Jens Axboe <axboe@kernel.dk>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	driver-core@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-pwm@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-block@vger.kernel.org, netdev@vger.kernel.org,
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/7] rust: Use kernel style vertical imports in various
 drivers
Message-ID: <akmnh0AKFfu9-OYn@gurudas.dev>
Mail-Followup-To: Andrew Lunn <andrew@lunn.ch>,
	Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Jens Axboe <axboe@kernel.dk>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	driver-core@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-pwm@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-block@vger.kernel.org, netdev@vger.kernel.org,
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
References: <20260628-b4-rust-vertical-imports-v1-0-98bc71d4810b@gurudas.dev>
 <c89a1bc8-6cc1-4e16-ac95-add389e45a2b@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c89a1bc8-6cc1-4e16-ac95-add389e45a2b@lunn.ch>
X-Envelope-From: linux@gurudas.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260704_173844_414907_B36B51C5 
X-CRM114-Status: GOOD (  17.20  )
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

On Mon, Jun 29, 2026 at 04:06:36PM +0200, Andrew Lunn wrote:
> On Sun, Jun 28, 2026 at 08:38:14PM -0700, Guru Das Srinagesh wrote:
> > Came across a recent commit bc58905eb07 ("samples: rust_misc_device: use
> > vertical import style") and found a few more locations that could
> > benefit from this cleanup. No functional changes.
> > 
> > Signed-off-by: Guru Das Srinagesh <linux@gurudas.dev>
> > ---
> > Guru Das Srinagesh (7):
> >       samples: rust_dma: use vertical import style
> >       pwm: th1520: use vertical import style
> >       cpufreq: rcpufreq_dt: use vertical import style
> >       block: rnull: use vertical import style
> >       net: phy: ax88796b: use vertical import style
> >       net: phy: qt2025: use vertical import style
> >       drm/nova: use vertical import style
> 
> You have multiple subsystems here, so you need to split this patch
> setup, per subsystem, and submit them separately. Maintainers only
> accept patchsets for their own subsystems.
> 
> For netdev, please take a read of:
> 
> https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html
> 
> You need to get the correct tree, and set the Subject: line correctly.
> 
>     Andrew

Hi Andrew,

Thanks for the feedback.

I was aware of the per-subsystem rule, but reasoned that since these changes are
purely about Rust import formatting coding style with no functional impact on any
subsystem, they might go through the rust-for-linux tree with acks from the
respective subsystem maintainers. The Rust coding style is independent of any
subsystem-specific guidelines.

Is that reasoning off-base, or is the right path to split these out per subsystem
regardless?

Miguel, could you please indicate if you have a preference here?

Thank you.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
