Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E5DAE7717F
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 20:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B2rLMJQAPc8F16v92OqcctFz/RgYJlwqWajTZ6PLpQ0=; b=L4XTJnIfT3+V0g
	9Hn4NCbKTOC05LdgvBopQ3z5/7oAy094Wr/DNQ1N2+c//6CLM5QeSJfByTgD007kUYC2k7DFngtpO
	287fKaxbmorzJiu6jGafvqL7H2/7Vt47M7uJpHaew9ebI6JhLdc/7K5z4UPtpbo/XZHEjjHUKEz7O
	h0MZs93MXyUPBaqUCHLWdXiELpw+tO2Js2OzS42/9LdWlrRVCg+9KcJBIiCKi20ePlpjXLFB3ZGme
	5GPFkcG8/7RZQaWUHC+ciimYFDA8nFsZp97ewAdVQSjoKULhPrvuPFpS2SS0+f5zMHtQWeDniJauW
	v0UnioDcPP/MfwV1Y4eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMCHM-00000004yLn-2znY;
	Fri, 13 Dec 2024 20:28:52 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMCHK-00000004yL2-2qNX;
	Fri, 13 Dec 2024 20:28:51 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-6d896be3992so14964556d6.1;
        Fri, 13 Dec 2024 12:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734121729; x=1734726529; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oy+g6CCR8H9z+qQ9IKAP5iLictR2vzTnBiPMNSCfde4=;
        b=bw9eqyP1UBYCSRfy9hd6TSYXo9kbd9QlzrSDVDSxHdFLLXkM/I9rPpiQcGL3Z2DOar
         qYO5Qc1eChOHcyfWeQK6le2c+pYTe259AudV6zs4gazzdNj+DsLIJWHWHc6b1/gCL3vL
         x19Ots2AHt54PEhavWBRN3HvBlX6yilH4Kc5n9Sf8WpQ7veWb+F63XoPL3ctqDhByQvJ
         ZPUIed0qh09IUwkUQ231a8HUtXuTmj4VJC/P5TskXkOp0BDcnEBiFSRyv+z+w7on7b1G
         ZScgZWfA0J7fuH39/Qn7PBioFngdNy2FFTBWSipD1T+FkOJGbttcOQomek9+vaNqrPkW
         qNlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734121729; x=1734726529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oy+g6CCR8H9z+qQ9IKAP5iLictR2vzTnBiPMNSCfde4=;
        b=H7NoflTxu0P9WEQS337Q9+t6d92oKErySeDUVqCAJ7N16FOFdsb6jLRHl/5+IxwRR3
         MxEkihKbrKDLcsayZvvW6kBMrT75VMg+ioPsM6GL58JXqPFc3ip4hAzn7Fdt5JYjj1g8
         5ycy3XVKxD3CERXQMF/F7deW35rYX6dgAsdrzAbEfnbZy//WJuY4knsCqn1O7iMWnHCb
         BiBhrDNkYW8QDEXThzUMBhpA9G9yvEUilDMKMHrW6rCr6K0WIC76QRO5of0L2zYfHAYN
         8ZrvmMso+CQPHYqpoi+SBwjESsJPT7IQsyBL+qkzKGwQSjNuvcggtWHN+tTsY2y1V83i
         gtUg==
X-Forwarded-Encrypted: i=1; AJvYcCW10l/EqDNJTVyGwKsQOXnknA7CqQhPzfaQ6oJEQjuUT/DEOeMS1RD048lBxEj9l3lEzKIoHZoSylZnlyc=@lists.infradead.org, AJvYcCXe5ho/ilpIL0dKl9vVkWiZVJr8ZE1kkDnrjLfG7D4+GqVUwbCLriIBoSfwTy1abEGgLAb2I3wpVfaQQsvUoXq2@lists.infradead.org
X-Gm-Message-State: AOJu0YzzceOt6TNb8DYI9/q6cNR8ej4F9upPgwLpXMwd5lIv/qhxrJ/P
	vR0KraRGWbN3sMGQWMtlOy5NyZpjKkzmY4Jjrhy4fJnBimKEpOzQ
X-Gm-Gg: ASbGncsDNnXdtCDfCForcxVcWDQfy/2pHB2LFqkS2KMx9sXpOYAmLtPhV/xOhV7Iblx
	v9e6g7aRNOB0q251EUG4janmT90xwA03bNosHPjsB9FYkJCYv7+Y/iDu03IwWYIU+lQ6MaFTjTh
	yw3sN3+ihnxZa9foytiG+sQt6sCCJIqUgSMrPvfsAY+ygIIfytllAzWiYbnTuNOAtEwDmvzEvMJ
	b5I/9jy3LcoTb7fkPu9ioyb5dUumXs71gPcHqaxvEIl5DyattOPXXjYKurxlK2mq0W3txAyT6dJ
	kEbh6trUiAYSD2wND/mix88JCjlyn6/lueyrCAKx223HWgA=
X-Google-Smtp-Source: AGHT+IE2tKNH2SwdPs6Zkn1SWo3BZBrlDL+pJUKK8ffETsaGO4d5bvz342opBhZTwO6vfAdVJSMQ5A==
X-Received: by 2002:ad4:5dcb:0:b0:6d8:e641:da29 with SMTP id 6a1803df08f44-6dc8ca44819mr70587316d6.6.1734121728937;
        Fri, 13 Dec 2024 12:28:48 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dccd3805e5sm789776d6.114.2024.12.13.12.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 12:28:48 -0800 (PST)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id B8C611200066;
	Fri, 13 Dec 2024 15:28:47 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Fri, 13 Dec 2024 15:28:47 -0500
