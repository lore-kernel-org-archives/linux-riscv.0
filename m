Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E65D1D12694
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Dec 2025 11:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=bv7K+1K8RGKX4yNJxK4xNmaGxGaSWfJv4WUHJmtJB/4=; b=DMQpRq76OfGkZ+ip952GNnS+pS
	3OHXin5F0nUwpo0aGuzkeg0s53xRkDfa8xyrJ3EZE0E3PAcva9DbJ6zvyL7HwceCn/hvm6oIkk3xe
	de3IXViWkFr+uuGfPntZcRBI+I6xFCvPi5cU/CfBTjCx8j/aTog3LStaF7s0I3sezX0T8kZThMs7D
	bBB1jJUvvc3JQPyiAiKfAlGNgSEbmET7ZnAtwoKuRj77kO1xsNpTL07WB884kX5GK0UHuAp7I7syg
	Tkpt+gHaN2atn+LP+9nEfgQ1u0cwAi8TSlcJAOk61Anur6cWPlW0OUz5kADleCnWxu/2Hr5T8DUUp
	ProkGM4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQknl-00000006ULp-3EWj;
	Wed, 03 Dec 2025 11:13:41 +0000
Received: from fhigh-b5-smtp.messagingengine.com ([202.12.124.156])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQkni-00000006ULS-23Da
	for linux-riscv@lists.infradead.org;
	Wed, 03 Dec 2025 11:13:40 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id EA7237A0081;
	Wed,  3 Dec 2025 06:13:34 -0500 (EST)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-04.internal (MEProxy); Wed, 03 Dec 2025 06:13:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1764760414;
	 x=1764846814; bh=YKdb+8l66UjAcBrgpOrU8WrV1sdDB8wuszrMqADbfnA=; b=
	hOul+9t2G80f86fgU8sGmcdIY5wqNogHFkF8Z0Qeh0K+aWKykIBu22ww60hoiLz4
	CLZPphxX1BNL4tTlPgXbYJbTFKOMoEe/7Df1a0rQZFOVv4zNxNKnmov5nTso80BL
	YMPVvJH/qR5gpazJy4GxBLdESJewhqTLir4LBvCKlisKaADXhb5NUg830qNX4HAI
	pcNAFjmD3vZpdjZcoliAox7NEMkzHIDhmk2JAVWuToRjjpq6FUAfjZXlZFBKreQb
	yOLEafyOJQ3/Hyd7D++OejL1u0L5HHS46YFTZWAc8dv+2ICnLgDSSubq5/KEfr03
	+sim0ijaxpKphTCiWSUjUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1764760414; x=
	1764846814; bh=YKdb+8l66UjAcBrgpOrU8WrV1sdDB8wuszrMqADbfnA=; b=Q
	yaXp01vW+rIQiAuCf/F6CoSsyPENi2feziGzqixEbt2ijbgLGKI6TKzsaKJqAXTG
	DREqKGMrqPuXag77xY1ygVVwOFRPgt+PMGd7Owp4qpbycpNM8klSJOVyN70tX9iA
	yJygrLvWfQko4DPZwX7TbcBhud1FFYfwIyuMHUJMIbZ1FYJ/3UnZO8jMeAqYDzFw
	6xzWv69PDUDa/4v6A3CRPLPqvR8zK3JjYkCqr0kGVbRndDiq9yB/BFbpL0CkAAfq
	xK4ygm2ln+VNVlDy3B9QEW5JfZRyidXbSAF+sfXIFvmtDmSg+lWJTezRVUGSxK94
	D+SI/3nVzoRb/FeroZAHg==
