Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B70BCA0EED
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 22:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=btcxUx/Tg0u3jvnsaYuKqc13df7bZ+FVxRDb2+jbGZU=; b=0RX3aYnv16J5Ab
	P6dHiSe+RqwkcvJaTEnlZjvN7l6d1G9Z5gVrM6SgJ5AJw4fvGgr/Mhb0mzD/OjvLyeCwIc4jCqNKx
	+GnLlh/rcWjgEHoK5XE55i7OWuHhv/ZxRuPjQJB3x8lzmiMnK6FSw0JlKIvjRhf+P/dHSqWUz7kPC
	lZSYfH+sBoJ1QeoMt/8pZ01GhnGf6S+r5gCS8g8iq5Vhvhp5xJyrUZoKW3YY5s/DGHz3NoDcHd/em
	vCOoGOutrvKmVVNm6TcaVprOmN2ORG/g8tchErvi+H9O2bkQ+8NHgkMjf/JlCw7dSkTGPd3MA8C4B
	Y7xvpEW0yAMWXokqQW8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoV20-0000000BkvH-40Iz;
	Tue, 19 Aug 2025 22:42:16 +0000
Received: from relay16.mail.gandi.net ([217.70.178.236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoSlh-0000000BWRL-1L7t
	for linux-riscv@lists.infradead.org;
	Tue, 19 Aug 2025 20:17:19 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 50369449EF;
	Tue, 19 Aug 2025 20:17:08 +0000 (UTC)
Message-ID: <bc3bc5ca-4000-43d6-9019-bae03c65d43c@ghiti.fr>
Date: Tue, 19 Aug 2025 22:17:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] riscv: Replace __ASSEMBLY__ with __ASSEMBLER__ in
 header files
To: Thomas Huth <thuth@redhat.com>, Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, atish.patra@linux.dev,
 anup@brainfault.org, linux-kernel@vger.kernel.org
References: <20250606070952.498274-1-thuth@redhat.com>
 <175450055499.2863135.2738368758577957268.git-patchwork-notify@kernel.org>
 <d1fe7fdf-b3da-4c53-8a5a-a87acd38d525@redhat.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <d1fe7fdf-b3da-4c53-8a5a-a87acd38d525@redhat.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduheeigedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeejieeuudejieekveeutdeguefhkeduledugeevhefffeejudeggedufffgleeugfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtgeemtggvtgdtmeduvdduugemfhdvfedvmegvfeefmegtfeeitgemvgeisgelmeeiheegugenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtgeemtggvtgdtmeduvdduugemfhdvfedvmegvfeefmegtfeeitgemvgeisgelmeeiheegugdphhgvlhhopeglkffrggeimedvrgdtgeemtggvtgdtmeduvdduugemfhdvfedvmegvfeefmegtfeeitgemvgeisgelmeeiheeguggnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepledprhgtphhtthhopehthhhuthhhsehrvgguhhgrthdrtghomhdprhgtphhtthhopegrlhgvgihghhhithhisehrihhvohhsihhntgdrtghomhdprhgtphhtthhopehlihhnuhigq
 dhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopegrthhishhhrdhprghtrhgrsehlihhnuhigrdguvghvpdhrtghpthhtoheprghnuhhpsegsrhgrihhnfhgruhhlthdrohhrgh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_131717_485350_D537C05B 
X-CRM114-Status: GOOD (  11.95  )
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

SGkgVGhvbWFzLAoKT24gOC8xOC8yNSAwODowOCwgVGhvbWFzIEh1dGggd3JvdGU6Cj4gT24gMDYv
MDgvMjAyNSAxOS4xNSwgcGF0Y2h3b3JrLWJvdCtsaW51eC1yaXNjdkBrZXJuZWwub3JnIHdyb3Rl
Ogo+PiBIZWxsbzoKPj4KPj4gVGhpcyBzZXJpZXMgd2FzIGFwcGxpZWQgdG8gcmlzY3YvbGludXgu
Z2l0IChmb3ItbmV4dCkKPj4gYnkgQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMu
Y29tPjoKPgo+IMKgSGkgQWxleGFuZHJlLAo+Cj4gSSBjYW4ndCBzZWUgdGhlIHBhdGNoZXMgaW4g
dGhlIGZvci1uZXh0IGJyYW5jaCAuLi4gaGF2ZSB0aGV5IGJlZW4gCj4gZHJvcHBlZCBhZ2Fpbj8g
V2FzIHRoZXJlIGFuIGlzc3VlIHdpdGggdGhlIHBhdGNoZXM/CgoKTm8gaXNzdWVzIHdpdGggdGhl
IHBhdGNoZXMsIExpbnVzIHJlamVjdGVkIHRoZSByaXNjdiBQUi4gSSdsbCBzZW5kIHRoZW0gCmFn
YWluIGZvciA2LjE4LgoKU29ycnkgYWJvdXQgdGhhdCwKCkFsZXgKCgo+Cj4gwqBUaGFua3MsCj4g
wqAgVGhvbWFzCj4KPgo+PiBPbiBGcmkswqAgNiBKdW4gMjAyNSAwOTowOTo1MCArMDIwMCB5b3Ug
d3JvdGU6Cj4+PiBUaGUga2VybmVsIE1ha2VmaWxlcyBkZWZpbmUgdGhlIF9fQVNTRU1CTFlfXyBt
YWNybyB0byBwcm92aWRlCj4+PiBhIHdheSB0byB1c2UgaGVhZGVycyBpbiBib3RoLCBhc3NlbWJs
eSBhbmQgQyBzb3VyY2UgY29kZS4KPj4+IEhvd2V2ZXIsIGFsbCB0aGUgc3VwcG9ydGVkIHZlcnNp
b25zIG9mIHRoZSBHQ0MgYW5kIENsYW5nIGNvbXBpbGVycwo+Pj4gYWxzbyBkZWZpbmUgdGhlIG1h
Y3JvIF9fQVNTRU1CTEVSX18gYXV0b21hdGljYWxseSBhbHJlYWR5IHdoZW4gCj4+PiBjb21waWxp
bmcKPj4+IGFzc2VtYmx5IGNvZGUsIHNvIHNvbWUga2VybmVsIGhlYWRlcnMgYXJlIHVzaW5nIF9f
QVNTRU1CTEVSX18gaW5zdGVhZC4KPj4+IFdpdGggcmVnYXJkcyB0byB1c2Vyc3BhY2UgY29kZSwg
dGhpcyBzZWVtcyBhbHNvIHRvIGJlIGNvbnN0YW50IHNvdXJjZQo+Pj4gb2YgY29uZnVzaW9uLCBz
ZWUgZm9yIGV4YW1wbGUgdGhlc2UgbGlua3MgaGVyZToKPj4+Cj4+PiBbLi4uXQo+Pgo+PiBIZXJl
IGlzIHRoZSBzdW1tYXJ5IHdpdGggbGlua3M6Cj4+IMKgwqAgLSBbdjIsMS8yXSByaXNjdjogUmVw
bGFjZSBfX0FTU0VNQkxZX18gd2l0aCBfX0FTU0VNQkxFUl9fIGluIHVhcGkgCj4+IGhlYWRlcnMK
Pj4gwqDCoMKgwqAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9yaXNjdi9jL2M0Nzk2Mzk4MGJhNgo+
PiDCoMKgIC0gW3YyLDIvMl0gcmlzY3Y6IFJlcGxhY2UgX19BU1NFTUJMWV9fIHdpdGggX19BU1NF
TUJMRVJfXyBpbiAKPj4gbm9uLXVhcGkgaGVhZGVycwo+PiDCoMKgwqDCoCBodHRwczovL2dpdC5r
ZXJuZWwub3JnL3Jpc2N2L2MvYjVlYjFmMTJhNDE2Cj4+Cj4+IFlvdSBhcmUgYXdlc29tZSwgdGhh
bmsgeW91IQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
