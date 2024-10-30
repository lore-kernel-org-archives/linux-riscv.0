Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF337D74950
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Oct 2024 00:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7TKq/vXBf/ZjZyUkbw2RK1SZq3bRN3v7OH0b4oPRC6s=; b=5AELz/nwV7RDLd
	pdjn1YlEGVLnC1MDVPfkE0ioeSA2QEgqLwRqy2IUecCZ/wrxyTaBWxJO/WWTh46FZ/8AtAWZfq9LT
	RAC9cUEYdXIuIpDYJSiqGSik9uFduKSzUW9mExVKPtoz2IUjAYfL344oEWM4AFqiABuoi25SkH9I6
	IYedWhyAhMrBgd3/iQMhDvskfjKBWZ706ozjjf8/fe3xc+hRaRX7lVlky0FP4tUQr97FGQaE0FG7B
	ePlM/SnKx3LWhwFVfueaw0sztUxJfXna4uUN7cVRKmVxtRcYHBKVVj/WFHLL3V73l/YwHnwkfBouC
	jqurkl3M3+hrtVvPodkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5wUm-0000000GK60-027F;
	Wed, 30 Oct 2024 00:23:32 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5wUi-0000000GK54-3kMm;
	Wed, 30 Oct 2024 00:23:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1730247801;
	bh=g97qSBk0nfVaTQ4nSQz7mm5l86i31AAhLyCvLjCxnwg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=di+ZrdRmCd/lQns/8eExuvjbnZpOwlfJZqQhT0vk6A4dWQSREGaSjYA1NUpuSXq/9
	 zLOKIqOjor7p9tE0dyGfw4ybWiryzyo+iipRVF2kM5VpPdFA3d+3Ou9jXOVP2gRjYg
	 nxhaMgbcn/2U32y5829iQGbhb4KxNznUA2+K/2a0+EQ2SswvR0VQC5IX3R2gM1Hc5H
	 qIqUDA2Y9Sx6OWg9iXKjz7Q61ZLM8qzV89E79bImydBlZ3cYU8OsnRBo4eKdTRLt29
	 HKUqM1u67bcl+f74e72B6y7/Ev8hL3bEW1/AqAaeVkze+VI+uRfQfKCa7B551KThzG
	 ud9Ehgxe8s9Jw==
Received: from [192.168.68.112] (ppp118-210-190-243.adl-adc-lon-bras34.tpg.internode.on.net [118.210.190.243])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A1A9067E6D;
	Wed, 30 Oct 2024 08:23:10 +0800 (AWST)
Message-ID: <3c7893f5186f0c6d64c063dc0a609ec8d6c8bcf1.camel@codeconstruct.com.au>
Subject: Re: [PATCH] soc: Switch back to struct platform_driver::remove()
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>, 
	Arnd Bergmann
	 <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Cc: Joel Stanley <joel@jms.id.au>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>, 
 Qiang Zhao <qiang.zhao@nxp.com>, Hitomi Hasegawa
 <hasegawa-hitomi@fujitsu.com>, Huisong Li <lihuisong@huawei.com>, Linus
 Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>, Karol Gugala
 <kgugala@antmicro.com>, Mateusz Holenko <mholenko@antmicro.com>, Gabriel
 Somlo <gsomlo@gmail.com>, Yinbo Zhu <zhuyinbo@loongson.cn>, Matthias
 Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Conor Dooley
 <conor.dooley@microchip.com>, Daire McNamara
 <daire.mcnamara@microchip.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Alim Akhtar <alim.akhtar@samsung.com>,  Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Nishanth Menon <nm@ti.com>,  Santosh Shilimkar <ssantosh@kernel.org>,
 Michal Simek <michal.simek@amd.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Duje =?UTF-8?Q?Mihanovi=C4=87?=
 <duje.mihanovic@skole.hr>, Mark Brown <broonie@kernel.org>, David Wu
 <david.wu@rock-chips.com>, Jianqun Xu <jay.xu@rock-chips.com>, Jay
 Buddhabhatti <jay.buddhabhatti@amd.com>, Radhey Shyam Pandey
 <radhey.shyam.pandey@amd.com>,  Izhar Ameer Shaikh
 <izhar.ameer.shaikh@amd.com>, Naman Trivedi Manojbhai
 <naman.trivedimanojbhai@amd.com>,  linux-arm-kernel@lists.infradead.org,
 soc@lists.linux.dev,  linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org,  linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev,  linux-mediatek@lists.infradead.org,
 linux-riscv@lists.infradead.org,  linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org,  linux-samsung-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org,  linux-pm@vger.kernel.org
Date: Wed, 30 Oct 2024 10:53:09 +1030
In-Reply-To: <20241029074859.509587-2-u.kleine-koenig@baylibre.com>
References: <20241029074859.509587-2-u.kleine-koenig@baylibre.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_172329_145776_4BE8AF19 
X-CRM114-Status: GOOD (  20.21  )
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

