Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B34D606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 14:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZfdAAXrw;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=evi7clWU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CIsN4w/H5y0bOo44NzzwEMn36Ea65tAJtcavDRow3eU=; b=ZfdAAXrw06w0jSgR7NA2ATXbWE
	M1rv9buGnaSAZrFapiu9n+yvNMTI1gd+jjrWQ1D2PbZfo4yVwrBGutNtWDmZSt16sZOUspT9HBmsl
	wiLANmFTm+TOdDEyEHFg4rfDyE2+FNZBT6Ej2kivQkNeyoMiaYF8ubtm3JFo56h4+JOG+gOKkUCm1
	20VXqE8Aj99qdy4ZLKE4ZOlzpv4B0hbLr/6xy0vDCOBWVESr058nolxHOr2r6hzpqmmOtE6d5sKjz
	9sBIIEPvDOOi0oAU908EsyZwZXaYGZ1j/2sV55VhC8RjchmCQtNUSGUP0gV3XgCzoblcMLgQcF8Lz
	d0A2hQAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWGM-0000000AMN8-06gY;
	Thu, 12 Nov 2026 14:58:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWGH-0000000AMM8-43dk
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 14:58:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 159CC60E86
	for <linux-riscv@lists.infradead.org>; Thu, 12 Nov 2026 14:58:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDCC21F00A05
	for <linux-riscv@lists.infradead.org>; Thu, 12 Nov 2026 14:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794495528;
	bh=Ahp2R8XXPiuO6iEjfb6UKUnsMrVVlx0bOA5QMiN/SCg=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=evi7clWUqzfu5IwbwBr1JJlISMJDxPDhvh6uAAOyCg4ZnCnklbxu8+ZjPmsyAJp/0
	 aP8kAcEIz52VuMwJki7SyO4fuxYHvB3MavOJRR03w0bl2i7fAv32f91k/+09mGMrj3
	 iWt4HXcH3d0ZZxsnA6Rm9vsEqznM4YC0+n0a6kqqns3tv22HaO3JdV6Q+ZvJtYkBfF
	 h9guIvmInAtJSD2Thdtkqr1TC4gRLGYeJpVypaDuYlIneKDv92USZioY1YD+c92ZTM
	 GNRqYI1l0LabEgiidIKy/Ghen9POAU1/k4/CNgnT6u71WupklB+95qmRViP8rE0x3t
	 oi8M7RhZ7wVeQ==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3ae0d0b9db2so25589431fa.1
        for <linux-riscv@lists.infradead.org>; Thu, 12 Nov 2026 06:58:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHfdI6+XJoymktYD72igshkzymIy7Y629HCN2h99KFllUNhSBO/Hqkf/WKWfY9ZOw+EmjQaX9nyIE6cFg==@lists.infradead.org
X-Gm-Message-State: APuU4Z9P0Y5zVrmSLPd+7MNqw0jFHzwCJ2xup2hylk9Ze0VPkWa9qSqP
	RhvypHT2Sf4g88qN9coySxOZX6zlHC14EkAt+/0KtgpSlDUodi03YviSF25q0Ojxndp5BcU1duB
	+i4a5yPIV8geyho7RZc3sTiACGVOd9Yg=
X-Received: by 2002:a05:651c:e0c4:10b0:3ae:25db:795 with SMTP id
 38308e7fff4ca-3ae25db0827mr3381781fa.12.1794495527049; Thu, 12 Nov 2026
 06:58:47 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112-a733-clk-v7-0-db7c5451ffa2@pigmoral.tech> <20261112-a733-clk-v7-6-db7c5451ffa2@pigmoral.tech>
In-Reply-To: <20261112-a733-clk-v7-6-db7c5451ffa2@pigmoral.tech>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 12 Nov 2026 23:58:33 +0900
X-Gmail-Original-Message-ID: <CAGb2v64Ye4wEiE3y2msoFh1P5Cs7dvXQ_vESmVFEJ=qhkp9PVQ@mail.gmail.com>
X-Gm-Features: AclHuK-IX9I87FO9BVEBpEeLaHk1PETWtM0mWihOigloFLp60Bd_bejTc7ChEns
Message-ID: <CAGb2v64Ye4wEiE3y2msoFh1P5Cs7dvXQ_vESmVFEJ=qhkp9PVQ@mail.gmail.com>
Subject: Re: [PATCH v7 6/8] clk: sunxi-ng: a733: Add mod clocks support
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

