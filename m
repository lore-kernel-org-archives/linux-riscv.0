Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F36E78D70
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Feb 2026 09:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6highRo1NwtPk/5SnzcqQM9WAUgkKm9wimkVjR8uS34=; b=HJM2pJnM2gALc6
	n3lErz6A6UEh2gAGp4geNySgD8/5rnX7xFFLGq4kZY1e5N4qwZCTzt+us2ckHdwqJGMsHF8vLAvuT
	PHEWmdckn2x5Iq37YGiEiRgdeQ8IpBpeneizjr4IOxFCuyfnVHJJOLFoEE+SEjTYVnxTy2LvO1mlM
	7bi6R9rUNAoTmMv61Z/GR0l8NqHk6pHnqqbSfSukGucEzLXCOXp+ZetydmXaTdxr4bGroWzptlqcK
	A1OkXdDjLE+aCDC64WwEXEVRxTn40np4aAysSXBQrP0pc2EJLCIzMFmO6JyabNGVJdP0KH8kuOOIQ
	Ybg5tkf+AgFnsH5SeMpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpNVh-0000000F7xU-0pPr;
	Mon, 09 Feb 2026 09:24:49 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpNVd-0000000F7vp-2jGY
	for linux-riscv@lists.infradead.org;
	Mon, 09 Feb 2026 09:24:48 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260209092439euoutp02c832e0b9b3d57df25ed503cbe0a627e4~SicRKAkAf1553515535euoutp02t
	for <linux-riscv@lists.infradead.org>; Mon,  9 Feb 2026 09:24:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260209092439euoutp02c832e0b9b3d57df25ed503cbe0a627e4~SicRKAkAf1553515535euoutp02t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1770629079;
	bh=Yg65QpvqB2HJv2/a96JfNi6PVWJKkv4zQcF3Q3T/5kE=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=YsAlTuFaZD9NcYx38vryleR5Modk95FuLL6T0EtmFUar6SJBP9QOCDPX3qmoBPoFl
	 nrc5F7L+/Kuo6Rf21lzPdSTrGLqR7lcC2zuFVzKDZ1KElU0V4s0V+fzIFH52oAaCOv
	 mKtYaLbI+0AK5KQrHFsTPDyunzI6Y8D6BOP/rC/Q=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260209092438eucas1p156e66a9eaba6af88ac5fd5dede932436~SicQg12A41795617956eucas1p1b;
	Mon,  9 Feb 2026 09:24:38 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260209092437eusmtip2a51af5d68e14937533a7edf95b5d10c5~SicPW4Yzg2096620966eusmtip28;
	Mon,  9 Feb 2026 09:24:37 +0000 (GMT)
Message-ID: <4e843ff5-89f6-41a0-8a35-b4e31291e621@samsung.com>
Date: Mon, 9 Feb 2026 10:24:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pwm: th1520: fix `CLIPPY=1` warning
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Miguel
	Ojeda <ojeda@kernel.org>
Cc: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei
	<wefu@redhat.com>, linux-riscv@lists.infradead.org, Boqun Feng
	<boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin
	<lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
	<aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
	<dakr@kernel.org>, rust-for-linux@vger.kernel.org, Mark Brown
	<broonie@kernel.org>, linux-pwm@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <aYmgjEWaLrdsubKM@monoceros>
X-CMS-MailID: 20260209092438eucas1p156e66a9eaba6af88ac5fd5dede932436
X-Msg-Generator: CA
X-RootMTR: 20260209085719eucas1p262f0590167a1193533dd0a55cbff063e
X-EPHeader: CA
X-CMS-RootMailID: 20260209085719eucas1p262f0590167a1193533dd0a55cbff063e
References: <20260121183719.71659-1-ojeda@kernel.org>
	<CGME20260209085719eucas1p262f0590167a1193533dd0a55cbff063e@eucas1p2.samsung.com>
	<aYmgjEWaLrdsubKM@monoceros>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_012446_285673_79B5C9BD 
X-CRM114-Status: GOOD (  14.64  )
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

