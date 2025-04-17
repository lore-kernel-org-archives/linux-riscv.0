Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA22C369B2
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Apr 2025 14:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ludBvIdMDPrY9dv6roqjxTjArYuI6EPOavbadOgKSGI=; b=4KPqtpaifeHtEj
	RS5NEddAshiUdDI1zkIrMitk9t1KGW6Q1XsD/lw0xoanCOX64p0rRTjYEE+3e0K81mlFIoaxUrOeP
	1S98ox7vdROcsMuazDZMzBvr0jQI/zjFdLGx3xp/tE4LDCPgvvDiRxb4s0PTPtHVf6ZydEkqv6mQu
	xzMrgKy+Huo/awqQ7WcCLRjZRzKo0pJIDN1hjYi2WfoJ0w8MVnaAfZ+8lV2c7s5RJWkKfduOTP9h7
	w9fENz2JYuHylPKWj9ZXJb8Bwdfgi1nI/6bfURNITT+tJr2WOZKo0ogMvsuW7R7TN7FQfOKOG1D21
	XuMLakppU2BlCUE8rDng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Q1a-0000000DH3O-40GC;
	Thu, 17 Apr 2025 14:15:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Q1Y-0000000DH2x-3myE
	for linux-riscv@lists.infradead.org;
	Thu, 17 Apr 2025 14:15:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 763F14A4E0
	for <linux-riscv@lists.infradead.org>; Thu, 17 Apr 2025 14:15:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DBADC4AF0C
	for <linux-riscv@lists.infradead.org>; Thu, 17 Apr 2025 14:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744899328;
	bh=OwOkjFVgfqnhtYMoB2n+/2LjSN54EJEx3cnulauDKdo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rkPcu2I9/wcJSEB9hys4gh2n7O1us0r2kkmLcoI3BHSWby4kg6PpnZiNYwA8xAsv2
	 qdNxNE5+pvCPVLL/Yg4eQ8v6PWOO7yFGCwLrbZz0PQm7FhrlLXMRnF8JDr5pFbJ3tz
	 Gtig0ZzIYazvHpcs5VKrktD54KbjXccWV1YGXKUgCwvwbg35BpxskWyoYVAyJ+3LO4
	 Jn0LnkZsTT853+vAqZw+33d6WLX7Hle9MMmSYhTQ5hZkcTX98WjS7l/DY6o4uUZc94
	 gWsgAil/6uekgh3x3aB/eH0R7cxBYKhkVRJ04JMRNnrJFbwO2GRxatlx88fZs6PrHs
	 bJm8ag2D0nnBQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so1000905e87.1
        for <linux-riscv@lists.infradead.org>; Thu, 17 Apr 2025 07:15:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVnvJahBsgm+qhDll3WS56VLTK/5zNUi2gRypcJlilcjRWCxuDKEcEoGQFZHtT4Js2BC1E/+D+ddTofTg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyRFA46t5G3YVbwAus0MrUri5kdvib74UbecDuu9S7O6a+n6Y9M
	YF8do3WuLJz1CGNnahz7mWsBnmPHOU99PgV86NzmNCAofmh/3mSMp41V6BjSlSrloYamnzVl+j6
	BJ6W523fQlBtWjW3qQFttHJ9G95k=
X-Google-Smtp-Source: AGHT+IGKDLvGQdTgpdJ7/j9wkID94NCC8FnydWqifd12MlpxWqVVofyUjcJtA/8XvkknzSU9uf03za/MH7AVddjqFIU=
X-Received: by 2002:a2e:ad93:0:b0:30b:b204:6b80 with SMTP id
 38308e7fff4ca-3107f695046mr25939941fa.8.1744899326442; Thu, 17 Apr 2025
 07:15:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250417064940.68469-1-dqfext@gmail.com> <CAMj1kXFPAVXOtPoETKvHB49kjZUPYrsAqsJwdL7p5Cu4xk75Rg@mail.gmail.com>
 <CALW65jY=LnVBYoKPOQnSKgGSA0brKzmo0vqoRDcqF_=jofLAng@mail.gmail.com>
 <CAMj1kXH-u7hiKGQfgYHj_16V4ATN_aHmA_wkvMSyLh+E3+QaAA@mail.gmail.com> <CALW65jZVYUZoka7Gbjcoh43qbkD7rGpw8gTZjjOYpZD-BhLyBQ@mail.gmail.com>
In-Reply-To: <CALW65jZVYUZoka7Gbjcoh43qbkD7rGpw8gTZjjOYpZD-BhLyBQ@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 17 Apr 2025 16:15:15 +0200
X-Gmail-Original-Message-ID: <CAMj1kXE8nY0rasb04qbZGtkuL5_b8so7L7NH61zLv9G3nm5vcg@mail.gmail.com>
X-Gm-Features: ATxdqUGHOdKzra412vt6IXHNye7okVyhB80J7RfKjih5eOcYv_TSJ39O50e8lAk
Message-ID: <CAMj1kXE8nY0rasb04qbZGtkuL5_b8so7L7NH61zLv9G3nm5vcg@mail.gmail.com>
Subject: Re: [RFC PATCH] crypto: riscv: scalar accelerated GHASH
To: Qingfang Deng <dqfext@gmail.com>
Cc: Eric Biggers <ebiggers@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-crypto@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
	Heiko Stuebner <heiko.stuebner@vrull.eu>, Qingfang Deng <qingfang.deng@siflower.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_071528_981181_3651AE01 