X-ME-Sender: <xms:_5hcZ52D0Txfq3afYHx_FbgTtmEk_XFYGdsCxZrFemGViQYgimNBIw>
    <xme:_5hcZwE0JuQpAx-sNtF1T4lNVXCTxpu8QQK39LNMwvRar7kPxKYKGILxZCLuwVeiw
    JqiJqyI3iHFHYZ3VA>
X-ME-Received: <xmr:_5hcZ55iST0Ld5UtgJO19PFmYPPES1IEZQ5fvzsB0A8k-EhTnaQH_VgICyoU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrkeejgddufeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpefftdeihfeigedtvdeuueffieetvedtgeejuefh
    hffgudfgfeeggfeftdeigeehvdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdo
    mhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejke
    ehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgr
    mhgvpdhnsggprhgtphhtthhopeehjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    eprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtoheprhhushhtqdhf
    ohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhgtuh
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgv
    lhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhgthh
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehllhhvmheslhhishhtshdr
    lhhinhhugidruggvvhdprhgtphhtthhopehlkhhmmheslhhishhtshdrlhhinhhugidrug
    gvvhdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegr
    lhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:_5hcZ21dZDlSFPHhJ-hR_xqZ1E0rep-r4WrXiwUQyM1nizooQS9AnA>
    <xmx:_5hcZ8F5a37Iksgu8azbe4LtJh86oPlDtiIZrtuMnU4PwfLQHgkdaA>
    <xmx:_5hcZ3_Z-H-jUwynNjV6TS1Q48CIKGofI_-xcmhDLwS-hAy2MJ1wxA>
    <xmx:_5hcZ5lGDiaKlmxar7Ng2QGY3xkyj4bsqNu3LdLxBbywFujFVq5mLg>
    <xmx:_5hcZwFSPtMAKsGOW-8Vmvi_oCQ7KHZB-ZN7yeYoB03uVjiO-lIrMZ-I>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Dec 2024 15:28:45 -0500 (EST)
Date: Fri, 13 Dec 2024 12:28:45 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: rust-for-linux@vger.kernel.org, rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	llvm@lists.linux.dev, lkmm@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>,	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
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
Subject: Re: [RFC v2 02/13] rust: sync: Add basic atomic operation mapping
 framework
Message-ID: <Z1yY_Yr0B6KpWLmJ@tardis.local>
References: <20241101060237.1185533-1-boqun.feng@gmail.com>
 <20241101060237.1185533-3-boqun.feng@gmail.com>
 <CAH5fLghYjcb-mpR_rr2aC_W8rRb6g8jCFxgky7iEqVgmpHjf=Q@mail.gmail.com>
 <Z1sYNOYJPzQmJXn6@boqun-archlinux>
 <CAH5fLgidmY7FtKLKR-Yxb6U-mQvsyatGRToqSHHRACfTdiAtUA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH5fLgidmY7FtKLKR-Yxb6U-mQvsyatGRToqSHHRACfTdiAtUA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_122850_715629_D84976C3 
X-CRM114-Status: GOOD (  31.62  )
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

On Fri, Dec 13, 2024 at 03:37:13PM +0100, Alice Ryhl wrote:
[...]
> > > > @@ -0,0 +1,19 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +
> > > > +//! Atomic primitives.
> > > > +//!
> > > > +//! These primitives have the same semantics as their C counterparts: and the precise definitions of
> > > > +//! semantics can be found at [`LKMM`]. Note that Linux Kernel Memory (Consistency) Model is the
> > > > +//! only model for Rust code in kernel, and Rust's own atomics should be avoided.
> > > > +//!
> > > > +//! # Data races
> > > > +//!
> > > > +//! [`LKMM`] atomics have different rules regarding data races:
> > > > +//!
> > > > +//! - A normal read doesn't data-race with an atomic read.
> > >
> > > This was fixed:
> > > https://github.com/rust-lang/rust/pull/128778
> > >
> >
> > Yeah, I was aware of that effort, and good to know it's finally merged.
> > Thanks!
> >
> > This will be in 1.83, right? If so, we will still need the above until
> > we bump up the minimal rustc version to 1.83 or beyond. I will handle
> > this properly with the minimal rustc 1.83 (i.e. if this goes in first,
> > will send a follow up patch). I will also mention in the above that this
> > has been changed in 1.83.
> >
> > This also reminds that I should add that LKMM allows mixed-size atomic
> > accesses (as non data race), I will add that in the version.
> 
> This is just documentation. I don't think you need to do any special

The PR also contained miri changes, so the same code will be reported
differently by miri. That was what I was thinking of. However, now think
about it, we are not going to use Rust atomics, so this difference
shouldn't affect us. Therefore I agree, I will drop this.

> MSRV handling.
> 
> > > > +mod private {
> > > > +    /// Sealed trait marker to disable customized impls on atomic implementation traits.
> > > > +    pub trait Sealed {}
> > > > +}
> > >
> > > Just make the trait unsafe?
> > >
> >
> > And make the safety requirement of `AtomicImpl` something like:
> >
> >     The type must have the implementation for atomic operations.
> >
> > ? Hmm.. I don't think that's a good safety requirement TBH. Actually the
> > reason that we need to restrict `AtomicImpl` types is more of an
> > iplementation issue (the implementation need to be done if we want to
> > support i8 or i16) rather than safety issue. So a sealed trait is proper
> > here. Does this make sense? Or am I missing something?
> 
> Where is the AtomicImpl trait used?
> 

It's used when `impl`ing an `AllowAtomic` type, `AllowAtomic` has an
associate type named `Repr` which must be an `AtomicImpl`, i.e. each
type that has atomic operation support must select the underlying
implementation types (currently we only have i32 and i64 from C side
APIs). Using a sealed trait is appropriate in this case, because unless
you are adding atomic support for different sizes of data, you shouldn't
impl `AtomicImpl`.

Regards,
Boqun

> Alice

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
