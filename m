Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 714A6FA0C36
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Apr 2026 06:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4KjtPI7uo2zGBEEiURdXW1eg7EeyH8Dsev9v3U/hM8I=; b=0ROT+LSul5+VwJ
	OPa5KxHH5nGpIzn7wn4MkMMtfN5xTni7C49XfWvt1AbAUaDBxoEgC757dPtm9dmhJdDpJIzj8BgG7
	9xueFAdxezKXpq8Ql56CPoObKEXfkpIgbApW25IPc4D98VMwEOhsOQNc0UaMN310J2AlwFHE/xGOG
	uDqAh3acB3sEJmxFVq95Gf9yjq9OU2hQXNl31HFgq2bZCZi5JfKZ6LTYCQbc6aMiT+1aBAENNHeTO
	e0BAU1fscLmKkNad0T2qoH7zHTHQJl+wkMBmlhWAXDFgED8AsuaCG3u9WfmbP+yvcH7DZCutg+Ekk
	0xtex1bSaIp+r1fUnsLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCtta-00000000eiM-3JDd;
	Wed, 15 Apr 2026 06:38:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCttX-00000000ehd-2zpS;
	Wed, 15 Apr 2026 06:38:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 540C64369E;
	Wed, 15 Apr 2026 06:38:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4603C19424;
	Wed, 15 Apr 2026 06:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776235117;
	bh=oJA3I+zKvq9KD+ojZoVICzDS05lI3MCnC5Rlh6cn04Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CW1zPJNSJCGtniBmy6uyWDY71JAL0i4dK/N5qkFlNYs3kz0wXN03HHuHTh1S4hKQi
	 e2yWcwq5RclCcCVX6A0Lopstyv1iJwvVwNRsKmdSs6NBxbKPvhq3apDF5Mh9EQ73Js
	 q6/zItY3OOkWbN+i3+Ng0jCLJkMAwhrFhYQnM+LI0mETHNwewJwuPg1EQX95XcPKNN
	 j2R4mf89jj4nr2TUgQRoKIUpiIuUlriELzBuol0ebMztd/ZZRtnQ1qtW+tQ2/QgIAp
	 oYZF1auoZqP0e9mHU9TqSeeI5ff2Bxo+lnB6gCW6VWEs5KrEifF6NFFvP+OSWCop4o
	 Cz3scEaJinP/g==
Message-ID: <f6e6f630-07f1-46b4-888d-324a62a41070@kernel.org>
Date: Wed, 15 Apr 2026 08:38:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 32/38] powerpc/spufs: Use mftb() directly
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 Arnd Bergmann <arnd@arndb.de>, x86@kernel.org,
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
 linux-parisc@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
 linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
 linux-s390@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 sparclinux@vger.kernel.org
References: <20260410120044.031381086@kernel.org>
 <20260410120319.723429844@kernel.org>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260410120319.723429844@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_233839_795171_C48F38A1 
X-CRM114-Status: GOOD (  14.16  )
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

CgpMZSAxMC8wNC8yMDI2IMOgIDE0OjIxLCBUaG9tYXMgR2xlaXhuZXIgYSDDqWNyaXTCoDoKPiBU
aGVyZSBpcyBubyByZWFzb24gdG8gaW5kaXJlY3QgdmlhIGdldF9jeWNsZXMoKSwgd2hpY2ggaXMg
YWJvdXQgdG8gYmUKPiByZW1vdmVkLgo+IAo+IFVzZSBtZnRiKCkgZGlyZWN0bHkuCj4gCj4gU2ln
bmVkLW9mZi1ieTogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGtlcm5lbC5vcmc+Cj4gQ2M6IE1pY2hh
ZWwgRWxsZXJtYW4gPG1wZUBlbGxlcm1hbi5pZC5hdT4KPiBDYzogbGludXhwcGMtZGV2QGxpc3Rz
Lm96bGFicy5vcmcKClJldmlld2VkLWJ5OiBDaHJpc3RvcGhlIExlcm95IChDUyBHUk9VUCkgPGNo
bGVyb3lAa2VybmVsLm9yZz4KCj4gLS0tCj4gICBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zL2NlbGwv
c3B1ZnMvc3dpdGNoLmMgfCAgICA1ICsrKy0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IC0tLSBhL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMv
Y2VsbC9zcHVmcy9zd2l0Y2guYwo+ICsrKyBiL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvY2VsbC9z
cHVmcy9zd2l0Y2guYwo+IEBAIC0zNCw2ICszNCw3IEBACj4gICAjaW5jbHVkZSA8YXNtL3NwdV9w
cml2MS5oPgo+ICAgI2luY2x1ZGUgPGFzbS9zcHVfY3NhLmg+Cj4gICAjaW5jbHVkZSA8YXNtL21t
dV9jb250ZXh0Lmg+Cj4gKyNpbmNsdWRlIDxhc20vdGltZS5oPgo+ICAgCj4gICAjaW5jbHVkZSAi
c3B1ZnMuaCIKPiAgIAo+IEBAIC0yNzksNyArMjgwLDcgQEAgc3RhdGljIGlubGluZSB2b2lkIHNh
dmVfdGltZWJhc2Uoc3RydWN0Cj4gICAJICogICAgUmVhZCBQUEUgVGltZWJhc2UgSGlnaCBhbmQg
VGltZWJhc2UgbG93IHJlZ2lzdGVycwo+ICAgCSAqICAgIGFuZCBzYXZlIGluIENTQS4gIFRCRC4K
PiAgIAkgKi8KPiAtCWNzYS0+c3VzcGVuZF90aW1lID0gZ2V0X2N5Y2xlcygpOwo+ICsJY3NhLT5z
dXNwZW5kX3RpbWUgPSBtZnRiKCk7Cj4gICB9Cj4gICAKPiAgIHN0YXRpYyBpbmxpbmUgdm9pZCBy
ZW1vdmVfb3RoZXJfc3B1X2FjY2VzcyhzdHJ1Y3Qgc3B1X3N0YXRlICpjc2EsCj4gQEAgLTEyNjEs
NyArMTI2Miw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBzZXR1cF9kZWNyKHN0cnVjdCBzcHUKPiAg
IAkgKiAgICAgaW4gTFNDU0EuCj4gICAJICovCj4gICAJaWYgKGNzYS0+cHJpdjIubWZjX2NvbnRy
b2xfUlcgJiBNRkNfQ05UTF9ERUNSRU1FTlRFUl9SVU5OSU5HKSB7Cj4gLQkJY3ljbGVzX3QgcmVz
dW1lX3RpbWUgPSBnZXRfY3ljbGVzKCk7Cj4gKwkJY3ljbGVzX3QgcmVzdW1lX3RpbWUgPSBtZnRi
KCk7Cj4gICAJCWN5Y2xlc190IGRlbHRhX3RpbWUgPSByZXN1bWVfdGltZSAtIGNzYS0+c3VzcGVu
ZF90aW1lOwo+ICAgCj4gICAJCWNzYS0+bHNjc2EtPmRlY3Jfc3RhdHVzLnNsb3RbMF0gPSBTUFVf
REVDUl9TVEFUVVNfUlVOTklORzsKPiAKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
