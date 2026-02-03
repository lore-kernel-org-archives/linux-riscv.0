Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07155E6E7EE
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Feb 2026 10:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9IhGcLdCBmjdtTahav+ag24xwP5v709xfMSbNqs2aNg=; b=BVavJn1Aqc9TmH
	AvOdMH6jVwCkNqSy4ye+hFIRIIr3NszQNoX+cCowpRoAcMp+ewv319SY04766vYO0yIImLFVnvrAR
	eeft3UMucOgufGnIv8QpXK2r0jWfYujSDjmlyZRS+B0NwmjbuqKWeUT0xioKO8gKyelvrAldDPULq
	FEpPqL7D7ekviNpQRd/Kl+j/HptG78lZ6Y8I3QWgSQ8UB4sGUtSmyTVX62AIMGTuDpadjkKQCqp/k
	lOF4RtsVAdm3sPGzEuqEYZ+0GINYSl5RK16dbIDdSJyEsww4ArTFlYF/GJXAtUkMrqjYr8x4RF0iX
	lfvE9tQIc5FFz2ebG1Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnDoQ-00000006UQV-0POA;
	Tue, 03 Feb 2026 10:39:14 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnDoM-00000006UPc-3LLg
	for linux-riscv@lists.infradead.org;
	Tue, 03 Feb 2026 10:39:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770115148;
	bh=7p06UjiOAmOZZ+ivGAxqutS8zWb3kS0ttTynLQr7ZJc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SgnwILfkwv3oTBP0QRGD4+/0u2LFd1lrBTYwrzMVWZl6IZzITGNDJPHWmpbkEnt4e
	 TG4wDLMOmMtMS+ETjG6JC5bdL406D0GAmvytUj51hwLYcWrpJPbM5WTaSzTywjZoaI
	 FFxjHM3rtDg9gcYE5FzA2bwwRKFt6LBt2jw+GX4PnHvoBw12en8RgzxwQBy1kOgZVQ
	 ZA5lrnb2dyhfKzBwd5uelfXNfqKGTSm7/ZR+xlRsCWRuBbQbKZuf01ZH6deeTiX1ux
	 r5u/L67j38Vt5bqXFK0YhNrmJ6Nmb6FQGbO7oT3YpnxoEZDA9Y6OsNWS5net3YeuS/
	 04UbIXZpqpNlw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 45D4217E00A3;
	Tue,  3 Feb 2026 11:39:07 +0100 (CET)
Date: Tue, 3 Feb 2026 11:39:02 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Maxime Ripard <mripard@kernel.org>, Daniel Almeida
 <daniel.almeida@collabora.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Drew Fustini <fustini@kernel.org>, Guo Ren
 <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, "Uwe =?UTF-8?B?S2xlaW5l?=
 =?UTF-8?B?LUvDtm5pZw==?=" <ukleinek@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda
 <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, "=?UTF-8?B?QmrDtnJu?= Roy Baron"
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
Message-ID: <20260203113902.501e5803@fedora>
In-Reply-To: <aW4lCfUyumOKRRJm@google.com>
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
	<20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
	<20260108-delectable-fennec-of-sunshine-ffca19@houat>
	<98CD0BF6-3350-40B9-B8A9-F569AE3E3220@collabora.com>
	<20260119-thundering-tested-robin-4be817@houat>
	<aW4lCfUyumOKRRJm@google.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_023911_023996_C9FFB78C 
X-CRM114-Status: GOOD (  27.41  )
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

On Mon, 19 Jan 2026 12:35:21 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> On Mon, Jan 19, 2026 at 11:45:57AM +0100, Maxime Ripard wrote:
> > On Thu, Jan 08, 2026 at 11:14:37AM -0300, Daniel Almeida wrote:  
> > > > For example, it's quite typical to have (at least) one clock for the bus
> > > > interface that drives the register, and one that drives the main
> > > > component logic. The former needs to be enabled only when you're
> > > > accessing the registers (and can be abstracted with
> > > > regmap_mmio_attach_clk for example), and the latter needs to be enabled
> > > > only when the device actually starts operating.
> > > > 
> > > > You have a similar thing for the prepare vs enable thing. The difference
> > > > between the two is that enable can be called into atomic context but
> > > > prepare can't.
> > > > 
> > > > So for drivers that would care about this, you would create your device
> > > > with an unprepared clock, and then at various times during the driver
> > > > lifetime, you would mutate that state.  
> 
> The case where you're doing it only while accessing registers is
> interesting, because that means the Enable bit may be owned by a local
> variable. We may imagine an:
> 
>     let enabled = self.prepared_clk.enable_scoped();
>     ... use registers
>     drop(enabled);
> 
> Now ... this doesn't quite work with the current API - the current
> Enabled stated owns both a prepare and enable count, but the above keeps
> the prepare count in `self` and the enabled count in a local variable.
> But it could be done with a fourth state, or by a closure method:
> 
>     self.prepared_clk.with_enabled(|| {
>         ... use registers
>     });
> 
> All of this would work with an immutable variable of type Clk<Prepared>.

Hm, maybe it'd make sense to implement Clone so we can have a temporary
clk variable that has its own prepare/enable refs and releases them
as it goes out of scope. This implies wrapping *mut bindings::clk in an
Arc<> because bindings::clk is not ARef, but should be relatively easy
to do. Posting the quick experiment I did with this approach, in case
you're interested [1]

[1]https://gitlab.freedesktop.org/bbrezillon/linux/-/commit/d5d04da4f4f6192b6e6760d5f861c69596c7d837

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
