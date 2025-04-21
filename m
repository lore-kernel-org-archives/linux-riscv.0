Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A78C369D5
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Apr 2025 16:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u+TYOmAMDhdZwCYj0YUpzMGN+lUK6cJPCz1FLNCA0PI=; b=l6hxur4IjwyQv2
	Pqfw4MRG8L3pdOXZqdiwuBnNCZ4RVp4+r2bCEt5Lx6hROIsUPzpoY94uChqgc6UmqUrPoCY3Y92+i
	pSKLMO7sztzbAQXMJzxzJl5TJeBIh6qhCTCWcr5yjxNNc0sAZuvdvtYOBdYCgRaqb1YiWMK8lJwfe
	QvBmuG3NJNcTXipYx1gtaBKw0ZtrLN8XRd7Rij2oCiyE9m3is8mWiVAx3bdGWSxjo00ogdjlQm89u
	BuFpERI17h2lk8U9lNhCcasVrYoRAmq++XicQdremVFs7fMlywQLLci21AtJROeH8Ab8blVDC5lTz
	pWwGPMMO77iJsrSznAiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6u19-00000004fmd-0pgR;
	Mon, 21 Apr 2025 16:29:11 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6tzf-00000004faM-0hMK;
	Mon, 21 Apr 2025 16:27:41 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-7c5568355ffso334962885a.0;
        Mon, 21 Apr 2025 09:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745252857; x=1745857657; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oLHYuRchr7pwRfQW4u682e1RScHliKjKzEJvvrT1wG0=;
        b=IZW6UGZA6IJHaFIlfFt5dM4llsMN9qcnsesVJchlGsLmnt8eCrUX4IpO8s96rHEn0B
         vhGF3CAEfD766sOdJ3ETU5Xa68BdAWiSQUpnp5zR/1I6HtJnlUBExt76r2IFb9n7JpJp
         1xkG5QOGb19XD7liAbc+EWuYr8Mc9O630Y92GHP3safVanr2P7mLXg107T+M1ca16udp
         u++MYT0qYUT6g9Gr6XDnQfNQ1673Ch+00bfUm+tnNtHFZ3XcYXbCOrZXhtElfHik/6iQ
         GqHKMT82Ycgt1kBezNk2/66dLXaalUpX5lsgdwA73Hg8OLYpOA7T8QVdCr6zrC+fj8Fb
         jJ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745252857; x=1745857657;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oLHYuRchr7pwRfQW4u682e1RScHliKjKzEJvvrT1wG0=;
        b=U3a58MQKrd9wMuvep91TWACeq9TClRwPzdD0uTOU73YSCRhz0yw7KMFTGoriva2Em/
         +wO9WZMuZ3V5dLjBc5i3QOvYGsZ6GNL7OGAvuy1NeRXvDv9Xr43iSzSfj7xFVi/5siiX
         B9UuWj30CNclJT1g2yx5Q6qk2FjrTcPU4jCMghBRWbao13jHI6Zlf4xNbwGIUIH2sqEz
         FI5mN+GNL1IETqACjJTZpAeFL63MpHDdRjCgc5oM0fU+2XFAE0SqI1CZX2E9giUSiq5X
         HL8elr9RehUQhb5cA2lXPCzdqWYnavt7uEKWafLT3ARsYV5uS40gzk5/fFZGlbFssBmm
         bgWg==
X-Forwarded-Encrypted: i=1; AJvYcCVSpyNGTXYWb/Q3CVltvsLdUQjtjte+zyZDSjMucDYb6bY8R1uVFk7g1LO3BKF0KQIjc8TOZqwEevFny0E=@lists.infradead.org, AJvYcCWcKjEMMmOjUW4zMgkX6UGyMuTZ2LnxdrXVPyNJi2IHqyK5mZRWI2Xo5pqbRAXqUKe3SzuHU7RhXv4OKXn8m7Ov@lists.infradead.org
X-Gm-Message-State: AOJu0Yys6B9arikw2C/QyfOEmF/ptQMsa+6aUXLqdtJeaEQ2WBgnlzYq
	wECGVRpc4afnS80n9173nUp87QLE/T4kKqPYgJvP2e7CpfFr6E3u
X-Gm-Gg: ASbGncssxtY7gC31SnPxv9kSZNVPWfuEV8bKHfkkf9TWBe2HZjUJJOcnER8DF+VscMH
	VSwQMcAhm7IzyJ1NOChwUyTRI8TOxe+I2fNfp9Rab4Ux5ON63337SMwMwG5lyTgs8moZ/6+KLSo
	Q5APu52K/EYQEIVk5XXOJZq5ZCx+EPWjhFluI8reIJdpYkRwFVWrCMrbT1AXiGH58D+Am81j4bt
	OllbukpT+0y+AAkvX8AH8ZodDzFBUa5uRypjCcubC/cFd+HB4hlhKvF+gioxRmgYgmcNKpHDF7B
	fUEJQi5YgE6mvFY9OIC/VfUiIRLnvmnPIjShrRGJGc86Ml8yAjTvbkT5jBawIMdWfJuMa0Qxx/x
	ivrGVfuNlCqerUupUOI2i2n5G67Wur2I=
