Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4485C52D70
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2024 07:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tUQvJFGS8UIjs3KwI6NOE2KOnkVwY4qJLHA7AIy8otE=; b=dXY9IDjc1+3uG22rqH1GETvL8Q
	/ESuR0XUBSvhlqWmvenLlUIYM6SKaVpD17tD9EWVI38XaKeTSdEtQMK4eDo0F0j9SbTdGnNzgZN1p
	kFxmo0b+aNIhdhj8sk7TAUL4XcgjhJawW8ci5yEsgJ1QVV4OfzgskMiD/ApBF8AhvOv9cNd9k+cFn
	47cEejQObxd8O/ICcn9lN0ZA2Um1YlteQfWF1T0bZzLcAbHBHgXvXv8S8qo1Jf2wFx0O9t+tdIf6p
	ZFOif8Px2p3v9gQVp9NSl12dsTuYJYxpAm0umkbtggqp/LLlqxOk7Jr8OFAWfWkbDhQa3D7X0XCNz
	xRP+dsPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZmoK-00000007y6V-0qHK;
	Fri, 02 Aug 2024 07:34:48 +0000
Received: from mail.loongson.cn ([114.242.206.163])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZmoH-00000007y4d-0iht;
	Fri, 02 Aug 2024 07:34:47 +0000
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8AxGuoQjKxmAFoGAA--.22147S3;
	Fri, 02 Aug 2024 15:34:40 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowMCxbuUPjKxm0GILAA--.55848S3;
	Fri, 02 Aug 2024 15:34:39 +0800 (CST)
Subject: Re: [PATCH v12 65/84] KVM: LoongArch: Mark "struct page" pfns
 accessed only in "slow" page fault path
To: Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao
 <zhaotianrui@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>,
 David Stevens <stevensd@chromium.org>
References: <20240726235234.228822-1-seanjc@google.com>
 <20240726235234.228822-66-seanjc@google.com>
From: maobibo <maobibo@loongson.cn>
Message-ID: <d5405245-edd3-9bc5-0c40-282a30e46fae@loongson.cn>
Date: Fri, 2 Aug 2024 15:34:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20240726235234.228822-66-seanjc@google.com>
Content-Language: en-US
X-CM-TRANSID: qMiowMCxbuUPjKxm0GILAA--.55848S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7WFWUJw1rKF47AFWUZFWfCrX_yoW8ZF1xpF
	ZxCwsrtr4rtrn093srta4qvF17Gw4DKr1xX3W2q34FkFnIqw1Y93W8W397WFyUJ392ya1S
	vF1rt3WUWan0vacCm3ZEXasCq-sJn29KB7ZKAUJUUUUD529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	tVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vI
	r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWx
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4YLvDU
	UUU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_003445_591562_A3B56815 
X-CRM114-Status: GOOD (  15.87  )
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

