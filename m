Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC1B5C43602
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 14:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jv85jjvpNh7eRODmAPMBg/N1Jj5/n2JqxIle0sKaGDM=; b=cWOywQjWhlxR4r
	23MDAza/wuPvEDtowb0v+FnbtpRRd+oERU2D5yh37UhpZx2RXFatlqQMz53ONjjTRjgu72OO2+2/J
	ZqITrQCSBkXFzLIAoyKplabJ9/bdRUdYdvNldBiMef1YoJys1agsRSHgOPzmXyg0dr/wNxisTyJmJ
	U7+mvlVPhBxlCybk+hfvIa9+T6j+Xp/VW1uNLUj1dqeeE5Fj7N8Zw1dJNaOSokwNWKNz4GnogTExy
	RDXfXXDlW/a8Z7ZCRrqmTPr7SC2kkQgwvc/9i82u1aTWVUSst8SoaEfFCb/5oj6UUG7HJRGlAM/kb
	IN+u9rpVWCbf0KYloyUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weCe1-0000000Epsg-1ijT;
	Mon, 29 Jun 2026 14:07:29 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weCdy-0000000Eprl-1cgZ
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jun 2026 14:07:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=AK6FrYtKSIh8cngqIV8WnN9GXpQxjhIF++nUuJZfwbU=; b=sPe3Iq+2B0cNSg858/MXj17mqs
	nGlNw4jzWt1Blm83SZhOTLuScCneipEQxYrk7fXoJmwYNeCbx8QSg1zGqipMB+jk5FPKkzUkyFMIs
	HpGichrCIBqHOm8y6SCjU5HgKkXaATkMgoXLLY+KqvXdNOnkRWFnviWgOcyKmCa5rfCU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1weCdA-009lYC-UB; Mon, 29 Jun 2026 16:06:36 +0200
Date: Mon, 29 Jun 2026 16:06:36 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Guru Das Srinagesh <linux@gurudas.dev>
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
Message-ID: <c89a1bc8-6cc1-4e16-ac95-add389e45a2b@lunn.ch>
References: <20260628-b4-rust-vertical-imports-v1-0-98bc71d4810b@gurudas.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260628-b4-rust-vertical-imports-v1-0-98bc71d4810b@gurudas.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_070726_422533_20CA1303 
X-CRM114-Status: UNSURE (   9.76  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Jun 28, 2026 at 08:38:14PM -0700, Guru Das Srinagesh wrote:
> Came across a recent commit bc58905eb07 ("samples: rust_misc_device: use
> vertical import style") and found a few more locations that could
> benefit from this cleanup. No functional changes.
> 
> Signed-off-by: Guru Das Srinagesh <linux@gurudas.dev>
> ---
> Guru Das Srinagesh (7):
>       samples: rust_dma: use vertical import style
>       pwm: th1520: use vertical import style
>       cpufreq: rcpufreq_dt: use vertical import style
>       block: rnull: use vertical import style
>       net: phy: ax88796b: use vertical import style
>       net: phy: qt2025: use vertical import style
>       drm/nova: use vertical import style

You have multiple subsystems here, so you need to split this patch
setup, per subsystem, and submit them separately. Maintainers only
accept patchsets for their own subsystems.

For netdev, please take a read of:

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html

You need to get the correct tree, and set the Subject: line correctly.

    Andrew

---
pw-bot: cr

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
