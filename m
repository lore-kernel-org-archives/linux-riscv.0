Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07E2606B75F
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 01:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R52NDyRw;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M/dGdlwo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5BQzx9C7x7J0tx+1NVAk7A6GfZEJP0F17bflkqfW1Cc=; b=R52NDyRw8ZIYp0eXqi4yH8IL0G
	ymitE4B+rxZl7+6NVFv50I+zx4h3HU+aOfWA2P5KakHSeJBvBQ08d0z8vztv7LYTmNoTjEJnWl9tk
	78MZjpdhATLGGX3K4KAjAdkrnXeMkW1UoFZN5LfnJXqTAK44yspIoExbcKWskHem1THw0S0fRrWEZ
	9DqCtP+mYAe366hSISmjj9EUhhrxrZqOM7g28iUHlfQS5fLwlP294r+6lNxAOl6RSCYF3w0bEfqNK
	9fSB6rG4bQq9TiO8vvG2Dcl0os7nUtAO9SQmzMYuyR4k/2W6Lezk61E83YI3/yAa/EHB2dRlh14oB
	66RinckA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNzC-0000000Bl9v-2Brt;
	Thu, 26 Nov 2026 01:09:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNzB-0000000Bl9T-2BDS
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 01:09:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E82FC46389;
	Thu, 26 Nov 2026 01:09:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B4F41F01565;
	Thu, 26 Nov 2026 01:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795655356;
	bh=cVZCQS/sAiVsiL05n511eoHB+ur+m2IPgrOc1YWdYcc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M/dGdlwobXAE77EcYDesM+vVZmuAa57R+0n2LOOCMuXgRfZd4YiOEAYjlLYGftKFm
	 8y/UceQUlPIAisK/TJXQrPQ4dPC0oCcoWRklaKqckUOte+ANqxiny7KKQhvPr4gZ7Z
	 1i+HRqSMoJ4d8DpOaEBIIzwZ5PcSJUeXZN6BaHJ0/3C1Pii6MXbSfVCTzgb64YJQnn
	 2AH1V6t0qJBTEmNV1aCiUSsg9NOTfL5+U3kYw8eCav7jeidItN4Beajn5zgzKCJgLo
	 R5pOJhcGe0QlBQXhoSU6YWrCPljWH1GCrOIvUz0Xh58YI6WTZA2VeL/jQKlETfYyei
	 lV3RG4rUAYNBA==
Date: Thu, 26 Nov 2026 01:09:14 +0000
From: Yixun Lan <dlan@kernel.org>
To: =?utf-8?B?RnLDqWTDqXJpYyBNYWjDqQ==?= <frederic.mahe@cirad.fr>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Yao Zi <me@ziyao.cc>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Haylen Chu <heylenay@4d2.org>,
	Hung-Chun Tseng <alan.tseng.cs@gmail.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] clk: spacemit: k1: Keep pll1_aud_245p7 enabled
