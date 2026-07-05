Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386DDC43458
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Jul 2026 15:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tXcJspuJg3UqRpVEE7JSa5JmdowUbFL+D4LvzOB3Sxc=; b=lWt/Dv2xkDi6WM
	ulbjFgBN9cgSmx7l8BWjGK/5CkxSkqGVcmUBRz/1mabkgDcbhReHgb7EKe82HNB7Y8LrgyOADl63r
	OSY9wi9BUe40P3YyvRHcOarEpjaB4EgHDXIoSEsMqYmRf0EbuycMWwDu9wTcLomxecpZKQLj/QHF2
	i9pPyvMeVYCiw8+tgLCHcL2g3C0WQpAwrtqwP2P8ai4pCYAo4K9bXi+voZ2BYkoZhWi1+YrXclMLK
	chsViVK4RWweLCVwUrzXkTbmo+lonhIOsWTYnwAJdhYaa96PK+qxWhMJUrtCXRyZF6JW/flnZT4d2
	1siNVTMVB8XRPArlBm4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgOO6-00000009Pub-1utk;
	Sun, 05 Jul 2026 15:04:06 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgOO3-00000009Pti-3yXP
	for linux-riscv@lists.infradead.org;
	Sun, 05 Jul 2026 15:04:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:To:From:Date:From:Sender:Reply-To:Subject:Date:
	Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=MjFyE/GuY4zCXOCWmZjS9nf5WEwFKlMosakxlzzhgKA=; b=u7Fb4+hmzFx3UipHSwoWedWBaU
	KSTZCMZWLVdMdrU31XEcUPWdZlHdz0ghtvmlN3vYOq03ljvEGr7J1v8LIogoINE9dgA7GCnG4mXCJ
	WS9CcL5vZF6JVFEG5lvN5eyR1iIHx3Uu1oP70Kxkp4a5WTenUj/5s6GW+Oe8Akb6oPZw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wgONV-00AqQj-DU; Sun, 05 Jul 2026 17:03:29 +0200
Date: Sun, 5 Jul 2026 17:03:29 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org,
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
Message-ID: <66d3d69d-0974-49e1-ad93-9295407f4b78@lunn.ch>
References: <20260628-b4-rust-vertical-imports-v1-0-98bc71d4810b@gurudas.dev>
 <c89a1bc8-6cc1-4e16-ac95-add389e45a2b@lunn.ch>
 <akmnh0AKFfu9-OYn@gurudas.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <akmnh0AKFfu9-OYn@gurudas.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_080404_012078_AA9E3634 
X-CRM114-Status: UNSURE (   7.37  )
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

> Is that reasoning off-base, or is the right path to split these out per subsystem
> regardless?

Adding to what others have said, some subsystems have there own CI
system which tests every patch. Does it build? Does it add new
warning, is sparse happy, are there more self test failures. What do
different AIs think of the patch etc. Cross subsystem patches don't
always hit the per subsystem CI tests.

So in general, it is better to submit per subsystem.

       Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