X-Google-Smtp-Source: AGHT+IHkh2y6EUgLVjLgmaJTeVknwPBH8VkizNszXHisxLKmOsw73F8ebbDJDPgpLNRKOGxJtmiMnA==
X-Received: by 2002:a05:6214:4004:b0:6e8:f3af:ed59 with SMTP id 6a1803df08f44-6f2c4578776mr168874586d6.22.1745252857339;
        Mon, 21 Apr 2025 09:27:37 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2b32faasm45573856d6.63.2025.04.21.09.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 09:27:37 -0700 (PDT)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id D68B31200043;
	Mon, 21 Apr 2025 12:27:35 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Mon, 21 Apr 2025 12:27:35 -0400
X-ME-Sender: <xms:93EGaPl6BmgDg5HRVTlKEySE3NnVGFFCOwIj3_v1rNJpu3CQJ6K5Eg>
    <xme:93EGaC0uwLD5t9mIRSOE_S8HjDz1DQV3c15V-1MFrJQr4xI9-HF4I6GI5qPDpUoMO
    juS44Uj89gQYEOh-A>
X-ME-Received: <xmr:93EGaFpvLHpOndPFbORX2EV6IMd2U1UEDKtmyhUzyLci7s2P5hHfAqbqSDWQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedufedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeffvdehfeejjeeliefgtdduuddtjeejveeu
    veeugeefleefkeekuefgudeuhfefgeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpd
    hlfihnrdhnvghtpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrsh
    honhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghn
    gheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohephe
    ekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegurghvihgughhofiesghhoohhg
    lhgvrdgtohhmpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheprhgtuhesvhhgvghrrdhkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehlihhnuhigqdgrrhgthhesvhhgvghrrdhkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehllhhvmheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtth
    hopehlkhhmmheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehojhgvuggr
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrih
    hlrdgtohhm
X-ME-Proxy: <xmx:93EGaHmx0ei2frON30pFqG29hH6FxIISfKFIz4y0bydjQ2hjEbYuGg>
    <xmx:93EGaN0Ki0yvaurBA4rYcYRpOq27QuhicUvHpsftxbYlhIZ31G0jnw>
    <xmx:93EGaGvKmK1ylW0v-5qMLRuZMoRSF1lzFGDRVkp7ot-zrvvXP9n7FA>
    <xmx:93EGaBXjKwcfkYmoa2p6XPyJyMmxu_7rONV9PmDsnLPfsWF3VpWZbA>
    <xmx:93EGaM1awRHGn3vR7mMNQRnUEgoIxz259bYnVfYkzH9QAtkYQ1rePPx1>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Apr 2025 12:27:34 -0400 (EDT)
Date: Mon, 21 Apr 2025 09:27:28 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: David Gow <davidgow@google.com>
Cc: rust-for-linux@vger.kernel.org, rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	llvm@lists.linux.dev, lkmm@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>,	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Andrea Parri <parri.andrea@gmail.com>,	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Nicholas Piggin <npiggin@gmail.com>,	David Howells <dhowells@redhat.com>,
	Jade Alglave <j.alglave@ucl.ac.uk>,	Luc Maranget <luc.maranget@inria.fr>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,	Daniel Lustig <dlustig@nvidia.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,	kent.overstreet@gmail.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, elver@google.com,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,	Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Catalin Marinas <catalin.marinas@arm.com>,	torvalds@linux-foundation.org,
 linux-arm-kernel@lists.infradead.org,	linux-fsdevel@vger.kernel.org,
 Trevor Gross <tmgross@umich.edu>,	dakr@redhat.com,
 Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang1211@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,	Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org
Subject: Re: [RFC v2 00/13] LKMM *generic* atomics in Rust
Message-ID: <aAZx8GARiCW-pq9_@boqun-archlinux>
References: <20241101060237.1185533-1-boqun.feng@gmail.com>
 <CABVgOSm1cDcrsgYutooRG-ZLuzMypAO+ndNFyPy2w3_5B84TSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABVgOSm1cDcrsgYutooRG-ZLuzMypAO+ndNFyPy2w3_5B84TSQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_092739_229429_7F9A6BDF 
X-CRM114-Status: GOOD (  48.83  )
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

