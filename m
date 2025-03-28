Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95AFDC28B20
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Mar 2025 12:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TstkzBVHJRjuptHQSNLraGfRsljAMXWVboa5NWWEX2o=; b=D3k2FyDRZXRIvZ
	e52gCz65Ul+TIBcZQUTEUZtNBYQjPvVHlV+Q+nyaVxLGOcXNdwSqO3FlQJ2ufT5KWue7lBwEXS1Xx
	HQsTZ8oemQaRngRBccsRaP2dFbPbGQLYQceWZlrHjutuABeP141UgXLRNtdIQOREv8F2uF+OQpXIk
	7UaXJyZhnbswivUEdvUCtYbrz4345Lth2blZ1vEYVu9dCenuQOmGgPuT1/qJe0lerzNEPoD5EarOS
	fo1qZUkcKQCiF8rlpqHpnZRl23TYBJrlZ/CZopBHrbvsOd+1V4A4xnOBIFd1mWhghENdRjo2zmvBe
	Dc9mUmQdLqXug/9EFaqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty9FN-0000000DM64-2jqn;
	Fri, 28 Mar 2025 12:55:41 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty9E6-0000000DLy9-3Meo
	for linux-riscv@lists.infradead.org;
	Fri, 28 Mar 2025 12:54:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 879F4443E1;
	Fri, 28 Mar 2025 12:54:18 +0000 (UTC)
Message-ID: <c68ce83f-557e-4cf0-b72b-4424098e4afc@ghiti.fr>
Date: Fri, 28 Mar 2025 13:54:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH fixes] riscv/purgatory: 4B align purgatory_start
Content-Language: en-US
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Daniel Maslowski <cyrevolt@googlemail.com>,
 Li Zhengyu <lizhengyu3@huawei.com>, linux-kernel@vger.kernel.org
References: <20250328085313.1193815-1-bjorn@kernel.org>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250328085313.1193815-1-bjorn@kernel.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujedufeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpefhhfdtfeejtefgvdfhheeghfetkeekveffheehgeettdeiudehledtgeehueelffenucffohhmrghinhepvghnthhrhidrshgsnecukfhppeefuddrfedvrdekuddrudekjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeefuddrfedvrdekuddrudekjedphhgvlhhopegludelvddrudeikedrvddurdefudgnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepkedprhgtphhtthhopegsjhhorhhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepsghjohhrnhesrhhivhhoshhinhgtrdgtohhmpdhrtghpt
 hhtoheptgihrhgvvhholhhtsehgohhoghhlvghmrghilhdrtghomhdprhgtphhtthhopehlihiihhgvnhhghihufeeshhhurgifvghirdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_055422_988531_5555D7DE 
X-CRM114-Status: GOOD (  15.64  )
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

SGkgQmrDtnJuLAoKT24gMjgvMDMvMjAyNSAwOTo1MywgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiBG
cm9tOiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4KPiBXaGVuIGEgY3Jhc2hr
ZXJuZWwgaXMgbGF1bmNoZWQgb24gUklTQy1WLCB0aGUgZW50cnkgdG8gcHVyZ2F0b3J5IGlzCj4g
ZG9uZSBieSB0cmFwcGluZyB2aWEgdGhlIHN0dmVjIENTUi4gRnJvbSByaXNjdl9rZXhlY19ub3Jl
bG9jYXRlKCk6Cj4KPiAgICB8ICAuLi4KPiAgICB8ICAvKgo+ICAgIHwgICAqIFN3aXRjaCB0byBw
aHlzaWNhbCBhZGRyZXNzaW5nCj4gICAgfCAgICogVGhpcyB3aWxsIGFsc28gdHJpZ2dlciBhIGp1
bXAgdG8gQ1NSX1NUVkVDCj4gICAgfCAgICogd2hpY2ggaW4gdGhpcyBjYXNlIGlzIHRoZSBhZGRy
ZXNzIG9mIHRoZSBuZXcKPiAgICB8ICAgKiBrZXJuZWwuCj4gICAgfCAgICovCj4gICAgfCAgY3Ny
dyAgICBDU1JfU1RWRUMsIGEyCj4gICAgfCAgY3NydyAgICBDU1JfU0FUUCwgemVybwo+Cj4gc3R2
ZWMgcmVxdWlyZXMgdGhhdCB0aGUgYWRkcmVzcyBpcyA0QiBhbGlnbmVkLCB3aGljaCB3YXMgbm90
IHRoZSBjYXNlLAo+IGUuZy46Cj4KPiAgICB8IExvYWRlZCBwdXJnYXRvcnkgYXQgMHhmZmZmYzAw
MAo+ICAgIHwga2V4ZWNfZmlsZToga2V4ZWNfZmlsZV9sb2FkOiB0eXBlOjEsIHN0YXJ0OjB4ZmZm
ZmQyMzIgaGVhZDoweDQgZmxhZ3M6MHg2Cj4KPiBUaGUgYWRkcmVzcyAweGZmZmZkMjMyIG5vdCA0
QiBhbGlnbmVkLgo+Cj4gQ29ycmVjdCBieSBhZGRpbmcgcHJvcGVyIGZ1bmN0aW9uIGFsaWdubWVu
dC4KPgo+IFdpdGggdGhpcyBjaGFuZ2UsIGNyYXNoa2VybmVscyBsb2FkZWQgd2l0aCBrZXhlYy1m
aWxlIHdpbGwgYmUgYWJsZSB0bwo+IHByb3Blcmx5IGVudGVyIHRoZSBwdXJnYXRvcnkuCj4KPiBG
aXhlczogNzM2ZTMwYWY1ODNmYiAoIlJJU0MtVjogQWRkIHB1cmdhdG9yeSIpCj4gU2lnbmVkLW9m
Zi1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgo+IC0tLQo+ICAgYXJjaC9y
aXNjdi9wdXJnYXRvcnkvZW50cnkuUyB8IDEgKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9wdXJnYXRvcnkvZW50cnkuUyBiL2Fy
Y2gvcmlzY3YvcHVyZ2F0b3J5L2VudHJ5LlMKPiBpbmRleCAwZTZjYTZkNWFlNGIuLmM1ZGIyZjA3
MmMzNCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L3B1cmdhdG9yeS9lbnRyeS5TCj4gKysrIGIv
YXJjaC9yaXNjdi9wdXJnYXRvcnkvZW50cnkuUwo+IEBAIC0xMiw2ICsxMiw3IEBACj4gICAKPiAg
IC50ZXh0Cj4gICAKPiArLmFsaWduCTIKPiAgIFNZTV9DT0RFX1NUQVJUKHB1cmdhdG9yeV9zdGFy
dCkKPiAgIAo+ICAgCWxsYQlzcCwgLkxzdGFjawo+Cj4gYmFzZS1jb21taXQ6IGFjYjRmMzM3MTNi
OWY2Y2FkYjYxNDNmMjExNzE0YzM0MzQ2NTQxMWMKCgpSZXZpZXdlZC1ieTogQWxleGFuZHJlIEdo
aXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgoKVGhhbmtzLAoKQWxleAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