T24gVHVlLCAyMDI0LTEwLTI5IGF0IDA4OjQ4ICswMTAwLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90
ZToKPiBBZnRlciBjb21taXQgMGVkYjU1NWE2NWQxICgicGxhdGZvcm06IE1ha2UgcGxhdGZvcm1f
ZHJpdmVyOjpyZW1vdmUoKQo+IHJldHVybiB2b2lkIikgLnJlbW92ZSgpIGlzIChhZ2FpbikgdGhl
IHJpZ2h0IGNhbGxiYWNrIHRvIGltcGxlbWVudAo+IGZvcgo+IHBsYXRmb3JtIGRyaXZlcnMuCj4g
Cj4gQ29udmVydCBhbGwgcGxhdGZvcm0gZHJpdmVycyBiZWxvdyBkcml2ZXJzL3NvYyB0byB1c2Ug
LnJlbW92ZSgpLCB3aXRoCj4gdGhlIGV2ZW50dWFsIGdvYWwgdG8gZHJvcCBzdHJ1Y3QgcGxhdGZv
cm1fZHJpdmVyOjpyZW1vdmVfbmV3KCkuIEFzCj4gLnJlbW92ZSgpIGFuZCAucmVtb3ZlX25ldygp
IGhhdmUgdGhlIHNhbWUgcHJvdG90eXBlcywgY29udmVyc2lvbiBpcwo+IGRvbmUKPiBieSBqdXN0
IGNoYW5naW5nIHRoZSBzdHJ1Y3R1cmUgbWVtYmVyIG5hbWUgaW4gdGhlIGRyaXZlciBpbml0aWFs
aXplci4KPiAKPiBPbiB0aGUgd2F5IGRvIGEgZmV3IHdoaXRlc3BhY2UgY2hhbmdlcyB0byBtYWtl
IGluZGVudGlvbiBjb25zaXN0ZW50Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2
bmlnIDx1LmtsZWluZS1rb2VuaWdAYmF5bGlicmUuY29tPgo+IC0tLQo+IEhlbGxvLAo+IAo+IEkg
ZGlkIGEgc2luZ2xlIHBhdGNoIGZvciBhbGwgb2YgZHJpdmVycy9zb2MuIFdoaWxlIEkgdXN1YWxs
eSBwcmVmZXIKPiB0bwo+IGRvIG9uZSBsb2dpY2FsIGNoYW5nZSBwZXIgcGF0Y2gsIHRoaXMgc2Vl
bXMgdG8gYmUgb3ZlcmVuZ2luZWVyaW5nCj4gaGVyZQo+IGFzIHRoZSBpbmRpdmlkdWFsIGNoYW5n
ZXMgYXJlIHJlYWxseSB0cml2aWFsIGFuZCBzaG91bGRuJ3QgYmUgbXVjaCBpbgo+IHRoZSB3YXkg
Zm9yIHN0YWJsZSBiYWNrcG9ydHMuCj4gCj4gVGhlcmUgaXMgbm8gZGVkaWNhdGVkIG1haW50YWlu
ZXIgZm9yIGFsbCBvZiBkcml2ZXJzL3NvYywgYnV0IEknZAo+IGV4cGVjdAo+IGl0IHRvIGJlIG9r
IHRvIGJlIHBpY2tlZCB1cCBieSB0aGUgYXJtIHNvYyB0ZWFtLgo+IAo+IFRoaXMgaXMgYmFzZWQg
b24gdG9kYXkncyBuZXh0LCBpZiBjb25mbGljdHMgYXJpc2Ugd2hlbiB5b3UgYXBwbHkgaXQKPiBh
dAo+IHNvbWUgbGF0ZXIgdGltZSBhbmQgZG9uJ3Qgd2FudCB0byByZXNvbHZlIHRoZW0sIGZlZWwg
ZnJlZSB0byBqdXN0Cj4gZHJvcAo+IHRoZSBjaGFuZ2VzIHRvIHRoZSBjb25mbGljdGluZyBmaWxl
cy4gSSdsbCBub3RpY2UgYW5kIGZvbGxvd3VwIGF0IGEKPiBsYXRlciB0aW1lIHRoZW4uIE9yIGFz
ayBtZSBmb3IgYSBmaXhlZCByZXNlbmQuCj4gCj4gQmVzdCByZWdhcmRzCj4gVXdlCj4gCj4gwqBk
cml2ZXJzL3NvYy9hc3BlZWQvYXNwZWVkLWxwYy1jdHJsLmPCoMKgwqDCoMKgwqDCoCB8IDIgKy0K
PiDCoGRyaXZlcnMvc29jL2FzcGVlZC9hc3BlZWQtbHBjLXNub29wLmPCoMKgwqDCoMKgwqAgfCAy
ICstCj4gwqBkcml2ZXJzL3NvYy9hc3BlZWQvYXNwZWVkLXAyYS1jdHJsLmPCoMKgwqDCoMKgwqDC
oCB8IDIgKy0KPiDCoGRyaXZlcnMvc29jL2FzcGVlZC9hc3BlZWQtdWFydC1yb3V0aW5nLmPCoMKg
wqAgfCAyICstCgpBY2tlZC1ieTogQW5kcmV3IEplZmZlcnkgPGFuZHJld0Bjb2RlY29uc3RydWN0
LmNvbS5hdT4gIyBhc3BlZWQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
