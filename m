Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E8FEDEC05
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 13:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Qg3H5zizuWTT6DuR8aNcyRZfGezH7l1dM/MkNIuUw0Q=; b=Xi7N/8BKtq1WxeP3k5UlKn6LMb
	xcOrFJ5/0dZe6fe0S6NGfnzy1eve3s7dJEMJ2hpmO3PguvvgJrUN461yp5+hAGKYc+w6GDYKlqW0o
	r5zbW7/iybxbFaTr51bJLF9LVJmOWhfmEQ4zehF2fR2JcF2d4sUJD1hfDJCHygtYRpsxVJWvT6zZM
	jH66MklsCUgMe0naQKEH6B9YKgp4qo/YWc0AiWP02R4q3oyW032fCXFlHK8y9FBvCaFaPLRCblKfc
	gotqCSUFxa6eqOBfUJySVLdVQybbh0MSAz/f+OE/XkysWEvI7Mitl6+qXiX7j2KenxZk7n+feLIZj
	ihzaK9wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy8io-00000001scH-02Ii;
	Thu, 05 Mar 2026 13:26:34 +0000
Received: from fout-a4-smtp.messagingengine.com ([103.168.172.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy8il-00000001sbw-0IqC
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 13:26:32 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 1B790EC0592;
	Thu,  5 Mar 2026 08:26:27 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 05 Mar 2026 08:26:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772717187;
	 x=1772803587; bh=s2HoU5gYG3iEDH/ODUYOKG32ATI9XP9B3HnmAGJenf0=; b=
	PDUcRcjYXR93wC8/uQeCk1KB8exCL89IoOlAQH+kEJriPV78CmUdJTspLFcKHxoc
	6SpG8vrlNF7BuYo1CF8+5QvDgGRIMt5QJzZ+bhybdpSQGzdzc89EgniRSf+LYAWv
	hxKQdhIDCxjY2xUrmlDbT9gQQIlG7Zzmxt19J8m4ExVeYEIG0lMLM8MS13tsfF3l
	9PhaupHOUKIpCHQ4cugBAyeciQXGrtm4xVvmLUoqSimyE3nGcthrjbhBbnPxLEEh
	NBw5r9NwcZ/rFXlXbcK4Pb9NiUx7QI+tZid+qwBPMoqnS2rSTCkMlkXcfW3MuGhG
	NGO5YK6edWqfL4bhuwNmMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1772717187; x=
	1772803587; bh=s2HoU5gYG3iEDH/ODUYOKG32ATI9XP9B3HnmAGJenf0=; b=D
	mLjiiKiFvr4EdJ9XWHoDkOr7iwYnGNZJ55TXmn456qLZ6aUv+69tz8AZ/rJ+jxZs
	gAXtdp/g/NRQegs76sJSl6GoJL3a0v9HhYU5daRA6QWG4oKN9fczLhRko2hXSbwI
	gsokhBlc2lEyopW17EPQeSydY+S5la6hhCYxRvro0vOvK84AIrJfswTeUECkK/ty
	3MRbYq7buLHuddMzLmPfYZOH4Q3+EvkwJWQtFeSKsgLPnBDtk6T0AZyyf/5OnZTd
	pnOjcAgCrLdipcbYqZxqTXXfZAcwLsTyw61ax0VdLOVm+PuzE+SkqqIG9Z5vU8aL
	b9RkEmuxSxv5gBK7Waong==
X-ME-Sender: <xms:goSpaR_0YarC5ff8sEoHT2AsLZESe-nT5h9Bt7qy68_w_Yu-_0Vj6A>
    <xme:goSpaQifK1cuxRkPneFCIog8w8cUuu7EipBud1Jli0GAg4B0gY6nt4c_AXGZVayq1
    JmT4Q-RX3QtSwqfE21mwyghsjAH1oVvYXvdkWhvCQd2PhCe_Fpvatg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvieeihedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepjhhonhgrthhhrghnrdgtrghmvghrohhnsehhuhgrfigvihdrtghomh
    dprhgtphhtthhopegtohhnohhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhn
    uhhsfieskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhotgeskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggr
    ugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnh
    gvlhdrohhrgh
X-ME-Proxy: <xmx:goSpaXf9_YyBQjiyxvl-WyL6wctH298uyLTRW86Nl2tTKDkdT0gu8A>
    <xmx:goSpaYL0waQAEajZCvC2pVV8xuInMEVNjerQ5yNZNpTzfHZxaYLa3Q>
    <xmx:goSpafhdIprAGdTXzGXXUsEy7zAKQW4_F3oOg98aMpPJD0EQB7G35Q>
    <xmx:goSpaeTWfDCX9rfRognCCjoIzTxUQnJp3m-FEnwmO0xL4Cr22Z51Hw>
    <xmx:g4SpaZ-r-vXBSWOvWoec3FvAt-UG0uomBSnGHnpA4BOF25VRtoVZMpNI>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7BFCD700065; Thu,  5 Mar 2026 08:26:26 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AkBvdCgULreF
Date: Thu, 05 Mar 2026 14:26:03 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Walleij" <linusw@kernel.org>, "Conor Dooley" <conor@kernel.org>
Cc: soc@kernel.org, "Jonathan Cameron" <jonathan.cameron@huawei.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <e6297b8b-17c9-47a0-a481-ca064313f6b0@app.fastmail.com>
In-Reply-To: <CAD++jLnsT7B5FO1ThYS+NgdZh5E=ALnE-V3k-TiGw3JEYv8dwg@mail.gmail.com>
References: <20260213-stole-economist-d5b0ac711d42@spud>
 <CAD++jLkDHh_WozDAot4c=1kYwy24sjH9-5_i8-Vmi6oXLp9wUw@mail.gmail.com>
 <20260303-crazy-shrink-ef2c085c99c4@spud>
 <CAD++jLnsT7B5FO1ThYS+NgdZh5E=ALnE-V3k-TiGw3JEYv8dwg@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V soc fixes for v7.0-rc1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_052631_545865_F02BBF8D 
X-CRM114-Status: GOOD (  14.22  )
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

T24gVHVlLCBNYXIgMywgMjAyNiwgYXQgMTA6NTEsIExpbnVzIFdhbGxlaWogd3JvdGU6Cj4gT24g
VHVlLCBNYXIgMywgMjAyNiBhdCAxMDo0MeKAr0FNIENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPj4gVGhlcmUncyBubyBkZXBlbmRlbmN5IG9mIGNvdXJzZSwgSSdsbCBz
cGxpdCBpdCBvdXQuCj4+IE9yZGluYXJpbHkgSSB3b3VsZCBhbHdheXMgc3BsaXQgdGhlbSwgYnV0
IEknZCBzd2VhciBJIHdhcyB0b2xkIGF0IG9uZQo+PiBwb2ludCB0aGF0IHNpbmNlIGZpeGVzIHdl
cmUgb24gb25lIGJyYW5jaCBpbiB0aGUgc29jIHRyZWUgdGhhdCBpdCB3YXMKPj4gb2theSBmb3Ig
bWUgdG8gZG8gdGhlIHNhbWUuIEluIHRoaXMgY2FzZSBJIGRpZCBpdCBvbiBvbmUgYnJhbmNoIHRv
IGJlCj4+IGxlc3Mgd29yayB0byBnZXQgb250byBhIHBvdGVudGlhbCBmaXhlcyBQUiB0aGF0IHdl
bnQgb3V0IGJlZm9yZSAtcmMxLgo+Cj4gWW91IG1pZ2h0IGJlIHJpZ2h0IGFib3V0IHRoYXQsIEkn
bSBsZWFybmluZyBteXNlbGYuCj4KPiBQZXJoYXBzIHlvdSBrbm93IG1vcmUgYWJvdXQgdGhpcyBw
cm9jZXNzIHRoYW4gbWUsCj4gZGVzcGl0ZSBtZSBiZWluZyBvbmUgb2YgdGhlIFNvQyBtYWludGFp
bmVycyBub3cgOlAKPgo+IExldCdzIHNlZSB3aGF0IHRoZSBvdGhlcnMgc2F5LgoKVGhlIHB1bGwg
cmVxdWVzdHMgZm9yIC1uZXh0IGhhdmUgdG8gYmUgc3BsaXQgYmVjYXVzZSB0aGV5IGdvCnRvIHRv
cnZhbGRzIGFzIHNlcGFyYXRlIGJyYW5jaGVzLCBidXQgZm9yIGJ1ZyBmaXhlcywgSSBuZXZlcgpt
YWRlIHRoaXMgYSBydWxlIHNvIGZhci4KCkkganVzdCBtZXJnZWQgQ29ub3IncyBQUiBiZWZvcmUg
SSBzYXcgdGhpcyB0aHJlYWQsIGFuZCBkZWNpZGVkCm5vdCB0byB1bmRvIHRoZSBtZXJnZSBiZWNh
dXNlIGl0J3MgZmluZSBmb3IgdGhlIGN1cnJlbnQgd2F5IHdlCnNlbmQgdGhlIHVwc3RyZWFtIFBS
cy4KCldlIGNvdWxkIGNvbnNpZGVyIGNoYW5naW5nIHRoZSBwcm9jZXNzIHRob3VnaCBhbmQgaGF2
aW5nIHR3bwpzZXBhcmF0ZSBmaXhlcyBicmFuY2hlcyBmb3IgRFQgYW5kIG5vbi1EVCBjaGFuZ2Vz
LCBhcyBJIHRlbmQKdG8gaGF2ZSB0byB3cml0ZSB0d28gZGVzY3JpcHRpb25zIGZvciBvbmUgdGFn
IGFueXdheSwgYW5kCml0IHdvdWxkIGJlIG1vcmUgbmF0dXJhbCB0byBzZW5kIHRoZSBmaXhlcyBz
ZXBhcmF0ZWx5LgoKVGhlcmUgYXJlIGFscmVhZHkgc29tZSBtYWludGFpbmVycyB0aGF0IHNlbmQg
c3BsaXQgZml4ZXMgUFJzCmFueXdheSwgYnV0IHdlJ2QgaGF2ZSB0byBtYWtlIHN1cmUgdG8gY29t
bXVuaWNhdGUgaXQgdG8gZXZlcnlvbmUKYmVmb3JlIHdlIG1ha2UgaXQgYSBnZW5lcmFsIHJlcXVp
cmVtZW50LgoKICAgICAgQXJuZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
