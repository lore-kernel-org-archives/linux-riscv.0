Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 342CBC87FCE
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 14:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+H2tDL3AVumseQSh5NZRd7gQ5X+lorsG32Wit3qcceA=; b=Za/1+Nat8Tv7f7
	ZG+ON3q5FW25A5NzvRRJGciuLH6uBIzfSlrrS4769IIeGgDZIIBzbuHd5Lbs0Xj74lA5DGCjmrEKF
	AiFxdHwM+EeY302MsI+SQKHux0JW8KJro+GoZXhXDLpudhxNcN30QbIEF6O0ueGJafCzrjB/HooX4
	tQugqU8L7I971Ye4LNWqI5Yls/l57PbFeE1G00i6epy1sXZmCdDoQJlgFtkkSi42eq/etH95Wjxnr
	BdAme5FLejBlRkDkxz7QqYUglFFYdgjTH5TZiMOJB83O0PlZmveyHfuB7+CDijlObEUe6RGlp6tHS
	wqyZM/YLw172tg0wvbdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufJRL-0000000A0pR-3bWW;
	Fri, 25 Jul 2025 14:30:27 +0000
Received: from relay16.mail.gandi.net ([2001:4b98:dc4:8::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufJRJ-0000000A0oK-0JoZ
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 14:30:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2F847449AA;
	Fri, 25 Jul 2025 14:30:21 +0000 (UTC)
Message-ID: <77437392-5d68-4620-ba05-08eba133b547@ghiti.fr>
Date: Fri, 25 Jul 2025 16:30:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] riscv: pack rv64 thread_info better
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
 linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Deepak Gupta <debug@rivosinc.com>
References: <20250722160556.2216925-2-rkrcmar@ventanamicro.com>
 <20250722160556.2216925-5-rkrcmar@ventanamicro.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250722160556.2216925-5-rkrcmar@ventanamicro.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdekfeejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnheptdeguefhhfevueejteevveeikeelkedvffdufeelveeggfeikeekgfeghfdttdevnecukfhppeelhedrudeguddruddtvddrudekieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelhedrudeguddruddtvddrudekiedphhgvlhhopegluddtrddutddrudegiedrvddujegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepjedprhgtphhtthhopehrkhhrtghmrghrsehvvghnthgrnhgrmhhitghrohdrtghomhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmp
 dhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopeguvggsuhhgsehrihhvohhsihhntgdrtghomh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_073025_259444_58ACD3AA 
X-CRM114-Status: GOOD (  15.01  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIDcvMjIvMjUgMTg6MDUsIFJhZGltIEtyxI1tw6HFmSB3cm90ZToKPiBPbiBydjY0LCBwcmVl
bXB0X2NvdW50IGFuZCBjcHUgd2VyZSBib3RoIDMyLWJpdCBmb2xsb3dlZCBieSA2NC1iaXQsIHNv
Cj4gcGxhY2luZyBvbmUgaW4gdGhlIGhvbGUgc2F2ZXMgOCBieXRlcyBpbiB0aGUgc3RydWN0Lgo+
Cj4gU2lnbmVkLW9mZi1ieTogUmFkaW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5j
b20+Cj4gLS0tCj4gICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmggfCAyICst
Cj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmggYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmgKPiBpbmRleCBmNTkxNmE3MDg3OWEuLmMyNjdk
NmJkODM4ZSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RocmVhZF9pbmZv
LmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmgKPiBAQCAtNTMs
NiArNTMsNyBAQAo+ICAgc3RydWN0IHRocmVhZF9pbmZvIHsKPiAgIAl1bnNpZ25lZCBsb25nCQlm
bGFnczsJCS8qIGxvdyBsZXZlbCBmbGFncyAqLwo+ICAgCWludCAgICAgICAgICAgICAgICAgICAg
IHByZWVtcHRfY291bnQ7ICAvKiAwPT5wcmVlbXB0aWJsZSwgPDA9PkJVRyAqLwo+ICsJaW50CQkJ
Y3B1Owo+ICAgCS8qCj4gICAJICogVGhlc2Ugc3RhY2sgcG9pbnRlcnMgYXJlIG92ZXJ3cml0dGVu
IG9uIGV2ZXJ5IHN5c3RlbSBjYWxsIG9yCj4gICAJICogZXhjZXB0aW9uLiAgU1AgaXMgYWxzbyBz
YXZlZCB0byB0aGUgc3RhY2sgaXQgY2FuIGJlIHJlY292ZXJlZCB3aGVuCj4gQEAgLTYwLDcgKzYx
LDYgQEAgc3RydWN0IHRocmVhZF9pbmZvIHsKPiAgIAkgKi8KPiAgIAlsb25nCQkJa2VybmVsX3Nw
OwkvKiBLZXJuZWwgc3RhY2sgcG9pbnRlciAqLwo+ICAgCWxvbmcJCQl1c2VyX3NwOwkvKiBVc2Vy
IHN0YWNrIHBvaW50ZXIgKi8KPiAtCWludAkJCWNwdTsKPiAgIAl1bnNpZ25lZCBsb25nCQlzeXNj
YWxsX3dvcms7CS8qIFNZU0NBTExfV09SS18gZmxhZ3MgKi8KPiAgICNpZmRlZiBDT05GSUdfU0hB
RE9XX0NBTExfU1RBQ0sKPiAgIAl2b2lkCQkJKnNjc19iYXNlOwoKCkdyZWF0LCB0aGF0IG5vdyBm
aXRzIGludG8gYSBjYWNoZWxpbmUuIEkgZ3Vlc3Mgb3RoZXIgc3RydWN0dXJlcyB3b3VsZCAKZGVz
ZXJ2ZSB0aGUgc2FtZSBhdHRlbnRpb24uCgpZb3UgY2FuIGFkZDoKClRlc3RlZC1ieTogQWxleGFu
ZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgpSZXZpZXdlZC1ieTogQWxleGFuZHJl
IEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgoKVGhhbmtzLAoKQWxleAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
