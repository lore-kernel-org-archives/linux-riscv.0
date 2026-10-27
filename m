Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17448606A31E
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 18:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=grXfkJ6l;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=bCe0DApS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=89kdCmMJw1UIR9zcU1T+TWvJQpp/iUstmKWDI9QT00w=; b=grXfkJ6lmuv7/rsntO8JPaZJfS
	Wea71CNacuJbzrQujDf9RzJFrzNd5NAkvhIZtW/puS5Luj/skxKnnXVxDVSie2qodLuseiygge4s5
	D/q37Z6Ht9IAew7S76M/yJbdvmJyCAf2B9CmbpQEMx1zB5DD/w11cAaC2qrrjCfp9qJYdpDrxU+w/
	a//GIQt4Jc5e6iareW9573nJs3AoIoJxbm3DOUm7FeiR5+zqjOT1h07QGhSqUV6CSsq+KZiHoeq5/
	M8lssKkUKe1Q994h4P1qoMj7ksALMl73U2Pj1JDx/aom7odKcaD5O5HX3zrjwzjAl+bXmK+KJ0ZQp
	bA+peRtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLlrr-00000005YnQ-0r56;
	Tue, 27 Oct 2026 18:25:51 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLlrl-00000005Ylw-3ued;
	Tue, 27 Oct 2026 18:25:49 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261027182540euoutp01808e2a0784b22e974d6c8ffe88c8195c~idi3U5q2O1070810708euoutp01J;
	Tue, 27 Oct 2026 18:25:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261027182540euoutp01808e2a0784b22e974d6c8ffe88c8195c~idi3U5q2O1070810708euoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793125540;
	bh=yYVnZVngw4wIyvUedHrp/RCi4DEk87r28LIRWXpCLH0=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=bCe0DApSTMa5hEEGgVvneqzfJYakD7qrG9r1rRA787dJcmFkxZeM041kJvQzf1sWi
	 mFAb6eOSUU0Yw/Y6KAUriZpeXdgumQlCNkdGsLLdF/sfW7mYHnWBx2d7wOenrOEkLR
	 zJJaDP1dZxSCFavYWwIcrbMKnu0ZvjvRL33YUuUE=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261027182539eucas1p2af97fa5bad6b7de6ca761cb86172737b~idi2gJHhp1120011200eucas1p2b;
	Tue, 27 Oct 2026 18:25:39 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261027182538eusmtip2789b0e5587293524b9c364f453c89396~idi03PmTX1528615286eusmtip2f;
	Tue, 27 Oct 2026 18:25:38 +0000 (GMT)
Message-ID: <5fec923f-36bb-4dcc-bf3a-13be3eaa8f83@samsung.com>
Date: Tue, 27 Oct 2026 19:25:37 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 19/20] riscv: dts: starfive: jh7110: Update DT for
 display subsystem
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss
	<rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>, Andy
	Yan <andy.yan@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>, Emil
	Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Dominique
	Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>, Jerome
	Brunet <jbrunet+clk@baylibre.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	mfd@lists.linux.dev, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org, Marek Szyprowski
	<m.szyprowski@samsung.com>, Maud Spierings <maud_spierings@murena.io>,
	Graham Markall <hello@big-grey.co.uk>, Chaoyi Chen
	<chaoyi.chen@rock-chips.com>, Joshua Peisach <jpeisach@ubuntu.com>,
	=?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <b5eb69f3f41a98b5a98694435df25a632babf05a.camel@iscas.ac.cn>
X-CMS-MailID: 20261027182539eucas1p2af97fa5bad6b7de6ca761cb86172737b
X-Msg-Generator: CA
X-RootMTR: 20260915153248eucas1p27d8d2c9fa536bbd951e0102b04416dad
X-EPHeader: CA
X-CMS-RootMailID: 20260915153248eucas1p27d8d2c9fa536bbd951e0102b04416dad
References: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
	<CGME20260915153248eucas1p27d8d2c9fa536bbd951e0102b04416dad@eucas1p2.samsung.com>
	<20260915-jh7110-clean-send-v4-19-f0e4fd6f2cc8@samsung.com>
	<b5eb69f3f41a98b5a98694435df25a632babf05a.camel@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_112546_575882_C87A890E 
