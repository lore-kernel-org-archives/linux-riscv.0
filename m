Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75421CA5FA8
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 16:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cqe9t3IUneInHxcuwB/rRJMOuS7xsjV50tiA4OI7zDw=; b=FyB0g9zVIfe54b
	VZrjRsPglSdSSzvD2GMctrgqn8Rx6VfkSdhxB1KiKbXOyae8xFfENREG7f1onhiFr9b+nXpw+7Jzx
	bWYpu/DCCUqh1OhW3RJBol2ccHEFgL6XRM5KV9X1NAqXo4pXLkDVZ+BXK+oTU1JWbc4bLVAh4g9HO
	qF7l7b91yMAhJ73dPLOAPMHE6ao0KNUw+6+gnpcRPV8yReJg4laV8nEbDKjxKjWzUqfCN6I48ncJJ
	0gp9gf7Ub7VGDQH3qlqsXKkIX2EflFfJyyD124SXFSBXfrxwD5LGIGXaKeL/9rDyl8Pf0yqOKIal8
	vQDrreKAGpAge4EG9xTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viEPF-000000048zi-2wGQ;
	Tue, 20 Jan 2026 16:16:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viEPD-000000048zI-1Xuh
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 16:16:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A6CB444085
	for <linux-riscv@lists.infradead.org>; Tue, 20 Jan 2026 16:16:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80B1DC2BCB2
	for <linux-riscv@lists.infradead.org>; Tue, 20 Jan 2026 16:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768925794;
	bh=BNzsItdhwN4AlCLoipqscYZCx4sHqbuRLNDIVXpilSk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=THSDmi8gq235TCymdcD40neouylxEUPybAk8IqPK1VlC9tfnkSczzfK6vsoo+M7vm
	 eXRPBc7IzwbOSPtHHf8dHvyl+qHLHU4MtJpcRy0md+yhVkI3QX0Wf9ZYLfVQc5BSI1
	 EpHa3DG6ExQiIEki+f+ELIQVkMORCQqN0OFyLZu1xmbWwpQIqrBaWzxjzqxN3FzfI0
	 wzaQ9R0CufxLLJ2C+ysHLBMxD0wT9LjUP0aUYVKk5p9C2c3t3djt/tuO+lpqqgq+dD
	 c1KckqjyOcvQbx+YLaC0JIE7KedRkmAOFwWC8fFgTA0UlhvXaSSwSGeNAhlnSKX2WG
	 hQVTvJWeGqqpA==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-382fea4a160so53345771fa.2
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jan 2026 08:16:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUGz+l7fiC3DAU7tGGd+nwmgewg/JY3rPTPYNxO/Ctdt6xdvomRUohcTw3C58ofKgEpG+V8omZewu/BGg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyM481kW092Om57lNek47yxyjHTIllMjO306lCBPL3Ste6qcN9s
	893poaouLv/kpqJj/2udZaPSGalniRSw2vcG2DIKlnF7n2JKuX9qF0rrRZDxFFgF3UgffAFqX4S
	PK5WchdzMAtDo6s7c+4hZHEm9amMsPz0=
X-Received: by 2002:a05:651c:3612:b0:378:d5dc:17c2 with SMTP id
 38308e7fff4ca-3838417c912mr56935201fa.11.1768925793031; Tue, 20 Jan 2026
 08:16:33 -0800 (PST)
MIME-Version: 1.0
References: <20251222-cstr-pwm-v1-1-e8916d976f8d@gmail.com> <o4uvwymm73wnehs5zb7lqgv3mjv235jpprfqrsb6oxscxhmmjh@25u7wrb7yo2i>
In-Reply-To: <o4uvwymm73wnehs5zb7lqgv3mjv235jpprfqrsb6oxscxhmmjh@25u7wrb7yo2i>
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 20 Jan 2026 11:15:56 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9=USrGECVS1qMqs+iCKUqvOdfcjA6phAjaF0wfcTkQt_g@mail.gmail.com>
X-Gm-Features: AZwV_QhGR5x54f9_gIkwS8dqtjPRJRBl1YkXPqMFOsqu-3oh6YnupyEAn_EqRwc
Message-ID: <CAJ-ks9=USrGECVS1qMqs+iCKUqvOdfcjA6phAjaF0wfcTkQt_g@mail.gmail.com>
Subject: Re: [PATCH] drivers: pwm: replace `kernel::c_str!` with C-Strings
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Michal Wilczynski <m.wilczynski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_081635_451745_8E122576 
X-CRM114-Status: GOOD (  15.89  )
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

