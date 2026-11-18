Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B37606A330
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 11:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=piu1TW5W;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jbob620V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kToVp+H3uKYhWUj8aU4w/6om69LIDXrEMelH7OZlSog=; b=piu1TW5WXpW3kR5eRv6njUoPXl
	vucMlkT02kpODHHK+v/EK6AaTpXDUHXf5zF065vVLhYDBu1jkkT5gyPwzq4Kb9cUEaxUMIQeHFZ3Q
	kpg+GPOn3LJ3v8IURsD+SvJ28jrrEcvCRqh0xnHbAmzTl+4Ct+SEY5BjaxrgvskaFFZJGw8HbLv9+
	3NzFfnzDPV8GnHilC99y7y0qcSSUbISwI9AtgRLHrY6aBNmpT0AYTov+w8YdISdakiXCpoN02lgaE
	c1C/D7qUX8kgz7CQqPw6ZHtN4b+I8pxkmvvk8d/ja6L2l9FuI5q44iryFivpn7OF2F+x/1TPvJ9VL
	unGeRRqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTddW-00000008gv0-1Wjh;
	Wed, 18 Nov 2026 11:15:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTddU-00000008gur-4A8C
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 11:15:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2E51040AD2;
	Wed, 18 Nov 2026 11:15:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46CBC1F000C4;
	Wed, 18 Nov 2026 11:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795000532;
	bh=mngIjZvCePCgtonRcZIH7Xi6DzPuq+feV13etfIWIOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Jbob620VKGRo6cBpg0LtKAoarODTFedMQDRm3UzTcQ4MA6e26aJoO+2OZXrjhnIRq
	 cVvAsGBH8TXHGO8TQaZ+KF6EpjfdUhAFULfwG0VpTBXBpmMd3Yabk5msMhIhmFRuNU
	 iINEo0jSw0/zjW8zSv6Q9ycNgRlD+HWLHwD/6qsCcv5NjAOfeR/rlBtNY5+2TiJX7d
	 0kDOeYJJhxzlKAoyNX5rLLgcKFF4LyuJDbc+dZjL+dRz2YOPGAap/f0hImIzbj2qGm
	 KBSIQ1xmCVk8msc8in+jAmC0SUMfXe4tbcqbx0T/D9VZTkaE2eFvWieriG2w11H0+0
	 b0jiBvcVHQ7YQ==
Date: Wed, 18 Nov 2026 11:15:28 +0000
From: Yixun Lan <dlan@kernel.org>
To: =?utf-8?B?RnLDqWTDqXJpYyBNYWjDqQ==?= <frederic.mahe@cirad.fr>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.co>,
	Haylen Chu <heylenay@4d2.org>,
	Hung-Chun Tseng <alan.tseng.cs@gmail.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] clk: spacemit: k1: Keep pll1_aud_245p7 enabled
