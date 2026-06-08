Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7462CD8C9D
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 11:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tpi5ua/xdlRNFXmwrF6b7RHlcjnunrnfithMJEsoJUQ=; b=tU41Yk9/5OxH0d
	Xxk63f3DvECwpRhqRnn06hxcnj+3alOqKIYtZ0qU5B7GozhILxWivufdWTxiVyXSGpxPzxJyADUAX
	kvb05QI/mDe6cR4pEK6/SFknA5EqRSm+hE3eV+Bp0oJ1CA5GCJZSvPSCfTjLG9og9Q6hAyGraXYYK
	YqEh8azkPTd6BJwNgZoiRfg4sDixmxlZ2r/gQz+8TKQ0DqDCsuqFb4qR9CJj3/567t84x9/k+oZw8
	1NGWfeQ6XPNnSWAqo4pJQoypkUUwtAF0s3QjTnxdx/1rWwHAC2DcAWtQUER10gCcNC4WlnFg52ld1
	fqiM6ySlaCnJMdbJMonQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWXrK-00000003OY3-2tTA;
	Mon, 08 Jun 2026 11:09:34 +0000
Received: from mail-244107.protonmail.ch ([109.224.244.107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWXrG-00000003OX5-19My
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 11:09:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1780916965; x=1781176165;
	bh=yE0kow4cPVmFeFmEU4SXwVIDnwzfPDzpouaEmX4Fpfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=NsXeS3L04i15iimqeQaZUZYdMfXHdM6AtyVzrrKg6DzkZAeUqnoVni7BzJWv9tRFy
	 md3+OCdXghTfJSoR7pe0a32hH6HbsE3/WiSon673+Vzdp7zjehk0QrZuFh8V7JUADg
	 VagBPktDkP4duqhHP0LKSf3pbngkzHAxrYI/+t66RRB2Nbbi/cMmjkNTxluw+wB1sz
	 EqHNtng0Aw6ptyHkF0y/b0/bBKW/ke9ZZxYQ0Sym5HHdXGxDoN8veFLY/PYa/aUXO+
	 QXLE2vECd+/1NoVCBvSNLCAPl+xobUREhrcqv0ZNrJ1kW7+EgxZHeVY7vGViw7Bi+N
	 haetP5ApFakYg==
X-Pm-Submission-Id: 4gYq755lFlz2ScNk
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Maurice Hieronymus <mhi@mailbox.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	=?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-clk@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH v2 1/2] rust: clk: Add ExclusiveClk wrapper for clk_rate_exclusive_get
Date: Mon,  8 Jun 2026 14:09:13 +0300
Message-ID: <20260608110920.422773-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260605-rate-exclusive-get-th1520-v2-1-695640bf7249@mailbox.org>
References: <20260605-rate-exclusive-get-th1520-v2-0-695640bf7249@mailbox.org> <20260605-rate-exclusive-get-th1520-v2-1-695640bf7249@mailbox.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_040931_084477_55404308 
X-CRM114-Status: GOOD (  14.24  )
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

On Fri, 05 Jun 2026 08:59:59 +0200
Maurice Hieronymus <mhi@mailbox.org> wrote:

> Add Rust bindings for clk_rate_exclusive_get() and
> clk_rate_exclusive_put().
> 
> Clk::rate_exclusive_get() consumes the Clk and returns an ExclusiveClk;
> the matching put is issued from its Drop impl. ExclusiveClk derefs to
> Clk so existing rate / prepare / enable APIs remain available on the
> locked handle.
> 
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Maurice Hieronymus <mhi@mailbox.org>
> ---
>  rust/kernel/clk.rs | 60 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
> 
> diff --git a/rust/kernel/clk.rs b/rust/kernel/clk.rs
> index 7abbd0767d8c..f834f4833f18 100644
> --- a/rust/kernel/clk.rs
> +++ b/rust/kernel/clk.rs
> @@ -249,6 +249,22 @@ pub fn set_rate(&self, rate: Hertz) -> Result {
>              // [`clk_set_rate`].
>              to_result(unsafe { bindings::clk_set_rate(self.as_raw(), rate.as_hz()) })
>          }
> +
> +        /// Acquire exclusive control over the clock's rate.
> +        ///
> +        /// Consumes the [`Clk`] and returns an [`ExclusiveClk`] that releases the exclusivity
> +        /// when dropped. While held, no other consumer may change the clock's rate.
> +        ///
> +        /// Equivalent to the kernel's [`clk_rate_exclusive_get`] API. Must not be called from
> +        /// atomic context.
> +        ///
> +        /// [`clk_rate_exclusive_get`]: https://docs.kernel.org/core-api/kernel-api.html#c.clk_rate_exclusive_get
> +        pub fn rate_exclusive_get(self) -> Result<ExclusiveClk> {
> +            // SAFETY: By the type invariants, self.as_raw() is a valid argument for
> +            // [`clk_rate_exclusive_get`].
> +            to_result(unsafe { bindings::clk_rate_exclusive_get(self.as_raw()) })?;
> +            Ok(ExclusiveClk(self))
> +        }

We usually inline FFI wrappers.

>      }
>  
>      impl Drop for Clk {
> @@ -329,6 +345,50 @@ fn deref(&self) -> &Clk {
>              &self.0
>          }
>      }
> +
> +    /// A [`Clk`] with exclusive control over its rate.
> +    ///
> +    /// While an [`ExclusiveClk`] exists, no other consumer of the same clock may change its rate.
> +    /// Obtained by calling [`Clk::rate_exclusive_get`]; the exclusivity is released automatically
> +    /// when the value is dropped, after which the inner [`Clk`] is dropped as usual.
> +    ///
> +    /// # Invariants
> +    ///
> +    /// An [`ExclusiveClk`] instance owns a [`Clk`] for which `clk_rate_exclusive_get` has been
> +    /// called and the matching `clk_rate_exclusive_put` has not yet been called.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::clk::{Clk, ExclusiveClk};
> +    /// use kernel::device::Device;
> +    /// use kernel::error::Result;
> +    ///
> +    /// fn lock_rate(dev: &Device) -> Result<ExclusiveClk> {
> +    ///     let clk = Clk::get(dev, None)?;
> +    ///     clk.prepare_enable()?;
> +    ///     clk.rate_exclusive_get()
> +    /// }
> +    /// ```
> +    pub struct ExclusiveClk(Clk);
> +
> +    // Make [`ExclusiveClk`] behave like [`Clk`].
> +    impl Deref for ExclusiveClk {
> +        type Target = Clk;
> +
> +        fn deref(&self) -> &Clk {
> +            &self.0
> +        }
> +    }
> +
> +    impl Drop for ExclusiveClk {
> +        fn drop(&mut self) {
> +            // SAFETY: By the type invariants, self.as_raw() is a valid argument for
> +            // [`clk_rate_exclusive_put`] and balances the [`clk_rate_exclusive_get`] call from
> +            // [`Clk::rate_exclusive_get`].

I think [`...`] wouldn't work on regular comments. They are only for
doc-comments.

Thanks,
Onur

> +            unsafe { bindings::clk_rate_exclusive_put(self.as_raw()) };
> +        }
> +    }
>  }
>  
>  #[cfg(CONFIG_COMMON_CLK)]
> 
> -- 
> 2.51.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