T24gVHVlLCBKYW4gMjAsIDIwMjYgYXQgMzozOeKAr0FNIFV3ZSBLbGVpbmUtS8O2bmlnIDx1a2xl
aW5la0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IEhlbGxvLAo+Cj4gT24gTW9uLCBEZWMgMjIsIDIw
MjUgYXQgMDE6MjQ6NDZQTSArMDEwMCwgVGFtaXIgRHViZXJzdGVpbiB3cm90ZToKPiA+IEZyb206
IFRhbWlyIER1YmVyc3RlaW4gPHRhbWlyZEBnbWFpbC5jb20+Cj4gPgo+ID4gQy1TdHJpbmcgbGl0
ZXJhbHMgd2VyZSBhZGRlZCBpbiBSdXN0IDEuNzcuIFJlcGxhY2UgaW5zdGFuY2VzIG9mCj4gPiBg
a2VybmVsOjpjX3N0ciFgIHdpdGggQy1TdHJpbmcgbGl0ZXJhbHMgd2hlcmUgcG9zc2libGUuCj4g
Pgo+ID4gU2lnbmVkLW9mZi1ieTogVGFtaXIgRHViZXJzdGVpbiA8dGFtaXJkQGdtYWlsLmNvbT4K
Pgo+IEFwcGxpZWQgdG8KPgo+ICAgICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2Nt
L2xpbnV4L2tlcm5lbC9naXQvdWtsZWluZWsvbGludXguZ2l0IHB3bS9mb3ItbmV4dAo+Cj4gYXMg
bWVyZ2Ugd2luZG93IG1hdGVyaWFsIHdpdGggdGhlIFItYiB0YWdzIGJ5IE1pY2hhbCBXaWxjenlu
c2tpIGFuZAo+IERhbmllbCBBbG1laWRhLgo+Cj4gKFNpZGUgbm90ZSwgYjQgdG9sZCBtZToKPgo+
ICAgICAgICAgICDinJcgTm8ga2V5OiBvcGVuc3NoL3RhbWlyZEBnbWFpbC5jb20KPgo+IC4gSXQn
cyBub3QgY2xlYXIgdG8gbWUgaG93IHRvIHZlcmlmeSB0aGlzIHNpZ25hdHVyZS4gTXkgZXhwZXJp
bWVudHMKPiBpbmNsdWRlOgo+Cj4gICAgICAgICAkIGI0IGtyIC0tc2hvdy1rZXlzIDIwMjUxMjIy
LWNzdHItcHdtLXYxLTEtZTg5MTZkOTc2ZjhkQGdtYWlsLmNvbQo+ICAgICAgICAgLS0tCj4gICAg
ICAgICBObyBrZXlzIGZvdW5kIGluIHRoZSB0aHJlYWQuCj4KPiBhbmQgbG9va2luZyBhdAo+IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXB3bS8yMDI1MTIyMi1jc3RyLXB3bS12MS0xLWU4
OTE2ZDk3NmY4ZEBnbWFpbC5jb20vcmF3Cj4gd2hlcmUgSSBzZWUKPgo+ICAgICAgICAgWC1EZXZl
bG9wZXItS2V5OiBpPXRhbWlyZEBnbWFpbC5jb207IGE9b3BlbnNzaDsgZnByPVNIQTI1NjoyNjRy
UG1ubnJiK0VSa1M3RERTM3R1d3FjSnNzL3pldkpSem95bHFNc2JjCj4KPiB3aGljaCBJSVVDIGlz
bid0IGVub3VnaCB0byB2ZXJpZnkgdGhlIG5leHQgbWFpbCBzaWduZWQgd2l0aCB0aGUgc2FtZQo+
IGtleS4gQW0gSSBtaXNzaW5nIHNvbWV0aGluZz8gSSB2ZXJ5IGFwcHJlY2lhdGUgc2lnbmluZyB5
b3VyIHdvcmssIGJ1dCBpZgo+IHRoZXJlIGlzIG5vIHdheSBmb3IgbWUgKG9yIGFueW9uZSBlbHNl
KSB0byB2ZXJpZnkgaXQsIHRoZXJlIGlzIG5vIGdhaW4uKQoKWWVwLCB5b3UgYXJlIHJpZ2h0IHRv
IGNhbGwgdGhpcyBvdXQuIE15IHVzdWFsIHNldHVwIHVzZXMgU1NIIGtleXMgZm9yCmNvbW1pdCBz
aWduaW5nLCB3aGljaCBhcmUgbm90IHBhcnQgb2YgdGhlIGtlcm5lbCB3ZWIgb2YgdHJ1c3QuIEkK
cHJvbWlzZSB0byBzdGFydCBzaWduaW5nIGtlcm5lbCB3b3JrIHdpdGggbXkgR1BHIGtleSBzb29u
IDopCgpJbiB0aGUgbWVhbnRpbWUgaWYgeW91IHRydXN0IEdpdGh1YiB5b3UgY2FuIHZlcmlmeSBt
eSBzaWduYXR1cmUKYWdhaW5zdCBodHRwczovL2dpdGh1Yi5jb20vdGFtaXJkLmtleXMuCgpDaGVl
cnMuClRhbWlyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
