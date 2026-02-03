Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 985B5E8306E
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Feb 2026 09:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xLngrFud2GRkY5jIWR4BBEWQ33PtwEMNbxaB3FzdbsI=; b=mh0UbvSEcT0TiV
	QvA5Waz6wyzwpF5Hb4Yxowbb5WiY71514Vca4pZVjYeKeHjytPgOqO/y+/VgXJgjBJ5yncz5YrPzF
	DoXYPv3jbkY75rEmjtJKJRD5wshvBMPNsguCJWT1QO1MY6CSPmmh/fe9kRHkrLVrs5lmZzD0qWnzD
	W6aH/aqDSTa7mCvI0rBUSTDcJOb6UjI28n4yiBEns0OhJgnU3yF2tQ8YFUgPi1lfWjY05iTHTcd4A
	9ENiHvQB0+fOvIi0k1Z12/qLmpUkn3s3J2PkMvHeevtAYybNJChSHWzDg8Tn8RtQeR7IKguJ9r3hZ
	UHeDQKTs8TVE90+FfgmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnCXR-00000006MUo-0pZr;
	Tue, 03 Feb 2026 09:17:37 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnCXO-00000006MU9-3FMQ
	for linux-riscv@lists.infradead.org;
	Tue, 03 Feb 2026 09:17:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770110251;
	bh=cBIbAwNwla2fC+OQSZLKWgNR2kKKKXuZC77zlvR3EkM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qBkufrCKICBVVk2qxfskAIumkZvmYERz3287sjciVw50ZM7OZNaCeoQgNByPBgEWQ
	 GPuDXaUio33B4VhBjag5+qwRowqURR2SfhON9vrW2EcVZ6QvnUHfhDdvxo76Q5/wwd
	 9CjVDPtUD6r0fRtS60BpF5/ewMWz+W26A+zgEiPgxA65NpPJsGglTH0u5VORZZUbW5
	 z25Rjz1T+g29QzBzyVvpiwPt/h+wgS8uxMSeVeKJV4lAC4IYESOsFQs/r/egAyKW4J
	 UqK290TR/aYsygxbF1Ddrj0WPYdarara+5cNtkkm3obb/B2wdENmYbWqaQtF8Sx+vt
	 xhTjl6tTJlmVw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9019B17E0927;
	Tue,  3 Feb 2026 10:17:30 +0100 (CET)
Date: Tue, 3 Feb 2026 10:17:26 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar
 <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Drew Fustini <fustini@kernel.org>, Guo Ren
 <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Uwe =?UTF-8?B?S2xlaW5lLUs=?=
 =?UTF-8?B?w7ZuaWc=?= <ukleinek@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda
 <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
Message-ID: <20260203101726.2cec1050@fedora>
In-Reply-To: <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
	<20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_011734_992791_3095E85C 
X-CRM114-Status: GOOD (  16.93  )
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

Hello Daniel,

On Wed, 07 Jan 2026 12:09:52 -0300
Daniel Almeida <daniel.almeida@collabora.com> wrote:

> -        /// Disable and unprepare the clock.
> +    impl Clk<Enabled> {
> +        /// Gets [`Clk`] corresponding to a bound [`Device`] and a connection id
> +        /// and then prepares and enables it.
>          ///
> -        /// Equivalent to calling [`Clk::disable`] followed by [`Clk::unprepare`].
> +        /// Equivalent to calling [`Clk::get`], followed by [`Clk::prepare`],
> +        /// followed by [`Clk::enable`].
>          #[inline]
> -        pub fn disable_unprepare(&self) {
> -            // SAFETY: By the type invariants, self.as_raw() is a valid argument for
> -            // [`clk_disable_unprepare`].
> -            unsafe { bindings::clk_disable_unprepare(self.as_raw()) };
> +        pub fn get(dev: &Device<Bound>, name: Option<&CStr>) -> Result<Clk<Enabled>> {
> +            Clk::<Prepared>::get(dev, name)?
> +                .enable()
> +                .map_err(|error| error.error)
> +        }
> +
> +        /// Behaves the same as [`Self::get`], except when there is no clock
> +        /// producer. In this case, instead of returning [`ENOENT`], it returns
> +        /// a dummy [`Clk`].
> +        #[inline]
> +        pub fn get_optional(dev: &Device<Bound>, name: Option<&CStr>) -> Result<Clk<Enabled>> {
> +            Clk::<Prepared>::get_optional(dev, name)?
> +                .enable()
> +                .map_err(|error| error.error)
> +        }
> +
> +        /// Attempts to disable the [`Clk`] and convert it to the [`Prepared`]
> +        /// state.
> +        #[inline]
> +        pub fn disable(self) -> Result<Clk<Prepared>, Error<Enabled>> {
> +            // We will be transferring the ownership of our `clk_get()` and
> +            // `clk_enable()` counts to `Clk<Prepared>`.
> +            let clk = ManuallyDrop::new(self);
> +
> +            // SAFETY: By the type invariants, `self.0` is a valid argument for
> +            // [`clk_disable`].
> +            unsafe { bindings::clk_disable(clk.as_raw()) };
> +
> +            Ok(Clk {
> +                inner: clk.inner,
> +                _phantom: PhantomData,
> +            })
>          }
>  
>          /// Get clock's rate.

Dunno if this has been mentioned already, but I belive the rate
getter/setter should be in the generic implementation. Indeed, it's
quite common for clock users to change the rate when the clk is
disabled to avoid unstable transitional state. The usual pattern for
that is:

	- clk_set_parent(my_clk, secondary_parent)
	- clk_disable[_unprepare](primary_parent) // (usually a PLL)
	- clk_set_rate(primary_parent)
	- clk[_prepare]_enable(primary_parent)
	- clk_set_parent(my_clk, primary_parent)

The case where the clk rate is changed while the clk is active is also
valid (usually fine when it's just a divider that's changed, because
there's no stabilization period).

> @@ -252,83 +429,31 @@ pub fn set_rate(&self, rate: Hertz) -> Result {
>          }
>      }

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
