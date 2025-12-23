Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A7C9E6F084
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Dec 2025 10:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=91lLXz4q99JYH/cBNaBwU3QfXcQDljL7n8v1C8Ry3Xk=; b=LoYF2VK3BaJkaRTq9SD+xdstYm
	w2FQYEMlFbLvczMj8fGsMAmwooQTw2yS8pJO80QqUoDOIFi2NdyjB8CJ04gFnEm2ZKk7Xj1IGV0yb
	2jcjRIly4Rgid1oaTYxgUGMuDSSaw9yE8NYlYFamqcgQeL0Pn1FGr9WjosKaX0/mXW7ROgaKoqWh8
	nrZcmeQ65PZo3I88gcASk3Z683i/kP1JMFMeIop1+n0VSXq3rbaxKyzHT7ieSXLwuALvkVLlrimBu
	PYzHluBg+QAIM0a9uMPayOSHlyaW8aT3PRUad6v7M3UbPQaTuq+r2p68u69I8BBlJcL6RBOpIBiWU
	bbcedaXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzso-0000000Eu4b-31AJ;
	Tue, 23 Dec 2025 10:44:50 +0000
Received: from fhigh-b2-smtp.messagingengine.com ([202.12.124.153])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzsm-0000000Eu4C-0hPB
	for linux-riscv@lists.infradead.org;
	Tue, 23 Dec 2025 10:44:49 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 744747A009D;
	Tue, 23 Dec 2025 05:44:44 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 23 Dec 2025 05:44:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1766486684;
	 x=1766573084; bh=ZFLfJEdW4KGdEVvSYAKyivoL0y1+ygozW83FBhl/XSs=; b=
	QeQqmFqG3coYX0aQnBqtcsPu1QokpGxdMfLepv7wZ88wut8WLAT1DEy5niFjOkDQ
	Kt/aOGf8uCisUQ4G0rA1tvLzCINm1DRbUliYgSUHaROy6sul+Rx+biWFYjAC/Rk/
	58x6ZdMKuQxr3BPQx23qujrEN7TkNJZWTjCg2tnyfOjrQ71c+GD3Ddfq9uz+sv8W
	l8W8C8uP9q0Ox2kh3VI0xJzsOAD3Nj7nFkcdNZGdzReHvCNkJfGrGI9dklBKG9qt
	RfTzDRRGSpjBhlPJA+E1cztjtVOUpW5yazvM69GYrC1J+Mo2GJoh0nGUrlwMrJQp
	5BExTOjbDBDGdQLGwld4rw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1766486684; x=
	1766573084; bh=ZFLfJEdW4KGdEVvSYAKyivoL0y1+ygozW83FBhl/XSs=; b=V
	wFgp5W0BERJsVm+wyZTaKvMka//4yLsoJyqONbhVIfMwyg6IGyb+8W/rshpxAnP7
	hEYt8/ugbsd4bAuV39sKXp3QiCUcBI/++Yo4lDeVpNkqHNmtsFJY/yuIA+sIsvTD
	0T5CsrH9AcG9LIC7JAeDZeiyBWyLN2CtKzQAI+7NaajYfw7stOVN75zuIRqRLZgv
	jWps4WMk9nB7f6FezhSVwMLZ3Rdnf89ucS1PPxshT6QyfcJZHI9ebTceVApEVcnW
	HyRO6paSCb3UbWHjguFM+CBjDMkBVC4mWejIivPABaYyZUpl3I3YVcwpv4YyQU0X
	PXhUpB2M05Ewz9IZWDGdA==
