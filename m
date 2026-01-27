Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8233D25932
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jan 2026 04:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CeGL86zr9FTaSZxAJwBVfwwvgt9G0C3JGQyaBCbC1Ow=; b=4rn9v9koIi/qHu
	hDLVkYptZeAqvhYH9Gg5pr5uiECwgPTNxgV4etj0kYHr3w2W3yM0UVHCQWcjn6jAj4NGcX+lHSDF1
	4Log74J3vohrwrzqv1tn6Z5P1CHnZL9wO//v/72/Y0EGcjYugWY7x8ApV2e1VWldkO5LuJOL8ph1s
	SURpF2Q9l3w7OQoWYc0jo8e170zNDnrQ4uPWpSAnzVRYMyAoXbk16DuEuUjuGf2NyDWTyQdVjOroK
	dqnBNtyUFU8wSHU69wiTWuNUiqRH1uAIq+HMiNUOE2Z3NaJ1ITb2muqF8RfMzs8f//ZPcpXWBSA9Z
	o5WKbWCe5vi1PMrUyc8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkaqe-0000000DeX2-2thh;
	Tue, 27 Jan 2026 04:38:40 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkaqc-0000000DeWb-0Fze
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jan 2026 04:38:39 +0000
Received: from [10.213.22.4] (unknown [210.73.43.101])
	by APP-03 (Coremail) with SMTP id rQCowAC31dxGQXhpI1vqBg--.61005S2;
	Tue, 27 Jan 2026 12:38:31 +0800 (CST)
Message-ID: <42765b5f-2d94-4fd6-8cd9-977729220696@iscas.ac.cn>
Date: Tue, 27 Jan 2026 12:38:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] net: spacemit: k1-emac: program frame size
 registers for jumbo frames
To: Tomas Hlavacek <tmshlvck@gmail.com>, netdev@vger.kernel.org
Cc: linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Yixun Lan <dlan@kernel.org>
References: <20260126135919.77168-1-tmshlvck@gmail.com>
 <20260126171449.83288-1-tmshlvck@gmail.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20260126171449.83288-1-tmshlvck@gmail.com>
X-CM-TRANSID: rQCowAC31dxGQXhpI1vqBg--.61005S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZw17Jw1xCFW7XF4kuF4UArb_yoW5ArWkpa
	y5XasI9r4jyF1xKa1kAa18X34rJa1IqFyUCFyYvrWrZ3WDJr17WryrKFW3Cr98urWrWw1S
	va4UZw43CF1DZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9ab7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r45MxAIw28IcxkI7VAKI48JMxC20s026x
	CaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_
	JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r
	1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_
	Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8Jr
	UvcSsGvfC2KfnxnUUI43ZEXa7IU5MwZ3UUUUU==
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_203838_469406_38879DD9 
X-CRM114-Status: GOOD (  17.45  )
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

