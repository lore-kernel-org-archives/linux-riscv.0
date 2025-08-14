Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E362DCA0EE0
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Aug 2025 03:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3SeJ9YHiivJg+JXtNrxxxjj5YRwfyySIqI1iPjyFO+Y=; b=ucgIi32T4BwhEv
	eaN6fZNMsnUYM9Q4SB93z+X7njhQzfVMNURHMzhPynnTgMm7hKYVkrxU3G115zHJkWsxP8b0pXknz
	EcktJrkZOqXBxLQ5/8IMFn/Yk0bfZ2XcBcFshqrlnOuqklQFrItio9ZTy7k1VhxT0ilpYRslotNFy
	7RFlnV1rugPxBxiljOyKAPHvgW49XBpMi+c2upLSVv/lqTx0Qe4wPoGr33CIk9mFQQPigaIBYqu+6
	GJKoISSpsPOplF3FybNcIgxpfWBT+XJeT5ahz/DlVO2mzZc4HvzLjAu0/pNEZKcDc+EXMflo45Z39
	KcxcYndgpg5mmrsfmKrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umOMJ-0000000FdTY-44bQ;
	Thu, 14 Aug 2025 03:10:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umOMG-0000000FdSv-2oRd
	for linux-riscv@lists.infradead.org;
	Thu, 14 Aug 2025 03:10:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 181BE45DBD
	for <linux-riscv@lists.infradead.org>; Thu, 14 Aug 2025 03:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F14B2C4CEF6
	for <linux-riscv@lists.infradead.org>; Thu, 14 Aug 2025 03:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755141028;
	bh=EhxvoJDEdXNbO/JDpXEfw4ZJIF5Vn/4NQDHkXy07FqM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lGHQOKCpHXTtqu4Mzt70guPgv4bm0WpN2nww+N4BjAjjzu8EHhBg3ycpX1Nw5IlVA
	 dPH0CWwQUyvPy2xBreX/9rBFCDth/uoXaDVDqKYsiUErETqZaI8kFzwyEguoFJJNzE
	 WDOIApEFbSggdkBtOQvcooFtI27IPkyJHK6htgIEITkCqViWPq/h803JY2T4pFRDzm
	 C4kaWB5husn+oMrFaW4NcJi1gKjrSkUMSSnygMZR574KiJB394Hy800ZDzQgaeTdVD
	 UDxhW283OvOkM++JTLOOLfWQsL1OHq7td0U+NPnTx/xRXLC+dpQdDmjMPXhrkdkK6+
	 X25UUaImD4psw==
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b9dc55d84bso339883f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Aug 2025 20:10:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVnRJbpNMLz+pBce6xpZGbuEYXKL/MBRFpYC5ur/wYPoqRBlUl1eikW3buHr5bln9012nTXS+4mIJVOUQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywa4/l72ZQWqL8LuVDxDnuzPI3CkmL0TUH/op+4FxK8Fa0ea4FG
	btV0TDqbPw8EoYe2HzNxGLIP097s6qCVCnrqIjLjDiEn9DfnrrLWUKzueEfPP/2AlH+V527Uqhg
	f6Td6o47J12ssUo1s5s4KjlcLEOiLbNo=
X-Google-Smtp-Source: AGHT+IEdDNM+oHvM0odMnS6iZu7bn6bpKV8KqHvBF/3W73fga0J3j8CYKIz5P8HqpkXsUOqPrFXZM6cI3pDyreGCKfg=
X-Received: by 2002:a05:6000:22c6:b0:3b4:9721:2b13 with SMTP id
 ffacd0b85a97d-3b9e4179d4emr1082182f8f.14.1755141026267; Wed, 13 Aug 2025
 20:10:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250813171136.2213309-1-uwu@icenowy.me> <eedd44480a76840e1fec73d4433c772c5bdc7011.camel@icenowy.me>
In-Reply-To: <eedd44480a76840e1fec73d4433c772c5bdc7011.camel@icenowy.me>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 14 Aug 2025 11:10:13 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQXR9W6G5ygvGVdH_iiynZ85E3c_XJ4HKj+_wWMnRpkpw@mail.gmail.com>
X-Gm-Features: Ac12FXziswa33lxyZbESbnI29DNxMMJPeobEtHWCp-qmsz_ElJcNnUvP2p8IeoE
Message-ID: <CAJF2gTQXR9W6G5ygvGVdH_iiynZ85E3c_XJ4HKj+_wWMnRpkpw@mail.gmail.com>
Subject: Re: [PATCH 0/2] clk: thead: th1520-ap: allow gate cascade and fix padctrl0
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Drew Fustini <fustini@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Yao Zi <ziyao@disroot.org>, 
	Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_201028_752447_6DC0D1E7 
X-CRM114-Status: GOOD (  17.94  )
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

