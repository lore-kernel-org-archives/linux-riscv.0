Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 381ACC87FCC
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Jul 2025 19:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RqrGcY6W75z10ZhieE8rDhKc+OMRwFsFMPKMyt0T0DY=; b=LhqELDkxcpOd82
	waRIE2K0i5f7JVIDoT+hPhKtPYoXnCGThT1HRYZfM26GHaYCx33A2fNWQR8R82+EsEYMQREJ1Jvb1
	mAb5ReK4SnZ1Kk+AhB8S26otqERMVYjvCKJgUhE401cpewf+h8QDLZGpE4dRvy1gUBM7iM6NtOg3j
	oYiRZKpmnb/iBT2hQWdH+eTDokONnZgp73vM7dxTuCyMqboZ0SOjXZuEsX2aMeI255GWR9Hc4jQm9
	duksE13k8yi14CTZevHZzdXXUvCcP+t1lGAyS191h25EaDByt9DLyaRDOXHM/TrS+JRaVmpWx5GHd
	eAQ3gp/53GRyxofzxuxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhZJn-00000004Kqw-2nUh;
	Thu, 31 Jul 2025 19:51:59 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhZJk-00000004Kq7-2qQl
	for linux-riscv@lists.infradead.org;
	Thu, 31 Jul 2025 19:51:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5DC53441BF;
	Thu, 31 Jul 2025 19:51:50 +0000 (UTC)
Message-ID: <8b933393-e9cf-4192-9e69-ef5c2a699c5b@ghiti.fr>
Date: Thu, 31 Jul 2025 21:51:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ACPI: support BGRT table on RISC-V
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, kernel@vger.kernel.org,
 Yunhui Cui <cuiyunhui@bytedance.com>, linux-acpi@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-riscv@lists.infradead.org,
 Len Brown <lenb@kernel.org>
References: <20250729131535.522205-1-heinrich.schuchardt@canonical.com>
 <20250729131535.522205-3-heinrich.schuchardt@canonical.com>
 <84a22949-88e7-4a6c-b14e-e8448724b034@ghiti.fr>
 <CAJZ5v0hvaw=m8zPDJn0vPvw5RBxUsRzyvjHPiganPkxHGCisRw@mail.gmail.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <CAJZ5v0hvaw=m8zPDJn0vPvw5RBxUsRzyvjHPiganPkxHGCisRw@mail.gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutddujedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeeuffefvdelteelteejhfejhedujeetteevtddvvddthfeiteffledvffeggfeiieenucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmeeftdehfeemjegrtdgvmeeifhhfgeemiedvsggvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmeeftdehfeemjegrtdgvmeeifhhfgeemiedvsggvpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmeeftdehfeemjegrtdgvmeeifhhfgeemiedvsggvngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopedufedprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohephhgvihhnrhhitghhrdhstghhuhgthhgrrhguthestggrnhhonhhitggrlhdrt
 ghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtoheprhihrghnrdhrohgsvghrthhssegrrhhmrdgtohhmpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopehkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_125156_846898_EDCEB946 
X-CRM114-Status: GOOD (  13.67  )
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

T24gNy8zMS8yNSAyMDoxNywgUmFmYWVsIEouIFd5c29ja2kgd3JvdGU6Cj4gT24gVGh1LCBKdWwg
MzEsIDIwMjUgYXQgMzoxM+KAr1BNIEFsZXhhbmRyZSBHaGl0aSA8YWxleEBnaGl0aS5mcj4gd3Jv
dGU6Cj4+IEhpIEhlaW5yaWNoLAo+Pgo+PiBPbiA3LzI5LzI1IDE1OjE1LCBIZWlucmljaCBTY2h1
Y2hhcmR0IHdyb3RlOgo+Pj4gVGhlIEJHUlQgdGFibGUgaXMgdXNlZCB0byBkaXNwbGF5IGEgdmVu
ZG9yIGxvZ28gaW4gdGhlIGJvb3QgcHJvY2Vzcy4KPj4+IFRoZXJlIGlzIG5vIGdvb2QgcmVhc29u
IHdoeSBSSVNDLVYgc2hvdWxkIG5vdCBzdXBwb3J0IGl0Lgo+Pj4KPj4+IFJlbW92ZSB0aGUgYXJj
aGl0ZWN0dXJlIGNvbnN0cmFpbnQuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogSGVpbnJpY2ggU2No
dWNoYXJkdCA8aGVpbnJpY2guc2NodWNoYXJkdEBjYW5vbmljYWwuY29tPgo+Pj4gLS0tCj4+PiAg
ICBkcml2ZXJzL2FjcGkvS2NvbmZpZyB8IDIgKy0KPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Fj
cGkvS2NvbmZpZyBiL2RyaXZlcnMvYWNwaS9LY29uZmlnCj4+PiBpbmRleCA3YmM0MGMyNzM1YWMw
Li4yYjgzYzkxYmIxYTc4IDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9hY3BpL0tjb25maWcKPj4+
ICsrKyBiL2RyaXZlcnMvYWNwaS9LY29uZmlnCj4+PiBAQCAtNDYwLDcgKzQ2MCw3IEBAIGNvbmZp
ZyBBQ1BJX0hFRAo+Pj4KPj4+ICAgIGNvbmZpZyBBQ1BJX0JHUlQKPj4+ICAgICAgICBib29sICJC
b290dGltZSBHcmFwaGljcyBSZXNvdXJjZSBUYWJsZSBzdXBwb3J0Igo+Pj4gLSAgICAgZGVwZW5k
cyBvbiBFRkkgJiYgKFg4NiB8fCBBUk02NCB8fCBMT09OR0FSQ0gpCj4+PiArICAgICBkZXBlbmRz
IG9uIEVGSQo+Pj4gICAgICAgIGhlbHAKPj4+ICAgICAgICAgIFRoaXMgZHJpdmVyIGFkZHMgc3Vw
cG9ydCBmb3IgZXhwb3NpbmcgdGhlIEFDUEkgQm9vdHRpbWUgR3JhcGhpY3MKPj4+ICAgICAgICAg
IFJlc291cmNlIFRhYmxlLCB3aGljaCBhbGxvd3MgdGhlIG9wZXJhdGluZyBzeXN0ZW0gdG8gb2J0
YWluCj4+Cj4+IEBSYWZhZWw6IElmIHlvdSBhY2sgdGhpcyBwYXRjaCwgSSBjYW4gbWVyZ2UgdGhh
dCBmb3IgNi4xNyBhcyBJIGhhdmVuJ3QKPj4gc2VudCBteSBQUiB5ZXQsIGp1c3QgbGV0IG1lIGtu
b3chCj4gVGhlcmUgeW91IGdvOgo+Cj4gQWNrZWQtYnk6IFJhZmFlbCBKLiBXeXNvY2tpIDxyYWZh
ZWxAa2VybmVsLm9yZz4KCgpHcmVhdCwgdGhhbmtzIQoKCj4KPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+
IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
