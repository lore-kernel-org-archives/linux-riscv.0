Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF30CCFD376
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Nov 2025 09:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Q/j/R90UW9Sdx/E9SOIcveCoSatdpJ2W/Tmr1mfAb1o=; b=oX+mWZgcRqjrIelCVY2ZZzWcTU
	CG7kEywAo1hs0jrs/HxQGHGudh0F4bnWaLa4QCHoaaSD9+qngudaU+9LRFiPoKBykQZVnjTc1J/4c
	tYnbib/dNsCiF0bXEFWh8qYkPOCT84DxC4r1TNb85mQO0qr4gljwrZWy39VCOo6GtHQkTR6sWnTPf
	0ir+yX1qy4FJB7S42CZwWeydoCBzV0FM2UwMuJXi3L7ZNADIj8Qk9DLpx7RTyYpEa0m3QEOumUIW8
	Jnzh/lODS5LhJQdVizkqZ+eWhkT8YHMM2XCedJh1e46B6dpYGiZO/FS37aw5K0iseGQYVZ0T1HvWP
	sX08YbPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOumg-00000000E5Q-2Cov;
	Fri, 28 Nov 2025 09:28:58 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOume-00000000E53-1Qqk
	for linux-riscv@lists.infradead.org;
	Fri, 28 Nov 2025 09:28:57 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-429c5f1e9faso1267381f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 28 Nov 2025 01:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764322133; x=1764926933; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BfB1+1n54EtAaQ0p4axZ7CMqQap0WXeaVLrFGnbDa00=;
        b=n8hp4zlKWyzPFeLoLxi/XPqbo2VXZP15l1pq6VaUbyqlAlIUZgZpRJZFRB83RrNFK7
         U8HQ4sjC1El7ibxRa2SmqE7HHCnYL5c3mUoottTHdqSNFVxBM75H3kgtbdgveHNCgRQO
         Gg3ovyhXrqdxTzYP++3FjVC+d2RglD798JXHYF0Vmme2zESkrUvBXxwXWu0PtlQU1jsz
         p56dwf8ZaYBJ2KkgMwcO8cTJmwVD3IlKXwyevTsSsQ60w8E7XbvmB6eKs+Lu30da7PQT
         0YzMk9pJK6HEdyyQKzimNDN8VBECJU8V9EkCiz1bun/MFcocPSDJARCJlIljsfe6aMnm
         SH/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764322133; x=1764926933;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BfB1+1n54EtAaQ0p4axZ7CMqQap0WXeaVLrFGnbDa00=;
        b=VWPiLUhIJpmYBNTsLoIC5LAq1TTGjHK1ULuKbv5tMW3kHCTBcKfIMcv4OHoVfkOH3C
         Z9W5JWtPTP46fzIfx6216P76ZPDcW1nfA2iucu+ZieK3gCqI8k98jKJ77kCIniMtcFXJ
         hs9rHatH8BVv9snCwZnHAjw5B2Ik7x9Sf2WRWxHRqgpS1py7iW0mQjH29K6lE8seR5qn
         60SGBpa20QQ2kQ9MsFelmdrAEs5W1eVRmh63og1HqmHnQQ6Z3QRY++B/wq16T+R3t1ws
         9Kp1LP/wNi06BxFwS/uRSJ5bBLfebrWe0KnF7OLVI0BpsJodq2xcBvTBjxum9zNy2ebU
         0W/g==
X-Forwarded-Encrypted: i=1; AJvYcCVSVXxwbhLOA40dd2jJtErx8hxjiTGvgYf5n0iNpsKj5vYUNaqkDuzG+QC6Z3i7A/gcrxhOIMeIiYcHkA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxdWzP59IkXui5NnjyzThTwbcVuo2lLnz3tWwyYzlO9uU3ZWvYz
	8XEfNB9eJzbDWyUdYGBhmRDL4C/L8n32kVBKhZEpIjxLQ4jeEDiwo7pM8oDKcC2NYckMUn69+2T
	qpXM7eaueyRWKyfAiLA==
X-Google-Smtp-Source: AGHT+IFiVYsI2OdISn6VZC7R1ztAkjTUn9DQuinLJur4JooHB2So2nt10pptXhN77fC9tVjIw7LQO6s8qx3FfOQ=
X-Received: from wrhm5.prod.google.com ([2002:a05:6000:1805:b0:42b:2edb:9e83])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2387:b0:429:dc9a:ed35 with SMTP id ffacd0b85a97d-42cc1d3479cmr28776643f8f.43.1764322133683;
 Fri, 28 Nov 2025 01:28:53 -0800 (PST)
Date: Fri, 28 Nov 2025 09:28:52 +0000
In-Reply-To: <20251127-pwm_safe_register-v1-1-d22d0ed068ac@posteo.de>
Mime-Version: 1.0
References: <20251127-pwm_safe_register-v1-1-d22d0ed068ac@posteo.de>
Message-ID: <aSlrVLT92kmazgyh@google.com>
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
X-CRM114-CacheID: sfid-20251128_012856_400002_A9386E72 
X-CRM114-Status: GOOD (  19.24  )
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

On Thu, Nov 27, 2025 at 05:15:06PM +0000, Markus Probst wrote:
> The `pwm::Registration::register` function provides no guarantee that the
> function isn't called twice with the same pwm chip, which is considered
> unsafe.
> 
> Add the code responsible for the registration into `pwm::Chip::new`. The
> registration will happen before the driver gets access to the refcounted
> pwm chip and can therefore guarantee that the registration isn't called
> twice on the same pwm chip.
> 
> Signed-off-by: Markus Probst <markus.probst@posteo.de>
> ---
> This patch provides the additional guarantee that the pwm chip doesn't
> get registered twice.
> 
> The following changes were made:
> - change the visibility of `pwm::Registration` to private
> - remove the `pwm::Registration::register` function
> - add code for registering the pwm chip in `pwm::Chip::new`
> - add Send + Sync bounds to `PwmOps`
> 
> Note that I wasn't able to test this patch, due to the lack of hardware.

Overall looks reasonable, but I have one question:

> @@ -654,50 +668,23 @@ unsafe fn dec_ref(obj: NonNull<Chip<T>>) {
>  // structure's state is managed and synchronized by the kernel's device model
>  // and PWM core locking mechanisms. Therefore, it is safe to move the `Chip`
>  // wrapper (and the pointer it contains) across threads.
> -unsafe impl<T: PwmOps + Send> Send for Chip<T> {}
> +unsafe impl<T: PwmOps> Send for Chip<T> {}
>  
>  // SAFETY: It is safe for multiple threads to have shared access (`&Chip`) because
>  // the `Chip` data is immutable from the Rust side without holding the appropriate
>  // kernel locks, which the C core is responsible for. Any interior mutability is
>  // handled and synchronized by the C kernel code.
> -unsafe impl<T: PwmOps + Sync> Sync for Chip<T> {}
> +unsafe impl<T: PwmOps> Sync for Chip<T> {}

Why was this changed?

Alice

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
