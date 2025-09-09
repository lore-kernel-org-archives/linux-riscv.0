Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB8C2CAC582
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 17:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ijVVhdgszNe8SafBLzzpHs1OdczEaV7EoyBjW1w2jLo=; b=Os7s/42f7lBTVg
	dDG8diWy1xhXDmdd+MBClK2ol+xo5iX/s6p8+LbL4ZLGoRamEqNIcGC3O3FnueUTQYL9uoDjh2OJm
	4JQNIx6Bs+fIo/Pg3vlFw30dzn/WB8mVAANLgYqvphN5/6xBxPnuY9WslsMxA6W1oK4lYp9UkDPPw
	1iIyyN2GO3n4ABYtLXjZBgIwySHwRYR/RmlnMq+71bGIoXewM6Vnl8EL2oDCprnxtMu3doj4/MkQM
	IAjZTi5SZcC9mFy7GLFNj7Bi5izGe48O+1bqyzkMb9k7d0WftnNla/xS+MlHaCa8Qm56BDzyQZupJ
	OFl88m3uvV0JziUUXTFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw27b-0000000975I-14iN;
	Tue, 09 Sep 2025 17:27:11 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1tE-00000008lxm-2NWy
	for linux-riscv@lists.infradead.org;
	Tue, 09 Sep 2025 17:12:21 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b4741e1cde5so643816a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 09 Sep 2025 10:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757437939; x=1758042739; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pZl9KmUTOudQy15/vr3pLhP7rnPAj40pW4802s5NWJg=;
        b=ivkZ7hbn8hwCBoeJ2gyHafZwrmWaOvkQ1ozRwjQJz/ss8Q59o+UZfM5XYY5S4MJSla
         o2NdbE1MHplwHberOephisYwQlXz2WCsJ+yMH84t4d8gJ6AmfScXvwcoFC/+nkRDHX3w
         IOgG9woCZPPas+ztQPRnG/GdLcn3DVmfYzkG3wZheG+jgjQG1UG5XkNsb1hetSomu18a
         2f5c3ImpaCLHOnfEpIQJpKQRcGbvx4t1P5xpqyoQ1sp2I9Mso8+ciaBqDrGp5aH5bXc8
         wbW7awWV0P34WeKCRUVf01bkpAKQpSFc5OvgeImjDirSZsLy2b4i0tw4WTqSlpbd23h1
         x+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757437939; x=1758042739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pZl9KmUTOudQy15/vr3pLhP7rnPAj40pW4802s5NWJg=;
        b=V8srvcM/o9mn+8pIMyd2R9p+Ds06Qj1Vj2sq5Z3ZmnYSDwgCH1RYY2DEMI7JAw5NLd
         BsSubHaqTnJQYTbnITwmAIj3T5YmwvCxc0iSCC3tq9l8Zt18T3mGa7oDjtC9/OZold+Q
         GgsxC4GTmau9cgUKjc1gV6gek4SnAqMNdbNflzMaSW3xv8Nnjzmnjy7ULYuXSIHcU3ek
         VPLN5CtgssuyenA2Qfah3pfkCmh9StkwrjKgypGBO54XdP5GW17srJ8Y7Crcgj6+5LvR
         c0zsjXVi1+QkmKocRtVESE2bAu0V04S+N7EVlbGuNMFu3I11jhtR0R6NzvcuFW2G9DdD
         NuMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbfHuOpH9U96YLa9dWClh6BlV67xd0DePHqzas5PoFpQhVVuzbDVlqUqCPO+NgULE3HorHoBPXgHpHog==@lists.infradead.org
X-Gm-Message-State: AOJu0YwIKaI5sPua5zVfhBYsjnAsBv00abOaSVwITe+32lUJq9RNsBLO
	XAh9Gh0K+twD/Pvzar9K5+nEpN2+p3Q1AVwKTjropnwHbLXjej+I1PIaM2v9PhI/Rx1vuCShbgW
	SQlYK3WZoC6ssEi0HuUuY1UCHrjot1jU=
X-Gm-Gg: ASbGncsc+me3tUxAVS9GhBK5gz8djUyQIctmmdDjIGgTNUScQpUy7oEeF7SuzCbFIzC
	KZGwCjc8Cox+r9c0WHb8/+BDcOLarflhJzYe6I95G2kBL8VnwcIIvcXnnwUUwF2gZJus7xNVFdp
	mGRGeHQelsgjMuNu7JP/O4mfszinoBSmdQTCKpUUsjMsuGNVNcvUf49xOCbTvIjF3L1kSTTTBn2
	lo8wZMx5tg/LtBhAfk759HktUogme0pE8omoBdI3ZdzFTcXkCTCkq5ZRKPb8nGlfYxCHORNeJ9U
	409ZRcUnH8YB56H8tFw3e82m+A==
X-Google-Smtp-Source: AGHT+IHd4zHzKJHiSaDYt+fas3wn4v2M9LloxztcReggEbdZvs7nvGHlisZ6Va1BAVyt7RDoMvRIKgyRryjYrTxDWWk=
X-Received: by 2002:a17:903:1cc:b0:248:a01f:a549 with SMTP id
 d9443c01a7336-251771d5b61mr95742675ad.11.1757437939384; Tue, 09 Sep 2025
 10:12:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250909-gcc-rust-v2-v2-1-35e086b1b255@gmail.com>