SGksCgpPbiBUaHUsIE5vdiAxMiwgMjAyNiBhdCA0OjE14oCvUE0gSnVuaHVpIExpdSA8anVuaHVp
LmxpdUBwaWdtb3JhbC50ZWNoPiB3cm90ZToKPgo+IEFkZCB0aGUgbW9kdWxlIGNsb2NrcyBmb3Vu
ZCBpbiB0aGUgQWxsd2lubmVyIEE3MzMgU29DLCBpbmNsdWRpbmcgdmlkZW8sCj4gc3RvcmFnZSwg
aW50ZXJmYWNlcyBhbmQgb3RoZXJzLiBXaGlsZSBtb3N0IG9mIHRoZXNlIGNsb2NrcyBhcmUgc2lt
aWxhcgo+IHRvIHRob3NlIGluIHRoZSBBNTIzIFNvQywgdGhpcyBpbXBsZW1lbnRhdGlvbiBhY2Nv
dW50cyBmb3IgY2hhbmdlcyBpbgo+IHJlZ2lzdGVyIG9mZnNldHMgYW5kIGludHJvZHVjZXMgc3Vw
cG9ydCBmb3IgbmV3IG1vZHVsZXMuCj4KPiBUZXN0ZWQtYnk6IEplcm9tZSBCcnVuZXQgPGpicnVu
ZXRAYmF5bGlicmUuY29tPgo+IFRlc3RlZC1ieTogVmluaWNpdXMgUGVkcm9zYSA8dmluaWNpdXMu
ZWR1YXJkby5wZWRyb3NhQGdtYWlsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKdW5odWkgTGl1IDxq
dW5odWkubGl1QHBpZ21vcmFsLnRlY2g+Cj4gLS0tCj4gIGRyaXZlcnMvY2xrL3N1bnhpLW5nL2Nj
dS1zdW42MGktYTczMy5jIHwgMTA4NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+
ICAxIGZpbGUgY2hhbmdlZCwgMTA4NyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9jbGsvc3VueGktbmcvY2N1LXN1bjYwaS1hNzMzLmMgYi9kcml2ZXJzL2Nsay9zdW54aS1u
Zy9jY3Utc3VuNjBpLWE3MzMuYwo+IGluZGV4IDhiYzYwMzM5M2Y1YS4uNWVhNjViZjViNWUwIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvY2xrL3N1bnhpLW5nL2NjdS1zdW42MGktYTczMy5jCj4gKysr
IGIvZHJpdmVycy9jbGsvc3VueGktbmcvY2N1LXN1bjYwaS1hNzMzLmMKClsuLi5dCgo+ICtzdGF0
aWMgU1VOWElfQ0NVX01fSFdfV0lUSF9NVVhfR0FURShpMnNwY20yX2FzcmNfY2xrLCAiaTJzcGNt
Ml9hc3JjIiwgaTJzcGNtMl9hc3JjX3BhcmVudHMsIDB4MTIyNCwKClRoaXMgYW5kIHRoZSBjc2kg
bWFzdGVyIGNsb2NrcyBsYXRlciBoYXZlIGFuIHVuZGVyc2NvcmUgaW4gdGhlIGNsayBuYW1lIHN0
cmluZy4KVGhleSBzaG91bGQgaGF2ZSBoeXBoZW5zIGluc3RlYWQuIEkgd2lsbCBmaXggaXQgd2hl
biBJIGFwcGx5IHRoZSBwYXRjaGVzLgpObyBuZWVkIHRvIHJlc2VuZCBqdXN0IGZvciB0aGlzLgoK
PiArc3RhdGljIFNVTlhJX0NDVV9EVUFMRElWX01VWF9HQVRFKGNzaV9tYXN0ZXIwX2NsaywgImNz
aV9tYXN0ZXIwIiwgY3NpX21hc3Rlcl9wYXJlbnRzLCAweDE4MDAsCgpUaGlzIG9uZS4KCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDAsIDUsICAgICAgICAgLyogTSAqLwo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA4LCA1LCAgICAgICAgIC8qIE4gKi8KPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMjQsIDMsICAgICAgICAvKiBtdXggKi8K
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQklUKDMxKSwgICAgICAvKiBnYXRl
ICovCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDApOwo+ICtzdGF0aWMgU1VO
WElfQ0NVX0RVQUxESVZfTVVYX0dBVEUoY3NpX21hc3RlcjFfY2xrLCAiY3NpX21hc3RlcjEiLCBj
c2lfbWFzdGVyX3BhcmVudHMsIDB4MTgwNCwKClRoaXMgb25lLgoKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgMCwgNSwgICAgICAgICAvKiBNICovCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIDgsIDUsICAgICAgICAgLyogTiAqLwo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAyNCwgMywgICAgICAgIC8qIG11eCAqLwo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBCSVQoMzEpLCAgICAgIC8qIGdhdGUgKi8KPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgMCk7Cj4gK3N0YXRpYyBTVU5YSV9DQ1VfRFVBTERJ
Vl9NVVhfR0FURShjc2lfbWFzdGVyMl9jbGssICJjc2lfbWFzdGVyMiIsIGNzaV9tYXN0ZXJfcGFy
ZW50cywgMHgxODA4LAoKQW5kIHRoaXMgb25lLgoKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgMCwgNSwgICAgICAgICAvKiBNICovCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIDgsIDUsICAgICAgICAgLyogTiAqLwo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAyNCwgMywgICAgICAgIC8qIG11eCAqLwo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBCSVQoMzEpLCAgICAgIC8qIGdhdGUgKi8KPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgMCk7CgoKVGhlc2Ugd2VyZSBmbGFnZ2VkIGJ5IGEgcmV2aWV3IGFn
ZW50IGNvbXBhcmluZyB0aGUgZHJpdmVyIGFnYWluc3QgdGhlIGRhdGFzaGVldAphbmQgQlNQIGNv
ZGUuCgoKQ2hlbll1CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
