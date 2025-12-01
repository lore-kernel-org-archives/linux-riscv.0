Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1EB7D116F1
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Dec 2025 10:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=87+eH8hrd1StCv+FdDmt8PnD00qx9PE2YWsostra3Jg=; b=yj1NUeolUKDilpUE6gxTgVieFp
	ii7/PpuFJroWbwyMt5JrDffUeEQNwJCZubum9+wji8p/Q1Ub6M++XbyCs+6joqfeodToAixG9mVAU
	kHKgsJQ+PgUTN2uYpEdfVnJiHkLvTSowbg7MYrfyfoA6WjRu5BKjr5uDj8eSfTW/JqDWypWvmvl8S
	k5XX6okYspTToj253WOfi71f3QJNAE4Z3EGw+8vGPg98ZG6BGnUx2r6rr3ZowV1R4emIDso8gwnS1
	fPTGLlCNJqfhaSLhMPki+AXuIGr1BoLGYOpRSDxfvQx4riYlbso+HeBG2ThiUfuK8Dj8eFO3X+1r1
	6+fVwjjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ0o8-00000003HTF-18Gu;
	Mon, 01 Dec 2025 10:07:01 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ0o3-00000003HNt-1Gx7
	for linux-riscv@lists.infradead.org;
	Mon, 01 Dec 2025 10:06:59 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-64097bef0e2so5637710a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 01 Dec 2025 02:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764583613; x=1765188413; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=y78SsuGizE+1e9Q4bskrWLC1Ufu93jXaYzNMiAyIc9M=;
        b=Wp/UCWw5M74ZzBmE0px5IxfpfH3WWYhi114sbIvHR85OhFx5/vswcOk1usGhxZci1d
         etOija1/WV0vmWW/xpZwSnj+8vy+/HeAu+0yPKgTlpchHeKKuOLHKVA4idMAGjpkg345
         CoMY5GIWf3I+T9coMoSczONwlU9t3XH5gV3xYGqnovAYcHOzrKWk6B+xeW2FnWeynMIP
         ztA8cipdJQks01+mzAo+gbGQ2Z5iizstMjKrQ4iGL8mGVxB47m653asde03ZYNF7IBYC
         1dBJb6kilL+V4gIXbR6UNpbm9EYnRfTsZWtefqKXXE9mZWvzidhM3HlM0Tg1kHz4ZwFX
         Pm+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764583613; x=1765188413;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y78SsuGizE+1e9Q4bskrWLC1Ufu93jXaYzNMiAyIc9M=;
        b=jGdwOBXA33Q2VIR525KhlfxizS928s9z0GPVNdVOxsj7w5w7FljiB8rEQSYq4nfIkJ
         qFqzN2Tsq5KoZjnSASIyqivtM1ybV+K8wQ3t0Z6ARzARzMuYEGRMS/6xFessC6WjQ1wa
         lLTi+zDSc/AEPk5+sTfd4oNFMvti+04CrBwPzFdyhOXGRAQN9PnzElz88CRDXp+Pq2Ve
         U+DU7yonSXS1CXgLII/glr1R28sln8NsJIMHpA1vwvQ8myGGeEP1Chp1tlc1Jp3efIYc
         djobC1C19aYN1Xotkmhhmo2uI1CTgAJTd5kydWrizF8tnLPU8m7ekwYi84tKcchGqNjS
         BNEw==
X-Forwarded-Encrypted: i=1; AJvYcCXJgzT0kaUFFzc84zpz/MGwQgS6kWBZwgxQdh/hNaOEon8vRh/P1euDHbWp8ag50kkrQy9C0nnOKdcFtg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzCBEPvgwK1xpKu923ixmPchf9FKwBjJrHaf06ln6GkaaQeMiuV
	WDXKyQK6JHHbyAP9iw4GuiK12f4yHxb4J8WCU10LUouBQz2pznxcO1TZdu4AS5PUfpRJa7zOX4G
	hJhhNUe4MOYOv3glhUA==
