Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CD6606A331
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 13:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tNguGUQG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ofH73MpR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=X78HbY9iOrjcO6fEqzSVlxi4BSE0JLdc+x7wQuGK+lk=; b=tNguGUQGTiZQOptutBy0Z+OpeQ
	obxnO6dz4LoWo7RvPu3BDEr8/C0K4Fiss6fg1ggqPsV8ssMYzxtOJ5sBqYM8jgK6kAedcgw+au5iN
	L70LaWNHRuC8bOeTSXdyFdKWK7gZ2HydJnqWCCwN1CCa3FrfQJtE6YwGDgWG7I7i5XR9oVoTltHY6
	v34ipkc7pNbniI4FVMwj1etE9hsivM8W/o5lX2nRUFBTxO+jD+iDdxZQ1fKigKEiUWY0RGinSTfWz
	i9IvQR6MjQk2g50sr7H+EKI8SOehItM/PkPO1O8810HkTv737eGtjaan8CT1nBpsMwlifKAS4Z8ZP
	nX/nsBEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTg13-00000008zl1-0P40;
	Wed, 18 Nov 2026 13:48:01 +0000
Received: from mail-wr1-x446.google.com ([2a00:1450:4864:20::446])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTg0z-00000008zh9-3PA5
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 13:47:59 +0000
Received: by mail-wr1-x446.google.com with SMTP id ffacd0b85a97d-48c6a1d4034so650715f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 05:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795009675; x=1795614475; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ReEzbagpHcp/fcY0hMd4fNtM6diXxUaPoUO44vW/qBI=;
        b=ofH73MpRcyeS3NZvhQ8ptqnVu+meFFtOHV+C4RytUeY98wFljqTN7McvwPC/VOofra
         sKT6e039Hc8C98VIff/F1pkr/cn66PQOAy9irXarCfv+BI1VFoktK12HsZUueVeSP6Gp
         fUHwj1K5Oop8zhSJvXjC6bEE+OdQD5+Ettzv4bSgXEMjGKcnh63D4D5lCDMk6IkNJiwh
         asPnkwjryHURS6cgArJs7+V4AAV3/Ps+MZzA14Oq329v4ZmZZ8CRx9lyb0K9PFEz0M1v
         Q8ZwtlSxJLR6xZaCuwjvBT73LvmKSpXhdTO2ZAja7nV+dEU2nQ/VRGHtiSJoN4tgbfi4
         uANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795009675; x=1795614475;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ReEzbagpHcp/fcY0hMd4fNtM6diXxUaPoUO44vW/qBI=;
        b=xlnUnY5j1KXlOiLytTscmPbM+z7K8Ou4ueOLPBqJWQllRA/+lCytTRAApPsK4SfwlS
         imEozby53Dp6SSyaJTolKeK2iR4YLOwFJApx8BAu8jtpTcsSq497/vw+w94Qek+xTzYu
         zB8Z4+quF8ScF+lH90U2LOvhHJftQRfLVuGWC4KdZ5NoJW/oUH+RHzZCEDY5h3EWBVMr
         ezP+2H5mhEJlssRp6xCD/has+83Z90JU3YikynVs9tsV4WpgLYps/tiYrdsb+UYoUEY8
         bRSjJWtocH8Bw77BGw7ine1Ws8wA4wYzBQj/RfUXsV+DHsJz51TWkeiHJkkav36gyNH/
         HhjA==
X-Forwarded-Encrypted: i=1; AL+hErHwD7IS8jQpOOz2K+hhlOIHM0iqsH6+ON/b5eHb1p1XCt5WKYxUQ+V8pY8fOjMbOvAB3p0kG3VsCweKEg==@lists.infradead.org
X-Gm-Message-State: APuU4Z84IVGfPDewwjWgdCxn+VHSB1b5xeqRCa3XvNGVfKa1cD47hTgj
	Ira0ADXpSvMqYE653JZKZwLXRLyvE/pQlPJs3FMHB5fuOYJRNvfXIN8/zAro5O9X5dPGe1VKGuJ
	0Eu7Z38tRt5m47d1uxg==
X-Received: from wmbgz3.prod.google.com ([2002:a05:600c:8883:b0:4a1:811f:6de2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f56:b0:4b7:6c16:7b43 with SMTP id 5b1f17b1804b1-4bb7da12aa6mr55502915e9.10.1795009674222;
 Wed, 18 Nov 2026 05:47:54 -0800 (PST)
Date: Wed, 18 Nov 2026 13:47:53 +0000
In-Reply-To: <20261013-clk-type-state-v6-4-a5e9977b3509@collabora.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261013-clk-type-state-v6-0-a5e9977b3509@collabora.com> <20261013-clk-type-state-v6-4-a5e9977b3509@collabora.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261118134753.658399-1-aliceryhl@google.com>
Subject: Re: [PATCH v6 4/7] rust: clk: add guards for scoped prepare and enable
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
X-CRM114-CacheID: sfid-20261118_054758_104176_035143BC 
X-CRM114-Status: GOOD (  14.06  )
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

On Tue, Oct 13, 2026 at 02:07:43PM -0300, Daniel Almeida wrote:
> The state transitions consume the Clk, so a driver that keeps a
> Clk<Prepared> in its data cannot enable it for a short section without
> moving it out and back in. A clock handle also holds at most one count
> of clk_prepare() and one of clk_enable().
>
> Add EnabledGuard, PreparedGuard and PrepareEnabledGuard, returned by
> Clk::enable_guard(), Clk::prepare_guard() and
> Clk::prepare_enable_guard(). Each guard borrows the Clk, takes its count
> when it is created and releases it when it is dropped. It dereferences
> to the clock in the higher state, so a function that takes a
> &Clk<Enabled> also accepts an EnabledGuard. Several guards may borrow the
> same Clk, and the borrow keeps the Clk from being dropped or moved to
> another state while a guard is alive.
>
> There are no users yet.
>
> Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
> Suggested-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
