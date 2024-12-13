Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 879EBE7717D
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 14:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oAg/DUmlUZrAZ5RMZlIX2ikKr6VT9NiAwQY0w86K12o=; b=qqGKvbQGaViHYp
	Tz9esh46WBolYdr6U4aX/+N8WFRXKz4RzO5FqH7N9Mbku+mprN/WXgI7itHHppiCs/RqUsIFY5doy
	ofifIgXtJLmB7dBOzQu3sOo6qlZEsAG8F8dWq7XR9Z9PnMpyvUWfTkQCFZBz3c8eQzz6YeCnytGXH
	1hLg/JCM8dEmYkodhnO/T3Lme2lZr2x1pgqLUWwmvICccbmiAu3nZ5JRK8PrR7L7HN1blEuZ15/Ek
	bmC63jqBxurG8jPumJgnuAxkBbziB6zYYu2cVQwROdQAtPBs5o3Rz4rSMHhKFPfNKTgyxkj2T3mJR
	ASqYTgpmtxCONM3sjr/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM6nr-000000047bs-42mj;
	Fri, 13 Dec 2024 14:38:03 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM6nH-000000047SN-0gZy
	for linux-riscv@lists.infradead.org;
	Fri, 13 Dec 2024 14:37:28 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3862b40a6e0so1020101f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 13 Dec 2024 06:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734100645; x=1734705445; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2GEPFVvt/WcPx7hwmrvPddq2GA3SILVOBgchd5bamcM=;
        b=4XXR+rmll++5LQHvRp9Ab0w9NUf1kbW6YzNsiooOPi2SWpbcXseTslgoI/LAgVrTRp
         eNswMBkz/NQk+M+Yzm3u3g682dDSILhNwF8+GuZF/VYSl++impyYF29u6WUv1jZEvX+m
         kdnyTN3XZADMt7CbLsjVv89D4w90RTEIIHTEiQXNGIRFe5j0gndUULIC7qNB0EAkHpYm
         aXbYgwzv3qXQsj/8sZg7zwMZGVpddqpwgaiekjM2vfuTU1AHch1EOrzYDWun2yK6xMDI
         URxCwX2dVlWsNCmq45D6r8sRtzB2+Kmiy1a4F+RQ8ZaFQA+cdDl+tunI3f6aM4WfNXT/
         xseQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734100645; x=1734705445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2GEPFVvt/WcPx7hwmrvPddq2GA3SILVOBgchd5bamcM=;
        b=UqA/bUxvQzeG4MBXypIytofVfu4caYLlIZVSSK8dntUpwlRk4MR43f2i9Td7e80Bcl
         Rc/cl8loeVtg6ERKfm97xf6PCjcpIu+ZoZtwJBbUOfNe62g1fYQB/hUyyqPqTwD+3UMG
         S6KiKI858LvVuH9bJIrgKZk1GAE+upVfcNQGIL9K7uvkFhjC+OYVC2xtAW2OR1dNiZ9R
         lW1SPa/yyIzMKNm8uZ8mgKX3sF7sj0QtZEoVDxmy2TMLm5wpWNxkCzBBAwFnEuCD5E+Q
         //puQO6nw018YCD7WHFZEfkDp5NqjP3le3oyYlBGK+8HT87JOHIuNseMx64KTXztghOU
         lJTA==
X-Forwarded-Encrypted: i=1; AJvYcCXIsXULXOBnJwo5rDdpK7FsOmPfWl+JxLYpFSaTQhcvgY4vjrXS5oyvx5X8kq5FG6PmnXrGhS8SORDk9Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxB8UUx32XeVu+sge8aNq0jo0KCQxJoN0Tb4tjRrlYlZ0Yo5Z26
	4+p9Hm66P5f7ePoU/3sNmA7HbpyI0zH/ncw/D6fEnCGbgNpucMwFx1kozx9dvYIaBacp85g94/N
	AWWONBE504ncXGI/Orbqbo0dwPKuZs5h+SOjp
X-Gm-Gg: ASbGncu5mvNkPKrDG7YtyfzC+pQDlmak/gYaqBYrjKheoGfsjMdIU8nyx/fAN5kgve4
	tXePPsN/bG/c7HY+pIQHSdml7zBrv6Rn02dW4e7o=
