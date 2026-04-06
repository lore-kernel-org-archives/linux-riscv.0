Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9AEEF4EC8
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Apr 2026 09:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LB5hTBmIy237B4lO0qrdH/gBplEAK9Rs0tXXumubPp0=; b=3DoY6NaDnuv+X6
	iGp89VYacW23NJFnZfKgtqeIzfoYjgWW1liFMPxdJgRJnVUQJT6xgnQx3v7NW//RPHyEqTXUzsni9
	c2cyo5eXWjMflMiOg1CLHCCCL/nuMjP7jna+af9m4i0kFwVfTj68M6fZAyjN0hmmNyfltjDhv7hIV
	JrLL47Tq6oUpYPxc8u7c1uSkXemfKbRxwlolN3QHYJtco8d1L+KKJGsgxB1528C0E0Osd1awbv+XX
	4XMVe5fK0v8cX0+/huHmXHrlc9liDQvIDisfTr3Mcg3Tl/YwGnOsOxGrL2hYE/58MkhG6UJDlxbDd
	yDJ2TvIUz3OQwuo3ctFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9frj-00000004w8i-3uY2;
	Mon, 06 Apr 2026 09:03:28 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9frf-00000004w7v-2D01
	for linux-riscv@lists.infradead.org;
	Mon, 06 Apr 2026 09:03:25 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-2cbc50e6a36so171491eec.3
        for <linux-riscv@lists.infradead.org>; Mon, 06 Apr 2026 02:03:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775466202; cv=none;
        d=google.com; s=arc-20240605;
        b=HIXjsp3N/HFvjd6YacK1cLmGLpzUdACWHl+DShH1DLm7VwCIYbDO/4kXpUZFqrDVHK
         BUWp7waPKVFgqvaVbI37LTw8X7iGBGiki95wK9AWzV94pserm+lhebIumM6kv0P3OSYV
         K1Rf8aZLo1hLxCpsrWUHLn050ZK7KK4NWGISh4o+v8esIEFZeiVa980OXeoRNdvE83PI
         fWGX2A3mCWa+jBPS/iPklEm5J0+5ZbRBhNgGuQlxlfy9XlgtJS7X7uYE736z01AHpOyv
         kgRoqno9LyXD6MXah3HbfY89gcjNL54Z4+YdYVwjzWNBagqSnxztCoBRQqgZxIl4ssfA
         HZ8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iVamUPJfkbP2PYNa14ddDsteyLquBt95MrPlozlxwT4=;
        fh=M4WUOdqC2cuX2aZZ+3Xo7hr3SfT4OZAW73vMQ3B+Lfs=;
        b=cscI2vGR8Qi1R73lGPGUPTMfL1Y0hwZ/BuZoMFuzKJtwIPTPPdkIq+AYcDEydFXL8u
         RpDntIVZR1WW1TgCu/fED0zCde3x41u/VelQF+y0piWVIAimEt9bBxQItPfSgwxgSq3e
         IPS8upqu26NaFl1wCD2gsaL3gyC/N1mVF4Yui0V3yN6hTz9VQhG7Xp4+xW4mM14DqlgC
         RrbEPc6CTeXSq0V4xkwm5RVf1tRMnBAH1APZayynnN/Pb8RFNKWkvPRN6cxDMHsa5XR9
         C5Ny+Z6dnDI9DwUGs7S2OGnrEW25uaOzdQhncWL/0oDyyAhQLL2WbcTBu0lFMNOuB8Fi
         x4HQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775466202; x=1776071002; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iVamUPJfkbP2PYNa14ddDsteyLquBt95MrPlozlxwT4=;
        b=WVb0YmubS5f73RkPSPTdZ8cMH8GO6C9mKR5Btst55eHjjdjXsR6RrDbUpph0F5/gXw
         4Rselm/e5/5KTFGVSRCR/5RMSWuB1NZyU+38xVP8gclRTE3Bx/wE0dW8NuV6fDlzmARk
         81ALQrWiToS4ad+FuOFbGwwxc97enZ6nvyjGGzYTYDFGkoyKyBU7cBIrvkQeN2KQu6IN
         13bNcxfYjtFphMnAP+oqm90OiDJoZHvxxntDoICjtpGg0/np3q5TXVa3Pf4WvF4c0Hhq
         QcQ606Zbu+nQVe3vc9JtxDpSXU3qukywMSnAulC1eIr9BA/kesPITyeIRT8BPWJney/5
         +W5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775466202; x=1776071002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iVamUPJfkbP2PYNa14ddDsteyLquBt95MrPlozlxwT4=;
        b=g7PxJROLl+Mh73Sg2Xhrhea1j01eOenU5c8L2B3J2Kz5CTK64J/N4/2b76uzOvmskL
         b/NKnND9KgRmVGZF6rl7taS+4/Sl+5RNkX8g2XL7U3jPi2V4JK1n1et4baW8Nhr3ORY5
         4yW/W0FAUBi4ALXnF0JQtpn6NbUW7LCAdIrTVm9qpsVMPGyB/PKHoNJPmUIiWJYrsz3e
         2XFtAC1K7KNsDWGcGIVSFCcpkxQ6nQkxTJrgYJwft5nF4UUuqbe4cl3ctwx9OHGBhz0F
         jX7i7p76XcDOeGFE23hYdgYHVxwM7xVzVwMtcA9zMk+Av4ogUhIuJoQotN2jeoLT3lEb
         hH/A==