CgpPbiAyMDI0LzcvMjcg5LiK5Y2INzo1MiwgU2VhbiBDaHJpc3RvcGhlcnNvbiB3cm90ZToKPiBN
YXJrIHBhZ2VzIGFjY2Vzc2VkIG9ubHkgaW4gdGhlIHNsb3cgcGF0aCwgYmVmb3JlIGRyb3BwaW5n
IG1tdV9sb2NrIHdoZW4KPiBmYXVsdGluZyBpbiBndWVzdCBtZW1vcnkgc28gdGhhdCBMb29uZ0Fy
Y2ggY2FuIGNvbnZlcnQgdG8KPiBrdm1fcmVsZWFzZV9mYXVsdGluX3BhZ2UoKSB3aXRob3V0IHRy
aXBwaW5nIGl0cyBsb2NrZGVwIGFzc2VydGlvbiBvbgo+IG1tdV9sb2NrIGJlaW5nIGhlbGQuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+
Cj4gLS0tCj4gICBhcmNoL2xvb25nYXJjaC9rdm0vbW11LmMgfCAyMCArKy0tLS0tLS0tLS0tLS0t
LS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvbG9vbmdhcmNoL2t2bS9tbXUuYyBiL2FyY2gvbG9vbmdh
cmNoL2t2bS9tbXUuYwo+IGluZGV4IDM2NGRkMzVlMDU1Ny4uNTJiNWMxNmNmMjUwIDEwMDY0NAo+
IC0tLSBhL2FyY2gvbG9vbmdhcmNoL2t2bS9tbXUuYwo+ICsrKyBiL2FyY2gvbG9vbmdhcmNoL2t2
bS9tbXUuYwo+IEBAIC01NTIsMTIgKzU1MiwxMCBAQCBib29sIGt2bV90ZXN0X2FnZV9nZm4oc3Ry
dWN0IGt2bSAqa3ZtLCBzdHJ1Y3Qga3ZtX2dmbl9yYW5nZSAqcmFuZ2UpCj4gICBzdGF0aWMgaW50
IGt2bV9tYXBfcGFnZV9mYXN0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQgbG9uZyBn
cGEsIGJvb2wgd3JpdGUpCj4gICB7Cj4gICAJaW50IHJldCA9IDA7Cj4gLQlrdm1fcGZuX3QgcGZu
ID0gMDsKPiAgIAlrdm1fcHRlX3QgKnB0ZXAsIGNoYW5nZWQsIG5ldzsKPiAgIAlnZm5fdCBnZm4g
PSBncGEgPj4gUEFHRV9TSElGVDsKPiAgIAlzdHJ1Y3Qga3ZtICprdm0gPSB2Y3B1LT5rdm07Cj4g
ICAJc3RydWN0IGt2bV9tZW1vcnlfc2xvdCAqc2xvdDsKPiAtCXN0cnVjdCBwYWdlICpwYWdlOwo+
ICAgCj4gICAJc3Bpbl9sb2NrKCZrdm0tPm1tdV9sb2NrKTsKPiAgIAo+IEBAIC01NzAsOCArNTY4
LDYgQEAgc3RhdGljIGludCBrdm1fbWFwX3BhZ2VfZmFzdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUs
IHVuc2lnbmVkIGxvbmcgZ3BhLCBib29sIHdyaXQKPiAgIAo+ICAgCS8qIFRyYWNrIGFjY2VzcyB0
byBwYWdlcyBtYXJrZWQgb2xkICovCj4gICAJbmV3ID0ga3ZtX3B0ZV9ta3lvdW5nKCpwdGVwKTsK
PiAtCS8qIGNhbGwga3ZtX3NldF9wZm5fYWNjZXNzZWQoKSBhZnRlciB1bmxvY2sgKi8KPiAtCj4g
ICAJaWYgKHdyaXRlICYmICFrdm1fcHRlX2RpcnR5KG5ldykpIHsKPiAgIAkJaWYgKCFrdm1fcHRl
X3dyaXRlKG5ldykpIHsKPiAgIAkJCXJldCA9IC1FRkFVTFQ7Cj4gQEAgLTU5NSwyMyArNTkxLDEx
IEBAIHN0YXRpYyBpbnQga3ZtX21hcF9wYWdlX2Zhc3Qoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1
bnNpZ25lZCBsb25nIGdwYSwgYm9vbCB3cml0Cj4gICAJfQo+ICAgCj4gICAJY2hhbmdlZCA9IG5l
dyBeICgqcHRlcCk7Cj4gLQlpZiAoY2hhbmdlZCkgewo+ICsJaWYgKGNoYW5nZWQpCj4gICAJCWt2
bV9zZXRfcHRlKHB0ZXAsIG5ldyk7Cj4gLQkJcGZuID0ga3ZtX3B0ZV9wZm4obmV3KTsKPiAtCQlw
YWdlID0ga3ZtX3Bmbl90b19yZWZjb3VudGVkX3BhZ2UocGZuKTsKPiAtCQlpZiAocGFnZSkKPiAt
CQkJZ2V0X3BhZ2UocGFnZSk7Cj4gLQl9Cj4gKwo+ICAgCXNwaW5fdW5sb2NrKCZrdm0tPm1tdV9s
b2NrKTsKPiAgIAo+IC0JaWYgKGNoYW5nZWQpIHsKPiAtCQlpZiAoa3ZtX3B0ZV95b3VuZyhjaGFu
Z2VkKSkKPiAtCQkJa3ZtX3NldF9wZm5fYWNjZXNzZWQocGZuKTsKPiAtCj4gLQkJaWYgKHBhZ2Up
Cj4gLQkJCXB1dF9wYWdlKHBhZ2UpOwo+IC0JfQo+IC0KPiAgIAlpZiAoa3ZtX3B0ZV9kaXJ0eShj
aGFuZ2VkKSkKPiAgIAkJbWFya19wYWdlX2RpcnR5KGt2bSwgZ2ZuKTsKPiAgIAo+IApSZXZpZXdl
ZC1ieTogQmlibyBNYW8gPG1hb2JpYm9AbG9vbmdzb24uY24+CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
