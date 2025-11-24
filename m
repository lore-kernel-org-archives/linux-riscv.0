Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00EDBCFD313
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Nov 2025 01:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jIPmDtiFr/wW+rP6I7zm77q4GLIl19ls/aIBOpynMjo=; b=E0pArT4EY34zjL
	8M2Up6u062DevZxQgTP3Gj4e3xji04fJn3sYhwyBGLBmwghEX82g/iuxymraDUln4nLrlZPiv03LC
	EnnrzWgvboIE9ehBfY2/joBtxsCjKbwdbPVHpHFh6R00yMI5WvmQZ4VUvjP0893pnFNlzdVgDVF9O
	ufsTKulJ/E4F4wr5MKll28C3a6nx3dj5dEaMZnb0w3STrRjGypf/TQOV426gvsjsTveQXE380b2YU
	3fcDNgCOKpiMhVRzKa+w3ndRFw6GtMALWFYun6jOuuA34V2Pf6xlyJnoxupQki0l2R4nWeapDC6BL
	uwRDuTC0jwxvxvX8aUwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNLGf-0000000AupH-0Z2x;
	Mon, 24 Nov 2025 01:21:25 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNLGc-0000000Auom-0Lvm
	for linux-riscv@lists.infradead.org;
	Mon, 24 Nov 2025 01:21:23 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7b90db89b09so371689b3a.0
        for <linux-riscv@lists.infradead.org>; Sun, 23 Nov 2025 17:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763947281; x=1764552081; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=biyAaHpZ7UlWRRCyz7ZvvoeGUjsmQlOPvO+v8XJx/bc=;
        b=kRvLoCQTkqwbtM4ekiCB+mIdg9xTmNP+BZhMmWKiPKdQz8aSkd3r8WPMTatdWYvjnK
         YsOJ+LaDUqdfcuApmr91ddvE8ja4oBkHVjXkQuZgjgySwTEaj3yIVylSEiJtBNOdJ1DD
         Nu7CjD4OMPnEWSgNQCyji7y3El9j+BysWETw0xkjpiNUj5kPYraiF9tmF2Yl2s7I83wG
         ohvWZWLpXe7QsectWl6rhy1dAADR86eVFqQFAcifoazDKYZMxpnmF/1mXldV9meG8ciK
         xbYdrThpkFV3fA05y83S+3ApSvW5Gb5tVUdv0DAGyY4qsEww78lYNWysBQptPA/ubOXr
         XVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763947281; x=1764552081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=biyAaHpZ7UlWRRCyz7ZvvoeGUjsmQlOPvO+v8XJx/bc=;
        b=bxattCHsdMbs/XaYD+JnZDWZbUqnx8CIID0UOWu9wnECJa42lWwhojYHqJW4GVzjug
         x3Jnr03As9T9FRZ/3UjOEzWGrWRrHghG24MiVUrIbQnh2p2uSac8BL/NflL917dRVrvm
         MSO/aIb4K3IJ9eWZ4AOfPh0V7xo/KIm681guJnSy+SQ4ZtfGmThEZeE+/nJ5GgwBHpN1
         HHF68YW0F0QH354/QZcnZDDxgN1rW1FH/gGxcxlUPcs2A/RCgyK9dOGIWRjA4VHfeWni
         iGX8E2jYoX0wegMs7k2MMWb8mVfyIA8P639SQWsvwxn1uVR+6f+TUHNbWD7wdpsn9byG
         t35g==
X-Forwarded-Encrypted: i=1; AJvYcCWFRrH0dqw9+SRuUF5UjBvuC9eLGBTeBOaZJxemZUE09Xsei5KGAQ2LyKzNfV2q5KzzN9wOzAwAnMv3QQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxE5sou6KyMKLmybN1qJzsiZ+rg96CEnjEHrI4QIvrt/1d1SyhT
	dL1elALTSQem4bW+oYyZIsRazN6tJK6DiKsSYwR1kM5/0IZWQXldLko5KL9rcrZXTs9N8SMtXNl
	+42aB/buQV15cKPael1Y+1Bh0kA85nxY=
X-Gm-Gg: ASbGncsfTNh5vsHO9SCb21p8q51Tt9vSvZTj1n47mmodZDw3mBzZQ/+VRaNR3SCuXa2
	mlbCj9C+D+oEFL6HbJYWrUZ9BxeQzq8Tkv6loF6/vHO4KYlJTXCVmqcjDlGHcNN80J9Go5X1a68
	rUAEeDJ/DBKt99FvkUJdeD7iL2Tk9EiINnTNFlt5lL81YTFmq+dzoGzIY+0lBpriU+pUaNlyiKl
	7K+q2gYDa1eXOIe87d1X2Z2qYlo5vCgaCRKsW1f4xnS4UP/Yu3Dv+yM6Vggn+knB3VB99UkVwCm
	2yk0zrj5T1SF4FbmhOlKbi08CT9Qee5bs76CgSKctZ1SEEkCtwq1iLfNWqPy//lY6ob7h9D/vE4
	7i63ZEiyIGOE4qQ==
X-Google-Smtp-Source: AGHT+IF7uCgR8D7JuSAXIkPZpUGPSLX7RZ4rQ8XZiWkfQ1rTA8eM7wEtMX1LZxU2dGsl6gS27smUFSiUHNUF0PYkbLY=
X-Received: by 2002:a05:7300:ac82:b0:2a4:3593:2c0a with SMTP id
 5a478bee46e88-2a724c02369mr5716030eec.3.1763947281135; Sun, 23 Nov 2025
 17:21:21 -0800 (PST)