X-CRM114-Status: GOOD (  27.15  )
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

T24gVGh1LCAxNyBBcHIgMjAyNSBhdCAxMDo0MiwgUWluZ2ZhbmcgRGVuZyA8ZHFmZXh0QGdtYWls
LmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIEFwciAxNywgMjAyNSBhdCAzOjU44oCvUE0gQXJkIEJp
ZXNoZXV2ZWwgPGFyZGJAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBXaGF0IGlz
IHRoZSB1c2UgY2FzZSBmb3IgdGhpcz8gQUlVSSwgdGhlIHNjYWxhciBBRVMgaW5zdHJ1Y3Rpb25z
IHdlcmUKPiA+ID4gPiBuZXZlciBpbXBsZW1lbnRlZCBieSBhbnlvbmUsIHNvIGhvdyBkbyB5b3Ug
ZXhwZWN0IHRoaXMgdG8gYmUgdXNlZCBpbgo+ID4gPiA+IHByYWN0aWNlPwo+ID4gPgo+ID4gPiBU
aGUgdXNlIGNhc2UgX2lzXyBBRVMtR0NNLCBhcyB5b3UgbWVudGlvbmVkLiBXaXRob3V0IHRoaXMs
IGNvbXB1dGluZwo+ID4gPiBHSEFTSCBjYW4gdGFrZSBhIGNvbnNpZGVyYWJsZSBhbW91bnQgb2Yg
Q1BVIHRpbWUgKG1vbml0b3JlZCBieSBwZXJmKS4KPiA+ID4KPiA+Cj4gPiBJIHNlZS4gQnV0IGRv
IHlvdSBoYXZlIGEgcGFydGljdWxhciBjb25maWd1cmF0aW9uIGluIG1pbmQ/IERvZXMgaXQKPiA+
IGhhdmUgc2NhbGFyIEFFUyB0b28/IEkgbG9va2VkIGludG8gdGhhdCBhIHdoaWxlIGFnbyBidXQg
SSB3YXMgdG9sZAo+ID4gdGhhdCBub2JvZHkgYWN0dWFsbHkgaW5jb3Jwb3JhdGVzIHRoYXQuIFNv
IHdoYXQgYWJvdXQgdGhlc2UKPiA+IGV4dGVuc2lvbnM/IEFyZSB0aGV5IGNvbW1vbmx5IGltcGxl
bWVudGVkPwo+Cj4gSXQncyBhZXMtZ2VuZXJpYy5jIChMVVQtYmFzZWQpIHdpdGggYWNjZWxlcmF0
ZWQgR0hBU0guCj4KPiA+Cj4gPiBbMF0gaHR0cHM6Ly93ZWIuZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L2FyZGIvbGludXguZ2l0L2xvZy8/aD1yaXNjdi1zY2FsYXItYWVz
Cj4gPgo+ID4gPiA+IC4uLgo+ID4gPiA+ID4gK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUgX191aW50
MTI4X3QgZ2V0X3VuYWxpZ25lZF9iZTEyOChjb25zdCB1OCAqcCkKPiA+ID4gPiA+ICt7Cj4gPiA+
ID4gPiArICAgICAgIF9fdWludDEyOF90IHZhbDsKPiA+ID4gPiA+ICsjaWZkZWYgQ09ORklHX0hB
VkVfRUZGSUNJRU5UX1VOQUxJR05FRF9BQ0NFU1MKPiA+ID4gPgo+ID4gPiA+IENPTkZJR19IQVZF
X0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNTIG1lYW5zIHRoYXQgZ2V0X3VuYWxpZ25lZF94eHgo
KQo+ID4gPiA+IGhlbHBlcnMgYXJlIGNoZWFwLiBDYXN0aW5nIGEgdm9pZCogdG8gYW4gYWxpZ25l
ZCB0eXBlIGlzIHN0aWxsIFVCIGFzCj4gPiA+ID4gcGVyIHRoZSBDIHN0YW5kYXJkLgo+ID4gPgo+
ID4gPiBUZWNobmljYWxseSBhbiB1bmFsaWduZWQgYWNjZXNzIGlzIFVCIGJ1dCB0aGlzIHBhdHRl
cm4gaXMgd2lkZWx5IHVzZWQKPiA+ID4gaW4gbmV0d29ya2luZyBjb2RlLgo+ID4gPgo+ID4KPiA+
IE9mIGNvdXJzZS4gQnV0IHRoYXQgaXMgbm8gcmVhc29uIHRvIGtlZXAgZG9pbmcgaXQuCj4gPgo+
ID4gPiA+Cj4gPiA+ID4gU28gYmV0dGVyIHRvIGRyb3AgdGhlICNpZmRlZiBlbnRpcmVseSwgYW5k
IGp1c3QgdXNlIHRoZQo+ID4gPiA+IGdldF91bmFsaWduZWRfYmU2NCgpIGhlbHBlcnMgZm9yIGJv
dGggY2FzZXMuCj4gPiA+Cj4gPiA+IEN1cnJlbnRseSB0aG9zZSBoZWxwZXJzIHdvbid0IGdlbmVy
YXRlIHJldjggaW5zdHJ1Y3Rpb25zLCBldmVuIGlmCj4gPiA+IEhBVkVfRUZGSUNJRU5UX1VOQUxJ
R05FRF9BQ0NFU1MgYW5kIFJJU0NWX0lTQV9aQkIgaXMgc2V0LCBzbyBJIGhhdmUgdG8KPiA+ID4g
aW1wbGVtZW50IG15IG93biB2ZXJzaW9uIG9mIHRoaXMgdG8gcmVkdWNlIHRoZSBudW1iZXIgb2Yg
aW5zdHJ1Y3Rpb25zLAo+ID4gPiBhbmQgdG8gYWxpZ24gd2l0aCB0aGUgb3JpZ2luYWwgT3BlblNT
TCBpbXBsZW1lbnRhdGlvbi4KPiA+ID4KPiA+Cj4gPiBTbyBmaXggdGhlIGhlbHBlcnMuCj4KPiBU
aGUgaXNzdWUgaXMgdGhhdCBSSVNDLVYgR0NDIGRvZXNu4oCZdCBlbWl0IGVmZmljaWVudCB1bmFs
aWduZWQgbG9hZHMgYnkgZGVmYXVsdDoKPiAtIE5vdCBhbGwgUklTQy1WIENQVXMgc3VwcG9ydCB1
bmFsaWduZWQgYWNjZXNzIGVmZmljaWVudGx5LCBzbyBHQ0MKPiBmYWxscyBiYWNrIHRvIGNvbnNl
cnZhdGl2ZSBieXRlLXdpc2UgY29kZS4KClRoYXQgbWFrZXMgc2Vuc2UuCgo+IC0gVGhlcmXigJlz
IG5vIGNsZWFuIHdheSB0byBmb3JjZSB0aGUgb3B0aW1pemVkIHBhdGggLSBHQ0Mgb25seSBlbWl0
cwo+IGZhc3QgdW5hbGlnbmVkIGxvYWRzIGlmIHR1bmVkIGZvciBhIHNwZWNpZmljIENQVSAoZS5n
LiwgLW10dW5lPXNpemUgb3IKPiAtbXR1bmU9dGhlYWQtYzkwNiksIHdoaWNoIHRoZSBrZXJuZWwg
ZG9lc24ndCB0eXBpY2FsbHkgZG8sIGV2ZW4gd2l0aAo+IEhBVkVfRUZGSUNJRU5UX1VOQUxJR05F
RF9BQ0NFU1MuCj4KPiBNYXliZSB3ZSBzaG91bGQgcmFpc2UgdGhpcyB3aXRoIHRoZSBHQ0MgbWFp
bnRhaW5lcnMuIEFuIGV4cGxpY2l0Cj4gb3B0aW9uIHRvIGVuYWJsZSBvcHRpbWl6ZWQgdW5hbGln
bmVkIGFjY2VzcyBjb3VsZCBoZWxwLgo+CgpIQVZFX0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNT
IGlzIGEgYnVpbGQgdGltZSBzZXR0aW5nLCBzbyB0aGUKcmVzdWx0aW5nIGtlcm5lbCBvbmx5IHJ1
bnMgY29ycmVjdGx5IG9uIGhhcmR3YXJlIHRoYXQgaW1wbGVtZW50cwp1bmFsaWduZWQgYWNjZXNz
ZXMgaW4gaGFyZHdhcmUuCgpTbyB0aGF0IG1lYW5zIHlvdSBjb3VsZCBwYXNzIHRoaXMgLW10dW5l
PSBvcHRpb24gdG9vIGluIHRoYXQgY2FzZSwgbm8/ClRoZW4sIHlvdSBjYW4ganVzdCB1c2UgYSBw
YWNrZWQgc3RydWN0IG9yIGFuIF9fYWxpZ25lZCgxKSBhbm5vdGF0aW9uCmFuZCB0aGUgY29tcGls
ZXIgd2lsbCBlbWl0IHRoZSBjb3JyZWN0IGNvZGUgZm9yIHlvdSwgZGVwZW5kaW5nIG9uCndoZXRo
ZXIgdW5hbGlnbmVkIGFjY2Vzc2VzIGFyZSBwZXJtaXR0ZWQuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
