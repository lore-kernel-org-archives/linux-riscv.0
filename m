Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428FFE77180
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 14:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j9kwhQjzgaBZQAgCNVbLDx2JNW8ibLD+LrriEh/GCBE=; b=LBwGcmfWN1itZC
	myyzZd7sOg4eogzeCpSiiLxd/5ZMC2XR+y40dkwkRDID/wNXA5hdgpC0Do60zSs9v2pbjCEUnkIAL
	hf4RkyrbYbDAafn0CseeRfrJOkTNqClmHGrwoVJ1ef6lwJ6KZBovq9eHnsFNr+/MNc4mFkpm7a8Nu
	kfY2ZfsQChWTl2wELM/c/Op7th58kgUH3CtIoo29UOite1yX0L/uq1x2wp7j0sZrt3cs1ZqA86+c1
	ua0N0MArMezIhZgS9NOrqHPbFpaUNjmJGnn66og2Li2M8blazY2dCyePUbtlpAQViYf9hHiUUz6Yt
	mhGT9L3TcrqUuW19XRhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM6nq-000000047b8-2oZl;
	Fri, 13 Dec 2024 14:38:02 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM6j1-000000045MY-2PQc
	for linux-riscv@lists.infradead.org;
	Fri, 13 Dec 2024 14:33:05 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3862b40a6e0so1017315f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 13 Dec 2024 06:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734100381; x=1734705181; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YS9LGudJur7kGbLspdnTQuWDC+hZFSTpArars9lBeLQ=;
        b=TAGjRkDmwySe9yo3jmezVIRHtcoRAUtdMS9fZli5V7piVj6F6VTtLEwQcBHumWMHAr
         +j1ek58Tk9fuAQniaYdBgDYroy4wRyEigHmVMnV9kLa52hOjMzIXHqN5QsZCakNcNnyp
         DNYwAF/gxXesZoOI8Rbbx4h3V8brCGiIsIo0h6mBWizPqpNzOa6MNU7elaQtc5xUQILa
         Mzhw6Cx2D1spcX/lmOwwN+roGFc5HqeZY0TBfq70I5L6wVaAxEgSciGZBIK6n+eex35w
         DXV7p04kDlRRbXzCUhXXFPKUPly82ThyI/PGPZ/B0jyoO5VYbntq0nmADHVKWus6taAa
         yi4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734100381; x=1734705181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YS9LGudJur7kGbLspdnTQuWDC+hZFSTpArars9lBeLQ=;
        b=PyJLoO4+4c/qI6q9wvJk6aa3vo9UmkWNllr6bXt5fCy8YtMw7b7dvIStqBquQQq+qO
         FbwVSJOxFjU/2q04khLIUcj6/MJyOSl8KBafrJW6WoPrtShER8psM1fqeJIiABeE72sP
         zdp6lO79Jyh3t3afuuA/FZLRXAvuUHZ+AWOWmT/H+n7AhGxZJFED3EWYcyeRkWrt8PuO
         pI4D2LCsKwSET1AZjy7nqlfkDz/gKM2Uho7T+LVMM6SDhF+7EnhC4Glbnku9UFzpP8kb
         +4bzEwsuCksNYfNCqqvelAB7LPePLyDxQbIm7STLnGLOlvPqpl3cKqa7+nIWZyQGRyWj
         r2lA==
X-Forwarded-Encrypted: i=1; AJvYcCXCq9K14ACb7kAEvzmr71l/CNrATGg1qYVkSr/5KThzhqygma31jZygUz/1jsjfaot+6637/ApzYbZ7UQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+SCa6AtwLvUF07Q71VfpuCD28UvkAWUtj4fCDMX6sSBSJKfaz
	0CgJCMo/R8XenX/xTaE2DzuPOMrBdlkUG8sziunLOFN3Mm6tQAd5DHnKAzwFdPGBTwXVN8gsAIs
	g2aDrKJaFFoLfE+oLPGkldkBuuGryHiQSpLzX
X-Gm-Gg: ASbGncs8uxvDZKw8GpS1oMhzwwVXms5zkaS9R3WaXSXDnOoeMGEotURekBnESxaRfS4
	GLdCQ6+UGY33r1B2N7CyCC3HmlLC9oDIJLiNTiwA=
