Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20FB1C02190
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jan 2025 10:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6J9Lv88gP9gtoPfOlx6wHCGhIklinvHnq0kw88HltAo=; b=Hp8B58qscZwiA5
	e+KdKUuzbxxD1jY+CykQ5DszGJsYQ6zFwFI+XCbDzJMex9HFoflsk2Ji6ZpxOu0iH0kYaB6h9CPP8
	zdAIt4kpv+Y8peqRICXH8CwyJeE3xiZFzdaqU6srk/56M6n5tu0ySqr/UYXtSuuH8mnMTJwTGJaXJ
	uJJ65PEm8kei/XkQVB9WvqeIHR2GKOx6o8+2ZXDcp4xicfodw5wPzM2UJ8b+xPvIOn6WXRm+x8iOK
	JXG0UMT4P2IVTKZdkgbFOWWfMxwyfOb5nWMir4M4hov7s4ALaHLwNmRBNyBxRb9zp2XIKB+oOME9d
	65xTKNRLvIFGtqsrxLoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdROK-00000008ZbK-3zkD;
	Thu, 30 Jan 2025 10:03:20 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdRN0-00000008ZDC-1IiP;
	Thu, 30 Jan 2025 10:01:59 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2040D43423;
	Thu, 30 Jan 2025 10:01:38 +0000 (UTC)
Message-ID: <03594835-6f12-4582-a4f7-cbb1630dba91@ghiti.fr>
Date: Thu, 30 Jan 2025 11:01:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] riscv: add support for SBI Supervisor Software
 Events extension
Content-Language: en-US
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Himanshu Chauhan <hchauhan@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Xu Lu <luxu.kernel@bytedance.com>,
 Atish Patra <atishp@atishpatra.org>
References: <20241206163102.843505-1-cleger@rivosinc.com>
 <20241206163102.843505-3-cleger@rivosinc.com>
 <a21df8a8-a50f-49df-a098-69faa51ed8cb@ghiti.fr>
 <649fdead-09b0-4f94-a6ff-099fc970d890@rivosinc.com>
 <a0012a8d-0c2b-4948-b5c7-7d8efdf1cab0@ghiti.fr>
 <32cc0753-a033-4f55-8aca-09416f62faa8@rivosinc.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <32cc0753-a033-4f55-8aca-09416f62faa8@rivosinc.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehheduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedtgeeuhffhveeujeetveevieekleekvdffudefleevgefgieekkefggefhtddtveenucfkphepudelfedrfeefrdehjedrudelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduleefrdeffedrheejrdduleelpdhhvghloheplgduledvrdduieekrddvuddrvdehngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopedutddprhgtphhtthhopegtlhgvghgvrhesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhop
 ehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehhtghhrghuhhgrnhesvhgvnhhtrghnrghmihgtrhhordgtohhmpdhrtghpthhtoheprghprghtvghlsehvvghnthgrnhgrmhhitghrohdrtghomh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_020158_477588_7DC9D92B 
X-CRM114-Status: GOOD (  14.46  )
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

