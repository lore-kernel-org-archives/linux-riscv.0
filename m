Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2AD606A337
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 13:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ann0B9am;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mfjCpUUF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=W1wtktKE66WjzVw58/BkxB7b9o4+6wkMgjtQjF+7sz4=; b=Ann0B9amufGDZCEefAkyWWM6l1
	0KZOgRNBea7SvkMDQlJ+OEPzUd/H7cOkW1+oj9tT3ZEiyjG5VMHToZpKHNISD+/vA/jC2jloES6xH
	MVaMCtrhgZhptFXd5KMBsUi9nzPhoLmO1CqTCJ0PXSCR3LXIC44E3W30roAalH4rrhrD23zL45vJM
	qnhKS5vZRHkPtxjbQLrVjiPCnwTHRvPBLqiv5JJ1GsrYMgOTo1nZAH6HujFh00jXUXHXx7ACjgGXg
	izpsjGsM0a4pwQe/97n1MZk6l+m762rr+OjZtOQEUY+J8J1WWInD94+Rqi2J7D1i/O95C0GEg6XoP
	fGez+sNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTg0z-00000008ziy-3Ji6;
	Wed, 18 Nov 2026 13:47:57 +0000
Received: from mail-wr1-x448.google.com ([2a00:1450:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTg0x-00000008zgn-1Abp
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 13:47:57 +0000
Received: by mail-wr1-x448.google.com with SMTP id ffacd0b85a97d-4925ef75fc4so786620f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 05:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795009672; x=1795614472; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zquXBrMDSkgmhzVSBU9n1JfbEE6tjoTWMroKtZE+aJ8=;
        b=mfjCpUUFA1wO04zvhigVPFZSJCTnivleb8IglF0LnERUiLxuiXaHawSlL0VF7kKDtY
         XtEvXDyA73mafm4pljMi6CbSzn03M/kgQHvklrhRBkfKa3yPS/yHW6sIy47LYS49PNIE
         yfe4cOgaEsQqz23Wnd9HocQ84Wwoqn3Wsq/mGZ76kYg8kwoIuAaqqEVyenGpMxFdIz+m
         SuP8Hc2t1nEbWASyNUhwXG1WWjshOndeuBaqsbllpMr8fpgPdk7p8sRHvd9wGqq/xunu
         Q4NbcLC8G+Ft0K2i/Ux/2sPeUJV0zBBhhehpmLMLuL/Rj7opATqYQONpl02Nq26ZVQuR
         hwhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795009672; x=1795614472;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zquXBrMDSkgmhzVSBU9n1JfbEE6tjoTWMroKtZE+aJ8=;
        b=io+6+JRBaMlrYaMBIQC7u3XtUXAdg42zK2e8RXtKbZ5o807NJJ/yiln4cxYKkRUPrf
         i3N0pdDLIdJlpTGviJQeRkULx9uYzHVHN6QAscCBVhfSOmFbSDZ3+gLyQcOs+kJHI7CC
         2mwW7aoykK50DLRi8HuUH+CcIAWUPj09KHrKuy04enxHHGUrlO8l/Z77t88Z/tfo8cb6
         qkO5YC4fPBhJ2//gvLsfreCi3AIR5CZG4EXrScnmNpBRIbYDCK43Cz8FcJp7vdLiOq2x
         OKRsPKBz2cGm9zvvxssuh4jfg8fjqVUSaX+L+8iOOWGrEZMpT+IySA6gABkhqdHAER+6
         W7lQ==
X-Forwarded-Encrypted: i=1; AL+hErEuZe0NvSlltB7IVRKPSGw2OFfZ6RUX1eYbD7YHwVXiFr+ic7ZiQ5N1CXhYXssqGON1OHd+VP+mKWPqVg==@lists.infradead.org
X-Gm-Message-State: APuU4Z8yu2oI5kV0CQh9rm4HkInmY2F8g3Qm6JpLb0LGYoTD52otooLK
	qw5g2IBsFMamt7LzXoZv/+Csg+Zq1m8UOgHUlQUqKEvjIEXKrkzj7k61Uu8VvUIoJIu0WivXOad
	hmSVR1eOZcPYF/kkrJQ==
X-Received: from wrqt12.prod.google.com ([2002:a5d:460c:0:b0:4a4:28a2:fcf9])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5d84:0:b0:4a7:150e:cfe5 with SMTP id ffacd0b85a97d-4a7150ef4dcmr3970052f8f.42.1795009671601;
 Wed, 18 Nov 2026 05:47:51 -0800 (PST)
Date: Wed, 18 Nov 2026 13:47:50 +0000
In-Reply-To: <20261013-clk-type-state-v6-3-a5e9977b3509@collabora.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261013-clk-type-state-v6-0-a5e9977b3509@collabora.com> <20261013-clk-type-state-v6-3-a5e9977b3509@collabora.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261118134750.658250-1-aliceryhl@google.com>
Subject: Re: [PATCH v6 3/7] rust: clk: use the type-state pattern
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
X-CRM114-CacheID: sfid-20261118_054755_719957_852A4245 
X-CRM114-Status: UNSURE (   8.94  )
X-CRM114-Notice: Please train this message.
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

On Tue, Oct 13, 2026 at 02:07:42PM -0300, Daniel Almeida wrote:
> +    /// Drivers that need to change a clock's state at runtime (for example to
> +    /// enable it on resume and disable it on suspend) can keep it in an enum
> +    /// and move between the variants:
> +    ///
> +    /// ```
> +    /// use kernel::clk::{Clk, Enabled, Prepared};
> +    /// use kernel::error::Result;
> +    ///
> +    /// enum DeviceClk {
> +    ///     Suspended(Clk<Prepared>),
> +    ///     Resumed(Clk<Enabled>),
> +    /// }

Nit: looks like this doctest missed the vertical import style from patch 1
(and `Result` is already in the prelude).

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