X-Google-Smtp-Source: AGHT+IGvvc8SEIVkqPspUBW11+fwBIw/V0dhqL0RuVU+1lBeUhFdbOVUzhj6j5lBdtbpP2FKdq6ekBfVUhokO3//J1Y=
X-Received: by 2002:a05:6000:2ad:b0:385:ee59:44eb with SMTP id
 ffacd0b85a97d-3888e0bd28amr2583040f8f.33.1734100380695; Fri, 13 Dec 2024
 06:33:00 -0800 (PST)
MIME-Version: 1.0
References: <20241101060237.1185533-1-boqun.feng@gmail.com>
 <20241101060237.1185533-5-boqun.feng@gmail.com> <CAH5fLgjhQouU=kqVx7LET2yeWt6sKt-VO5PR5SnQ8doaG4ihuQ@mail.gmail.com>
 <Z1seogLmy5H8-hXn@boqun-archlinux>
In-Reply-To: <Z1seogLmy5H8-hXn@boqun-archlinux>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 13 Dec 2024 15:32:47 +0100
Message-ID: <CAH5fLgjGg8_s8imOkmPb0yLAMwD1sF1aoBZWkAy-YLNh41zCuw@mail.gmail.com>
Subject: Re: [RFC v2 04/13] rust: sync: atomic: Add generic atomics
To: Boqun Feng <boqun.feng@gmail.com>
Cc: rust-for-linux@vger.kernel.org, rcu@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	llvm@lists.linux.dev, lkmm@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alan Stern <stern@rowland.harvard.edu>, Andrea Parri <parri.andrea@gmail.com>, 
	Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Nicholas Piggin <npiggin@gmail.com>, David Howells <dhowells@redhat.com>, 
	Jade Alglave <j.alglave@ucl.ac.uk>, Luc Maranget <luc.maranget@inria.fr>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Akira Yokosawa <akiyks@gmail.com>, 
	Daniel Lustig <dlustig@nvidia.com>, Joel Fernandes <joel@joelfernandes.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, kent.overstreet@gmail.com, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, elver@google.com, 
	Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Catalin Marinas <catalin.marinas@arm.com>, torvalds@linux-foundation.org, 
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	Trevor Gross <tmgross@umich.edu>, dakr@redhat.com, 
	Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_063303_610484_03D7A0DA 
X-CRM114-Status: GOOD (  29.81  )
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

