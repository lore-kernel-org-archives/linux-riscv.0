Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AFE4C55173
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Aug 2026 11:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v0aLS4JSufeRY/h26DS7ZPXhehuzgmURV1cDrMpclmg=; b=qyTUjwYfsWzRDm
	T8eviinXBHYjrbHG+1ShP7tAAEh4evvNQGQ3q+j0/5thRylf+7Z5/iQ5A/SXMQzBXMmjtEP1/x8lv
	RPFlAvsxdpqBI6xhh94AOUnUXNaphTWpx3cn1vWGPQcDFAZXA2Nse0uJyVxN2yDG1sJzoNfmb2Rhh
	i3JMclI5Bb4zyefsPQqcKJxaSzFkbatkqNFAXd4/ZdZUR7U0oX5s7R4a09V8/5n8pu037S4p2PToT
	5VJs+EYYAR908CO6yfNElsSoRI2apZyTMle9/G+Gt6iIa6tQjh37asOP8SKa1DjbIYC/6Cm2hyUes
	4WP8GsXg1oZNue23TaHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq7o7-0000000EFhB-3k2N;
	Sat, 01 Aug 2026 11:23:11 +0000
Received: from mail-244108.protonmail.ch ([109.224.244.108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq7o4-0000000EFdv-1zIM
	for linux-riscv@lists.infradead.org;
	Sat, 01 Aug 2026 11:23:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1785583379; x=1785842579;
	bh=gNRt5vhm5rzA0r9SYRg4vpPJmSNy2rVVGJFfnD3HI1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=GBjamsprGcj4PJ+2tZTITaCwpA1KPghVP4Ho1RdnnRiTjaoLl+mtI4hCDjYBkjLBD
	 82KdhJDeKUC6ujY02rLVX+E1evUhCj5oKPoxhK4rx6b+vSEy0MkLDc9QfVLW9CXQ/O
	 nTTnvcOMLqAxn1jP/gglcT78OMLop3pPKEj+mMgoNmbaTm2cEvHVaKNZeSSGIuDyj3
	 BacKGT25+a5IfltXpp5K+ufOdTr/zIaInIjO7KuOvmqeR0D0ueaHmsdtU7+kq6lQwk
	 kMgPlUQaPo3e10IA8o1AO0u5WjhU+Fuu5lzfIXz/MfaglekZclzpTiRTakMZdZzFC+
	 KKEqnuS5GK7CA==
X-Pm-Submission-Id: 4hC0sq5XCMz2Sd4d
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
	Boqun Feng <boqun@kernel.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-riscv@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Maurice <mhi@mailbox.org>
Subject: Re: [PATCH v5 3/4] rust: clk: add devres-managed clks
Date: Sat,  1 Aug 2026 14:22:52 +0300
Message-ID: <20260801112254.313381-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260706-clk-type-state-v5-3-67c5f326a16c@collabora.com>
References: <20260706-clk-type-state-v5-0-67c5f326a16c@collabora.com> <20260706-clk-type-state-v5-3-67c5f326a16c@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_042308_693113_FD651E2C 
X-CRM114-Status: GOOD (  17.12  )
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

On Mon, 06 Jul 2026 11:37:14 -0300
Daniel Almeida <daniel.almeida@collabora.com> wrote:

> The clk API allows fine-grained control, but some drivers might be
> more interested in a "set and forget" API.
> 
> Expand the current API to support this. The clock will automatically be
> disabled, unprepared and freed when the device is unbound from the bus
> without further intervention by the driver.
> 
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> ---
>  rust/kernel/clk.rs | 46 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/rust/kernel/clk.rs b/rust/kernel/clk.rs
> index dd5fd656271e..b9a44f83843a 100644
> --- a/rust/kernel/clk.rs
> +++ b/rust/kernel/clk.rs
> @@ -96,6 +96,52 @@ impl Sealed for super::Prepared {}
>          impl Sealed for super::Enabled {}
>      }
>  
> +    /// Obtains and enables a [`devres`]-managed [`Clk`] for a bound device.
> +    ///
> +    /// [`devres`]: crate::devres::Devres
> +    #[inline]
> +    pub fn devm_enable(dev: &Device<Bound>, name: Option<&CStr>) -> Result {
> +        let name = name.map_or(ptr::null(), |n| n.as_char_ptr());
> +
> +        // SAFETY: It is safe to call [`devm_clk_get_enabled`] with a valid

Intra-doc links won't work in regular comments.

> +        // device pointer.
> +        from_err_ptr(unsafe { bindings::devm_clk_get_enabled(dev.as_raw(), name) })?;
> +        Ok(())
> +    }
> +
> +    /// Obtains and enables a [`devres`]-managed [`Clk`] for a bound device.
> +    ///
> +    /// This does not print any error messages if the clock is not found.
> +    ///
> +    /// [`devres`]: crate::devres::Devres
> +    #[inline]
> +    pub fn devm_enable_optional(dev: &Device<Bound>, name: Option<&CStr>) -> Result {
> +        let name = name.map_or(ptr::null(), |n| n.as_char_ptr());
> +
> +        // SAFETY: It is safe to call [`devm_clk_get_optional_enabled`] with a
> +        // valid device pointer.
> +        from_err_ptr(unsafe { bindings::devm_clk_get_optional_enabled(dev.as_raw(), name) })?;
> +        Ok(())
> +    }
> +
> +    /// Same as [`devm_enable_optional`], but also sets the rate.
> +    #[inline]
> +    pub fn devm_enable_optional_with_rate(
> +        dev: &Device<Bound>,
> +        name: Option<&CStr>,
> +        rate: Hertz,
> +    ) -> Result {
> +        let name = name.map_or(ptr::null(), |n| n.as_char_ptr());
> +
> +        // SAFETY: It is safe to call
> +        // [`devm_clk_get_optional_enabled_with_rate`] with a valid device
> +        // pointer.
> +        from_err_ptr(unsafe {
> +            bindings::devm_clk_get_optional_enabled_with_rate(dev.as_raw(), name, rate.as_hz())
> +        })?;

Just fyi, there's currently a bug in the C implementation of
devm_clk_get_optional_enabled_with_rate() which I caught while reviewing your
series. The fix patch is already on the list [1]. Other than that, this LGTM.

[1]: https://lore.kernel.org/all/20260801111637.304590-1-work@onurozkan.dev

Regards,
Onur

> +        Ok(())
> +    }
> +
>      /// A trait representing the different states that a [`Clk`] can be in.
>      pub trait ClkState: private::Sealed {
>          /// Whether the clock is enabled in this state.
> 
> -- 
> 2.54.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
