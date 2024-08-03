Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5311C3DA4A
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Aug 2024 03:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=st2LXE4H9wijcHz9dMu0rOrQJNNrnShDtAPcAHjmEMY=; b=l2P0vE6VxMX0ulgFxv3dRpwAVk
	U8fbffVzgdF7Ek4FVljWAQza8rbVUUry/cKM5dfafskTEVUi4ODmkMle9MyNFjfEYMNnT3zcVmnyF
	LchosFSkfCJaW1CQO03BAtDcnjN7FCDO7vIXoYGBGo0THsv/mKt1jMPFrPX5Yj0b84WVHvrsu2qDe
	SeRXOe5/fJzx+tfRHup2U6aPrxK0c4cncJa8BA1EFtHSlEHdImPGNNdm4KkjpaOY/OMnSjVQfSgcR
	X5c879Hwel8QFwq3YGiplumILKZMa94Z6irauP9msFaQxrXFIqXqZtA8szfjUTR7yIib41wPzL9+9
	kiiW8bTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sa52F-0000000Ad42-3VaK;
	Sat, 03 Aug 2024 03:02:23 +0000
Received: from mail.loongson.cn ([114.242.206.163])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sa52B-0000000Ad38-16TN;
	Sat, 03 Aug 2024 03:02:22 +0000
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8Bx7eq1na1myeEGAA--.24072S3;
	Sat, 03 Aug 2024 11:02:13 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowMCxwuGwna1mXuwAAA--.5506S3;
	Sat, 03 Aug 2024 11:02:10 +0800 (CST)
Subject: Re: [PATCH v12 64/84] KVM: LoongArch: Mark "struct page" pfns dirty
 only in "slow" page fault path
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao
 <zhaotianrui@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
References: <20240726235234.228822-1-seanjc@google.com>
 <20240726235234.228822-65-seanjc@google.com>
 <a039b758-d4e3-3798-806f-25bceb2f33a5@loongson.cn>
 <Zq00OYowF5kc9QFE@google.com>
From: maobibo <maobibo@loongson.cn>
Message-ID: <345d89c1-4f31-6b49-2cd4-a0696210fa7c@loongson.cn>
Date: Sat, 3 Aug 2024 11:02:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <Zq00OYowF5kc9QFE@google.com>
Content-Language: en-US
X-CM-TRANSID: qMiowMCxwuGwna1mXuwAAA--.5506S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxJFyfAryfKw1fGw43AFyrGrX_yoW5uw17pF
	WUCFWqkFs5tryYyrZrt39IvrWrK39xKr1xX3W7J34Fkas0qr1IqF10grWfWFyUA3yfAayS
	qr4UKF9xuFZ8AwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUD529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWr
	XwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx
	k0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l
	4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
	42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2pVbDUUUU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_200219_663306_3114196E 
X-CRM114-Status: GOOD (  17.05  )
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

