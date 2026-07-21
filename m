Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8097FC44529
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 07:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=73Gw/SyO+sOFn4lfalHgw08n7LnQa7at0Eyts9/3DEY=; b=snoRUtIOxiQGxd
	lhzWPSr7Cd4UOufQMLbfubHaZwkbic6kQ7ZWgJcAWzsa5Zc+IJOYWDpSnTZ1PwSckAv7OyNt29QP3
	WYTUh3EpSyy2i08loW7JJKyRG5jJNDOndO0cUQI+WtMaZoeTmRadEn9Nl2zw/DM7ee5ISbByzIlSO
	7vfooLDhyJ/Mi4CmbPG7t3nXf90Nsy76QQNVQWDOgHMb9pplINvas98Hp8wIc6Hh5RD2Dm3u0jmBc
	QwJ6J1jhrYxZyiAgGuiwsQhh5/UVk6qi3VNVvjdAq2E4MCF0zzi7ivVraeenbvH0r2khuCLxQ9I7W
	Nzs8xIcRAhfLmxGJzzJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5FM-00000008gxO-1cgB;
	Tue, 21 Jul 2026 07:50:36 +0000
Received: from out-13.smtp.spacemail.com ([63.250.43.96])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5FK-00000008gvx-0fn0
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jul 2026 07:50:35 +0000
Received: from gurudas.dev (107-194-158-19.lightspeed.sntcca.sbcglobal.net [107.194.158.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4h48gp578vz2x9B;
	Tue, 21 Jul 2026 07:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gurudas.dev;
	s=spacemail; t=1784620231;
	bh=zA2cPnAA92Xrj4Tj9D0WkWnQLAGKwGz9kgEDoAwbDH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gY0rYPpnmzdJfsPD+BFHyAgFbaXKuWK/yCorZvKAFcnCZAx3QvuPvJOvlAUrHKEHB
	 uunmuUMC/dKZ1q8ft7CZZKRpIxsKX/sLjXGIe+bjcSvYJEoqF+9Zqv5wAuXV7+7Gpq
	 uDfq0s0iuyPyyqiJVo1EZOCoUFC+YbkrbhZ9iNgL7DCK3E9y4ihvBy6+yO2JueK7EQ
	 i7KElcIMkKAMfqewjI5TWt6yYHS9fWSPAXcWE3NmycI038uJxnnQmtr3cTXitnG0+g
	 2oqt3ylO5PDkUbDurg/+Vj8/a++nH3DlXuG109IdpflgHY1Mhp3bkemzykQDcE/uMn
	 SpMDWS2IxFfFQ==
Date: Tue, 21 Jul 2026 00:50:28 -0700
From: Guru Das Srinagesh <linux@gurudas.dev>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>,
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] pwm: th1520: use vertical import style
Message-ID: <al8kxC4y3rviugTh@gurudas.dev>
Mail-Followup-To: Link Mauve <linkmauve@linkmauve.fr>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
References: <20260705-pwm-rust-vert-imp-v1-1-753dbbfc6061@gurudas.dev>
 <ak3-rU3IRYaLTCC5@luna>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ak3-rU3IRYaLTCC5@luna>
X-Envelope-From: linux@gurudas.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_005034_334944_2ADC48C3 
X-CRM114-Status: GOOD (  15.85  )
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

On Wed, Jul 08, 2026 at 09:39:25AM +0200, Link Mauve wrote:
> On Sun, Jul 05, 2026 at 07:52:05PM -0700, Guru Das Srinagesh wrote:
> > Convert `use` imports to vertical layout for better readability and
> > maintainability.
> > 
> > Signed-off-by: Guru Das Srinagesh <linux@gurudas.dev>
> > ---
> > Came across a recent commit bc58905eb07 ("samples: rust_misc_device: use
> > vertical import style") and found a few more locations that could
> > benefit from this cleanup. No functional changes.
> > 
> > Separating out patches per-subsystem as per the review feedback in [0].
> > 
> > Tested via:
> > 
> >     $ make LLVM=1 rustfmtcheck || echo "fail"
> >     $
> > 
> > [0]: https://lore.kernel.org/lkml/20260628-b4-rust-vertical-imports-v1-0-98bc71d4810b@gurudas.dev/
> > ---
> >  drivers/pwm/pwm_th1520.rs | 12 +++++++++---
> >  1 file changed, 9 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/pwm/pwm_th1520.rs b/drivers/pwm/pwm_th1520.rs
> > index 3e3fa51ccef9..2a3b107157ac 100644
> > --- a/drivers/pwm/pwm_th1520.rs
> > +++ b/drivers/pwm/pwm_th1520.rs
> > @@ -23,15 +23,21 @@
> >  use core::ops::Deref;
> >  use kernel::{
> >      clk::Clk,
> > -    device::{Bound, Core, Device},
> > +    device::{
> > +        Bound,
> > +        Core,
> > +        Device, //
> > +    },
> >      devres,
> >      io::{
> >          mem::IoMem,
> >          Io, //
> >      },
> > -    of, platform,
> > +    of,
> > +    platform, //
> 
> Same here, you just need the empty comment after time, not the one after
> platform.

Done, thank you for the review.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
