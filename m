Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF34C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2024 19:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=prku8r3Aq+mDYo4pt9gjl4pRl9y3DvU1rgl9wbt4kQ8=; b=AcrbIi64b+1ZBFyiiTBp4fEe8x
	mNiUicXC9JQ6S+RL3iSmiYcb8G+08AmMCJyTuL5wCViHxhIO/ecF2rvcGOi0jbHgaJueMGN+M+hkA
	qosDH1OxuqusjwQrF5uhP3aAM5LwqGkkeRDDf2OIs91vZztN+OedMrbSQ+fSN1I4r9HgzW1ABVxiZ
	wmmPT3mo8H6OT5pzHmjX30t/AkBIuG3nk+h++xUrwYQ5ffcEQwvsG2E9MXFlIfzZYgn/e2Q+/8q9E
	NI+THblcvAhNWgjOdPjNO91+EYRu4QIETWdFlAnWm8/ZlVDRwlxeOVKtgODVNFTv2R1WyaBrVXhnv
	n9uQ0tjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZy0j-00000009sgt-2mvW;
	Fri, 02 Aug 2024 19:32:21 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZy0a-00000009sdu-1Msp
	for linux-riscv@lists.infradead.org;
	Fri, 02 Aug 2024 19:32:14 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2cb685d5987so10521508a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 02 Aug 2024 12:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722627130; x=1723231930; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TTqa7oavJrWkxSTFWtVmMnGsBDrmN4Dgl5PSeoZtRS0=;
        b=qK+csV+A+AF7bZWtakH9Rfx/kKgYZ19CMbJ/tjFre18EtPOdbGmpitpI5NMc4gbEJt
         BFJLIMOZ30WxLjLEvGqTWN5mV3VuWFX/uGPVjbHaHKtefyqi5+Tk83wgkbHG2Dw+PfXP
         +8huhYOayWEZeiS7qN8CxtGtFFNEEqvNpUJ+G+U+rKplS+8TB2MQho2PQFO5SH+q0uIH
         kEBQV+FXhnjT/CcIzKipojL/gbuGlnQLPZ98mW4s59kQgRfty12UGbRvSc+qL3tAdm1J
         iW4O1GcSCtgEA7GX7facql0n5xodq8ikMIz8tbuEn/tD6nug2Y6VS7Q5I0Ft0cq8oxLV
         6y+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722627130; x=1723231930;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TTqa7oavJrWkxSTFWtVmMnGsBDrmN4Dgl5PSeoZtRS0=;
        b=NC9WvaFLiMMo7OBBfN25E6OFd7H3utkp5fQ8J/cKOnM0dkyUW6yQJLtVqsUYBBZx8c
         9EeicpTE4dqrYFG0Owu9JdJtjwXi1bguyIBUUPi+fC8ad6bXFfAKIf5prw07NLGwePuY
         EI5FVpiRKCt3TDRMLbKLNsOZU7HvXxsSec+6WdgQPNJCWquryc5vVTgFPwiNXyww8IH8
         Soyt17UtXbj7PG5CmF5a5IYL2S4FhIXR+Li+zDcM7TgUlikCcJFghcVVjpeq69joOUqn
         +hM7030gE7Ux22C/74i7EqUTjo1dcTWyDdV7gDBqnag6PvZAfGRO7KXysrY77JEjCJC9
         VPMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbld9OCdd7BahYSyprPFeCrOTUwqFZvDs3+w8L3RWQFTCfZ5rOmrEtg0/ivNiywIkAqYGDbnUJr/YS8DXpmksRfhQCgqX39qMDXoKdoeuK
X-Gm-Message-State: AOJu0Yy88w4bjmjiXc4ubh3E0cFaVYL/pkTDEPsAvLbG8AM/KumY+KMC
	FIb1y/9FVdzoLaOCr9jN4w6ImVeSqTUQMfehGNNjNV66Q7/E1/elC/NMaCwb6mZU9wQGN6o/FmZ
	bhw==