T24gVGh1LCBEZWMgMTIsIDIwMjQgYXQgNjozNOKAr1BNIEJvcXVuIEZlbmcgPGJvcXVuLmZlbmdA
Z21haWwuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgRGVjIDEyLCAyMDI0IGF0IDExOjU3OjA3QU0g
KzAxMDAsIEFsaWNlIFJ5aGwgd3JvdGU6Cj4gWy4uLl0KPiA+ID4gZGlmZiAtLWdpdCBhL3J1c3Qv
a2VybmVsL3N5bmMvYXRvbWljL2dlbmVyaWMucnMgYi9ydXN0L2tlcm5lbC9zeW5jL2F0b21pYy9n
ZW5lcmljLnJzCj4gPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiA+IGluZGV4IDAwMDAwMDAw
MDAwMC4uMjA0ZGEzOGUyNjkxCj4gPiA+IC0tLSAvZGV2L251bGwKPiA+ID4gKysrIGIvcnVzdC9r
ZXJuZWwvc3luYy9hdG9taWMvZ2VuZXJpYy5ycwo+ID4gPiBAQCAtMCwwICsxLDI1MyBAQAo+ID4g
PiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiA+ID4gKwo+ID4gPiArLy8h
IEdlbmVyaWMgYXRvbWljIHByaW1pdGl2ZXMuCj4gPiA+ICsKPiA+ID4gK3VzZSBzdXBlcjo6b3Bz
OjoqOwo+ID4gPiArdXNlIHN1cGVyOjpvcmRlcmluZzo6KjsKPiA+ID4gK3VzZSBjcmF0ZTo6dHlw
ZXM6Ok9wYXF1ZTsKPiA+ID4gKwo+ID4gPiArLy8vIEEgZ2VuZXJpYyBhdG9taWMgdmFyaWFibGUu
Cj4gPiA+ICsvLy8KPiA+ID4gKy8vLyBgVGAgbXVzdCBpbXBsIFtgQWxsb3dBdG9taWNgXSwgdGhh
dCBpcywgYW4gW2BBdG9taWNJbXBsYF0gaGFzIHRvIGJlIGNob3Nlbi4KPiA+ID4gKy8vLwo+ID4g
PiArLy8vICMgSW52YXJpYW50cwo+ID4gPiArLy8vCj4gPiA+ICsvLy8gRG9pbmcgYW4gYXRvbWlj
IG9wZXJhdGlvbiB3aGlsZSBob2xkaW5nIGEgcmVmZXJlbmNlIG9mIFtgU2VsZmBdIHdvbid0IGNh
dXNlIGEgZGF0YSByYWNlLCB0aGlzCj4gPiA+ICsvLy8gaXMgZ3VhcmFudGVlZCBieSB0aGUgc2Fm
ZXR5IHJlcXVpcmVtZW50IG9mIFtgU2VsZjo6ZnJvbV9wdHJgXSBhbmQgdGhlIGV4dHJhIHNhZmV0
eSByZXF1aXJlbWVudAo+ID4gPiArLy8vIG9mIHRoZSB1c2FnZSBvbiBwb2ludGVycyByZXR1cm5l
ZCBieSBbYFNlbGY6OmFzX3B0cmBdLgo+ID4gPiArI1tyZXByKHRyYW5zcGFyZW50KV0KPiA+ID4g
K3B1YiBzdHJ1Y3QgQXRvbWljPFQ6IEFsbG93QXRvbWljPihPcGFxdWU8VD4pOwo+ID4gPiArCj4g
PiA+ICsvLyBTQUZFVFk6IGBBdG9taWM8VD5gIGlzIHNhZmUgdG8gc2hhcmUgYW1vbmcgZXhlY3V0
aW9uIGNvbnRleHRzIGJlY2F1c2UgYWxsIGFjY2Vzc2VzIGFyZSBhdG9taWMuCj4gPiA+ICt1bnNh
ZmUgaW1wbDxUOiBBbGxvd0F0b21pYz4gU3luYyBmb3IgQXRvbWljPFQ+IHt9Cj4gPgo+ID4gU3Vy
ZWx5IGl0IHNob3VsZCBhbHNvIGJlIFNlbmQ/Cj4gPgo+Cj4gSXQncyBgU2VuZGAgaGVyZSBiZWNh
dXNlIGBPcGFxdWU8VD5gIGlzIGBTZW5kYCB3aGVuIGBUYCBpcyBgU2VuZGAuIEFuZAo+IGluIHBh
dGNoICM5LCBJIGNoYW5nZWQgdGhlIGRlZmluaXRpb24gb2YgYEFsbG93QXRvbWljYCwgd2hpY2gg
aXMgbm90IGEKPiBzdWJ0cmFpdCBvZiBgU2VuZGAgYW55bW9yZSwgYW5kIGFuIGBpbXBsIFNlbmRg
IGJsb2NrIHdhcyBhZGRlZCB0aGVyZS4KPgo+ID4gPiArLy8vIEF0b21pY3MgdGhhdCBzdXBwb3J0
IGJhc2ljIGF0b21pYyBvcGVyYXRpb25zLgo+ID4gPiArLy8vCj4gPiA+ICsvLy8gVE9ETzogVW5s
ZXNzIHRoZSBgaW1wbGAgaXMgYSBgI1tyZXByKHRyYW5zcGFyZXQpXWAgbmV3IHR5cGUgb2YgYW4g
ZXhpc3RpbmcgW2BBbGxvd0F0b21pY2BdLCB0aGUKPiA+ID4gKy8vLyBpbXBsIGJsb2NrIHNob3Vs
ZCBiZSBvbmx5IGRvbmUgaW4gYXRvbWljIG1vZC4gQW5kIGN1cnJlbnRseSBvbmx5IGJhc2ljIGlu
dGVnZXIgdHlwZXMgY2FuCj4gPiA+ICsvLy8gaW1wbGVtZW50IHRoaXMgdHJhaXQgaW4gYXRvbWlj
IG1vZC4KPiA+Cj4gPiBXaGF0J3MgdXAgd2l0aCB0aGlzIFRPRE8/IENhbid0IHlvdSBqdXN0IHdy
aXRlIGFuIGFwcHJvcHJpYXRlIHNhZmV0eQo+ID4gcmVxdWlyZW1lbnQ/Cj4gPgo+Cj4gQmVjYXVz
ZSB0aGUgbGltaXRlZCBzY29wZSBvZiB0eXBlcyB0aGF0IGFsbG93cyBhdG9taWMgaXMgYW4gYXJ0
aWZpY2lhbAo+IGNob2ljZSwgaS5lLiB3ZSB3YW50IHRvIHN0YXJ0IHdpdGggYSBsaW1pdGVkIG51
bWJlciBvZiB0eXBlcyBhbmQgbWFrZQo+IGZvcndhcmQgcHJvZ3Jlc3MsIGFuZCB0aGUgdHlwZXMg
dGhhdCB3ZSBkb24ndCB3YW50IHRvIHN1cHBvcnQgYXRvbWljcwo+IGZvciBub3cgYXJlIG5vdCBi
ZWNhdXNlIG9mIHNhZmV0eSByZWFzb25zLCBidXQgbW9yZSBvZiBhIGxhY2sgb2YKPiB1c2Vycy9t
b3RpdmF0aW9ucy4gU28gSSBkb24ndCB0aGluayB0aGlzIGlzIHNvbWV0aGluZyB3ZSBzaG91bGQg
dXNlCj4gc2FmZXR5IHJlcXVpcmVtZW50IHRvIGRlc2NyaWJlLgoKSSBmb3VuZCB0aGUgd29yZGlu
ZyB2ZXJ5IGNvbmZ1c2luZy4gQ291bGQgeW91IHJld29yZCBpdCB0byBzYXkKc29tZXRoaW5nIGFi
b3V0IGZ1dHVyZSBwb3NzaWJpbGl0aWVzPwoKPiA+ID4gKy8vLyAjIFNhZmV0eQo+ID4gPiArLy8v
Cj4gPiA+ICsvLy8gW2BTZWxmYF0gbXVzdCBoYXZlIHRoZSBzYW1lIHNpemUgYW5kIGFsaWdubWVu
dCBhcyBbYFNlbGY6OlJlcHJgXS4KPiA+ID4gK3B1YiB1bnNhZmUgdHJhaXQgQWxsb3dBdG9taWM6
IFNpemVkICsgU2VuZCArIENvcHkgewo+ID4gPiArICAgIC8vLyBUaGUgYmFja2luZyBhdG9taWMg
aW1wbGVtZW50YXRpb24gdHlwZS4KPiA+ID4gKyAgICB0eXBlIFJlcHI6IEF0b21pY0ltcGw7Cj4g
PiA+ICsKPiA+ID4gKyAgICAvLy8gQ29udmVydHMgaW50byBhIFtgU2VsZjo6UmVwcmBdLgo+ID4g
PiArICAgIGZuIGludG9fcmVwcihzZWxmKSAtPiBTZWxmOjpSZXByOwo+ID4gPiArCj4gPiA+ICsg
ICAgLy8vIENvbnZlcnRzIGZyb20gYSBbYFNlbGY6OlJlcHJgXS4KPiA+ID4gKyAgICBmbiBmcm9t
X3JlcHIocmVwcjogU2VsZjo6UmVwcikgLT4gU2VsZjsKPiA+Cj4gPiBXaGF0IGRvIHlvdSBuZWVk
IHRoZXNlIG1ldGhvZHMgZm9yPwo+ID4KPgo+IENvbnZlcnRpbmcgYSBgQXRvbWljSW1wbGAgdmFs
dWUgKGN1cnJlbnRseSBvbmx5IGBpMzJgIGFuZCBgaTY0YCkgdG8gYQo+IGBBbGxvd0F0b21pY2Ag
dmFsdWUgd2l0aG91dCB1c2luZyB0cmFuc211dGUgaW4gYGltcGxgIGJsb2NrIG9mCj4gYEF0b21p
YzxUPmAuIEFueSBiZXR0ZXIgaWRlYT8KCllvdSBjb3VsZCB1c2UgdHJhbnNtdXRlPwoKQWxpY2UK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
