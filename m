Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 758AECFD347
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Nov 2025 18:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BjR++aVUKPalz5bLAbnyNZLPcH0PWq9qX7/LgkQjqcU=; b=Bbl/mjribTyHHu
	Jpnv94YvoBFUqe1OJARzJyiH60e2Tt4xVbThxUpO1Sb9Fl0n/xkBIhy1hSFn5mzAqHIhaGU0u53JA
	z+EPmbtRVP6ckBzG3SdyxTtsP3LqYe+L/JFAlu0+W9wlz2jVzwk3Uns5Wv+yGXWaKRlzu0DpZxOjR
	TF2kayrBY4Bp1llxHEgVYqWdbt8wDWxcjBv2uxOcX4QIo7zL1gRXkYZhEpaBW2Gf463cF5Pev9Zz8
	ieSriTjAIPEM1ISrKFOMFea4J6dOq2TuoSUDVXVOcXP+i4+nv/EzY5Mn6XjjfS7hwa1ot8T/R8cS3
	bL2RJsLIgkKAIvnRE8GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNbQc-0000000CBpQ-228E;
	Mon, 24 Nov 2025 18:36:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNbQa-0000000CBpK-3k1s
	for linux-riscv@lists.infradead.org;
	Mon, 24 Nov 2025 18:36:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E359E60018;
	Mon, 24 Nov 2025 18:36:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A174C4CEF1;
	Mon, 24 Nov 2025 18:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764009403;
	bh=jMxics1T7D2zTTTxC0vYNoJLPcTUUbdGJ0mccHHyjHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y1fSJT7HmKhn2wr95Fzte+w0fDStdZ19Koc4ocZ9w9Lv1ZKt3nVWLGlA26AZcYIBd
	 XKfwmqWPffprf14DmbfY6Hm5j/1/ejPGlDlwNuFIRw1N0GPXXidPvbRI1kZRjDkUst
	 lxlN7EigtVgqc+fIfhuxCNIlYXK4ef8i04srNtF1wifrLNEVNM+NR7SpOAcbdGrg7v
	 hihOY/jKZ7DoINdso0BUTLv4L5A9BvRRkePHheh15RSGNoF7D2cJfXEluSf/P5lGfT
	 f4QtlDZ7HjBA/60fv0OV4KvirM84SvnkcqHiqUqHjnG8bEuDjFwXa/TWHaZHPowV6h
	 Vynb3itZkcYog==
Date: Mon, 24 Nov 2025 11:36:34 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Asuna Yang <spriteovo@gmail.com>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Han Gao <rabenda.cn@gmail.com>,
	Jason Montleon <jmontleo@redhat.com>,
	Conor Dooley <conor@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 3/4] rust: add a Kconfig function to test for support
 of bindgen options
Message-ID: <20251124183634.GA1084995@ax162>
References: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com>
 <20251124-gcc-rust-v4-v4-3-4e06e07421ae@gmail.com>
 <CANiq72k=XXRR6pw0Uhk89dmRHFYan6WzJhnDTC0T5oMYAaNnZw@mail.gmail.com>
 <ef617970-5539-400a-8717-dd96e82bf271@gmail.com>
 <CANiq72nDpBodFh5Zqy2p9jwWyfAiY6KcEEyugHeMDEmOR6Rogw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANiq72nDpBodFh5Zqy2p9jwWyfAiY6KcEEyugHeMDEmOR6Rogw@mail.gmail.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBOb3YgMjQsIDIwMjUgYXQgMDQ6MDg6MzZBTSArMDEwMCwgTWlndWVsIE9qZWRhIHdy
b3RlOgo+IE9uIE1vbiwgTm92IDI0LCAyMDI1IGF0IDM6NDLigK9BTSBBc3VuYSBZYW5nIDxzcHJp
dGVvdm9AZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBJIHdpbGwgc2VwYXJhdGUgdGhlbSBpbnRv
IHR3byBmdW5jdGlvbnMgaW4gdGhlIG5leHQgcmV2aXNpb24sCj4gPiBgYmluZGdlbi1vcHRpb25g
IGFuZCBgYmluZGdlbi1iYWNrZW5kLW9wdGlvbmAgKG9yIGBiaW5kZ2VuLWNjLW9wdGlvbmA/Cj4g
PiBXaGljaCBvbmUgZG8geW91IHByZWZlcj8pLgo+IAo+IElmIHdlIGRvbid0IG5lZWQgYGJpbmRn
ZW4tb3B0aW9uYCAodGhlIG5vcm1hbCBvbmUgSSBtZWFuKSBzbyBmYXIsCj4gcGVyaGFwcyB3ZSBz
aG91bGQgc2tpcCBpdC4gT24gdGhlIG90aGVyIGhhbmQsIGBydXN0Yy1vcHRpb24teW5gIGlzCj4g
dGhlcmUgYW5kIGlzIG5vdCB1c2VkIGVpdGhlciAoaXQgd2FzIGFkZGVkIGZvciBjb25zaXN0ZW5j
eSkuIFVwIHRvIHRoZQo+IEtidWlsZCB0ZWFtLCBJIGd1ZXNzLgoKSSBkbyBub3QgaGF2ZSBhIHN0
cm9uZyBwcmVmZXJlbmNlIG9uZSB3YXkgb3IgdGhlIG90aGVyLiBUaGVzZSBtYWNyb3MKdGVuZCB0
byBiZSBsb3cgbWFpbnRlbmFuY2UgYW5kIGRvIG5vdCB0YWtlIHVwIG11Y2ggc3BhY2UgcmVnYXJk
bGVzcyBzbwpwcmVlbXB0aXZlbHkgYWRkaW5nIGl0IHNvIHRoYXQgaXQgaXMgcmVhZHkgZm9yIHVz
ZSBpbiB0aGUgZnV0dXJlIGlzIG5vCmJpZyBkZWFsIGluIG15IG9waW5pb24uCgo+IEFzIGZvciB0
aGUgbmFtZSwgbm8gc3Ryb25nIHByZWZlcmVuY2UuIGBiaW5kZ2VuLWJhY2tlbmQtb3B0aW9uYCBz
b3VuZHMKPiBnb29kLCBidXQgYGJpbmRnZW4tY2Mtb3B0aW9uYCBpcyBtb3JlIGNvbnNpc3RlbnQg
d2l0aCBgY2Mtb3B0aW9uYCBhbmQKPiBwcm9iYWJseSBlYXNpZXIgdG8gdW5kZXJzdGFuZCBmb3Ig
cGVvcGxlIG5ldyB0byBgYmluZGdlbmAsIGFuZCBhbnl3YXkKPiB0aGUgZmxhZ3Mgd2UgcGFzcyB0
aGVyZSB3b3VsZG4ndCBtYWtlIHNlbnNlIGlmIHRoZSBiYWNrZW5kIGlzIG5vdCBhIEMKPiBjb21w
aWxlci4KClllYWgsIEkgdGhpbmsgZWl0aGVyIG9uZSBzb3J0IG9mIHJlcXVpcmVzIGtub3dsZWRn
ZSBvZiBiaW5kZ2VuIHRvIGtub3cKdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiBhIGZsYWcgdG8gYmlu
ZGdlbiBhbmQgYSBmbGFnIHRvIHRoZSBDIGNvbXBpbGVyCmJlaGluZCBiaW5kZ2VuIHNvIG5vIHN0
cm9uZyBwcmVmZXJlbmNlIGZyb20gbXkgc2lkZSAoTmljb2xhcyBtYXkgZmVlbApkaWZmZXJlbnRs
eSkuCgpDaGVlcnMsCk5hdGhhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
