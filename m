Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E6EC3DA6D
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 10:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wPMbsYzP4o8rtc0+ajDVU/pliWpUGPRyNbjU6cEhFtM=; b=Xv5mpiDCTiTyJN
	2Gf0d9Zud+zw8sBLdu6rg9GYc+SKwbx0GU1bS4vwF9Fd/XX5xvHurrPCqrKMg+Zr4Ytv49u8ewNQ4
	hASvKStRuaRzzucghUc+pvamQ7xElpvnpxx0EgOvhP/ppkqNtofeXAJWgf21Tz/QqYMmUdcMhDi73
	mLZwLVy2AgH/YWKMs3bgvhJzm0kblZm49n8dkUFJSWYaPRIYBGhwxm+TfHnS1W7OxaC6s/Vz/3YGw
	u8tfW33CWZVCJ+4KGsmNerAbqBCTNhqCg1w/IG4znhaIjTijXnjN4D6RtZ4A7sJL6ufKNubP0UfA6
	FYg5D20XrGN6q+Y6ph5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIPIe-00000003XQK-0MZh;
	Fri, 23 May 2025 10:06:48 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIPIa-00000003XOa-0vPM
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 10:06:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0D78942E81;
	Fri, 23 May 2025 10:06:38 +0000 (UTC)
Message-ID: <71f093d5-4823-4bc6-b9ee-23433bd8c60c@ghiti.fr>
Date: Fri, 23 May 2025 12:06:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] RISC-V: vDSO: Wire up getrandom() vDSO implementation
To: Xi Ruoyao <xry111@xry111.site>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Nathan Chancellor <nathan@kernel.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Guo Ren <guoren@kernel.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250411024600.16045-1-xry111@xry111.site>
 <20250411095103-2aad099a-e4a1-4efb-8374-dd27bf05b668@linutronix.de>
 <a2477829-f3a5-4763-89f3-8c2c1f4716b8@ghiti.fr>
 <7f840a23ab8865d7f205caec56817c660e237d64.camel@xry111.site>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <7f840a23ab8865d7f205caec56817c660e237d64.camel@xry111.site>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdekheejucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeffhfdvfedtvdffhffhleejveeviedvffdtudegveffffegffdtieetveehjeduveenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhlughsrdhssgenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmegvleejvdemuggtudemjedvudgumeeitdgstdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemvgeljedvmegutgdumeejvdduugemiedtsgdtpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmegvleejvdemuggtudemjedvudgumeeitdgstdgnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepledprhgtphhtthhopeigrhihudduudesgihrhiduuddurdhsihhtvgdprhgtphhtthhopehthhhomhgrshdrfigvihhsshhstghhuhhhsehli
 hhnuhhtrhhonhhigidruggvpdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeflrghsohhnseiigidvtgegrdgtohhmpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtohepghhuohhrvghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_030644_386979_65BE629E 
X-CRM114-Status: GOOD (  12.23  )
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

