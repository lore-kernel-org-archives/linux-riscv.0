Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0FEC282EC
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 13:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SobLIzw5u+mZLcZ+VpXtvHqWnOMz+cV7azDHXKKsR80=; b=rCE/qXpx0zvgk1
	2v+rohfUtBKsYvrZZwRedOnKCzAYhS88SVpNFPFBfIS0bWTkvM3MrG2DOXCgTowaEtYE9pKf1w0b9
	M4abO4UYXmtY+NS7AK6GyyeUtoDb8y9zcwTtTLNywZvZOElthby2a6KA4xYnWD/Lwv2DEwICA+Df0
	rc4H5zaIGa3JKGw4kndV42yqg/cTvKm6AM/Czz1oqu/LAQFoeXyIYMoW6hxgnEh0sTYL5F8be5Pma
	sJNSu8D40aZUYwaV3+gtw/XRrlotzK7chIqdZxPeTK2aM/eCt17r5XHWbOwGrRzu/4Vd4Sqt4Ya1D
	cG3SkHWX1nm7tvgbuEtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trzYk-00000005on0-36gj;
	Tue, 11 Mar 2025 13:22:14 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trzX7-00000005oOZ-1jRA
	for linux-riscv@lists.infradead.org;
	Tue, 11 Mar 2025 13:20:35 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id EE2D0444F4;
	Tue, 11 Mar 2025 13:20:22 +0000 (UTC)
Message-ID: <e72db46d-53b2-47f6-814f-9653d783e745@ghiti.fr>
Date: Tue, 11 Mar 2025 14:20:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] riscv: Add bfloat16 instruction support
Content-Language: en-US
To: Inochi Amaoto <inochiama@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?=
 <cleger@rivosinc.com>, Charlie Jenkins <charlie@rivosinc.com>,
 Evan Green <evan@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>,
 Jesse Taube <jesse@rivosinc.com>, Andy Chiu <andybnac@gmail.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Yong-Xuan Wang <yongxuan.wang@sifive.com>,
 Yu Chien Peter Lin <peterlin@andestech.com>,
 Samuel Holland <samuel.holland@sifive.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
References: <20250213003849.147358-1-inochiama@gmail.com>
 <d6t25jmcf57sqpjqwykhdf3ju6v3wwpyaiumll4x6bjfhcohl5@oikmnpusjn6u>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <d6t25jmcf57sqpjqwykhdf3ju6v3wwpyaiumll4x6bjfhcohl5@oikmnpusjn6u>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvddvfeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeeuffefvdelteelteejhfejhedujeetteevtddvvddthfeiteffledvffeggfeiieenucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghenucfkphepfedurdefvddrkedurddukeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepfedurdefvddrkedurddukeejpdhhvghloheplgduledvrdduieekrddvuddrvdehngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopedvgedprhgtphhtthhopehinhhotghhihgrmhgrsehgmhgrihhlrdgtohhmpdhrtghpthhtoheptghorhgsvghtsehlfihnrdhnvghtpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopehro
 hgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_062033_598620_224041BF 
X-CRM114-Status: GOOD (  13.22  )
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

SGkgSW5vY2hpLAoKT24gMTEvMDMvMjAyNSAxMzozNCwgSW5vY2hpIEFtYW90byB3cm90ZToKPiBP
biBUaHUsIEZlYiAxMywgMjAyNSBhdCAwODozODo0NEFNICswODAwLCBJbm9jaGkgQW1hb3RvIHdy
b3RlOgo+PiBBZGQgZGVzY3JpcHRpb24gZm9yIHRoZSBCRmxvYXQxNiBwcmVjaXNpb24gRmxvYXRp
bmctUG9pbnQgSVNBIGV4dGVuc2lvbiwKPj4gKFpmYmZtaW4sIFp2ZmJmbWluLCBadmZiZndtYSku
IHdoaWNoIHdhcyByYXRpZmllZCBpbiBjb21taXQgNGRjMjNkNjIKPj4gKCJBZGRlZCBDaGFwdGVy
IHRpdGxlIHRvIEJGMTYiKSBvZiB0aGUgcmlzY3YtaXNhLW1hbnVhbC4KPj4KPj4gQ2hhbmdlZCBm
cm9tIHYzOgo+PiAxLiByZWJhc2UgZm9yIHY2LjE0LXJjMQo+PiAyLiBwYXRjaDI6IGFkZCB2YWxp
ZGF0ZSBmb3IgemZiZm1pbiwgenZmYmZtaW4sIHp2ZmJmd21hCj4+IDMuIHBhdGNoMjogYXBwbHkg
Q2zDqW1lbnQncyB0YWcKPj4KPj4gQ2hhbmdlZCBmcm9tIHYyOgo+PiAxLiByZWJhc2UgZm9yIHY2
LjEzLXJjMQo+Pgo+PiBDaGFuZ2VkIGZyb20gdjE6Cj4+IDEuIHBhdGNoMzogYWRkIG1pc3Npbmcg
Y29kZSBpbiBzeXNfaHdwcm9iZS5jCj4+Cj4+IElub2NoaSBBbWFvdG8gKDMpOgo+PiAgICBkdC1i
aW5kaW5nczogcmlzY3Y6IGFkZCBiZmxvYXQxNiBJU0EgZXh0ZW5zaW9uIGRlc2NyaXB0aW9uCj4+
ICAgIHJpc2N2OiBhZGQgSVNBIGV4dGVuc2lvbiBwYXJzaW5nIGZvciBiZmxvYXQxNiBJU0EgZXh0
ZW5zaW9uCj4+ICAgIHJpc2N2OiBod3Byb2JlOiBleHBvcnQgYmZsb2F0MTYgSVNBIGV4dGVuc2lv
bgo+Pgo+PiAgIERvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCAgICAgICAgICB8
IDEyICsrKysrCj4+ICAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55
YW1sIHwgNDUgKysrKysrKysrKysrKysrKysrKwo+PiAgIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20v
aHdjYXAuaCAgICAgICAgICAgICAgICB8ICAzICsrCj4+ICAgYXJjaC9yaXNjdi9pbmNsdWRlL3Vh
cGkvYXNtL2h3cHJvYmUuaCAgICAgICAgIHwgIDMgKysKPj4gICBhcmNoL3Jpc2N2L2tlcm5lbC9j
cHVmZWF0dXJlLmMgICAgICAgICAgICAgICAgfCAzNSArKysrKysrKysrKysrKysKPj4gICBhcmNo
L3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jICAgICAgICAgICAgICAgfCAgMyArKwo+PiAgIDYg
ZmlsZXMgY2hhbmdlZCwgMTAxIGluc2VydGlvbnMoKykKPj4KPj4gLS0KPj4gMi40OC4xCj4+Cj4g
SSB3b25kZXIgd2hldGhlciB0aGlzIHBhdGNoIGNvdWxkIGdldCBtZXJnZWQ/IFNvIEkgY2FuCj4g
c3VibWl0IHRoZSBTRzIwNDQgYm9hcmQgZHRzIHdpdGhvdXQgdGhpcyBhcyBkZXBlbmRlbmN5LgoK
Ckl0IGlzIG9uIG15IGxpc3QgZm9yIGZvci1uZXh0IHNvIGl0ICpzaG91bGQqIGJlIG1lcmdlZCBp
biA2LjE1LgoKVGhhbmtzLAoKQWxleAoKCj4KPiBSZWdhcmRzLAo+IElub2NoaQo+Cj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
