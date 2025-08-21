Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52608CA0EEB
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 11:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mg+TPydODrrBsyVVAmJA7dMQScfxYtW6mpCCwUTX3yQ=; b=gFu7RGJgXCIOL3
	7/KeoJTlWr9Ll/t4f02nbDwC/reU3XAu93HZh7qeluWgyJWoSpbXORUWpyv7o3eC3LrWX2veYGJ8x
	vc3Cd7MN85q6I89yTttiDaYw7fW5RuPBPToyEI4X5pZC2FlzOHjDb8TUWqfTO78GzT2RZqmN742Iw
	/hbee6oX5GoCgeVebl03wQkBAVd+h4Wid54nLwA0POzJ4C4xL0S5s1l92aaxUBLsItVTUo2rE89DP
	ADJf6AoGKgu3J9Lv4MnJGoRTc2dLdNK/rkV+P3HYNrwaVWPDsE3STYGdLJwoH84PsgIjX4IsPPd0m
	4ZPmOROHJ3Zg6EZ/l/Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up3aO-0000000GmE3-16aR;
	Thu, 21 Aug 2025 11:36:04 +0000
Received: from azure-sdnproxy.icoremail.net ([4.193.249.245])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up0vW-0000000GIXF-41j1
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 08:45:45 +0000
Received: from dongxuyang$eswincomputing.com ( [10.12.96.41] ) by
 ajax-webmail-app2 (Coremail) ; Thu, 21 Aug 2025 16:45:26 +0800 (GMT+08:00)
X-Originating-IP: [10.12.96.41]
Date: Thu, 21 Aug 2025 16:45:26 +0800 (GMT+08:00)
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
In-Reply-To: <bfa23779-9861-4ae4-9ced-9f347394f033@kernel.org>
References: <20250815093539.975-1-dongxuyang@eswincomputing.com>
 <20250815093754.1143-1-dongxuyang@eswincomputing.com>
 <0ef61f03-0346-491d-ad2a-293e24cbc4a8@kernel.org>
 <3fa3950e.371.198c1770125.Coremail.dongxuyang@eswincomputing.com>
 <bfa23779-9861-4ae4-9ced-9f347394f033@kernel.org>
MIME-Version: 1.0
Message-ID: <27984d9.51f.198cbcde8d7.Coremail.dongxuyang@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TQJkCgAXt5Wm3KZodHPBAA--.23144W
X-CM-SenderInfo: pgrqw5xx1d0w46hv4xpqfrz1xxwl0woofrz/1tbiAgEBAmil+M8hP
	gACsn
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_014543_359164_A4424362 
X-CRM114-Status: GOOD (  19.88  )
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