X-ME-Sender: <xms:m3JKaSr5-I70dUYIi1hlmTlJilD4lQ_nr61qRHf59_jeF1duRdlobA>
    <xme:m3JKabemJIpoxbAPKz-VjqQUak4RrmjQfJl4xufGUR3vnWMQduhKurlgdCh76ebeF
    5I2s6xsDo31I8K4syXngbdD6UiTM5ZkLF1KTg_fB04fC1mttJ8hkZyf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdehleeivdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeejvdefhedtgeegveehfeeljeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepmhgrgihtrhgrmhelheesghhmrghilhdrtghomhdprhgtphhtthhope
    hrrggsvghnuggrrdgtnhesghhmrghilhdrtghomhdprhgtphhtthhopehsthhurghrthdr
    rgdrhhgrhihhuhhrshhtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrohhhrghnse
    hishgtrghsrdgrtgdrtghnpdhrtghpthhtohepphhivghrrhgvqdhlohhuihhsrdgsohhs
    shgrrhhtsehlihhnuhigrdguvghvpdhrtghpthhtohepkhgrihdrvhgvhhhmrghnvghnse
    hlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepphgvthgvrhdruhhjfhgrlhhu
    shhisehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheprhgrnhhjrghnihdrsh
    hrihguhhgrrhgrnheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopeihuhhn
    ghdqtghhuhgrnhdrlhhirghosehlihhnuhigrdhinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:m3JKaYqdKjamT3bAVE-8ldFsU0P_Z6kA6guXHkyoIAwk-_aPS418rQ>
    <xmx:m3JKaa_ZaO6d-XF_ex9S1ptGfUNU_bPUl3ROcNPBsfC1LdkxFmPNpA>
    <xmx:m3JKae2Lgd_mmT5q4FxQ7ZgEdgiCSznp8TIcXjp8qeysEtfC5dWwcA>
    <xmx:m3JKadBAoFsjVN2nYyQxq5zYqsxEXA6Z98ud9g7jAyCaAW66LjCfkQ>
    <xmx:nHJKaYwkyYidBK_6q5wjOMpHKc_PTuTk7UtKDThEoWPAn10FbDKTBilN>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 321D1700069; Tue, 23 Dec 2025 05:44:43 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AgVwluaQAvf7
Date: Tue, 23 Dec 2025 11:44:12 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Han Gao" <rabenda.cn@gmail.com>
Cc: "Han Gao" <gaohan@iscas.ac.cn>, "Jaroslav Kysela" <perex@perex.cz>,
 "Takashi Iwai" <tiwai@suse.com>,
 "Kai Vehmanen" <kai.vehmanen@linux.intel.com>,
 "Peter Ujfalusi" <peter.ujfalusi@linux.intel.com>,
 "Ranjani Sridharan" <ranjani.sridharan@linux.intel.com>,
 "Bard Liao" <yung-chuan.liao@linux.intel.com>,
 "Maxim Mikityanskiy" <maxtram95@gmail.com>,
 "Pierre-Louis Bossart" <pierre-louis.bossart@linux.dev>,
 "Stuart Hayhurst" <stuart.a.hayhurst@gmail.com>, linux-sound@vger.kernel.org,
 linux-riscv@lists.infradead.org, sophgo@lists.linux.dev,
 linux-kernel@vger.kernel.org
Message-Id: <99af5127-05b8-4347-8857-19324d750155@app.fastmail.com>
In-Reply-To: <CAAT7Ki-ddgsyJ4MDfn6MXKEBjXN__PZxWJQ_W5WjCcuaJ-_6Uw@mail.gmail.com>
References: <20251220170501.3972438-1-gaohan@iscas.ac.cn>
 <ad17d046-158d-4019-b801-423896fcf5fc@app.fastmail.com>
 <CAAT7Ki-ddgsyJ4MDfn6MXKEBjXN__PZxWJQ_W5WjCcuaJ-_6Uw@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda: intel: Introduce msi64 parameter to override 64-bit MSI
 restriction
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_024448_761429_ABEF8760 
X-CRM114-Status: GOOD (  16.91  )
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