On Sat, Nov 02, 2024 at 03:35:36PM +0800, David Gow wrote:
> On Fri, 1 Nov 2024 at 14:04, Boqun Feng <boqun.feng@gmail.com> wrote:
> >
> > Hi,
> >
> > This is another RFC version of LKMM atomics in Rust, you can find the
> > previous versions:
> >
> > v1: https://lore.kernel.org/rust-for-linux/20240612223025.1158537-1-boqun.feng@gmail.com/
> > wip: https://lore.kernel.org/rust-for-linux/20240322233838.868874-1-boqun.feng@gmail.com/
> >
> > I add a few more people Cced this time, so if you're curious about why
> > we choose to implement LKMM atomics instead of using the Rust ones, you
> > can find some explanation:
> >
> > * In my Kangrejos talk: https://lwn.net/Articles/993785/
> > * In Linus' email: https://lore.kernel.org/rust-for-linux/CAHk-=whkQk=zq5XiMcaU3xj4v69+jyoP-y6Sywhq-TvxSSvfEA@mail.gmail.com/
> >
> > This time, I try implementing a generic atomic type `Atomic<T>`, since
> > Benno and Gary suggested last time, and also Rust standard library is
> > also going to that direction [1].
> >
> > Honestly, a generic atomic type is still not quite necessary for myself,
> > but here are a few reasons that it's useful:
> >
> > *       It's useful for type alias, for example, if you have:
> >
> >         type c_long = isize;
> >
> >         Then `Atomic<c_clong>` and `Atomic<isize>` is the same type,
> >         this may make FFI code (mapping a C type to a Rust type or vice
> >         versa) more readable.
> >
> > *       In kernel, we sometimes switch atomic to percpu for better
> >         scalabity, percpu is naturally a generic type, because it can
> >         have data that is larger than machine word size. Making atomic
> >         generic ease the potential switching/refactoring.
> >
> > *       Generic atomics provide all the functionalities that non-generic
> >         atomics could have.
> >
> > That said, currently "generic" is limited to a few types: the type must
> > be the same size as atomic_t or atomic64_t, other than basic types, only
> > #[repr(<basic types>)] struct can be used in a `Atomic<T>`.
> >
> > Also this is not a full feature set patchset, things like different
> > arithmetic operations and bit operations are still missing, they can be
> > either future work or for future versions.
> >
> > I included an RCU pointer implementation as one example of the usage, so
> > a patch from Danilo is added, but I will drop it once his patch merged.
> >
> > This is based on today's rust-next, and I've run all kunit tests from
> > the doc test on x86, arm64 and riscv.
> >
> > Feedbacks and comments are welcome! Thanks.
> >
> > Regards,
> > Boqun
> >
> > [1]: https://github.com/rust-lang/rust/issues/130539
> >
> 
> Thanks, Boqun.
> 

Hi David,

> I played around a bit with porting the blk-mq atomic code to this. As
> neither an expert in Rust nor an expert in atomics, this is probably
> both non-idiomatic and wrong, but unlike the `core` atomics, it
> provides an Atomic::<u64> on 32-bit systems, which gets UML's 32-bit
> build working again.
> 
> Diff below -- I'm not likely to have much time to work on this again
> soon, so feel free to pick it up/fix it if it suits.
> 

Thanks. These look good to me, however, I think I prefer Gary's patch
for this:

	https://lore.kernel.org/lkml/20250219201602.1898383-4-gary@garyguo.net/

therefore, I won't take this into the next version. But thank you for
taking a look!

Regards,
Boqun