X-ME-Sender: <xms:XRswaciQ4wo2K084QLdm4NSTc9hQWMdItx4ZYbKwgFDBcnj8ZRb_sQ>
    <xme:XRswaf0o59o4spJrvLSp7ImMGxmemqhVS4ECKg6wcBUo68GpXd5Fk2uW_RqotrTO8
    JnEiJKtsmznTeGKw_y6O2SFfNxXYwaav8TL_biGcGz447T_NRJSYVw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    epffdttefhleekvedvvedtvdfghfdvvdeftdehudekkedvffdukedthfefffefkeeunecu
    ffhomhgrihhnpehprghsthgvsghinhdrtghomhenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgt
    phhtthhopedufedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphgrlhhmvghrse
    gurggssggvlhhtrdgtohhmpdhrtghpthhtohepiiduieehvddtjeeggeefvdesghhmrghi
    lhdrtghomhdprhgtphhtthhopehmrghsrghhihhrohihsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhu
    gidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhope
    hisehmrghskhhrrgihrdhmvgdprhgtphhtthhopehrohhnsghoghhosehouhhtlhhoohhk
    rdgtohhmpdhrtghpthhtoheplhigvdegsehsthhurdihnhhurdgvughurdgtnhdprhgtph
    htthhopehfrghltghonhesthhinhihlhgrsgdrohhrgh
X-ME-Proxy: <xmx:XRswaaz_U52lCjzKHgfAa9rca3rlw9dtenhZ3Sy0mIhcv8J-GdZ6Wg>
    <xmx:XRswaSrk6I8MZIxo95ScFD41TYeMdhzv9i_z5OVjiiC7i0R10X3EUw>
    <xmx:XRswaQxzmoiK2XDugHJsxMLX5Zg1a1W-PkUhG3F7U26ln_f3O33OYA>
    <xmx:XRswaerYZOsg4ztJES2hQIthPhk1lIhauI-Wv90oxPoLG9QeH94xHg>
    <xmx:XhswadEUk7yIgiRsemgLUJMs_IT7XNVbx7p-6djBcnbL6W6_Z-vZQNKx>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 043BFC40054; Wed,  3 Dec 2025 06:13:33 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A-HrBBL8x6OF
Date: Wed, 03 Dec 2025 12:13:11 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Yuan Tan" <tanyuan@tinylab.org>,
 "Masahiro Yamada" <masahiroy@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, linux-kbuild@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Linux-Arch <linux-arch@vger.kernel.org>, linux-kernel@vger.kernel.org,
 i@maskray.me, "Zhangjin Wu" <falcon@tinylab.org>, ronbogo@outlook.com,
 z1652074432@gmail.com, lx24@stu.ynu.edu.cn
Message-Id: <bd1e8856-2dbe-4dcf-beb6-9c52437fb01a@app.fastmail.com>
In-Reply-To: <921F22AF0D7D10F0+3a743e26-ae83-40e8-b266-ccffe478d2c7@tinylab.org>
References: <30C972B6393DBAC5+cover.1760463245.git.tanyuan@tinylab.org>
 <33333fdd-2aa2-4ce0-8781-92222829ea12@app.fastmail.com>
 <0BF8B2E83B6154B6+f17f32b4-f6ff-4184-917d-4b27fb916eae@tinylab.org>
 <73010511-a804-4cf4-a5c1-1d08e3f324c5@app.fastmail.com>
 <921F22AF0D7D10F0+3a743e26-ae83-40e8-b266-ccffe478d2c7@tinylab.org>
Subject: Re: [PATCH v2 0/8] dce, riscv: Unused syscall trimming with PUSHSECTION and
 conditional KEEP()
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_031338_905957_1CE4B7F1 
X-CRM114-Status: GOOD (  29.30  )
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

