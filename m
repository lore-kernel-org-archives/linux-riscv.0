Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91BF1CD6E6B
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 11:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=uIMOLNmnnO+anJf3Szd5j3+KCnYcfbassI2WoV2YBV0=; b=S0mjzwAtYOc4B0vrxurOANwpEW
	dHpNpQXJzuBk1mxsDKXVS+iAvr8MG7wM+LCUWNovG2rXoLMYfpTq4bu29OAeoEzBkz1Y5UaJwjdG1
	WvSPNqj0w22LTPpi7mPGfZgp/+7LQKkMGCngWyrXRzD6lcy1949Psm2gSaw34RLNtvJ99mknCt8ud
	QFed0ICkBPl6Q+CbPgZYzMxfiPjN4yZF+rVKLIkm2qiFAHKNjqP+EESh3Nnac508WF46qCjr8IfMd
	mAjV9sPncjmBxV8li5i6zbbPVeP38VI8zNHKz5pi7yNro4dkR39qmRnAYbulKsNaSaiPP53hY1JA0
	ZWuZLUXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV64b-0000000Gcop-46T1;
	Thu, 04 Jun 2026 11:17:18 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV64Z-0000000GcoS-21TF
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jun 2026 11:17:16 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-490a060eb84so4319705e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jun 2026 04:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780571833; x=1781176633; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bL3cr/N4yYTt9Xr62pbCqd/6k/zRQ+lTKB/ioJiYtd8=;
        b=Uf3VcOTa7lNULX4VnXvuHfic50jY+1nYGNQVIF9Ep/6N2Cjze1bojjlncQL+H7HMwQ
         3U4x96bN4rrQRDOv3Vf6EU48JgsqVfVrAuhN+/e7zeTTQ3hig8ZuY/ijScCIcnWoinvC
         PRbn0JZ0lnNR9Qbb5JoYtBW57hnmkHAXc5md3d4Zno2rq536ifk8ppVFJaUNUk6rgCR2
         GfK94it7xefififcxZ2acX++iWOLyUK4cfUsSrkvObtt/NlJewA+f5nrIuUO1GOYiVtd
         9ZSTLIyfXp09Lw68fmb8qPOSvCV7c4lP0ABn2+Ag4QgwzxIfY9+tAjL4371QrbpYTl8z
         554w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780571833; x=1781176633;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bL3cr/N4yYTt9Xr62pbCqd/6k/zRQ+lTKB/ioJiYtd8=;
        b=QtbtnPvO9GRgJdITzKsz9c4yupOyApx31hRtCL8lza2dCsGe6p+fO3PsGiYZ1VI2Yt
         ot1A3QDPx5tiCJx/9Yqv/lAxF9NWiGlTb0tRIN+shCvfpsi8fjb+9UAMQnFj56X1EeTz
         qySYxlOKgEXpdmcv/5lJDgnIZx/1Pw62PlV7ejV0qj7iwQvWm8bXW1RbWF2m+DAT4M+K
         BjVkucylBnWsyEU3l49Q2gOJdMX1UD/UA520ow610ffoJwW7gYq2b5dJNfwLv3E+cZSL
         Y3Fyp6h8Vh+B2l6mUkH+1n5r9hW6zzoVCSKjQXxIpFR6qfBBCuoxv4A1NOWcxIV2M9+f
         idBA==
X-Forwarded-Encrypted: i=1; AFNElJ9qxlB+i/SXdx0bFPLN4yPwidhxu/U+3fCT4peW2X0UFP6TknmSLp9taiq4+3b5Pvfi3IgAE4Sw5GJbDQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YykBKeO0shODlZx1cleYcwAqbNH9IxufSnK0NN8pkgMileYMZ1J
	5ae8iAjalkfjNfMNksHGgL2FLIeCyWLG5Bly+DrW56H33adRl/PyaC+xlr9eWHFnRRMbz52dJVR
	IxB4Wa5vnI7GjY0JUSA==
X-Received: from wrvx5.prod.google.com ([2002:a5d:54c5:0:b0:45e:ee1e:37d3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1993:b0:490:bb19:b110 with SMTP id 5b1f17b1804b1-490bb19b19amr73563895e9.27.1780571832368;
 Thu, 04 Jun 2026 04:17:12 -0700 (PDT)
Date: Thu, 4 Jun 2026 11:17:11 +0000
In-Reply-To: <20260526-rate-exclusive-get-th1520-v1-1-34cf034e1764@mailbox.org>
Mime-Version: 1.0
References: <20260526-rate-exclusive-get-th1520-v1-0-34cf034e1764@mailbox.org> <20260526-rate-exclusive-get-th1520-v1-1-34cf034e1764@mailbox.org>
Message-ID: <aiFet_2SNAwj6o2O@google.com>
Subject: Re: [PATCH 1/2] rust: clk: Add ExclusiveClk wrapper for clk_rate_exclusive_get
From: Alice Ryhl <aliceryhl@google.com>
To: mhi@mailbox.org
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	"Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=" <ukleinek@kernel.org>, linux-clk@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_041715_547635_87FB0DCC 
X-CRM114-Status: GOOD (  21.38  )
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

On Tue, May 26, 2026 at 07:04:57PM +0200, Maurice Hieronymus via B4 Relay wrote:
> From: Maurice Hieronymus <mhi@mailbox.org>
> 
> Add Rust bindings for clk_rate_exclusive_get() and
> clk_rate_exclusive_put().
> 
> Clk::rate_exclusive_get() consumes the Clk and returns an ExclusiveClk;
> the matching put is issued from its Drop impl. ExclusiveClk derefs to
> Clk so existing rate / prepare / enable APIs remain available on the
> locked handle.
> 
> Signed-off-by: Maurice Hieronymus <mhi@mailbox.org>

Overall looks okay to me. With below comments fixed:
Reviewed-by: Alice Ryhl <aliceryhl@google.com>

>  rust/kernel/clk.rs | 65 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
> 
> diff --git a/rust/kernel/clk.rs b/rust/kernel/clk.rs
> index 7abbd0767d8c..8cda40cb01e4 100644
> --- a/rust/kernel/clk.rs
> +++ b/rust/kernel/clk.rs
> @@ -249,6 +249,23 @@ pub fn set_rate(&self, rate: Hertz) -> Result {
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
> +        /// [`clk_rate_exclusive_get`]:
> +        /// https://docs.kernel.org/core-api/kernel-api.html#c.clk_rate_exclusive_get

Avoid the newline here. Links are long, and it's okay that they are
long. They must be on one line.

> +        pub fn rate_exclusive_get(self) -> Result<ExclusiveClk> {
> +            // SAFETY: By the type invariants, self.as_raw() is a valid argument for
> +            // [`clk_rate_exclusive_get`].
> +            to_result(unsafe { bindings::clk_rate_exclusive_get(self.as_raw()) })?;
> +            Ok(ExclusiveClk(self))
> +        }
>      }
>  
>      impl Drop for Clk {
> @@ -329,6 +346,54 @@ fn deref(&self) -> &Clk {
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
> +    ///
> +    /// [`struct clk`]: https://docs.kernel.org/driver-api/clk.html

Unused link.

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
> +            unsafe {
> +                bindings::clk_rate_exclusive_put(self.as_raw());
> +            }

Nit: usually we format this with the semicolon outside the unsafe block.

unsafe { bindings::clk_rate_exclusive_put(self.as_raw()) };

Alice

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