In-Reply-To: <20250909-gcc-rust-v2-v2-1-35e086b1b255@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Sep 2025 19:12:06 +0200
X-Gm-Features: AS18NWAUC9KOXLRVuptzGWpY6jU98Yraxc-lyvHQvj-0Ea4KpP1HNw-UevG-aP8
Message-ID: <CANiq72kZAeVjPF_O+o9zy=1-wh+6nUiW26_ngqf8unNi4twMCA@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: re-enable gcc + rust builds
To: Asuna Yang <spriteovo@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Han Gao <rabenda.cn@gmail.com>, Conor Dooley <conor@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_101220_604894_0A1C84F4 
X-CRM114-Status: GOOD (  14.12  )
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

T24gVHVlLCBTZXAgOSwgMjAyNSBhdCA2OjU14oCvUE0gQXN1bmEgWWFuZyA8c3ByaXRlb3ZvQGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiBUaGUgc2VwYXJhdGlvbiBvZiBnZXQtcnVzdC1iaW5kZ2VuLWxp
YmNsYW5nIHNjcmlwdCBpcyByZXZlcnRlZCBiYXNlZCBvbiB0aGUKPiBjb25jZXJucyByYWlzZWQg
YnkgTWlndWVsLiBIb3dldmVyLCBpdCdzIHdvcnRoIG5vdGluZyB0aGF0IHdlIG5vdyBoYXZlIDMK
PiBkaWZmZXJlbnQgcGxhY2VzIHJ1c3QvTWFrZWZpbGUgc2NyaXB0cy97S2NvbmZpZy5pbmNsdWRl
LHJ1c3RfaXNfYXZpbGFibGUuc2h9Cj4gd2hlcmUgbWFudWFsbHkgY2FsbGluZyBiaW5kZ2VuIHJ1
c3RfaXNfYXZhaWxhYmxlX2JpbmRnZW5fbGliY2xhbmcuaCArIHNlZCB0byBnZXQKPiB0aGUgdmVy
c2lvbiBvZiBsaWJjbGFuZywgYW5kIGluIHBhcnRpY3VsYXIsIGZvciBvdXIgbmV3bHkgYWRkZWQg
S2NvbmZpZyBzeW1ib2wsCj4gd2Ugbm93IHVzZSBhd2sgdG8gY2Fub25pY2FsaXplIHRoZSB2ZXJz
aW9uIHRvIGFuIGludGVnZXIuIEkgd291bGQgc3RpbGwgbGlrZSB0bwo+IGRvIHRoZSBzY3JpcHQg
c2VwYXJhdGlvbiBsYXRlciBmb3IgYmV0dGVyIG1haW50YWluYWJpbGl0eSBhbmQgcmVhZGFiaWxp
dHkgaWYKPiBwb3NzaWJsZSwgd2hpY2ggY2FuIGJlIGRpc2N1c3NlZCBmdXJ0aGVyIGxhdGVyIHdo
ZW4gTWlndWVsIGhhcyB0aW1lLgoKVG8gY2xhcmlmeSwgc2luY2UgdGhpcyBwcm9iYWJseSB0YXJn
ZXRzIHRoZSBuZXh0IGN5Y2xlLCB0aGVyZSBpcyB0aW1lCnRvIGRpc2N1c3MgYW5kIGdldCBmZWVk
YmFjayB0byBkbyB3aGF0ZXZlciB3ZSBmZWVsIGl0IGlzIGJlc3QKKHBlcnNvbmFsbHksIEkgY2Fu
IHRha2UgYSBsb29rIGFmdGVyIEthbmdyZWpvcyBhdCBzb21lIHBvaW50KS4gSXMKdGhlcmUgYSBw
YXJ0aWN1bGFyIHJ1c2ggZm9yIHRoaXM/CgpIYXZpbmcgc2FpZCB0aGF0LCB0aGlzIHYyIGxvb2tz
IHN1YnN0YW50aWFsbHkgc2ltcGxlciB0aGFuIHYxLCB3aGljaAppcyBuaWNlLCBhbmQgcGVyaGFw
cyBSSVNDLVYgd2FudHMgdG8gbGFuZCBpdCBhbHJlYWR5LiBVcCB0byB0aGVtIGluCnRoYXQgY2Fz
ZS4KCihJIHNlZSB0aGUgYGlmZXEgKCQoQklOREdFTl9UQVJHRVQpLClgIGlzIHN0aWxsIHRoZXJl
IC0tIGluIGdlbmVyYWwgSQp3b3VsZCBzdWdnZXN0IHNwbGl0dGluZyB0aGluZ3MgaWYgdGhleSBk
b24ndCBkZXBlbmQgb24gZWFjaCBvdGhlciwgYnV0Cml0IGlzIG5vdCBhIGh1Z2UgZGVhbC4gSSB3
b3VsZCBhbHNvIHByb2JhYmx5IGhhdmUgc3BsaXQgdGhlCmBydXN0Yy1iaW5kZ2VuLWxpYmNsYW5n
LXZlcnNpb25gIGludG8gaXRzIG93biwgYnV0IGF0IGxlYXN0IHRoYXQgaXMgYQpkZXBlbmRlbmN5
KS4KClRoYW5rcyEKCkNoZWVycywKTWlndWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
