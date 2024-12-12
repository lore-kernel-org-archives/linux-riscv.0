Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2936E7717F
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Dec 2024 10:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W2n9W8tN0WAgOD20aOmjKfnlYTYP7tGheONjGcCtXB8=; b=WiCAU8UC700YyB
	As9C5Z5NQqE7XEWNXASlBCreOR2EN5fcmk769xnM0cFa4NdMapMHFZYTlZzLJVoK6Nkodt6r+Sjvr
	hCjoAh+Jd1Vjb2x/UDnNoAVRcuNBX9JCe61HePPeWXqa5LLGnKE60xVBWvEzNTlBY6vajtt4FNAax
	+pmNvbB5zIQ4/Bx89Lht3ShqwLKOXSZ97sLwldFmwt8g79iA90KcMMVk7u8FXFQK2XPE09MUl/gcf
	VCK7nR2NeRMD2vyZmcXb5c0z5Pkr6x0xOFgsKAjScTy13prVAld+4eP06kQq2eJZRwC5Of0Ffx7xJ
	UHoj11ipc9tkPYLkZnNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLgnF-000000006Z8-1sh8;
	Thu, 12 Dec 2024 10:51:41 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLgnB-000000006Y4-3dRJ
	for linux-riscv@lists.infradead.org;
	Thu, 12 Dec 2024 10:51:39 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso2918735e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 12 Dec 2024 02:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734000695; x=1734605495; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtpsjC48mE/nmTjT+Q7/MwVuoD24o44fCuhvsg4pi50=;
        b=FG1nj4hp0YW40GiQFAohaKqBh63YxccJJmUokyQzJ915j4S9elk9McK3gXUggBNoOC
         lSbUPXa3Oa/QlM1CYPVAcJPoWlpPmgI14Thy8Kl1GfmTlmAHzepuvZnY+Vr9Wu7Wjv7W
         l0TQXt7EHtRBBZhdbTECzomgR+64xKjVsNbd4WCi8Orz7ru9ORoVlAULqePt6IBmLb8E
         omyRmozs5zj2rVLsSkZPOttwAu0qPtm1DtimZd4q2E7A3Vt/Anb56GXgr9GhpM9yyWqn
         EoGBEuogX4xIkOCabChhzaRSv5ib0BVflRoc0RHbBsta0sPB1GbWsaqAS5xvrm+67nbP
         j8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734000695; x=1734605495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rtpsjC48mE/nmTjT+Q7/MwVuoD24o44fCuhvsg4pi50=;
        b=IAJ7q7e39eviVB//iOfC0p64t7HvxzmrnKaDGX1cM0Db+XGKX+O1DCo0Cux1zbc/Tg
         AiPJQ5FiFWFh5OWf8lF7e5cY9deY3dXVI9Tgkg243zV9lH8CqmWlpdm6UnwtUm228g3y
         v0V9QR7m+mb4x5FjckJJKFtgVrHYINxIc+xsWXyCpGGRC/lpbYzpB0wXKk3rpf9b5uIq
         RdK8u7fN9JxlkARUIznEddw7NPdJrtQoV0GNATYozEvxwwOIUmOncKaKa2qC6RVe8EAz
         LdYgANYrMaXCq6OArPNsWkm6B/KzDJd79sUf2SwZcastk0jY6D+mhy8FWT+aRBvFd0DT
         ahIA==
X-Forwarded-Encrypted: i=1; AJvYcCVbDr7WkWCRHmKxDOiSymF2VWxFgNB2xKVP09NjDftlUpitegd/UNg1O4XOPlN+Qny4XfILVJ7SjU42Zw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzG/u69CeYfSuArknSeW9j2gJMa5BLLOaon8XoBOqtQ+fBc6tzh
	UNRJWlQ/gd9pbinMphIXh6Jj+ni9/08HeZSooegjDwhC3R59ME+iZlJB6N7F71VDMLuGuRSyUgc
	DQ42DNR0o+/Mrnd7mjYMdcbztF5IC+GSAHJpd
X-Gm-Gg: ASbGnctjfrvVJdGnubtJdp9qhcRV3U2Y3t9KoQJK7cJviVlmvqnd4NB2/yGhOWKdsrm
	0XSd8WumBQZFtoDwK+h2zOxN6qqyXn7Gv248S2T7tEoGYVXVc04LiduM5KLjj3RewvgNv
X-Google-Smtp-Source: AGHT+IHyygeSxJyNs1AB/t8h2oWE3zrmWEnc+tMnMhN05YyXp5Tg5F9O0X+SggrM6je5HiwFGxlS9nrxUkLK1wXEwpM=
X-Received: by 2002:a05:600c:5101:b0:434:a1d3:a331 with SMTP id
 5b1f17b1804b1-4361c3e2350mr42431505e9.22.1734000695440; Thu, 12 Dec 2024
 02:51:35 -0800 (PST)
