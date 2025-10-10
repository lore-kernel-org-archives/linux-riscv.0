Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2997CCA476
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 06:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UO1oTRewG6hUyOLP+ZP+6GXwa9RewAzerM/iY8KKzc0=; b=V0UCZ0I7DPRuG5
	Y7jbjQLhdqI+o0krwoiZQNcTH36vsTrUHP0d4hOZelPYxeE6sNdkKIqnBkJ6AoPwo07Tghf4DGSB+
	JVlbVHFVaO0m27tjWX8KM1354cpnxRkf5ZTVqZTsoDzlGEyt1c45KZfMUaz9HwqCZUHyyRw2kejnQ
	y7OV0UHTEHQa4QJXnZz0JANBsCK58cKrtd0Vd3R072b3GneDeEdSNIJ+ht8tXCzWex1afYXAi/Frh
	DqsemYIPq5FjLZj6aMuEk/k1Flf+1OQ5xpYuO7ea5hTOSlnvEV4ND4g2gYc7p6umOddWhJx1va9zt
	L8XE1WPeDWknlHFQoXWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v76Ux-00000007lA5-2IFW;
	Fri, 10 Oct 2025 06:21:03 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v76Us-00000007l9Z-0awO
	for linux-riscv@lists.infradead.org;
	Fri, 10 Oct 2025 06:21:02 +0000
Received: from [192.168.0.104] (unknown [114.241.81.247])
	by APP-05 (Coremail) with SMTP id zQCowAAHqhPCpehoLwxkDQ--.18166S2;
	Fri, 10 Oct 2025 14:20:51 +0800 (CST)
Message-ID: <f968ca77-6fc0-4485-a13a-2ed83a7e6617@iscas.ac.cn>
Date: Fri, 10 Oct 2025 14:20:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] riscv: dts: spacemit: add Ethernet support for
 MusePi Pro
From: Vivian Wang <wangruikang@iscas.ac.cn>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yangyu Chen <cyy@cyyself.name>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20251010-k1-musepi-pro-dts-v2-0-6e1b491f6f3e@linux.spacemit.com>
 <20251010-k1-musepi-pro-dts-v2-5-6e1b491f6f3e@linux.spacemit.com>
 <a02aec9a-976a-4b63-86cb-126b8ae71185@iscas.ac.cn>
Content-Language: en-US
In-Reply-To: <a02aec9a-976a-4b63-86cb-126b8ae71185@iscas.ac.cn>
X-CM-TRANSID: zQCowAAHqhPCpehoLwxkDQ--.18166S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WF45WryxXr4UJr4kAFy3XFb_yoW8ZFy8pF
	Z7uFZ3Gwn7Kr4SkrsIv3WDuF1rJa95Xa1YgasFkrn8JrsxXry5Cr93t3ZxKF1UZryrG340
	vry8WayfuFs0vrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7IU5IAp7UUUUU==
X-Originating-IP: [114.241.81.247]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_232058_933908_FB03A96B 
X-CRM114-Status: GOOD (  17.42  )
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