X-Google-Smtp-Source: AGHT+IF7Nf4tyLidMi826QBnaIkv9+KTWKCNs4nqjEi7MZMGKXpqsVJ18dJbqgVsjR384JG+Wx64Hagz7SnILms=
X-Received: from edc24.prod.google.com ([2002:a05:6402:4618:b0:641:8d26:68db])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:5247:b0:640:74f5:d9f6 with SMTP id 4fb4d7f45d1cf-64555ce8d37mr32130609a12.25.1764583612724;
 Mon, 01 Dec 2025 02:06:52 -0800 (PST)
Date: Mon, 1 Dec 2025 10:06:51 +0000
In-Reply-To: <8711d40496e0e12e3efcd7fd9e11bdea6de68c6d.camel@posteo.de>
Mime-Version: 1.0
References: <20251127-pwm_safe_register-v1-1-d22d0ed068ac@posteo.de>
 <aSlrVLT92kmazgyh@google.com> <8711d40496e0e12e3efcd7fd9e11bdea6de68c6d.camel@posteo.de>
Message-ID: <aS1ouzXP5U5kSNJu@google.com>
Subject: Re: [PATCH] Move pwm registration into pwm::Chip::new
From: Alice Ryhl <aliceryhl@google.com>
To: Markus Probst <markus.probst@posteo.de>
Cc: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	"Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=" <ukleinek@kernel.org>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_020655_364923_A4D1ABE2 
X-CRM114-Status: GOOD (  27.53  )
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

On Fri, Nov 28, 2025 at 12:25:04PM +0000, Markus Probst wrote:
> On Fri, 2025-11-28 at 09:28 +0000, Alice Ryhl wrote:
> > On Thu, Nov 27, 2025 at 05:15:06PM +0000, Markus Probst wrote:
> > > The `pwm::Registration::register` function provides no guarantee that the
> > > function isn't called twice with the same pwm chip, which is considered
> > > unsafe.
> > > 
> > > Add the code responsible for the registration into `pwm::Chip::new`. The
> > > registration will happen before the driver gets access to the refcounted
> > > pwm chip and can therefore guarantee that the registration isn't called
> > > twice on the same pwm chip.
> > > 
> > > Signed-off-by: Markus Probst <markus.probst@posteo.de>
> > > ---
> > > This patch provides the additional guarantee that the pwm chip doesn't
> > > get registered twice.
> > > 
> > > The following changes were made:
> > > - change the visibility of `pwm::Registration` to private
> > > - remove the `pwm::Registration::register` function
> > > - add code for registering the pwm chip in `pwm::Chip::new`
> > > - add Send + Sync bounds to `PwmOps`
> > > 
> > > Note that I wasn't able to test this patch, due to the lack of hardware.
> > 
> > Overall looks reasonable, but I have one question:
> > 
> > > @@ -654,50 +668,23 @@ unsafe fn dec_ref(obj: NonNull<Chip<T>>) {
> > >  // structure's state is managed and synchronized by the kernel's device model
> > >  // and PWM core locking mechanisms. Therefore, it is safe to move the `Chip`
> > >  // wrapper (and the pointer it contains) across threads.
> > > -unsafe impl<T: PwmOps + Send> Send for Chip<T> {}
> > > +unsafe impl<T: PwmOps> Send for Chip<T> {}
> > >  
> > >  // SAFETY: It is safe for multiple threads to have shared access (`&Chip`) because
> > >  // the `Chip` data is immutable from the Rust side without holding the appropriate
> > >  // kernel locks, which the C core is responsible for. Any interior mutability is
> > >  // handled and synchronized by the C kernel code.
> > > -unsafe impl<T: PwmOps + Sync> Sync for Chip<T> {}
> > > +unsafe impl<T: PwmOps> Sync for Chip<T> {}
> > 
> > Why was this changed?
> 
> Registration::register required PwmOps to be Send + Sync.
> Prior to this change, Chip::new didn't require it for PwmOps. Meaning
> it was possible to allocate a new Chip with a PwmOps that is not Send +
> Sync. As there was no use for it and it isn't possible anymore to
> allocate a new Chip without registering it, I added Send + Sync as
> trait dependency (see 1. hunk of rust/kernel/pwm.rs in the patch).
> 
> Because PwmOps now implied Send + Sync, it wasn't necessary anymore to
> have the additional bounds there.

Ah ok, I missed that. That's fine then.

Alice

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
