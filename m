Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E44FA0C39
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Apr 2026 06:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vh5o5FsCkfstIQ/ZoZ4yPAVrdGcIzbXeXvrQBnILxOg=; b=jDjmFoBMV4cNEk
	dcGuOvWjTYPOoJhB6wKdS4gYhYx6keBsdi/qU58USXFkPjFQsKhtdmkfDzHzQ7hL/i7cDTQV87l14
	+k9/NKqcwElT6dgItR3h5ItGG6Oh6jkGTTWS8sL6cKBG+sd02nUlaRhCL+04CBqInKCgdsuzzhem/
	kxgIv0Nejn1RIHNouvvAdGh60kMBoTx/GXuHELez2daYuj2jrzCnnqUgwrpyZ3JCcHJayKN1YM9wl
	gq7xCXJynMjET14LAtFlTThnPCY9cA2KXIhMEP7Te043mC/v1xifM7T5jipRmu4slwdg7SVXkjxEo
	fOQQK/Ubla0Jpk8ZmQIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCtyI-00000000fTY-4A7V;
	Wed, 15 Apr 2026 06:43:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCtyG-00000000fSr-102T;
	Wed, 15 Apr 2026 06:43:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7742F403A8;
	Wed, 15 Apr 2026 06:43:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DC3EC19424;
	Wed, 15 Apr 2026 06:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776235411;
	bh=3l4dmsvsnQyxf5GbIefFkBoRTtzYmP3a/BJez1WWJU0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NmG1V1Qh8X51h9yFFz/RGI1o84gKp7RHsiOopESELjzBD3f9G2epzFGKqLdlrBBvM
	 85BRNDv9YgePWTAd/mWHoOfcVqkZ9t54hSGyPy5okYzBxuCsVMlJue+y2wSJhbVhIb
	 lb1DnIaWF178QVSBg4jx+V4/OFjaBNwtpoh3Tr4lJfjGJizmbNJlvTEiLyH2ILDjm+
	 9pOpGMDHM1wUUHlqTgOAicNu6S/pI86hh/KXo0HpBVSU8mvpdrsn1yE6nfT23v28aD
	 LJpZNPtQ4Ce9RQkXbclJOLPdj0XzY6SczhKB/CIS9XrbEQGTKPU35O7cIRgQtYcfwt
	 Wv24vurrRB4xg==
Message-ID: <0758843e-8f75-4c82-b9c0-25fab502e62f@kernel.org>
Date: Wed, 15 Apr 2026 08:43:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 07/38] treewide: Consolidate cycles_t
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, x86@kernel.org,
 Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux.dev,
 Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-crypto@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>,
 linux-mm@kvack.org, David Woodhouse <dwmw2@infradead.org>,
 Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org,
 Theodore Tso <tytso@mit.edu>, linux-ext4@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Thomas Sailer <t.sailer@alumni.ethz.ch>, linux-hams@vger.kernel.org,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 linux-alpha@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org,
 Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 linux-openrisc@vger.kernel.org, Helge Deller <deller@gmx.de>,
 linux-parisc@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>,
 linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
 linux-s390@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 sparclinux@vger.kernel.org
References: <20260410120044.031381086@kernel.org>
 <20260410120318.045532623@kernel.org>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260410120318.045532623@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_234332_339072_0246AB49 
X-CRM114-Status: GOOD (  14.60  )
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

