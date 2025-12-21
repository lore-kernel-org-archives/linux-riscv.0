Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F5DE66886
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Dec 2025 15:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j8EyiI+WDtKTA3hV45BseeFWWAyaHIFwf/vV7TFv7XA=; b=DnXwqrjQEdSYhT
	APDfYAZWfaWd9QGmzVigU9OpdcobnUyV16uFttc6G5gLzTxKzjHc5TInqMWRRDBL3d0ZUOkvcRT5H
	rElyLGf/KTlpwlcKpbxq09xYLjprJnP5LrD20yWW5f5+5pwoCzNJ+GJ8Kgi09xfimF+G4tZ8CbXd+
	mhRclShynQhtT4p0Tfl1i4aXpMxnX5fZXZccQPUFnHmUZp57oUj9+/MoOTrvL7IltC29tXvBRauam
	WEmJiVpqfDcgccQ9rFXoc4YNGSMvhXQNa2dlI/Aj9U9y1IgJ22HMNfXON3faWSjpCeMiIOe7qrsPi
	we3VQ6oaYFNy2ecIKKDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXL3U-0000000CXHK-1qIN;
	Sun, 21 Dec 2025 15:09:08 +0000
Received: from sender4-pp-o92.zoho.com ([136.143.188.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXL3R-0000000CXGr-0pxU
	for linux-riscv@lists.infradead.org;
	Sun, 21 Dec 2025 15:09:06 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1766329740; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GCdIr7q++CZ1rnJO2UDv1Hs/4sS3X7ostA7dPNs3XLRw0oghG6bfNU98/8kHZp6962p13b5pFX9DFR36BuUORATVMwzjJnpQwWjr67nclcUUP4GIfol9M56HN1EmRkdOAf2BOxeF+ST0kBFdAkkEG7nc08A1K96RLzcfMbbJRvE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1766329740; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=UX0Ujw2PD/K2tYYP3yHJDgWY39Znwpjg+z+cHhIZ01Q=; 
	b=F4zFLvkcCQJ4t9ORemcG9vbE5miBoqhO8TqUBS9vv4QwJmOm1E/2x4k5tEsZWizbXzDAbC8l4PNX7qMXd2yoE9VEvSSI7MY0fjYyzT+s0DTQ7KUFxHCLxYLrzKwzl3qEfUaq+WAMhPAjyNfkHiJKCa6iIk1pBLI/fVO4c1+EZV8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766329740;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=UX0Ujw2PD/K2tYYP3yHJDgWY39Znwpjg+z+cHhIZ01Q=;
	b=KbcmyuSGXiOQ9JwvDhm55JQDIvuuUmkDGc70KEXgTpf2YdsKrLKS7cbTIlDa1wON
	kGD6A01mpgpKSlwK1YvAEctcgrH92OlrVp+fYvFSyUIkV5yOhUap+85PYXVBbFVNYG/
	1wPebABxJ/6BwT9LVmPGNDR0KGfBhzJcP9nmk5R4=
Received: by mx.zohomail.com with SMTPS id 1766329732031723.5314899504488;
	Sun, 21 Dec 2025 07:08:52 -0800 (PST)
Message-ID: <159615d3-cc52-43be-bf6d-5fe717ef1cc4@zohomail.com>
Date: Sun, 21 Dec 2025 23:08:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/3] clk: canaan: Add clock driver for Canaan K230
To: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Samuel Holland <samuel.holland@sifive.com>,
 Troy Mitchell <TroyMitchell988@gmail.com>
References: <20251127-b4-k230-clk-v9-0-3aa09e17faf5@zohomail.com>
 <20251127-b4-k230-clk-v9-2-3aa09e17faf5@zohomail.com>
 <aUUGeGnYR+joVR8c@duge-virtual-machine>
From: Xukai Wang <kingxukai@zohomail.com>
Content-Language: en-US
In-Reply-To: <aUUGeGnYR+joVR8c@duge-virtual-machine>
Feedback-ID: rr080112272dacd3307bc12eb9efc14afb000030c0ea914924bd42e65f6f8bd29054d56c70272add6ef00a72:zu08011227952f7c85760f0a0815f8be44000025411d7b5419e31de20d2757fa5e43bee102f9986953eac086:rf0801122c48b7d601294da21e6fedbda600008d0ec30cf86e9c4eb95b2e97d86358f1eed49f07556fd17cc812a72020dc:ZohoMail
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_070905_320770_DE7AB151 
X-CRM114-Status: GOOD (  14.99  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIDIwMjUvMTIvMTkgMTY6MDIsIEppYXl1IER1IHdyb3RlOgo+IE9uIFRodSwgTm92IDI3LCAy
MDI1IGF0IDA4OjQ1OjEzUE0gKzA4MDAsIFh1a2FpIFdhbmcgd3JvdGU6Cj4+IFRoaXMgcGF0Y2gg
cHJvdmlkZXMgYmFzaWMgc3VwcG9ydCBmb3IgdGhlIEsyMzAgY2xvY2ssIHdoaWNoIGNvdmVycwo+
PiBhbGwgY2xvY2tzIGluIEsyMzAgU29DLgo+Pgo+PiBUaGUgY2xvY2sgdHJlZSBvZiB0aGUgSzIz
MCBTb0MgY29uc2lzdHMgb2YgYSAyNE1IWiBleHRlcm5hbCBjcnlzdGFsCj4+IG9zY2lsbGF0b3Is
IFBMTHMgYW5kIGFuIGV4dGVybmFsIHB1bHNlIGlucHV0IGZvciB0aW1lclgsIGFuZCB0aGVpcgo+
PiBkZXJpdmVkIGNsb2Nrcy4KPj4KPj4gQ28tZGV2ZWxvcGVkLWJ5OiBUcm95IE1pdGNoZWxsIDxU
cm95TWl0Y2hlbGw5ODhAZ21haWwuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBUcm95IE1pdGNoZWxs
IDxUcm95TWl0Y2hlbGw5ODhAZ21haWwuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBYdWthaSBXYW5n
IDxraW5neHVrYWlAem9ob21haWwuY29tPgo+PiAtLS0KPj4gIGRyaXZlcnMvY2xrL0tjb25maWcg
ICAgfCAgICA2ICsKPj4gIGRyaXZlcnMvY2xrL01ha2VmaWxlICAgfCAgICAxICsKPj4gIGRyaXZl
cnMvY2xrL2Nsay1rMjMwLmMgfCAyNDQzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwo+PiAgMyBmaWxlcyBjaGFuZ2VkLCAyNDUwIGluc2VydGlvbnMoKykK
PiAuLi4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL2Nsay1rMjMwLmMgYi9kcml2ZXJzL2Ns
ay9jbGstazIzMC5jCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAuLjg3NTBlOWNiYWMwNGYzMGUzMWQ4ZjJlYjM5
NWM5YjQ5MDI3Y2EyNzgKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi9kcml2ZXJzL2Nsay9jbGst
azIzMC5jCj4+IEBAIC0wLDAgKzEsMjQ0MyBAQAouLi4KPiBJbmNvcnJlY3QgcmVnaXN0ZXIgYml0
IHNldHRpbmcgKGJpdDEpIGFuZCB3cm9uZyBwYXJlbnQKPiBjbG9jayByZWZlcmVuY2UgKGhzX2hj
bGtfaGlnaF9zcmNfcmF0ZSkgZm9yIGhzX2hjbGtfc3JjX2dhdGUsCj4gd2hpY2ggZG9lcyBub3Qg
Y29tcGx5IHdpdGggSzIzMCBoYXJkd2FyZSBzcGVjaWZpY2F0aW9ucy4KPiBIZXJlIGlzIGNvcnJl
Y3RpbmcgYWR2aWNlOgo+IFJlZ2lzdGVyIGJpdCBjb3JyZWN0aW9uOiBgMHgxOCwgMSwgMCwgMCxg
IC0+IGAweDE4LCAwLCAwLCAwLGAKWW91J3JlIHJpZ2h0LCB0aGFua3MgZm9yIHRoZSBjb3JyZWN0
aW9uLiBUaGUgYml0IGluZGV4IHNob3VsZCBiZSAwLCBub3QgMS4KPiBQYXJlbnQgY2xvY2sgY29y
cmVjdGlvbjogYCZoc19oY2xrX2hpZ2hfc3JjX3JhdGUuY2xrLmh3YCAtPgo+IGAmaHNfaGNsa19o
aWdoX2dhdGUuY2xrLmh3YAoKQWNjb3JkaW5nIHRvIHRoZSB2ZW5kb3IncyBjb2RlIFsxXSwgdGhl
IHBhcmVudCBjbG9jayBvZiBoc19oY2xrX3NyYyBpcwpoc19oY2xrX2hpZ2hfc3JjLgoKPgo+PiAr
SzIzMF9DTEtfUkFURV9GT1JNQVQoaHNfaGNsa19zcmNfcmF0ZSwKPj4gKwkJICAgICBLMjMwX0hT
X0hDTEtfU1JDX1JBVEUsCj4gLi4uCj4+ICtLMjMwX0NMS19SQVRFX0ZPUk1BVChoc19zZF9jYXJk
X3NyY19yYXRlLAo+PiArCQkgICAgIEsyMzBfSFNfU0RfQ0FSRF9TUkNfUkFURSwKPj4gKwkJICAg
ICAxLCAxLCAwLCAwLAo+PiArCQkgICAgIDIsIDgsIDEyLCAweDcsCj4+ICsJCSAgICAgMHgxQywg
MzEsIGRpdiwgMHgwLAo+PiArCQkgICAgIGZhbHNlLCAwLAo+PiArCQkgICAgICZwbGwwX2RpdjQu
aHcpOwo+PiArCj4gVGhlIHBhcmVudCBjbG9jayBvZiBoc19zZF9jYXJkX3NyY19yYXRlIGlzIGlu
Y29ycmVjdGx5IHBvaW50ZWQKPiB0byBwbGwwX2RpdjQuCj4gSGVyZSBpcyBjb3JyZWN0aW5nIGFk
dmljZToKPiBgJnBsbDBfZGl2NC5od2Ag4oaSIGAmaHNfc2RfY2FyZF9zcmNfZ2F0ZS5jbGsuaHdg
CllvdSdyZSByaWdodCwgdGhhdCdzIG15IG1pc3Rha2UuIFRoYW5rcyBmb3IgcG9pbnRpbmcgaXQg
b3V0Lgo+Cj4+ICtLMjMwX0NMS19HQVRFX0ZPUk1BVChoc19zZDBfY2FyZF9nYXRlLAo+PiArCQkg
ICAgIEsyMzBfSFNfU0QwX0NBUkRfR0FURSwKPj4gKwkJICAgICAweDE4LCAxNSwgMCwgMCwKPiAu
Li4KPj4gKwl9LAo+PiArCS5wcm9iZSA9IGsyMzBfY2xrX3Byb2JlLAo+PiArfTsKPj4gK2J1aWx0
aW5fcGxhdGZvcm1fZHJpdmVyKGsyMzBfY2xrX2RyaXZlcik7Cj4+Cj4+IC0tIAo+PiAyLjM0LjEK
Pj4KTGluazoKClsxXQpodHRwczovL2dpdGh1Yi5jb20va2VuZHJ5dGUvazIzMF9zZGsvYmxvYi9t
YWluL3NyYy9saXR0bGUvbGludXgvYXJjaC9yaXNjdi9ib290L2R0cy9rZW5kcnl0ZS9jbG9ja19w
cm92aWRlci5kdHNpI0w1NzgKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