SGkgVG9tYXMsCgpUaGFua3MgZm9yIHRoZSBmaXguIEp1c3QgYSBmZXcgbW9yZSB0aGluZ3MuLi4K
CkZpcnN0bHksIEkgYmVsaWV2ZSBpdCBpcyBwcmVmZXJyZWQgdG8gc2VuZCBhIG5ldyBwYXRjaCB2
ZXJzaW9uIGluIGl0cwpvd24gdGhyZWFkIHdpdGggYSBsaW5rIHRvIHRoZSBwcmV2aW91cyB2ZXJz
aW9uLiBTZWUKRG9jdW1lbnRhdGlvbi9wcm9jZXNzL21haW50YWluZXItbmV0ZGV2LnJzdDoKCiAg
VGhlIG5ldyB2ZXJzaW9uIG9mIHBhdGNoZXMgc2hvdWxkIGJlIHBvc3RlZCBhcyBhIHNlcGFyYXRl
IHRocmVhZCwKICBub3QgYXMgYSByZXBseSB0byB0aGUgcHJldmlvdXMgcG9zdGluZy4gQ2hhbmdl
IGxvZyBzaG91bGQgaW5jbHVkZSBhIGxpbmsKICB0byB0aGUgcHJldmlvdXMgcG9zdGluZyAoc2Vl
IDpyZWY6YENoYW5nZXMgcmVxdWVzdGVkYCkuCgpZb3UgY2FuIGRvIHRoYXQgZm9yIHYzLgoKU2Vj
b25kbHkuLi4KCk9uIDEvMjcvMjYgMDE6MTQsIFRvbWFzIEhsYXZhY2VrIHdyb3RlOgo+IFsuLi5d
Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3BhY2VtaXQvazFfZW1hYy5j
IGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3BhY2VtaXQvazFfZW1hYy5jCj4gaW5kZXggMjIwZWI1
Y2U3NTgzLi4zMWIxYmRiMjgyN2UgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQv
c3BhY2VtaXQvazFfZW1hYy5jCj4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3BhY2VtaXQv
azFfZW1hYy5jCj4gQEAgLTIyOCw2ICsyMjgsMTIgQEAgc3RhdGljIHZvaWQgZW1hY19pbml0X2h3
KHN0cnVjdCBlbWFjX3ByaXYgKnByaXYpCj4gIAkJREVGQVVMVF9UWF9USFJFU0hPTEQpOwo+ICAJ
ZW1hY193cihwcml2LCBNQUNfUkVDRUlWRV9QQUNLRVRfU1RBUlRfVEhSRVNIT0xELCBERUZBVUxU
X1JYX1RIUkVTSE9MRCk7Cj4gIAo+ICsJLyogU2V0IG1heGltdW0gZnJhbWUgc2l6ZSBhbmQgamFi
YmVyIHNpemUgYmFzZWQgb24gY29uZmlndXJlZCBidWZmZXIKPiArCSAqIHNpemUuCj4gKwkgKi8K
PiArCWVtYWNfd3IocHJpdiwgTUFDX01BWElNVU1fRlJBTUVfU0laRSwgcHJpdi0+ZG1hX2J1Zl9z
eik7Cj4gKwllbWFjX3dyKHByaXYsIE1BQ19SRUNFSVZFX0pBQkJFUl9TSVpFLCBwcml2LT5kbWFf
YnVmX3N6KTsKPiArCgpJIHRlc3RlZCB0aGlzIChhbHNvIHNldHRpbmcgTUFDX1RSQU5TTUlUX0pB
QkJFUl9TSVpFLCBhcyBZaXh1bgpkZXNjcmliZWQpwqBhbmQgaXQgYXBwZWFycyB0aGF0IHRoaXMg
aGFzIHN1cmZhY2VkIGEgbGF0ZW50IGJ1ZyBpbiB0aGUgY29kZS4KCkkgZm91bmQgdGhhdCB0aGUg
aGFyZHdhcmUgY2FuJ3QgYWN0dWFsbHkgaGFuZGxlIDQwOTYtYnl0ZSBidWZmZXJzLCBzaW5jZQp0
aGUgc2l6ZSBmaWVsZCBpcyBvbmx5IDEyLWJpdC4gKEl0IHdhcyBteSBmYXVsdCB0byBhc3N1bWUg
dGhhdCBleGlzdGluZwpjb2RlIHdhcyByaWdodCBpbiB0aGlzIHJlZ2FyZC4uLikgU28gTVRVIGxh
cmdlciB0aGFuIH4yMDAwIGJyZWFrcyB0aGUKaGFyZHdhcmUsIGFuZCBhbHNvIHRyaWdnZXJzIHRo
ZSBXQVJOX09OX09OQ0UoKSBpbiBlbWFjX3J4X2ZyYW1lX2dvb2QoKS4KNDA5NSB3b3JrcyBqdXN0
IGZpbmUuCgpDYW4geW91IGluY2x1ZGUgdGhpcyBpbiB2MyBhcyB3ZWxsPyBNYXliZSBhbHNvIHJl
d29yZCB0aGUgY29tbWl0Cm1lc3NhZ2VzIGEgYml0LiBUaGFua3MuCgooSGVyZSdzIGhvcGluZyBU
aHVuZGVyYmlyZCBoYXNuJ3QgZGVzdHJveWVkIHRoZSB3aGl0ZXNwYWNlLi4uKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3NwYWNlbWl0L2sxX2VtYWMuYyBiL2RyaXZlcnMvbmV0
L2V0aGVybmV0L3NwYWNlbWl0L2sxX2VtYWMuYwppbmRleCAzMWIxYmRiMjgyN2UuLjc4MzA2YTA2
YTMyOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3BhY2VtaXQvazFfZW1hYy5j
CisrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3NwYWNlbWl0L2sxX2VtYWMuYwpAQCAtMzgsNyAr
MzgsNyBAQAogCiAjZGVmaW5lIEVNQUNfREVGQVVMVF9CVUZTSVpFCQkxNTM2CiAjZGVmaW5lIEVN
QUNfUlhfQlVGXzJLCQkJMjA0OAotI2RlZmluZSBFTUFDX1JYX0JVRl80SwkJCTQwOTYKKyNkZWZp
bmUgRU1BQ19SWF9CVUZfTUFYCQkJRklFTERfTUFYKFJYX0RFU0NfMV9CVUZGRVJfU0laRV8xX01B
U0spCiAKIC8qIFR1bmluZyBwYXJhbWV0ZXJzIGZyb20gU3BhY2VtaVQgKi8KICNkZWZpbmUgRU1B
Q19UWF9GUkFNRVMJCQk2NApAQCAtOTM3LDcgKzkzNyw3IEBAIHN0YXRpYyBpbnQgZW1hY19jaGFu
Z2VfbXR1KHN0cnVjdCBuZXRfZGV2aWNlICpuZGV2LCBpbnQgbXR1KQogCWVsc2UgaWYgKGZyYW1l
X2xlbiA8PSBFTUFDX1JYX0JVRl8ySykKIAkJcHJpdi0+ZG1hX2J1Zl9zeiA9IEVNQUNfUlhfQlVG
XzJLOwogCWVsc2UKLQkJcHJpdi0+ZG1hX2J1Zl9zeiA9IEVNQUNfUlhfQlVGXzRLOworCQlwcml2
LT5kbWFfYnVmX3N6ID0gRU1BQ19SWF9CVUZfTUFYOwogCiAJbmRldi0+bXR1ID0gbXR1OwogCkBA
IC0yMDExLDcgKzIwMTEsNyBAQCBzdGF0aWMgaW50IGVtYWNfcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKIAluZGV2LT5od19mZWF0dXJlcyA9IE5FVElGX0ZfU0c7CiAJbmRldi0+
ZmVhdHVyZXMgfD0gbmRldi0+aHdfZmVhdHVyZXM7CiAKLQluZGV2LT5tYXhfbXR1ID0gRU1BQ19S
WF9CVUZfNEsgLSAoRVRIX0hMRU4gKyBFVEhfRkNTX0xFTik7CisJbmRldi0+bWF4X210dSA9IEVN
QUNfUlhfQlVGX01BWCAtIChFVEhfSExFTiArIEVUSF9GQ1NfTEVOKTsKIAluZGV2LT5wY3B1X3N0
YXRfdHlwZSA9IE5FVERFVl9QQ1BVX1NUQVRfRFNUQVRTOwogCiAJcHJpdiA9IG5ldGRldl9wcml2
KG5kZXYpOwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