SGkgS3J6eXN6dG9mLAoKVGhhbmtzIGZvciB5b3VyIGNvbnN0cnVjdGl2ZSBzdWdnZXN0aW9ucy4K
IAo+ID4+Pgo+ID4+PiBBZGQgY2xvY2sgZGV2aWNlIHRyZWUgc3VwcG9ydCBmb3IgZWljNzcwMCBT
b0MuCj4gPj4+Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IFlpZmVuZyBIdWFuZyA8aHVhbmd5aWZlbmdA
ZXN3aW5jb21wdXRpbmcuY29tPgo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBYdXlhbmcgRG9uZyA8ZG9u
Z3h1eWFuZ0Blc3dpbmNvbXB1dGluZy5jb20+Cj4gPj4+IC0tLQo+ID4+PiAgYXJjaC9yaXNjdi9i
b290L2R0cy9lc3dpbi9laWM3NzAwLWNsb2Nrcy5kdHNpIHwgMjI4MyArKysrKysrKysrKysrKysr
Kwo+ID4+PiAgMSBmaWxlIGNoYW5nZWQsIDIyODMgaW5zZXJ0aW9ucygrKQo+ID4+PiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvYm9vdC9kdHMvZXN3aW4vZWljNzcwMC1jbG9ja3MuZHRz
aQo+ID4+Pgo+ID4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9lc3dpbi9laWM3
NzAwLWNsb2Nrcy5kdHNpIGIvYXJjaC9yaXNjdi9ib290L2R0cy9lc3dpbi9laWM3NzAwLWNsb2Nr
cy5kdHNpCj4gPj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPj4+IGluZGV4IDAwMDAwMDAwMDAw
MC4uNDA1ZDA2ZjkxOTBlCj4gPj4+IC0tLSAvZGV2L251bGwKPiA+Pj4gKysrIGIvYXJjaC9yaXNj
di9ib290L2R0cy9lc3dpbi9laWM3NzAwLWNsb2Nrcy5kdHNpCj4gPj4+IEBAIC0wLDAgKzEsMjI4
MyBAQAo+ID4+PiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wIE9SIE1JVCkK
PiA+Pj4gKy8qCj4gPj4+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMjUsIEJlaWppbmcgRVNXSU4gQ29t
cHV0aW5nIFRlY2hub2xvZ3kgQ28uLCBMdGQuCj4gPj4+ICsgKi8KPiA+Pj4gKwo+ID4+PiArLyB7
Cj4gPj4+ICsJY2xvY2stY29udHJvbGxlckA1MTgyODAwMCB7Cj4gPj4+ICsJCWNvbXBhdGlibGUg
PSAiZXN3aW4sZWljNzcwMC1jbG9jayI7Cj4gPj4+ICsJCXJlZyA9IDwweDAwMDAwMCAweDUxODI4
MDAwIDB4MDAwMDAwIDB4ODAwMDA+Owo+ID4+PiArCQkjY2xvY2stY2VsbHMgPSA8MD47Cj4gPj4+
ICsJCSNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ID4+PiArCQkjc2l6ZS1jZWxscyA9IDwwPjsKPiA+
Pj4gKwo+ID4+PiArCQkvKiBmaXhlZCBjbG9jayAqLwo+ID4+PiArCQlmaXhlZF9yYXRlX2Nsa19h
cGxsX2ZvdXQyOiBmaXhlZC1yYXRlLWFwbGwtZm91dDIgewo+ID4+Cj4gPj4gU3VjaCBwYXR0ZXJu
IHdhcyB5ZWFycyBhZ28gTkFLZWQuCj4gPj4KPiA+PiBObywgZG9uJ3QgZXZlciBicmluZyBub2Rl
cyBwZXIgY2xvY2suCj4gPj4KPiA+IFdlIGhhdmUgZGVmaW5lZCBhIGxhcmdlIG51bWJlciBvZiBj
bG9jayBkZXZpY2VzLsKgCj4gPiBUaGUgY29tbWVudCBvZiB2MyBpcyAiRHJpdmVyIGlzIGFsc28g
d2F5IHRvbyBiaWcgZm9yIHNpbXBsZSBjbG9jayBkcml2ZXIgYW5kIEnCoAo+ID4gYW0gc3VycHJp
c2VkIHRvIHNlZSBzbyBtYW55IHJlZHVuZGFuY2llcy4iLiBUaGVyZWZvcmUsIHdlIG1vZGlmaWVk
IHRoZSBjbG9ja8KgCj4gPiBkcml2ZXIgY29kZSBhbmQgbW92ZWQgdGhlIGRlc2NyaXB0aW9uIG9m
IGNsb2NrIGRldmljZSBmcm9tIHRoZSBkcml2ZXIgdG8gdGhlIERUUy4KPiA+IAo+ID4gQnV0LCB0
aGlzIGNvbW1lbnQgaXMgdGhhdCBkb24ndCBldmVyIGJyaW5nIG5vZGVzIHBlciBjbG9jay4gV2Xi
gJl2ZSBydW4gaW50byBzb21lCj4gCj4gQW5kPyBXaGF0IGlzIHVuY2xlYXIgaW4gdGhhdCBjb21t
ZW50Pwo+IAo+ID4gdHJvdWJsZSBhbmQgYXJlbuKAmXQgc3VyZSB3aGljaCBhcHByb2FjaCBhbGln
bnMgYmV0dGVyIHdpdGggY29tbXVuaXR5IGd1aWRlbGluZXMuwqAKPiA+IENvdWxkIHlvdSBzaGFy
ZSB5b3VyIGFkdmljZSBvciBzdWdnZXN0aW9ucyBvbiB0aGUgYmVzdCB3YXkgZm9yd2FyZD8KPiAK
PiBMb29rIGF0IGFueSBvdGhlciByZWNlbnQgY2xvY2sgZHJpdmVycy4KCkkgZm91bmQgb3V0IHRo
YXQgdGhlIHJlY2VudCBjbG9jayBkcml2ZXJzLCBzdWNoIGFzIHNvcGhnby9jbGstc2cyMDQ0LmPC
oAphbmQgcm9ja2NoaXAvY2xrLXJrMzU2Mi5jLCB0aGUgY2xvY2sgdHJlZSBpbmZvcm1hdGlvbiBv
ZiB0aGVtIHdhcyBwbGFjZWQKaW4gdGhlIEMgY29kZS7CoApTbywgZm9yIEVJQzc3MDAgU29DLCBz
aG91bGQgdGhlIGNsb2NrIHRyZWUgaW5mb3JtYXRpb24gYmUgcGxhY2VkIGluCmNsay1laWM3NzAw
LmMganVzdCBhcyBjbGstc2cyMDQ0LmM/IElzIHRoaXMgdW5kZXJzdGFuZGluZyBjb3JyZWN0PwoK
SSB3b3VsZCBiZSBncmF0ZWZ1bCBmb3IgeW91ciByZXBseS4KClJlZ2FyZHMsClh1eWFuZyBEb25n
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
