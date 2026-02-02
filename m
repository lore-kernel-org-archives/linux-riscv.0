Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A8BE7DEFC
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Feb 2026 16:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fd4GGJvbglxbJ9c3X5XeK85H7a+XV88DlkcXQwN3FA8=; b=qC4qZegZeWan3d
	8ztIOCqfUDvsGATKkgwO7AmULVtcBXQCKt1OsBhRCT7Uz7ffE0BwRh1xjOlv3zHVMPypsYzTx4MHW
	Fh21NgCzcTvoJXDOb6f5jA4rkDc6yFru48srvJDcHG2eiw9c9fGiaZhYbEv74yHkBOJbKSfRNWNrC
	W1DDqMkuv1x6vgtbJY5ymgu8E2gd72oYNyfbt7iOaVVT1tPb4dNPBkGtsio/VFUX1nzPI7FreEyR+
	BxfJN67aOXk+U3CJWEng71Wb8YJmhUWgRl9wyyuaGTf8b5tq0zVO4tCjQKYxqvI48mtvlc9DyY6yw
	gCNonHnWtj5MGlRTPNzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmwVq-00000005H4w-2nG6;
	Mon, 02 Feb 2026 16:10:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmwVp-00000005H4e-3qI0
	for linux-riscv@bombadil.infradead.org;
	Mon, 02 Feb 2026 16:10:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ikbZ1i/RyFQD0EvwvpZgjNI3juJpORnFlSYCGPupu0Y=; b=OvdtGdSfDcdbg9z29RdJx+Q6K2
	RyJuepz+wsROI9sKPlBc/QxHb9sHSivDRvu+yVelhhESoETGm9hK8t40nopComoiIzrn9cOOANiA9
	J/dR76MzwHQ9IUZiFtQ0trtatMvUAfz0ONqKynh0ALqD8D6jZ4llD0AZOLltquMcD/ZTNMOwcaRSy
	JcaLCE48xH2gonRPlQTYsr0KSlu2QxV+gY4K3qPomMz6Vh6X1fHXT5qUh/01c3K4KYEzyZR5vWQet
	lt62t/+wAJWZXxGuI0vYcDSdBGezAg4HRIUGJdqCg0qC915VBzt/tHF94S+SLrUM/ykPUXEzGL7Ti
	vhTMbIxQ==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmwVl-0000000EoBV-10qx
	for linux-riscv@lists.infradead.org;
	Mon, 02 Feb 2026 16:10:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770048644;
	bh=lgY3xynBWS6qvcthiKOlOb+Ph9aFwmFt+rqDpKZo9aU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oKR4m0BxCDsa35AvV87Kxi/T/JWn5q4Ecpk6cUo92FWRlCbwT4HqyHkBMhvEG8RKd
	 mypR1b41lYkA4yWB2LMkRnEsdKOGY1FfcxlCciJJmkxsa3l3MGxULKYEj0l5NJYdvo
	 xRejKT2rdZ35FS/eGhoB7hGmQieY+C/v7ghRk32W3+GW6NHMHW9dIl59zBcB4sbaW/
	 ivFu04K66tIv6RSOCIb2D+jJdBNWrXId91JTE3sV3Os46pRZYO2uuxjL/JVNuce6aC
	 v+pi6oit7ec+V5OD1u5kt1HZGhLti/0AC+BEWd7pxVjMQNdhRz3vepa+UDyXk+B05P
	 P1tOI/Pxhz4qg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 205B217E1274;
	Mon,  2 Feb 2026 17:10:43 +0100 (CET)
Date: Mon, 2 Feb 2026 17:10:38 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Gary Guo" <gary@garyguo.net>
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Viresh Kumar" <viresh.kumar@linaro.org>, "Danilo
 Krummrich" <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Drew
 Fustini" <fustini@kernel.org>, "Guo Ren" <guoren@kernel.org>, "Fu Wei"
 <wefu@redhat.com>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=
 <ukleinek@kernel.org>, "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun.feng@gmail.com>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-riscv@lists.infradead.org>,
 <linux-pwm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
Message-ID: <20260202171038.10e51e18@fedora>
In-Reply-To: <DFSMRQFIYQPO.1A38Y84XZ1GZO@garyguo.net>
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
	<20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
	<DFSMRQFIYQPO.1A38Y84XZ1GZO@garyguo.net>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_161049_428713_FD671EE4 