> Thanks,
> -- David
> 
> ---
> diff --git a/rust/kernel/block/mq/operations.rs
> b/rust/kernel/block/mq/operations.rs
> index 9ba7fdfeb4b2..822d64230e11 100644
> --- a/rust/kernel/block/mq/operations.rs
> +++ b/rust/kernel/block/mq/operations.rs
> @@ -11,7 +11,8 @@
>      error::{from_result, Result},
>      types::ARef,
>  };
> -use core::{marker::PhantomData, sync::atomic::AtomicU64,
> sync::atomic::Ordering};
> +use core::marker::PhantomData;
> +use kernel::sync::atomic::{Atomic, Relaxed};
> 
>  /// Implement this trait to interface blk-mq as block devices.
>  ///
> @@ -77,7 +78,7 @@ impl<T: Operations> OperationsVTable<T> {
>          let request = unsafe { &*(*bd).rq.cast::<Request<T>>() };
> 
>          // One refcount for the ARef, one for being in flight
> -        request.wrapper_ref().refcount().store(2, Ordering::Relaxed);
> +        request.wrapper_ref().refcount().store(2, Relaxed);
> 
>          // SAFETY:
>          //  - We own a refcount that we took above. We pass that to `ARef`.
> @@ -186,7 +187,7 @@ impl<T: Operations> OperationsVTable<T> {
> 
>              // SAFETY: The refcount field is allocated but not initialized, so
>              // it is valid for writes.
> -            unsafe {
> RequestDataWrapper::refcount_ptr(pdu.as_ptr()).write(AtomicU64::new(0))
> };
> +            unsafe {
> RequestDataWrapper::refcount_ptr(pdu.as_ptr()).write(Atomic::<u64>::new(0))
> };
> 
>              Ok(0)
>          })
> diff --git a/rust/kernel/block/mq/request.rs b/rust/kernel/block/mq/request.rs
> index 7943f43b9575..8d4060d65159 100644
> --- a/rust/kernel/block/mq/request.rs
> +++ b/rust/kernel/block/mq/request.rs
> @@ -13,8 +13,8 @@
>  use core::{
>      marker::PhantomData,
>      ptr::{addr_of_mut, NonNull},
> -    sync::atomic::{AtomicU64, Ordering},
>  };
> +use kernel::sync::atomic::{Atomic, Relaxed};
> 
>  /// A wrapper around a blk-mq [`struct request`]. This represents an
> IO request.
>  ///
> @@ -102,8 +102,7 @@ fn try_set_end(this: ARef<Self>) -> Result<*mut
> bindings::request, ARef<Self>> {
>          if let Err(_old) = this.wrapper_ref().refcount().compare_exchange(
>              2,
>              0,
> -            Ordering::Relaxed,
> -            Ordering::Relaxed,
> +            Relaxed
>          ) {
>              return Err(this);
>          }
> @@ -168,13 +167,13 @@ pub(crate) struct RequestDataWrapper {
>      /// - 0: The request is owned by C block layer.
>      /// - 1: The request is owned by Rust abstractions but there are
> no [`ARef`] references to it.
>      /// - 2+: There are [`ARef`] references to the request.
> -    refcount: AtomicU64,
> +    refcount: Atomic::<u64>,
>  }
> 
>  impl RequestDataWrapper {
>      /// Return a reference to the refcount of the request that is embedding
>      /// `self`.
> -    pub(crate) fn refcount(&self) -> &AtomicU64 {
> +    pub(crate) fn refcount(&self) -> &Atomic::<u64> {
>          &self.refcount
>      }
> 
> @@ -184,7 +183,7 @@ pub(crate) fn refcount(&self) -> &AtomicU64 {
>      /// # Safety
>      ///
>      /// - `this` must point to a live allocation of at least the size
> of `Self`.
> -    pub(crate) unsafe fn refcount_ptr(this: *mut Self) -> *mut AtomicU64 {
> +    pub(crate) unsafe fn refcount_ptr(this: *mut Self) -> *mut Atomic::<u64> {
>          // SAFETY: Because of the safety requirements of this function, the
>          // field projection is safe.
>          unsafe { addr_of_mut!((*this).refcount) }
> @@ -202,28 +201,22 @@ unsafe impl<T: Operations> Sync for Request<T> {}
> 
>  /// Store the result of `op(target.load())` in target, returning new value of
>  /// target.
> -fn atomic_relaxed_op_return(target: &AtomicU64, op: impl Fn(u64) ->
> u64) -> u64 {
> -    let old = target.fetch_update(Ordering::Relaxed,
> Ordering::Relaxed, |x| Some(op(x)));
> -
> -    // SAFETY: Because the operation passed to `fetch_update` above always
> -    // return `Some`, `old` will always be `Ok`.
> -    let old = unsafe { old.unwrap_unchecked() };
> -
> -    op(old)
> +fn atomic_relaxed_op_return(target: &Atomic::<u64>, op: impl Fn(u64)
> -> u64) -> u64 {
> +    let old = target.load(Relaxed);
> +    let new_val = op(old);
> +    target.compare_exchange(old, new_val, Relaxed);
> +    old
>  }
> 
>  /// Store the result of `op(target.load)` in `target` if `target.load() !=
>  /// pred`, returning [`true`] if the target was updated.
> -fn atomic_relaxed_op_unless(target: &AtomicU64, op: impl Fn(u64) ->
> u64, pred: u64) -> bool {
> -    target
> -        .fetch_update(Ordering::Relaxed, Ordering::Relaxed, |x| {
> -            if x == pred {
> -                None
> -            } else {
> -                Some(op(x))
> -            }
> -        })
> -        .is_ok()
> +fn atomic_relaxed_op_unless(target: &Atomic::<u64>, op: impl Fn(u64)
> -> u64, pred: u64) -> bool {
> +    let old = target.load(Relaxed);
> +    if old == pred {
> +        false
> +    } else {
> +        target.compare_exchange(old, op(old), Relaxed).is_ok()
> +    }
>  }
> 
>  // SAFETY: All instances of `Request<T>` are reference counted. This



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
