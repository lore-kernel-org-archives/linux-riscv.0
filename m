Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000FBE8306E
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Feb 2026 09:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2MjEMnTQUPT7vfPLqlOG7YAOMVVlzHo96eIVKMcK2nY=; b=QP8th+MpqVTbye
	QYy6narcho7HKfzCVw9lq6gfEMfTnuJBetPEu2Ng0AKm3qs5wj99vdXi+CpPh88dywFcmo4bXsbce
	yS13Q6bjO7MEnUTe7LcI4e/dzE5x1o03xvYT8n61c7W6zfFyd5MkuBI4sXv6mIOynyz2OfGdKvWPw
	51dN+8/OXdTQvKnriAv88RuTOTPX3s5Iy6sm41ODk3d2SVBneZxz6ZBsKg4jecq/a3i6jWCQ2Awn2
	r5EQEEtbnvV+dMGm2xEFyqfmshdKCtWqdtt/VN2qsrpbGiY3d+HT4L493jQkh/J5EHZEyiR34Unx0
	v16/RFdLQKQR4KsA8Sqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnD0X-00000006PPi-0pxe;
	Tue, 03 Feb 2026 09:47:41 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnD0V-00000006PPM-0Ug1
	for linux-riscv@lists.infradead.org;
	Tue, 03 Feb 2026 09:47:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770112055;
	bh=SJgibaHQ0szc37inrLGCwLbR+73hqXSTWiGCcnfOEc8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PmdE215r9KrduIfUmhLkRCuOYfk6uHTuy+nhv5COdt4yzi2k0B0QRR6KCcTxXvvAD
	 nQSQ58J6vL4sryTrppeY0+ysfwmJTs9G22I6zMcSDY4F/1e7RYdofbnD/Cq+YhQvqU
	 npqOGJr+/Yl8q4AXszsNLMDZg4HbOUFrxOYPsWEnbI6B3fkf3NqTcDpGYT8I0/GWZ3
	 SMuVVQgpON9mBztp3Fmz5GVxJojHTbJ0xh85RanMmxEvtYcmOxojIHXU0HXifZ7MYr
	 IPmai1V/XYW1mL2y7z5oDy73AbND3prY1QiZF6z2NnMY1MmvJRNwAaqN2Yw2eUdFAM
	 KZHal4V1/u/kg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4D55117E1149;
	Tue,  3 Feb 2026 10:47:34 +0100 (CET)
Date: Tue, 3 Feb 2026 10:47:31 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Gary Guo" <gary@garyguo.net>
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Viresh Kumar" <viresh.kumar@linaro.org>, "Danilo
 Krummrich" <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Drew
 Fustini" <fustini@kernel.org>, "Guo Ren" <guoren@kernel.org>, "Fu Wei"
 <wefu@redhat.com>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=
 <ukleinek@kernel.org>, "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun.feng@gmail.com>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-riscv@lists.infradead.org>,
 <linux-pwm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
Message-ID: <20260203104731.1918559a@fedora>
In-Reply-To: <20260203100913.6d224657@fedora>
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
	<20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
	<DFSMRQFIYQPO.1A38Y84XZ1GZO@garyguo.net>
	<20260202171038.10e51e18@fedora>
	<20260203100913.6d224657@fedora>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_014739_312245_166A89F4 
X-CRM114-Status: GOOD (  18.45  )
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

On Tue, 3 Feb 2026 10:09:13 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> Hello Daniel,
> 
> On Mon, 2 Feb 2026 17:10:38 +0100
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
> 
> > > > -#[pin_data(PinnedDrop)]
> > > > +#[pin_data]
> > > >  pub(crate) struct TyrData {
> > > >      pub(crate) pdev: ARef<platform::Device>,
> > > >  
> > > > @@ -92,13 +92,9 @@ fn probe(
> > > >          pdev: &platform::Device<Core>,
> > > >          _info: Option<&Self::IdInfo>,
> > > >      ) -> impl PinInit<Self, Error> {
> > > > -        let core_clk = Clk::get(pdev.as_ref(), Some(c_str!("core")))?;
> > > > -        let stacks_clk = OptionalClk::get(pdev.as_ref(), Some(c_str!("stacks")))?;
> > > > -        let coregroup_clk = OptionalClk::get(pdev.as_ref(), Some(c_str!("coregroup")))?;
> > > > -
> > > > -        core_clk.prepare_enable()?;
> > > > -        stacks_clk.prepare_enable()?;
> > > > -        coregroup_clk.prepare_enable()?;
> > > > +        let core_clk = Clk::<Enabled>::get(pdev.as_ref(), Some(c_str!("core")))?;      
> > > 
> > > Ah, more turbofish.. I'd really want to avoid them if possible.
> > > 
> > > Any disadvantage on just ask the user to chain `.get().prepare_enable()?`? This
> > > way it is also clear that some action is performed.    
> > 
> > I've just disc  
> 
> Sorry, I've hit the reply button before I had finished writing my
> answer. So I was about to say that I had started writing something
> similar without knowing this series existed, and I feel like we'd don't
> really need those prepare_enable() shortcuts that exist in C. We might
> has well just go:
> 
> 	Clk::get(dev, Some(c_str!("core"))).prepare()?.enable()?;

If we want this pattern to work, we also need:

    impl<State: ClkState> From<Error<State>> for kernel::error::Error {
        fn from(e: Error<State>) -> kernel::error::Error {
            e.error
        }
    }

> 
> and have the following variant-specofoc functions
> 
> - Clk<Unprepared>::get[_optional]() (no get on Prepared and Enabled
>   variants)
> - Clk<Unprepared>::prepare()
> - Clk<Prepared>::{enable,unprepare}()
> - Clk<Enabled>::{disable}()
> 
> Regards,
> 
> Boris
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
