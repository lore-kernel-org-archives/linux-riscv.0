Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29367CCA471
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Oct 2025 22:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f4Uz2UtzEGcmNfZ2iN7/KyVCb1ZuEz4PzuFBWRqK/Sc=; b=K4ewMWB+x6mc6scVsc/Ci3tTn5
	4EVyG2m/G2J3pLrloF0l6235VyaRDyj/hBwFLmz7oR8Q3Euqgg3l8d6NlXHnAHMqCqdPmjLewR0kT
	OGLYZdyniy0swqP8bLS87YSz30+sTX1DWAe7CJBxNy23TZMMV07TKMNS/I/Cf+YP9VbpnTT1yB2u6
	krrRHXV5X5wxt1Xr1H6Ney+OEQY0kFC3T8a4Kxmg0EcuiyR68Vtct3tPHCk3bUWB+i7Xt8Wbrs6me
	ojel0ZnQWjBiYZnSpgslBo61dnDxLg2Qzw5URvd6bsTypkdMs1iOaZcUHCPbb+dMAYTvyM+/H0lHA
	3zMHfqjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4oiS-0000000DFUv-1HIs;
	Fri, 03 Oct 2025 22:57:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4oiP-0000000DFUH-1hbd
	for linux-riscv@lists.infradead.org;
	Fri, 03 Oct 2025 22:57:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A30843242;
	Fri,  3 Oct 2025 22:57:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3E65C4CEF5;
	Fri,  3 Oct 2025 22:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759532248;
	bh=QlnUffNjLbcmqEw64x2x55MGPaaNVTMhAgdaSwOtFU0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kuZrqr3VFx4YNSicaWCcRbCoY4HQnuUCtSr5ZdtRryFOCgSRlD1pM9GIlqBBr3FC3
	 e8AK5mzhO6yQnWpl2MztppA8v2dJJVTTsT8gH52beE+NpPn2lvaabZrPYv2Av689kc
	 rXyAxReuEnl+IB9s+mi5dDyg5TvQ4ZbEH5s2Od6+Q/FaI/h9zgG2y66xva3MV8Ezoy
	 xfwIWuT7GVmV93a7fc2ZvHYu6zq/aLZT/CRf0KbpFmSV9P3RO6fTs9MkQ6t+2bUWVE
	 lKci0+LSh75RjoffLWeJXPaiK9yo3Vgk+jrvNIVqTy+wPCuwH/yKp9DgopUJRBiuSD
	 KQVza0Yw4zRyg==
Date: Fri, 3 Oct 2025 16:57:22 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Conor Dooley <conor@kernel.org>
cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
    linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
    stable@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
    Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
    Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
    =?ISO-8859-15?Q?Bj=F6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
    Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
    Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
    Danilo Krummrich <dakr@kernel.org>, Kees Cook <kees@kernel.org>, 
    Sami Tolvanen <samitolvanen@google.com>, 
    Matthew Maurer <mmaurer@google.com>, 
    "Peter Zijlstra (Intel)" <peterz@infradead.org>, 
    linux-riscv@lists.infradead.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v1] rust: cfi: only 64-bit arm and x86 support
 CFI_CLANG
In-Reply-To: <20251003-viewing-residency-d4f849c6fbe6@spud>
Message-ID: <71b9ca7a-3847-72d9-b9d1-c748f301450f@kernel.org>
References: <20250908-distill-lint-1ae78bcf777c@spud> <CANiq72mw36RzCtNVax650fJ=+cYjuGNF722_Mn2Oy1FAvxWc8Q@mail.gmail.com> <20251003-viewing-residency-d4f849c6fbe6@spud>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-567175886-1759532248=:870847"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_155729_463063_CE026425 
X-CRM114-Status: GOOD (  10.46  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-567175886-1759532248=:870847
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 3 Oct 2025, Conor Dooley wrote:

> On Mon, Sep 08, 2025 at 04:36:09PM +0200, Miguel Ojeda wrote:
> > On Mon, Sep 8, 2025 at 3:13 PM Conor Dooley <conor@kernel.org> wrote:
> > >
> > > From: Conor Dooley <conor.dooley@microchip.com>
> > >
> > > The kernel uses the standard rustc targets for non-x86 targets, and out
> > > of those only 64-bit arm's target has kcfi support enabled. For x86, the
> > > custom 64-bit target enables kcfi.
> 
> Hopefully someone can take it! I was hoping it'd be 6.18 material, can
> someone grab it for fixes please?

Will pick it up for early v6.18-rc fixes, thanks.


- Paul
--8323329-567175886-1759532248=:870847
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-567175886-1759532248=:870847--