X-Google-Smtp-Source: AGHT+IF5nz9iFwihOnmrHXThptEMDz6uAvc2eauPyTTcPdqXIp7ICHSubzS0ZSdBwH7W3Dcgfoy53emLLyY7/WPXocY=
X-Received: by 2002:a05:6000:154b:b0:385:f092:e00 with SMTP id
 ffacd0b85a97d-3889ad32da3mr2133093f8f.50.1734100645390; Fri, 13 Dec 2024
 06:37:25 -0800 (PST)
MIME-Version: 1.0
References: <20241101060237.1185533-1-boqun.feng@gmail.com>
 <20241101060237.1185533-3-boqun.feng@gmail.com> <CAH5fLghYjcb-mpR_rr2aC_W8rRb6g8jCFxgky7iEqVgmpHjf=Q@mail.gmail.com>
 <Z1sYNOYJPzQmJXn6@boqun-archlinux>
In-Reply-To: <Z1sYNOYJPzQmJXn6@boqun-archlinux>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 13 Dec 2024 15:37:13 +0100
Message-ID: <CAH5fLgidmY7FtKLKR-Yxb6U-mQvsyatGRToqSHHRACfTdiAtUA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241213_063727_207416_41AF0399 
X-CRM114-Status: GOOD (  44.92  )
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