T24gVHVlLCBEZWMgMjMsIDIwMjUsIGF0IDEwOjQwLCBIYW4gR2FvIHdyb3RlOgo+IE9uIFR1ZSwg
RGVjIDIzLCAyMDI1IGF0IDE6MDHigK9BTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPiB3
cm90ZToKPj4gT24gU2F0LCBEZWMgMjAsIDIwMjUsIGF0IDE4OjA1LCBIYW4gR2FvIHdyb3RlOgo+
PiA+Cj4+ID4gLSAgICAgaWYgKGNoaXAtPm1zaSAmJiBjaGlwLT5kcml2ZXJfY2FwcyAmIEFaWF9E
Q0FQU19OT19NU0k2NCkgewo+PiA+ICsgICAgIGlmIChjaGlwLT5tc2kgJiYgY2hpcC0+ZHJpdmVy
X2NhcHMgJiBBWlhfRENBUFNfTk9fTVNJNjQgJiYgIW1zaTY0KSB7Cj4+ID4gICAgICAgICAgICAg
ICBkZXZfZGJnKGNhcmQtPmRldiwgIkRpc2FibGluZyA2NGJpdCBNU0lcbiIpOwo+PiA+ICAgICAg
ICAgICAgICAgcGNpLT5ub182NGJpdF9tc2kgPSB0cnVlOwo+PiA+ICAgICAgIH0KPj4KPj4gVGhl
IGJlaGF2aW9yIGlzIGFsc28gd3Jvbmc6IGlmIHRoZSBzeXN0ZW0gY2FuIHVzZSBuZWl0aGVyIDMy
LWJpdAo+PiBNU0kgbm9yIDY0LWJpdCBNU0ksIHRoaXMgd291bGQgYWNjaWRlbnRhbGx5IHRyeSB0
byB1c2UgdGhlCj4+IDY0LWJpdCB2YXJpYW50IGFuZCB0aGVuIGNhdXNlIHJ1bnRpbWUgaXNzdWVz
Lgo+Pgo+PiBJIHdvdWxkIGV4cGVjdCB0aGUgb25seSBwb3NzaWJsZSBmYWxsYmFjayB0byBiZSB1
c2luZyBsZWdhY3kgSW50WAo+PiBpbnRlcnJ1cHRzLCBvciByZXR1cm5pbmcgYSBwcm9iZSBmYWls
dXJlIGlmIHRoYXQgZG9lc24ndCB3b3JrCj4KPiBVbmZvcnR1bmF0ZWx5LCB0aGUgU0cyMDQyIGNo
aXAgZG9lcyBub3QgaGF2ZSBhbiBhdmFpbGFibGUgbGVnYWN5IElOVHguCgpEb2Vzbid0IHRoYXQg
bWVhbiB0aGF0IHlvdSBjYW4gb25seSB1c2UgUENJIGRyaXZlcnMgdGhhdCBlbmFibGUKTVNJIGF0
IGFsbD8gRnJvbSB3aGF0IEkgY2FuIHRlbGwsIG9ubHkgYWJvdXQgYSB0aGlyZCBvZiBhbGwKcGNp
X2RyaXZlciBpbnN0YW5jZXMgZG8uCgo+IGRiNzlhZmExZTU3OTI1YmE5NmFiMTg1MTRjMGViZTQy
YTI4ZTM5M2UKPiA5MWVkNmZkMmMzODNiYjhmMDJkNjZlOThiNGE0ZDJmNzIwNzI0OWRjCj4KPiBB
Y2NvcmRpbmcgdG8gdGhlc2UgdHdvIGNvbW1pdHMsIHRoZXNlIGlzc3VlcyBzZWVtIHRvIGJlIGNh
dXNlZCBieSBwb3dlcnBjLgo+IENhbiB3ZSB1c2UgdGhlIENPTkZJR19QUEM2NCBtYWNybyB0byBk
ZXRlcm1pbmUgdGhpcz8KCkkgd291bGRuJ3QgY29uc2lkZXIgaXQgYSBQUEM2NCBzcGVjaWZpYyBp
c3N1ZSwgZnJvbSBteSBpbnRlcnByZXRhdGlvbgp0aGlzIGlzIHRoZSBzYW1lIGlzc3VlIGFzIGlu
IHRoZSByYWRlb24gZHJpdmVyLCB3aGVyZSB0aGUgTVNJCmlzIGxpbWl0ZWQgYnkgdGhlIERNQSBt
YXNrIG9mIHRoZSBkZXZpY2UsIGFuZCB0aGUgY29ycmVjdCB3YXkgdG8KZG8gaXQgaXMgdG8gY2hl
Y2sgdGhlIG1hc2sgd2hpbGUgZW5hYmxpbmcgYW4gTVNJLCBpbnN0ZWFkIG9mCmFzc3VtaW5nIHRo
YXQgYW55IGhpZ2ggYWRkcmVzcyBpcyBicm9rZW4uCgogICAgIEFybmQKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
