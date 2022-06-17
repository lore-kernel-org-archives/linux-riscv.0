Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B19C43334
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jun 2022 03:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=KRqyzbQgfMRh1FbYSlilOXec1DlLpztabjmYD4dfNY4=; b=pcViwT5VvucKaCfq3fYBJqerd6
	XjSD8XtUXKHcMWf/U8avyqGFWAXPOzuzNH41RvIij9X7WJwuk32cT87Uh6WA7uTmBD4p9yC5jKeuV
	rXoVwNv+GHYQxLYSpGF7/26UKgMJduCd9VI6Nbq0JFV1oClF/7xiF65HAzE2n0J63ZEyMnhRzKIH3
	qQkKDwCKz9Mq52o2pWeSrNg7gN7X+KZldvZ5OPXmk4E5qz/fyf5+fROXA5sw8CJiFKGQqBreQLi+Y
	pw0G8NzE+sti4zQ8OUMPOTQt8fJbTHH1Hq7BXhAab2KQ7yLePVHyUww3T4IQz/eXDz8RXbaaU+640
	x+ZOvdPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o22zR-005KLZ-GT; Fri, 17 Jun 2022 03:49:45 +0000
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o22zO-005KKS-2j
	for linux-riscv@lists.infradead.org; Fri, 17 Jun 2022 03:49:43 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 18DBD5C00C8;
	Thu, 16 Jun 2022 23:49:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 16 Jun 2022 23:49:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1655437781; x=
	1655524181; bh=Xm4aMYc0ZNtEYl9j1l1e/6xeNVUCElp52aNbQzNgfO0=; b=g
	0RMck67KBi9ll2qjD1r8UgBWVlWgaZAHPJGA8W5su7OsxkxulebkHQZwpYV7NCGm
	GaLu0dj/vUESHj5hGrmu+9Qd7Yd04ZJfv0WIRx1ym4Za17F2fKNQtVCVyC/qgwHr
	Pr2MaA7X+NoiT/7RCN52lVddIrXRZzLJJNiBYFUfPcR4gmurDI/fsJTmLnXOeABK
	9FhPz+m8qd5S4IbGgLWsxitIN0SafForYws+69XsodA13cMgt6pnxk5ncDHDWQcj
	MsBq6UknhEq3C4kGkgMSXCOouZXQ3n6gIEQsOjiBdgiGOHPST8j54irboOluv4OH
	U1HS2mvzY586vzZB8Ys0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1655437781; x=
	1655524181; bh=Xm4aMYc0ZNtEYl9j1l1e/6xeNVUCElp52aNbQzNgfO0=; b=c
	p86UOzUBGr+Ss2cJYPpLqodX8rbLMkrt4xDWPtYb7ewv55jB03AcHv3LlX2u0I8M
	b8sLpmnwrYhG5pOuO5LeHnzqkb2sbk3vaoGg/8FI1N7DJFM1OLqT8Ni3IcmvfcC/
	zDB0Nk8xUNQmk5eLPw2Pp2q1nFXsPTZyKVjDBtH5KjtHl7dz8PvQHLaHmQWPgLmI
	XpgQCAqJf5Qyv/VLMLgqaTRWa9D2vkvzShMFCVOqADKnL8z+NJvhA+KnmLwXeRwQ
	540bMEjA93yObFeS3/6fhnRi0m6cbe6iPnpSRXHZxWDmDFkEcyjymY7p0M0/HUXF
	cYTsr86omAz67cuGCq9sg==
X-ME-Sender: <xms:0_mrYv0VVhv-UDPp4flh9hIKuKnebhAq3Y1wNbAc7sDVvSDFcgUWgw>
    <xme:0_mrYuHGmu4wwT3wyLd75xQ6go19WP0o7KECbhujuLrdXeGw9NorZRf1ZyxQhsc5P
    ZLWgTI6Z_oTTTdAmA>
X-ME-Received: <xmr:0_mrYv4rYRNxsxpNTWuhSBRGpr2kZqncvNXMwNXJTjyVvEA6OzfOExGpPHoXO4iahvue4XEt8z6f2tnMQ-fMdgbkDgiQr_Rsc5PxCw6e2wmUMqSBTEQIaYSLyg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvgedgjeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvvehfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpeejleefuddtgeegvedvkeehfeejfeevgfefiefffeegudeiuedt
    heekjeelgeeujeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhl
    rghnugdrohhrgh