CgpPbiAyMDI0LzgvMyDkuIrljYgzOjMyLCBTZWFuIENocmlzdG9waGVyc29uIHdyb3RlOgo+IE9u
IEZyaSwgQXVnIDAyLCAyMDI0LCBtYW9iaWJvIHdyb3RlOgo+PiBPbiAyMDI0LzcvMjcg5LiK5Y2I
Nzo1MiwgU2VhbiBDaHJpc3RvcGhlcnNvbiB3cm90ZToKPj4+IE1hcmsgcGFnZXMvZm9saW9zIGRp
cnR5IG9ubHkgdGhlIHNsb3cgcGFnZSBmYXVsdCBwYXRoLCBpLmUuIG9ubHkgd2hlbgo+Pj4gbW11
X2xvY2sgaXMgaGVsZCBhbmQgdGhlIG9wZXJhdGlvbiBpcyBtbXVfbm90aWZpZXItcHJvdGVjdGVk
LCBhcyBtYXJraW5nIGEKPj4+IHBhZ2UvZm9saW8gZGlydHkgYWZ0ZXIgaXQgaGFzIGJlZW4gd3Jp
dHRlbiBiYWNrIGNhbiBtYWtlIHNvbWUgZmlsZXN5c3RlbXMKPj4+IHVuaGFwcHkgKGJhY2tpbmcg
S1ZNIGd1ZXN0cyB3aWxsIHN1Y2ggZmlsZXN5c3RlbSBmaWxlcyBpcyB1bmNvbW1vbiwgYW5kCj4+
PiB0aGUgcmFjZSBpcyBtaW51c2N1bGUsIGhlbmNlIHRoZSBsYWNrIG9mIGNvbXBsYWludHMpLgo+
Pj4KPj4+IFNlZSB0aGUgbGluayBiZWxvdyBmb3IgZGV0YWlscy4KPj4+Cj4+PiBMaW5rOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9hbGwvY292ZXIuMTY4MzA0NDE2Mi5naXQubHN0b2FrZXNAZ21h
aWwuY29tCj4+PiBTaWduZWQtb2ZmLWJ5OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNAZ29v
Z2xlLmNvbT4KPj4+IC0tLQo+Pj4gICAgYXJjaC9sb29uZ2FyY2gva3ZtL21tdS5jIHwgMTggKysr
KysrKysrKy0tLS0tLS0tCj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwg
OCBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9sb29uZ2FyY2gva3ZtL21t
dS5jIGIvYXJjaC9sb29uZ2FyY2gva3ZtL21tdS5jCj4+PiBpbmRleCAyNjM0YTllOGQ4MmMuLjM2
NGRkMzVlMDU1NyAxMDA2NDQKPj4+IC0tLSBhL2FyY2gvbG9vbmdhcmNoL2t2bS9tbXUuYwo+Pj4g
KysrIGIvYXJjaC9sb29uZ2FyY2gva3ZtL21tdS5jCj4+PiBAQCAtNjA4LDEzICs2MDgsMTMgQEAg
c3RhdGljIGludCBrdm1fbWFwX3BhZ2VfZmFzdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2ln
bmVkIGxvbmcgZ3BhLCBib29sIHdyaXQKPj4+ICAgIAkJaWYgKGt2bV9wdGVfeW91bmcoY2hhbmdl
ZCkpCj4+PiAgICAJCQlrdm1fc2V0X3Bmbl9hY2Nlc3NlZChwZm4pOwo+Pj4gLQkJaWYgKGt2bV9w
dGVfZGlydHkoY2hhbmdlZCkpIHsKPj4+IC0JCQltYXJrX3BhZ2VfZGlydHkoa3ZtLCBnZm4pOwo+
Pj4gLQkJCWt2bV9zZXRfcGZuX2RpcnR5KHBmbik7Cj4+PiAtCQl9Cj4+PiAgICAJCWlmIChwYWdl
KQo+Pj4gICAgCQkJcHV0X3BhZ2UocGFnZSk7Cj4+PiAgICAJfQo+Pj4gKwo+Pj4gKwlpZiAoa3Zt
X3B0ZV9kaXJ0eShjaGFuZ2VkKSkKPj4+ICsJCW1hcmtfcGFnZV9kaXJ0eShrdm0sIGdmbik7Cj4+
PiArCj4+PiAgICAJcmV0dXJuIHJldDsKPj4+ICAgIG91dDoKPj4+ICAgIAlzcGluX3VubG9jaygm
a3ZtLT5tbXVfbG9jayk7Cj4+PiBAQCAtOTE1LDEyICs5MTUsMTQgQEAgc3RhdGljIGludCBrdm1f
bWFwX3BhZ2Uoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIGdwYSwgYm9vbCB3
cml0ZSkKPj4+ICAgIAllbHNlCj4+PiAgICAJCSsra3ZtLT5zdGF0LnBhZ2VzOwo+Pj4gICAgCWt2
bV9zZXRfcHRlKHB0ZXAsIG5ld19wdGUpOwo+Pj4gLQlzcGluX3VubG9jaygma3ZtLT5tbXVfbG9j
ayk7Cj4+PiAtCWlmIChwcm90X2JpdHMgJiBfUEFHRV9ESVJUWSkgewo+Pj4gLQkJbWFya19wYWdl
X2RpcnR5X2luX3Nsb3Qoa3ZtLCBtZW1zbG90LCBnZm4pOwo+Pj4gKwlpZiAod3JpdGVhYmxlKQo+
PiBJcyBpdCBiZXR0ZXIgdG8gdXNlIHdyaXRlIG9yIChwcm90X2JpdHMgJiBfUEFHRV9ESVJUWSkg
aGVyZT8gIHdyaXRhYmxlIGlzCj4+IHB0ZSBwZXJtaXNzaW9uIGZyb20gZnVuY3Rpb24gaHZhX3Rv
X3Bmbl9zbG93KCksIHdyaXRlIGlzIGZhdWx0IGFjdGlvbi4KPiAKPiBNYXJraW5nIGZvbGlvcyBk
aXJ0eSBpbiB0aGUgc2xvdy9mdWxsIHBhdGggYmFzaWNhbGx5IG5lY2Vzc2l0YXRlcyBtYXJraW5n
IHRoZQo+IGZvbGlvIGRpcnR5IGlmIEtWTSBjcmVhdGVzIGEgd3JpdGFibGUgU1BURSwgYXMgS1ZN
IHdvbid0IG1hcmsgdGhlIGZvbGlvIGRpcnR5Cj4gaWYvd2hlbiBfUEFHRV9ESVJUWSBpcyBzZXQu
Cj4gCj4gUHJhY3RpY2FsbHkgc3BlYWtpbmcsIEknbSA5OS45JSBjZXJ0YWluIGl0IGRvZXNuJ3Qg
bWF0dGVyLiAgVGhlIGZvbGlvIGlzIG1hcmtlZAo+IGRpcnR5IGJ5IGNvcmUgTU0gd2hlbiB0aGUg
Zm9saW8gaXMgbWFkZSB3cml0YWJsZSwgYW5kIGNsZWFuaW5nIHRoZSBmb2xpbyB0cmlnZ2Vycwo+
IGFuIG1tdV9ub3RpZmllciBpbnZhbGlkYXRpb24uICBJLmUuIGlmIHRoZSBwYWdlIGlzIG1hcHBl
ZCB3cml0YWJsZSBpbiBLVk0ncwp5ZXMsIGl0IGlzLiBUaGFua3MgZm9yIHRoZSBleHBsYW5hdGlv
bi4ga3ZtX3NldF9wZm5fZGlydHkoKSBjYW4gYmUgcHV0IApvbmx5IGluIHNsb3cgcGFnZSBmYXVs
dCBwYXRoLiBJIG9ubHkgY29uY2VybiB3aXRoIGZhdWx0IHR5cGUsIHJlYWQgZmF1bHQgCnR5cGUg
Y2FuIHNldCBwdGUgZW50cnkgd3JpdGFibGUgaG93ZXZlciBub3QgX1BBR0VfRElSVFkgYXQgc3Rh
Z2UtMiBtbXUgCnRhYmxlLgoKPiBzdGFnZS0yIFBURXMsIHRoZW4gaXRzIGZvbGlvIGhhcyBhbHJl
YWR5IGJlZW4gbWFya2VkIGRpcnR5LgpDb25zaWRlcmluZyBvbmUgY29uZGl0aW9uIGFsdGhvdWdo
IEkgZG8gbm90IGtub3cgd2hldGhlciBpdCBleGlzdHMgCmFjdHVhbGx5LiB1c2VyIG1vZGUgVk1N
IHdyaXRlcyB0aGUgZm9saW8gd2l0aCBodmEgYWRkcmVzcyBmaXJzdGx5LCB0aGVuIApWQ1BVIHRo
cmVhZCAqcmVhZHMqIHRoZSBmb2xpby4gV2l0aCBwcmltYXJ5IG1tdSB0YWJsZSwgcHRlIGVudHJ5
IGlzIAp3cml0YWJsZSBhbmQgX1BBR0VfRElSVFkgaXMgc2V0LCB3aXRoIHNlY29uZGFyeSBtbXUg
dGFibGUoc3RhdGUtMiBQVEUgCnRhYmxlKSwgaXQgaXMgcHRlX25vbmUgc2luY2UgdGhlIGZpbGlv
IGlzIGFjY2Vzc2VkIGF0IGZpcnN0IHRpbWUsIHNvIAp0aGVyZSB3aWxsIGJlIHNsb3cgcGFnZSBm
YXVsdCBwYXRoIGZvciBzdGFnZS0yIG1tdSBwYWdlIHRhYmxlIGZpbGxpbmcuCgpTaW5jZSBpdCBp
cyByZWFkIGZhdWx0LCBzdGFnZS0yIFBURSB3aWxsIGJlIGNyZWF0ZWQgd2l0aCAKX1BBR0VfV1JJ
VEUoY29taW5nIGZyb20gZnVuY3Rpb24gaHZhX3RvX3Bmbl9zbG93KCkpLCBob3dldmVyIF9QQUdF
X0RJUlRZIAppcyBub3Qgc2V0LiBEbyB3ZSBuZWVkIGNhbGwga3ZtX3NldF9wZm5fZGlydHkoKSBh
dCB0aGlzIHNpdHVhdGlvbj8KClJlZ2FyZHMKQmlibyBNYW8KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
