Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B95FD5F87
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Apr 2026 07:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fDXUqWqj05H6SXhw3cOSqyCj/bnZnwSkOuyt7Rdg824=; b=4mLXObX9DSXKEH
	/5RIgoCYUHzG9hmdXzPOL+KK5WTiIoVOvedEPpsnGT/6kchuPCu3RbJKzVpbeLPqNJ0JO3JUHyP3x
	6hoDdY82DMXx7wZrd3ktxZhgitS09zHmR62fCF7oaF4AKB2SLxlNNGojw6CLLb/kpYiuMqCnk9L9K
	+yTg/TKGbxRJqsofegJ4xL6VzM8Jlmx+LfmGE29H9E4Gs9tewwN0BNhr3aRdJFLMwIo4Y0OY3UoKb
	qxHzHXfzeBS0va/VD2mP6jpjaMZjwXf6FyzaVVlpVl+EZjI0jgwABqETbFRP2ef4hitrHFyi6znVP
	epwwTGrjlKvdL5fPKFeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wANRy-00000008RY7-1fBO;
	Wed, 08 Apr 2026 07:35:46 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wANRu-00000008RXO-1KbO
	for linux-riscv@lists.infradead.org;
	Wed, 08 Apr 2026 07:35:44 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.43])
	by APP-05 (Coremail) with SMTP id zQCowABn9glFBdZp48XqDA--.42033S2;
	Wed, 08 Apr 2026 15:35:34 +0800 (CST)
Message-ID: <414231dccf62dba2a9275f0867874621f4922b6a.camel@iscas.ac.cn>
Subject: Re: [PATCH] riscv: dts: sophgo: reduce SG2042 MSI count to 16
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Chen Wang <unicorn_wang@outlook.com>, Thomas Gleixner <tglx@kernel.org>,
  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,  Inochi Amaoto <inochiama@gmail.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Han Gao <rabenda.cn@gmail.com>, Zixian Zeng <sycamoremoon376@gmail.com>,
  Manivannan Sadhasivam	 <mani@kernel.org>, devicetree@vger.kernel.org,
 sophgo@lists.linux.dev, 	linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Wed, 08 Apr 2026 15:35:33 +0800
In-Reply-To: <MA5PR01MB1250025586EE7A236CAC536B1FE5BA@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
References: <20260407160143.1182430-1-zhengxingda@iscas.ac.cn>
	 <MA5PR01MB1250025586EE7A236CAC536B1FE5BA@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-CM-TRANSID: zQCowABn9glFBdZp48XqDA--.42033S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr4UCr43Aw4rJw1xWF15urg_yoW8Cry5pa
	1DuFsIkaya9rs7Ca17KFWjgr4xArZ3Ww4DKrn8G34jqrZxXa4UJr43tr95G3ZrXr4rXw45
	AF1Uuw1fCFn8XFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7IUnj-e5UUUUU==
X-Originating-IP: [112.94.102.43]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_003542_726538_9055A31E 
X-CRM114-Status: GOOD (  18.29  )
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

