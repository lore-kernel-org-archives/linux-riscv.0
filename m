Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E96606A31C
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 13:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4WNaLFjd;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OLsIdH5H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=mPmYZxVNaBN80MC6pyQNwOBF5AGeqbijakMLhIOrhlw=; b=4WNaLFjd8WynE+pi4C91z/rs2U
	b9IwbcGAcFDgUqbVF2kpD4emqkSGShp1pY30Wv8XXMSEooT/gMrwI3rfh4T4KIDLkn9bMzXPT7Aox
	4wAjfdDlYc+VTgVZRl/TgzfTds6EHFllsaAsg3BMZeMCAzTGwCEe7YOqHR6+CdF5ff2vSs37fR0If
	U6SfgsebrOydjw5e7NQYYhSeq4uYJ6uekbmTeauKvBgzUS+kDb94acxxQyCgt00LPSizumtF6fKBw
	evTnjl04NFLWWrSslNaw2ARLPKNkBCYlacUUOtnwFfp/NLYjrGARIB7Sd96rHPwuI/1wbVT7bYnCc
	+PTSX8RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTg17-00000008zoZ-1Bh3;
	Wed, 18 Nov 2026 13:48:06 +0000
Received: from mail-wr1-x445.google.com ([2a00:1450:4864:20::445])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTg13-00000008zke-4AQW
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 13:48:03 +0000
Received: by mail-wr1-x445.google.com with SMTP id ffacd0b85a97d-499ca65ae87so503887f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 05:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795009680; x=1795614480; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YBVvUekf13M+I2J4OXSpne5JBm6BNzst3m7Bc2T2IGo=;
        b=OLsIdH5HEfk1Rs/M29PEX57vAGOXaBzDq5CA2N5GBxsnioNf8CDfBrP33uUQGKr6s1
         xgndligPGR+n5rKqEEx3WxTNyzmYgRMkpforAv6MOsqPsuQJ8H5jTUD6PPRt8oCbub9X
         mW20xlurPxCKx6GAlc9ms2VCVJsLcW7s24DDxC1k2xU6IU3gis4vZyPt5X7i+XZvd8ph
         Zs//ICZZwyGjHBaCdn4t+GHfHTE5ew77JEYQ3QyoTaEXCBHnVsiYuN/2IMg+WsarJuPy
         E+bMg2fQOA15QuQL9mznZ/l9Z4L3yp0WWUl+s9miOP/6d2Ywx4Yaw4hLrfIuTontjjPP
         nuHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795009680; x=1795614480;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YBVvUekf13M+I2J4OXSpne5JBm6BNzst3m7Bc2T2IGo=;
        b=A9LqmHfTCILGr2lfaOHJSifTiNAF1Fpjqzhw4tnsJpSe883SUQACqdOiJBLtyHXaaY
         mxfZrMYhmSgvaJJPZ9JqnHs8OI37Z9me4tm/VgRNr5Q5v/ThF9044T0uiY3Jc1+fPMnb
         zaYsGesw1/CA2xcsCT9o0jKtOBpn3RcvBr/9mZlIdEOnhgzR7f9CIhQRmipViW7HE+ei
         kaZO7EedUYREBPw8p3DWjFZdhOc4bSM0Bhye/9RYe5U5f/6gDuHt6FrjhqcJlKKqONO7
         1B10pIZvUM7gXo4pkFpKwybIaCboEprwkwe+M8bY4WbHTlFsziU1oErLjhnvr6cYpdJv
         J3MQ==
X-Forwarded-Encrypted: i=1; AL+hErHCOreFFe9tS2uYCVxYRZel2gIXGUlBKBr2iCR4kDholDhc7EgHUcfISIAv8uomQK2vX10gXarpoN5CLg==@lists.infradead.org
X-Gm-Message-State: APuU4Z8YjEPQUUsqfXPB8pQihEXpEeWYVvYHDhZW637+dZlgRDPZpy62
	idkUQ/epU0qCibHSlC8XOkNPAOE06ahKAPuVoySwkmhSDoQHipY3QhtL9L1izmt+062WQxplLk/
	Qvvan1X/MHXY7bBVD7A==
