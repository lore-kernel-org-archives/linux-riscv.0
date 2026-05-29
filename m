Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC011CD6E43
	for <linux-riscv@archiver.kernel.org>; Fri, 29 May 2026 11:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:Message-Id
	:Date:Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YIByeUTj2pbC2gw5gjNB+ZcM3pDZMbDBb3MutPRp4PQ=; b=OI1cUy/eW8DQUE48mH3q+aAleq
	g2zeJlERyL+hAuptBmFQ6RIVp9UuJJvgrcBNx4n6YCrHoHeZJB3H187sGeE8HQ1qt0wRuVXQgSIy6
	Ktz7AsIbdvsjgTO8n47m7KOaeFZw8+9XGS6WMAZed2mDOVB47thPPUQihKQcz/ewp8Ql0uFH1XvqK
	x84fJPbKFidU87N3it826vMueP2lGi9b2D0meIHBvWVhsddUN5O6673DHuXoWc8taojcTU4TUW6gV
	rzkFORuZa8GyycY8hjvtU0jCZny0DzCSflo4Ylu1PRfkei7xr30L0O/vyk82nYkReN7Ynj6qsCk/Z
	arotkDxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSvPA-00000007HP0-3Hla;
	Fri, 29 May 2026 11:29:32 +0000
Received: from smtp.forwardemail.net ([121.127.44.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSvP7-00000007HNb-0GLp
	for linux-riscv@lists.infradead.org;
	Fri, 29 May 2026 11:29:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: Cc: To: From: Subject: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1780054167;
 bh=mvGXi3GnoQLfXUwepfNKreQtoZ065df4GYADd0i3vGY=;
 b=blWlMXan1MSo6CS28ZZ+xUN8xIdK+GE9+fuYFCX3ApfRwJELBB4DbfAqa3iUQFLLjA/gy/pJS
 GDqFaExGyV9w8dMKmH0XKGtpaJ1m5B5FrNiClOX7jxD2g8N0Q0MrOgfiyF0ECdtizQ4gxrRbUSo
 r+01AoXy47AkwtIzuIth1mQKyoYwQ3RiZxMdstfEP2ln8dUrPlixGuhAGgi/yMqCvtmvqy6fLOL
 MGHGfpJI6paNEDk9koJTyBBA+d/I1fZon2X+TGMXzrpoUIKCziB2hV8NRhpROgPlDh0Ty5JVDHN
 Xqn5Uuwz9pvl4hSi5gjA1KrMwjXaR3UZOQn0w8D9Tu+w==
X-Forward-Email-ID: 6a1978895c58ed9868160fa3
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.8.15
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Mime-Version: 1.0
Date: Fri, 29 May 2026 07:29:08 -0400
Message-Id: <DIV4J6UGUQGG.28KL8EGBZWJSJ@ubuntu.com>
Subject: Re: [PATCH v1 4/6] power: Use named initializers for
 platform_device_id arrays
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?=
 <u.kleine-koenig@baylibre.com>, "Sebastian Reichel" <sre@kernel.org>
Cc: "Yixun Lan" <dlan@kernel.org>, "Andreas Kemnade" <andreas@kemnade.info>,
 "Matti Vaittinen" <mazziesaccount@gmail.com>, "Sven Peter"
 <sven@kernel.org>, "Janne Grunau" <j@jannau.net>, "Neal Gompa"
 <neal@gompa.dev>, "Amit Sunil Dhamne" <amitsd@google.com>, "Samuel Kayode"
 <samkay014@gmail.com>, <linux-pm@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <asahi@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>
X-Mailer: aerc 0.21.0
References: <cover.1780048925.git.u.kleine-koenig@baylibre.com>
 <1ceacf4f9c3f827bcad85b378aa04cdca1c04635.1780048925.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <1ceacf4f9c3f827bcad85b378aa04cdca1c04635.1780048925.git.u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_042929_464393_F2325E31 
X-CRM114-Status: GOOD (  15.30  )
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
Content-Type: text/plain; charset="utf-8"; Format="Flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpIE1heSAyOSwgMjAyNiBhdCA2OjE4IEFNIEVEVCwgVXdlIEtsZWluZS1Lw7ZuaWcgKFRo
ZSBDYXBhYmxlIEh1Yikgd3JvdGU6Cj4gTmFtZWQgaW5pdGlhbGl6ZXJzIGFyZSBiZXR0ZXIgcmVh
ZGFibGUgYW5kIG1vcmUgcm9idXN0IHRvIGNoYW5nZXMgb2YgdGhlCj4gc3RydWN0IGRlZmluaXRp
b24uIFRoaXMgcm9idXN0bmVzcyBpcyByZWxldmFudCBmb3IgYSBwbGFubmVkIGNoYW5nZSB0bwo+
IHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2VfaWQgcmVwbGFjaW5nIC5kcml2ZXJfZGF0YSBieSBhbiBh
bm9ueW1vdXMgdW5pb24uCj4KPiBXaGlsZSB0b3VjaGluZyB0aGVzZSBhcnJheXMgdW5pZnkgc3Bh
Y2luZyBhbmQgdXNhZ2Ugb2YgY29tbWFzLgo+Cj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1L
w7ZuaWcgKFRoZSBDYXBhYmxlIEh1YikgPHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20+Cj4g
LS0tCj4gIGRyaXZlcnMvcG93ZXIvcmVzZXQvc3BhY2VtaXQtcDEtcmVib290LmMgfCA0ICsrLS0K
PiAgZHJpdmVycy9wb3dlci9yZXNldC90cHM2NTA4Ni1yZXN0YXJ0LmMgICB8IDIgKy0KPiAgZHJp
dmVycy9wb3dlci9zdXBwbHkvYmQ3MTgyOC1wb3dlci5jICAgICB8IDggKysrKy0tLS0KPiAgZHJp
dmVycy9wb3dlci9zdXBwbHkvbWFjc21jLXBvd2VyLmMgICAgICB8IDIgKy0KPiAgZHJpdmVycy9w
b3dlci9zdXBwbHkvbWF4Nzc3NTlfY2hhcmdlci5jICB8IDIgKy0KPiAgZHJpdmVycy9wb3dlci9z
dXBwbHkvbWF4ODk5OF9jaGFyZ2VyLmMgICB8IDIgKy0KPiAgZHJpdmVycy9wb3dlci9zdXBwbHkv
cGYxNTUwLWNoYXJnZXIuYyAgICB8IDIgKy0KPiAgZHJpdmVycy9wb3dlci9zdXBwbHkvcnQ1MDMz
X2NoYXJnZXIuYyAgICB8IDIgKy0KPiAgOCBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCsp
LCAxMiBkZWxldGlvbnMoLSkKCltzbmlwXQoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wb3dlci9z
dXBwbHkvbWFjc21jLXBvd2VyLmMgYi9kcml2ZXJzL3Bvd2VyL3N1cHBseS9tYWNzbWMtcG93ZXIu
Ywo+IGluZGV4IDMzY2EwNzQ2MGYzYS4uY2VkMDdmNzFlMGE4IDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvcG93ZXIvc3VwcGx5L21hY3NtYy1wb3dlci5jCj4gKysrIGIvZHJpdmVycy9wb3dlci9zdXBw
bHkvbWFjc21jLXBvd2VyLmMKPiBAQCAtODM0LDcgKzgzNCw3IEBAIHN0YXRpYyB2b2lkIG1hY3Nt
Y19wb3dlcl9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgfQo+ICAKPiAg
c3RhdGljIGNvbnN0IHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2VfaWQgbWFjc21jX3Bvd2VyX2lkW10g
PSB7Cj4gLQl7ICJtYWNzbWMtcG93ZXIiIH0sCj4gKwl7IC5uYW1lID0gIm1hY3NtYy1wb3dlciIg
fSwKPiAgCXsgLyogc2VudGluZWwgKi8gfQo+ICB9Owo+ICBNT0RVTEVfREVWSUNFX1RBQkxFKHBs
YXRmb3JtLCBtYWNzbWNfcG93ZXJfaWQpOwoKRm9yIG1hY3NtYy1wb3dlciwKClJldmlld2VkLWJ5
OiBKb3NodWEgUGVpc2FjaCA8anBlaXNhY2hAdWJ1bnR1LmNvbT4KCihJJ20gbm90IHN1cmUgaWYg
b25lIGNhbiAiUmV2aWV3LWJ5IiBhIHNwZWNpZmljIHNlY3Rpb24gb2YgYSBzaW5ndWxhcgpwYXRj
aCwgYnV0IGFsc28gdGhlIG90aGVyIGNoYW5nZXMgaW4gdGhlIHBhdGNoIGxvb2sgZmluZSB0byBt
ZSwgc28KY29uc2lkZXIgaXQgcmV2aWV3ZWQgYXMgd2VsbC4pCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
