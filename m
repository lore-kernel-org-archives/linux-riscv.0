Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34DF9C5B549
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jun 2025 12:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nY/Jf5zdHjNYEt6vWmaGFEmZY2saSaBPHOj75dC5hDw=; b=VGCM2xG1iMkqnW
	IPM5v5vJuBb7v5oWFlk7cEuYSzOd1VF44cSKAQw17JQvcOdWhBsDoQKVC266jiVRsgRPYvJFKGsw9
	NEmPTTxyPl3o98WwClqbkaXVzFAKjISyHB5FTCsNZeV/vSB4A44SQCVvApgLpksRvsW102JK0kZDh
	Us+10fMeWWgL822pMeiAtVFSJqxDvqtJgr5TQ86YsCGnCnC0x6Ycf1wRXNUtryLmCE3vj5PYKVZ09
	f0cIdszJ0vb+azvaze6PIo6yHYFHIFMMJXpzjlZy7YmYyV/aU6U/bWjOtIP3Ys9dTPiUZHgUw/lZX
	P0pc2eKZa74gKt5sVVKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMmzX-0000000DI8W-36Vz;
	Wed, 04 Jun 2025 12:13:11 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMmiU-0000000DG71-0A3C
	for linux-riscv@lists.infradead.org;
	Wed, 04 Jun 2025 11:55:35 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4421643B20;
	Wed,  4 Jun 2025 11:55:28 +0000 (UTC)
Message-ID: <dc2b9e86-29f7-406e-a7c5-3f949f3999db@ghiti.fr>
Date: Wed, 4 Jun 2025 13:55:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] riscv: process: use unsigned int instead of
 unsigned long for put_user()
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Maciej W . Rozycki" <macro@orcam.me.uk>,
 David Laight <david.laight.linux@gmail.com>
References: <20250602193918.868962-1-cleger@rivosinc.com>
 <20250602193918.868962-3-cleger@rivosinc.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250602193918.868962-3-cleger@rivosinc.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedtgeeuhffhveeujeetveevieekleekvdffudefleevgefgieekkefggefhtddtveenucfkphepudelfedrfeefrdehjedrudelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduleefrdeffedrheejrdduleelpdhhvghloheplgduledvrdduieekrddvuddrvdeingdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeekpdhrtghpthhtoheptghlvghgvghrsehrihhvohhsihhntgdrtghomhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtohepr
 ghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopehmrggtrhhosehorhgtrghmrdhmvgdruhhkpdhrtghpthhtohepuggrvhhiugdrlhgrihhghhhtrdhlihhnuhigsehgmhgrihhlrdgtohhm
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_045534_216103_91A3B556 
X-CRM114-Status: GOOD (  12.14  )
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

SGkgQ2zDqW1lbnQsCgpPbiA2LzIvMjUgMjE6MzksIENsw6ltZW50IEzDqWdlciB3cm90ZToKPiBU
aGUgc3BlY2lmaWNhdGlvbiBvZiBwcmN0bCgpIGZvciBHRVRfVU5BTElHTl9DVEwgc3RhdGVzIHRo
YXQgdGhlIHZhbHVlIGlzCj4gcmV0dXJuZWQgaW4gYW4gdW5zaWduZWQgaW50ICogYWRkcmVzcyBw
YXNzZWQgYXMgYW4gdW5zaWduZWQgbG9uZy4gQ2hhbmdlCj4gdGhlIHR5cGUgdG8gbWF0Y2ggdGhh
dCBhbmQgYXZvaWQgYW4gdW5hbGlnbmVkIGFjY2VzcyBhcyB3ZWxsLgo+Cj4gU2lnbmVkLW9mZi1i
eTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgo+IC0tLQo+ICAgYXJjaC9y
aXNjdi9rZXJuZWwvcHJvY2Vzcy5jIHwgMiArLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwv
cHJvY2Vzcy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jCj4gaW5kZXggMTVkOGY3NTkw
MmY4Li45ZWU2ZDgxNmI5OGIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vz
cy5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jCj4gQEAgLTU3LDcgKzU3LDcg
QEAgaW50IGdldF91bmFsaWduX2N0bChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRzaywgdW5zaWduZWQg
bG9uZyBhZHIpCj4gICAJaWYgKCF1bmFsaWduZWRfY3RsX2F2YWlsYWJsZSgpKQo+ICAgCQlyZXR1
cm4gLUVJTlZBTDsKPiAgIAo+IC0JcmV0dXJuIHB1dF91c2VyKHRzay0+dGhyZWFkLmFsaWduX2N0
bCwgKHVuc2lnbmVkIGxvbmcgX191c2VyICopYWRyKTsKPiArCXJldHVybiBwdXRfdXNlcih0c2st
PnRocmVhZC5hbGlnbl9jdGwsICh1bnNpZ25lZCBpbnQgX191c2VyICopYWRyKTsKPiAgIH0KPiAg
IAo+ICAgdm9pZCBfX3Nob3dfcmVncyhzdHJ1Y3QgcHRfcmVncyAqcmVncykKCgpSZXZpZXdlZC1i
eTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgoKVGhhbmtzLAoKQWxl
eAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
