Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E7CDD7236A
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jan 2026 10:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc:Subject:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NDYvCT7E9RMWjZ+zRdwJClrPYtA/x3fCDL8jHUTYD/0=; b=Q9RrEy7onE2zkT
	GfBI2FpLS0KBwNdFwtwEbfUK07OCyzHjwk6eYX9O7OB7m1kkEZUl1+ytJ3I/QYNnjB4zJmVZyMCo3
	iloIEDLY6Tew6pc1Cuc374rNBwHdGz0UCKS1UurbVpnjYU9Xc9hUMxSR/WH1rUKkI3EU1MN33JU8C
	rZHz1OmCeXd235rF0FSdrqtuVPMLrSYmaqgTjhsTuum3/VGImSTSc7w3rttfz8agRSjKRe0r2yl8+
	GT7ZVAW4jknaKYC91iXMBnVOBst3ERjNXS3Yy17SuUoQIS0y0zrID1qzIEqu3QSS88DkcoXp7pIq1
	sQ4z3aeG6WFJQ1Qmwkuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjEM1-00000008ij9-3c3E;
	Fri, 23 Jan 2026 10:25:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjEM0-00000008ij3-0VjA
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jan 2026 10:25:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2451360054;
	Fri, 23 Jan 2026 10:25:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB2C7C4CEF1;
	Fri, 23 Jan 2026 10:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769163922;
	bh=rJ4PnEjQ92Juv7kZRzfOisQ3OCIKnD1ngLkVqecNc9k=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=k0h2SByq5PfVLciYPhFHNrx7uY5AK0JigWp+8CNZ4ETAiuqQmj8SFs/zYtBJAw0ZA
	 QO9OCJDyziJ2dpVwP95QppS+/yf+vyXVIYff99i/OKJ6wfgGv+7Nn5PJuN/bDtOGYB
	 /CspVsbk73ZO02xc7gqWXpQsGFi6OuQ96PTC+OPNL+fBAuJfSID9Ic+0Dnhg4PkkMB
	 IkrRQxBlzTannrtwvJ9pYIH/qaUb9pDIsQDkmRsEg/OpYYbOIVr5dqXqfTm1EGAi8M
	 SnhJgnSyz0CogxKQ90MEoe4bIMRFXHgPQD9F2d4ctL3IvKm5X4nGqJlz+IfFEE+Uz/
	 bm1HG0hJwrkWw==
Mime-Version: 1.0
Date: Fri, 23 Jan 2026 11:25:15 +0100
Message-Id: <DFVW9MS5YLON.CVJDBYQKJ0P6@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>, "Viresh
 Kumar" <viresh.kumar@linaro.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Drew Fustini" <fustini@kernel.org>, "Guo Ren"
 <guoren@kernel.org>, "Fu Wei" <wefu@redhat.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-riscv@lists.infradead.org>,
 <linux-pwm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
To: "Maxime Ripard" <mripard@kernel.org>
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
 <20260108-delectable-fennec-of-sunshine-ffca19@houat>
 <98CD0BF6-3350-40B9-B8A9-F569AE3E3220@collabora.com>
 <20260119-thundering-tested-robin-4be817@houat>
 <aW4lCfUyumOKRRJm@google.com>
 <518D8B09-B9A1-4DB4-85CD-37A2DD3D5FB1@collabora.com>
 <DFSLCI9U4NCW.2HI2UPUI7G134@kernel.org>
 <20260119-weightless-pelican-of-anger-190db0@houat>
 <DFSN4FDCYHMW.3J3237PEBV2ZP@kernel.org>
 <20260122-majestic-masterful-jaguarundi-d0abde@houat>
In-Reply-To: <20260122-majestic-masterful-jaguarundi-d0abde@houat>
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

On Thu Jan 22, 2026 at 2:44 PM CET, Maxime Ripard wrote:
> On Mon, Jan 19, 2026 at 03:37:17PM +0100, Danilo Krummrich wrote:
>> I don't see the issue with devm_regmap_init_mmio_clk()? It takes a reference
>> count of the clock and prepares it when called and unprepares the clk in drops
>> its reference in regmap_mmio_free_context() called from the devres callback.
>> 
>> That something we can easily do with the current API, no?
>
> The current one, yes. Doing that in the API suggested here would involve
> some boilerplate in all those drivers they don't have right now.

No, I did mean the API suggested here.

If you would implement something like devm_regmap_init_mmio_clk() in Rust with
this API, you'd have some object like

	struct RegmapResource<T: Backend, R: Resource> {
	    map: Regmap<T>,
	    res: R,
	}

and a concrete instance could have the following type

	RegmapResource<MmIo, Clk<Prepared>>

So, eventually you could have:

	fn devm_regmap_init_mmio_clk(dev: &Device<Bound>,  name: &CStr, ...) -> ... {
	    let clk: Clk<Prepared> = Clk::get(dev, name)?;
	    let regmap = RegmapResource::new(..., clk);

	    Devres::new(dev, regmap)
	}

Of course, we would never design the API in this way, as we have generic I/O
backends and register abstractions, and we'd also not have
devm_regmap_init_mmio_clk() as a constructor for a RegmapResource type, but you
get the idea.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