MIME-Version: 1.0
References: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com> <20251124-gcc-rust-v4-v4-4-4e06e07421ae@gmail.com>
In-Reply-To: <20251124-gcc-rust-v4-v4-4-4e06e07421ae@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Nov 2025 02:21:08 +0100
X-Gm-Features: AWmQ_bnEyQjjwkSgNtuZsnn9EWb0bwxCuBV5MLpaTWl4ay19-nMkjpn6O6IgwyE
Message-ID: <CANiq72nqzPiiefC6Q9C0_rzoS8saL_EJ5qiTpMhZtG8pAsmmUw@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] RISC-V: fix gcc + rust builds
To: Asuna Yang <spriteovo@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Vivian Wang <wangruikang@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, 
	Jason Montleon <jmontleo@redhat.com>, Conor Dooley <conor@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_172122_147841_D28FF3AD 
X-CRM114-Status: GOOD (  13.12  )
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

T24gTW9uLCBOb3YgMjQsIDIwMjUgYXQgMToyM+KAr0FNIEFzdW5hIFlhbmcgPHNwcml0ZW92b0Bn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gQ29tbWl0IDMzNTQ5ZmNmMzdlYyAoIlJJU0MtVjogZGlzYWxs
b3cgZ2NjICsgcnVzdCBidWlsZHMiKSBkaXNhYmxlZCBHQ0MKPiArIFJ1c3QgYnVpbGRzIGZvciBS
SVNDLVYgZHVlIHRvIGRpZmZlcmVuY2VzIGluIGV4dGVuc2lvbiBoYW5kbGluZwo+IGNvbXBhcmVk
IHRvIExMVk0uCgpUaGlzIHNob3VsZCBtZW50aW9uIHdoYXQgd2UgYXJlIGRvaW5nLCBpLmUuIHJl
LWVuYWJsaW5nIHRoZSBHQ0MgKyBSdXN0CnN1cHBvcnQgYWdhaW4uCgpBbHNvLCBJIHdvdWxkIHJl
Y29tbWVuZCBhdm9pZGluZyB0byBzYXkgImZpeCIgaW4gdGhlIHRpdGxlLCB1bmxlc3MgaXQKaXMg
YWN0dWFsbHkgYSBmaXgsIGJ1dCBwZXJoYXBzIHRoZSBSSVNDLVYgbWFpbnRhaW5lcnMgY29uc2lk
ZXIgaXQgYQpmaXguCgo+IEFkZCBgcnVzdC1iaW5kZ2VuLW9wdGlvbmAgY29uZGl0aW9ucyBmb3Ig
dGhlIGF2YWlsYWJpbGl0eSBvZiBsaWJjbGFuZyB0bwo+IHRoZSBSSVNDLVYgZXh0ZW5zaW9uIEtj
b25maWcgc3ltYm9scyB0aGF0IGRlcGVuZCBvbiB0aGUgYGNjLW9wdGlvbmAKPiBmdW5jdGlvbi4K
ClRoaXMgaXMgbm93IGluIGEgZGlmZmVyZW50IGNvbW1pdCwgcmlnaHQ/Cgo+IFVwZGF0ZSB0aGUg
ZG9jdW1lbnRhdGlvbiwgR0NDICsgUnVzdCBidWlsZHMgZm9yIFJJU0MtViBhcmUgbm93Cj4gc3Vw
cG9ydGVkLgoKImFyZSBub3cgbWFpbnRhaW5lZCIgbWF5IGJlIGJldHRlciB0byBhdm9pZCBjb25m
dXNpbmcgaXQgd2l0aCB0aGUKIkxldmVsIG9mIFN1cHBvcnQiIGluIHRoZSB0YWJsZS4KCj4gRG9j
dW1lbnRhdGlvbi9ydXN0L2FyY2gtc3VwcG9ydC5yc3QgfCAgMiArLQo+IHJ1c3QvTWFrZWZpbGUg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDMgKystCj4gc2NyaXB0cy9NYWtlZmlsZS5ydXN0ICAg
ICAgICAgICAgICAgfCAgMSArCgpJbiBhbnkgY2FzZSwgZm9yIHRoZSBSdXN0IGJpdHMsIHRoaXMg
c2VlbXMgT0sgKEkgZGlkbid0IHRlc3QgaXQsIHRob3VnaCksIHNvOgoKQWNrZWQtYnk6IE1pZ3Vl
bCBPamVkYSA8b2plZGFAa2VybmVsLm9yZz4KCihCeSB0aGUgd2F5LCBJIHdvdWxkbid0IG1pbmQg
aWYgd2Ugc3RhcnRlZCBhZGRpbmcgYE1BSU5UQUlORVJTYAplbnRyaWVzIG9uIHdobyBpcyBtYWlu
dGFpbmluZyBwYXJ0aWN1bGFyIGFyY2hpdGVjdHVyZXMgZm9yIFJ1c3QsCmVzcGVjaWFsbHkgaWYg
dGhlcmUgaXMgc29tZW9uZSBpbiBwYXJ0aWN1bGFyIGludm9sdmVkIHdpdGggaXQgZXRjLikuCgpU
aGFua3MhCgpDaGVlcnMsCk1pZ3VlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
