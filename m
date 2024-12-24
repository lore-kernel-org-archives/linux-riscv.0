Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED383E77188
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Dec 2024 13:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zNvHfsDREMU0xaVXbPQJJtkMiWkZW2iLQLD4EFeStPQ=; b=3LUXOjeZZdG04w
	yjMMooD7UZaATfgjwjdBNrulBuplXvxlx01CT2b0cIpwBCj8P2iC9h8PAjl6AFpSwC9HePH1IyoQN
	6UjCqqyo3guAF0Wh4zcomBLjjH/jRWxQeEF8giWOIq7/EkSF+ru8KpDgWVLGbAJ2RV6gkzenFzyz4
	H+XbkaDUJ4r2ulNi/xbqj9fo80YD9g5MALhmFFk7Sbow3lKdRgs+Nf/76LcHapSfZb5JR6+qZb7gy
	YP9pRc8LD3z9nhUBS0sqZHx1Drb+dvvvsYfvCdyNqK9yFQsIx6NvaKA5NDGs2XwLfdUJE2bllsYpc
	IuIK+VTO42LfqTUO1w/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ52L-0000000C43e-3eWo;
	Tue, 24 Dec 2024 13:33:25 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ52J-0000000C42w-1iPn
	for linux-riscv@lists.infradead.org;
	Tue, 24 Dec 2024 13:33:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6B9ECA41578;
	Tue, 24 Dec 2024 13:31:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AF34C4CED0;
	Tue, 24 Dec 2024 13:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735047202;
	bh=iCylm2MRvv6PAKDEQXGNVZEgHIMFQpRlTrGrKOgYpeA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KC2xmTneRSFNwSAJp3+8iCsRqXaAFVJFSiPVeiE+x7IeYyahP4CRNOqrcVigGQ2X+
	 OMxLGycqlfZBJGVq9XTubCZ2Pjuh71d8E2MlJHLE6Z+gPo4QysVD8FtXZOJRkWSnCF
	 MW0ra5Tcr026pyup6Am4ik9LvUqxs8wZ+T+b0uolRA33fqVzijnFU5Q+ul67ITeoY6
	 vAhE/QyRrR0lEfhUlFv9QLMBfgE6E+nIKXJLbdMt8OYM5J6iC6RXNDK6+7EMzAPAsy
	 /evMujANNZdyALfkZ2KHylhHNmRi3CxNcHaifmkfNwCmaMsq946pFw6sc1KQD3Xb8o
	 BXBzXn+aZgE9A==
Message-ID: <24b7cb33-779c-447f-a080-5ed05cd7faf1@kernel.org>
Date: Tue, 24 Dec 2024 14:33:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 01/19] dt-bindings: clock: Add VO subsystem clocks
 and update address requirements
To: Michal Wilczynski <m.wilczynski@samsung.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: airlied@gmail.com, aou@eecs.berkeley.edu, conor+dt@kernel.org,
 drew@pdp7.com, frank.binns@imgtec.com, guoren@kernel.org,
 jassisinghbrar@gmail.com, jszhang@kernel.org, krzk+dt@kernel.org,
 m.szyprowski@samsung.com, maarten.lankhorst@linux.intel.com,
 matt.coster@imgtec.com, mripard@kernel.org, mturquette@baylibre.com,
 p.zabel@pengutronix.de, palmer@dabbelt.com, paul.walmsley@sifive.com,
 robh@kernel.org, simona@ffwll.ch, tzimmermann@suse.de,
 ulf.hansson@linaro.org, wefu@redhat.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
References: <20241223125553.3527812-1-m.wilczynski@samsung.com>
 <CGME20241223125601eucas1p1d274193122638075dc65310a22616bae@eucas1p1.samsung.com>
 <20241223125553.3527812-2-m.wilczynski@samsung.com>
 <2cd0c34fbd14a0d69e689d04c2241938.sboyd@kernel.org>
 <wjet4yvtcobjaf7c4u7to6rm3ppkvmgyitp6evoqjpndtno6qg@h5xxyukph6y6>
 <c17c75c0-ef13-48df-9095-67fbf31bb817@samsung.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <c17c75c0-ef13-48df-9095-67fbf31bb817@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_053323_595476_1425858B 
X-CRM114-Status: GOOD (  14.27  )
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

