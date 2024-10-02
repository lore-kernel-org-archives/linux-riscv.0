Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 057E4CF31B9
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Oct 2024 19:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UVvBdj09wV5vRfyjYGlQ3s14bL2mCgxgmF8W7UqnXX8=; b=NEe53HkizIdJZ0
	1KFknL3TvwmH588XniHi3oXLTm3W/pgHue5uezWR14ww/h3Zw4mrLQ+On9BMMi1DLHZCNMB99dJd8
	rZEAfEA5tp2WTm8DidHF0TQRPSjeWcE7JqLK+sgwbdaI4BPXd4jQ2jOEPSgslDp2GlG6dh43DTXB6
	IAOsZggwUFfc6OoY12Y6T83rghE6BPmnwuRo6y0qp9oD6I2mskiDgdKaWd8VXv4xdmDwuCjRXUGGU
	U/4whDGjH/dq/AbaBwxR9KomUE2iHuF7knEDjFnyUKemLCyxyR49ug2ffNvlaBzbwtcxNtu12eh/A
	uJJEdvRKyX2XLSS79VjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sw59x-00000007Jop-1OoF;
	Wed, 02 Oct 2024 19:37:17 +0000
Received: from bout3.ijzerbout.nl ([136.144.140.114])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sw59u-00000007JmP-0cYD
	for linux-riscv@lists.infradead.org;
	Wed, 02 Oct 2024 19:37:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
	t=1727897824; bh=RoFKBVRxYfTHWfBz6uS38ckS7VuXYibcgS/2JavRY7E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BMFrkAZMQg/Uxb/7vcM4o7BbiH+chLwVFy+EHYXuy+i1aL+Ym2XwSZtj4pEv6yTuY
	 E1VHLcL0qaaQE4HonN0nDjrHmlPAJUEjZO2tlPnfNpZrpd9qtbRyfT4On7ppjMoYsH
	 PCeEtRvCO5BXUMpUXs62y5SA4bhom53lY2cL/LzNvX4kldDNdooyPfKoXhTSK4dWxR
	 eFtC3TuZwDfxSfZ3aLKMgx4Wix0AY+nJgJjGnvK15WxwJCgLxSTFOr0nYhvUPAKqPw
	 GBmldsRIiaMjpbqlTWwD/zKQilAbHs74x/ovUEjltOwUo8UXewvrK02vWEefcWmH4l
	 DNlqkfwS5ehiY0X1yIQwLkA6GLCcMR1fpY8IRJCWg3SwnEPlN9pLd0McatOsoZSiFC
	 xJfnGehxadjFaK9Gs+O7Ib8nKKkOuJesfbh4T8+jtUaAkKhL7fOPQHqhW3DLvnWCzq
	 FNlGuxcdtBDwV99itYAyW3FHya7oQpoEqGL5crsJGQF334t1ZzSl++drGiK7Yk9f6A
	 SFFoGwUYYf8DG9b57SeIdcwg5agVDrGTJ3ZE8aOqvCkPAmJpV+2j9VRNZastgS8Glt
	 GyMxQix/SC1J5wEqMjPBuPrZnKo7GFDdCf2A/mq067rACCL7SLI1Zv6oIeXNZldj9d
	 KYBhB3vYrU4qWpT2wIJVXstc=
Received: from [IPV6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a] (racer.ijzerbout.nl [IPv6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a])
	by bout3.ijzerbout.nl (Postfix) with ESMTPSA id A8660168387;
	Wed,  2 Oct 2024 21:37:02 +0200 (CEST)
Message-ID: <87770518-5f63-4adf-b6ea-c7f92b58ce22@ijzerbout.nl>
Date: Wed, 2 Oct 2024 21:36:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] pinctrl: Add driver for the T-Head TH1520 SoC
To: Drew Fustini <dfustini@tenstorrent.com>, Drew Fustini <drew@pdp7.com>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240930-th1520-pinctrl-v3-0-32cea2bdbecb@tenstorrent.com>
 <20240930-th1520-pinctrl-v3-2-32cea2bdbecb@tenstorrent.com>
Content-Language: en-US
From: Kees Bakker <kees@ijzerbout.nl>
In-Reply-To: <20240930-th1520-pinctrl-v3-2-32cea2bdbecb@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_123714_621552_9F9DC30B 
X-CRM114-Status: GOOD (  10.68  )
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