T24gV2VkLCBEZWMgMywgMjAyNSwgYXQgMDc6MDIsIFl1YW4gVGFuIHdyb3RlOgo+IE9uIDExLzcv
MjAyNSA1OjMzIEFNLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+PiBPbiBUdWUsIE5vdiA0LCAyMDI1
LCBhdCAwMzoyMSwgWXVhbiBUYW4gd3JvdGU6Cj4+PiBGb3IgcmVmZXJlbmNlLCBoZXJlIGlzIHRo
ZSBsaXN0IG9mIHN5c2NhbGxzIHJlcXVpcmVkIHRvIHJ1biBMaWdodHRwZC4KPj4+Cj4+PiBleGVj
dmUgc2V0X3RpZF9hZGRyZXNzIG1vdW50IHdyaXRlIGJyayBtbWFwIG11bm1hcCBnZXR1aWQgZ2V0
Z2lkIGdldHBpZAo+Pj4gY2xvY2tfZ2V0dGltZSBnZXRjd2QgZmNudGwgZnN0YXQgcmVhZCBkdXAz
IHNvY2tldCBzZXRzb2Nrb3B0IGJpbmQgbGlzdGVuCj4+PiBydF9zaWdhY3Rpb24gcnRfc2lncHJv
Y21hc2sgbmV3ZnN0YXRhdCBwcmxpbWl0NjQgZXBvbGxfY3JlYXRlMSBlcG9sbF9jdGwgcGlwZTIK
Pj4+IGVwb2xsX3B3YWl0IGFjY2VwdDQgZ2V0c29ja29wdCByZWN2ZnJvbSBzaHV0ZG93biB3cml0
ZXYgZ2V0ZGVudHM2NCBvcGVuYXQgY2xvc2UKPj4+CgouLi4KCj4+Cj4+IFNpZGUgbm90ZTogSSdt
IGEgIGJpdCBzdXJwcmlzZWQgdG8gc2VlIGZzdGF0KCkgaW4gdGhlIGxpc3QsIHNpbmNlIHJpc2N2
Cj4+IHNob3VsZCBvbmx5IHJlYWxseSBzdXBwb3J0IG5ld2ZzdGF0KCkuCj4KPgo+IFRoZSBzeXNj
YWxsIGxpc3QgY29tZXMgZnJvbSBhIHNpbXBsZSB0ZXN0IGVudmlyb25tZW50IHJhdGhlciB0aGFu
IGEKPiB3b3JrbG9hZCBJIGludGVuZCB0byBvcHRpbWl6ZSBmb3IgZGVwbG95bWVudC4KPgo+IFRo
ZSBsaXN0IEkgcG9zdGVkIHdhcyBnZW5lcmF0ZWQgdXNpbmcgc3RyYWNlIG9uIFJJU0MtViBRRU1V
LiBJIHdhcwo+IGxvb2tpbmcgYXQgdGhlIEFCSSBuYW1lcywgbm90IHRoZSBhY3R1YWwga2VybmVs
IHN5c2NhbGwgbmFtZXMuwqAgT25lCj4gcXVlc3Rpb24gaGVyZTogZm9yIHN5c2NhbGwgdHJpbW1p
bmcsIHNob3VsZCB3ZSBkaXNjdXNzIGV2ZXJ5dGhpbmcgaW4KPiB0ZXJtcyBvZiBzeXNjYWxsIEFC
SSBuYW1lcyBvciB0aGUgYWN0dWFsIGtlcm5lbCBzeXNjYWxsIGZ1bmN0aW9uIG5hbWVzPwo+IEkg
d291bGQgbGlrZSB0byBjb25maXJtIHlvdXIgcHJlZmVyZW5jZSBiZWZvcmUgSSBjb250aW51ZSB3
aXRoIHRoZQo+IHVwZGF0ZWQgbGlzdC4KClJpZ2h0LCB3ZSBjbGVhcmx5IG5lZWQgdG8gY29tZSB1
cCB3aXRoIGEgY29uc2lzdGVudCBuYW1pbmcgaGVyZS4KVW5mb3J0dW5hdGVseSBib3RoIHRoZSBm
dW5jdGlvbiBuYW1lcyBhbmQgdGhlIG1hY3JvIG5hbWVzIGNhbgpiZSBjb25mdXNpbmcgaGVyZS4K
Cj4gRm9yIG5vdywgSSdsbCBjb250aW51ZSB0aGUgZGlzY3Vzc2lvbiBpbiB0ZXJtcyBvZiBzeXNj
YWxsIEFCSSBuYW1lcy4KCk9rCgo+IEZvbGxvd2luZyB5b3VyIHN1Z2dlc3Rpb24sIEkgc3RhcnRl
ZCBieSB0YWtpbmcgdGhlIHN5c2NhbGwgbGlzdCByZXF1aXJlZAo+IGZvciB0aGUgTGlnaHR0cGQg
d29ya2xvYWQgYW5kIGV4cGFuZGVkIGl0IGludG8gdGhlIGNvcnJlc3BvbmRpbmcKPiBmdW5jdGlv
bmFsIGdyb3Vwcy4KPgo+IEhlcmUgaXMgYSB2ZXJ5IHByZWxpbWluYXJ5IGRyYWZ0IG9mIHRoZSBz
eXNjYWxsIGdyb3VwaW5nLCBiYXNlZCBvbiB0aGUKPiBzeXN0ZW1kIGNsYXNzaWZpY2F0aW9uLgo+
Cj4gaHR0cHM6Ly9wYXN0ZWJpbi5jb20vcmF3L1l4OTJiYjNtCj4KPiBUaGVuLCBJIHdyb3RlIGEg
c21hbGwgc2NyaXB0IHRoYXQgY2xhc3NpZmllcyBlYWNoIHN5c2NhbGwgZnJvbSBsaWdodHRwZAo+
IGludG8gaXRzIGNhdGVnb3J5IGFuZCB0aGVuIGVudW1lcmF0ZXMgYWxsIHN5c2NhbGxzIGJlbG9u
Z2luZyB0byB0aG9zZQo+IGNhdGVnb3JpZXMuCj4KPiBJdCBhZGRyZXNzZXMgdHdvIG9mIHRoZSBp
dGVtcyB5b3UgYXNrZWQgZm9yCj4KPiAtIElkZW50aWZ5aW5nIHRoZSBzeXNjYWxsIGZhbWlsaWVz
IHJlbGF0ZWQgdG8gbXkgbWluaW1hbCBMaWdodHRwZAo+IMKgIHdvcmtsb2FkCj4KPiAtIEVudW1l
cmF0aW5nIHdoaWNoIHN5c2NhbGxzIGFwcGVhciBpbiB0aG9zZSBjYXRlZ29yaWVzIGFuZCBjb3Vs
ZAo+IMKgIHBvdGVudGlhbGx5IGJlY29tZSBvcHRpb25hbAo+Cj4gYGBgCj4gQ2F0ZWdvcmllcyBw
cmVzZW50IGluIGxpZ2h0dHBkX3N5c2NhbGxzLnR4dDoKPiDCoCBAYmFzaWMtaW86IDUgLyAxNgo+
IMKgIEBjbG9jazogMSAvIDgKPiDCoCBAZGVmYXVsdDogOSAvIDMwCj4gwqAgQGZpbGUtc3lzdGVt
OiA2IC8gNDcKPiDCoCBAaW8tZXZlbnQ6IDMgLyA3Cj4gwqAgQGlwYzogMSAvIDIzCj4gwqAgQG1v
dW50OiAxIC8gMTMKPiDCoCBAbmV0d29yay1pbzogOCAvIDE4Cj4gwqAgQHNpZ25hbDogMiAvIDE0
Cj4gVG90YWwgdW5pcXVlIGNhdGVnb3JpZXM6IDkKPiBUb3RhbCBjYXRlZ29yaWVzIGRlZmluZWQ6
IDMwCgpUaGFua3MgZm9yIGNvbXBpbGluZyB0aGUgbGlzdCwgdGhpcyBpcyB2ZXJ5IHVzZWZ1bCEK
Ckl0J3MgY2xlYXIgdGhhdCB0aGUgc3lzdGVtZCBjYXRlZ29yaWVzIGhhdmUgYSBzb21lb25lIGRp
ZmZlcmVudApwdXJwb3NlLCB3aGljaCBkb2VzIG1lYW4gdGhhdCBzb21lIG9mIHRoZSBjYXRlZ29y
aWVzIHB1bGwgaW4Kd2F5IG1vcmUgc3lzY2FsbHMgdGhhbiB3ZSBuZWVkIGZvciB5b3VyIHRlc3Rj
YXNlOgoKLSBpcGMgaXMgbW9zdGx5IGZvciBzeXN2aXBjIChjb250cm9sbGVkIGJ5IENPTkZJR19T
WVNWSVBDLCBidXQgbm90IHVzZWQKICBpbiB5b3VyIHdvcmtsb2FkKSwgYnV0IGl0IGFsc28gaW5j
bHVkZXMgcGlwZTIsIHdoaWNoIHlvdSBkbyB1c2UuCgotIG5ldHdvcmstaW8gaW5jbHVkZXMgYWxs
IHRoZSBzb2NrZXQgaW50ZXJmYWNlcywgYW5kIEkgdGhpbmsKICB0aGF0IG1ha2VzIHNlbnNlIGFz
IGEgY2F0ZWdvcnkgKENPTkZJR19ORVQpLgoKLSBjbG9jayBjb250YWlucyBhbGwgdGhlIHBvc2l4
IGNsb2NrIGFuZCB0aW1lciBzdXBwb3J0LCBidXQgeW91CiAgb25seSB1c2UgY2xvY2tfZ2V0dGlt
ZSgpLiBXZSBoYXZlIENPTkZJR19QT1NJWF9USU1FUlMsIHdoaWNoCiAgeW91IGNhbiBkaXNhYmxl
IHRvIGdldCBjbG9zZSB0byB3aGF0IHlvdSB3YW50IGhlcmUuCgotIFRoZSAnbW91bnQnIGNhdGVn
b3J5IGhhcyBnYWluZWQgYSBsb3Qgb2Ygbm9uLW9wdGlvbmFsIHN5c2NhbGxzCiAgb3ZlciB0aGUg
cGFzdCBmZXcgeWVhcnMsIGJ1dCB5b3Ugb25seSB1c2UgdGhlIHRyYWRpdG9uYWwKICAnbW91bnQn
LiBTaW5jZSB0aGUgZ2VuZXJhbCBpZGVhIGlzIHRvIG1vdmUgYXdheSBmcm9tIHRoZSBtb3VudAog
IHN5c2NhbGwgdG8gdGhlIG5ld2VyIG9uZXMsIEknbSBub3Qgc3VyZSBpdCBtYWtlcyBzZW5zZSB0
bwogIGhhdmUgYWRkaXRpb25hbCBvcHRpb25zIGhlcmUsIGJ1dCB0aGF0IGRlcGVuZHMgYSBiaXQg
b24gdGhlCiAgYW1vdW50IG9mIHNwYWNlIHNhdmluZ3MgYW5kIG1heSBiZSB3b3J0aCB0cnlpbmcu
Cgo+IFRoaXMgcHJvZHVjZXMgYSBsaXN0IG9mIDE3NiBzeXNjYWxscyBhY3Jvc3MgOSBjYXRlZ29y
aWVzIHRoYXQgYXJlCj4gcmVsZXZhbnQgdG8gdGhlIHdvcmtsb2FkLiBUaGUgb3V0cHV0IGFsc28g
c2hvd3Mgd2hpY2ggY2F0ZWdvcmllcyBkbyBub3QKPiBhcHBlYXIgaW4gdGhpcyB3b3JrbG9hZCAo
MjEgY2F0ZWdvcmllcyB3aXRoIDAgc3lzY2FsbHMgdXNlZCkuCj4KPiBJZiB0aGUgY2F0ZWdvcml6
YXRpb24gd29ya3MgdGhpcyB3YXksIGl0J3MgYWN0dWFsbHkgcXVpdGUgc3VycHJpc2luZwo+IHRo
YXQgZXZlbiBzdWNoIGEgc2ltcGxlIHdvcmtsb2FkIHdvdWxkIHB1bGwgaW4gYXMgbWFueSBhcyAx
NzYgc3lzY2FsbHMuCj4gSSdtIG5vdCBzdXJlIHlldCB3aGF0IHRoZSBhY3R1YWwgdHJpbW1pbmcg
aW1wYWN0IHdpbGwgbG9vayBsaWtlIGFmdGVyCj4gYnVpbGRpbmcsIGJ1dCBJIHdpbGwgdGVzdCB0
aGF0IG5leHQuCgpTb3VuZHMgZ29vZC4gU2VlIGlmIHlvdSBjYW4gZGlzYWJsZSBDT05GSUdfU1lT
VklQQyBhbmQKQ09ORklHX1BPU0lYX1RJTUVSUyBpbiB0aG9zZSB0ZXN0cywgaW4gYWRkaXRpb24g
dG8gdGhlIG9uZXMgZnJvbQpjYXRlZ29yaWVzIHlvdSBsaXN0IGFzIGJlaW5nIHVudXNlZC4KCiAg
ICAgIEFybmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
