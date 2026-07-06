Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF2DC43458
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 17:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cOzmJb7ZwH+lKPhRyfnzzGmYLj6s9+WcmWxIjPYHXbY=; b=V+QYW4qVKLB7b2
	jru3Rc7XvUgAai4YMzok6XW1STtLgvRJU4sB3qEriAVyJ0l4OFFxcIpVwnAUA1Sk2AqsVdxCpJc5v
	P7hvLmwbGUkScCDt4iDHeSPkif8/xJe33/PD+sngIw8JIuMHZWstEzJqB+OE2qVvEofEvhFyqFkRy
	9/b9D5auNyHgsKLFbmtKyWvekC9udP23y1jrchYJsBegsSWFls3rUpqZoJcJHoOYzYed+8+0qM0+Y
	X1IbLPGOapB0lrArUfq8AjZCuVCy497tZkmqNrErGpz26ITYPIxoeLpfunati2TyUtEerirbdpk8R
	l5Fh7xceU+//Ul1Dth1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmxJ-0000000DBJ4-0xhh;
	Mon, 06 Jul 2026 17:18:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmxI-0000000DBIY-2Ay1
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 17:18:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C2C09600DA
	for <linux-riscv@lists.infradead.org>; Mon,  6 Jul 2026 17:18:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 798A31F01558
	for <linux-riscv@lists.infradead.org>; Mon,  6 Jul 2026 17:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783358282;
	bh=6SzTceFp/6u/0U2ZsHukaDCb4DvB8gNfQxW2S2HmJSM=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=BwY1eDXK2casDflWj7FpxvSTaOUpF6I6RaUtfHX7uDXoOmvURB5vkHOFZ3pHN4mYY
	 YSGGZqwOvbbnTMbL4JbqmeosKm3zElo1oh74xaK2cuIPRsJrRkelv0KgiuijDYQDgk
	 jgkYTEOpsGsJKokmMJTN1q62s5tlSsBGpk+W8KAwQb+UN/LjcAfyhblYIeGfZWFvTR
	 sbwG67ET6OUBfimy9x3NQAU/oXqkl5hFQGoxEbLS3JhRqqidEAQlkCbmy/TtOZqqjw
	 mkqCCDLRDVkIqJHK62uiDjZ+hSojZjY67Rp5rHGYmscPI7iUW7H3YtnulR/weGeQvB
	 rh6bbe2+N/ipg==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39b1026e171so32252971fa.1
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jul 2026 10:18:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpdFlAjo2Vtu/uJzzajZo8r0pix+FgT9yPHIYzIk6rK/dVnsdiFpZlQHqNdd+0eU1ums9BLJ6TeRaVshQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyrXuddbbbIWT7HoMr5nKF7m5VFfiFunNeNJniaCaxK5wjp0q5y
	X4qYlLbVCgoro75I6zXLt3iBbqDQuVDh9L0pyxHp5wHwTUDMkLiVM4FvUF7DEH5y4DyyuoYfERs
	q8VHTguDKSQGW++lXHMBv+wbRkwRedQI=
X-Received: by 2002:a2e:a99d:0:b0:39a:fec6:efd0 with SMTP id
 38308e7fff4ca-39c5ffae1cfmr4021431fa.23.1783358280803; Mon, 06 Jul 2026
 10:18:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260606205452.2386930-1-lukas.schmid@netcube.li> <178335762241.4010120.15331558144606875972.b4-ty@kernel.org>
In-Reply-To: <178335762241.4010120.15331558144606875972.b4-ty@kernel.org>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 7 Jul 2026 01:17:45 +0800
X-Gmail-Original-Message-ID: <CAGb2v66nsmz63tMUpkb_p6nXGCtvVSX4z8tJ0Ojg_6md0sY=KA@mail.gmail.com>
X-Gm-Features: AVVi8Cfs5u3u3Le8rfmIs2akFxo6f5Cg5zKm8U8X3Ch8xkPrjuDD5gQk7w4gesM
Message-ID: <CAGb2v66nsmz63tMUpkb_p6nXGCtvVSX4z8tJ0Ojg_6md0sY=KA@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Add support for NetCube Systems OpenNMC (dobermann)
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Maxime Ripard <mripard@kernel.org>, 
	Lukas Schmid <lukas.schmid@netcube.li>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
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
Reply-To: wens@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKdWwgNywgMjAyNiBhdCAxOjA34oCvQU0gQ2hlbi1ZdSBUc2FpIDx3ZW5zQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gU2F0LCAwNiBKdW4gMjAyNiAyMjo1NDo0MCArMDIwMCwgTHVr
YXMgU2NobWlkIHdyb3RlOgo+ID4gVGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciB0aGUgTmV0
Q3ViZSBTeXN0ZW1zIE9wZW5OTUMuCj4gPgo+ID4gU29ycnkgZm9yIHRoZSBxdWljayByZXNlbmQu
IFRoaXMgdjQgaW5jbHVkZXMgdGhlIGNvcnJlY3RlZCBNYWtlZmlsZQo+ID4gdGFyZ2V0IG5hbWUu
Cj4gPgo+ID4gQ2hhbmdlcyBpbiB2NDoKPiA+ICAtIGZpeCB0aGUgQVJNIE1ha2VmaWxlIHRhcmdl
dCBuYW1lIGZvciB0aGUgbmV3IGJvYXJkCj4gPgo+ID4gWy4uLl0KPgo+IEFwcGxpZWQgdG8gc3Vu
eGkvZHQtZm9yLTcuMyBpbiBzdW54aSwgdGhhbmtzIQo+Cj4gWzEvM10gZHQtYmluZGluZ3M6IGFy
bTogc3VueGk6IEFkZCBOZXRDdWJlIFN5c3RlbXMgT3Blbk5NQyAoZG9iZXJtYW5uKQo+ICAgICAg
IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvc3VueGkvbGludXgvYy85OTk1YzgxNDZiYjkKPiBbMi8z
XSByaXNjdjogZHRzOiBhbGx3aW5uZXI6IGQxcy10MTEzOiBBZGQgdWFydDQgcGluY3RybCByZXF1
aXJlZCBieSBOZXRDdWJlIFN5c3RlbXMgT3Blbk5NQwo+ICAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvc3VueGkvbGludXgvYy81YjBmZDc3N2ViMzQKPiBbMy8zXSBBUk06IGR0czogc3VueGk6
IGFkZCBzdXBwb3J0IGZvciBOZXRDdWJlIFN5c3RlbXMgT3Blbk5NQyAoZG9iZXJtYW5uKQo+ICAg
ICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvc3VueGkvbGludXgvYy85ZGM0NWIxN2ZiODUKCkZv
cmNlIHB1c2hlZCB0aGlzIG9uZSB0byBjaGFuZ2UgInN1bnhpIiB0byAiYWxsd2lubmVyIi4KCj4K
PiBCZXN0IHJlZ2FyZHMsCj4gLS0KPiBDaGVuLVl1IFRzYWkgPHdlbnNAa2VybmVsLm9yZz4KPgo+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
