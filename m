Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F5DC61CE8
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 10:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tg3mXdm8be5ytJJVUEM2z8T3MMxzGYbheYjeVlzTovY=; b=xjOSWqTunYhZk7
	ZC6Sy3uaIW6VylhALhndNK1Ygk5tapZIkA8f8N3fTckC4UAE60L6z7ZJu0yb0L53Kdcht29SLdGV2
	1y27Xwpnxhuu8eK+xu351fne9acguDK/MWmRcXy2GMkLFYtG6X7FOfVr1qV+aqon7GpQVBBWlCMwI
	Z68FDoOfrq1ZJynLT35aWME+oWMQ8WlV7mxDm4E15kxtsF4kOF3WLCZlI+c/YVPnfKyP7t9epsgN3
	Bc982YbSk2jPSVxNidZhUgQHI1XtalSC0c8dSMh5Y3MljzGdDyCy8X8DwegjlnnWKg6jYunj0AVYe
	0K9Jaa/3+P/P4gLZe2pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPf9T-0000000Cye7-02jT;
	Thu, 12 Jun 2025 10:27:19 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPdz0-0000000CmfK-2joP
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 09:12:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D90E0A519E1;
	Thu, 12 Jun 2025 09:12:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 333E9C4CEEA;
	Thu, 12 Jun 2025 09:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749719545;
	bh=zJQ79n0+FenXg8CW9hXrEPBZ2mMHVHaVY55v6bEoH3c=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=vNmY3HVZoPLE2n2l1u5VMrnXXjfglJfJQkQW/kG9MSzoncNmdaVGVF/Zw0VdhSd+2
	 3+zr6nieafadxOb84+tYiZSE33Iz+U0ONwWQLxb5+sDYXYrzn9EF4QTGZlREZVq/zq
	 Y4Gg/fT7BII/gpL1zRNomeJYsQqlCwd5uZC14eZjOx//CxZ3nRpEtdZrFCkYF4gsTZ
	 tphePEpk50umpQ61omEd+GsAQtVOFyun0lIgSpexo5QiBohESdem3p1NFx9DZucQZk
	 MEsSLIQKk31UVAkkrQ8bIv0OypuJ0QRzSRHZoZhseI3nEmGq9m9auyauKk0xWUhlAC
	 FAAKddH+Qwn/Q==
Mime-Version: 1.0
Date: Thu, 12 Jun 2025 11:12:18 +0200
Message-Id: <DAKFT7C8IRC4.2ID8TJIKN4Z5R@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v2 1/7] rust: Add basic PWM abstractions
From: "Benno Lossin" <lossin@kernel.org>
To: "Michal Wilczynski" <m.wilczynski@samsung.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Drew Fustini" <drew@pdp7.com>, "Guo Ren" <guoren@kernel.org>, "Fu Wei"
 <wefu@redhat.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250610-rust-next-pwm-working-fan-for-sending-v2-0-753e2955f110@samsung.com> <CGME20250610125332eucas1p2da441aa44760236527afc82495af95d1@eucas1p2.samsung.com> <20250610-rust-next-pwm-working-fan-for-sending-v2-1-753e2955f110@samsung.com>
In-Reply-To: <20250610-rust-next-pwm-working-fan-for-sending-v2-1-753e2955f110@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_021226_827538_01BC6AFA 
X-CRM114-Status: GOOD (  14.58  )
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

On Tue Jun 10, 2025 at 2:52 PM CEST, Michal Wilczynski wrote:
> Introduce safe Rust abstractions for the Linux PWM subsystem. These
> abstractions provide ergonomic, lifetime managed wrappers around the
> core C data structures and functions, enabling the development of PWM
> chip drivers in safe Rust.
>
> This initial version provides the core building blocks for writing a PWM
> chip provider driver, with a focus on safety, resource management, and
> idiomatic Rust patterns.
>
> The main components are:
>
> Ownership and Lifetime Management:
>  - The pwm::Chip type, an ARef managed wrapper for struct pwm_chip,
>    correctly handles the object's lifetime by using the embedded struct
>    device's reference counter.
>  - A pwm::Registration RAII guard ensures that a call to register a
>    chip (pwmchip_add) is always paired with a call to unregister it
>    (pwmchip_remove), preventing resource leaks.
>
> Safe Type Wrappers:
>  - Safe, idiomatic Rust types (Polarity, Waveform, State, Args,
>    Device) are provided to abstract away the raw C structs and enums.
>    The State wrapper holds its data by value, avoiding unnecessary
>    heap allocations.
>
> Driver Operations (PwmOps):
>  - A generic PwmOps trait allows drivers to implement the standard
>    PWM operations. It uses an associated type (WfHw) for the driver's
>    hardware specific waveform data, moving unsafe serialization logic into
>    the abstraction layer.
>    The trait exposes the modern waveform API (round_waveform_tohw,
>    write_waveform, etc.) as well as the other standard kernel callbacks
>    (get_state, request, apply).
>  - A create_pwm_ops function generates a C-compatible vtable from a
>    PwmOps implementor.
>
> This foundational layer is designed to be used by subsequent patches to
> implement specific PWM chip drivers in Rust.
>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  MAINTAINERS                     |   6 +
>  drivers/pwm/Kconfig             |  13 +
>  rust/bindings/bindings_helper.h |   1 +
>  rust/helpers/helpers.c          |   1 +
>  rust/helpers/pwm.c              |  20 +
>  rust/kernel/lib.rs              |   2 +
>  rust/kernel/pwm.rs              | 864 ++++++++++++++++++++++++++++++++++++++++
>  7 files changed, 907 insertions(+)

Do you mind splitting this into smaller commits to make review easier?

---
Cheers,
Benno


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
