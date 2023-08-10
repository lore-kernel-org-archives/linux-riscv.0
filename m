Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54665C04E69
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 12:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TfptM97IhJ6cY3nn8LwKGcB/YTPswDVZeJa0rMG+PdQ=; b=A5rBxUwSrVGS+3
	r1wawXHKmyLRjlonnFYgYf3JlhwOhkRwUUbzqJzboY9Fres83AcX32SNTuTG8i7y1853ZOmuaT/RZ
	a4xEUer3Gt3Of2PFg+/Uv5FCd3y9DrdmFPbouEAxWCxP9lHWRUsnbASy/f9PGGlek8sX7tlxF+06s
	DLF6StJNUNdg5VdxjQis3xeMVsw0GEtA/bEBAxxjdCOL1nqU3hf/nL5lR63XPfxQnsa6oL2kwMqNW
	gQFlc0gHyc6c4vBGMl1USC24WeUTZrICzITfwY3yI97sVltQDU9im/c6HwDMl7lGx9X+R5EVpvqoG
	fsQGx7an2Scf58LyVuQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU4kF-007arC-25;
	Thu, 10 Aug 2023 12:26:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU4k9-007aon-1X
	for linux-riscv@lists.infradead.org;
	Thu, 10 Aug 2023 12:26:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691670379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mnvMtwrO+HlpCnGD+Ie1TBrDV8keaKNA7WfaJ+XMfts=;
	b=PThITPCV91zKh135syv7wW8rJbf8dZOP8YA3duXGMz/cGQH8wLsvzIULnY53qbPxfYXAQ4
	VbCReSC32+VDIcQWUIeF+V0aIFbQriTeuTyVDPVt+ABPz+SA91wJ2dQRZahBwukOb1lYe5
	HdWHv+GMM4J9VHpzP/dIjUtP0t90SRU=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-360-C7NBmIEdNEibkSdqKZChVw-1; Thu, 10 Aug 2023 08:26:18 -0400
X-MC-Unique: C7NBmIEdNEibkSdqKZChVw-1
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-6871900d991so189272b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Aug 2023 05:26:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691670377; x=1692275177;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mnvMtwrO+HlpCnGD+Ie1TBrDV8keaKNA7WfaJ+XMfts=;
        b=LMsXOGIQIXoVeTIgmN9pXVezGgWfNCm92j1vhmryniR123aVUHqSvyp9sPyrQ+rnMi
         1of4u7y5fdkRE1vS4qoUC7T6KX6KOseG/QUfwswsOLQw2CavfcLIL4LJY2ZD3NMKVz/W
         cIQl7UP0v8OXVfKvxq++1kCaGtF/3/lsgcZ7CxeCdPZMzT8532eoITJebWlqY5vUVQH4
         BDqIMLdifS7YYx4dcHi70I/rB9pXfqYL3/QnP98oLAiDvo9TTYrsuIeVWQ3TIr/dyYIu
         g4KM8lcMjFeQ9aMUqgVHmdAQfVbid+WaiYQykOHE2hV/Dwa9wY3T1XhThIQYoIkJZjch
         Esow==
X-Gm-Message-State: AOJu0YxdfhXhmGWLlG3zYhQuhagFAht2ZDJoRF1IhN79MRa9g/mtCCp6
	cNa78QJKWyk6r50gm6/9E8/TDlg7E2Eat3ZYgyQ8iWiRK3cP8Rmfpmyg/mfYEZ4Jq8gRz/22pXE
	eetOPsLYVar15azANdN35m9DTYl8Y
X-Received: by 2002:a05:6a00:d96:b0:687:874c:7ce0 with SMTP id bf22-20020a056a000d9600b00687874c7ce0mr2463250pfb.1.1691670377124;
        Thu, 10 Aug 2023 05:26:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbuLOrMlEpRqBni5bZEXHe0+/YLy2srme8Tcb0EpGLk+ZLZKJl+h1qsrD5Yo9JHMcHNLUrCg==
X-Received: by 2002:a05:6a00:d96:b0:687:874c:7ce0 with SMTP id bf22-20020a056a000d9600b00687874c7ce0mr2463218pfb.1.1691670376757;
        Thu, 10 Aug 2023 05:26:16 -0700 (PDT)
