Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825B6CE7B05
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Sep 2023 08:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=89uPJlh8Q6ULrzEYiI/Op3q6VEUdlsfiNcRvb5xXtRM=; b=PUbtF3LTXVL7nJ
	jdvDeRB/BvzxmWqQS9KQDDt1q6tpjHNkxe4R9XRfKj0INZh0ykdWpz3noLq+pYwk43HVap/TFz2ka
	s/TP/lkbKaAGtqMIc+/TrBn5XFwDeqdepLHqgvC2chhGt86Vk/+YMsupBIlOyJlO6AC59qFmdwFJu
	3K+CmoQuK6Sl2PR/+inUGD+6r++TxgC3IJE5rOBkT6jGjs/bDT7AbAS5Eavt0WmavVMg2ejFoswd3
	g05dMZ1h94YCxFz/9yWXyEapoQ1wEzGEaNbVM4n447wQ51xUpux9apq9t/0AuLPhizcHTmD8Gsidb
	ZFha8hMhl6ygWTgGuTPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlmC2-002biF-2j;
	Thu, 28 Sep 2023 08:16:18 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlmBt-002bVR-2J
	for linux-riscv@lists.infradead.org;
	Thu, 28 Sep 2023 08:16:17 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B68FBC0007;
	Thu, 28 Sep 2023 08:15:56 +0000 (UTC)
Message-ID: <f74665d1-4d28-01a2-5694-b06fde202d39@ghiti.fr>
Date: Thu, 28 Sep 2023 10:15:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] riscv: fix out of bounds in walk_stackframe
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
To: Edward AD <twuufnxlz@gmail.com>, conor@kernel.org
Cc: syzbot+8d2757d62d403b2d9275@syzkaller.appspotmail.com,
 gregkh@linuxfoundation.org, jirislaby@kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, guoren@kernel.org,
 alexghiti@rivosinc.com, liushixin2@huawei.com,
 linux-riscv@lists.infradead.org
References: <0000000000000170df0605ccf91a@google.com>
 <20230926114343.1061739-2-twuufnxlz@gmail.com>
 <d0f12692-f0df-9535-922a-f0578c713547@ghiti.fr>
In-Reply-To: <d0f12692-f0df-9535-922a-f0578c713547@ghiti.fr>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_011609_977334_6AFF9CA0 
X-CRM114-Status: GOOD (  19.17  )
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

