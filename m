Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F337CD37AC
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 10:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A8RNAQc//sQ3Ao+a4D7pDBbcGZUuKG7m4N4BgIRldj8=; b=hxuo4N3V2gLTW8
	l9ogh9e43M/PPSxYSdaH9JqWnMU/sHwGR9iroC+pQWK6IBMDuYtf28wP77CoDX7alMBXpfaYjY41y
	Qbn8yGeNjnuK4E11aER2789XD7o9a0S4ryj/XlMHEbKD2fdVaHIg0Kzqcjfy6Jxlv5S8vIhEDCREu
	7VjxtzxhazQLdFNaDFQLw79cTX+MOG5qBre/27cltgI67Rhf9NRYFpQLTeyhAv6eGcm4aAoyqNFZj
	rzNzfH+vqc3B29lQTRUiBEQaFKdaj7rHmq+sDsJjaJrCYAoguGanip9RbpYaCKeLIybrPWeOwpHbm
	MneEv0uTAyi+aL7V2vKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNR2-0000000D2TQ-3HT2;
	Mon, 11 May 2026 10:00:24 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNR0-0000000D2SS-1Asx
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 10:00:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=pXp0B+DtFOhFG5oHIfyHHz0VpIQInvWd4
	5+4nuEQISQ=; b=JyBmQRNUIT+K1L054Eo3UZdxiRCKj/KBl1ECoFwe1r/SAcQkv
	YA8o5O7hP0E4IjLCtrnv8C/CCMIw7LJ+vi+xOrxyjB0BLKuNBMhFYqpx3nW5lcsO
	PrVVsBv+h6U+XQh1A1im7lwVXbTrcbrw36calT93QWeti01RuohMxAKYzg=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnYUJ3pgFqlwMEAA--.3534S2;
	Mon, 11 May 2026 17:50:48 +0800 (CST)
MIME-Version: 1.0
Subject: Re: [PATCH v7 4/4] serial: 8250_dw: Use a fixed CPR value for
 UltraRISC DP1000 UART
From: Jia Wang <wangjia@ultrarisc.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jia Wang <wangjia@ultrarisc.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
 linux-serial <linux-serial@vger.kernel.org>, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <66f322a7-70c5-13f9-3e97-6d0b18193f91@linux.intel.com>
References: <20260429-ultrarisc-serial-v7-0-e475cce9e274@ultrarisc.com>
 <20260429-ultrarisc-serial-v7-4-e475cce9e274@ultrarisc.com>
 <66f322a7-70c5-13f9-3e97-6d0b18193f91@linux.intel.com>
Date: Mon, 11 May 2026 17:50:05 +0800
Message-Id: <177849300569.62727.6686772792675107792.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778493005; l=2656;
 i=wangjia@ultrarisc.com; s=20260309; h=from:subject:message-id;
 bh=Z4f8Be3tvf+DeFSTMlalpRJHUnyRF5MgEUMBJBp4awk=;
 b=vfCokh6bFqZ+ax0cWnwoM+VdZGWYQ0/P0aQZlubUa1RX5FmYEMav3Og4jjfuFYnCCnyAf769m
 Xb64k1dcNjGCFNK6uczeyPiIjCLdoUqrvCldL/z2Ql8ovPdrWD0Lhef
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=XvYkrelqJIIzobY7j+nIg8rsfv5kzaOzuc1UPhd087U=
X-CM-TRANSID: AQAAfwAnYUJ3pgFqlwMEAA--.3534S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJF4fJrWDtF1Uur43urW3Jrb_yoW5GrWfpF
	4UGFWYyF9agF13u3Z2v3WvyFZaqa129342kwsrK347tFn0kryDJFnakrWfC3Zruryjgw1a
	yF1j93y7Ca1UuFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9l14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
	4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUonmRUUUUU
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAEEWoBUkIAAwAEso
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_030022_916361_19153B0E 
X-CRM114-Status: GOOD (  22.64  )
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