5ZyoIDIwMjYtMDQtMDjkuInnmoQgMTU6MDQgKzA4MDDvvIxDaGVuIFdhbmflhpnpgZPvvJoKPiAK
PiBPbiA0LzgvMjAyNiAxMjowMSBBTSwgSWNlbm93eSBaaGVuZyB3cm90ZToKPiA+IFRoZSBTRzIw
NDIgTVNJIGNvbnRyb2xsZXIgaGFzIG9uZSAzMi1iaXQgZG9vcmJlbGwgcmVnaXN0ZXIsIGFuZAo+
ID4gZWFjaCBiaXQKPiA+IGNvcnJlc3BvbmRzIHRvIGFuIGludGVycnVwdC4gQXQgYSBnbGFuY2Us
IGl0IHNlZW1zIHRoYXQgdGhlIE1TSQo+ID4gY29udHJvbGxlciBjYW4gc3VwcG9ydCAzMiBpbnRl
cnJ1cHRzOyBob3dldmVyIHRoZSBQQ0kgTVNJCj4gPiBjYXBhYmlsaXR5Cj4gPiBvbmx5IHN1cHBv
cnRzIDE2LWJpdCBtZXNzYWdlcywgd2hpY2ggbWFrZXMgdGhlIGhpZ2ggMTYgaW50ZXJydXB0cwo+
ID4gdW51c2FibGUgaW4gc3VjaCB3YXkuCj4gPiAKPiA+IFJlZHVjZSB0aGUgTVNJIGNvdW50IHRv
IDE2IHRvIHByZXZlbnQgcHJvZHVjaW5nIE1TSSBtZXNzYWdlIHZhbHVlcwo+ID4gdGhhdAo+ID4g
Y2Fubm90IGZpdCAxNi1iaXQgaW50ZWdlcnMuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEljZW5v
d3kgWmhlbmcgPHpoZW5neGluZ2RhQGlzY2FzLmFjLmNuPgo+ID4gLS0tCj4gPiDCoCBhcmNoL3Jp
c2N2L2Jvb3QvZHRzL3NvcGhnby9zZzIwNDIuZHRzaSB8IDIgKy0KPiA+IMKgIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDQyLmR0c2kKPiA+IGIvYXJjaC9yaXNjdi9i
b290L2R0cy9zb3BoZ28vc2cyMDQyLmR0c2kKPiA+IGluZGV4IDlmZGRmM2YwYjNiOTkuLjlmMTgy
MGE3YjVhOWYgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9zZzIw
NDIuZHRzaQo+ID4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDQyLmR0c2kK
PiA+IEBAIC0yMzQsNyArMjM0LDcgQEAgbXNpOiBtc2ktY29udHJvbGxlckA3MDMwMDEwMzA0IHsK
PiA+IMKgwqAJCQlyZWctbmFtZXMgPSAiY2xyIiwgImRvb3JiZWxsIjsKPiA+IMKgwqAJCQltc2kt
Y29udHJvbGxlcjsKPiA+IMKgwqAJCQkjbXNpLWNlbGxzID0gPDA+Owo+ID4gLQkJCW1zaS1yYW5n
ZXMgPSA8JmludGMgNjQKPiA+IElSUV9UWVBFX0VER0VfUklTSU5HIDMyPjsKPiA+ICsJCQltc2kt
cmFuZ2VzID0gPCZpbnRjIDY0Cj4gPiBJUlFfVFlQRV9FREdFX1JJU0lORyAxNj47Cj4gPiDCoMKg
CQl9Owo+ID4gwqAgCj4gPiDCoMKgCQlycGdhdGU6IGNsb2NrLWNvbnRyb2xsZXJANzAzMDAxMDM2
OCB7Cj4gCj4gTEdUTS4KPiAKPiBSZXZpZXdlZC1ieTogQ2hlbiBXYW5nIDx1bmljb3JuX3dhbmdA
b3V0bG9vay5jb20+Cj4gCj4gVGVzdGVkLWJ5OiBDaGVuIFdhbmcgPHVuaWNvcm5fd2FuZ0BvdXRs
b29rLmNvbT4gb24gUGlvbmVlcmJveC4KPiAKPiBUaGFua3MsCj4gCj4gQ2hlbgo+IAo+IAo+IEhp
LCBIYW4sCj4gCj4gV2lsbCB5b3UgcGxlYXNlIHJ1biBzb21lIHF1aWNrIHRlc3Qgb24gRVZCIGJv
YXJkcywgSSBoYXZlIG5vIHN1Y2ggCj4gaGFyZHdhcmUgaW4gaGFuZCwgdGhhbmtzLgoKSSB0ZXN0
ZWQgb24gRVZCIHYxLCBidXQgSSBoYXZlIG5vIGFjY2VzcyB0byBFVkIgdjIgZWl0aGVyLgoKVGhh
bmtzLApJY2Vub3d5Cgo+IAo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
