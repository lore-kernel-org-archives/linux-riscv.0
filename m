Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93AC2E63C8E
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jan 2026 13:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TuI4SB/A/b6DE/0n4fAN/IEZGyRRh0h0y2LlTQ1dyvU=; b=Y/PKjSwP9S6sZn
	pePcjauCZ7W+RiRPj3iaTmA0NXVKsDnWFJeP9AqD4I2TT2CFha3JicyNtWYVf4sChM1UJ1UQO4v4K
	11D6PeHTFDYhDQahf/TFDSrK43NSQxGgpdv97HzF1bKsfYbtN7OFx1FzyGR7pHY/rdFOK+CkA3PWz
	ZD7l8FtmjUsbAhoCBgSddureRbqGisSPVdp7JJdKXXChe9/CLfD5cNJQGzLeuZXOUYu7VmeOEfhlA
	02oPX+tvfN6poPLKJ7UoG5X9NVs0bSElSNlTpwnlthjZZmF3Zx7L3h7WrbCgRxitjeWlYsZhQTswG
	iEM1/L2jRzP4KLSpoo4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjzle-0000000BBA9-2Fag;
	Sun, 25 Jan 2026 13:03:02 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjzla-0000000BB9K-2Isy
	for linux-riscv@lists.infradead.org;
	Sun, 25 Jan 2026 13:03:00 +0000
Received: from [192.168.0.107] (unknown [123.118.222.47])
	by APP-01 (Coremail) with SMTP id qwCowACH825yFHZpgUgsBg--.19908S2;
	Sun, 25 Jan 2026 21:02:43 +0800 (CST)
Message-ID: <b705ceed-3ee1-49ec-8f8e-e885e87f871e@iscas.ac.cn>
Date: Sun, 25 Jan 2026 21:02:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] regulator: spacemit-p1: Fix voltage ranges and
 support board power tree
To: Yixun Lan <dlan@gentoo.org>, Guodong Xu <guodong@riscstar.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Alex Elder <elder@riscstar.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, devicetree@vger.kernel.org
References: <20260124-spacemit-p1-v2-0-2c86b06694ba@riscstar.com>
 <76bd53dd-0ca9-4358-a0b6-a49283e43c5f@iscas.ac.cn>
 <CAH1PCMZq++FYr_2WB=HvouXvnxcYGFk6tngqNUk3zTOM6xXLZQ@mail.gmail.com>
 <CAH1PCMbEcVa6mAvw9UAG2T2Jy0W-+nEcw79nTHDJr9xgEdm0VA@mail.gmail.com>
 <20260125110333-GYD71302@gentoo.org>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20260125110333-GYD71302@gentoo.org>
X-CM-TRANSID: qwCowACH825yFHZpgUgsBg--.19908S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCw1kGrWxArWfJrWrKF4DArb_yoW5Gr18pa
	9Ika9rKFWkKr4fZwnFkw1IyayFy397Jw45W345Kw15Gr90vF1agF1UK3yY9Fy3Gr4kCw42
	yrWUKas3JF90v3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvqb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x07bIBTOUUUUU=
X-Originating-IP: [123.118.222.47]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_050258_958437_81B5E2D3 
X-CRM114-Status: GOOD (  19.52  )
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

