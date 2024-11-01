Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D2AE674AA
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Nov 2024 07:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MnqMU8gV87BXQjTPpBrqpIaR+wNb0xYvteDRCdc7YkA=; b=x+Tc89duvRo/r9
	1nIeVCDOBAF9nuxyQ7qmHQC2Ot5ipZCtfsxydekCmiUDkYIHKTkpfYcxY407AExzBWvaAA7pXIa4H
	N8udAA9j9fu8bhAVTIaxqNAyM9FfjzC0MUH6jaus4insGePY+eGcSq6AjZdudFwj3XFWlUCpg24kh
	SJEC2A8xfuVbNg1S9jyha1Q2Bv8saxN7i8X7R1j+Ecc/QR+b1T1LuoRhYtC+mFVRcpOsHFhf382Sz
	YhOAKPSgRpNYjxkz8hhLZw6/0BKGaHbcot0aOUoUZ7gBWINuHS1cN8geGh+qswiAo0FeMLRtNPeEt
	ni0GwTsvqkMxys9xt1/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ls6-000000064op-42Kh;
	Fri, 01 Nov 2024 07:15:02 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6lik-0000000631c-3UQl;
	Fri, 01 Nov 2024 07:05:24 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-6cbf340fccaso13860446d6.1;
        Fri, 01 Nov 2024 00:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730444721; x=1731049521; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CeRtSAMS9mSdK5Z3YnzN1Gk/iNcxNQ7vtANptzs5s5s=;
        b=hQ8K6lEo7wSf03Nsb1J1u4dowc8SpXPbJHVwKDIl8EHXF8htuWXFye7Kr8xKg8MTGp
         9/HTkx8xdJUfLnRx7b0zVGKiclGsupRGNwi49Ghb3n+gCck/MgCXdzC6H4ZeHZ2kVNgW
         r6iV8sueJLqNnOBonirl/cEdR5StW1RGVXaEMR5Z2T/FlfWT2LZU84H9V3+DqlKxyZHP
         lhTunOFrOXc6v+7se9Ny6btCoXUdMXGKY048eeb/0F8s8mMVMFh+vCUpraEHbEWdWHA+
         xu49kKIRehFadfEdgYR39iqDcD+wk2/KJ4aAzrk3Mj72GFBecYAwwzik6SFV/vZvf5pl
         dNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730444721; x=1731049521;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CeRtSAMS9mSdK5Z3YnzN1Gk/iNcxNQ7vtANptzs5s5s=;
        b=ocD9ojRTnaD6M+w4sBaYdDQjKext3SPAbW+Hcen5CHcFb4VkRBaY8lMRSxDLvMATBX
         ltfiRpB7XM/yEObevPje+VmUzmIa3oCdLnyGTZp2aIRVXcQK6es3JWXA7z2jjt2Bo+Q/
         SbDRRBGAJlFq40eojOoYRYE9WG4BjX0X+njgLA7Z1NqxrVXudYGxm5DfmaEA3bPTzO36
         n1+iN7pl8iEBylkU/byveJWvu6w6Bmfryi9n3DNbfw3I/rNitUEhNzdkLvaRL6B+oD6C
         vo3xNuMFquqE+74bJqTP/edjt7Xi1jzv8I0/3g0Y8/nyAUWytAE5ZAyPWaU8FsylZsuS
         K/wg==
X-Forwarded-Encrypted: i=1; AJvYcCVr7JXEPf/C3Pd/2WSGkHH0RCCw58WFr3gsXvPQr1sVK2Am2xE5qxfWMEEddiDBQH7rU0G+i9fuIGc7XOY=@lists.infradead.org, AJvYcCXEY/lzOxE2mnzdgA8uXHGo9xUIZ1T6lrrXZZRlY+FF4umGRICo5AogeoPR3I6nLAx0bnYRx45gG0suKlgAUs8z@lists.infradead.org
X-Gm-Message-State: AOJu0YzfRIYoQFXc5xI8TI63Iwo50lgB/VexCdIvQnwxwXqbqx9K1MTd
	w6atTIWpML/4ie3mu/4sIWPSa3DOGoS3rei0D7s+QEh2O6I7YyfR