Received: from [10.72.112.92] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id s11-20020aa78d4b000000b006878f50d071sm1393686pfe.203.2023.08.10.05.26.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Aug 2023 05:26:16 -0700 (PDT)
Message-ID: <30e45ef3-309a-63de-e085-be1645c1be79@redhat.com>
Date: Thu, 10 Aug 2023 20:26:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v8 02/14] KVM: Declare kvm_arch_flush_remote_tlbs()
 globally
To: Raghavendra Rao Ananta <rananta@google.com>, Gavin Shan <gshan@redhat.com>
Cc: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>,
 James Morse <james.morse@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>, Huacai Chen
 <chenhuacai@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Jing Zhang <jingzhangos@google.com>, Reiji Watanabe <reijiw@google.com>,
 Colton Lewis <coltonlewis@google.com>, David Matlack <dmatlack@google.com>,
 Fuad Tabba <tabba@google.com>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-mips@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org
References: <20230808231330.3855936-1-rananta@google.com>
 <20230808231330.3855936-3-rananta@google.com>
 <c33b0518-6e64-7acf-efa8-f404fce1ccac@redhat.com>
 <CAJHc60yCJANBQOizaoSPhEJH9e8a9C6n68x4qdVkOhVZiiWqkw@mail.gmail.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <CAJHc60yCJANBQOizaoSPhEJH9e8a9C6n68x4qdVkOhVZiiWqkw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_052621_590631_1048B712 
X-CRM114-Status: GOOD (  17.03  )
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