X-Received: from wrvt10.prod.google.com ([2002:a5d:534a:0:b0:49d:572:f312])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5f91:0:b0:49b:b94c:e8e8 with SMTP id ffacd0b85a97d-4a37294840dmr12837911f8f.8.1795009679054;
 Wed, 18 Nov 2026 05:47:59 -0800 (PST)
Date: Wed, 18 Nov 2026 13:47:58 +0000
In-Reply-To: <20261013-clk-type-state-v6-6-a5e9977b3509@collabora.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261013-clk-type-state-v6-0-a5e9977b3509@collabora.com> <20261013-clk-type-state-v6-6-a5e9977b3509@collabora.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261118134758.658847-1-aliceryhl@google.com>
Subject: Re: [PATCH v6 6/7] rust: clk: add `ExclusiveClk`
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Alice Ryhl <aliceryhl@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Drew Fustini <fustini@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	"=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=" <ukleinek@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Boris Brezillon <boris.brezillon@collabora.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, Maurice Hieronymus <mhi@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_054802_064595_FD1A43B8 
X-CRM114-Status: GOOD (  14.89  )
X-Spam-Score: -9.5 (---------)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 13, 2026 at 02:07:45PM -0300, Daniel Almeida wrote:
> +    impl<T: ClkState> ExclusiveClk<T> {
> +        /// Takes exclusive control over the rate of `clk`.
> +        ///
> +        /// No other consumer of the clock may change its rate until the
> +        /// returned [`ExclusiveClk`] is dropped or [`ExclusiveClk::into_inner`]
> +        /// is called. This may sleep.
> +        ///
> +        /// Equivalent to the kernel's [`clk_rate_exclusive_get`] API.
> +        ///
> +        /// [`clk_rate_exclusive_get`]:
> +        /// https://docs.kernel.org/core-api/kernel-api.html#c.clk_rate_exclusive_get
> +        #[inline]
> +        pub fn new(clk: Clk<T>) -> Result<Self> {
> +            // SAFETY: By the type invariants of `Clk`, `clk.as_raw()` is a valid
> +            // argument for `clk_rate_exclusive_get()`.
> +            to_result(unsafe { bindings::clk_rate_exclusive_get(clk.as_raw()) })?;
> +
> +            // INVARIANT: `clk_rate_exclusive_get()` succeeded, and the matching
> +            // `clk_rate_exclusive_put()` is called when the `ExclusiveClk` is
> +            // dropped or consumed by `into_inner()`.
> +            Ok(Self(clk))
> +        }
> +
> +        /// Releases the exclusive control over the rate and returns the [`Clk`].
> +        ///
> +        /// Equivalent to the kernel's [`clk_rate_exclusive_put`] API.
> +        ///
> +        /// [`clk_rate_exclusive_put`]:
> +        /// https://docs.kernel.org/core-api/kernel-api.html#c.clk_rate_exclusive_put
> +        #[inline]
> +        pub fn into_inner(self) -> Clk<T> {
> +            let this = ManuallyDrop::new(self);
> +
> +            // SAFETY: By the type invariants, `clk_rate_exclusive_get()` was
> +            // called on `this.0` and not yet balanced, so this balances it.
> +            unsafe { bindings::clk_rate_exclusive_put(this.0.as_raw()) };
> +
> +            // SAFETY: `this` is wrapped in `ManuallyDrop`, so the `Clk` is moved
> +            // out exactly once and the `Drop` of `ExclusiveClk` does not run.
> +            unsafe { ptr::read(&this.0) }
> +        }
> +    }
> +
> +    impl<T: ClkState> Deref for ExclusiveClk<T> {
> +        type Target = Clk<T>;
> +
> +        #[inline]
> +        fn deref(&self) -> &Clk<T> {
> +            &self.0
> +        }
> +    }
> +
> +    impl<T: ClkState> Drop for ExclusiveClk<T> {
> +        #[inline]
> +        fn drop(&mut self) {
> +            // SAFETY: By the type invariants, `clk_rate_exclusive_get()` was
> +            // called on `self.0` and not yet balanced, so this balances it.
> +            unsafe { bindings::clk_rate_exclusive_put(self.0.as_raw()) };
> +        }
> +    }
>  }

Only new() states that it may sleep, but into_inner() and drop() may also
sleep. This may be worth stating.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