X-Google-Smtp-Source: AGHT+IFp7PFcA9Yv18ZEzkJXz4nXgYi4dBXhMW8cGjnyABXDu+HDq6u6pDyh6cUOwHEOB5KNw4VoqA==
X-Received: by 2002:a05:6214:5d0d:b0:6cb:e9da:bd4 with SMTP id 6a1803df08f44-6d35424a1b4mr91380006d6.5.1730444721519;
        Fri, 01 Nov 2024 00:05:21 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d353f9f1f6sm16124086d6.27.2024.11.01.00.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 00:05:21 -0700 (PDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 4AB8A1200043;
	Fri,  1 Nov 2024 03:05:20 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Fri, 01 Nov 2024 03:05:20 -0400
X-ME-Sender: <xms:sH0kZ08A3ouC4fowzy8CSGkVPjbjWmcH-KuAODKOAsrCLPXJl3Z70A>
    <xme:sH0kZ8s3lxTPyi2hDzujZuvrhYp-WVf8-Sf965vl8Mk3R2lql72y6v2VufyoFEwaz
    oOXSs2tRAG9rZPtcw>
X-ME-Received: <xmr:sH0kZ6B7BxHG5qIwZWa1yZDfbd6nweSSBw-d-22bBr5sYk5gUgAUybdtWTM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekkedguddttdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleel
    ieevtdeguefhgeeuveeiudffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
    ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
    hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopeehkedpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtohepuggrvhhiughgohifsehgohhoghhlvgdrtg
    homhdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehrtghusehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheplhhinhhugidqrghrtghhsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheplhhlvhhmsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhk
    mhhmsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepohhjvggurgeskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtgho
    mh
X-ME-Proxy: <xmx:sH0kZ0fPpPWT-ZMfAxLmoGiEJHvS0eh430pWhKA5tKb98M7sCRzotQ>
    <xmx:sH0kZ5PPHY1qYd6c1_1iUjnQTJ0cl6EE16KaUf7P8wfTPdmLjVqmlg>
    <xmx:sH0kZ-kPmjSKwJbiG5nyq4rQA1UfTXHPU9ulFdJ5SBKWQExnooNYpg>
    <xmx:sH0kZ7utTfsVwCtwWjp_A8pra2-EkoBQjbUGOpgE0RhPKsLrU44XVQ>
    <xmx:sH0kZ3vHPSUXZMOXlCAjhtq15r6J38ifscptCou0h_BaMU1BRYJYHLol>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Nov 2024 03:05:19 -0400 (EDT)
Date: Fri, 1 Nov 2024 00:04:09 -0700
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
Subject: Re: [RFC v2 11/13] rust: sync: Add memory barriers
Message-ID: <ZyR9aTAhtCdpdC-h@boqun-archlinux>
References: <20241101060237.1185533-1-boqun.feng@gmail.com>
 <20241101060237.1185533-12-boqun.feng@gmail.com>
 <CABVgOSn1eeZo7HggJYNEzzuGGpKABF=NbyMZLQbNjRwCAKXY-w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABVgOSn1eeZo7HggJYNEzzuGGpKABF=NbyMZLQbNjRwCAKXY-w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_000522_910238_B1A2AE58 
X-CRM114-Status: GOOD (  23.89  )
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

On Fri, Nov 01, 2024 at 02:55:23PM +0800, David Gow wrote:
> On Fri, 1 Nov 2024 at 14:07, Boqun Feng <boqun.feng@gmail.com> wrote:
> >
> > Memory barriers are building blocks for concurrent code, hence provide
> > a minimal set of them.
> >
> > The compiler barrier, barrier(), is implemented in inline asm instead of
> > using core::sync::atomic::compiler_fence() because memory models are
> > different: kernel's atomics are implemented in inline asm therefore the
> > compiler barrier should be implemented in inline asm as well.
> >
> > Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> > ---
> >  rust/helpers/helpers.c      |  1 +
> >  rust/kernel/sync.rs         |  1 +
> >  rust/kernel/sync/barrier.rs | 67 +++++++++++++++++++++++++++++++++++++
> >  3 files changed, 69 insertions(+)
> >  create mode 100644 rust/kernel/sync/barrier.rs
> >
> > diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> > index ab5a3f1be241..f4a94833b29d 100644
> > --- a/rust/helpers/helpers.c
> > +++ b/rust/helpers/helpers.c
> > @@ -8,6 +8,7 @@
> >   */
> >
> >  #include "atomic.c"
> > +#include "barrier.c"
> 
> It looks like "barrier.c" is missing, so this isn't compiling for me.
> I assume it was meant to be added in this patch...?
> 

Yes, I just send an updated one.

Glad being "checking missing files" buddies with you ;-) Thanks!

Regards,
Boqun

> Thanks,
> -- David



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