CgpPbiAyLzkvMjYgMDk6NTYsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+IEhlbGxvIE1pZ3Vl
bCwKPiAKPiBPbiBXZWQsIEphbiAyMSwgMjAyNiBhdCAwNzozNzoxOVBNICswMTAwLCBNaWd1ZWwg
T2plZGEgd3JvdGU6Cj4+IFRoZSBSdXN0IGtlcm5lbCBjb2RlIHNob3VsZCBiZSBrZXB0IGBDTElQ
UFk9MWAtY2xlYW4gWzFdLgo+Pgo+PiBDbGlwcHkgcmVwb3J0czoKPj4KPj4gICAgIGVycm9yOiB0
aGlzIHBhdHRlcm4gcmVpbXBsZW1lbnRzIGBPcHRpb246OnVud3JhcF9vcmAKPj4gICAgICAgLS0+
IGRyaXZlcnMvcHdtL3B3bV90aDE1MjAucnM6NjQ6NQo+PiAgICAgICAgfAo+PiAgICAgNjQgfCAv
ICAgICAobWF0Y2ggbnMuY2hlY2tlZF9tdWwocmF0ZV9oeikgewo+PiAgICAgNjUgfCB8ICAgICAg
ICAgU29tZShwcm9kdWN0KSA9PiBwcm9kdWN0LAo+PiAgICAgNjYgfCB8ICAgICAgICAgTm9uZSA9
PiB1NjQ6Ok1BWCwKPj4gICAgIDY3IHwgfCAgICAgfSkgLyBOU0VDX1BFUl9TRUNfVTY0Cj4+ICAg
ICAgICB8IHxfX19fX19eIGhlbHA6IHJlcGxhY2Ugd2l0aDogYG5zLmNoZWNrZWRfbXVsKHJhdGVf
aHopLnVud3JhcF9vcih1NjQ6Ok1BWClgCj4+ICAgICAgICB8Cj4+ICAgICAgICA9IGhlbHA6IGZv
ciBmdXJ0aGVyIGluZm9ybWF0aW9uIHZpc2l0IGh0dHBzOi8vcHJvdGVjdDIuZmlyZWV5ZS5jb20v
djEvdXJsP2s9NGE4NzU1ZDUtMTUxYjdjZmYtNGE4NmRlOWEtMDAwYmFiZTU5OGY3LTUxNDk4MzE2
YzA2ZjI3NjYmcT0xJmU9YjUyN2MzYWMtYTBiOC00MDc0LTliYzQtYzM0OTdmNzkxM2E1JnU9aHR0
cHMlM0ElMkYlMkZydXN0LWxhbmcuZ2l0aHViLmlvJTJGcnVzdC1jbGlwcHklMkZydXN0LTEuOTIu
MCUyRmluZGV4Lmh0bWwlMjNtYW51YWxfdW53cmFwX29yCj4+ICAgICAgICA9IG5vdGU6IGAtRCBj
bGlwcHk6Om1hbnVhbC11bndyYXAtb3JgIGltcGxpZWQgYnkgYC1EIHdhcm5pbmdzYAo+PiAgICAg
ICAgPSBoZWxwOiB0byBvdmVycmlkZSBgLUQgd2FybmluZ3NgIGFkZCBgI1thbGxvdyhjbGlwcHk6
Om1hbnVhbF91bndyYXBfb3IpXWAKPj4KPj4gQXBwbHlpbmcgdGhlIHN1Z2dlc3Rpb24gdGhlbiB0
cmlnZ2VyczoKPj4KPj4gICAgIGVycm9yOiBtYW51YWwgc2F0dXJhdGluZyBhcml0aG1ldGljCj4+
ICAgICAgIC0tPiBkcml2ZXJzL3B3bS9wd21fdGgxNTIwLnJzOjY0OjUKPj4gICAgICAgIHwKPj4g
ICAgIDY0IHwgICAgIG5zLmNoZWNrZWRfbXVsKHJhdGVfaHopLnVud3JhcF9vcih1NjQ6Ok1BWCkg
LyBOU0VDX1BFUl9TRUNfVTY0Cj4+ICAgICAgICB8ICAgICBeXl5eXl5eXl5eXl5eXl5eXl5eXl5e
Xl5eXl5eXl5eXl5eXl5eXl5eXl5eIGhlbHA6IGNvbnNpZGVyIHVzaW5nIGBzYXR1cmF0aW5nX211
bGA6IGBucy5zYXR1cmF0aW5nX211bChyYXRlX2h6KWAKPj4gICAgICAgIHwKPj4gICAgICAgID0g
aGVscDogZm9yIGZ1cnRoZXIgaW5mb3JtYXRpb24gdmlzaXQgaHR0cHM6Ly9wcm90ZWN0Mi5maXJl
ZXllLmNvbS92MS91cmw/az03ZmQ3ZWY2NS0yMDRiYzY0Zi03ZmQ2NjQyYS0wMDBiYWJlNTk4Zjct
YzYxNjUyODkzMjNlM2JlZCZxPTEmZT1iNTI3YzNhYy1hMGI4LTQwNzQtOWJjNC1jMzQ5N2Y3OTEz
YTUmdT1odHRwcyUzQSUyRiUyRnJ1c3QtbGFuZy5naXRodWIuaW8lMkZydXN0LWNsaXBweSUyRnJ1
c3QtMS45Mi4wJTJGaW5kZXguaHRtbCUyM21hbnVhbF9zYXR1cmF0aW5nX2FyaXRobWV0aWMKPj4g
ICAgICAgID0gbm90ZTogYC1EIGNsaXBweTo6bWFudWFsLXNhdHVyYXRpbmctYXJpdGhtZXRpY2Ag
aW1wbGllZCBieSBgLUQgd2FybmluZ3NgCj4+ICAgICAgICA9IGhlbHA6IHRvIG92ZXJyaWRlIGAt
RCB3YXJuaW5nc2AgYWRkIGAjW2FsbG93KGNsaXBweTo6bWFudWFsX3NhdHVyYXRpbmdfYXJpdGht
ZXRpYyldYAo+Pgo+PiBUaHVzIGZpeCBpdCBieSB1c2luZyBzYXR1cmF0aW5nIGFyaXRobWF0aWMs
IHdoaWNoIHNpbXBsaWZpZXMgdGhlIGNvZGUKPj4gYXMgd2VsbC4KPj4KPj4gTGluazogaHR0cHM6
Ly9wcm90ZWN0Mi5maXJlZXllLmNvbS92MS91cmw/az0zZjlmNzJjNC02MDAzNWJlZS0zZjllZjk4
Yi0wMDBiYWJlNTk4ZjctY2UzNTU2MjAyMjgxZjQ4ZSZxPTEmZT1iNTI3YzNhYy1hMGI4LTQwNzQt
OWJjNC1jMzQ5N2Y3OTEzYTUmdT1odHRwcyUzQSUyRiUyRnJ1c3QtZm9yLWxpbnV4LmNvbSUyRmNv
bnRyaWJ1dGluZyUyM3N1Ym1pdC1jaGVja2xpc3QtYWRkZW5kdW0gWzFdCj4+IEZpeGVzOiBlMDM3
MjRhYWM3NTggKCJwd206IEFkZCBSdXN0IGRyaXZlciBmb3IgVC1IRUFEIFRIMTUyMCBTb0MiKQo+
PiBTaWduZWQtb2ZmLWJ5OiBNaWd1ZWwgT2plZGEgPG9qZWRhQGtlcm5lbC5vcmc+Cj4+IC0tLQo+
IAo+IExvb2tzIGdvb2QgdG8gbWUuIEknbGwgd2FpdCBmb3IgTWljaGFsIHRvIGFkZCBoaXMgYmxl
c3NpbmcgYW5kIHRoZW4gd2hlbgo+IHBpY2tpbmcgaXQgdXAgdGVuZCB0byBkcm9wIHRoZSBGaXhl
cyBsaW5lLiBPciBkbyB3ZSBhbHNvIGNhcmUgYWJvdXQKPiBDTElQUFktY2xlYW5uZXNzIGluIHN0
YWJsZT8KCkhtbSBJJ20gcHJldHR5IHN1cmUgYXQgdGhlIHRpbWUgb2YgdGhlIHdyaXRpbmcgYnVp
bGRpbmcgd2l0aCBDTElQUFkKZGlkbid0IHRyaWdnZXIgdGhpcyB3YXJuaW5nLCBzbyBJIGd1ZXNz
IGl0J3MgZWl0aGVyIGEgbmV3ZXIgdmVyc2lvbiBvZgpDTElQUFkgdGhhdCBJIHVzZWQgb3IgaW4g
dGhlIG1lYW50aW1lIENMSVBQWSB3YXMgdXBkYXRlZC4KCkFueXdheSAKUmV2aWV3ZWQtYnk6IE1p
Y2hhbCBXaWxjenluc2tpIDxtLndpbGN6eW5za2lAc2Ftc3VuZy5jb20+Cgo+IAo+IEJlc3QgcmVn
YXJkcwo+IFV3ZQoKQmVzdCByZWdhcmRzLAotLSAKTWljaGFsIFdpbGN6eW5za2kgPG0ud2lsY3p5
bnNraUBzYW1zdW5nLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