CgpMZSAxMC8wNC8yMDI2IMOgIDE0OjE5LCBUaG9tYXMgR2xlaXhuZXIgYSDDqWNyaXTCoDoKPiBN
b3N0IGFyY2hpdGVjdHVyZXMgZGVmaW5lIGN5Y2xlc190IGFzIHVuc2lnbmVkIGxvbmcgZXhlY3B0
Ogo+IAo+ICAgLSB4ODYgcmVxdWlyZXMgaXQgdG8gYmUgNjQtYml0IGluZGVwZW5kZW50IG9mIHRo
ZSAzMi1iaXQvNjQtYml0IGJ1aWxkLgo+IAo+ICAgLSBwYXJpc2MgYW5kIG1pcHMgZGVmaW5lIGl0
IGFzIHVuc2lnbmVkIGludAo+IAo+ICAgICBwYXJpc2MgaGFzIG5vIHJlYWwgcmVhc29uIHRvIGRv
IHNvIGFzIHRoZXJlIGFyZSBvbmx5IGEgZmV3IHVzYWdlIHNpdGVzCj4gICAgIHdoaWNoIGVpdGhl
ciBleHBhbmQgaXQgdG8gYSA2NC1iaXQgdmFsdWUgb3IgdXRpbGl6ZSBvbmx5IHRoZSBsb3dlcgo+
ICAgICAzMmJpdHMuCj4gCj4gICAgIG1pcHMgaGFzIG5vIHJlYWwgcmVxdWlyZW1lbnQgZWl0aGVy
Lgo+IAo+IE1vdmUgdGhlIHR5cGVkZWYgdG8gdHlwZXMuaCBhbmQgcHJvdmlkZSBhIGNvbmZpZyBz
d2l0Y2ggdG8gZW5mb3JjZSB0aGUKPiA2NC1iaXQgdHlwZSBmb3IgeDg2Lgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFRob21hcyBHbGVpeG5lciA8dGdseEBrZXJuZWwub3JnPgo+IC0tLQo+ICAgYXJjaC9L
Y29uZmlnICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDQgKysrKwo+ICAgYXJjaC9hbHBoYS9p
bmNsdWRlL2FzbS90aW1leC5oICAgICB8ICAgIDMgLS0tCj4gICBhcmNoL2FybS9pbmNsdWRlL2Fz
bS90aW1leC5oICAgICAgIHwgICAgMSAtCj4gICBhcmNoL2xvb25nYXJjaC9pbmNsdWRlL2FzbS90
aW1leC5oIHwgICAgMiAtLQo+ICAgYXJjaC9tNjhrL2luY2x1ZGUvYXNtL3RpbWV4LmggICAgICB8
ICAgIDIgLS0KPiAgIGFyY2gvbWlwcy9pbmNsdWRlL2FzbS90aW1leC5oICAgICAgfCAgICAyIC0t
Cj4gICBhcmNoL25pb3MyL2luY2x1ZGUvYXNtL3RpbWV4LmggICAgIHwgICAgMiAtLQo+ICAgYXJj
aC9wYXJpc2MvaW5jbHVkZS9hc20vdGltZXguaCAgICB8ICAgIDIgLS0KPiAgIGFyY2gvcG93ZXJw
Yy9pbmNsdWRlL2FzbS90aW1leC5oICAgfCAgICA0ICstLS0KPiAgIGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vdGltZXguaCAgICAgfCAgICAyIC0tCj4gICBhcmNoL3MzOTAvaW5jbHVkZS9hc20vdGlt
ZXguaCAgICAgIHwgICAgMiAtLQo+ICAgYXJjaC9zcGFyYy9pbmNsdWRlL2FzbS90aW1leF82NC5o
ICB8ICAgIDEgLQo+ICAgYXJjaC94ODYvS2NvbmZpZyAgICAgICAgICAgICAgICAgICB8ICAgIDEg
Kwo+ICAgYXJjaC94ODYvaW5jbHVkZS9hc20vdHNjLmggICAgICAgICB8ICAgIDIgLS0KPiAgIGlu
Y2x1ZGUvYXNtLWdlbmVyaWMvdGltZXguaCAgICAgICAgfCAgICAxIC0KPiAgIGluY2x1ZGUvbGlu
dXgvdHlwZXMuaCAgICAgICAgICAgICAgfCAgICA2ICsrKysrKwo+ICAgMTYgZmlsZXMgY2hhbmdl
ZCwgMTIgaW5zZXJ0aW9ucygrKSwgMjUgZGVsZXRpb25zKC0pCj4gCj4gLS0tIGEvYXJjaC9wb3dl
cnBjL2luY2x1ZGUvYXNtL3RpbWV4LmgKPiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20v
dGltZXguaAo+IEBAIC0xMSw5ICsxMSw3IEBACj4gICAjaW5jbHVkZSA8YXNtL2NwdXRhYmxlLmg+
Cj4gICAjaW5jbHVkZSA8YXNtL3Zkc28vdGltZWJhc2UuaD4KPiAgIAo+IC10eXBlZGVmIHVuc2ln
bmVkIGxvbmcgY3ljbGVzX3Q7Cj4gLQo+IC1zdGF0aWMgaW5saW5lIGN5Y2xlc190IGdldF9jeWNs
ZXModm9pZCkKPiArb3N0YXRpYyBpbmxpbmUgY3ljbGVzX3QgZ2V0X2N5Y2xlcyh2b2lkKQoKV2hh
dCBpcyAnb3N0YXRpYycgPwoKPiAgIHsKPiAgIAlyZXR1cm4gbWZ0YigpOwo+ICAgfQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
