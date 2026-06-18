Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE75CD98ED
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jun 2026 08:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jqk2ZkE8fyzZ544DIVhYX1rgVDrpa0a4jbckKThH4X4=; b=yrUoTaA+QU5d8O
	4rM9rPQsV5MxaM3Z9SRYISp8zvoYB8++idUcZhhhB/8muMBT+zhZmTuIeVuStk7qsreLLzDzhRqcG
	NrA2marQbWImRydrW+0wDhutwXrL6/GtlTiXSUc9NH7qpIM9lEtPpybYJgqmKfuZ4A1AE57uENEzp
	BgtCsKAH8ZDpqwnfP0CbKBfLs9fE30HnZgbaMXTXpwMT3/c5wYGGlNu+pmi2ofVwQ+Net6prUH2kK
	tP5UKdbtex9htyYPXdAZDgIAZel0yt18cfTvBwlnJksadg676FYwCOl7shJhPvaYq0FQfPeiqXOkT
	OTCrm+XQVRVEupR5lYXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa7pr-00000000pEi-2yuT;
	Thu, 18 Jun 2026 08:10:51 +0000
Received: from mail-43172.protonmail.ch ([185.70.43.172])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa7po-00000000pDy-1uCU
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jun 2026 08:10:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1781770246; x=1782029446;
	bh=il13JZXSJpfwDVrhPAiRTVZ2CIyzBfQKH8+hwIpyxAA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Wv+neOsHPNFrzUzR1T6c+Nm8SMdjfWY/pQfGR4t8YaGoAPK8NA8VKqx2HaH/wZ1ke
	 pEpTES0lpXf26srd6UW5QjMNjBl6UrqTGa7T7eyoe8uuq03xqMqIfzYA97u7h//1Qz
	 f1Oo0G5s8ab/+EWJvJBkFZy8JcwVELKGhDfhoHeUCf4RIqVOMe6gf7wBcpLMZd0UPa
	 LzZSecvPDXmSCGXid1Qqd4EwF8p0ldlilDHkgwoW1nSi2FA6Vj4LYEdyEwNKANN4Kd
	 SlEeVYtVVa3ALpHPpUanOg9Z1jhiKm95uzRmnrfnSsPNCzqNmYSwTIbddi2YoC/q+F
	 HuVuTEba7BFTw==
X-Pm-Submission-Id: 4ggthG5v2fz2ScNJ
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	=?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	Brian Masney <bmasney@redhat.com>,
	Boqun Feng <boqun@kernel.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-riscv@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v4 1/3] rust: clk: use the type-state pattern
Date: Thu, 18 Jun 2026 11:10:34 +0300
Message-ID: <20260618081037.35784-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260618-clk-type-state-v4-1-8be082786080@collabora.com>
References: <20260618-clk-type-state-v4-0-8be082786080@collabora.com> <20260618-clk-type-state-v4-1-8be082786080@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_011048_648394_4ED6D571 
X-CRM114-Status: GOOD (  30.90  )
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

On Thu, 18 Jun 2026 00:46:35 -0300
Daniel Almeida <daniel.almeida@collabora.com> wrote:

> The current Clk abstraction can still be improved on the following issues:
> 
> a) It only keeps track of a count to clk_get(), which means that users have
> to manually call disable() and unprepare(), or a variation of those, like
> disable_unprepare().
> 
> b) It allows repeated calls to prepare() or enable(), but it keeps no track
> of how often these were called, i.e., it's currently legal to write the
> following:
> 
> clk.prepare();
> clk.prepare();
> clk.enable();
> clk.enable();
> 
> And nothing gets undone on drop().
> 
> c) It adds a OptionalClk type that is probably not needed. There is no
> "struct optional_clk" in C and we should probably not add one.
> 
> d) It does not let a user express the state of the clk through the
> type system. For example, there is currently no way to encode that a Clk is
> enabled via the type system alone.
> 
> In light of the Regulator abstraction that was recently merged, switch this
> abstraction to use the type-state pattern instead. It solves both a) and b)
> by establishing a number of states and the valid ways to transition between
> them. It also automatically undoes any call to clk_get(), clk_prepare() and
> clk_enable() as applicable on drop(), so users do not have to do anything
> special before Clk goes out of scope.
> 
> It solves c) by removing the OptionalClk type, which is now simply encoded
> as a Clk whose inner pointer is NULL.
> 
> It solves d) by directly encoding the state of the Clk into the type, e.g.:
> Clk<Enabled> is now known to be a Clk that is enabled.
> 
> The INVARIANTS section for Clk is expanded to highlight the relationship
> between the states and the respective reference counts that are owned by
> each of them.
> 
> The examples are expanded to highlight how a user can transition between
> states, as well as highlight some of the shortcuts built into the API.
> 
> The current implementation is also more flexible, in the sense that it
> allows for more states to be added in the future. This lets us implement
> different strategies for handling clocks, including one that mimics the
> current API, allowing for multiple calls to prepare() and enable().
> 
> The users (cpufreq.rs/ rcpufreq_dt.rs) were updated by this patch (and not
> a separate one) to reflect the new changes. This is needed, because
> otherwise this patch would break the build.
> 
> Link: https://crates.io/crates/sealed [1]
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> ---
>  drivers/cpufreq/rcpufreq_dt.rs |   2 +-
>  drivers/gpu/drm/tyr/driver.rs  |  31 +--
>  drivers/pwm/pwm_th1520.rs      |  17 +-
>  rust/kernel/clk.rs             | 512 ++++++++++++++++++++++++++++++-----------
>  rust/kernel/cpufreq.rs         |   8 +-
>  5 files changed, 396 insertions(+), 174 deletions(-)
> 
> diff --git a/drivers/cpufreq/rcpufreq_dt.rs b/drivers/cpufreq/rcpufreq_dt.rs
> index f17bf64c22e2..9d2ec7df4bac 100644
> --- a/drivers/cpufreq/rcpufreq_dt.rs
> +++ b/drivers/cpufreq/rcpufreq_dt.rs
> @@ -40,7 +40,7 @@ struct CPUFreqDTDevice {
>      freq_table: opp::FreqTable,
>      _mask: CpumaskVar,
>      _token: Option<opp::ConfigToken>,
> -    _clk: Clk,
> +    _clk: Clk<kernel::clk::Unprepared>,
>  }
>  
>  #[derive(Default)]
> diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
> index 279710b36a10..a2230aebfea2 100644
> --- a/drivers/gpu/drm/tyr/driver.rs
> +++ b/drivers/gpu/drm/tyr/driver.rs
> @@ -3,7 +3,7 @@
>  use kernel::{
>      clk::{
>          Clk,
> -        OptionalClk, //
> +        Enabled, //
>      },
>      device::{
>          Bound,
> @@ -49,7 +49,7 @@ pub(crate) struct TyrPlatformDriverData {

[...]

> -        /// Disable and unprepare the clock.
> -        ///
> -        /// Equivalent to calling [`Clk::disable`] followed by [`Clk::unprepare`].
> +        /// Behaves the same as [`Self::get`], except when there is no clock
> +        /// producer. In this case, instead of returning [`ENOENT`], it returns
> +        /// a dummy [`Clk`].
>          #[inline]
> -        pub fn disable_unprepare(&self) {
> -            // SAFETY: By the type invariants, self.as_raw() is a valid argument for
> -            // [`clk_disable_unprepare`].
> -            unsafe { bindings::clk_disable_unprepare(self.as_raw()) };
> +        pub fn get_optional(dev: &Device<Bound>, name: Option<&CStr>) -> Result<Clk<Enabled>> {
> +            Clk::<Prepared>::get_optional(dev, name)?
> +                .enable()
> +                .map_err(|error| error.error)
> +        }
> +
> +        /// Attempts to disable the [`Clk`] and convert it to the [`Prepared`]

nit: I wouldn't use the word "Attempts" for an infallible function.

> +        /// state.
> +        #[inline]
> +        pub fn disable(self) -> Result<Clk<Prepared>, Error<Enabled>> {

This is an infallible function, you can return Clk<Prepared> directly.

Thanks,
Onur

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
> @@ -251,82 +544,31 @@ pub fn set_rate(&self, rate: Hertz) -> Result {
> +                // [`clk_unprepare`].

[...]

> +                unsafe { bindings::clk_unprepare(self.as_raw()) };
> +            }
>  
> -        fn deref(&self) -> &Clk {
> -            &self.0
> +            // SAFETY: By the type invariants, self.as_raw() is a valid argument for
> +            // [`clk_put`].
> +            unsafe { bindings::clk_put(self.as_raw()) };
>          }
>      }
>  }
> diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
> index d8d26870bea2..e837bb1010e0 100644
> --- a/rust/kernel/cpufreq.rs
> +++ b/rust/kernel/cpufreq.rs
> @@ -553,8 +553,12 @@ pub fn cpus(&mut self) -> &mut cpumask::Cpumask {
>      /// The caller must guarantee that the returned [`Clk`] is not dropped while it is getting used
>      /// by the C code.
>      #[cfg(CONFIG_COMMON_CLK)]
> -    pub unsafe fn set_clk(&mut self, dev: &Device, name: Option<&CStr>) -> Result<Clk> {
> -        let clk = Clk::get(dev, name)?;
> +    pub unsafe fn set_clk(
> +        &mut self,
> +        dev: &Device,
> +        name: Option<&CStr>,
> +    ) -> Result<Clk<crate::clk::Unprepared>> {
> +        let clk = Clk::<crate::clk::Unprepared>::get_unbound(dev, name)?;
>          self.as_mut_ref().clk = clk.as_raw();
>          Ok(clk)
>      }
> 
> -- 
> 2.54.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