X-ME-Proxy: <xmx:0_mrYk1b8aRKIad3XD0Djdbqh1OcoXQdxXj8NkgRYphFmL_128gnQQ>
    <xmx:0_mrYiHSCkC_X-qk9A4KCrCpdXQpbuBA0e0ZkeuWHhWytEmQDdy7Ug>
    <xmx:0_mrYl-6t9Kp904tXbkGrb26ch98i05PL8LdHb6OPn4w-kG7FcFnbw>
    <xmx:1fmrYgEGz3hSlrT77P_RUwRF_EeN0Wgge5UGPITuSj942krXxzGLmw>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Jun 2022 23:49:38 -0400 (EDT)
Subject: Re: [PATCH v3] arch/riscv: add Zihintpause support
To: Dao Lu <daolu@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Wei Fu <wefu@redhat.com>, Niklas Cassel <niklas.cassel@wdc.com>,
 Alexandre Ghiti <alexandre.ghiti@canonical.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Qinglin Pan <panqinglin2020@iscas.ac.cn>, Rob Herring <robh@kernel.org>,
 Tsukasa OI <research_trasio@irq.a4lg.com>, Yury Norov
 <yury.norov@gmail.com>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>
References: <20220615211415.3111271-1-daolu@rivosinc.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <6b52cc2c-7bc5-5015-b7a6-4c13bb4789f7@sholland.org>
Date: Thu, 16 Jun 2022 22:49:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20220615211415.3111271-1-daolu@rivosinc.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_204942_285536_856DF7B6 
X-CRM114-Status: GOOD (  23.25  )
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