Message-ID: <20261118111528-GKD156369@kernel.org>
References: <20261117205951.140146-1-frederic.mahe@cirad.fr>
 <20261117205951.140146-3-frederic.mahe@cirad.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261117205951.140146-3-frederic.mahe@cirad.fr>
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgRnLDqWTDqXJpYywKCkkgd2lsbCBmb3J3YXJkIHRvIFNwYWNlbWlUIHBlb3BsZSwgYW5kIGFz
ayB0aGVtIHRvIGNsYXJpZnkuLgoKT24gMjE6NTkgVHVlIDE3IE5vdiAgICAgLCBGcsOpZMOpcmlj
IE1haMOpIHdyb3RlOgo+IEFjY2Vzc2VzIHRvIHRoZSBSQ1BVMiBibG9jayAoMHhjMDg4ODAwMCkg
aGFuZyBvbmNlIHBsbDFfYXVkXzI0NXA3IGlzCkFjY2VzcyB3aGljaCByZWdpc3Rlcj8gaXMgdGhl
IFBXTSByZWdpc3RlciBpbiBSQ1BVMj8KCj4gZ2F0ZWQ6IHRoZSBDUFUgc3RvcHMgcmVzcG9uZGlu
ZywgZXZlbiB0byBOTUlzLiBOb3RoaW5nIGNsYWltcyB0aGlzCj4gY2xvY2sgaW4gbWFpbmxpbmUs
IHNvIGNsa19kaXNhYmxlX3VudXNlZCgpIHR1cm5zIGl0IG9mZiBhdCBib290LCBhbmQKPiBwcm9i
aW5nIGFuIFJDUFUyIFBXTSBhZnRlcndhcmRzIGhhbmdzIHRoZSBib2FyZC4gVGhlIFJDUFUyIGNs
b2NrIGFuZAo+IHJlc2V0IHJlZ2lzdGVycyBsaXZlIGluIHRoZSBzYW1lIGJsb2NrLgo+IApVc3Vh
bGx5IGFjY2VzcyBJUCBibG9jayB3aXRoIGNsb2NrIGdhdGVkIG9mZiB3aWxsIGNhdXNlIHN5c3Rl
bSBidXMgaGFuZywKZXhhY3RseSB0aGUgc2FtZSBzY2VuYXJpbyBhcyB5b3Ugc2VlIGhlcmUuLgoK
PiBNYXJrIGl0IGNyaXRpY2FsLCBhcyB3YXMgZG9uZSBmb3IgdGhlIEszIFJDUFUgY2xvY2suCj4g
Ckl0IGp1c3QgaGFwcGVuIHRvIGZpeCB0aGUgaXNzdWUsIGJ1dCBkb2Vzbid0IHNvdW5kIGxpa2Ug
YSBjb3JyZWN0IGZpeCwKdXN1YWxseSwgaXQgY2FuIGJlIGZpeGVkIHdpdGggY29ycmVjdCBjbG9j
ayB0b3BvbG9neSAKCj4gVGVzdGVkIG9uIGEgQlBJLUYzOiB3aXRob3V0IHRoaXMsIHByb2Jpbmcg
YW4gUkNQVTIgUFdNIGhhbmdzIHRoZQo+IGJvYXJkOyB3aXRoIGl0LCBubyBoYW5nLCBhbHNvIHdp
dGggbm8gUFdNIGluIHVzZS4KPiAKLi4KPiBXcml0dGVuIHdpdGggaGVscCBmcm9tIENsYXVkZSAo
QW50aHJvcGljKTsgcmV2aWV3ZWQgYW5kIHRlc3RlZCBvbiBoYXJkd2FyZS4KPiAKbWF5YmUganVz
dCAiQXNzaXN0ZWQtYnk6IExMTSIKCj4gU2lnbmVkLW9mZi1ieTogRnLDqWTDqXJpYyBNYWjDqSA8
ZnJlZGVyaWMubWFoZUBjaXJhZC5mcj4KPiAtLS0KPiAgZHJpdmVycy9jbGsvc3BhY2VtaXQvY2N1
LWsxLmMgfCAzICsrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL3NwYWNlbWl0L2NjdS1rMS5jIGIv
ZHJpdmVycy9jbGsvc3BhY2VtaXQvY2N1LWsxLmMKPiBpbmRleCBkZWUxNGQyNWYuLjM2NDM4OGZm
OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2Nsay9zcGFjZW1pdC9jY3UtazEuYwo+ICsrKyBiL2Ry
aXZlcnMvY2xrL3NwYWNlbWl0L2NjdS1rMS5jCj4gQEAgLTYwLDcgKzYwLDggQEAgQ0NVX0ZBQ1RP
Ul9HQVRFX0RFRklORShwbGwxX2QxMV8yMjNwNCwgQ0NVX1BBUkVOVF9IVyhwbGwxKSwgQVBCU19Q
TEwxX1NXQ1IyLCBCSVQKPiAgQ0NVX0ZBQ1RPUl9HQVRFX0RFRklORShwbGwxX2QxM18xODksIEND
VV9QQVJFTlRfSFcocGxsMSksIEFQQlNfUExMMV9TV0NSMiwgQklUKDE2KSwgMTMsIDEpOwo+ICBD
Q1VfRkFDVE9SX0dBVEVfREVGSU5FKHBsbDFfZDIzXzEwNnA4LCBDQ1VfUEFSRU5UX0hXKHBsbDEp
LCBBUEJTX1BMTDFfU1dDUjIsIEJJVCgyMCksIDIzLCAxKTsKPiAgQ0NVX0ZBQ1RPUl9HQVRFX0RF
RklORShwbGwxX2Q2NF8zOHA0LCBDQ1VfUEFSRU5UX0hXKHBsbDEpLCBBUEJTX1BMTDFfU1dDUjIs
IEJJVCgwKSwgNjQsIDEpOwo+IC1DQ1VfRkFDVE9SX0dBVEVfREVGSU5FKHBsbDFfYXVkXzI0NXA3
LCBDQ1VfUEFSRU5UX0hXKHBsbDEpLCBBUEJTX1BMTDFfU1dDUjIsIEJJVCgxMCksIDEwLCAxKTsK
PiArQ0NVX0ZBQ1RPUl9HQVRFX0ZMQUdTX0RFRklORShwbGwxX2F1ZF8yNDVwNywgQ0NVX1BBUkVO
VF9IVyhwbGwxKSwgQVBCU19QTEwxX1NXQ1IyLCBCSVQoMTApLCAxMCwgMSwKPiArCQkJICAgICBD
TEtfSVNfQ1JJVElDQUwpOwo+ICBDQ1VfRkFDVE9SX0dBVEVfREVGSU5FKHBsbDFfYXVkXzI0cDUs
IENDVV9QQVJFTlRfSFcocGxsMSksIEFQQlNfUExMMV9TV0NSMiwgQklUKDExKSwgMTAwLCAxKTsK
PiAgCj4gIENDVV9GQUNUT1JfR0FURV9ERUZJTkUocGxsMl9kMSwgQ0NVX1BBUkVOVF9IVyhwbGwy
KSwgQVBCU19QTEwyX1NXQ1IyLCBCSVQoMCksIDEsIDEpOwo+IC0tIAo+IDIuNDcuMwo+IAoKLS0g
CllpeHVuIExhbiAoZGxhbikKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