Message-ID: <20261126010914-GKN100890@kernel.org>
References: <20261117205951.140146-3-frederic.mahe@cirad.fr>
 <20261118111528-GKD156369@kernel.org>
 <20261118171536.197538-1-frederic.mahe@cirad.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261118171536.197538-1-frederic.mahe@cirad.fr>
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgRnLDqWTDqXJpYywKCk9uIDE4OjE1IFdlZCAxOCBOb3YgICAgICwgRnLDqWTDqXJpYyBNYWjD
qSB3cm90ZToKPiBIaSBZaXh1biwKPiAKPiBUaGFua3MgZm9yIGZvcndhcmRpbmcgaXQgdG8gU3Bh
Y2VtaVQuCj4gCj4gT24gV2VkLCBOb3YgMTgsIDIwMjYgYXQgMTE6MTU6MjhBTSArMDAwMCwgWWl4
dW4gTGFuIHdyb3RlOgo+ID4gQWNjZXNzIHdoaWNoIHJlZ2lzdGVyPyBpcyB0aGUgUFdNIHJlZ2lz
dGVyIGluIFJDUFUyPwo+IAo+IE5vLCB0aGUgaGFuZyBjb21lcyBiZWZvcmUgYW55IFBXTSByZWdp
c3RlciBhY2Nlc3MuIFRoZSBQV00gcHJvYmUKPiBmaXJzdCBkZWFzc2VydHMgdGhlIHJlc2V0IGFu
ZCBlbmFibGVzIHRoZSBjbG9jaywgYm90aCBpbgo+IFJDUFUyX1BXTTJfQ0xLX1JTVCAoMHhjMDg4
ODAwOCwgaW4gdGhlIHN5c2Nvbl9yY3B1MiByYW5nZSksIGFuZCB0aGF0Cj4gYWNjZXNzIGhhbmdz
LiBUaGUgUFdNIHJlZ2lzdGVycyAoMHhjMDg4ODMwMCkgYXJlIG5ldmVyIHJlYWNoZWQuIEkKPiBo
YXZlIG5vdCB0ZXN0ZWQgZWFjaCByZWdpc3RlciBvbiBpdHMgb3duIChldmVyeSBoYW5nIG5lZWRz
IGEgcG93ZXIKPiBjeWNsZSksIGJ1dCBJIGNhbiBkbyBpdCBpZiB0aGF0IGhlbHBzLgo+IAo+ID4g
SXQganVzdCBoYXBwZW4gdG8gZml4IHRoZSBpc3N1ZSwgYnV0IGRvZXNuJ3Qgc291bmQgbGlrZSBh
IGNvcnJlY3QgZml4LAo+ID4gdXN1YWxseSwgaXQgY2FuIGJlIGZpeGVkIHdpdGggY29ycmVjdCBj
bG9jayB0b3BvbG9neQo+IAo+IEFncmVlZC4gVGhlIHZlbmRvciBrZXJuZWwgbmV2ZXIgZ2F0ZXMg
dGhpcyBjbG9jayBlaXRoZXIKPiAoQ0xLX0lHTk9SRV9VTlVTRUQgaW4gY2N1LXNwYWNlbWl0LWsx
eC5jKS4gSWYgcGxsMV9hdWRfMjQ1cDcgaXMgdGhlCj4gYnVzIGNsb2NrIG9mIHRoZSBSQ1BVMiBi
bG9jaywgaXQgY291bGQgYmVjb21lIGEgY2xvY2sgb2YgdGhlCj4gc3lzY29uX3JjcHUyIG5vZGUs
IGFuZCB0aGUgQ0NVIGRyaXZlciB3b3VsZCBlbmFibGUgaXQgYmVmb3JlIGl0cwo+IGZpcnN0IHJl
Z2lzdGVyIGFjY2Vzcy4gSSB3aWxsIHdhaXQgZm9yIFNwYWNlbWlUJ3MgYW5zd2VyIGJlZm9yZSB2
Mi4KPiAKClllcywgVmVuZG9yIGNvbmZpcm0gcGxsMV9hdWRfMjQ1cDcgaXMgYnVzIGNsb2NrIGZv
ciBSQ1BVMiBibG9jaywKQWdyZWUgdG8gZXhwbGljaXRseSByZXF1ZXN0IHRoZSBjbG9jayBpbiBz
eXNjb25fcmNwdTIsIHNvbWV0aGluZwoKICAgICBzeXNjb25fcmNwdTI6IHN5c3RlbS1jb250cm9s
bGVyQGMwODg4MDAwIHsKICAgICAgICAgY29tcGF0aWJsZSA9ICJzcGFjZW1pdCxrMS1zeXNjb24t
cmNwdTIiOwogICAgICAgICByZWcgPSA8MHgwIDB4YzA4ODgwMDAgMHgwIDB4Mjg+OwogICAgICAg
ICBjbG9ja3MgPSA8JnBsbCBDTEtfUExMMV9EMTBfQVVEPjsKCSBjbG9jay1uYW1lcyA9ICJidXMi
OwogICAgICAgICAjcmVzZXQtY2VsbHMgPSA8MT47CiAgICAgfTsKCiAtIHJlc2V0LXNwYWNlbWl0
LWNvbW1vbi5jOgogICAgICAgY2xrID0gZGV2bV9jbGtfZ2V0X29wdGlvbmFsX2VuYWJsZWQoZGV2
LCAiYnVzIik7CiAgICAgICBpZiAoSVNfRVJSKGNsaykpCiAgICAgICAgICAgICAgIHJldHVybiBk
ZXZfZXJyX3Byb2JlKGRldiwgUFRSX0VSUihjbGspLAogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAiZmFpbGVkIHRvIGVuYWJsZSBidXMgY2xvY2tcbiIpOwoKLS0gCllpeHVuIExh
biAoZGxhbikKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
