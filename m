Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F01A3C54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 20:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ujR3/yeEqv7qZHTsy7MigjhptUiUfeWoRtG6KqzD0zM=; b=Vrw+lDQdHcIaF/
	BXyKZL65gLqZGF+QVAwQPaPXWM6g3P2JgGKbm4nY74Jat/Ag69tLGnAnC88jXuCZ0E/cwoadtGrwI
	2/3EgOBkgq5sfJe4ZtHJ7mACNMajAqXkO3wh1xxH09gpyeIObPXoi8OkleMMLzufx1IOoDDyMYodX
	pDvFY1V/3CB9jo6kDO9LJoA3AqXJJnljZ0RW6mncJlHpCq+Gf5IqhOKzt+4d8BWlE3B+VRWVI9dwW
	0Xfdc7Q9BAIpQCWGvW4JzbWL5Jalk5cNFIRwoT5Urx/6bHjJLgqhB6Fj+XSB+oiyZHaj+JFGLBqfA
	ALFsvjVBb4OkrzY4uX8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rorCt-00000001sCS-3ryi;
	Mon, 25 Mar 2024 20:46:12 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rorCo-00000001sAC-2uPb
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 20:46:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 612F2E0004;
	Mon, 25 Mar 2024 20:45:59 +0000 (UTC)
Message-ID: <0eeb142e-1c74-44f8-9f58-365bee3a670f@ghiti.fr>
Date: Mon, 25 Mar 2024 21:45:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip/sifive-plic: Fix error handling of
 of_property_read_u32
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
To: Qingfang Deng <dqfext@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Christoph Hellwig <hch@lst.de>,
 Qingfang Deng <qingfang.deng@siflower.com.cn>
References: <20240322090002.311645-1-dqfext@gmail.com>
 <0a1e9afc-e999-451f-8d4f-670f7c15e609@ghiti.fr>
In-Reply-To: <0a1e9afc-e999-451f-8d4f-670f7c15e609@ghiti.fr>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_134606_935919_0C2126BD 
X-CRM114-Status: GOOD (  17.06  )
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

SGkgUWluZ2ZhbmcsCgpPbiAyMi8wMy8yMDI0IDE4OjA4LCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6
Cj4gSGkgUWluZ2ZhbmcsCj4KPiBPbiAyMi8wMy8yMDI0IDEwOjAwLCBRaW5nZmFuZyBEZW5nIHdy
b3RlOgo+PiBGcm9tOiBRaW5nZmFuZyBEZW5nIDxxaW5nZmFuZy5kZW5nQHNpZmxvd2VyLmNvbS5j
bj4KPj4KPj4gbnJfaXJxcyB3aWxsIG5vdCBiZSBpbml0aWFsaXplZCBpZiBvZl9wcm9wZXJ0eV9y
ZWFkX3UzMiByZXR1cm5zIGFuCj4+IGVycm9yLiBDaGVjayB0aGUgZXJyb3IgZmlyc3QuCj4+Cj4+
IEZpeGVzOiA4MjM3ZjhiYzRmNmUgKCJpcnFjaGlwOiBhZGQgYSBTaUZpdmUgUExJQyBkcml2ZXIi
KQo+PiBTaWduZWQtb2ZmLWJ5OiBRaW5nZmFuZyBEZW5nIDxxaW5nZmFuZy5kZW5nQHNpZmxvd2Vy
LmNvbS5jbj4KPj4gLS0tCj4+IMKgIGRyaXZlcnMvaXJxY2hpcC9pcnEtc2lmaXZlLXBsaWMuYyB8
IDUgKysrKy0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlwL2lycS1zaWZpdmUtcGxpYy5j
IAo+PiBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtc2lmaXZlLXBsaWMuYwo+PiBpbmRleCA1YjdiYzRm
ZDk1MTcuLmY0MzZiNjFkNzRiMCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9pcnFjaGlwL2lycS1z
aWZpdmUtcGxpYy5jCj4+ICsrKyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtc2lmaXZlLXBsaWMuYwo+
PiBAQCAtNDI4LDggKzQyOCwxMSBAQCBzdGF0aWMgaW50IF9faW5pdCBfX3BsaWNfaW5pdChzdHJ1
Y3QgZGV2aWNlX25vZGUgCj4+ICpub2RlLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBvdXRf
ZnJlZV9wcml2Owo+PiDCoMKgwqDCoMKgIH0KPj4gwqAgK8KgwqDCoCBlcnJvciA9IG9mX3Byb3Bl
cnR5X3JlYWRfdTMyKG5vZGUsICJyaXNjdixuZGV2IiwgJm5yX2lycXMpOwo+PiArwqDCoMKgIGlm
IChlcnJvcikKPj4gK8KgwqDCoMKgwqDCoMKgIGdvdG8gb3V0X2lvdW5tYXA7Cj4+ICsKPj4gwqDC
oMKgwqDCoCBlcnJvciA9IC1FSU5WQUw7Cj4+IC3CoMKgwqAgb2ZfcHJvcGVydHlfcmVhZF91MzIo
bm9kZSwgInJpc2N2LG5kZXYiLCAmbnJfaXJxcyk7Cj4+IMKgwqDCoMKgwqAgaWYgKFdBUk5fT04o
IW5yX2lycXMpKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBvdXRfaW91bm1hcDsKPgoKU28g
dGhpcyBpcyBhY3R1YWxseSBhbHJlYWR5IGZpeGVkIGluIDYuOS1yYzEgYnkgdGhpcyBjb21taXQ6
IAo5NTY1MjEwNjQ3ODAgKCJpcnFjaGlwL3NpZml2ZS1wbGljOiBQYXJzZSBudW1iZXIgb2YgaW50
ZXJydXB0cyBhbmQgCmNvbnRleHRzIGVhcmx5IGluIHBsaWNfcHJvYmUoKSIpLgoKVGhhbmtzLAoK
QWxleAoKCj4KPiBZb3UgY2FuIGFkZDoKPgo+IFJldmlld2VkLWJ5OiBBbGV4YW5kcmUgR2hpdGkg
PGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4KPiBUaGFua3MsCj4KPiBBbGV4Cj4KPgo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
