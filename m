Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB93C3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Aug 2024 11:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+zsywg8J9L98wp3eJbdcu5HoQj6FrOYoRLg3Dbnrl2E=; b=yYASEqHEz1u3fcCr1gwXUl3FbN
	rsgtFALsUImX8W/Zu6Ix3JjSySoXQlj7FHFJoIj1xDJ22aHuGCyi8bgWtmjHQ23HyYSK9SyyXSUyv
	Tg00EuyoNO9Xyd73fqZqFGYEzPxlFq+v8u41Wx97aMmBZBIwt4D5pgMGBDyUGC95N/KTPhr/BlZsE
	iZqizJr1OAdY2RyvutOmqJ1lBRTo0lXtu01gMO1UniBbplD5nlYCOqFOXTIUVRZvfoj0cQscLHt8L
	M1wtWTrp98maIqr9B26LJkuJ8UZgrjxgcRVBVr40jRA2g4pYH0Wt/vFHvvhFXt8T10gcGEpg7O6Mu
	PfgGV1ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc1TM-000000085Gl-3PPd;
	Thu, 08 Aug 2024 11:38:24 +0000
Received: from mail.loongson.cn ([114.242.206.163])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc1TI-000000085ET-39bi;
	Thu, 08 Aug 2024 11:38:22 +0000
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8Bx6ekkrrRmiMMLAA--.35031S3;
	Thu, 08 Aug 2024 19:38:12 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowMDxkeEgrrRmtq8JAA--.48118S3;
	Thu, 08 Aug 2024 19:38:09 +0800 (CST)
Subject: Re: [PATCH v12 64/84] KVM: LoongArch: Mark "struct page" pfns dirty
 only in "slow" page fault path
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
 <20240726235234.228822-65-seanjc@google.com>
From: maobibo <maobibo@loongson.cn>
Message-ID: <b54357a9-6146-603b-45cd-e8ee0db4a709@loongson.cn>
Date: Thu, 8 Aug 2024 19:38:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20240726235234.228822-65-seanjc@google.com>
Content-Language: en-US
X-CM-TRANSID: qMiowMDxkeEgrrRmtq8JAA--.48118S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7WFW8JryfWw13KFy5Xw4kKrX_yoW8CFWkpF
	W7CrZrGrWrtrnavrZrt3sF9rs0yrs8Kr1xXa4xG34rGF1qqryYq3W0grZ7WF1fJ3s3AFWS
	qF1rKFnFgFs5JwbCm3ZEXasCq-sJn29KB7ZKAUJUUUUD529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	tVWrXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vI
	r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2pVbDU
	UUU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_043821_168029_5D7843FD 