Ck9uIDEwLzEwLzI1IDE0OjEzLCBWaXZpYW4gV2FuZyB3cm90ZToKPiBPbiAxMC8xMC8yNSAwOTo1
NiwgVHJveSBNaXRjaGVsbCB3cm90ZToKPj4gTXVzZVBpIFBybyBmZWF0dXJlcyBhIHNpbmdsZSBS
R01JSSBFdGhlcm5ldCBwb3J0IHdpdGgKPj4gUEhZIHJlc2V0IGNvbnRyb2xsZWQgYnkgR1BJTy4K
Pj4KPj4gU2lnbmVkLW9mZi1ieTogVHJveSBNaXRjaGVsbCA8dHJveS5taXRjaGVsbEBsaW51eC5z
cGFjZW1pdC5jb20+Cj4+IC0tLQo+PiAgYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1t
dXNlcGktcHJvLmR0cyB8IDIzICsrKysrKysrKysrKysrKysrKysrKysrCj4+ICAxIGZpbGUgY2hh
bmdlZCwgMjMgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290
L2R0cy9zcGFjZW1pdC9rMS1tdXNlcGktcHJvLmR0cyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3Bh
Y2VtaXQvazEtbXVzZXBpLXByby5kdHMKPj4gaW5kZXggODlhMzU5MTQ3MTBiZmQxNWM2YWQyN2Nk
OGQwZGU3Y2NmNjJlMjMwOS4uZTlhNTNkYzdhNDE3MTE3YzgyZjNlNDY3Njc3MjkwYmRhZWZmYzg0
NSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1tdXNlcGkt
cHJvLmR0cwo+PiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLW11c2VwaS1w
cm8uZHRzCj4+IEBAIC00Nyw2ICs0NywyOSBAQCAmcGRtYSB7Cj4+ICAJc3RhdHVzID0gIm9rYXki
Owo+PiAgfTsKPj4gIAo+PiArJmV0aDAgewo+IEZvciBub2RlIG9yZGVycyBpbiBib2FyZCBEVFMg
Zm9yIFNwYWNlbWlUIGRldmljZXMsIHVzdWFsbHkgd2UgZm9sbG93Cj4gbm9kZSBuYW1lIG9yZGVy
IGJlY2F1c2UgdGhlcmUncyBubyB1bml0IGFkZHJlc3MgdG8gZ28gb2ZmIG9mIGhlcmUsIHNvCj4g
Zm9yIHdoYXQgd2UgaGF2ZSBoZXJlIGl0IHNob3VsZCBiZSBlbW1jLCBldGgwLCBwZG1hLCB1YXJ0
Lgo+Cj4gU2VlIGUuZy4gYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1iYW5hbmFwaS1m
My5kdHMgYW5kIHByZXZpb3VzCj4gZGlzY3Vzc2lvbiBbMV0uCj4KPiBBbHNvLCBwZXJzb25hbGx5
IEkgdGhpbmsgaXQgd291bGQgYmUgZmluZSB0byBqdXN0IGFkZCB0aGUgd2hvbGUKPiBrMS1tdXNl
cGktcHJvLmR0cyBpbiB0aGUgc2FtZSBwYXRjaCBpbnN0ZWFkIG9mIHNwbGl0dGluZyBpdCB1cCBs
aWtlCj4gdGhpcy4gSSBmZWVsIGl0IHdvdWxkIGJlIGVhc2llciB0byBtYW5hZ2UgdGhpcyB3YXku
IEZvciBwcmV2aW91cyBkZXZpY2VzCj4gdGhlc2Ugbm9kZXMgaGF2ZSBiZWVuIGFkZGVkIHBpZWNl
bWVhbCBtb3N0bHkgYmVjYXVzZSB0aGUgZHJpdmVycyB3ZXJlCj4gYmVpbmcgZGV2ZWxvcGVkIGlu
IHBhcmFsbGVsLCBidXQgaWYgeW91J3JlIGdvaW5nIHRvIGJhc2UgdGhpcyBvbgo+IHY2LjE4LXJj
MSB0aGVyZSBzaG91bGRuJ3QgYmUgZGVwZW5kZW5jeSBwcm9ibGVtcy4KLi4uIGFuZCBhbHNvIGFs
bW9zdCBtaXNzZWQ6IHRoaXMgc2hvdWxkIGhhdmUgYW4gZXRoZXJuZXQwIGFsaWFzLiBJbiB0aGUK
bW9zdCBjb21tb24gYm9vdCBmbG93IGl0J3MgcmVhZCBieSBVLUJvb3QgdG8gc2V0IG1hYy1hZGRy
ZXNzIHNvIHRoYXQKYm90aCBVLUJvb3QgYW5kIExpbnV4IHVzZSB0aGUgc2FtZSBNQUMgYWRkcmVz
cy4gVGhpcyBhbGxvd3MgVS1Cb290IHRvIGEKcGVyc2lzdGVudCBNQUMgYWRkcmVzcyByYXRoZXIg
dGhhbiBoYXZpbmcgdG8gdXNlIGEgcmFuZG9tIG9uZS7CoMKgCj4gTWF5YmUgWWl4dW4gY2FuIGNo
aW1lIGluIGFib3V0IHRoaXMgYXMgd2VsbC4KPgo+IFRoYW5rcywKPiBWaXZpYW4gImRyYW1mb3Jl
dmVyIiBXYW5nCj4KPiBbMV06IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2L0NB
SDFQQ01hMzVuNGRuSjk0LUVIR3JKeVUza3p0UVlPOF92MkNrRD1yaWQ0NjZ6djMrQUBtYWlsLmdt
YWlsLmNvbQo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