X-Google-Smtp-Source: AGHT+IHxpD4UvI3cH5YcMAfSn5X/q5FbzhvcZwiTnoiXfWEKupcq/mKgFqqrl+E4nqq+ftOi/sOAAYuzYXs=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90b:50cf:b0:2c9:61f9:9b27 with SMTP id
 98e67ed59e1d1-2cff9526286mr68117a91.5.1722627130434; Fri, 02 Aug 2024
 12:32:10 -0700 (PDT)
Date: Fri, 2 Aug 2024 12:32:09 -0700
In-Reply-To: <a039b758-d4e3-3798-806f-25bceb2f33a5@loongson.cn>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-65-seanjc@google.com>
 <a039b758-d4e3-3798-806f-25bceb2f33a5@loongson.cn>
Message-ID: <Zq00OYowF5kc9QFE@google.com>
Subject: Re: [PATCH v12 64/84] KVM: LoongArch: Mark "struct page" pfns dirty
 only in "slow" page fault path
From: Sean Christopherson <seanjc@google.com>
To: maobibo <maobibo@loongson.cn>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_123212_445789_57810722 
X-CRM114-Status: GOOD (  19.40  )
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

T24gRnJpLCBBdWcgMDIsIDIwMjQsIG1hb2JpYm8gd3JvdGU6Cj4gT24gMjAyNC83LzI3IOS4iuWN
iDc6NTIsIFNlYW4gQ2hyaXN0b3BoZXJzb24gd3JvdGU6Cj4gPiBNYXJrIHBhZ2VzL2ZvbGlvcyBk
aXJ0eSBvbmx5IHRoZSBzbG93IHBhZ2UgZmF1bHQgcGF0aCwgaS5lLiBvbmx5IHdoZW4KPiA+IG1t
dV9sb2NrIGlzIGhlbGQgYW5kIHRoZSBvcGVyYXRpb24gaXMgbW11X25vdGlmaWVyLXByb3RlY3Rl
ZCwgYXMgbWFya2luZyBhCj4gPiBwYWdlL2ZvbGlvIGRpcnR5IGFmdGVyIGl0IGhhcyBiZWVuIHdy
aXR0ZW4gYmFjayBjYW4gbWFrZSBzb21lIGZpbGVzeXN0ZW1zCj4gPiB1bmhhcHB5IChiYWNraW5n
IEtWTSBndWVzdHMgd2lsbCBzdWNoIGZpbGVzeXN0ZW0gZmlsZXMgaXMgdW5jb21tb24sIGFuZAo+
ID4gdGhlIHJhY2UgaXMgbWludXNjdWxlLCBoZW5jZSB0aGUgbGFjayBvZiBjb21wbGFpbnRzKS4K
PiA+IAo+ID4gU2VlIHRoZSBsaW5rIGJlbG93IGZvciBkZXRhaWxzLgo+ID4gCj4gPiBMaW5rOiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvY292ZXIuMTY4MzA0NDE2Mi5naXQubHN0b2FrZXNA
Z21haWwuY29tCj4gPiBTaWduZWQtb2ZmLWJ5OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNA
Z29vZ2xlLmNvbT4KPiA+IC0tLQo+ID4gICBhcmNoL2xvb25nYXJjaC9rdm0vbW11LmMgfCAxOCAr
KysrKysrKysrLS0tLS0tLS0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyks
IDggZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9hcmNoL2xvb25nYXJjaC9rdm0v
bW11LmMgYi9hcmNoL2xvb25nYXJjaC9rdm0vbW11LmMKPiA+IGluZGV4IDI2MzRhOWU4ZDgyYy4u
MzY0ZGQzNWUwNTU3IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9sb29uZ2FyY2gva3ZtL21tdS5jCj4g
PiArKysgYi9hcmNoL2xvb25nYXJjaC9rdm0vbW11LmMKPiA+IEBAIC02MDgsMTMgKzYwOCwxMyBA
QCBzdGF0aWMgaW50IGt2bV9tYXBfcGFnZV9mYXN0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5z
aWduZWQgbG9uZyBncGEsIGJvb2wgd3JpdAo+ID4gICAJCWlmIChrdm1fcHRlX3lvdW5nKGNoYW5n
ZWQpKQo+ID4gICAJCQlrdm1fc2V0X3Bmbl9hY2Nlc3NlZChwZm4pOwo+ID4gLQkJaWYgKGt2bV9w
dGVfZGlydHkoY2hhbmdlZCkpIHsKPiA+IC0JCQltYXJrX3BhZ2VfZGlydHkoa3ZtLCBnZm4pOwo+
ID4gLQkJCWt2bV9zZXRfcGZuX2RpcnR5KHBmbik7Cj4gPiAtCQl9Cj4gPiAgIAkJaWYgKHBhZ2Up
Cj4gPiAgIAkJCXB1dF9wYWdlKHBhZ2UpOwo+ID4gICAJfQo+ID4gKwo+ID4gKwlpZiAoa3ZtX3B0
ZV9kaXJ0eShjaGFuZ2VkKSkKPiA+ICsJCW1hcmtfcGFnZV9kaXJ0eShrdm0sIGdmbik7Cj4gPiAr
Cj4gPiAgIAlyZXR1cm4gcmV0Owo+ID4gICBvdXQ6Cj4gPiAgIAlzcGluX3VubG9jaygma3ZtLT5t
bXVfbG9jayk7Cj4gPiBAQCAtOTE1LDEyICs5MTUsMTQgQEAgc3RhdGljIGludCBrdm1fbWFwX3Bh
Z2Uoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIGdwYSwgYm9vbCB3cml0ZSkK
PiA+ICAgCWVsc2UKPiA+ICAgCQkrK2t2bS0+c3RhdC5wYWdlczsKPiA+ICAgCWt2bV9zZXRfcHRl
KHB0ZXAsIG5ld19wdGUpOwo+ID4gLQlzcGluX3VubG9jaygma3ZtLT5tbXVfbG9jayk7Cj4gPiAt
CWlmIChwcm90X2JpdHMgJiBfUEFHRV9ESVJUWSkgewo+ID4gLQkJbWFya19wYWdlX2RpcnR5X2lu
X3Nsb3Qoa3ZtLCBtZW1zbG90LCBnZm4pOwo+ID4gKwlpZiAod3JpdGVhYmxlKQo+IElzIGl0IGJl
dHRlciB0byB1c2Ugd3JpdGUgb3IgKHByb3RfYml0cyAmIF9QQUdFX0RJUlRZKSBoZXJlPyAgd3Jp
dGFibGUgaXMKPiBwdGUgcGVybWlzc2lvbiBmcm9tIGZ1bmN0aW9uIGh2YV90b19wZm5fc2xvdygp
LCB3cml0ZSBpcyBmYXVsdCBhY3Rpb24uCgpNYXJraW5nIGZvbGlvcyBkaXJ0eSBpbiB0aGUgc2xv
dy9mdWxsIHBhdGggYmFzaWNhbGx5IG5lY2Vzc2l0YXRlcyBtYXJraW5nIHRoZQpmb2xpbyBkaXJ0
eSBpZiBLVk0gY3JlYXRlcyBhIHdyaXRhYmxlIFNQVEUsIGFzIEtWTSB3b24ndCBtYXJrIHRoZSBm
b2xpbyBkaXJ0eQppZi93aGVuIF9QQUdFX0RJUlRZIGlzIHNldC4KClByYWN0aWNhbGx5IHNwZWFr
aW5nLCBJJ20gOTkuOSUgY2VydGFpbiBpdCBkb2Vzbid0IG1hdHRlci4gIFRoZSBmb2xpbyBpcyBt
YXJrZWQKZGlydHkgYnkgY29yZSBNTSB3aGVuIHRoZSBmb2xpbyBpcyBtYWRlIHdyaXRhYmxlLCBh
bmQgY2xlYW5pbmcgdGhlIGZvbGlvIHRyaWdnZXJzCmFuIG1tdV9ub3RpZmllciBpbnZhbGlkYXRp
b24uICBJLmUuIGlmIHRoZSBwYWdlIGlzIG1hcHBlZCB3cml0YWJsZSBpbiBLVk0ncwpzdGFnZS0y
IFBURXMsIHRoZW4gaXRzIGZvbGlvIGhhcyBhbHJlYWR5IGJlZW4gbWFya2VkIGRpcnR5LgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