X-Forwarded-Encrypted: i=1; AJvYcCVdqyL/L4cfgjVLSELgnteguRDtgb0vU2XBnbo7JoFc2g2FViz81SBJREUg3D9tZ3gww3abntkc5zJlew==@lists.infradead.org
X-Gm-Message-State: AOJu0YwKn+jX2YebcSn/YI1ZZ3d8fmLVy26XwjPfjFl0CYWHP2xGchE1
	UEHBdSeaTxYsqtoiBuI8JlUmZtN7NmO8yW/dpvl5lNIqABOqWRLLqSvoV7fXbd35Vt/S/omoII8
	HM3ObmXmESxfit0v6ZhwFlxqTNsXyiDY=
X-Gm-Gg: AeBDiesQkqgFsIeGSoG7P8iAuHRHjDULkhUV11ccamo6zRXSInez7Mrmn7GKwFAGnk1
	gfCntHN9pcr+ONwjqDYSLqJXOItwriOUJgOHxFW6jimB8MzM1pn5ISwKm7VYQZuxh1ShUcaapjh
	50J/D3ckwDXxL+NDdg92en+kPa8qociavEkdDOP/aesYu1AFmF5Re9/2eflowGj23yUji+bM0J2
	xiHaWmwekOvxCL9cKblAjw/7Lccbm5qI+QYbmR2Ri1frTliAwnjdZKv98EbguTnc4eZCCxIFoca
	hrUTGzKYs8CNYkizMnkdH6s35ChRfs83iHjWHq1QzLvHSPS6aiCwMMaxqU+X3HXnbmaLypeaBhR
	GsTvDjGHasDephL2mYKL2wDg=
X-Received: by 2002:a05:7300:2315:b0:2c4:76a3:bdfc with SMTP id
 5a478bee46e88-2cbf6897126mr2280931eec.0.1775466202269; Mon, 06 Apr 2026
 02:03:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260405235309.418950-1-ojeda@kernel.org>
In-Reply-To: <20260405235309.418950-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 11:03:08 +0200
X-Gm-Features: AQROBzDwpcCEtASRfptsJ0WJ2jdyaJlOCl6SPsL-e-w0TnWmNnUbHOjTvtft1Wo
Message-ID: <CANiq72mnGArtgAbe7xXZCYW1x7Zd5hozfnzoftaGy9rxoLO4ew@mail.gmail.com>
Subject: Re: [PATCH v2 00/33] rust: bump minimum Rust and `bindgen` versions
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_020323_663081_8CE86B18 
X-CRM114-Status: GOOD (  15.68  )
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

