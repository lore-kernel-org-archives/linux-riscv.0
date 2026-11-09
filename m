Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97C56083608
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 16:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F4rbakQ2;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KD5dyefz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8Fc4ux3w3Lz3a71xiI/noV2G/GJd4jg3s8TDfbg8dbo=; b=F4rbakQ2l3iRRD2YrBfmjsBO0v
	Ok1scThwJA9PZr3jE1c8H0AdiOtjUd7bICZhUO8ckmGY7zVFFZVNXjTmHDWVztp55ZIazEG3VS5ZC
	Pc9ZzfULDqMzn02C8bi/MTz+NdNxe+kQws1uUdAEe++KhJcVCDSjYbBHcSyzCrX+CRN6r7vWwYNay
	pw6ysx4rh1vlRCQ10YSu/OrNP3Hcy6e8Nv3nKA9gBKv60RwIeA+3HhzIl4k/u+VfmapkKN8ADYh1I
	i4w15Hfy85ipeULd2ebirVSXV4MZbn0W45Sj6jy6mJ9xotb18akl2v/x9QOEkHRUsxU54+JFiFguH
	91+yO9bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRmr-000000016vY-0Ik9;
	Mon, 09 Nov 2026 16:00:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRmp-000000016vK-2MrO
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 15:59:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F240943AC2
	for <linux-riscv@lists.infradead.org>; Mon,  9 Nov 2026 15:59:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D58851F008A4
	for <linux-riscv@lists.infradead.org>; Mon,  9 Nov 2026 15:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794239998;
	bh=x8+hwW/5zTCinXQlt6chk8M/+naLfTi9oCAtj9giEx8=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=KD5dyefz39IkPX3UpaTum/KOpvhWYH/QEA84LmJrf9FC2cuEL9j27K7ebX+wB04bn
	 oz+hE/n+itAL2Mlh2FfHeaaui09M0oTGZnVfo4S/iV30QmPH1l28Cqht4sdZLHteOX
	 +9teyevkdSyq5Owz2qgKH+u8e+A7cyy+ZCdE87MC0ReVVAaIcK3bCLzvF4EH43+fwK
	 Pw4+dTJjHeRvRnhGfhhojYkKJAanwC6ZR73d8gyrgUX4ZlZGoulWzKVi31L/2QMksM
	 IPDqOR6IbAF39fOdp2z09X4iZG5tveGk3+H6S1WLFQfR+Ni1To7yGvYDhSsy1bgSk2
	 ZTHjWY7vAc0lA==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3adf87fc0c6so7113921fa.0
        for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2026 07:59:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGBifsLiWoWFzU7UdltGJYEe5fxTPxm9/r5JAP9haFkUf02szg2/5bm/CIQfB+edcYIJjIx5rLV6cQOyg==@lists.infradead.org
X-Gm-Message-State: APuU4Z9ovypgN5QhjxDP/d048hZ3HhaAzS4LVpPWZ0t4GxMUOpjbA6I4
	xEIYB8r5M4eQ8OuPUi4cCgVvTCl3WN02Zm43rqSjb8jef21ncmYazMT8KrTR3suHDux8yhzFh6Q
	GSQcZ/yob3uv4ZQOmti+WsuX7wIuttDE=
X-Received: by 2002:a05:651c:e17:b0:3a8:7b84:be96 with SMTP id
 38308e7fff4ca-3adfa482a5cmr11743561fa.27.1794239997190; Mon, 09 Nov 2026
 07:59:57 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech> <20261009-a733-clk-v6-5-ae8178fce7e8@pigmoral.tech>