X-CRM114-Status: GOOD (  48.43  )
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

On Mon, 19 Jan 2026 14:20:43 +0000
"Gary Guo" <gary@garyguo.net> wrote:

> On Wed Jan 7, 2026 at 3:09 PM GMT, Daniel Almeida wrote:
> > The current Clk abstraction can still be improved on the following issues:
> >
> > a) It only keeps track of a count to clk_get(), which means that users have
> > to manually call disable() and unprepare(), or a variation of those, like
> > disable_unprepare().
> >
> > b) It allows repeated calls to prepare() or enable(), but it keeps no track
> > of how often these were called, i.e., it's currently legal to write the
> > following:
> >
> > clk.prepare();
> > clk.prepare();
> > clk.enable();
> > clk.enable();
> >
> > And nothing gets undone on drop().
> >
> > c) It adds a OptionalClk type that is probably not needed. There is no
> > "struct optional_clk" in C and we should probably not add one.
> >
> > d) It does not let a user express the state of the clk through the
> > type system. For example, there is currently no way to encode that a Clk is
> > enabled via the type system alone.
> >
> > In light of the Regulator abstraction that was recently merged, switch this
> > abstraction to use the type-state pattern instead. It solves both a) and b)
> > by establishing a number of states and the valid ways to transition between
> > them. It also automatically undoes any call to clk_get(), clk_prepare() and
> > clk_enable() as applicable on drop(), so users do not have to do anything
> > special before Clk goes out of scope.
> >
> > It solves c) by removing the OptionalClk type, which is now simply encoded
> > as a Clk whose inner pointer is NULL.
> >
> > It solves d) by directly encoding the state of the Clk into the type, e.g.:
> > Clk<Enabled> is now known to be a Clk that is enabled.
> >
> > The INVARIANTS section for Clk is expanded to highlight the relationship
> > between the states and the respective reference counts that are owned by
> > each of them.
> >
> > The examples are expanded to highlight how a user can transition between
> > states, as well as highlight some of the shortcuts built into the API.
> >
> > The current implementation is also more flexible, in the sense that it
> > allows for more states to be added in the future. This lets us implement
> > different strategies for handling clocks, including one that mimics the
> > current API, allowing for multiple calls to prepare() and enable().
> >
> > The users (cpufreq.rs/ rcpufreq_dt.rs) were updated by this patch (and not
> > a separate one) to reflect the new changes. This is needed, because
> > otherwise this patch would break the build.
> >
> > Link: https://crates.io/crates/sealed [1]
> > Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> > ---
> >  drivers/cpufreq/rcpufreq_dt.rs |   2 +-
> >  drivers/gpu/drm/tyr/driver.rs  |  31 +---
> >  drivers/pwm/pwm_th1520.rs      |  17 +-
> >  rust/kernel/clk.rs             | 399 +++++++++++++++++++++++++++--------------
> >  rust/kernel/cpufreq.rs         |   8 +-
> >  5 files changed, 281 insertions(+), 176 deletions(-)
> >
> > diff --git a/drivers/cpufreq/rcpufreq_dt.rs b/drivers/cpufreq/rcpufreq_dt.rs
> > index 31e07f0279db..f1bd7d71ed54 100644
> > --- a/drivers/cpufreq/rcpufreq_dt.rs
> > +++ b/drivers/cpufreq/rcpufreq_dt.rs
> > @@ -41,7 +41,7 @@ struct CPUFreqDTDevice {
> >      freq_table: opp::FreqTable,
> >      _mask: CpumaskVar,
> >      _token: Option<opp::ConfigToken>,
> > -    _clk: Clk,
> > +    _clk: Clk<kernel::clk::Unprepared>,
> >  }
> >  
> >  #[derive(Default)]
> > diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
> > index 09711fb7fe0b..5692def25621 100644
> > --- a/drivers/gpu/drm/tyr/driver.rs
> > +++ b/drivers/gpu/drm/tyr/driver.rs
> > @@ -2,7 +2,7 @@
> >  
> >  use kernel::c_str;
> >  use kernel::clk::Clk;
> > -use kernel::clk::OptionalClk;
> > +use kernel::clk::Enabled;
> >  use kernel::device::Bound;
> >  use kernel::device::Core;
> >  use kernel::device::Device;
> > @@ -37,7 +37,7 @@ pub(crate) struct TyrDriver {
> >      device: ARef<TyrDevice>,
> >  }
> >  
> > -#[pin_data(PinnedDrop)]
> > +#[pin_data]
> >  pub(crate) struct TyrData {
> >      pub(crate) pdev: ARef<platform::Device>,
> >  
> > @@ -92,13 +92,9 @@ fn probe(
> >          pdev: &platform::Device<Core>,
> >          _info: Option<&Self::IdInfo>,
> >      ) -> impl PinInit<Self, Error> {
> > -        let core_clk = Clk::get(pdev.as_ref(), Some(c_str!("core")))?;
> > -        let stacks_clk = OptionalClk::get(pdev.as_ref(), Some(c_str!("stacks")))?;
> > -        let coregroup_clk = OptionalClk::get(pdev.as_ref(), Some(c_str!("coregroup")))?;
> > -
> > -        core_clk.prepare_enable()?;
> > -        stacks_clk.prepare_enable()?;
> > -        coregroup_clk.prepare_enable()?;
> > +        let core_clk = Clk::<Enabled>::get(pdev.as_ref(), Some(c_str!("core")))?;  
> 
> Ah, more turbofish.. I'd really want to avoid them if possible.
> 
> Any disadvantage on just ask the user to chain `.get().prepare_enable()?`? This
> way it is also clear that some action is performed.

I've just disc

> 
> Alternatively, I think function names that mimick C API is also fine, e.g.
> `Clk::get_enabled`.
> 
> > +        let stacks_clk = Clk::<Enabled>::get_optional(pdev.as_ref(), Some(c_str!("stacks")))?;
> > +        let coregroup_clk = Clk::<Enabled>::get_optional(pdev.as_ref(), Some(c_str!("coregroup")))?;
> >  
> >          let mali_regulator = Regulator::<regulator::Enabled>::get(pdev.as_ref(), c_str!("mali"))?;
> >          let sram_regulator = Regulator::<regulator::Enabled>::get(pdev.as_ref(), c_str!("sram"))?;
> > @@ -145,17 +141,6 @@ impl PinnedDrop for TyrDriver {
> >      fn drop(self: Pin<&mut Self>) {}
> >  }
> >  
> > -#[pinned_drop]
> > -impl PinnedDrop for TyrData {
> > -    fn drop(self: Pin<&mut Self>) {
> > -        // TODO: the type-state pattern for Clks will fix this.
> > -        let clks = self.clks.lock();
> > -        clks.core.disable_unprepare();
> > -        clks.stacks.disable_unprepare();
> > -        clks.coregroup.disable_unprepare();
> > -    }
> > -}
> > -
> >  // We need to retain the name "panthor" to achieve drop-in compatibility with
> >  // the C driver in the userspace stack.
> >  const INFO: drm::DriverInfo = drm::DriverInfo {
> > @@ -181,9 +166,9 @@ impl drm::Driver for TyrDriver {
> >  
> >  #[pin_data]
> >  struct Clocks {
> > -    core: Clk,
> > -    stacks: OptionalClk,
> > -    coregroup: OptionalClk,
> > +    core: Clk<Enabled>,
> > +    stacks: Clk<Enabled>,
> > +    coregroup: Clk<Enabled>,
> >  }
> >  
> >  #[pin_data]
> > diff --git a/drivers/pwm/pwm_th1520.rs b/drivers/pwm/pwm_th1520.rs
> > index 043dc4dbc623..f4d03b988533 100644
> > --- a/drivers/pwm/pwm_th1520.rs
> > +++ b/drivers/pwm/pwm_th1520.rs
> > @@ -23,7 +23,7 @@
> >  use core::ops::Deref;
> >  use kernel::{
> >      c_str,
> > -    clk::Clk,
> > +    clk::{Clk, Enabled},
> >      device::{Bound, Core, Device},
> >      devres,
> >      io::mem::IoMem,
> > @@ -90,11 +90,11 @@ struct Th1520WfHw {
> >  }
> >  
> >  /// The driver's private data struct. It holds all necessary devres managed resources.
> > -#[pin_data(PinnedDrop)]
> > +#[pin_data]
> >  struct Th1520PwmDriverData {
> >      #[pin]
> >      iomem: devres::Devres<IoMem<TH1520_PWM_REG_SIZE>>,
> > -    clk: Clk,
> > +    clk: Clk<Enabled>,
> >  }
> >  
> >  impl pwm::PwmOps for Th1520PwmDriverData {
> > @@ -299,13 +299,6 @@ fn write_waveform(
> >      }
> >  }
> >  
> > -#[pinned_drop]
> > -impl PinnedDrop for Th1520PwmDriverData {
> > -    fn drop(self: Pin<&mut Self>) {
> > -        self.clk.disable_unprepare();
> > -    }
> > -}
> > -
> >  struct Th1520PwmPlatformDriver;
> >  
> >  kernel::of_device_table!(
> > @@ -326,9 +319,7 @@ fn probe(
> >          let dev = pdev.as_ref();
> >          let request = pdev.io_request_by_index(0).ok_or(ENODEV)?;
> >  
> > -        let clk = Clk::get(dev, None)?;
> > -
> > -        clk.prepare_enable()?;
> > +        let clk = Clk::<Enabled>::get(dev, None)?;
> >  
> >          // TODO: Get exclusive ownership of the clock to prevent rate changes.
> >          // The Rust equivalent of `clk_rate_exclusive_get()` is not yet available.
> > diff --git a/rust/kernel/clk.rs b/rust/kernel/clk.rs
> > index d192fbd97861..6323b40dc7ba 100644
> > --- a/rust/kernel/clk.rs
> > +++ b/rust/kernel/clk.rs
> > @@ -80,17 +80,78 @@ fn from(freq: Hertz) -> Self {
> >  mod common_clk {
> >      use super::Hertz;
> >      use crate::{
> > -        device::Device,
> > +        device::{Bound, Device},
> >          error::{from_err_ptr, to_result, Result},
> >          prelude::*,
> >      };
> >  
> > -    use core::{ops::Deref, ptr};
> > +    use core::{marker::PhantomData, mem::ManuallyDrop, ptr};
> > +
> > +    mod private {
> > +        pub trait Sealed {}
> > +
> > +        impl Sealed for super::Unprepared {}
> > +        impl Sealed for super::Prepared {}
> > +        impl Sealed for super::Enabled {}
> > +    }  
> 
> I guess it's time for me to work on a `#[sealed]` macro...
> 
> > +
> > +    /// A trait representing the different states that a [`Clk`] can be in.
> > +    pub trait ClkState: private::Sealed {
> > +        /// Whether the clock should be disabled when dropped.
> > +        const DISABLE_ON_DROP: bool;
> > +
> > +        /// Whether the clock should be unprepared when dropped.
> > +        const UNPREPARE_ON_DROP: bool;
> > +    }
> > +
> > +    /// A state where the [`Clk`] is not prepared and not enabled.  
> 
> Do we want to make it explicit that it's "not known to be prepared or
> enabled"?
> 
> > +    pub struct Unprepared;
> > +
> > +    /// A state where the [`Clk`] is prepared but not enabled.
> > +    pub struct Prepared;
> > +
> > +    /// A state where the [`Clk`] is both prepared and enabled.
> > +    pub struct Enabled;
> > +
> > +    impl ClkState for Unprepared {
> > +        const DISABLE_ON_DROP: bool = false;
> > +        const UNPREPARE_ON_DROP: bool = false;
> > +    }
> > +
> > +    impl ClkState for Prepared {
> > +        const DISABLE_ON_DROP: bool = false;
> > +        const UNPREPARE_ON_DROP: bool = true;
> > +    }
> > +
> > +    impl ClkState for Enabled {
> > +        const DISABLE_ON_DROP: bool = true;
> > +        const UNPREPARE_ON_DROP: bool = true;
> > +    }
> > +
> > +    /// An error that can occur when trying to convert a [`Clk`] between states.
> > +    pub struct Error<State: ClkState> {
> > +        /// The error that occurred.
> > +        pub error: kernel::error::Error,
> > +
> > +        /// The [`Clk`] that caused the error, so that the operation may be
> > +        /// retried.
> > +        pub clk: Clk<State>,
> > +    }  
> 
> I wonder if it makes sense to add a general `ErrorWith` type for errors that
> carries error code + data.
> 
> Best,
> Gary


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