T24gNi8xNS8yMiA0OjE0IFBNLCBEYW8gTHUgd3JvdGU6Cj4gSW1wbGVtZW50IHN1cHBvcnQgZm9y
IHRoZSBaaUhpbnRQYXVzZSBleHRlbnNpb24uCj4gCj4gVGhlIFBBVVNFIGluc3RydWN0aW9uIGlz
IGEgSElOVCB0aGF0IGluZGljYXRlcyB0aGUgY3VycmVudCBoYXJ04oCZcyByYXRlCj4gb2YgaW5z
dHJ1Y3Rpb24gcmV0aXJlbWVudCBzaG91bGQgYmUgdGVtcG9yYXJpbHkgcmVkdWNlZCBvciBwYXVz
ZWQuCj4gCj4gUmV2aWV3ZWQtYnk6IEhlaWtvIFN0dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+Cj4g
VGVzdGVkLWJ5OiBIZWlrbyBTdHVlYm5lciA8aGVpa29Ac250ZWNoLmRlPgo+IFNpZ25lZC1vZmYt
Ynk6IERhbyBMdSA8ZGFvbHVAcml2b3NpbmMuY29tPgo+IC0tLQo+IAo+IHYxIC0+IHYyOgo+ICBS
ZW1vdmUgdGhlIHVzYWdlIG9mIHN0YXRpYyBicmFuY2gsIHVzZSBQQVVTRSBpZiB0b29sY2hhaW4g
c3VwcG9ydHMgaXQKPiB2MiAtPiB2MzoKPiAgQWRkZWQgdGhlIHN0YXRpYyBicmFuY2ggYmFjaywg
Y3B1X3JlbGF4KCkgYmVoYXZpb3IgaXMgdW5jaGFuZ2VkIGlmIGVpdGhlciB0aGUKPiBzeXN0ZW0g
b3IgdGhlIHRvb2xjaGFpbiBkb2VzIG5vdCBzdXBwb3J0IFppSGludFBhdXNlCj4gLS0tCj4gIGFy
Y2gvcmlzY3YvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICB8ICA0ICsrKysKPiAgYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oICAgICAgICAgIHwgIDEgKwo+ICBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3Zkc28vcHJvY2Vzc29yLmggfCAxOSArKysrKysrKysrKysrKysrLS0tCj4gIGFy
Y2gvcmlzY3Yva2VybmVsL2NwdS5jICAgICAgICAgICAgICAgICB8ICAxICsKPiAgYXJjaC9yaXNj
di9rZXJuZWwvY3B1ZmVhdHVyZS5jICAgICAgICAgIHwgIDggKysrKysrKysKPiAgNSBmaWxlcyBj
aGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L01ha2VmaWxlIGIvYXJjaC9yaXNjdi9NYWtlZmlsZQo+IGluZGV4IDM0Y2Y4
YTU5ODYxNy4uNmRkYWNjNmY0NGI5IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvTWFrZWZpbGUK
PiArKysgYi9hcmNoL3Jpc2N2L01ha2VmaWxlCj4gQEAgLTU2LDYgKzU2LDEwIEBAIHJpc2N2LW1h
cmNoLSQoQ09ORklHX1JJU0NWX0lTQV9DKQk6PSAkKHJpc2N2LW1hcmNoLXkpYwo+ICB0b29sY2hh
aW4tbmVlZC16aWNzci16aWZlbmNlaSA6PSAkKGNhbGwgY2Mtb3B0aW9uLXluLCAtbWFyY2g9JChy
aXNjdi1tYXJjaC15KV96aWNzcl96aWZlbmNlaSkKPiAgcmlzY3YtbWFyY2gtJCh0b29sY2hhaW4t
bmVlZC16aWNzci16aWZlbmNlaSkgOj0gJChyaXNjdi1tYXJjaC15KV96aWNzcl96aWZlbmNlaQo+
ICAKPiArIyBDaGVjayBpZiB0aGUgdG9vbGNoYWluIHN1cHBvcnRzIFppaGludHBhdXNlIGV4dGVu
c2lvbgo+ICt0b29sY2hhaW4tc3VwcG9ydHMtemloaW50cGF1c2UgOj0gJChjYWxsIGNjLW9wdGlv
bi15biwgLW1hcmNoPSQocmlzY3YtbWFyY2gteSlfemloaW50cGF1c2UpCj4gK3Jpc2N2LW1hcmNo
LSQodG9vbGNoYWluLXN1cHBvcnRzLXppaGludHBhdXNlKSA6PSAkKHJpc2N2LW1hcmNoLXkpX3pp
aGludHBhdXNlCj4gKwo+ICBLQlVJTERfQ0ZMQUdTICs9IC1tYXJjaD0kKHN1YnN0IGZkLCwkKHJp
c2N2LW1hcmNoLXkpKQo+ICBLQlVJTERfQUZMQUdTICs9IC1tYXJjaD0kKHJpc2N2LW1hcmNoLXkp
Cj4gIAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKPiBpbmRleCA0ZTI0ODY4ODE4NDAuLmYyNGY0Zjhj
OTE0NCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKPiArKysg
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKPiBAQCAtNTMsNiArNTMsNyBAQCBleHRl
cm4gdW5zaWduZWQgbG9uZyBlbGZfaHdjYXA7Cj4gIGVudW0gcmlzY3ZfaXNhX2V4dF9pZCB7Cj4g
IAlSSVNDVl9JU0FfRVhUX1NTQ09GUE1GID0gUklTQ1ZfSVNBX0VYVF9CQVNFLAo+ICAJUklTQ1Zf
SVNBX0VYVF9TVlBCTVQsCj4gKwlSSVNDVl9JU0FfRVhUX1pJSElOVFBBVVNFLAo+ICAJUklTQ1Zf
SVNBX0VYVF9JRF9NQVggPSBSSVNDVl9JU0FfRVhUX01BWCwKPiAgfTsKPiAgCj4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmRzby9wcm9jZXNzb3IuaCBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vdmRzby9wcm9jZXNzb3IuaAo+IGluZGV4IDEzNDM4OGNiYWFhMS4uMzE0ZWMx
N2M0MGQ4IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmRzby9wcm9jZXNz
b3IuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmRzby9wcm9jZXNzb3IuaAo+IEBA
IC00LDE1ICs0LDI4IEBACj4gIAo+ICAjaWZuZGVmIF9fQVNTRU1CTFlfXwo+ICAKPiArI2luY2x1
ZGUgPGxpbnV4L2p1bXBfbGFiZWwuaD4KPiAgI2luY2x1ZGUgPGFzbS9iYXJyaWVyLmg+Cj4gKyNp
bmNsdWRlIDxhc20vaHdjYXAuaD4KPiAgCj4gK2V4dGVybiBzdHJ1Y3Qgc3RhdGljX2tleV9mYWxz
ZSByaXNjdl9wYXVzZV9hdmFpbGFibGU7Cj4gIHN0YXRpYyBpbmxpbmUgdm9pZCBjcHVfcmVsYXgo
dm9pZCkKPiAgewo+ICsJaWYgKCFzdGF0aWNfYnJhbmNoX2xpa2VseSgmcmlzY3ZfcGF1c2VfYXZh
aWxhYmxlKSkgewo+ICAjaWZkZWYgX19yaXNjdl9tdWxkaXYKPiAtCWludCBkdW1teTsKPiAtCS8q
IEluIGxpZXUgb2YgYSBoYWx0IGluc3RydWN0aW9uLCBpbmR1Y2UgYSBsb25nLWxhdGVuY3kgc3Rh
bGwuICovCj4gLQlfX2FzbV9fIF9fdm9sYXRpbGVfXyAoImRpdiAlMCwgJTAsIHplcm8iIDogIj1y
IiAoZHVtbXkpKTsKPiArCQlpbnQgZHVtbXk7Cj4gKwkJLyogSW4gbGlldSBvZiBhIGhhbHQgaW5z
dHJ1Y3Rpb24sIGluZHVjZSBhIGxvbmctbGF0ZW5jeSBzdGFsbC4gKi8KPiArCQlfX2FzbV9fIF9f
dm9sYXRpbGVfXyAoImRpdiAlMCwgJTAsIHplcm8iIDogIj1yIiAoZHVtbXkpKTsKPiAgI2VuZGlm
Cj4gKyNpZmRlZiBfX3Jpc2N2X3ppaGludHBhdXNlCj4gKwl9IGVsc2Ugewo+ICsJCS8qCj4gKwkJ
ICogUmVkdWNlIGluc3RydWN0aW9uIHJldGlyZW1lbnQuCj4gKwkJICogVGhpcyBhc3N1bWVzIHRo
ZSBQQyBjaGFuZ2VzLgo+ICsJCSAqLwo+ICsJCV9fYXNtX18gX192b2xhdGlsZV9fICgicGF1c2Ui
KTsKPiArI2VuZGlmCj4gKwl9Cj4gIAliYXJyaWVyKCk7Cj4gIH0KPiAgCj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva2VybmVsL2NwdS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1LmMKPiBpbmRl
eCBmYmE5ZTlmNDZhOGMuLmExMjNlOTJiMTRkZCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tl
cm5lbC9jcHUuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdS5jCj4gQEAgLTg5LDYgKzg5
LDcgQEAgaW50IHJpc2N2X29mX3BhcmVudF9oYXJ0aWQoc3RydWN0IGRldmljZV9ub2RlICpub2Rl
KQo+ICBzdGF0aWMgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSBpc2FfZXh0X2FycltdID0gewo+
ICAJX19SSVNDVl9JU0FfRVhUX0RBVEEoc3Njb2ZwbWYsIFJJU0NWX0lTQV9FWFRfU1NDT0ZQTUYp
LAo+ICAJX19SSVNDVl9JU0FfRVhUX0RBVEEoc3ZwYm10LCBSSVNDVl9JU0FfRVhUX1NWUEJNVCks
Cj4gKwlfX1JJU0NWX0lTQV9FWFRfREFUQSh6aWhpbnRwYXVzZSwgUklTQ1ZfSVNBX0VYVF9aSUhJ
TlRQQVVTRSksCj4gIAlfX1JJU0NWX0lTQV9FWFRfREFUQSgiIiwgUklTQ1ZfSVNBX0VYVF9NQVgp
LAo+ICB9Owo+ICAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5j
IGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gaW5kZXggYTZmNjJhNmQxZWRkLi43
OGMyODRjNDg3ZTggMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5j
Cj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gQEAgLTMwLDYgKzMwLDgg
QEAgc3RhdGljIERFQ0xBUkVfQklUTUFQKHJpc2N2X2lzYSwgUklTQ1ZfSVNBX0VYVF9NQVgpIF9f
cmVhZF9tb3N0bHk7Cj4gICNpZmRlZiBDT05GSUdfRlBVCj4gIF9fcm9fYWZ0ZXJfaW5pdCBERUZJ
TkVfU1RBVElDX0tFWV9GQUxTRShjcHVfaHdjYXBfZnB1KTsKPiAgI2VuZGlmCj4gK0RFRklORV9T
VEFUSUNfS0VZX0ZBTFNFKHJpc2N2X3BhdXNlX2F2YWlsYWJsZSk7Cj4gK0VYUE9SVF9TWU1CT0xf
R1BMKHJpc2N2X3BhdXNlX2F2YWlsYWJsZSk7CgpUaGlzIHBhdGNoIHNob3VsZCBwcm9iYWJseSBi
ZSByZWJhc2VkIHRvIHVzZSB0aGUgdW5pZmllZCBzdGF0aWMga2V5Cm1lY2hhbmlzbVsxXSwgc2lu
Y2UgdGhhdCBwYXRjaCBoYXMgbm93IGJlZW4gbWVyZ2VkLgoKUmVnYXJkcywKU2FtdWVsCgpbMV06
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjIwNTIyMTUzNTQzLjI2NTYt
Mi1qc3poYW5nQGtlcm5lbC5vcmcvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