X-CRM114-Status: GOOD (  15.42  )
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
YXJrIHBhZ2VzL2ZvbGlvcyBkaXJ0eSBvbmx5IHRoZSBzbG93IHBhZ2UgZmF1bHQgcGF0aCwgaS5l
LiBvbmx5IHdoZW4KPiBtbXVfbG9jayBpcyBoZWxkIGFuZCB0aGUgb3BlcmF0aW9uIGlzIG1tdV9u
b3RpZmllci1wcm90ZWN0ZWQsIGFzIG1hcmtpbmcgYQo+IHBhZ2UvZm9saW8gZGlydHkgYWZ0ZXIg
aXQgaGFzIGJlZW4gd3JpdHRlbiBiYWNrIGNhbiBtYWtlIHNvbWUgZmlsZXN5c3RlbXMKPiB1bmhh
cHB5IChiYWNraW5nIEtWTSBndWVzdHMgd2lsbCBzdWNoIGZpbGVzeXN0ZW0gZmlsZXMgaXMgdW5j
b21tb24sIGFuZAo+IHRoZSByYWNlIGlzIG1pbnVzY3VsZSwgaGVuY2UgdGhlIGxhY2sgb2YgY29t
cGxhaW50cykuCj4gCj4gU2VlIHRoZSBsaW5rIGJlbG93IGZvciBkZXRhaWxzLgo+IAo+IExpbms6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9jb3Zlci4xNjgzMDQ0MTYyLmdpdC5sc3RvYWtl
c0BnbWFpbC5jb20KPiBTaWduZWQtb2ZmLWJ5OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNA
Z29vZ2xlLmNvbT4KPiAtLS0KPiAgIGFyY2gvbG9vbmdhcmNoL2t2bS9tbXUuYyB8IDE4ICsrKysr
KysrKystLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDggZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvbG9vbmdhcmNoL2t2bS9tbXUuYyBiL2Fy
Y2gvbG9vbmdhcmNoL2t2bS9tbXUuYwo+IGluZGV4IDI2MzRhOWU4ZDgyYy4uMzY0ZGQzNWUwNTU3
IDEwMDY0NAo+IC0tLSBhL2FyY2gvbG9vbmdhcmNoL2t2bS9tbXUuYwo+ICsrKyBiL2FyY2gvbG9v
bmdhcmNoL2t2bS9tbXUuYwo+IEBAIC02MDgsMTMgKzYwOCwxMyBAQCBzdGF0aWMgaW50IGt2bV9t
YXBfcGFnZV9mYXN0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQgbG9uZyBncGEsIGJv
b2wgd3JpdAo+ICAgCQlpZiAoa3ZtX3B0ZV95b3VuZyhjaGFuZ2VkKSkKPiAgIAkJCWt2bV9zZXRf
cGZuX2FjY2Vzc2VkKHBmbik7Cj4gICAKPiAtCQlpZiAoa3ZtX3B0ZV9kaXJ0eShjaGFuZ2VkKSkg
ewo+IC0JCQltYXJrX3BhZ2VfZGlydHkoa3ZtLCBnZm4pOwo+IC0JCQlrdm1fc2V0X3Bmbl9kaXJ0
eShwZm4pOwo+IC0JCX0KPiAgIAkJaWYgKHBhZ2UpCj4gICAJCQlwdXRfcGFnZShwYWdlKTsKPiAg
IAl9Cj4gKwo+ICsJaWYgKGt2bV9wdGVfZGlydHkoY2hhbmdlZCkpCj4gKwkJbWFya19wYWdlX2Rp
cnR5KGt2bSwgZ2ZuKTsKPiArCj4gICAJcmV0dXJuIHJldDsKPiAgIG91dDoKPiAgIAlzcGluX3Vu
bG9jaygma3ZtLT5tbXVfbG9jayk7Cj4gQEAgLTkxNSwxMiArOTE1LDE0IEBAIHN0YXRpYyBpbnQg
a3ZtX21hcF9wYWdlKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQgbG9uZyBncGEsIGJv
b2wgd3JpdGUpCj4gICAJZWxzZQo+ICAgCQkrK2t2bS0+c3RhdC5wYWdlczsKPiAgIAlrdm1fc2V0
X3B0ZShwdGVwLCBuZXdfcHRlKTsKPiAtCXNwaW5fdW5sb2NrKCZrdm0tPm1tdV9sb2NrKTsKPiAg
IAo+IC0JaWYgKHByb3RfYml0cyAmIF9QQUdFX0RJUlRZKSB7Cj4gLQkJbWFya19wYWdlX2RpcnR5
X2luX3Nsb3Qoa3ZtLCBtZW1zbG90LCBnZm4pOwo+ICsJaWYgKHdyaXRlYWJsZSkKPiAgIAkJa3Zt
X3NldF9wZm5fZGlydHkocGZuKTsKPiAtCX0KPiArCj4gKwlzcGluX3VubG9jaygma3ZtLT5tbXVf
bG9jayk7Cj4gKwo+ICsJaWYgKHByb3RfYml0cyAmIF9QQUdFX0RJUlRZKQo+ICsJCW1hcmtfcGFn
ZV9kaXJ0eV9pbl9zbG90KGt2bSwgbWVtc2xvdCwgZ2ZuKTsKPiAgIAo+ICAgCWt2bV9yZWxlYXNl
X3Bmbl9jbGVhbihwZm4pOwo+ICAgb3V0Ogo+IApSZXZpZXdlZC1ieTogQmlibyBNYW8gPG1hb2Jp
Ym9AbG9vbmdzb24uY24+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