T3AgMzAtMDktMjAyNCBvbSAyMTo1MCBzY2hyZWVmIERyZXcgRnVzdGluaToKPiBGcm9tOiBFbWls
IFJlbm5lciBCZXJ0aGluZyA8ZW1pbC5yZW5uZXIuYmVydGhpbmdAY2Fub25pY2FsLmNvbT4KPgo+
IEFkZCBwaW5jdHJsIGRyaXZlciBmb3IgdGhlIFQtSGVhZCBUSDE1MjAgUklTQy1WIFNvQy4KPgo+
IFRlc3RlZC1ieTogVGhvbWFzIEJvbm5lZmlsbGUgPHRob21hcy5ib25uZWZpbGxlQGJvb3RsaW4u
Y29tPgo+IFNpZ25lZC1vZmYtYnk6IEVtaWwgUmVubmVyIEJlcnRoaW5nIDxlbWlsLnJlbm5lci5i
ZXJ0aGluZ0BjYW5vbmljYWwuY29tPgo+IFtkZnVzdGluaTogdXNlIHRoZWFkLHBhZC1ncm91cCB0
byBpZGVudGlmeSB0aGUgcGluIGNvbnRyb2xsZXIgaW5zdGFuY2VdCj4gU2lnbmVkLW9mZi1ieTog
RHJldyBGdXN0aW5pIDxkZnVzdGluaUB0ZW5zdG9ycmVudC5jb20+Cj4gLS0tCj4gICBNQUlOVEFJ
TkVSUyAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCj4gICBkcml2ZXJzL3BpbmN0cmwvS2Nv
bmZpZyAgICAgICAgICB8ICAxMyArCj4gICBkcml2ZXJzL3BpbmN0cmwvTWFrZWZpbGUgICAgICAg
ICB8ICAgMSArCj4gICBkcml2ZXJzL3BpbmN0cmwvcGluY3RybC10aDE1MjAuYyB8IDkwNyArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgIDQgZmlsZXMgY2hhbmdlZCwg
OTIyIGluc2VydGlvbnMoKykKPgo+IFsuLi5dCj4gK3N0YXRpYyBpbnQgdGgxNTIwX3Bpbm11eF9z
ZXRfbXV4KHN0cnVjdCBwaW5jdHJsX2RldiAqcGN0bGRldiwKPiArCQkJCSB1bnNpZ25lZCBpbnQg
ZnNlbCwgdW5zaWduZWQgaW50IGdzZWwpCj4gK3sKPiArCXN0cnVjdCB0aDE1MjBfcGluY3RybCAq
dGhwID0gcGluY3RybF9kZXZfZ2V0X2RydmRhdGEocGN0bGRldik7Cj4gKwljb25zdCBzdHJ1Y3Qg
ZnVuY3Rpb25fZGVzYyAqZnVuYyA9IHBpbm11eF9nZW5lcmljX2dldF9mdW5jdGlvbihwY3RsZGV2
LCBmc2VsKTsKZnVuYyBjYW4gYmUgTlVMTCBhZnRlciBjYWxsaW5nIHBpbm11eF9nZW5lcmljX2dl
dF9mdW5jdGlvbgpQbGVhc2UgYWRkIHNvbWV0aGluZyB0byBhdm9pZCBOVUxMIHBvaW50ZXIgZGVy
ZWZlcmVuY2luZyBpbiB0aGUgbmV4dCAKc3RhdGVtZW50LgpBbGwgb3RoZXIgY2FsbGVycyBvZiBw
aW5tdXhfZ2VuZXJpY19nZXRfZnVuY3Rpb24gaGF2ZSBzb21ldGhpbmcgbGlrZSB0aGlzOgogwqDC
oMKgIGlmICghZnVuYykKIMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+ICsKPiArCXJl
dHVybiB0aDE1MjBfcGlubXV4X3NldCh0aHAsIHRocC0+ZGVzYy5waW5zW2dzZWxdLm51bWJlciwK
PiArCQkJCSAodWludHB0cl90KXRocC0+ZGVzYy5waW5zW2dzZWxdLmRydl9kYXRhICYgVEgxNTIw
X1BBRF9NVVhEQVRBLAo+ICsJCQkJICh1aW50cHRyX3QpZnVuYy0+ZGF0YSk7Cj4gK30KPiArCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