T24gNS8yMy8yNSAxMDowMiwgWGkgUnVveWFvIHdyb3RlOgo+IE9uIEZyaSwgMjAyNS0wNS0yMyBh
dCAxMDowMSArMDIwMCwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+PiBIaSBYaSwKPj4KPj4gT24g
NC8xMS8yNSAxMDowNCwgVGhvbWFzIFdlacOfc2NodWggd3JvdGU6Cj4+PiBPbiBGcmksIEFwciAx
MSwgMjAyNSBhdCAxMDo0NjowMEFNICswODAwLCBYaSBSdW95YW8gd3JvdGU6Cj4+Pj4gSG9vayB1
cCB0aGUgZ2VuZXJpYyB2RFNPIGltcGxlbWVudGF0aW9uIHRvIHRoZSBnZW5lcmljIHZEU08KPj4+
PiBnZXRyYW5kb20KPj4+PiBpbXBsZW1lbnRhdGlvbiBieSBwcm92aWRpbmcgdGhlIHJlcXVpcmVk
Cj4+Pj4gX19hcmNoX2NoYWNoYTIwX2Jsb2Nrc19ub3N0YWNrCj4+Pj4gYW5kIGdldHJhbmRvbV9z
eXNjYWxsIGltcGxlbWVudGF0aW9ucy4gQWxzbyB3aXJlIHVwIHRoZSBzZWxmdGVzdHMuCj4+Pj4K
Pj4+PiBUaGUgYmVuY2htYXJrIHJlc3VsdDoKPj4+Pgo+Pj4+IAl2ZHNvOiAyNTAwMDAwMCB0aW1l
cyBpbiAyLjQ2NjM0MTMzMyBzZWNvbmRzCj4+Pj4gCWxpYmM6IDI1MDAwMDAwIHRpbWVzIGluIDQx
LjQ0NzcyMDAwNSBzZWNvbmRzCj4+Pj4gCXN5c2NhbGw6IDI1MDAwMDAwIHRpbWVzIGluIDQxLjA0
MzkyNjY3MiBzZWNvbmRzCj4+Pj4KPj4+PiAJdmRzbzogMjUwMDAwMDAgeCAyNTYgdGltZXMgaW4g
MTYyLjI4NjIxOTM1MyBzZWNvbmRzCj4+Pj4gCWxpYmM6IDI1MDAwMDAwIHggMjU2IHRpbWVzIGlu
IDI5NTMuODU1MDE4Njg1IHNlY29uZHMKPj4+PiAJc3lzY2FsbDogMjUwMDAwMDAgeCAyNTYgdGlt
ZXMgaW4gMjc5Ni4yNjg1NDYwMDAgc2Vjb25kcwo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogWGkg
UnVveWFvIDx4cnkxMTFAeHJ5MTExLnNpdGU+Cj4+Pj4gLS0tCj4+Pj4KPj4+PiBbdjFdLT52MjoK
Pj4+PiAtIEZpeCB0aGUgY29tbWl0IG1lc3NhZ2UuCj4+Pj4gLSBPbmx5IGJ1aWxkIHRoZSB2RFNP
IGdldHJhbmRvbSBjb2RlIGlmIENPTkZJR19WRFNPX0dFVFJBTkRPTSwgdG8KPj4+PiAgwqDCoCB1
bmJyZWFrIFJWMzIgYnVpbGQuCj4+Pj4gLSBMaWtld2lzZSwgb25seSBlbmFibGUgdGhlIHNlbGZ0
ZXN0IGlmIF9fcmlzY3ZfeGxlbiA9PSA2NC4KPj4+Pgo+Pj4+IFt2MV06Cj4+Pj4gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwMjI0MTIyNTQxLjY1MDQ1LTEteHJ5MTExQHhyeTExMS5z
aXRlLwo+Pj4+Cj4+Pj4gIMKgIGFyY2gvcmlzY3YvS2NvbmZpZ8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAxICsKPj4+PiAgwqAgYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS92ZHNvL2dldHJhbmRvbS5owqDCoMKgwqDCoMKgIHzCoCAzMCAr
KysKPj4+PiAgwqAgYXJjaC9yaXNjdi9rZXJuZWwvdmRzby9NYWtlZmlsZcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfMKgIDEyICsKPj4+PiAgwqAgYXJjaC9yaXNjdi9rZXJuZWwvdmRzby9n
ZXRyYW5kb20uY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEwICsKPj4+PiAgwqAgYXJjaC9y
aXNjdi9rZXJuZWwvdmRzby92ZHNvLmxkcy5TwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKg
IDEgKwo+Pj4+ICDCoCBhcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL3ZnZXRyYW5kb20tY2hhY2hhLlPC
oMKgwqAgfCAyNDQKPj4+PiArKysrKysrKysrKysrKysrKysKPj4+PiAgwqAgLi4uL3NlbGZ0ZXN0
cy92RFNPL3ZnZXRyYW5kb20tY2hhY2hhLlPCoMKgwqDCoMKgwqDCoCB8wqDCoCAyICsKPj4+PiAg
wqAgNyBmaWxlcyBjaGFuZ2VkLCAzMDAgaW5zZXJ0aW9ucygrKQo+Pj4+ICDCoCBjcmVhdGUgbW9k
ZSAxMDA2NDQgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZHNvL2dldHJhbmRvbS5oCj4+Pj4gIMKg
IGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL2dldHJhbmRvbS5jCj4+
Pj4gIMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL3ZnZXRyYW5k
b20tY2hhY2hhLlMKPj4+IDxzbmlwPgo+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
ZXJuZWwvdmRzby92ZHNvLmxkcy5TCj4+Pj4gYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL3Zkc28u
bGRzLlMKPj4+PiBpbmRleCA4ZTg2OTY1YThhYWUuLmFiYzY5Y2RhMDQ0NSAxMDA2NDQKPj4+PiAt
LS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL3Zkc28ubGRzLlMKPj4+PiArKysgYi9hcmNoL3Jp
c2N2L2tlcm5lbC92ZHNvL3Zkc28ubGRzLlMKPj4+PiBAQCAtODAsNiArODAsNyBAQCBWRVJTSU9O
Cj4+Pj4gIMKgICNpZm5kZWYgQ09NUEFUX1ZEU08KPj4+PiAgwqDCoAkJX192ZHNvX3Jpc2N2X2h3
cHJvYmU7Cj4+Pj4gIMKgICNlbmRpZgo+Pj4+ICsJCV9fdmRzb19nZXRyYW5kb207Cj4+PiBGb3Ig
Y29uc2lzdGVuY3kgdGhpcyBjb3VsZCBiZSBnYXRlZCBiZWhpbmQgQ09ORklHX1ZEU09fR0VUUkFO
RE9NLgo+Pgo+PiBOYXRoYW4gc2VudCBhIGZpeCBmb3IgdGhpcyBoZXJlOgo+Pgo+PiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTA0MjMtcmlzY3YtZml4LWNvbXBhdF92ZHNvLWxsZC12
Mi0xLWI3YmJiYzI0NDUwMUBrZXJuZWwub3JnLwo+IEkndmUgZ2l2ZW4gaXQgYW4gUi1iLiAgRG8g
eW91IHByZWZlciBtZSB0byBzcXVhc2ggdGhlIHBhdGNoZXMgYW5kIGtlZXAKPiB0aGUgU29CIG9m
IGJvdGggSSBhbmQgTmF0aGFuPwoKSG1tIEkgd2FzIGFib3V0IHRvIHNlbmQgYSBuZXcgUFIgdG9k
YXkgYWZ0ZXIgdGhlIENJIHBhc3NlcywgSSBtZW50aW9uZWQgCk5hdGhhbidzIHBhdGNoIGluIHRo
ZSBzcXVhc2ggc28gaGUga2VlcHMgY3JlZGl0IGZvciB0aGUgZml4LiBVbmxlc3MgeW91IApjYW4g
c2VuZCBzb21ldGhpbmcgdG9kYXksIEknbGwga2VlcCBteSBzcXVhc2hlZCBwYXRjaC4KClRoYW5r
cywKCkFsZXgKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