MIME-Version: 1.0
References: <20241101060237.1185533-1-boqun.feng@gmail.com> <20241101060237.1185533-3-boqun.feng@gmail.com>
In-Reply-To: <20241101060237.1185533-3-boqun.feng@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 12 Dec 2024 11:51:23 +0100
Message-ID: <CAH5fLghYjcb-mpR_rr2aC_W8rRb6g8jCFxgky7iEqVgmpHjf=Q@mail.gmail.com>
Subject: Re: [RFC v2 02/13] rust: sync: Add basic atomic operation mapping framework
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
X-CRM114-CacheID: sfid-20241212_025137_894681_9AF13759 
X-CRM114-Status: GOOD (  28.41  )
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

T24gRnJpLCBOb3YgMSwgMjAyNCBhdCA3OjAz4oCvQU0gQm9xdW4gRmVuZyA8Ym9xdW4uZmVuZ0Bn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gUHJlcGFyYXRpb24gZm9yIGdlbmVyaWMgYXRvbWljIGltcGxl
bWVudGF0aW9uLiBUbyB1bmlmeSB0aGUKPiBpcG1sZW1lbnRhdGlvbiBvZiBhIGdlbmVyaWMgbWV0
aG9kIG92ZXIgYGkzMmAgYW5kIGBpNjRgLCB0aGUgQyBzaWRlCj4gYXRvbWljIG1ldGhvZHMgbmVl
ZCB0byBiZSBncm91cGVkIHNvIHRoYXQgaW4gYSBnZW5lcmljIG1ldGhvZCwgdGhleSBjYW4KPiBi
ZSByZWZlcnJlZCBhcyA8dHlwZT46OjxtZXRob2Q+LCBvdGhlcndpc2UgdGhlaXIgcGFyYW1ldGVy
cyBhbmQgcmV0dXJuCj4gdmFsdWUgYXJlIGRpZmZlcmVudCBiZXR3ZWVuIGBpMzJgIGFuZCBgaTY0
YCwgd2hpY2ggd291bGQgcmVxdWlyZSB1c2luZwo+IGB0cmFuc211dGUoKWAgdG8gdW5pZnkgdGhl
IHR5cGUgaW50byBhIGBUYC4KPgo+IEludHJvZHVjZSBgQXRvbWljSXBtbGAgdG8gcmVwcmVzZW50
IGEgYmFzaWMgdHlwZSBpbiBSdXN0IHRoYXQgaGFzIHRoZQo+IGRpcmVjdCBtYXBwaW5nIHRvIGFu
IGF0b21pYyBpbXBsZW1lbnRhdGlvbiBmcm9tIEMuIFRoaXMgdHJhaXQgaXMgc2VhbGVkLAo+IGFu
ZCBjdXJyZW50bHkgb25seSBgaTMyYCBhbmQgYGk2NGAgaXBtbCB0aGlzLgoKVGhlcmUgc2VlbXMg
dG8gYmUgcXVpdGUgYSBmZXcgaW5zdGFuY2VzIG9mICJpbXBsIiBzcGVsbGVkIGFzICJpcG1sIiBo
ZXJlLgoKPiBGdXJ0aGVyLCBkaWZmZXJlbnQgbWV0aG9kcyBhcmUgcHV0IGludG8gZGlmZmVyZW50
IGAqT3BzYCB0cmFpdCBncm91cHMsCj4gYW5kIHRoaXMgaXMgZm9yIHRoZSBmdXR1cmUgd2hlbiBz
bWFsbGVyIHR5cGVzIGxpa2UgYGk4YC9gaTE2YCBhcmUKPiBzdXBwb3J0ZWQgYnV0IG9ubHkgd2l0
aCBhIGxpbWl0ZWQgc2V0IG9mIEFQSSAoZS5nLiBvbmx5IHNldCgpLCBsb2FkKCksCj4geGNoZygp
IGFuZCBjbXB4Y2hnKCksIG5vIGFkZCgpIG9yIHN1YigpIGV0YykuCj4KPiBXaGlsZSB0aGUgYXRv
bWljIG1vZCBpcyBpbnRyb2R1Y2VkLCBkb2N1bWVudGF0aW9uIGlzIGFsc28gYWRkZWQgZm9yCj4g
bWVtb3J5IG1vZGVscyBhbmQgZGF0YSByYWNlcy4KPgo+IEFsc28gYnVtcCBteSByb2xlIHRvIHRo
ZSBtYWludGFpbmVyIG9mIEFUT01JQyBJTkZSQVNUUlVDVFVSRSB0byByZWZsZWN0Cj4gbXkgcmVz
cG9uc2libGl0eSBvbiB0aGUgUnVzdCBhdG9taWMgbW9kLgo+Cj4gU2lnbmVkLW9mZi1ieTogQm9x
dW4gRmVuZyA8Ym9xdW4uZmVuZ0BnbWFpbC5jb20+Cj4gLS0tCj4gIE1BSU5UQUlORVJTICAgICAg
ICAgICAgICAgICAgICB8ICAgNCArLQo+ICBydXN0L2tlcm5lbC9zeW5jLnJzICAgICAgICAgICAg
fCAgIDEgKwo+ICBydXN0L2tlcm5lbC9zeW5jL2F0b21pYy5ycyAgICAgfCAgMTkgKysrKwo+ICBy
dXN0L2tlcm5lbC9zeW5jL2F0b21pYy9vcHMucnMgfCAxOTkgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrCj4gIDQgZmlsZXMgY2hhbmdlZCwgMjIyIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHJ1c3Qva2VybmVsL3N5bmMvYXRvbWljLnJz
Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBydXN0L2tlcm5lbC9zeW5jL2F0b21pYy9vcHMucnMKPgo+
IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCj4gaW5kZXggYjc3ZjQ0OTVk
Y2Y0Li5lMDk0NzEwMjdhNjMgMTAwNjQ0Cj4gLS0tIGEvTUFJTlRBSU5FUlMKPiArKysgYi9NQUlO
VEFJTkVSUwo+IEBAIC0zNjM1LDcgKzM2MzUsNyBAQCBGOiAgICAgICAgZHJpdmVycy9pbnB1dC90
b3VjaHNjcmVlbi9hdG1lbF9teHRfdHMuYwo+ICBBVE9NSUMgSU5GUkFTVFJVQ1RVUkUKPiAgTTog
ICAgIFdpbGwgRGVhY29uIDx3aWxsQGtlcm5lbC5vcmc+Cj4gIE06ICAgICBQZXRlciBaaWpsc3Ry
YSA8cGV0ZXJ6QGluZnJhZGVhZC5vcmc+Cj4gLVI6ICAgICBCb3F1biBGZW5nIDxib3F1bi5mZW5n
QGdtYWlsLmNvbT4KPiArTTogICAgIEJvcXVuIEZlbmcgPGJvcXVuLmZlbmdAZ21haWwuY29tPgo+
ICBSOiAgICAgTWFyayBSdXRsYW5kIDxtYXJrLnJ1dGxhbmRAYXJtLmNvbT4KPiAgTDogICAgIGxp
bnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKPiAgUzogICAgIE1haW50YWluZWQKPiBAQCAtMzY0
NCw2ICszNjQ0LDggQEAgRjogICAgICAgIGFyY2gvKi9pbmNsdWRlL2FzbS9hdG9taWMqLmgKPiAg
RjogICAgIGluY2x1ZGUvKi9hdG9taWMqLmgKPiAgRjogICAgIGluY2x1ZGUvbGludXgvcmVmY291
bnQuaAo+ICBGOiAgICAgc2NyaXB0cy9hdG9taWMvCj4gK0Y6ICAgICBydXN0L2tlcm5lbC9zeW5j
L2F0b21pYy5ycwo+ICtGOiAgICAgcnVzdC9rZXJuZWwvc3luYy9hdG9taWMvCgpUaGlzIGlzIHdo
eSBtb2QucnMgZmlsZXMgYXJlIHN1cGVyaW9yIDopCgo+IEBAIC0wLDAgKzEsMTkgQEAKPiArLy8g
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiArCj4gKy8vISBBdG9taWMgcHJpbWl0
aXZlcy4KPiArLy8hCj4gKy8vISBUaGVzZSBwcmltaXRpdmVzIGhhdmUgdGhlIHNhbWUgc2VtYW50
aWNzIGFzIHRoZWlyIEMgY291bnRlcnBhcnRzOiBhbmQgdGhlIHByZWNpc2UgZGVmaW5pdGlvbnMg
b2YKPiArLy8hIHNlbWFudGljcyBjYW4gYmUgZm91bmQgYXQgW2BMS01NYF0uIE5vdGUgdGhhdCBM
aW51eCBLZXJuZWwgTWVtb3J5IChDb25zaXN0ZW5jeSkgTW9kZWwgaXMgdGhlCj4gKy8vISBvbmx5
IG1vZGVsIGZvciBSdXN0IGNvZGUgaW4ga2VybmVsLCBhbmQgUnVzdCdzIG93biBhdG9taWNzIHNo
b3VsZCBiZSBhdm9pZGVkLgo+ICsvLyEKPiArLy8hICMgRGF0YSByYWNlcwo+ICsvLyEKPiArLy8h
IFtgTEtNTWBdIGF0b21pY3MgaGF2ZSBkaWZmZXJlbnQgcnVsZXMgcmVnYXJkaW5nIGRhdGEgcmFj
ZXM6Cj4gKy8vIQo+ICsvLyEgLSBBIG5vcm1hbCByZWFkIGRvZXNuJ3QgZGF0YS1yYWNlIHdpdGgg
YW4gYXRvbWljIHJlYWQuCgpUaGlzIHdhcyBmaXhlZDoKaHR0cHM6Ly9naXRodWIuY29tL3J1c3Qt
bGFuZy9ydXN0L3B1bGwvMTI4Nzc4Cgo+ICttb2QgcHJpdmF0ZSB7Cj4gKyAgICAvLy8gU2VhbGVk
IHRyYWl0IG1hcmtlciB0byBkaXNhYmxlIGN1c3RvbWl6ZWQgaW1wbHMgb24gYXRvbWljIGltcGxl
bWVudGF0aW9uIHRyYWl0cy4KPiArICAgIHB1YiB0cmFpdCBTZWFsZWQge30KPiArfQoKSnVzdCBt
YWtlIHRoZSB0cmFpdCB1bnNhZmU/CgpBbGljZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
