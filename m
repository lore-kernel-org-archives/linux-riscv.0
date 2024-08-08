Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08265C3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Aug 2024 11:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zh/MCjyaAq6pvfMPAJt0zaAAN+aQysHtncOg3p30cVk=; b=CGx1KiSLIYe7EgWoBJtGXp9Amy
	r9La9xgJ7HuPrNBoK6nG+MdyCb1gKEF7osjA+OdquZ6wmQ2OVQqcG0FTgCpZsrIH2nTtqZhRS6GYL
	zO43QNuRDwkG5szYCe0scxqMmY5N54ZICFySYGJb03/yJxeBU/0SGqC3o31xmX7hNlBSsdyJqthvQ
	/9ATg9huBqqbIgjxJJCrCDcStlbv0jtWDcUKxgz9rmm47kICDgDMOUa0OHIfs3TI1AXYymJ2znG68
	uLY5wXFj0U1qqOlEVgwBzs8jPPJ5WdyePbsAApVYnH9JR19kEvv6wA3wnS2tdHKNx8Qb5DeNAIcBi
	S6og2EDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc1ct-000000086Oy-3UMK;
	Thu, 08 Aug 2024 11:48:16 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc1cs-000000086Nd-1M3O;
	Thu, 08 Aug 2024 11:48:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=B/mNr27/TWFtSaUNumxEIYu4oGMMlPE5tJiLlY6euE8=; b=c41ofve5G4KW4WCMqzywAX6R/E
	WbbYFZieAq+L6XZ1iGPbPSC3NdsajfF0KMAvDWQrHWwLjwgSZ9Db24a2Azt+UAIyoO0bY39E70+U4
	4ODovUiG/dWV74mkftmUV7wV0h0Pn4E/cs88GeZLYGIE8KHuZ2iNsoo7FSn2DUuTM61vKp5bM+PVz
	oT9JPU5d8+TplH1Jhtt4SSRa9ITI1mhFlchgnIXi0AJ+DiZRmSeexfCPDe2xJckHzi/P6Ue2/RVMV
	HCVmAy8HNL+RfCGtFADdY2DcQjQW4aOLwXFfh0ROMdoDsFvwofSikLVE/oItYg+1PHdhqTVThr2Km
	qZ1OfQwA==;
Received: from mail.loongson.cn ([114.242.206.163])
	by casper.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc1cn-00000008oYX-1rbt;
	Thu, 08 Aug 2024 11:48:12 +0000
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8CxvOppsLRmAcYLAA--.35125S3;
	Thu, 08 Aug 2024 19:47:53 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowMDx0uFmsLRmn7IJAA--.48554S3;
	Thu, 08 Aug 2024 19:47:52 +0800 (CST)
Subject: Re: [PATCH v12 66/84] KVM: LoongArch: Mark "struct page" pfn accessed
 before dropping mmu_lock
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
 <20240726235234.228822-67-seanjc@google.com>
From: maobibo <maobibo@loongson.cn>
Message-ID: <9492f63e-8257-d911-1c67-33c9c7498c50@loongson.cn>
Date: Thu, 8 Aug 2024 19:47:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20240726235234.228822-67-seanjc@google.com>
Content-Language: en-US
X-CM-TRANSID: qMiowMDx0uFmsLRmn7IJAA--.48554S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrKry8Wr17XrWkXF4Utw1DurX_yoWkXFb_uF
	4Ikw1DGrWkJa90q3WDt3WrJr4Fgay8JFs0vFyDZrWxAa4qy390yFsaga1fAa4jqrWq9FW5
	ArWqyas0krZYqosvyTuYvTs0mTUanT9S1TB71UUUUb7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbqAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUtVW8ZwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	tVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vI
	r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jw0_GFylx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWx
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUstxhDU
	UUU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_124810_237112_247CDAFA 
X-CRM114-Status: GOOD (  12.52  )
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
YXJrIHBhZ2VzIGFjY2Vzc2VkIGJlZm9yZSBkcm9wcGluZyBtbXVfbG9jayB3aGVuIGZhdWx0aW5n
IGluIGd1ZXN0IG1lbW9yeQo+IHNvIHRoYXQgTG9vbmdBcmNoIGNhbiBjb252ZXJ0IHRvIGt2bV9y
ZWxlYXNlX2ZhdWx0aW5fcGFnZSgpIHdpdGhvdXQKPiB0cmlwcGluZyBpdHMgbG9ja2RlcCBhc3Nl
cnRpb24gb24gbW11X2xvY2sgYmVpbmcgaGVsZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTZWFuIENo
cmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4KPiAtLS0KPiAgIGFyY2gvbG9vbmdhcmNo
L2t2bS9tbXUuYyB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL2xvb25nYXJjaC9rdm0vbW11LmMgYi9h
cmNoL2xvb25nYXJjaC9rdm0vbW11LmMKPiBpbmRleCA1MmI1YzE2Y2YyNTAuLjIzMGNhZmExNzhk
NyAxMDA2NDQKPiAtLS0gYS9hcmNoL2xvb25nYXJjaC9rdm0vbW11LmMKPiArKysgYi9hcmNoL2xv
b25nYXJjaC9rdm0vbW11LmNCaWJvIE1hbyA8bWFvYmlib0Bsb29uZ3Nvbi5jbj4KPiBAQCAtOTAy
LDEzICs5MDIsMTMgQEAgc3RhdGljIGludCBrdm1fbWFwX3BhZ2Uoc3RydWN0IGt2bV92Y3B1ICp2
Y3B1LCB1bnNpZ25lZCBsb25nIGdwYSwgYm9vbCB3cml0ZSkKPiAgIAo+ICAgCWlmICh3cml0ZWFi
bGUpCj4gICAJCWt2bV9zZXRfcGZuX2RpcnR5KHBmbik7Cj4gKwlrdm1fcmVsZWFzZV9wZm5fY2xl
YW4ocGZuKTsKPiAgIAo+ICAgCXNwaW5fdW5sb2NrKCZrdm0tPm1tdV9sb2NrKTsKPiAgIAo+ICAg
CWlmIChwcm90X2JpdHMgJiBfUEFHRV9ESVJUWSkKPiAgIAkJbWFya19wYWdlX2RpcnR5X2luX3Ns
b3Qoa3ZtLCBtZW1zbG90LCBnZm4pOwo+ICAgCj4gLQlrdm1fcmVsZWFzZV9wZm5fY2xlYW4ocGZu
KTsKPiAgIG91dDoKPiAgIAlzcmN1X3JlYWRfdW5sb2NrKCZrdm0tPnNyY3UsIHNyY3VfaWR4KTsK
PiAgIAlyZXR1cm4gZXJyOwo+IApSZXZpZXdlZC1ieTogQmlibyBNYW8gPG1hb2JpYm9AbG9vbmdz
b24uY24+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