T24gMjAyNi0wNC0yOSAxMzo1NSArMDMwMCwgSWxwbyBKw6RydmluZW4gd3JvdGU6Cj4gT24gV2Vk
LCAyOSBBcHIgMjAyNiwgSmlhIFdhbmcgd3JvdGU6Cj4gCj4gPiBUaGUgVWx0cmFSSVNDIERQMTAw
MCBVQVJUIGRvZXMgbm90IHByb3ZpZGUgdGhlIHN0YW5kYXJkIENQUiByZWdpc3RlciB1c2VkCj4g
PiBieSA4MjUwX2R3IHRvIGRpc2NvdmVyIHBvcnQgY2FwYWJpbGl0aWVzLgo+ID4gCj4gPiBQcm92
aWRlIGEgZml4ZWQgQ1BSIHZhbHVlIGZvciB0aGUgRFAxMDAwLXNwZWNpZmljIGNvbXBhdGlibGUg
c28gdGhlCj4gPiBkcml2ZXIgY2FuIGNvbmZpZ3VyZSB0aGUgcG9ydCBjb3JyZWN0bHkuCj4gPiAK
PiA+IFNpZ25lZC1vZmYtYnk6IEppYSBXYW5nIDx3YW5namlhQHVsdHJhcmlzYy5jb20+Cj4gPiBS
ZXZpZXdlZC1ieTogQW5keSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRl
bC5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL3R0eS9zZXJpYWwvODI1MC84MjUwX2R3LmMgfCAx
MCArKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKPiA+IAo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdHR5L3NlcmlhbC84MjUwLzgyNTBfZHcuYyBiL2RyaXZl
cnMvdHR5L3NlcmlhbC84MjUwLzgyNTBfZHcuYwo+ID4gaW5kZXggNDgwZjgyZDg5ODU2Li41NWU0
MGMxMGY0NmEgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3R0eS9zZXJpYWwvODI1MC84MjUwX2R3
LmMKPiA+ICsrKyBiL2RyaXZlcnMvdHR5L3NlcmlhbC84MjUwLzgyNTBfZHcuYwo+ID4gQEAgLTk1
OSw2ICs5NTksMTUgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkdzgyNTBfcGxhdGZvcm1fZGF0YSBk
dzgyNTBfaW50YzEwZWUgPSB7Cj4gPiAgCS5xdWlya3MgPSBEV19VQVJUX1FVSVJLX0lFUl9LSUNL
LAo+ID4gIH07Cj4gPiAgCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBkdzgyNTBfcGxhdGZvcm1f
ZGF0YSBkdzgyNTBfdWx0cmFyaXNjX2RwMTAwMF9kYXRhID0gewo+ID4gKwkudXNyX3JlZyA9IERX
X1VBUlRfVVNSLAo+ID4gKwkuY3ByX3ZhbHVlID0gRklFTERfUFJFUF9DT05TVChEV19VQVJUX0NQ
Ul9BQlBfREFUQV9XSURUSCwgMikgfAo+ID4gKwkJICAgICBEV19VQVJUX0NQUl9USFJFX01PREUg
fAo+ID4gKwkJICAgICBEV19VQVJUX0NQUl9ETUFfRVhUUkEgfAo+ID4gKwkJICAgICBEV19VQVJU
X0NQUl9GSUZPX01PREVfRlJPTV9TSVpFKDMyKSwKPiA+ICsJLnF1aXJrcyA9IERXX1VBUlRfUVVJ
UktfQ1BSX1ZBTFVFLAo+IAo+IFRoYW5rcyBmb3IgYWxsIHRoZSBlZmZvcnQgeW91IHB1dCB0byB0
aGlzIHNlcmllcywKPiAKPiBSZXZpZXdlZC1ieTogSWxwbyBKw6RydmluZW4gPGlscG8uamFydmlu
ZW5AbGludXguaW50ZWwuY29tPgo+IAo+IFVucmVsYXRlZCB0byB0aGlzIHBhdGNoLCBJIHN1cHBv
c2Ugd2Ugd291bGRuJ3Qgc3RyaWN0bHkgbmVlZCB0byBoYXZlIAo+IERXX1VBUlRfUVVJUktfQ1BS
X1ZBTFVFIGluIHRoaXMgZHJpdmVyIGFzIG5vbi16ZXJvIC5jcHJfdmFsdWUgc2hvdWxkIGJlIAo+
IGVub3VnaCB0byBkZWNpZGUgaWYgdGhlIENQUiBxdWlyayBzaG91bGQgYmUgdXNlZCBvciBub3Qg
KGlmIHRoZSBjb2RlIGlzIAo+IGFkYXB0ZWQsIG9idmlvdXNseSkuCj4gCgpUaGFua3MgZm9yIHRo
ZSByZXZpZXcgYW5kIHRoZSB0YWcsIElscG8uCgpUaGUgaWRlYSBvZiBkcm9wcGluZyB0aGUgcXVp
cmsgZmxhZyBzb3VuZHMgcmVhc29uYWJsZSB0byBtZS4gSSdsbCBrZWVwCml0IGluIG1pbmQgZm9y
IGEgZnV0dXJlIGNsZWFudXAgcGF0Y2ggb25jZSB0aGlzIHNlcmllcyBpcyBtZXJnZWQuCgo+ID4g
K307Cj4gPiArCj4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgZHc4MjUwX29m
X21hdGNoW10gPSB7Cj4gPiAgCXsgLmNvbXBhdGlibGUgPSAic25wcyxkdy1hcGItdWFydCIsIC5k
YXRhID0gJmR3ODI1MF9kd19hcGIgfSwKPiA+ICAJeyAuY29tcGF0aWJsZSA9ICJjYXZpdW0sb2N0
ZW9uLTM4NjAtdWFydCIsIC5kYXRhID0gJmR3ODI1MF9vY3Rlb25fMzg2MF9kYXRhIH0sCj4gPiBA
QCAtOTY2LDYgKzk3NSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGR3ODI1
MF9vZl9tYXRjaFtdID0gewo+ID4gIAl7IC5jb21wYXRpYmxlID0gInJlbmVzYXMscnpuMS11YXJ0
IiwgLmRhdGEgPSAmZHc4MjUwX3JlbmVzYXNfcnpuMV9kYXRhIH0sCj4gPiAgCXsgLmNvbXBhdGli
bGUgPSAic29waGdvLHNnMjA0NC11YXJ0IiwgLmRhdGEgPSAmZHc4MjUwX3NraXBfc2V0X3JhdGVf
ZGF0YSB9LAo+ID4gIAl7IC5jb21wYXRpYmxlID0gInN0YXJmaXZlLGpoNzEwMC11YXJ0IiwgLmRh
dGEgPSAmZHc4MjUwX3NraXBfc2V0X3JhdGVfZGF0YSB9LAo+ID4gKwl7IC5jb21wYXRpYmxlID0g
InVsdHJhcmlzYyxkcDEwMDAtdWFydCIsIC5kYXRhID0gJmR3ODI1MF91bHRyYXJpc2NfZHAxMDAw
X2RhdGEgfSwKPiA+ICAJeyAvKiBTZW50aW5lbCAqLyB9Cj4gPiAgfTsKPiA+ICBNT0RVTEVfREVW
SUNFX1RBQkxFKG9mLCBkdzgyNTBfb2ZfbWF0Y2gpOwo+ID4gCj4gPiAKPiAKPiAtLSAKPiAgaS4K
CkJlc3QgUmVnYXJkcywKSmlhIFdhbmcKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