T24gTW9uLCBBcHIgNiwgMjAyNiBhdCAxOjUz4oCvQU0gTWlndWVsIE9qZWRhIDxvamVkYUBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IEFzIHByb3Bvc2VkIGluIHRoZSBwYXN0IGluIGUuZy4gTFBDIDIw
MjUgYW5kIHRoZSBNYWludGFpbmVycyBTdW1taXQgWzFdLAo+IHdlIGFyZSBnb2luZyB0byBmb2xs
b3cgRGViaWFuIFN0YWJsZSdzIFJ1c3QgdmVyc2lvbnMgYXMgb3VyIG1pbmltdW0KPiBzdXBwb3J0
ZWQgdmVyc2lvbi4KPgo+IERlYmlhbiBUcml4aWUgd2FzIHJlbGVhc2VkIHdpdGggYSBSdXN0IDEu
ODUuMCB0b29sY2hhaW4gWzJdLCB3aGljaCBpdAo+IHN0aWxsIHVzZXMgdG8gdGhpcyBkYXkgWzNd
IChpLmUuIG5vIHVwZGF0ZSB0byBSdXN0IDEuODUuMSkuCj4KPiBEZWJpYW4gVHJpeGllIHdhcyBy
ZWxlYXNlZCB3aXRoIGBiaW5kZ2VuYCAwLjcxLjEsIHdoaWNoIGl0IGFsc28gc3RpbGwKPiB1c2Vz
IHRvIHRoaXMgZGF5IFs0XS4KPgo+IERlYmlhbiBUcml4aWUncyByZWxlYXNlIGhhcHBlbmVkIG9u
IDIwMjUtMDgtMDkgWzVdLCB3aGljaCBtZWFucyB0aGF0IGEKPiBmYWlyIGFtb3VudCBvZiB0aW1l
IGhhcyBwYXNzZWQgc2luY2UgaXRzIHJlbGVhc2UgZm9yIGtlcm5lbCBkZXZlbG9wZXJzCj4gdG8g
dXBncmFkZS4KPgo+IFRodXMgYnVtcCB0aGUgbWluaW11bSB0byB0aGUgbmV3IHZlcnNpb25zLCBp
LmUuCj4KPiAgIC0gUnVzdDogMS43OC4wIC0+IDEuODUuMAo+ICAgLSBiaW5kZ2VuOiAwLjY1LjEg
LT4gMC43MS4xCj4KPiBUaGVyZSBhcmUgYSBmZXcgbWFpbiBwYXJ0cyB0byB0aGUgc2VyaWVzLCBp
biB0aGlzIG9yZGVyOgo+Cj4gICAtIEEgZmV3IGNsZWFudXBzIHRoYXQgY2FuIGJlIHBlcmZvcm1l
ZCBiZWZvcmUgdGhlIGJ1bXBzLgo+ICAgLSBUaGUgUnVzdCBidW1wIChhbmQgaXRzIGNsZWFudXBz
KS4KPiAgIC0gVGhlIGBiaW5kZ2VuYCBidW1wIChhbmQgaXRzIGNsZWFudXBzKS4KPiAgIC0gRG9j
dW1lbnRhdGlvbiB1cGRhdGVzLgo+ICAgLSBUaGUgYGNmaV9lbmNvZGluZ2AgcGF0Y2gsIGFkZGVk
IGhlcmUsIHdoaWNoIG5lZWRzIHRoZSBidW1wLgo+ICAgLSBUaGUgcGVyLXZlcnNpb24gZmxhZ3Mg
c3VwcG9ydCBhbmQgYSBDbGlwcHkgY2xlYW51cCBvbiB0b3AuCj4KPiBMaW5rOiBodHRwczovL2x3
bi5uZXQvQXJ0aWNsZXMvMTA1MDE3NC8gWzFdCj4gTGluazogaHR0cHM6Ly93d3cuZGViaWFuLm9y
Zy9yZWxlYXNlcy90cml4aWUvcmVsZWFzZS1ub3Rlcy93aGF0cy1uZXcuZW4uaHRtbCNkZXNrdG9w
cy1hbmQtd2VsbC1rbm93bi1wYWNrYWdlcyBbMl0KPiBMaW5rOiBodHRwczovL3BhY2thZ2VzLmRl
Ymlhbi5vcmcvdHJpeGllL3J1c3RjIFszXQo+IExpbms6IGh0dHBzOi8vcGFja2FnZXMuZGViaWFu
Lm9yZy90cml4aWUvYmluZGdlbiBbNF0KPiBMaW5rOiBodHRwczovL3d3dy5kZWJpYW4ub3JnL3Jl
bGVhc2VzL3RyaXhpZS8gWzVdCgpBcHBsaWVkIHNlcmllcyB0byBgcnVzdC1uZXh0YCAtLSB0aGFu
a3MgZXZlcnlvbmUhCgpMZXQncyBzZWUgaWYgd2UgZmluZCBhbnkgaXNzdWUgaW4gLW5leHQuCgoo
SWYgc29tZW9uZSB3YW50cyB0byBnaXZlIHRhZ3MgdG9kYXksIHRoZW4gSSBhbSBoYXBweSB0byBw
aWNrIHRoZW0gdXApCgpDaGVlcnMsCk1pZ3VlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