In-Reply-To: <20261009-a733-clk-v6-5-ae8178fce7e8@pigmoral.tech>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 10 Nov 2026 00:59:44 +0900
X-Gmail-Original-Message-ID: <CAGb2v66PV8nKSoU+4qA6Z6AS62V0xkuPBjKSy=jUf7Oh0=bv6w@mail.gmail.com>
X-Gm-Features: AclHuK9QXxwYcsEJa5-pvHGGLGfB5fBZTAKpVeZDXOjgDPABVDtQI4CTaoQK7OI
Message-ID: <CAGb2v66PV8nKSoU+4qA6Z6AS62V0xkuPBjKSy=jUf7Oh0=bv6w@mail.gmail.com>
Subject: Re: [PATCH v6 5/8] clk: sunxi-ng: a733: Add bus clocks support
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, netdev@vger.kernel.org, 
	Jerome Brunet <jbrunet@baylibre.com>, Enzo Adriano <enzo.adriano.code@gmail.com>, 
	Andre Przywara <andre.przywara@arm.com>, Norman Herms <dockseed@proton.me>, 
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: wens@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU2F0LCBPY3QgMTAsIDIwMjYgYXQgMTI6NTTigK9BTSBKdW5odWkgTGl1IDxqdW5odWkubGl1
QHBpZ21vcmFsLnRlY2g+IHdyb3RlOgo+Cj4gQWRkIHRoZSBlc3NlbnRpYWwgYnVzIGNsb2NrcyBp
biB0aGUgQWxsd2lubmVyIEE3MzMgQ0NVLCBpbmNsdWRpbmcgQUhCLAo+IEFQQjAsIEFQQjEsIEFQ
Ql9VQVJULCBhbmQgTUJVUy4gVGhlc2UgYnVzZXMgYXJlIG5lY2Vzc2FyeSBmb3IgbWFueSBvdGhl
cgo+IGZ1bmN0aW9uYWwgbW9kdWxlcy4gQWRkaXRpb25hbCBjbG9ja3Mgc3VjaCBhcyB0cmFjZSBh
bmQgZ2ljIGFyZSBhbHNvCj4gYWRkZWQgYXMgdGhleSBmYWxsIHdpdGhpbiB0aGUgcmVnaXN0ZXIg
YWRkcmVzcyByYW5nZSBvZiB0aGUgYnVzIGNsb2NrcywKPiBldmVuIHRob3VnaCB0aGV5IGFyZSBu
b3Qgc3RyaWN0bHkgYnVzIGNsb2Nrcy4KPgo+IFRoZSBNQlVTIGNsb2NrIGlzIG1hcmtlZCBhcyBj
cml0aWNhbCB0byBlbnN1cmUgdGhlIG1lbW9yeSBidXMgcmVtYWlucwo+IG9wZXJhdGlvbmFsIGF0
IGFsbCB0aW1lcy4gQW5kIHRoZSBoYXJkd2FyZSByZXF1aXJlcyBhbiB1cGRhdGUgYml0Cj4gKGJp
dCAyNykgdG8gYmUgc2V0IHNvIHRoYXQgdGhlIGNvbmZpZ3VyYXRpb24gdGFrZXMgZWZmZWN0IGFu
ZCB0aGUKPiB1cGRhdGVkIHBhcmFtZXRlcnMgY2FuIGJlIGNvcnJlY3RseSByZWFkIGJhY2sgZm9y
IHRoZSBNQlVTIGNsb2NrLgo+Cj4gVGhlIEdJQyBjbG9jayBpcyBhbHNvIG1hcmtlZCBhcyBjcml0
aWNhbC4gVGhlIGJvb3Rsb2FkZXIgbWF5IGxlYXZlIHRoZQo+IEdJQyBydW5uaW5nIG9uIGEgUExM
IHBhcmVudCwgYW5kIGRpc2FibGluZyB0aGF0IFBMTCBkdXJpbmcKPiBjbGtfZGlzYWJsZV91bnVz
ZWQgd291bGQgaGFuZyB0aGUgaW50ZXJydXB0IGNvbnRyb2xsZXIgYW5kIHRoZSBzeXN0ZW0uCj4K
PiBUZXN0ZWQtYnk6IEplcm9tZSBCcnVuZXQgPGpicnVuZXRAYmF5bGlicmUuY29tPgo+IFJldmll
d2VkLWJ5OiBDaGVuLVl1IFRzYWkgPHdlbnNAa2VybmVsLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBK
dW5odWkgTGl1IDxqdW5odWkubGl1QHBpZ21vcmFsLnRlY2g+Cj4gLS0tCj4gIGRyaXZlcnMvY2xr
L3N1bnhpLW5nL2NjdS1zdW42MGktYTczMy5jIHwgMTA4ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTA4IGluc2VydGlvbnMoKykKPgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2Nsay9zdW54aS1uZy9jY3Utc3VuNjBpLWE3MzMuYyBiL2RyaXZlcnMv
Y2xrL3N1bnhpLW5nL2NjdS1zdW42MGktYTczMy5jCj4gaW5kZXggMzM2ODgwMTA1M2VjLi4zNzFj
NDI5N2MzYWIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9jbGsvc3VueGktbmcvY2N1LXN1bjYwaS1h
NzMzLmMKPiArKysgYi9kcml2ZXJzL2Nsay9zdW54aS1uZy9jY3Utc3VuNjBpLWE3MzMuYwoKWy4u
Ll0KCj4gK3N0YXRpYyBTVU5YSV9DQ1VfTV9EQVRBX1dJVEhfTVVYX0dBVEUoZ2ljX2NsaywgImdp
YyIsIGdpY19wYXJlbnRzLCAweDU2MCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIDAsIDUsICAgICAvKiBNICovCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAyNCwgMywgICAgLyogbXV4ICovCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBCSVQoMzEpLCAgLyogZ2F0ZSAqLwo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgQ0xLX0lTX0NSSVRJQ0FMKTsKPiArCj4gK3N0YXRpYyBjb25zdCBzdHJ1
Y3QgY2xrX3BhcmVudF9kYXRhIG1idXNfcGFyZW50c1tdID0gewo+ICsgICAgICAgeyAuaHcgPSAm
c3lzXzI0TV9jbGsuaHcgfSwKPiArICAgICAgIHsgLmh3ID0gJnBsbF9wZXJpcGgxXzYwME1fY2xr
Lmh3IH0sCj4gKyAgICAgICB7IC5odyA9ICZwbGxfZGRyX2Nsay5jb21tb24uaHcgfSwKPiArICAg
ICAgIHsgLmh3ID0gJnBsbF9wZXJpcGgxXzQ4ME1fY2xrLmNvbW1vbi5odyB9LAo+ICsgICAgICAg
eyAuaHcgPSAmcGxsX3BlcmlwaDFfNDAwTV9jbGsuaHcgfSwKPiArICAgICAgIHsgLmh3ID0gJnBs
bF9ucHVfY2xrLmNvbW1vbi5odyB9LAo+ICt9OwoKRG9uJ3Qga25vdyB3aHkgSSBkaWRuJ3Qgc2Vl
IHRoaXMgZWFybGllciwgYnV0IG15IExMTSBhZ2VudCBmbGFnZ2VkIHRoaXMuCgpCYXNlZCBvbiB0
aGUgbWFudWFsICgxLjApIGFuZCBCU1Agc291cmNlcywgdGhlIHBlcmlwaCBQTEwgc291cmNlcyBh
cmUKZnJvbSBwZXJpcGgwLCBub3QgcGVyaXBoMS4KCk9uY2UgZml4ZWQsIG15IHJldmlldyBzdGFu
ZHMuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