Ck9uIDEvMjUvMjYgMTk6MDMsIFlpeHVuIExhbiB3cm90ZToKPiBIaSBHdW9kb25nLAo+Cj4gT24g
MTI6MjcgU3VuIDI1IEphbiAgICAgLCBHdW9kb25nIFh1IHdyb3RlOgo+PiBPbiBTdW4sIEphbiAy
NSwgMjAyNiBhdCAxMjoxOOKAr1BNIEd1b2RvbmcgWHUgPGd1b2RvbmdAcmlzY3N0YXIuY29tPiB3
cm90ZToKPj4+IE9uIFNhdCwgSmFuIDI0LCAyMDI2IGF0IDI6MjXigK9QTSBWaXZpYW4gV2FuZyA8
d2FuZ3J1aWthbmdAaXNjYXMuYWMuY24+IHdyb3RlOgo+Pj4+Cj4+Pj4gT24gMS8yNC8yNiAwODoy
MCwgR3VvZG9uZyBYdSB3cm90ZToKPj4+Pj4gWy4uLl0KPj4+Pj4KPj4+Pj4gTm90ZTogUGF0Y2gg
MyBpbnRyb2R1Y2VzIGEgYmlzZWN0IGJyZWFrYWdlIGJ5IHRyYW5zaXRpb25pbmcgdG8KPj4+Pj4g
cGluLXNwZWNpZmljIHN1cHBseSBuYW1lcy4gUHJvYmUgZmFpbHVyZXMgd2lsbCBvY2N1ciBvbiBl
eGlzdGluZyBib2FyZHMKPj4+Pj4gdW50aWwgUGF0Y2ggNCB1cGRhdGVzIHRoZSBjb3JyZXNwb25k
aW5nIERUUyBmaWxlLgo+Pj4+IE91Y2gsIHRoYXQncyBub3QgYSBiaXNlY3QgYnJlYWthZ2UsIHRo
YXQncyBhbiAqQUJJIGJyZWFrYWdlKi4gQW5kIEFGQUlDVAo+Pj4+IHRoaXMgaXMgc3RpbGwgbm90
IG9rYXkgaW4gMjAyNiwKPj4+PiBzZWUgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L0FCSS5yc3QKPj4+Pgo+Pj4+IFNvIHRoZSBiaW5kaW5ncyB3b3VsZCBuZWVkIHRvIGJlIGNoYW5n
ZWQgdG8gYWNjZXB0IGJvdGggdGhlIG5ldyBhbmQgb2xkIHdheS4KPj4+IElkZWFsbHkgeWVzLiBI
b3dldmVyLCBjb25zaWRlcmluZyB0aGlzIEFCSSBjaGFuZ2UncyBhY3R1YWwgZWZmZWN0LCB0aGUg
dHdvCj4+PiBLMSBib2FyZHMgKEJQSS1GMyBhbmQgSnVwaXRlcikgaW4gdGhlIGtlcm5lbCBnZXQg
dGhlaXIgcG93ZXIgc2V0dGluZ3MKPj4+IGZyb20gYm9vdCBmaXJtd2FyZSBhcyB3ZWxsLCBhbmQg
dGhlIHR5cGVzIG9mIHBlcmlwaGVyYWxzIGVuYWJsZWQgaW4gdGhlIC5kdHMKPj4+IGZpbGVzIGFy
ZSB2ZXJ5IGxpbWl0ZWQsIHRoZSBwcm9iZSBmYWlsdXJlIG9mIHRoZSBwbWljIHJlZ3VsYXRvciBk
b2Vzbid0Cj4+PiBhZmZlY3QgbXVjaC4gU28sIEkgdGhpbmsgdGhpcyBicmVha2FnZSBpcyBhY2Nl
cHRhYmxlLgo+Pj4KPj4+PiBEcml2ZXItd2lzZSwgYXQgYSBjdXJzb3J5IGxvb2sgZnJvbSBzb21l
b25lIG5vdCBmYW1pbGlhciB3aXRoIHRoZQo+Pj4+IHJlZ3VsYXRvciBzdHVmZiwgbWF5YmUgd2Ug
Y2FuIG1ha2UgaXQgY29tcGF0aWJsZSB3aXRoIG9sZCBEVFMgYnkgYWRkaW5nCj4+Pj4gdGhlIG5l
dyBuYW1lcyBhcyBhbGlhc2VzICh7ZGV2bV8sfXJlZ3VsYXRvcl9yZWdpc3Rlcl9zdXBwbHlfYWxp
YXM/KSBhcwo+Pj4+ICJ2aW4iIG9yICJidWNrNSIsIGlmIHdlIHNlZSB0aGUgb2xkIHZpbi1zdXBw
bHkgZGVmaW5pdGlvbnM/Cj4+Pj4KPj4+IFdlIGNhbiBkbyB0aGF0IG9mIGNvdXJzZS4gTXkgaGVz
aXRhdGlvbiBpcywgaG93ZXZlciwgaXQgbWFrZXMgdGhlIGRyaXZlciB0YWtlCj4+PiBleHRyYSBj
b2RlIHdoaWNoIG1heSBub3QgYmUgbmVlZGVkIG9uY2UgYWxsIC5kdHMgZmlsZXMgaGF2ZSBiZWVu
IHVwZGF0ZWQuIFRoZQo+Pj4gZHJpdmVyIGNvZGUgd2lsbCBiZSBsZWZ0IHRoZXJlIGZvcmV2ZXIu
Cj4+Pgo+PiBNYXJrIGdhdmUgaGlzIG9waW5pb24gaW4gdjEgcmV2aWV3IFsxXSwgcGxlYXNlIGFs
bG93IG1lIHRvIHBhcnRpYWxseSBxdW90ZQo+PiBoZXJlOiAiKGl0J3MgYW4gQUJJIGNoYW5nZSBz
byBzaG91bGRuJ3QgcmVhbGx5IGhhcHBlbiwgYnV0IHBlcmhhcHMgdGhlcmUgYXJlCj4+IGZldyBl
bm91Z2ggdXNlcnMgZm9yIGV2ZXJ5b25lIHRvIGNvb3JkaW5hdGUgYW5kIGl0J3Mgd2hhdCB5b3Ug
YWxsIHByZWZlcikuIgo+Pgo+PiBJIGRvIGV4cGVjdCB0byBjb2xsZWN0IG1vcmUgaWRlYXMgYmVm
b3JlIEkgZGVjaWRlIHdoZXRoZXIgYW5kIHdoYXQgdG8gZG8gaW4KPj4gdjMsIG9yIG1heWJlIHYz
IGlzIG5vdCByZXF1aXJlZC4KPj4KPiBBcyBJIGNoZWNrZWQgdGhlIGR0cyB0cmVlIChEVCBxdWV1
ZWQgZm9yIHY2LjIwKSwgYWx0aG91Z2ggd2UgaW50cm9kdWNlZCB0aGUKPiByZWd1bGF0b3Igb2Yg
UDEvUE1JQywgYnV0IHRoZXJlIGlzIG5vIGNvbnN1bWVycyBzbyBmYXIsIHNvIGluIHJlYWwgbGlm
ZSwgd2UKPiBzaG91bGRuJ3QgYnJlYWsgYW55dGhpbmcuIEluIHRoaXMgY2FzZSwgSSdkIHN1Z2dl
c3Qgd2UganVzdCBnaXZlIHVwIGZvciBkb2luZwo+IHRoZSBBQkkgYmFja3dhcmQgY29tcGF0aWJs
ZSB3b3JrIHdoaWNoIHNob3VsZCBzaW1wbGlmeSBvdXIgbGlmZS4uCgpIYXZpbmcgY2hlY2tlZCBh
Z2FpbiwgSSBhZ3JlZSB0aGF0IHRoaXMgaXMgbm90IHRoYXQgYmlnIG9mIGEgcHJvYmxlbS4KVGhl
IGJyZWFrYWdlIHdpdGggb2xkIERUIGlzIGxpbWl0ZWQgdG8gYW4gb3RoZXJ3aXNlIGhhcm1sZXNz
IGVycm9yIG9uCmJvb3QgdGhhdCBkb2Vzbid0IGFmZmVjdCBmdW5jdGlvbmFsaXR5IHNpbmNlIHRo
ZXJlIGFyZSBubyB1c2Vycy4KClZpdmlhbiAiZHJhbWZvcmV2ZXIiIFdhbmcuCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
