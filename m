Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBDACA0EED
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 09:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JcuGqWeAQs9MVo8iSe9OCbOpjqOo53kE8OxxiJLZhiA=; b=lvAGLAljIoleex
	0kyZTqV5axK7CJNWM9HfgMMPsVqODsakgNhs4amHVYwqv9iHfojK/XlMs0CFlP9yJDNyFGRhm/Qo2
	e3piMrUYIVxrQmvex0syK3D2BgwKgCM4D64hTAbyx3kQHVeMUIoMY5HAnJW1RX5RnKTjydszzZYMU
	2CE5ZR7PNmRT3GUZ57ISexSvZDTUY+RmsPlDN98hWkw4YuvnUDSDsWXflT2KwzLhFWsquk69fOgZi
	KqNQwch3ZfOBhzEtfhvjAm8Ztczfev9q/Ha0oqqH/5bXyJ6l4k4bmzq/YPRRnnLyuqXH194QEYItU
	b5pudrvcNhDX3bNfvJkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoIPK-00000009uYG-1mnh;
	Tue, 19 Aug 2025 09:13:30 +0000
Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net ([206.189.21.223])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoHng-00000009oyt-0e6r
	for linux-riscv@lists.infradead.org;
	Tue, 19 Aug 2025 08:34:39 +0000
Received: from dongxuyang$eswincomputing.com ( [10.12.96.41] ) by
 ajax-webmail-app2 (Coremail) ; Tue, 19 Aug 2025 16:34:18 +0800 (GMT+08:00)
X-Originating-IP: [10.12.96.41]
Date: Tue, 19 Aug 2025 16:34:18 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?6JGj57uq5rSL?= <dongxuyang@eswincomputing.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, mturquette@baylibre.com,
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, linux-riscv@lists.infradead.org
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com,
	huangyifeng@eswincomputing.com, pinkesh.vaghela@einfochips.com
Subject: Re: Re: [PATCH v4 3/3] riscv: dts: eswin: Add clock driver support
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2025 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <0ef61f03-0346-491d-ad2a-293e24cbc4a8@kernel.org>
References: <20250815093539.975-1-dongxuyang@eswincomputing.com>
 <20250815093754.1143-1-dongxuyang@eswincomputing.com>
 <0ef61f03-0346-491d-ad2a-293e24cbc4a8@kernel.org>
MIME-Version: 1.0
Message-ID: <3fa3950e.371.198c1770125.Coremail.dongxuyang@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TQJkCgDHZpUKN6Ro+YvAAA--.22666W
X-CM-SenderInfo: pgrqw5xx1d0w46hv4xpqfrz1xxwl0woofrz/1tbiAgETAmijVc8e3
	wABsD
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_013436_508713_3327D451 
X-CRM114-Status: GOOD (  15.48  )
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