T2ggYW5kIEJUVywgYW55IGlkZWEgd2h5IGxpbnV4LXJpc2N2IHdhcyBub3QgaW4gQ0MgZm9yIHRo
ZSBpbml0aWFsIHJlcG9ydD8KCk9uIDI4LzA5LzIwMjMgMTA6MDIsIEFsZXhhbmRyZSBHaGl0aSB3
cm90ZToKPiBIaSBFZHdhcmQsCj4KPiBPbiAyNi8wOS8yMDIzIDEzOjQzLCBFZHdhcmQgQUQgd3Jv
dGU6Cj4+IEluY3JlYXNlIHRoZSBjaGVjayBvbiB0aGUgZnJhbWUgYWZ0ZXIgYXNzaWduaW5nIGl0
cyB2YWx1ZS4gVGhpcyBpcyB0byAKPj4gcHJldmVudAo+PiBmcmFtZSBhY2Nlc3MgZnJvbSBjcm9z
c2luZyBib3VuZGFyaWVzLgo+Pgo+PiBDbG9zZXM6IAo+PiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9hbGwvMjAyMzA5MjYxMDU5NDkuMTAyNTk5NS0yLXR3dXVmbnhsekBnbWFpbC5jb20vCj4+IEZp
eGVzOiA1ZDg1NDRlMmQwMDcgKCJSSVNDLVY6IEdlbmVyaWMgbGlicmFyeSByb3V0aW5lcyBhbmQg
YXNzZW1ibHkiKQo+PiBSZXBvcnRlZC1hbmQtdGVzdGVkLWJ5OiAKPj4gc3l6Ym90KzhkMjc1N2Q2
MmQ0MDNiMmQ5Mjc1QHN5emthbGxlci5hcHBzcG90bWFpbC5jb20KPj4gTGluazogCj4+IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2FsbC8wMDAwMDAwMDAwMDAwMTcwZGYwNjA1Y2NmOTFhQGdvb2ds
ZS5jb20vVC8KPj4gU2lnbmVkLW9mZi1ieTogRWR3YXJkIEFEIDx0d3V1Zm54bHpAZ21haWwuY29t
Pgo+PiAtLS0KPj4gwqAgYXJjaC9yaXNjdi9rZXJuZWwvc3RhY2t0cmFjZS5jIHwgMiArKwo+PiDC
oCAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2tlcm5lbC9zdGFja3RyYWNlLmMgCj4+IGIvYXJjaC9yaXNjdi9rZXJuZWwvc3RhY2t0
cmFjZS5jCj4+IGluZGV4IDY0YTljMDkzYWVmOS4uNTNiZDE4NjcyMzI5IDEwMDY0NAo+PiAtLS0g
YS9hcmNoL3Jpc2N2L2tlcm5lbC9zdGFja3RyYWNlLmMKPj4gKysrIGIvYXJjaC9yaXNjdi9rZXJu
ZWwvc3RhY2t0cmFjZS5jCj4+IEBAIC01NCw2ICs1NCw4IEBAIHZvaWQgbm90cmFjZSB3YWxrX3N0
YWNrZnJhbWUoc3RydWN0IHRhc2tfc3RydWN0IAo+PiAqdGFzaywgc3RydWN0IHB0X3JlZ3MgKnJl
Z3MsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+PiDCoMKgwqDCoMKgwqDC
oMKgwqAgLyogVW53aW5kIHN0YWNrIGZyYW1lICovCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBmcmFt
ZSA9IChzdHJ1Y3Qgc3RhY2tmcmFtZSAqKWZwIC0gMTsKPj4gK8KgwqDCoMKgwqDCoMKgIGlmICgh
dmlydF9hZGRyX3ZhbGlkKGZyYW1lKSkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBzcCA9IGZwOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYg
KHJlZ3MgJiYgKHJlZ3MtPmVwYyA9PSBwYykgJiYgKGZyYW1lLT5mcCAmIDB4NykpIHsKPj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZnAgPSBmcmFtZS0+cmE7Cj4KPgo+IHZpcnRfYWRkcl92
YWxpZCgpIHdvcmtzIG9uIGtlcm5lbCBsaW5lYXIgYWRkcmVzc2VzLCBub3Qgb24gdm1hbGxvYyAK
PiBhZGRyZXNzZXMsIHdoaWNoIGlzIHRoZSBjYXNlIGhlcmXCoCAoMHhmZjIwMDAwMDA2ZDM3YzM4
IGJlbG9uZ3MgdG8gdGhlIAo+IHZtYWxsb2MgcmVnaW9uOiBzZWUgCj4gaHR0cHM6Ly9lbGl4aXIu
Ym9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9Eb2N1bWVudGF0aW9uL3Jpc2N2L3ZtLWxh
eW91dC5yc3QjTDEyNSkuIAo+IFNvIHRoaXMgZml4IGNhbid0IHdvcmsuCj4KPiBJJ20gYSBiaXQg
c3VycHJpc2VkIHRob3VnaCBvZiB0aGlzIG91dC1vZi1ib3VuZHMgYWNjZXNzIHNpbmNlIAo+IENP
TkZJR19GUkFNRV9QT0lOVEVSIGlzIGVuYWJsZWQsIHNvIHRoZXJlIG1heSBiZSBhIHJlYWwgaXNz
dWUgaGVyZSAKPiAodGhlIGNvbnNvbGUgb3V0cHV0IGlzIGhvcnJpYmxlLCBsb3RzIG9mIGJhY2t0
cmFjZXMsIHdoaWNoIGlzIHdlaXJkKSwgCj4gc28gaXQgbWF5IGJlIHdvcnRoIGRpZ2dpbmcgaW50
byB0aGF0Lgo+Cj4gVGhhbmtzLAo+Cj4gQWxleAo+Cj4KPgo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4g
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