T24gVGh1LCBEZWMgMTIsIDIwMjQgYXQgNjowN+KAr1BNIEJvcXVuIEZlbmcgPGJvcXVuLmZlbmdA
Z21haWwuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgRGVjIDEyLCAyMDI0IGF0IDExOjUxOjIzQU0g
KzAxMDAsIEFsaWNlIFJ5aGwgd3JvdGU6Cj4gPiBPbiBGcmksIE5vdiAxLCAyMDI0IGF0IDc6MDPi
gK9BTSBCb3F1biBGZW5nIDxib3F1bi5mZW5nQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+
IFByZXBhcmF0aW9uIGZvciBnZW5lcmljIGF0b21pYyBpbXBsZW1lbnRhdGlvbi4gVG8gdW5pZnkg
dGhlCj4gPiA+IGlwbWxlbWVudGF0aW9uIG9mIGEgZ2VuZXJpYyBtZXRob2Qgb3ZlciBgaTMyYCBh
bmQgYGk2NGAsIHRoZSBDIHNpZGUKPiA+ID4gYXRvbWljIG1ldGhvZHMgbmVlZCB0byBiZSBncm91
cGVkIHNvIHRoYXQgaW4gYSBnZW5lcmljIG1ldGhvZCwgdGhleSBjYW4KPiA+ID4gYmUgcmVmZXJy
ZWQgYXMgPHR5cGU+Ojo8bWV0aG9kPiwgb3RoZXJ3aXNlIHRoZWlyIHBhcmFtZXRlcnMgYW5kIHJl
dHVybgo+ID4gPiB2YWx1ZSBhcmUgZGlmZmVyZW50IGJldHdlZW4gYGkzMmAgYW5kIGBpNjRgLCB3
aGljaCB3b3VsZCByZXF1aXJlIHVzaW5nCj4gPiA+IGB0cmFuc211dGUoKWAgdG8gdW5pZnkgdGhl
IHR5cGUgaW50byBhIGBUYC4KPiA+ID4KPiA+ID4gSW50cm9kdWNlIGBBdG9taWNJcG1sYCB0byBy
ZXByZXNlbnQgYSBiYXNpYyB0eXBlIGluIFJ1c3QgdGhhdCBoYXMgdGhlCj4gPiA+IGRpcmVjdCBt
YXBwaW5nIHRvIGFuIGF0b21pYyBpbXBsZW1lbnRhdGlvbiBmcm9tIEMuIFRoaXMgdHJhaXQgaXMg
c2VhbGVkLAo+ID4gPiBhbmQgY3VycmVudGx5IG9ubHkgYGkzMmAgYW5kIGBpNjRgIGlwbWwgdGhp
cy4KPiA+Cj4gPiBUaGVyZSBzZWVtcyB0byBiZSBxdWl0ZSBhIGZldyBpbnN0YW5jZXMgb2YgImlt
cGwiIHNwZWxsZWQgYXMgImlwbWwiIGhlcmUuCj4gPgo+Cj4gV2lsbCBmaXghCj4KPiA+ID4gRnVy
dGhlciwgZGlmZmVyZW50IG1ldGhvZHMgYXJlIHB1dCBpbnRvIGRpZmZlcmVudCBgKk9wc2AgdHJh
aXQgZ3JvdXBzLAo+ID4gPiBhbmQgdGhpcyBpcyBmb3IgdGhlIGZ1dHVyZSB3aGVuIHNtYWxsZXIg
dHlwZXMgbGlrZSBgaThgL2BpMTZgIGFyZQo+ID4gPiBzdXBwb3J0ZWQgYnV0IG9ubHkgd2l0aCBh
IGxpbWl0ZWQgc2V0IG9mIEFQSSAoZS5nLiBvbmx5IHNldCgpLCBsb2FkKCksCj4gPiA+IHhjaGco
KSBhbmQgY21weGNoZygpLCBubyBhZGQoKSBvciBzdWIoKSBldGMpLgo+ID4gPgo+ID4gPiBXaGls
ZSB0aGUgYXRvbWljIG1vZCBpcyBpbnRyb2R1Y2VkLCBkb2N1bWVudGF0aW9uIGlzIGFsc28gYWRk
ZWQgZm9yCj4gPiA+IG1lbW9yeSBtb2RlbHMgYW5kIGRhdGEgcmFjZXMuCj4gPiA+Cj4gPiA+IEFs
c28gYnVtcCBteSByb2xlIHRvIHRoZSBtYWludGFpbmVyIG9mIEFUT01JQyBJTkZSQVNUUlVDVFVS
RSB0byByZWZsZWN0Cj4gPiA+IG15IHJlc3BvbnNpYmxpdHkgb24gdGhlIFJ1c3QgYXRvbWljIG1v
ZC4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogQm9xdW4gRmVuZyA8Ym9xdW4uZmVuZ0BnbWFp
bC5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgIHwg
ICA0ICstCj4gPiA+ICBydXN0L2tlcm5lbC9zeW5jLnJzICAgICAgICAgICAgfCAgIDEgKwo+ID4g
PiAgcnVzdC9rZXJuZWwvc3luYy9hdG9taWMucnMgICAgIHwgIDE5ICsrKysKPiA+ID4gIHJ1c3Qv
a2VybmVsL3N5bmMvYXRvbWljL29wcy5ycyB8IDE5OSArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysKPiA+ID4gIDQgZmlsZXMgY2hhbmdlZCwgMjIyIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBydXN0L2tlcm5lbC9zeW5jL2F0b21p
Yy5ycwo+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHJ1c3Qva2VybmVsL3N5bmMvYXRvbWljL29w
cy5ycwo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwo+
ID4gPiBpbmRleCBiNzdmNDQ5NWRjZjQuLmUwOTQ3MTAyN2E2MyAxMDA2NDQKPiA+ID4gLS0tIGEv
TUFJTlRBSU5FUlMKPiA+ID4gKysrIGIvTUFJTlRBSU5FUlMKPiA+ID4gQEAgLTM2MzUsNyArMzYz
NSw3IEBAIEY6ICAgICAgICBkcml2ZXJzL2lucHV0L3RvdWNoc2NyZWVuL2F0bWVsX214dF90cy5j
Cj4gPiA+ICBBVE9NSUMgSU5GUkFTVFJVQ1RVUkUKPiA+ID4gIE06ICAgICBXaWxsIERlYWNvbiA8
d2lsbEBrZXJuZWwub3JnPgo+ID4gPiAgTTogICAgIFBldGVyIFppamxzdHJhIDxwZXRlcnpAaW5m
cmFkZWFkLm9yZz4KPiA+ID4gLVI6ICAgICBCb3F1biBGZW5nIDxib3F1bi5mZW5nQGdtYWlsLmNv
bT4KPiA+ID4gK006ICAgICBCb3F1biBGZW5nIDxib3F1bi5mZW5nQGdtYWlsLmNvbT4KPiA+ID4g
IFI6ICAgICBNYXJrIFJ1dGxhbmQgPG1hcmsucnV0bGFuZEBhcm0uY29tPgo+ID4gPiAgTDogICAg
IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKPiA+ID4gIFM6ICAgICBNYWludGFpbmVkCj4g
PiA+IEBAIC0zNjQ0LDYgKzM2NDQsOCBAQCBGOiAgICAgICAgYXJjaC8qL2luY2x1ZGUvYXNtL2F0
b21pYyouaAo+ID4gPiAgRjogICAgIGluY2x1ZGUvKi9hdG9taWMqLmgKPiA+ID4gIEY6ICAgICBp
bmNsdWRlL2xpbnV4L3JlZmNvdW50LmgKPiA+ID4gIEY6ICAgICBzY3JpcHRzL2F0b21pYy8KPiA+
ID4gK0Y6ICAgICBydXN0L2tlcm5lbC9zeW5jL2F0b21pYy5ycwo+ID4gPiArRjogICAgIHJ1c3Qv
a2VybmVsL3N5bmMvYXRvbWljLwo+ID4KPiA+IFRoaXMgaXMgd2h5IG1vZC5ycyBmaWxlcyBhcmUg
c3VwZXJpb3IgOikKPiA+Cj4KPiA7LSkgTm90IGdvaW5nIHRvIGRvIGFueXRoaW5nIHJpZ2h0IG5v
dywgYnV0IGxldCBtZSB0aGluayBhYm91dCB0aGlzLgo+Cj4gPiA+IEBAIC0wLDAgKzEsMTkgQEAK
PiA+ID4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4gPiA+ICsKPiA+ID4g
Ky8vISBBdG9taWMgcHJpbWl0aXZlcy4KPiA+ID4gKy8vIQo+ID4gPiArLy8hIFRoZXNlIHByaW1p
dGl2ZXMgaGF2ZSB0aGUgc2FtZSBzZW1hbnRpY3MgYXMgdGhlaXIgQyBjb3VudGVycGFydHM6IGFu
ZCB0aGUgcHJlY2lzZSBkZWZpbml0aW9ucyBvZgo+ID4gPiArLy8hIHNlbWFudGljcyBjYW4gYmUg
Zm91bmQgYXQgW2BMS01NYF0uIE5vdGUgdGhhdCBMaW51eCBLZXJuZWwgTWVtb3J5IChDb25zaXN0
ZW5jeSkgTW9kZWwgaXMgdGhlCj4gPiA+ICsvLyEgb25seSBtb2RlbCBmb3IgUnVzdCBjb2RlIGlu
IGtlcm5lbCwgYW5kIFJ1c3QncyBvd24gYXRvbWljcyBzaG91bGQgYmUgYXZvaWRlZC4KPiA+ID4g
Ky8vIQo+ID4gPiArLy8hICMgRGF0YSByYWNlcwo+ID4gPiArLy8hCj4gPiA+ICsvLyEgW2BMS01N
YF0gYXRvbWljcyBoYXZlIGRpZmZlcmVudCBydWxlcyByZWdhcmRpbmcgZGF0YSByYWNlczoKPiA+
ID4gKy8vIQo+ID4gPiArLy8hIC0gQSBub3JtYWwgcmVhZCBkb2Vzbid0IGRhdGEtcmFjZSB3aXRo
IGFuIGF0b21pYyByZWFkLgo+ID4KPiA+IFRoaXMgd2FzIGZpeGVkOgo+ID4gaHR0cHM6Ly9naXRo
dWIuY29tL3J1c3QtbGFuZy9ydXN0L3B1bGwvMTI4Nzc4Cj4gPgo+Cj4gWWVhaCwgSSB3YXMgYXdh
cmUgb2YgdGhhdCBlZmZvcnQsIGFuZCBnb29kIHRvIGtub3cgaXQncyBmaW5hbGx5IG1lcmdlZC4K
PiBUaGFua3MhCj4KPiBUaGlzIHdpbGwgYmUgaW4gMS44MywgcmlnaHQ/IElmIHNvLCB3ZSB3aWxs
IHN0aWxsIG5lZWQgdGhlIGFib3ZlIHVudGlsCj4gd2UgYnVtcCB1cCB0aGUgbWluaW1hbCBydXN0
YyB2ZXJzaW9uIHRvIDEuODMgb3IgYmV5b25kLiBJIHdpbGwgaGFuZGxlCj4gdGhpcyBwcm9wZXJs
eSB3aXRoIHRoZSBtaW5pbWFsIHJ1c3RjIDEuODMgKGkuZS4gaWYgdGhpcyBnb2VzIGluIGZpcnN0
LAo+IHdpbGwgc2VuZCBhIGZvbGxvdyB1cCBwYXRjaCkuIEkgd2lsbCBhbHNvIG1lbnRpb24gaW4g
dGhlIGFib3ZlIHRoYXQgdGhpcwo+IGhhcyBiZWVuIGNoYW5nZWQgaW4gMS44My4KPgo+IFRoaXMg
YWxzbyByZW1pbmRzIHRoYXQgSSBzaG91bGQgYWRkIHRoYXQgTEtNTSBhbGxvd3MgbWl4ZWQtc2l6
ZSBhdG9taWMKPiBhY2Nlc3NlcyAoYXMgbm9uIGRhdGEgcmFjZSksIEkgd2lsbCBhZGQgdGhhdCBp
biB0aGUgdmVyc2lvbi4KClRoaXMgaXMganVzdCBkb2N1bWVudGF0aW9uLiBJIGRvbid0IHRoaW5r
IHlvdSBuZWVkIHRvIGRvIGFueSBzcGVjaWFsCk1TUlYgaGFuZGxpbmcuCgo+ID4gPiArbW9kIHBy
aXZhdGUgewo+ID4gPiArICAgIC8vLyBTZWFsZWQgdHJhaXQgbWFya2VyIHRvIGRpc2FibGUgY3Vz
dG9taXplZCBpbXBscyBvbiBhdG9taWMgaW1wbGVtZW50YXRpb24gdHJhaXRzLgo+ID4gPiArICAg
IHB1YiB0cmFpdCBTZWFsZWQge30KPiA+ID4gK30KPiA+Cj4gPiBKdXN0IG1ha2UgdGhlIHRyYWl0
IHVuc2FmZT8KPiA+Cj4KPiBBbmQgbWFrZSB0aGUgc2FmZXR5IHJlcXVpcmVtZW50IG9mIGBBdG9t
aWNJbXBsYCBzb21ldGhpbmcgbGlrZToKPgo+ICAgICBUaGUgdHlwZSBtdXN0IGhhdmUgdGhlIGlt
cGxlbWVudGF0aW9uIGZvciBhdG9taWMgb3BlcmF0aW9ucy4KPgo+ID8gSG1tLi4gSSBkb24ndCB0
aGluayB0aGF0J3MgYSBnb29kIHNhZmV0eSByZXF1aXJlbWVudCBUQkguIEFjdHVhbGx5IHRoZQo+
IHJlYXNvbiB0aGF0IHdlIG5lZWQgdG8gcmVzdHJpY3QgYEF0b21pY0ltcGxgIHR5cGVzIGlzIG1v
cmUgb2YgYW4KPiBpcGxlbWVudGF0aW9uIGlzc3VlICh0aGUgaW1wbGVtZW50YXRpb24gbmVlZCB0
byBiZSBkb25lIGlmIHdlIHdhbnQgdG8KPiBzdXBwb3J0IGk4IG9yIGkxNikgcmF0aGVyIHRoYW4g
c2FmZXR5IGlzc3VlLiBTbyBhIHNlYWxlZCB0cmFpdCBpcyBwcm9wZXIKPiBoZXJlLiBEb2VzIHRo
aXMgbWFrZSBzZW5zZT8gT3IgYW0gSSBtaXNzaW5nIHNvbWV0aGluZz8KCldoZXJlIGlzIHRoZSBB
dG9taWNJbXBsIHRyYWl0IHVzZWQ/CgpBbGljZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