SGkgQ2zDqW1lbnQsCgpPbiAyOC8wMS8yMDI1IDA5OjEwLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6
Cj4KPiBPbiAyNy8wMS8yMDI1IDA5OjA5LCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4+PiBJIGJl
bGlldmUgdGhlIGdvYWwgaXMgbm90IHRoZSBzYW1lLiBVc2luZyBDT05GSUdfVk1BUF9TVEFDSyBh
bGxvd3MgdGhlCj4+PiBrZXJuZWwgZXhjZXB0aW9uIGhhbmRsaW5nIHRvIGNhdGNoIGFueSBzdGFj
ayBvdmVyZmxvdyB3aGVuIGVudGVyaW5nIHRoZQo+Pj4ga2VybmVsIGFuZCB0aHVzIHVzaW5nIHZt
YWxsb2MgaXMgcmVxdWlyZWQgdG8gYWxsb2NhdGUgdHdpY2UgdGhlIHBhZ2UKPj4+IHNpemUgKG92
ZXJmbG93IGlzIHdoZW4gc3AgaXMgbG9jYXRlZCBpbiB0aGUgdXBwZXIgaGFsZiBvZiB0aGUgYWxs
b2NhdGVkCj4+PiB2bWFsbG9jIHN0YWNrLiBTbyBiYXNpY2FsbHksIHRoaXMgaXMgdHdvIGRpc3Rp
bmN0IHB1cnBvc2VzLgo+Pj4KPj4+IEFGQUlVLCBrdm1hbGxvYyBhbGxvd3MgdG8gZmFsbGJhY2sg
dG8gdm1hbGxvYyBpZiBrbWFsbG9jIGZhaWxzLiBUaGlzIGlzCj4+PiBub3Qgd2hhdCB3ZSBhcmUg
bG9va2luZyBmb3IgaGVyZSBzaW5jZSBvdXIgYWxsb2NhdGlvbiBzaXplIGlzIGFsd2F5cwo+Pj4g
cXVpdGUgc21hbGwgYW5kIGtub3duIChTVEFDS19TSVpFIGJhc2ljYWxseSkuCj4+Pgo+Pj4gQnV0
IEkgbWlnaHQgYmUgbWlzc2luZyBzb21ldGhpbmcuCj4+Cj4+IGFyY2hfYWxsb2Nfdm1hcF9zdGFj
aygpIG9ubHkgdm1hbGxvYyB0aGUgc3RhY2sgYW5kIGRvZXMgbm90IGltcGxlbWVudAo+PiBhbnkg
c3RhY2sgb3ZlcmZsb3cgbWVjaGFuaXNtLCBzbyBJJ20gc3RpbGwgdW5zdXJlIHdlIG5lZWQgdGhl
IGRlZmluZS4KPiBIaSBBbGV4LAo+Cj4gU28gYWN0dWFsbHksIHRoZSBzdGFjayBvdmVyZmxvdyBj
aGVjayBpdHNlbGYgaXMgZG9uZSBpbiB0aGUgZXhjZXB0aW9uCj4gZW50cnkuIEl0IGNoZWNrIGlm
IHRoZSBzdGFjayBwb2ludGVyIGRpZCBwYXNzZWQgaW4gdGhlIHVwcGVyIHBhcnQgb2YgdGhlCj4g
dm1hbGxvYyBhbGxvY2F0aW9uIChzZWUgZW50cnkuUzoxMjIpLiBJbiB0aGlzIGFsbG9jYXRpb24s
IHRoZSBzdGFjayBzaXplCj4gaXMgYWN0dWFsbHkgKiAyOgo+Cj4gI2lmZGVmIENPTkZJR19WTUFQ
X1NUQUNLCj4gI2RlZmluZSBUSFJFQURfQUxJR04gICAgICAgICAgICAoMiAqIFRIUkVBRF9TSVpF
KQo+ICNlbHNlCj4gI2RlZmluZSBUSFJFQURfQUxJR04gICAgICAgICAgICBUSFJFQURfU0laRQo+
ICNlbmRpZgo+Cj4gU28gZXZlbiB0aG91Z2ggaXQgZG9lcyBub3RoaW5nIHNwZWNpYWwgYnkgaXRz
ZWxmLCBpdCBjZW50cmFsaXplIHRoZQo+IGFsbG9jYXRpb24gc2l6ZS9tZXRob2QuIEFuZCBzaXpl
IHRoZSBzaXplIGlzIGxhcmdlciwgdXNpbmcgdmFtbGxvYyBtYWtlcwo+IHNlbnNlIEkgZ3Vlc3Mu
IFRoZSBzYW1lIG1lY2hhbmlzbSBpcyB1c2VkIHRvIGFsbG9jYXRlIGlycSBzdGFjayBhcyB3ZWxs
LgoKCllvdSdyZSByaWdodCwgaXQgbWFrZXMgc2Vuc2UhIE5pdDogd2UgY2FuIGF2b2lkIHRoZSBp
ZmRlZiBieSB1c2luZyAKSVNfRU5BQkxFRCgpIGJ1dCBkbyBhcyB5b3UgcHJlZmVyLgoKVGhhbmtz
IGZvciB0aGUgZXhwbGFuYXRpb24sCgpBbGV4CgoKPgo+IFRoYW5rcywKPgo+IENsw6ltZW50Cj4K
Pj4gVGhhbmtzLAo+Pgo+PiBBbGV4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