X-CRM114-Status: GOOD (  23.57  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CgpPbiA5LzI5LzI2IDE3OjA2LCBJY2Vub3d5IFpoZW5nIHdyb3RlOgo+IOWcqCAyMDI2LTA5LTE1
5LqM55qEIDE3OjMyICswMjAw77yMTWljaGFsIFdpbGN6eW5za2nlhpnpgZPvvJoKPj4gQWN0aXZh
dGUgdGhlIGRpc3BsYXkgc3Vic3lzdGVtIGJ5IGRlc2NyaWJpbmcgdGhlIHZpZGVvIG91dHB1dAo+
PiBzdWJzeXN0ZW0sCj4+IHdoaWNoIHRoZSBkb2N1bWVudGF0aW9uIGNhbGxzIGRvbV92b3V0X3Rv
cCwgYXMgYSBidXMgbm9kZSBjb3ZlcmluZwo+PiB0aGUKPj4gd2hvbGUgMHgyOTQwMDAwMCByZWdp
b24sIHdpdGggZGM4MjAwLCB0aGUgSERNSSBibG9jaywgdGhlIHZpZGVvCj4+IG91dHB1dAo+PiBz
eXN0ZW0gY29udHJvbGxlciBhbmQgdm91dGNyZyBhcyBpdHMgY2hpbGRyZW4uCj4+Cj4+IFRoZSBz
dWJzeXN0ZW0gbm9kZSBvd25zIHRoZSByZXNvdXJjZXMgaXRzIGNoaWxkcmVuIHNoYXJlOiB0aGUg
Tm9DCj4+IGRpc3BsYXkKPj4gYnVzIGNsb2NrIGFuZCByZXNldCB0aGF0IGdhdGUgYWNjZXNzIHRv
IGV2ZXJ5IHJlZ2lzdGVyIGluIHRoZSByZWdpb24sCj4+IGFuZAo+PiB0aGUgUERfVk9VVCBwb3dl
ciBkb21haW4uIE1vZGVsbGluZyBpdCB0aGlzIHdheSBrZWVwcyBhIHNoYXJlZCBnYXRlCj4+IG93
bmVkCj4+IGJ5IHRoZSBibG9jayB0aGF0IHNoYXJlcyBpdCByYXRoZXIgdGhhbiBieSB3aGljaGV2
ZXIgY29uc3VtZXIgaGFwcGVucwo+PiB0bwo+PiBwcm9iZSBmaXJzdCwgYW5kIGxldHMgZGM4MjAw
IGluaGVyaXQgZG1hLW5vbmNvaGVyZW50IGZvciBmcmFtZWJ1ZmZlcgo+PiBETUEKPj4gZnJvbSB0
aGUgYnVzIGl0IHNpdHMgb24uCj4+Cj4+IFRoZSBtb25vbGl0aGljIGhkbWkgbm9kZSBpcyBpbiB0
dXJuIG1vZGVsbGVkIGFzIGEgY29udGFpbmVyIHdpdGgKPj4gaGRtaV9waHkKPj4gYW5kIGhkbWlf
Y29udHJvbGxlciBjaGlsZHJlbi4gVGhpcyBsZXRzIHRoZSBQSFkgKGNsb2NrIHByb3ZpZGVyLAo+
PiBkZXBlbmRpbmcgb25seSBvbiB4aW4yNG0pIGFuZCB0aGUgY29udHJvbGxlciAoY2xvY2sgY29u
c3VtZXIpIHByb2JlCj4+IGluZGVwZW5kZW50bHksIGJyZWFraW5nIHRoZSBjaXJjdWxhciBjbG9j
ayBkZXBlbmRlbmN5IHdpdGggdm91dGNyZy4KPj4KPj4gdm91dGNyZyBjb25zdW1lcyB0aGUgcGl4
ZWwgY2xvY2sgZnJvbSB0aGUgJmhkbWlfcGh5IG5vZGUgaW5zdGVhZCBvZgo+PiB0aGUKPj4gb2xk
IGZpeGVkLWNsb2NrLCBhbmQgZGM4MjAwIGdldHMgaXRzIHBpeGVsIGNsb2NrcyBmcm9tIHZvdXRj
cmcncwo+PiBNVVhlcy4KPj4gVGhlIG9sZCwgaW5jb3JyZWN0IGhkbWl0eDAtcGl4ZWwtY2xvY2sg
Zml4ZWQtY2xvY2sgbm9kZSBpcyByZW1vdmVkLgo+Pgo+PiBUaGUgSERNSSBjb250cm9sbGVyIGdl
dHMgYSBwaGFuZGxlIHRvIHRoZSB2aWRlbyBvdXRwdXQgc3lzdGVtCj4+IGNvbnRyb2xsZXIsCj4+
IHdoaWNoIGhvbGRzIHRoZSBtdXggc2VsZWN0aW5nIHRoZSBEQzgyMDAgb3V0cHV0IHRoYXQgZHJp
dmVzIHRoZSBIRE1JCj4+IHRyYW5zbWl0dGVyLgo+Pgo+PiBDTUEgaXMgZW5sYXJnZWQgYW5kIGNv
bnN0cmFpbmVkIHRvIG1lbW9yeSB0aGUgZGlzcGxheSBjb250cm9sbGVyIGNhbgo+PiBhZGRyZXNz
LCBiZWNhdXNlIHRoZSBkZWZhdWx0IHBvb2wgaXMgdG9vIHNtYWxsIGZvciBpdHMgZnJhbWVidWZm
ZXJzLgo+Pgo+PiBDby1kZXZlbG9wZWQtYnk6IERvbWluaXF1ZSBCZWxoYWNoZW1pIDxkYkBkb21p
YmVsLmRlPgo+PiBTaWduZWQtb2ZmLWJ5OiBEb21pbmlxdWUgQmVsaGFjaGVtaSA8ZGJAZG9taWJl
bC5kZT4KPj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIFdpbGN6eW5za2kgPG0ud2lsY3p5bnNraUBz
YW1zdW5nLmNvbT4KPiAKPiBgYGAKPiBUZXN0ZWQtYnk6IEljZW5vd3kgWmhlbmcgPHpoZW5neGlu
Z2RhQGlzY2FzLmFjLmNuPgo+IGBgYAo+IAo+IEJ1dCwKPiAKPj4gLS0tCj4+ICBhcmNoL3Jpc2N2
L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC1jb21tb24uZHRzaSB8IDEyMQo+PiArKysrKysrKysr
KysrKysrKysrKysrKy0KPj4gIGFyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLmR0
c2kgICAgICAgIHwgMTA1Cj4+ICsrKysrKysrKysrKysrKystLS0tCj4+ICAyIGZpbGVzIGNoYW5n
ZWQsIDIwMyBpbnNlcnRpb25zKCspLCAyMyBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLWNvbW1vbi5kdHNpCj4+IGIvYXJj
aC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtY29tbW9uLmR0c2kKPj4gaW5kZXgKPj4g
YTdhMWMwOWEyYzkwNzU3MTFmM2EyMTRhNDk2MTg5MTFmZGM3YjQyMS4uYTRjM2RhZjcxMmE2M2Ix
NzdmNzQ0ZThjNjEzCj4+IDQxNmQyMmUwYzlkYmQgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3Yv
Ym9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLWNvbW1vbi5kdHNpCj4+ICsrKyBiL2FyY2gvcmlzY3Yv
Ym9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLWNvbW1vbi5kdHNpCj4+IEBAIC0zMyw2ICszMywyNyBA
QCBtZW1vcnlANDAwMDAwMDAgewo+PiAgCQlib290cGgtcHJlLXJhbTsKPj4gIAl9Owo+PiAgCj4+
ICsJcmVzZXJ2ZWQtbWVtb3J5IHsKPj4gKwkJI2FkZHJlc3MtY2VsbHMgPSA8Mj47Cj4+ICsJCSNz
aXplLWNlbGxzID0gPDI+Owo+PiArCQlyYW5nZXM7Cj4+ICsKPj4gKwkJLyoKPj4gKwkJICogVGhl
IGRpc3BsYXkgY29udHJvbGxlciBhbGxvY2F0ZXMgaXRzIGZyYW1lYnVmZmVycwo+PiBmcm9tIENN
QSwKPj4gKwkJICogYW5kIHRoZSBkZWZhdWx0IHBvb2wgaXMgdG9vIHNtYWxsIGZvciB0aGVtLiBL
ZWVwCj4+IHRoZSBwb29sCj4+ICsJCSAqIGluc2lkZSB0aGUgcmFuZ2UgdGhlIGNvbnRyb2xsZXIg
Y2FuIGFkZHJlc3M7IGl0Cj4+IGZpdHMgaW4gdGhlCj4+ICsJCSAqIG1lbW9yeSBldmVyeSBWaXNp
b25GaXZlIDIgdmFyaWFudCBoYXMuCj4+ICsJCSAqLwo+PiArCQlsaW51eCxjbWEgewo+PiArCQkJ
Y29tcGF0aWJsZSA9ICJzaGFyZWQtZG1hLXBvb2wiOwo+PiArCQkJcmV1c2FibGU7Cj4+ICsJCQlz
aXplID0gPDB4MCAweDIwMDAwMDAwPjsKPj4gKwkJCWFsaWdubWVudCA9IDwweDAgMHgxMDAwPjsK
Pj4gKwkJCWFsbG9jLXJhbmdlcyA9IDwweDAgMHg3MDAwMDAwMCAweDAKPj4gMHgyMDAwMDAwMD47
Cj4+ICsJCQlsaW51eCxjbWEtZGVmYXVsdDsKPj4gKwkJfTsKPj4gKwl9Owo+PiArCj4gCj4gSSBk
b24ndCBrbm93IHdoZXRoZXIgY29uc3RyYWluaW5nIHRoZSBDTUEgcG9vbCBpbiB0aGUgRFQgaXMg
YSBnb29kCj4gaWRlYS4KPiAKPiBUaGFua3MsCj4gSWNlbm93eQo+CgpTbyBJJ3ZlIHRlc3RlZCB0
aGUgdmVyc2lvbiB3aXRob3V0IGFsbG9jLXJhbmdlcyBhbmQgc29tZSBvZiB0aGUgbW9kZXRlc3QK
cnVucyBmYWlsZWQgZXNwZWNpYWxseSB0aGUgaGlnaGVyIHJlc29sdXRpb25zLiBJdCBzZWVtcyB0
aGlzIGlzIGJlY2F1c2UKd2l0aG91dCBhbGxvYy1yYW5nZXMgX19yZXNlcnZlZF9tZW1fYWxsb2Nf
c2l6ZSgpIGFsbG9jYXRlcyB0b3AgZG93biB3aXRoCk1FTUJMT0NLX0FMTE9DX0FOWVdIRVJFIHNv
IHRoZSBwb29sIGxhbmRzIGFib3ZlIDQgR0IsIHdoaWNoIHRoZSBEQzgyMDAKY2Fubm90IHJlYWNo
IC0gdnNfZGMuYyBzZXRzIGEgMzItYml0IERNQSBtYXNrLgoKMjUgb2YgdGhlIDQyIGFkdmVydGlz
ZWQgbW9kZXMgZmFpbGVkIHdpdGggImZhaWxlZCB0byBjcmVhdGUgZHVtYiBidWZmZXI6CkNhbm5v
dCBhbGxvY2F0ZSBtZW1vcnkiIC0gZXZlcnkgNEsgYW5kIDEwODBwIG1vZGUsIGRvd24gdG8gMTM2
MHg3NjguCk9ubHkgMTI4MHg4MDAgYW5kIGJlbG93IHN1cnZpdmUuCgpTbyB0aGUgcmFuZ2Ugc2Vl
bXMgdG8gYmUgYSBoYXJkd2FyZSBsaW1pdCB3aGljaCBpcyB3aHkgSSB0aGluayBpdApiZWxvbmdz
IGluIHRoZSBEVC4gSSdkIGxpa2UgdG8ga2VlcCBpdCBpbiB2Ni4KCkJlc3QgcmVnYXJkcywKLS0g
Ck1pY2hhbCBXaWxjenluc2tpIDxtLndpbGN6eW5za2lAc2Ftc3VuZy5jb20+CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