VGhhbmtzIGZvciB0aGUgZml4dXAsIGRvbid0IGZvcmdldCB0aGUgIkZpeGVzIiB0YWcgYW5kIENj
IHN0YWJsZUBrZXJuZWwub3JnLgoKT3RoZXJzIExHVE0hCgpSZXZpZXdlZC1ieTogR3VvIFJlbiA8
Z3VvcmVuQGtlcm5lbC5vcmc+CgpPbiBUaHUsIEF1ZyAxNCwgMjAyNSBhdCAxOjE24oCvQU0gSWNl
bm93eSBaaGVuZyA8dXd1QGljZW5vd3kubWU+IHdyb3RlOgo+Cj4g5ZyoIDIwMjUtMDgtMTTmmJ/m
nJ/lm5vnmoQgMDE6MTEgKzA4MDDvvIxJY2Vub3d5IFpoZW5n5YaZ6YGT77yaCj4gPiBDdXJyZW50
IGNjdV9nYXRlIGltcGxlbWVudGF0aW9uIGRvZXMgbm90IGVhc2lseSBhbGxvdyBnYXRlcyB0byBi
ZQo+ID4gY2xvY2sKPiA+IHBhcmVudHMgYmVjYXVzZSBvZiB0aGUgd2FzdGUgb2Ygc3RydWN0IGNs
a19odyBpbiBzdHJ1Y3QgY2N1X2dhdGU7Cj4gPiBob3dldmVyIGl0J3MgZm91bmQgdGhhdCB0aGUg
cGFkY3RybDAgYXBiIGNsb2NrIGdhdGUgc2VlbXMgdG8gYmUKPiA+IGRvd25zdHJlYW0gb2YgcGVy
aXN5cy1hcGI0LWhjbGssIGdhdGluZyB0aGUgbGF0dGVyIHcvbyBnYXRpbmcgdGhlCj4gPiBmb3Jt
ZXIKPiA+IG1ha2VzIHRoZSBwYWRjdHJsMCByZWdpc3RlcnMgaW5hY2Nlc3NpYmxlIHRvby4KPiA+
Cj4gPiBGaXggdGhpcyBieSByZWZhY3RvciBjY3VfZ2F0ZSBjb2RlLCBtaW1pY2luZyB3aGF0IFlh
byBaaSBkaWQgb24KPiA+IGNjdV9tdXg7IGFuZCB0aGVuIGFzc2lnbiBwZXJpc3lzLWFwYjQtaGNs
ayBhcyBwYXJlbnQgb2YgcGFkY3RybDAgYnVzCj4gPiBnYXRlLgo+Cj4gRm9yZ290IHRvIG1lbnRp
b24gYSBlYXN5IHRlc3Qgb2YgdGhpcyBwYXRjaHNldDoKPgo+IEp1c3QgaW5zdGFsbCBgZ3Bpb3Nl
dGAgZnJvbSBgbGliZ3Bpb2RgIG9uIGEgTGljaGVlIFBpIDRBLCBwbHVnIGEgZmFuIHRvCj4gaXRz
IGZhbiBwb3J0LCBhbmQgcnVuIGBncGlvc2V0IDMgMz0xYC4gVGhlIGV4cGVjdGVkIGJlaGF2aW9y
IGlzIHRoZSBmYW4KPiBzdGFydHMgdG8gc3BpbiAoYmVjYXVzZSBHUElPM18zIGlzIHRoZSBwaW4g
Y29udHJvbGxpbmcgdGhlIGZhbiksCj4gaG93ZXZlciB3aXRob3V0IHRoaXMgcGF0Y2hzZXQgTGlu
dXggd2lsbCBmYWlsIHRvIHN3aXRjaCB0aGF0IHBpbi4KPgo+ID4KPiA+IFRoaXMgcGF0Y2hzZXQg
ZGVwZW5kcyBvbiB0aGUgZGlzcGxheSBjbG9jayBwYXRjaHNldCBhdCBbMV0sIGFsdGhvdWdoCj4g
PiBhCj4gPiByZWJhc2luZyB0byBnZXQgcmlkIG9mIHRoaXMgZGVwZW5kZW5jeSBpcyBwb3NzaWJs
ZS4KPiA+Cj4gPiBbMV0KPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIw
MjUwODEzMDcyNzAyLjIxNzY5OTMtMS11d3VAaWNlbm93eS5tZS8KPiA+Cj4gPiBJY2Vub3d5IFpo
ZW5nICgyKToKPiA+ICAgY2xrOiB0aGVhZDogdGgxNTIwLWFwOiBkZXNjcmliZSBnYXRlIGNsb2Nr
cyB3aXRoIGNsa19nYXRlCj4gPiAgIGNsazogdGhlYWQ6IHRoMTUyMC1hcDogZml4IHBhcmVudCBv
ZiBwYWRjdHJsMCBjbG9jawo+ID4KPiA+ICBkcml2ZXJzL2Nsay90aGVhZC9jbGstdGgxNTIwLWFw
LmMgfCAzODUgKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQo+ID4gLS0KPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgMTg4IGluc2VydGlvbnMoKyksIDE5NyBkZWxldGlvbnMoLSkKPiA+Cj4KCgotLSAK
QmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