CgpPbiA4LzEwLzIzIDAwOjM4LCBSYWdoYXZlbmRyYSBSYW8gQW5hbnRhIHdyb3RlOgo+IEhpIEdh
dmluLAo+IAo+IE9uIFR1ZSwgQXVnIDgsIDIwMjMgYXQgOTowMOKAr1BNIEdhdmluIFNoYW4gPGdz
aGFuQHJlZGhhdC5jb20+IHdyb3RlOgo+Pgo+Pgo+PiBPbiA4LzkvMjMgMDk6MTMsIFJhZ2hhdmVu
ZHJhIFJhbyBBbmFudGEgd3JvdGU6Cj4+PiBUaGVyZSdzIG5vIHJlYXNvbiBmb3IgdGhlIGFyY2hp
dGVjdHVyZXMgdG8gZGVjbGFyZQo+Pj4ga3ZtX2FyY2hfZmx1c2hfcmVtb3RlX3RsYnMoKSBpbiB0
aGVpciBvd24gaGVhZGVycy4gSGVuY2UgdG8KPj4+IGF2b2lkIHRoaXMgZHVwbGljYXRpb24sIG1h
a2UgdGhlIGRlY2xhcmF0aW9uIGdsb2JhbCwgbGVhdmluZwo+Pj4gdGhlIGFyY2hpdGVjdHVyZXMg
dG8gZGVmaW5lIG9ubHkgX19LVk1fSEFWRV9BUkNIX0ZMVVNIX1JFTU9URV9UTEJTCj4+PiBhcyBu
ZWVkZWQuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogUmFnaGF2ZW5kcmEgUmFvIEFuYW50YSA8cmFu
YW50YUBnb29nbGUuY29tPgo+Pj4gLS0tCj4+PiAgICBhcmNoL21pcHMvaW5jbHVkZS9hc20va3Zt
X2hvc3QuaCB8IDEgLQo+Pj4gICAgaW5jbHVkZS9saW51eC9rdm1faG9zdC5oICAgICAgICAgfCAy
ICsrCj4+PiAgICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9hcmNoL21pcHMvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCBi
L2FyY2gvbWlwcy9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCj4+PiBpbmRleCA5YjBhZDhmM2JmMzI3
Li41NGE4NWYxZDRmMmM4IDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9taXBzL2luY2x1ZGUvYXNtL2t2
bV9ob3N0LmgKPj4+ICsrKyBiL2FyY2gvbWlwcy9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCj4+PiBA
QCAtODk3LDYgKzg5Nyw1IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBrdm1fYXJjaF92Y3B1X2Jsb2Nr
aW5nKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkge30KPj4+ICAgIHN0YXRpYyBpbmxpbmUgdm9pZCBr
dm1fYXJjaF92Y3B1X3VuYmxvY2tpbmcoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KSB7fQo+Pj4KPj4+
ICAgICNkZWZpbmUgX19LVk1fSEFWRV9BUkNIX0ZMVVNIX1JFTU9URV9UTEJTCj4+PiAtaW50IGt2
bV9hcmNoX2ZsdXNoX3JlbW90ZV90bGJzKHN0cnVjdCBrdm0gKmt2bSk7Cj4+Pgo+Pj4gICAgI2Vu
ZGlmIC8qIF9fTUlQU19LVk1fSE9TVF9IX18gKi8KPj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xp
bnV4L2t2bV9ob3N0LmggYi9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmgKPj4+IGluZGV4IGUzZjk2
OGIzOGFlOTcuLmFkZTVkNDUwMGMyY2UgMTAwNjQ0Cj4+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L2t2
bV9ob3N0LmgKPj4+ICsrKyBiL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaAo+Pj4gQEAgLTE0ODQs
NiArMTQ4NCw4IEBAIHN0YXRpYyBpbmxpbmUgaW50IGt2bV9hcmNoX2ZsdXNoX3JlbW90ZV90bGJz
KHN0cnVjdCBrdm0gKmt2bSkKPj4+ICAgIHsKPj4+ICAgICAgICByZXR1cm4gLUVOT1RTVVBQOwo+
Pj4gICAgfQo+Pj4gKyNlbHNlCj4+PiAraW50IGt2bV9hcmNoX2ZsdXNoX3JlbW90ZV90bGJzKHN0
cnVjdCBrdm0gKmt2bSk7Cj4+PiAgICAjZW5kaWYKPj4+Cj4+PiAgICAjaWZkZWYgX19LVk1fSEFW
RV9BUkNIX05PTkNPSEVSRU5UX0RNQQo+Pgo+PiBJcyB0aGUgZGVjbGFyYXRpb24gaW5jb25zaXN0
ZW50IHRvIHRoYXQgaW4gYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaD8KPj4gSW4gb3Jk
ZXIgdG8ga2VlcCB0aGVtIGNvbnNpc3RlbnQsIEkgZ3Vlc3Mgd2UgbmVlZCBtb3ZlIGt2bV9hcmNo
X2ZsdXNoX3JlbW90ZV90bGJzKCkKPj4gZnJvbSB4ODYncyBoZWFkZXIgZmlsZSB0byBhcmNoL3g4
Ni9rdm0vbW11L21tdS5jIGFuZCAnaW5saW5lJyBuZWVkcyB0byBiZSBkcm9wcGVkLgo+Pgo+IFVu
c3VyZSBvZiB0aGUgb3JpZ2luYWwgaW50ZW50aW9ucywgSSBkaWRuJ3Qgd2FudCB0byBkaXN0dXJi
IGFueQo+IGV4aXN0aW5nIGFycmFuZ2VtZW50cy4gSWYgbW9yZSBwZW9wbGUgYWdyZWUgdG8gdGhp
cyByZWZhY3RvcmluZywgSSdtCj4gaGFwcHkgdG8gbW92ZS4KClRoaXMgaXMgYW1hemluZyB0byBt
ZS4gVGhpcyBjaGFuZ2UgY2FuIGJlIGNvbXBpbGVkIHdpdGhvdXQgYW55IGVycm9yIApldmVuIGlm
IHRoZSBkZWNsYXJhdGlvbiBpbmNvbnNpc3RlbnQgYmV0d2VlbiB0aGUga3ZtX2hvc3QuaCBhbmQg
eDg2J3MgCmhlYWRlciBmaWxlLgoKSSdtIGN1cmlvdXMgd2hpY2ggb3B0aW9uIG1ha2UgaXQgcG9z
c2libGU/CgpUaGFua3MsClNoYW9xaW4KCj4gCj4gVGhhbmsgeW91Lgo+IFJhZ2hhdmVuZHJhCj4+
IFRoYW5rcywKPj4gR2F2aW4KPj4KPiAKCi0tIApTaGFvcWluCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