SGkgS3J6eXN6dG9mLAoKVGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgeW91ciBjb25zdHJ1Y3RpdmUg
c3VnZ2VzdGlvbnMuCgo+ID4gCj4gPiBBZGQgY2xvY2sgZGV2aWNlIHRyZWUgc3VwcG9ydCBmb3Ig
ZWljNzcwMCBTb0MuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFlpZmVuZyBIdWFuZyA8aHVhbmd5
aWZlbmdAZXN3aW5jb21wdXRpbmcuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogWHV5YW5nIERvbmcg
PGRvbmd4dXlhbmdAZXN3aW5jb21wdXRpbmcuY29tPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9i
b290L2R0cy9lc3dpbi9laWM3NzAwLWNsb2Nrcy5kdHNpIHwgMjI4MyArKysrKysrKysrKysrKysr
Kwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyMjgzIGluc2VydGlvbnMoKykKPiA+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgYXJjaC9yaXNjdi9ib290L2R0cy9lc3dpbi9laWM3NzAwLWNsb2Nrcy5kdHNpCj4g
PiAKPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2Vzd2luL2VpYzc3MDAtY2xv
Y2tzLmR0c2kgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2Vzd2luL2VpYzc3MDAtY2xvY2tzLmR0c2kK
PiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjQwNWQwNmY5
MTkwZQo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9lc3dp
bi9laWM3NzAwLWNsb2Nrcy5kdHNpCj4gPiBAQCAtMCwwICsxLDIyODMgQEAKPiA+ICsvLyBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgTUlUKQo+ID4gKy8qCj4gPiArICogQ29w
eXJpZ2h0IChjKSAyMDI1LCBCZWlqaW5nIEVTV0lOIENvbXB1dGluZyBUZWNobm9sb2d5IENvLiwg
THRkLgo+ID4gKyAqLwo+ID4gKwo+ID4gKy8gewo+ID4gKwljbG9jay1jb250cm9sbGVyQDUxODI4
MDAwIHsKPiA+ICsJCWNvbXBhdGlibGUgPSAiZXN3aW4sZWljNzcwMC1jbG9jayI7Cj4gPiArCQly
ZWcgPSA8MHgwMDAwMDAgMHg1MTgyODAwMCAweDAwMDAwMCAweDgwMDAwPjsKPiA+ICsJCSNjbG9j
ay1jZWxscyA9IDwwPjsKPiA+ICsJCSNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ID4gKwkJI3NpemUt
Y2VsbHMgPSA8MD47Cj4gPiArCj4gPiArCQkvKiBmaXhlZCBjbG9jayAqLwo+ID4gKwkJZml4ZWRf
cmF0ZV9jbGtfYXBsbF9mb3V0MjogZml4ZWQtcmF0ZS1hcGxsLWZvdXQyIHsKPiAKPiBTdWNoIHBh
dHRlcm4gd2FzIHllYXJzIGFnbyBOQUtlZC4KPiAKPiBObywgZG9uJ3QgZXZlciBicmluZyBub2Rl
cyBwZXIgY2xvY2suCj4gCldlIGhhdmUgZGVmaW5lZCBhIGxhcmdlIG51bWJlciBvZiBjbG9jayBk
ZXZpY2VzLsKgClRoZSBjb21tZW50IG9mIHYzIGlzICJEcml2ZXIgaXMgYWxzbyB3YXkgdG9vIGJp
ZyBmb3Igc2ltcGxlIGNsb2NrIGRyaXZlciBhbmQgScKgCmFtIHN1cnByaXNlZCB0byBzZWUgc28g
bWFueSByZWR1bmRhbmNpZXMuIi4gVGhlcmVmb3JlLCB3ZSBtb2RpZmllZCB0aGUgY2xvY2vCoApk
cml2ZXIgY29kZSBhbmQgbW92ZWQgdGhlIGRlc2NyaXB0aW9uIG9mIGNsb2NrIGRldmljZSBmcm9t
IHRoZSBkcml2ZXIgdG8gdGhlIERUUy4KCkJ1dCwgdGhpcyBjb21tZW50IGlzIHRoYXQgZG9uJ3Qg
ZXZlciBicmluZyBub2RlcyBwZXIgY2xvY2suIFdl4oCZdmUgcnVuIGludG8gc29tZQp0cm91Ymxl
IGFuZCBhcmVu4oCZdCBzdXJlIHdoaWNoIGFwcHJvYWNoIGFsaWducyBiZXR0ZXIgd2l0aCBjb21t
dW5pdHkgZ3VpZGVsaW5lcy7CoApDb3VsZCB5b3Ugc2hhcmUgeW91ciBhZHZpY2Ugb3Igc3VnZ2Vz
dGlvbnMgb24gdGhlIGJlc3Qgd2F5IGZvcndhcmQ/CgpJIHdvdWxkIGJlIGdyYXRlZnVsIGZvciB5
b3VyIHJlcGx5LgoKUmVnYXJkcywKWHV5YW5nIERvbmcKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
