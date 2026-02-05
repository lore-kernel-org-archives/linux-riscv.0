Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B79AE9128E
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 07:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zF/IRIxO8Q76yLO/jTf310fgrkNaYP6YKaFfo/MBYWc=; b=eUTB19sOQz6v/RZT5piAz/F3nM
	waq0YoI54/K1V6oaAMlOF3Z0C/SL/A/a9BCLIJdsvwHubLMXJskDEC969XmXv/6ihsDgpW9aKYBMn
	wkcTgo6PybESyepIZjFFIU/XlH31OQy7DFsSuySIb0+J3G0gbm6X1ib9h3P0KZpe5QyWpAUfoldk4
	eASZQlykqWPM51wnBN1jafSY9wDL++O0vgeU6C0Njrae7m9C55B9f5MHpUro69SRhbb/exbc+AATD
	VG8tFcoTbZssqUSZC8Tk/kc98czD6NsVzkokXjrmk+Kim+FwY5GDHC7StLs0g94FMPNPZ6qz/KANc
	4BD2pcKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnuG8-00000009ac1-1Xrw;
	Thu, 05 Feb 2026 07:58:40 +0000
Received: from fout-a4-smtp.messagingengine.com ([103.168.172.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnuG3-00000009ab9-3jgy
	for linux-riscv@lists.infradead.org;
	Thu, 05 Feb 2026 07:58:38 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 4111CEC0562;
	Thu,  5 Feb 2026 02:58:32 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 05 Feb 2026 02:58:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1770278312;
	 x=1770364712; bh=NcrU81+fnhXaSVX9sn3CITROGjdo+DCLl0eqiW6c8VE=; b=
	jCnUnAC7QV46AkQm56Y/ouLSQjbL84T8u9ws0wqRA1Jpy8amNqNcHBo0I7URHzm+
	5NHDeDE5dFbcOHd1IkGS/VbWKmieXsoIUZMo34pgCtvdmD5oM0RVyKSNTQLIa+Pf
	xpTicbjYESf1UAr0hVbV8rFlDRmsX4meBrtFOF+GthK1txzlWMxz9MVEqZAavO36
	EUm2t18Nj2cF1WhPODbdxzoFbylcI/5cbPye5edEkOdm2Op0kXwNV9ip/XxrQmkx
	Ro44YlNgvRFfYUaFcXKtyThJ8qf0j37n3A0dIcH5GQBXWmM2rEkjuAoZdGBCAkjs
	xGiZvXAWCe2RpUpwuxir8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1770278312; x=
	1770364712; bh=NcrU81+fnhXaSVX9sn3CITROGjdo+DCLl0eqiW6c8VE=; b=k
	h4+rASOzOR6SrbEXY5AxdYKO3gHXdAKmy0dg6428zwsKGBkU0MquFYQqPdEFax5W
	MldJWHxCKVyddRo8/fDlfxk0QtdulCq6Wq6HqkaG4Olh3w5c/F5zstfP8t2vxrqk
	Gy5L1aKgXW+9Tu19/5ScXJn/Dcj5/WvPMpPN2Fp4Q6KU6cbdZQ4fXjrUFhy7uJ9u
	9plocS9MpUfWukqra7iPssEK3LnwobG7IEqzkqpE4mNaWiWk1IRuwYYQ7TimP2Q8
	pioX3dVcLcN+NePRvr18lBriMT9/LSZwMdpth6K5NeYG/0om3NUpgVDbyPkHaLcF
	+F21zl3ofYFUAs5qaHf+w==
X-ME-Sender: <xms:p02EaaSgx017jfaGLmCesp-Pg1NsJyAty_BRLm47xzDKZpc5ilAl0w>
    <xme:p02EaamREaMM3iRNEHhwSFa1N4ezJm1v2GnLDg_5D58sH2u1MPwrK09vWUyMAvgjd
    fncLb_pi2BUHyQgqL2JfH2suYkjqMuZ2u3YLWY3DazcSXJ_2vQnDXg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukeegjeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepuddvpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegsvghnjedujeesrghnuggvshhtvggthhdrtghomhdprhgtphhtth
    hopehmihhnrggthhhouhesrghnuggvshhtvggthhdrtghomhdprhgtphhtthhopehrrghn
    ugholhhphhesrghnuggvshhtvggthhdrtghomhdprhgtphhtthhopehtihhmiedtleesrg
    hnuggvshhtvggthhdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdr
    tghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtg
    hpthhtoheprghlvgigsehghhhithhirdhfrhdprhgtphhtthhopegriiejtddtvddusehg
    mhgrihhlrdgtohhmpdhrtghpthhtohepphhjfieskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:p02EaRiJWqJLzqy9nuTwXBtALAS8Quo9-z-dD8QtERr4E48qz_bUBg>
    <xmx:p02EaciORQ-BgEO_1zBZ0jG_6jg-cZSUgUgRizbc2w5FULChmKooFA>
    <xmx:p02EafGFL6huMW4FehMI3A-3pLbTrf68VI-OgfTgkzJNMA1cG4VRVg>
    <xmx:p02EaZDZaNQ8DkZTIK_BvUCKboTZXHqn66p_YMxwPvpxgLVJvctr_w>
    <xmx:qE2EaVEIvBoM1q3mHTM619SqjVvt1PcezXGecRDoPJdlkIXtP5K3eylP>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4348B700065; Thu,  5 Feb 2026 02:58:31 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ALU_AqKd0drw
Date: Thu, 05 Feb 2026 08:57:54 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Hui Min Mina Chou" <minachou@andestech.com>,
 "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Linux-Arch <linux-arch@vger.kernel.org>
Cc: tim609@andestech.com, "Ben Zong-You Xie" <ben717@andestech.com>,
 az70021@gmail.com, Randolph <randolph@andestech.com>
Message-Id: <af2c346e-c878-45dd-93b9-b19c80627651@app.fastmail.com>
In-Reply-To: <20260205055800.586458-1-minachou@andestech.com>
References: <20260205055800.586458-1-minachou@andestech.com>
Subject: Re: [PATCH] riscv: Fix __kernel_off_t to 64 Bits in RV32
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_235836_494358_0DE95C6B 
X-CRM114-Status: GOOD (  29.51  )
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

T24gVGh1LCBGZWIgNSwgMjAyNiwgYXQgMDY6NTgsIEh1aSBNaW4gTWluYSBDaG91IHdyb3RlOgo+
IEZyb206IFJhbmRvbHBoIDxyYW5kb2xwaEBhbmRlc3RlY2guY29tPgo+Cj4gTW9kaWZ5IHRoZSBf
X2tlcm5lbF9vZmZfdCB0eXBlIGZvciBSVjMyIHRvIDY0IGJpdHMgdG8gY29tcGx5IHdpdGgKPiB0
aGUgY3VycmVudCBnbGliYyBjYWxsaW5nIGNvbnZlbnRpb24uCj4KPiBJbiBSSVNDLVYsIG9mZl90
IGlzIDY0IGJpdHMgaW4gZ2xpYmMsIGFuZCBfX2tlcm5lbF9vZmZfdCBtdXN0IG1hdGNoCj4gdGhp
cyBzaXplLiBGb3IgUlYzMiwgdGhlIGtlcm5lbCB1c2VzIHRoZSBsb25nIHR5cGUsIHdoaWNoIHNo
b3VsZCBiZQo+IGNoYW5nZWQgdG8gbG9uZyBsb25nIHRvIGVuc3VyZSBjb25zaXN0ZW5jeS4KCkkg
ZG9uJ3QgdGhpbmsgd2UgY2FuIGNoYW5nZSB0aGUgQUJJIGluY29tcGF0aWJseSBsaWtlIHRoaXMs
Cml0IGJyZWFrcyBhbnkgY3VycmVudCB1c2VyIG9mIGxvdy1sZXZlbCBpbnRlcmZhY2UgdGhhdCBl
eHBlY3RzCnRoZSBsZWdhY3kgdHlwZXMsIHdoZW5ldmVyIHlvdSBtaXggYSB1c2Vyc3BhY2UgYmlu
YXJ5IGJ1aWx0IGFnYWluc3QKb2xkIGtlcm5lbCBoZWFkZXJzIHdpdGggYSBuZXcga2VybmVsLCBv
ciB2aWNlIHZlcnNhLgoKRnJvbSBsb29raW5nIGF0IHVjbGliYyBzb3VyY2VzLCBJIGJlbGlldmUg
dGhleSBzdGlsbCBkZWZhdWx0IHRvCmEgMzItYml0IG9mZl90IG9uIGFsbCAzMi1iaXQgYXJjaGl0
ZWN0dXJlcy4KCj4gVG8gYWRkcmVzcyB0aGUgWTIwMzggcHJvYmxlbSwgdGhlIGdsaWJjIHVwc3Ry
ZWFtIGZvciBSSVNDLVYgaGFzIGFkb3B0ZWQKPiA2NC1iaXQgdGltZV90IGFuZCBvZmZfdCBmb3Ig
Ym90aCBSVjMyIGFuZCBSVjY0IFsqMV0uCj4gSG93ZXZlciwgbm8gY29ycmVzcG9uZGluZyBtb2Rp
ZmljYXRpb24gd2FzIG1hZGUgb24gdGhlIGtlcm5lbCBzaWRlLAo+IGxlYWRpbmcgdG8gdGVzdCBj
YXNlIGZhaWx1cmVzIGluIExUUOKAmXMgZm5jdGwgZHVlIHRvIHNpemUgaW5jb25zaXN0ZW5jaWVz
Lgo+IFRoaXMgZGlzY3JlcGFuY3kgY2F1c2VzIGVycm9ycyB3aGVuIGdsaWJjIHBhc3NlcyB0aGUg
c3RydWN0IGZsb2NrCj4gcGFyYW1ldGVyIHRvIHRoZSBrZXJuZWwgdGhyb3VnaCBmbmN0bCgpLgoK
SSdtIG5vdCBzdXJlIGlmIHRoaXMgaXMgYSBidWcgaW4gTFRQIG9yIGdsaWJjLCBidXQgbm90aGlu
ZyBzaG91bGQKZXZlciBtaXggdGhlIGxvdy1sZXZlbCBrZXJuZWwgaW50ZXJmYWNlcyB3aXRoIHRo
ZSBnbGliYyB0eXBlcy4KClJlZ2FyZGxlc3Mgb2YgdGhlIGFyY2hpdGVjdHVyZSwgdGhlIG9ubHkg
Y29tYmluYXRpb25zIHRoYXQgYXJlCmFsbG93ZWQgYXJlOgoKIC0gbGliYyBmY250bCgpIHdpdGgg
bGliYyAnc3RydWN0IGZsb2NrJwogLSBsaWJjIGZjbnRsNjQoKSB3aXRoIGxpYmMgJ3N0cnVjdCBm
bG9jazY0JwogLSBzeXNjYWxsKF9fTlJfZmNudGwsIC4uLikgd2l0aCBrZXJuZWwgJ3N0cnVjdCBm
bG9jaycKIC0gc3lzY2FsbChfX05SX2ZjbnRsNjQsIC4uLikgd2l0aCBrZXJuZWwgJ3N0cnVjdCBm
bG9jazY0JwoKV2hlbiB1c2luZyA2NC1iaXQgb2ZmX3QgaW4gZ2xpYmMsIHRoYXQgc2hvdWxkIHRy
YW5zcGFyZW50bHkKbWFwIHRoZSBkZWZhdWx0IGZjbnRsIGltcGxlbWVudGF0aW9uIHRvIHRoZSBu
ZXdlciBrZXJuZWwKaW50ZXJmYWNlcyBhcyBkZXNjcmliZWQgaW4gdGhlIGZjbnRsIG1hbiBwYWdl
LgoKQ2FuIHlvdSBwb2ludCBvdXQgd2hpY2ggTFRQIHRlc3RzIGV4YWN0bHkgYXJlIGZhaWxpbmcs
IGFuZApjaGVjayB3aGljaCBjb21iaW5hdGlvbiB0aGV5IHVzZSBpbiB5b3VyIHZlcnNpb24/CgpJ
cyBpdCBwaWNraW5nIHVwIHRoZSAzMi1iaXQgdHlwZXMgZnJvbSB0aGUga2VybmVsIGhlYWRlcnMs
Cm9yIGlzIGl0IHRyeWluZyB0byBjYWxsIHRoZSBsZWdhY3kgX19OUl9mY250bCBzeXNjYWxsCndp
dGggdGhlIGdsaWJjIHR5cGU/CgpJIHNlZSBhIHNwZWNpYWwgY2FzZSBpbgpsdHAvdGVzdGNhc2Vz
L2tlcm5lbC9zeXNjYWxscy9mY250bC9mY250bF9jb21tb24uaCwgYnV0IHRoYXQKc2VlbXMgdG8g
dXNlIHRoZSBsb3ctbGV2ZWwga2VybmVsIGludGVyZmFjZXMgY29ycmVjdGx5LgoKPiBUaGUgc3Ry
dWN0dXJlIG9mIGZsb2NrIGFyZSBzaG93biBhcyBiZWxvdzoKPgo+IHN0cnVjdCBmbG9jayBpbiBn
bGliYzoKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KPiBzdHJ1Y3QgZmxvY2sKPiAgIHsKPiAgICAgc2hvcnQgaW50IGxfdHlwZTsKPiAgICAg
c2hvcnQgaW50IGxfd2hlbmNlOwo+ICAgICBfX29mZl90IGxfc3RhcnQ7Cj4gICAgIF9fb2ZmX3Qg
bF9sZW47Cj4gICAgIF9fb2ZmNjRfdCBsX3N0YXJ0Owo+ICAgICBfX29mZjY0X3QgbF9sZW47ICAg
ICAgICAgICAgIDwtLS0tLS0gICJfX29mZjY0X3QiIGluIGdsaWJjIGlzIDY0Yml0Cj4gICAgIF9f
cGlkX3QgbF9waWQ7Cj4gICB9OwoKVGhlIGRlZmluaXRpb24gSSBzZWUgaGFzIHRoaXMgICNpZmRl
ZiBjaGVjazoKCnN0cnVjdCBmbG9jawogIHsKICAgIHNob3J0IGludCBsX3R5cGU7ICAgLyogVHlw
ZSBvZiBsb2NrOiBGX1JETENLLCBGX1dSTENLLCBvciBGX1VOTENLLiAgKi8KICAgIHNob3J0IGlu
dCBsX3doZW5jZTsgLyogV2hlcmUgYGxfc3RhcnQnIGlzIHJlbGF0aXZlIHRvIChsaWtlIGBsc2Vl
aycpLiAgKi8KI2lmIF9fV09SRFNJWkUgPT0gNjQgfHwgIWRlZmluZWQgX19VU0VfRklMRV9PRkZT
RVQ2NAogICAgX19vZmZfdCBsX3N0YXJ0OyAgICAvKiBPZmZzZXQgd2hlcmUgdGhlIGxvY2sgYmVn
aW5zLiAgKi8KICAgIF9fb2ZmX3QgbF9sZW47ICAgICAgLyogU2l6ZSBvZiB0aGUgbG9ja2VkIGFy
ZWE7IHplcm8gbWVhbnMgdW50aWwgRU9GLiAgKi8KI2Vsc2UKICAgIF9fb2ZmNjRfdCBsX3N0YXJ0
OyAgLyogT2Zmc2V0IHdoZXJlIHRoZSBsb2NrIGJlZ2lucy4gICovCiAgICBfX29mZjY0X3QgbF9s
ZW47ICAgIC8qIFNpemUgb2YgdGhlIGxvY2tlZCBhcmVhOyB6ZXJvIG1lYW5zIHVudGlsIEVPRi4g
ICovCiNlbmRpZgogICAgX19waWRfdCBsX3BpZDsgICAgICAvKiBQcm9jZXNzIGhvbGRpbmcgdGhl
IGxvY2suICAqLwogIH07CgpJIGFzc3VtZSBfX1VTRV9GSUxFX09GRlNFVDY0IGlzIGFsd2F5cyBz
ZXQgb24gcmlzY3YzMiwgc28gdGhlCnR3byBzdHJ1Y3R1cmVzIGFyZSBkZWZpbmVkIHRvIGJlIHRo
ZSBzYW1lIGFuZCBtYXRjaCB0aGUga2VybmVsJ3MKZmxvY2s2NC4KClRoZSBkZWZpbml0aW9uIGlz
IG90aGVyd2lzZSB0aGUgc2FtZSBhcyBvbiBtb3N0IDMyLWJpdCBhcmNoaXRlY3R1cmVzLgoKSW50
ZXJlc3RpbmdseSwgbWljcm9ibGF6ZSBkb2VzIG5vdCBldmVuIGhhdmUgdGhhdCAjaWYgYmxvY2sK
YW5kIGluc3RlYWQgZGVmaW5lcyBpdHMgJ3N0cnVjdCBmbG9jaycgdW5jb25kaXRpb25hbGx5IHdp
dGgKYSAzMi1iaXQgX19vZmZfdCwgd2hpY2ggaXMgcHJvYmFibHkgYSBidWcgaW4gZ2xpYmMuCgo+
ICsvKgo+ICsgKiBJbiB0aGUgZ2VuZXJpYyBmbG93LCB0aGlzIGZpbGUgaXMgYXV0b21hdGljYWxs
eSBjcmVhdGVkIGlmIGl0IGRvZXMgCj4gbm90Cj4gKyAqIGFscmVhZHkgZXhpc3QsIGFzIGluZGlj
YXRlZCBieSB0aGUgbGluZS4KPiArICogIiNpbmNsdWRlIDxhc20tZ2VuZXJpYy9wb3NpeF90eXBl
cy5oPiIKPiArICoKPiArICogSWYgdGhlIGZpbGUgYWxyZWFkeSBleGlzdHMsIHRoZSBhdXRvbWF0
aWMgY3JlYXRpb24gcHJvY2VzcyB3aWxsIGJlIAo+IHNraXBwZWQuCj4gKyAqIEFkZGluZyBhcmNo
aXRlY3R1cmUtc3BlY2lmaWMgdHlwZXMgdG8gdGhpcyBmaWxlIG1heSBhbHRlciB0aGUgCj4gZ2Vu
ZXJpYyBmbG93LAo+ICsgKiBwb3RlbnRpYWxseSBjYXVzaW5nIHR5cGUgY29uZmxpY3RzIGR1cmlu
ZyB0aGUgYnVpbGQgcGhhc2UuIFRvIGF2b2lkIAo+IHRoaXMsCj4gKyAqIGRlZmluZSBhIHZhcmlh
YmxlIHRvIGluc3RydWN0IHRoZSBnZW5lcmljIGNvZGUgdG8gc2tpcCB0aGUgCj4gcmUtdHlwZWRl
Zgo+ICsgKiBwcm9jZXNzLgo+ICsgKi8KClRoZXJlIGlzIHJlYWxseSBubyBuZWVkIHRvIGV4cGxh
aW4gaG93IHRoZSBidWlsZCBzeXN0ZW0gd29ya3MgaGVyZS4KCj4gKyNpZiBfX0JJVFNfUEVSX0xP
TkcgPT0gMzIKPiArdHlwZWRlZiBsb25nIGxvbmcJCV9fa2VybmVsX29mZl90Owo+ICsjZGVmaW5l
IF9hcmNoX2tlcm5lbF9vZmZfdAlfYXJjaF9rZXJuZWxfb2ZmX3QKPiArI2VuZGlmCgpUaGlzIGRv
ZXMgbm90IGZvbGxvdyB0aGUgbm9ybWFsIHN0eWxlIGZvciBvdmVycmlkaW5nIHR5cGVzLgpZb3Ug
YXJlIGFsc28gYnJlYWtpbmcgdGhlIGNvbXBhdCBzeXNjYWxsIGZvciBydjY0IGtlcm5lbHMsCndo
aWNoIHdvdWxkIGhhdmUgdG8gb3ZlcnJpZGUgY29tcGF0X29mZl90LgoKICAgICBBcm5kCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
