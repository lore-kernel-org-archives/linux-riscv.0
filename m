Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6291CCCF9E3
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Nov 2025 13:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Vd4+i7gOpec2fgGDHILWmsr4i1DGHaYUf9x61q9J5sU=; b=v7S0hzgVh4JU00ITxppNSIIFls
	i8U5Wpv3ZI1aYywPOw2G1ZSUV6dHAdLISPmoOzKKUSErsu1yc2E3JdHKL9F+rX6sLlr/cs/AKE0p5
	Py7dEyHTH8lDGqcA80UEqSgN3p5Ap0diRJBdr9Q9+p//U/sgWDn4xrr7LxvVcHPBqrNSfUVZYkSl2
	cKiwYPes8E48MJoPfd30ziPDqg0PEQx8idkT+fnUI5shnoPjLpRPip+cAp+Wb+7KiOJw1SkXg0bZI
	mEVB8xy32yZEjIuBxLXtFIjkVFC29sOOuvLFT+/7/fZgfOuQ9jFC8GmaXfMorOKRUXRYuUOO6cNDU
	BBympU8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHMaw-0000000HPYt-4An0;
	Fri, 07 Nov 2025 13:33:38 +0000
Received: from fout-a8-smtp.messagingengine.com ([103.168.172.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHMau-0000000HPYQ-4185
	for linux-riscv@lists.infradead.org;
	Fri, 07 Nov 2025 13:33:38 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 31B07EC0217;
	Fri,  7 Nov 2025 08:33:35 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 07 Nov 2025 08:33:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1762522415;
	 x=1762608815; bh=qoNTBri6BFoATER30Out59sX4XhuNxOT0sEiKlWHhZ0=; b=
	FTwDlunpfj+SJA80kY3vwi0QtIDIq6L+Is5CGmfWNH8y19dz+eUlaqLjH4ruYTbe
	gT0s7Hk+m+/GmQhqLUstFXZUNiWilFAq73kVOBrK6t4ifO9/R0mPBghcph17QJy0
	hAQk28Ut/WoRo6qfDtdpeC2ZIEmy82H6IWOs5Woo2tMlwixQQj1a2L7UNf/8X0c6
	AZHGPtxfy6FZx4CU0UHYJY9/2b8Apg4KZ7Azxjf0LMlMDlklVLRSyw4EZHoLtFAV
	TZhkcEJjG6bNW2NxXi5fHMBqmBOrBxTmOoVqwN28fstG4Y0hAm1choDBfN+LIsJ5
	7sVfpx7QUNL5RN1SMTaA1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762522415; x=
	1762608815; bh=qoNTBri6BFoATER30Out59sX4XhuNxOT0sEiKlWHhZ0=; b=O
	Ro5NbN6H+XulPdb2sFyYcTqSZuypntzCF9ZwxRPtuosbpaBPXAQ4CKehfT8vYnUp
	vZzbV/jeMPVywZQ9iQ7diea8FZp7vBTBZXVK7OHT32e+b2qO7TCl1gEUvy7K0fiO
	lZZKSpWYuP+pCyFBFiB+UULLXqKnCAaz3OSuV1A7CKxY3JRAivQRXTdgmuK3jwC0
	gCYc8RtVtnSFNxs2R7HnMkXpoIMcDOr0soOXXptIttgIikHj6j2jp/XxkqsXvloC
	1e0NHUKrlZUNfIzyCr6i64EpzgLIwGzjmcibcWT22VDy+YN6AHCtMTOnXveI9kvu
	0CZZgGHjzoOq88zUhhNDw==
X-ME-Sender: <xms:LPUNadRqk_rPMn1hC4PXa7X-2lmMEiH19pqmrO2zsLKTwFS9nWWOXg>
    <xme:LPUNaRnIvVGpXMcYJXJw0ZqScKHRawWPf75el4LHyHruTHS_p_qqItnA_p-icVxV1
    CDVtnEeLjSi7qYrVGHqb34ctM8MLQ-YiasX2z_BtWRqUePowAqC8SI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukeeljeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhope
    iiudeihedvtdejgeegfedvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrshgrhhhi
    rhhohieskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgr
    uggvrggurdhorhhgpdhrtghpthhtohepihesmhgrshhkrhgrhidrmhgvpdhrtghpthhtoh
    eprhhonhgsohhgohesohhuthhlohhokhdrtghomhdprhgtphhtthhopehlgidvgeesshht
    uhdrhihnuhdrvgguuhdrtghnpdhrtghpthhtohepfhgrlhgtohhnsehtihhnhihlrggsrd
    horhhg
X-ME-Proxy: <xmx:LPUNafhSVId5La2hoscRcYirzK6FithUJUQZaUQGQMEpiGwk78vZQg>
    <xmx:LPUNaYaj8i5_foyx7RioDe7mwbUfrAlkeugyV4mJE-zZsXLTQ4GEyg>
    <xmx:LPUNaTiVfTLz2adn1QX1_2WkS5b0HdNuufR2eGK6ZcrNY_k2aXI-mA>
    <xmx:LPUNaabtXfqp0Kx7yFtlaHs-KvqUZZdo_Q3BIS8KP--KNahFYFmpAA>
    <xmx:L_UNaX3xt1pHAgxJ5zDXSx9oglQ3DipmYV0h4djnA9p2AEwfMwXUfIkQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C8D5270006B; Fri,  7 Nov 2025 08:33:32 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A-HrBBL8x6OF
Date: Fri, 07 Nov 2025 14:33:12 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Yuan Tan" <tanyuan@tinylab.org>,
 "Masahiro Yamada" <masahiroy@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, linux-kbuild@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Linux-Arch <linux-arch@vger.kernel.org>, linux-kernel@vger.kernel.org,
 i@maskray.me, "Zhangjin Wu" <falcon@tinylab.org>, ronbogo@outlook.com,
 z1652074432@gmail.com, lx24@stu.ynu.edu.cn
Message-Id: <73010511-a804-4cf4-a5c1-1d08e3f324c5@app.fastmail.com>
In-Reply-To: <0BF8B2E83B6154B6+f17f32b4-f6ff-4184-917d-4b27fb916eae@tinylab.org>
References: <30C972B6393DBAC5+cover.1760463245.git.tanyuan@tinylab.org>
 <33333fdd-2aa2-4ce0-8781-92222829ea12@app.fastmail.com>
 <0BF8B2E83B6154B6+f17f32b4-f6ff-4184-917d-4b27fb916eae@tinylab.org>
Subject: Re: [PATCH v2 0/8] dce, riscv: Unused syscall trimming with PUSHSECTION and
 conditional KEEP()
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_053337_088634_B77DEB8E 
X-CRM114-Status: GOOD (  32.49  )
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

T24gVHVlLCBOb3YgNCwgMjAyNSwgYXQgMDM6MjEsIFl1YW4gVGFuIHdyb3RlOgoKPj4gU29ycnkg
Zm9yIHRoZSBsYXRlIHJlcGx5IOKAlCB0aGlzIHBhdGNoc2V0IHJlYWxseSB3b3JlIG1lIG91dCwg
YW5kIEkgb25seSBqdXN0Cj4+IHJlY292ZXJlZC4gIFRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHlv
dXIgZmVlZGJhY2shCgpTb3JyeSB0byBoZWFyIHRoaXMgaGFzIGJlZW4gc3RyZXNzZnVsIGZvciB5
b3UuIEl0J3MgYW4gdW5mb3J0dW5hdGUKYXNwZWN0IG9mIHRoZSB3YXkgd2Ugd29yayB0aGF0IHNv
bWV0aW1lcyAKCj4gT24gMTAvMTUvMjAyNSAxMjo0NyBBTSwgQXJuZCBCZXJnbWFubiB3cm90ZToK
Pj4gT24gV2VkLCBPY3QgMTUsIDIwMjUsIGF0IDA4OjE2LCBZdWFuIFRhbiB3cm90ZToKPj4gVGhh
bmtzIGEgbG90IGZvciB5b3VyIHdvcmsgb24gdGhpcy4gSSB0aGluayBpdCBpcyBpbmRlZWQgdmFs
dWFibGUgdG8KPj4gYmUgYWJsZSB0byBvcHRpbWl6ZSBrZXJuZWxzIHdpdGggYSBzbWFsbGVyIHN1
YnNldCBvZiBzeXN0ZW0gY2FsbHMgZm9yCj4+IGtub3duIHdvcmtsb2FkcywgYW5kIGhhdmUgYXMg
bXVjaCBkZWFkIGNvZGUgZWxpbWluYXRpb24gYXMgcG9zc2libGUuCj4+Cj4+IEhvd2V2ZXIsIEkg
Y29udGludWUgdG8gdGhpbmsgdGhhdCB0aGUgYWRkZWQgc2NyaXB0aW5nIHdpdGggYSBrbm93bgo+
PiBzZXQgb2Ygc3lzY2FsbCBuYW1lcyBpcyBmdW5kYW1lbnRhbGx5IHRoZSB3cm9uZyBhcHByb2Fj
aCB0byBnZXQgdG8KPj4gdGhpcyBsaXN0OiBUaGlzIGFkZHMgY29tcGxleGl0eSB0byB0aGUgYnVp
bGQgcHJvY2VzcyBpbiBvbmUgb2YKPj4gdGhlIGFyZWFzIHRoYXQgaXMgYWxyZWFkeSB0b28gY29t
cGxpY2F0ZWQsIGFuZCBpdCBkdXBsaWNhdGVzIHdoYXQKPj4gd2UgY2FuIGFscmVhZHkgZG8gd2l0
aCBLY29uZmlnIGZvciBhIHN1YnNldCBvZiB0aGUgc3lzdGVtIGNhbGxzLgo+Pgo+PiBJIHRoaW5r
IHRoZSB3YXkgd2Ugc2hvdWxkIGNvbmZpZ3VyZSB0aGUgc2V0IG9mIHN5c2NhbGxzIGluc3RlYWQg
aXMKPj4gdG8gYWRkIG1vcmUgS2NvbmZpZyBzeW1ib2xzIGd1YXJkZWQgYnkgQ09ORklHX0VYUEVS
VCB0aGF0IHR1cm4KPj4gY2xhc3NlcyBvZiBzeXNjYWxscyBvbiBvciBvZmYuIFlvdSBoYXZlIG9i
dmlvdXNseSBkb25lIHRoZSByZXNlYXJjaAo+PiB0byBjb21lIHVwIHdpdGggYSBsaXN0IG9mIHVz
ZWQvdW51c2VkIGVudHJ5IHBvaW50cyBmb3Igb25lIG9yIG1vcmUKPj4gd29ya2xvYWRzLiBDYW4g
eW91IHNoYXJlIHRob3NlIGxpc3RzPwo+Cj4gUmVnYXJkaW5nIHlvdXIgc3VnZ2VzdGlvbiB0byB1
c2UgS2NvbmZpZyB0byBjb250cm9sIHdoaWNoIHN5c3RlbSBjYWxscyBhcmUKPiBpbmNsdWRlZCBv
ciBleGNsdWRlZCwgcGVyaGFwcyB3ZSBjb3VsZCB0YWtlIGluc3BpcmF0aW9uIGZyb20gc3lzdGVt
ZCdzCj4gY2xhc3NpZmljYXRpb24gYXBwcm9hY2guIEZvciBleGFtcGxlLCBzeXN0ZW1kIGdyb3Vw
cyBzeXNjYWxscyBpbnRvIGNhdGVnb3JpZXMKPiBsaWtlWzFdOgo+Cj4gQGFpbyBAYmFzaWMtaW8g
QGNob3duIEBjbG9jayBAY3B1LWVtdWxhdGlvbiBAZGVidWcgQGZpbGUtc3lzdGVtCj4KPiBhbmQg
c28gb24uCgpJIHRoaW5rIG1hbnkgb2YgdGhlIGNhdGVnb3JpZXMgYWxyZWFkeSBuYXR1cmFsbHkg
YWxpZ24gd2l0aCB0aGUKc3RydWN0dXJlIG9mIHRoZSBrZXJuZWwgc291cmNlIGNvZGUsIHNvIG1h
aW50YWluaW5nIHRoZW0gbmF0dXJhbGx5IGNvbWVzCm91dCBvZiB0aGUgYnVpbGQgc3lzdGVtLgoK
TW9yZSBpbXBvcnRhbnRseSwgdHVybmluZyBvZmYgcGFydHMgb2YgdGhlIGtlcm5lbCBvbiBhIHBl
ci1maWxlCmJhc2lzIHRlbmRzIHRvIHdvcmsgYmV0dGVyIGZvciBlbGltaW5hdGluZyB0aGUgZW50
aXJlIGJsb2NrCm9mIGNvZGUgYmVjYXVzZSBvbmx5IHJlbW92aW5nIHRoZSBzeXNjYWxsIGVudHJ5
IHN0aWxsIGxlYXZlcwpyZWZlcmVuY2VzIHRvIGZ1bmN0aW9ucyBhbmQgZ2xvYmFsIGRhdGEgc3Ry
dWN0dXJlcyBmcm9tIGluaXRjYWxscwphbmQgZXhwb3J0ZWQgZnVuY3Rpb25zLgoKPiBIb3dldmVy
LCBpZiB3ZSBnbyBkb3duIHRoaXMgcm91dGUsIHdlIHdvdWxkIG5lZWQgdG8gY29udGludW91c2x5
IG1haW50YWluIGFuZAo+IHVwZGF0ZSB0aGVzZSBjYXRlZ29yaWVzIHdoZW5ldmVyIExpbnV4IGlu
dHJvZHVjZXMgbmV3IHN5c3RlbSBjYWxscy4gSScgbSBub3QKPiBzdXJlIHdoZXRoZXIgdGhhdCB3
b3VsZCBiZSBhbiBpZGVhbCBsb25nLXRlcm0gYXBwcm9hY2guCgpJZiB3ZSBjYW4gKGF0IGxlYXN0
IHJvdWdobHkpIGFsaWduIHRoZSBjYXRlZ29yaWVzIGJldHdlZW4gdGhlIGtlcm5lbCBhbmQgdGhl
CnN5c3RlbWQgY2xhc3NpZmljYXRpb24sIHRoYXQgd291bGQgYXQgbGVhc3QgbWFrZSBpdCBlYXNp
ZXIgdG8gbWFpbnRhaW4KdGhlIHN5c3RlbWQgb25lcy4KCj4gRm9yIHJlZmVyZW5jZSwgaGVyZSBp
cyB0aGUgbGlzdCBvZiBzeXNjYWxscyByZXF1aXJlZCB0byBydW4gTGlnaHR0cGQuCj4KPiBleGVj
dmUgc2V0X3RpZF9hZGRyZXNzIG1vdW50IHdyaXRlIGJyayBtbWFwIG11bm1hcCBnZXR1aWQgZ2V0
Z2lkIGdldHBpZAo+IGNsb2NrX2dldHRpbWUgZ2V0Y3dkIGZjbnRsIGZzdGF0IHJlYWQgZHVwMyBz
b2NrZXQgc2V0c29ja29wdCBiaW5kIGxpc3Rlbgo+IHJ0X3NpZ2FjdGlvbiBydF9zaWdwcm9jbWFz
ayBuZXdmc3RhdGF0IHBybGltaXQ2NCBlcG9sbF9jcmVhdGUxIGVwb2xsX2N0bCBwaXBlMgo+IGVw
b2xsX3B3YWl0IGFjY2VwdDQgZ2V0c29ja29wdCByZWN2ZnJvbSBzaHV0ZG93biB3cml0ZXYgZ2V0
ZGVudHM2NCBvcGVuYXQgY2xvc2UKPgo+IFdlJ3ZlIHRlc3RlZCBpdCBzdWNjZXNzZnVsbHkgb24g
UUVNVSArIGluaXRyYW1mcywgYW5kIEkgY2FuIHNoYXJlIHRoZQo+IGRlcGxveW1lbnQgc2NyaXB0
IGlmIGFueW9uZSB3b3VsZCBsaWtlIHRvIHJlcHJvZHVjZSB0aGUgc2V0dXAuCgpUaGFua3MgZm9y
IHRoZSBsaXN0ISBJcyB0aGlzIGEgd29ya2xvYWQgeW91IGFyZSBpbnRlcmVzdGVkIGluIGFjdHVh
bGx5Cm9wdGltaXppbmcgZm9yIGRlcGxveW1lbnQsIG9yIGp1c3Qgc29tZXRoaW5nIHlvdSB1c2Vk
IGFzIGEgc2ltcGxlIHRlc3QKZW52aXJvbm1lbnQ/CgpJIHNlZSB0aHJlZSB0eXBlcyBvZiBzeXNj
YWxscyBpbiB5b3VyIGxpc3QgYWJvdmU6CgoxLiBlc3NlbnRpYWwgb25lcyB0aGF0IGFyZSBiYXNp
Y2FsbHkgYWx3YXlzIG5lZWRlZAoyLiBzb2NrZXQgaW50ZXJmYWNlcyAoYWxyZWFkeSBvcHRpb25h
bCkKMy4gZXBvbGwgKGFscmVhZHkgb3B0aW9uYWwpCgpUaGUgZmlyc3QgdHdvIHNldHMgYXJlIGNs
ZWFybHkgZ29pbmcgdG8gaGF2ZSBtb3JlIHN5c2NhbGxzIGluCnRoZW0gdGhhdCBhcmUgdXN1YWxs
eSB1c2VkIGluIGNvbWJpbmF0aW9uIHdpdGggdGhlIG90aGVyczoKSWYgd2UgcHJvdmlkZSByZWFk
LCB3cml0ZSBhbmQgd3JpdGV2LCB3ZSBzaG91bGQgYWxzbyBwcm92aWRlIHJlYWR2LAphbmQgaWYg
d2UgcHJvdmlkZSBzb2NrZXQvYmluZC9saXN0ZW4vcmVjdmZyb20sIHdlIGFsc28gbGlrZWx5IHdh
bnQKYWNjZXB0L2Nvbm5lY3Qvc2VuZHRvIGFuZCBwcm9iYWJseSByZWN2bXNnL3NlbmRtc2cuCgpT
dGFydGluZyB3aXRoIHlvdXIgc2V0IG9mIHN5c2NhbGxzIGFuZCB0aG9zZSBjbG9zZWx5IHJlbGF0
ZWQKb25lcywgYXMgd2VsbCBhcyB0aGUgc2V0IG9mIHN5c2NhbGxzIHRoYXQgYWxyZWFkeSBoYXZl
IGEKS2NvbmZpZyBvcHRpb24sIHdlIHNob3VsZCBiZSBhYmxlIHRvIGZpbmQgdGhlIHNldCBvZiBz
eXNjYWxscwp0aGF0IGFyZSB1bmNvbmRpdGlvbmFsbHkgZW5hYmxlZCBidXQgY291bGQgYmUgb3B0
aW9uYWwuCklmIHlvdSBoYXZlIHRoZSBjaGFuY2UsIGNvdWxkIHlvdSBjb21waWxlIHRoYXQgbGlz
dD8KSSBtaWdodCBhbHNvIGhhdmUgYSBsaXN0LCBidXQgcHJvYmFibHkgbm90IGluIHRoZSBuZXh0
IHdlZWsuCgpUaGUgbmV4dCBzdGVwIGFmdGVyIHRoYXQgSSB0aGluayBpcyB0byBtZWFzdXJlIHRo
ZSBpbXBhY3QKb2YgdHVybmluZyBvZmYgdGhvc2UgcmVtYWluaW5nIG9uZXMgaW4gYSBjb25maWd1
cmF0aW9uIHRoYXQKaGFzIHRoZSBleGlzdGluZyBzeW1ib2xzIChlLmcuIHN5c3ZpcGMsIGZ1dGV4
LCBjb21wYXRfMzJiaXRfdGltZSwKLi4uKSBkaXNhYmxlZCBhbHJlYWR5LgoKU2lkZSBub3RlOiBJ
J20gYSAgYml0IHN1cnByaXNlZCB0byBzZWUgZnN0YXQoKSBpbiB0aGUgbGlzdCwgc2luY2Ugcmlz
Y3YKc2hvdWxkIG9ubHkgcmVhbGx5IHN1cHBvcnQgbmV3ZnN0YXQoKS4KCj4gQWxzbywgSSBub3Rp
Y2VkIHRoYXQgdGhlcmUgaGF2ZW4ndCBiZWVuIGFueSBjb21tZW50cyBzbyBmYXIgb24gdGhlIGxh
dGVyCj4gcGF0Y2hlcyBpbnRyb2R1Y2luZyB0aGUgUFVTSFNFQ1RJT04gbWFjcm8uwqAgSScgbSBh
IGJpdCBjb25jZXJuZWQgYWJvdXQgaG93Cj4gcGVvcGxlIHBlcmNlaXZlIHRoaXMgcGFydC4KCkkg
ZG9uJ3QgaGF2ZSBhIHN0cm9uZyBvcGluaW9uIG9uIHRoaXMgcGFydC4KCiAgICAgQXJuZAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