T24gMjQvMTIvMjAyNCAxMDoyMywgTWljaGFsIFdpbGN6eW5za2kgd3JvdGU6Cj4gCj4gCj4gT24g
MTIvMjQvMjQgMDk6NTMsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4+IE9uIE1vbiwgRGVj
IDIzLCAyMDI0IGF0IDEyOjUwOjU5UE0gLTA4MDAsIFN0ZXBoZW4gQm95ZCB3cm90ZToKPj4+IFF1
b3RpbmcgTWljaGFsIFdpbGN6eW5za2kgKDIwMjQtMTItMjMgMDQ6NTU6MzUpCj4+Pj4gVGhlIFQt
SGVhZCBUSDE1MjAgU29D4oCZcyBBUCBjbG9jayBjb250cm9sbGVyIG5vdyBuZWVkcyB0d28gYWRk
cmVzcyByYW5nZXMKPj4+PiB0byBtYW5hZ2UgYm90aCB0aGUgQXBwbGljYXRpb24gUHJvY2Vzc29y
IChBUCkgYW5kIFZpZGVvIE91dHB1dCAoVk8pCj4+Pj4gc3Vic3lzdGVtIGNsb2Nrcy4gVXBkYXRl
IHRoZSBkZXZpY2UgdHJlZSBiaW5kaW5ncyB0byByZXF1aXJlIHR3byBgcmVnYAo+Pj4+IGVudHJp
ZXMsIG9uZSBmb3IgdGhlIEFQIGNsb2NrcyBhbmQgb25lIGZvciB0aGUgVk8gY2xvY2tzLgo+Pj4+
Cj4+Pj4gQWRkaXRpb25hbGx5LCBpbnRyb2R1Y2UgbmV3IFZPIHN1YnN5c3RlbSBjbG9jayBjb25z
dGFudHMgaW4gdGhlIGhlYWRlcgo+Pj4+IGZpbGUuIFRoZXNlIGNvbnN0YW50cyB3aWxsIGJlIHVz
ZWQgYnkgdGhlIGRyaXZlciB0byBjb250cm9sIFZPLXJlbGF0ZWQKPj4+PiBjb21wb25lbnRzIHN1
Y2ggYXMgZGlzcGxheSBhbmQgZ3JhcGhpY3MgdW5pdHMuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5
OiBNaWNoYWwgV2lsY3p5bnNraSA8bS53aWxjenluc2tpQHNhbXN1bmcuY29tPgo+Pj4+IC0tLQo+
Pj4gWy4uLl0KPj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Nsb2NrL3RoZWFkLHRoMTUyMC1jbGstYXAueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9jbG9jay90aGVhZCx0aDE1MjAtY2xrLWFwLnlhbWwKPj4+PiBpbmRleCAw
MTI5YmQwYmE0YjMuLmYwZGY5N2E0NTBlZiAxMDA2NDQKPj4+PiAtLS0gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svdGhlYWQsdGgxNTIwLWNsay1hcC55YW1sCj4+Pj4g
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL3RoZWFkLHRoMTUy
MC1jbGstYXAueWFtbAo+Pj4+IEBAIC00Nyw3ICs1NCw5IEBAIGV4YW1wbGVzOgo+Pj4+ICAgICAg
I2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL3RoZWFkLHRoMTUyMC1jbGstYXAuaD4KPj4+PiAg
ICAgIGNsb2NrLWNvbnRyb2xsZXJAZWYwMTAwMDAgewo+Pj4+ICAgICAgICAgIGNvbXBhdGlibGUg
PSAidGhlYWQsdGgxNTIwLWNsay1hcCI7Cj4+Pj4gLSAgICAgICAgcmVnID0gPDB4ZWYwMTAwMDAg
MHgxMDAwPjsKPj4+PiArICAgICAgICByZWcgPSA8MHhlZjAxMDAwMCAweDEwMDA+LAo+Pj4+ICsg
ICAgICAgICAgICAgIDwweGZmMDEwMDAwIDB4MTAwMD47Cj4+Pgo+Pj4gSSBkb24ndCBnZXQgaXQu
IFdoeSBub3QgaGF2ZSB0d28gbm9kZXMgYW5kIHR3byBkZXZpY2VzPyBUaGV5IGhhdmUKPj4+IGRp
ZmZlcmVudCByZWdpc3RlciByZWdpb25zIHNvIGxpa2VseSB0aGV5J3JlIGRpZmZlcmVudCBkZXZp
Y2VzIG9uIHRoZQo+Pj4gaW50ZXJuYWwgU29DIGJ1cy4gVGhleSBtYXkgaGF2ZSB0aGUgc2FtZSBp
bnB1dCBjbGtzLCBidXQgb3RoZXJ3aXNlIEkKPj4+IGRvbid0IHNlZSBob3cgdGhleSdyZSB0aGUg
c2FtZSBub2RlLgo+Pgo+PiBUaGF0J3MgYSBnb29kIHBvaW50LiBBcmVuJ3QgaGVyZSBzaW1wbHkg
dHdvIGRpZmZlcmVudCBjbG9jayBjb250cm9sbGVycz8KPiAKPiBZZWFoIHRoZXJlIGFyZSB0d28g
Y2xvY2sgY29udHJvbGxlcnMsIGJhc2VkIG9uIHRoZSByZXZpZXcgY29tbWVudHMgSSB3YXMKPiB0
cnlpbmcgdG8gcmUtdXNlIHRoZSBkcml2ZXIsIGJ1dCB0aGUgZHJpdmVyIGNhbiBhbHNvIGJlIHJl
LXVzZWQgdG8gc2VydmUKPiBtdWx0aXBsZSBub2RlcyBhbmQgbXVsdGlwbGUgY29tcGF0aWJsZSBh
bmQgLmRhdGEgcHJvcGVydGllcywgaWYgdGhhdCdzCj4gZmluZSB3aXRoIHlvdSB0aGF0J3MgaG93
IGl0IHdpbGwgbG9vayBsaWtlIGluIHYzLgpZZWFoLCBwbGVhc2UgZHJvcCBteSByZXZpZXcgdGFn
IGFuZCByZXdvcmsgaXQgdG8gaGF2ZSB0d28gZGlmZmVyZW50CmRldmljZXMuIERyaXZlciBkZXNp
Z24gc2hvdWxkIG5vdCBpbmZsdWVuY2UgRFRTLgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
