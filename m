Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1305AE63C85
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jan 2026 04:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VyT5D5caYGFMqJccZDz6bDcHLmg9tXQGO1Tg6cClyRg=; b=Q5RJCYqGCRbZkm
	V3qOlO/uYdRgvMQEcmg+ulPK8I4K4pWxn7YZ5a11tZVDjnb8MYz89zoQ87gpmauhkQRq1GxV4Xw3q
	Q+2iiHFphRP8oKl68ig5sIrd0g8e1EaeYASMufU7XizK+yzpHX9seTcHTpVuq4HDhRZ87YKseQZpi
	qJRsZrC6/jQSDnq4e1AeNAR13XCOCBZ6Ep0SURyOTqRWw+9SsbSGYplwxchvZohHYknQgResREwJf
	W1cGJ4bmin07xCvOiAyF2XI7By2X6hlMX5kdnoQjXZURnkvSACZsvvkTot+LImE02JcUhy/QN4bLb
	WmmIl5zynNTqJ/3Fht2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjrLZ-0000000Aoz4-3UTd;
	Sun, 25 Jan 2026 04:03:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjrLY-0000000Aoyy-0Sii
	for linux-riscv@lists.infradead.org;
	Sun, 25 Jan 2026 04:03:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EA60460018
	for <linux-riscv@lists.infradead.org>; Sun, 25 Jan 2026 04:03:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E85BC116C6
	for <linux-riscv@lists.infradead.org>; Sun, 25 Jan 2026 04:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769313810;
	bh=TQaDh7lsKY8tFsjMYD7BTGjXonEHzONpf6q4U3MFS74=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OJslFK39224RKhla6bB5iSfRIwZLSwK0zH/qXmWbtyo7Rwl2geQRVpyApYumbBS6h
	 sjhFr3mnhaoAmtdJHFax59GRvvrchLOL5zShuJryRKCL7ySkkObMDssmrKVgXJ0myG
	 9+KPTkbQ+zbVxLp6U1PgZ4cIlPbpwYskoj24pHd0BCmt+XFOCGK4zvewGliNDbYFks
	 sRbjZITxoIwueQUFws89pfQSLNAOzlD1hFTDp2qOUxBfy/3/15PDeqQUPdqVY6xM1G
	 rqZFUV4MyTyaDUC9aaqickqMdGQrSNN7a8oRGSKbNsHFXNjkhd1URPdcrbjIDYYNsL
	 ivsA9SUzUuKCw==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b8842e5a2a1so442677466b.2
        for <linux-riscv@lists.infradead.org>; Sat, 24 Jan 2026 20:03:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVGy98rnytoRs1/lK/Q37mA1RUGdLmjCKM8hJVcPRl3krbUQeP9tT/NSW2scUDe1wV/CXB+bD45/tRPew==@lists.infradead.org
X-Gm-Message-State: AOJu0YznR+3aoD808/eVLVyaZWORzW3U4R3AMPY3yanJSxQ1Dji8UNNw
	rtrPUS0UhEsF4P/AkKa646t9MDyzn2JlX0KmwkICnpCA5u9uXhiU53cjrF5LP0zdylBVYKHPBLa
	ayGu0MPdU5a3igbXn1nHbvRhyI+SgHvo=
X-Received: by 2002:a17:907:2d09:b0:b73:6f8c:6127 with SMTP id
 a640c23a62f3a-b8d3fa14150mr40755666b.12.1769313809089; Sat, 24 Jan 2026
 20:03:29 -0800 (PST)
MIME-Version: 1.0
References: <20260109051054.188030-1-fearyncess@aosc.io> <aWC6bIEg6UqvX1DO@kernel.org>
In-Reply-To: <aWC6bIEg6UqvX1DO@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 25 Jan 2026 12:03:25 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5tHZRHmXSA6m+fyhaN9nNjLFbEiVK7OWjL8EoJn16doQ@mail.gmail.com>
X-Gm-Features: AZwV_QgZtJU-wwFoOJ5ofNX243-l4sQGf8pk1EIiYklzuhdRgtqAyAoGEoSGyHo
Message-ID: <CAAhV-H5tHZRHmXSA6m+fyhaN9nNjLFbEiVK7OWjL8EoJn16doQ@mail.gmail.com>
Subject: Re: [PATCH] loongarch: wire up memfd_secret system call
To: Mike Rapoport <rppt@kernel.org>
Cc: Lain Fearyncess Yang <fearyncess@aosc.io>, WANG Xuerui <kernel@xen0n.name>, 
	Kexy Biscuit <kexybiscuit@aosc.io>, Mingcong Bai <jeffbai@aosc.io>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org
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

T24gRnJpLCBKYW4gOSwgMjAyNiBhdCA0OjIx4oCvUE0gTWlrZSBSYXBvcG9ydCA8cnBwdEBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgSmFuIDA5LCAyMDI2IGF0IDAxOjEwOjUxUE0gKzA4
MDAsIExhaW4gRmVhcnluY2VzcyBZYW5nIHdyb3RlOgo+ID4gRnJvbTogIkxhaW4gXCJGZWFyeW5j
ZXNzXCIgWWFuZyIgPGZlYXJ5bmNlc3NAYW9zYy5pbz4KPiA+Cj4gPiBMb29uZ0FyY2ggc3VwcG9y
dHMgQVJDSF9IQVNfU0VUX0RJUkVDVF9NQVAsIHRoZXJlZm9yZSB3aXJlIHVwIHRoZQo+ID4gbWVt
ZmRfc2VjcmV0IHN5c3RlbSBjYWxsLCB3aGljaCBkZXBlbmRzIG9uIGl0Lgo+Cj4gTG9vbmdBcmNo
IHZlcnNpb24gb2Ygc2V0X21lbW9yeSogZG9lcyBub3Qgc3VwcG9ydCBzcGxpdHRpbmcgb2YgbGVh
ZiBQTUQKPiBlbnRyaWVzLiBEb2VzIExvb25nQXJjaCBhbHdheXMgdXNlIFBURS1sZXZlbCBtYXBw
aW5ncyBpbiB0aGUgZGlyZWN0IG1hcD8KTm8gUE1EIGxldmVsIG1hcHBpbmdzIG5vdy4KCkh1YWNh
aQo+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBMYWluICJGZWFyeW5jZXNzIiBZYW5nIDxmZWFyeW5jZXNz
QGFvc2MuaW8+Cj4gPiAtLS0KPiA+ICBhcmNoL2xvb25nYXJjaC9pbmNsdWRlL2FzbS91bmlzdGQu
aCAgICAgfCAxICsKPiA+ICBhcmNoL2xvb25nYXJjaC9rZXJuZWwvTWFrZWZpbGUuc3lzY2FsbHMg
fCA2ICsrKy0tLQo+ID4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL21tL01ha2VmaWxlICAgICB8
IDIgKy0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkKPgo+IC0tCj4gU2luY2VyZWx5IHlvdXJzLAo+IE1pa2UuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
