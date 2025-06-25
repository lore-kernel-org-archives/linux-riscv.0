Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C23C7115C
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 03:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lYsig4Lag5s0eFsEKrHKnofsKXXuQYpKLf7EjEB6KXY=; b=X1tMGneW/476M8
	FnfBGIgRs93RRcf3t/XldWKdXGpW+thLmMBBolxnD73CFwuw4IbAo15JdnMa5gREl0rNNT30D0kdB
	wyXtziK5nZ2KLF/ueqtFl5ZKpcbZnmUUjLC6uuY58+ez5v7tyGaoloaQTpXZ7tQ8/bPhqJCEP33S/
	+aops5a8l65CSdebpdKNnpPBn/wwptmNvKxexQxfhRvsair1RBOSUk9D8pTTXFNVFng9Zo/KwSUnB
	jIUix6KAhOfz9kF9yaKeREW4uBfvqI7Eb4AcnAF/c2ZfL9RukSPBSPQ/EUxTR1BO/i+i3IteE70XQ
	vDcow2bQSHipz+tNkWjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUGhk-00000007OdJ-0b21;
	Wed, 25 Jun 2025 03:21:44 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUGhh-00000007Ocs-29pl
	for linux-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 03:21:43 +0000
Received: from [192.168.33.186] (unknown [210.73.43.2])
	by APP-05 (Coremail) with SMTP id zQCowAA3vgw4a1toj5shCQ--.56893S2;
	Wed, 25 Jun 2025 11:21:30 +0800 (CST)
Message-ID: <965d5dca-72b0-47da-bd9d-efeca16db826@iscas.ac.cn>
Date: Wed, 25 Jun 2025 11:21:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] riscv: dts: spacemit: Move UARTs under dma-bus for K1
To: Guodong Xu <guodong@riscstar.com>
Cc: Yixun Lan <dlan@gentoo.org>, Ze Huang <huangze@whut.edu.cn>,
 Alex Elder <elder@riscstar.com>, spacemit@lists.linux.dev,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Vivian Wang <uwu@dram.page>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250623-k1-dma-buses-rfc-wip-v1-0-c0144082061f@iscas.ac.cn>
 <20250623-k1-dma-buses-rfc-wip-v1-2-c0144082061f@iscas.ac.cn>
 <CAH1PCMZ1YUC9SLOSEuCL3oUhYN23UOL+kLrOk8fbJ+EG-w3Umg@mail.gmail.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <CAH1PCMZ1YUC9SLOSEuCL3oUhYN23UOL+kLrOk8fbJ+EG-w3Umg@mail.gmail.com>
X-CM-TRANSID: zQCowAA3vgw4a1toj5shCQ--.56893S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CryxGr1rtFy7tr45CF47XFb_yoW8GrW5pa
	y7Xr4kKrWkJr4kArnrXF1qgFWfWr4Sqa4xCFyDGwn8Za98WF12qFWSkr9Fkry7Wwn5Aa1I
	yanava4q9FW5XaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxU2X_-DUUUU
X-Originating-IP: [210.73.43.2]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_202141_922051_1E76C7D9 
X-CRM114-Status: GOOD (  10.91  )
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

T24gNi8yNC8yNSAyMDoyMSwgR3VvZG9uZyBYdSB3cm90ZToKPiBPbiBNb24sIEp1biAyMywgMjAy
NSBhdCA2OjA04oCvUE0gVml2aWFuIFdhbmcgPHdhbmdydWlrYW5nQGlzY2FzLmFjLmNuPiB3cm90
ZToKPj4gVUFSVCBkZXZpY2VzIGluIFNwYWNlbWl0IEsxIHVzZSBkbWEtYnVzIERNQSB0cmFuc2xh
dGlvbnMuIE1vdmUgdGhlc2UKPj4gbm9kZXMgdW5kZXIgZG1hLWJ1cyB0byByZWZsZWN0IHRoaXMg
ZmFjdC4KLi4uCj4+Cj4+IC0gICAgICAgICAgICAgICBzZWNfdWFydDE6IHNlcmlhbEBmMDYxMjAw
MCB7Cj4+IC0gICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAic3BhY2VtaXQsazEt
dWFydCIsICJpbnRlbCx4c2NhbGUtdWFydCI7Cj4+IC0gICAgICAgICAgICAgICAgICAgICAgIHJl
ZyA9IDwweDAgMHhmMDYxMjAwMCAweDAgMHgxMDA+Owo+PiAtICAgICAgICAgICAgICAgICAgICAg
ICBpbnRlcnJ1cHRzID0gPDQzPjsKPj4gLSAgICAgICAgICAgICAgICAgICAgICAgY2xvY2stZnJl
cXVlbmN5ID0gPDE0ODU3MDAwPjsKPj4gLSAgICAgICAgICAgICAgICAgICAgICAgcmVnLXNoaWZ0
ID0gPDI+Owo+PiAtICAgICAgICAgICAgICAgICAgICAgICByZWctaW8td2lkdGggPSA8ND47Cj4+
IC0gICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJyZXNlcnZlZCI7IC8qIGZvciBURUUg
dXNhZ2UgKi8KPj4gLSAgICAgICAgICAgICAgIH07Cj4+IC0KPiBBcmUgeW91IHN1cmUgc2VjX3Vh
cnQxIHNob3VsZCBiZSBwbGFjZWQgdW5kZXIgdGhlIGRtYV9idXM/IFBsZWFzZSBkb3VibGUKPiBj
aGVjay4gSWYgc2VjX3VhcnQxIGFuZCBvdGhlciBwZXJpcGhlcmFscyBzdXBwb3J0ZWQgYnkgdGhl
IHNlY3VyZSBETUEKPiAoYmFzZSBhZGRyZXNzOiAweEYwNjAwMDAwKSBzaGFyZSB0aGUgc2FtZSBh
ZGRyZXNzIG1hcHBpbmcgYXMgZG1hX2J1cywgYW5kCj4gaWYgdGhleSBjYW4gYmUgYWNjZXNzZWQg
YnkgdGhlIGxpbnV4IGtlcm5lbCBpbiBzb21lIGNhc2VzIChhcyBzYXlpbmcKPiAncmVzZXJ2ZWQn
KSwgdGhlbiB0aGF0IG1ha2VzIHNlbnNlLiBJZiBub3QsIGJldHRlciBub3QgbW92ZSB0aGVtLgoK
SGkgR3VvZG9uZywKCkkgaGF2ZSBjb25maXJtZWQgd2l0aCBTcGFjZW1pVCB0aGF0IHNlY191YXJ0
MSB1c2VzIGRyYW1fcmFuZ2U0LCBhLmsuYS4KZG1hLWJ1cywgd2hpY2ggaXMgc2FtZSBhcyB0aGUg
cmVzdCBvZiB0aGUgVUFSVHMuCgpBbHNvLCBzZWNfdWFydDEgaXMgdXNhYmxlIGluIGUuZy4gTGlu
dXgsIGJ1dCBvbmx5IGlmIG5vIFRFRSBpcyBpbiB1c2UuClVzaW5nIHN0YXR1cyA9ICJyZXNlcnZl
ZCIgaXMgdGhlIHNhZmUgY2hvaWNlIGhlcmUuIFBsYXRmb3JtcyB0aGF0IGRvIG5vdApydW4gYSBU
RUUgKG9yIGFueXRoaW5nIHNpbWlsYXIgdGhhdCB3b3VsZCBkaXNhYmxlIGFjY2VzcyB0byB0aGUK
MHhmMDAwXzAwMDAgdG8gMHhmZmZmX2ZmZmYgcmFuZ2UpIGFuZCB3aXNoaW5nIHRvIGVuYWJsZSB1
c2Ugb2Ygc2VjX3VhcnQxCmNhbiBjaGFuZ2UgdGhlIHN0YXR1cyB0byAib2theSIuCgpWaXZpYW4g
ImRyYW1mb3JldmVyIiBXYW5nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
