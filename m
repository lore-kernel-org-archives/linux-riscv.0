Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3537AC001B0
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 22:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=WOOcP5UNizPERbsA4P6XY9Y1cWmT2E4bP2Tv2Vl8cmI=; b=DeHF+fb8HI+wPOUjt1VsVmXzzJ
	vh5EC6NX7I5CGHRExzISYzX2s7Go2mde6ceVP2zLxegfswOIHu1vCxs0anu6sGPh06K3BGqgn/5MV
	3e1xn9ioCnixKBNw5kYo14tr1b0F7gOq5rakKpJlwHQaClxpk0BJylVPbdtYoQPknTgZ3k/VY39gp
	GT0CABQWCewQKmXfdYk6eoM+Fe/iWVTE3Y6sdyfHoDKnAO/CrDt+tl5s0G8xWudETo0C/qxIck49m
	2kQ72T1WDUjk6IEyEoJaTJ2i7BPNoxqc1SB3X2X7q0nbJOq2mHYb5aV6x0Fw5czmzz45HanMjvaVB
	epJ8NlZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUE0y-008pPO-09;
	Thu, 10 Aug 2023 22:20:20 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUE0u-008pOg-2p
	for linux-riscv@lists.infradead.org;
	Thu, 10 Aug 2023 22:20:18 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5865afcb825so18191347b3.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Aug 2023 15:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691706015; x=1692310815;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tmBFxKohqxWGeEzlaaidWaFnJW/Oy/RvfXuIqafrWOM=;
        b=6JTyZrfrPMxEB4xAyKq26rEGx6dnOtJemt5mF01prNKQ3cUVfJruc7Fe7RGiRWwnTQ
         JNdckI2vLoo+gqpkJ4Y/rCI2rOTa5hAiAak/2PN2K2x99UdsCwMzOR99izlBg4yxVppk
         dQK8g/hJNDIeks6PwAz/oyY3lHetOC4GBoRbRmdSsLay+vWH0iHE9YncdP80LYWTblDI
         iYMvC5FUjVcDsM/OLHEHwIfhMK0QewWcYKuW2IlqTPX5Otlz706FwBUZ5hXu21vGQIT4
         uYlRsQgCaSIAFf7MMqxoS33uW0RGdAOE21lmj0iEkCe384OiQkcbcQF5CJ0cTVjotCgp
         pMJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691706015; x=1692310815;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tmBFxKohqxWGeEzlaaidWaFnJW/Oy/RvfXuIqafrWOM=;
        b=ElPGxmUaQqkRyBW9eWScHPxDMPL0OYt97vH14UDDzM5TuSCXAI4Rakjdvg6VkVmZdQ
         1jRuLGGz7PAJWQR0nMxOqKtE5+v5Vi3IcHPWinuh6bLQIztDHvCTFN57Fyk2y9DPLSFw
         OQN3v5o/Q71tv6FFKMqaJ/yG7sg1DrV4Fl36n2BZqlmvJevoW2sc+zNjW51Oi0UVCUFY
         HNfIuuZxbhr7jHDsneKwVswkaLdpvoG7/00IXemC3dMDPW1kJMbJ02nLGZvDwvA8dea9
         ZHE3rs3Eq+AqimgmSQsXzxCsQ2DcimvDLK8VR6mfg4ZNJ5BgeomuIoezcb42dAH1r3AE
         EEhg==
X-Gm-Message-State: AOJu0Yz4X6ONJCUicNo0TlKFsL9ips1C3ZBTl1/uuGh5dnvGOUQ0AIAv
	Ue/41Y+sA/CNO7a56tqNXQHdjwPqB2c=
X-Google-Smtp-Source: AGHT+IFA+Eoa7k6dQo7jnaWMJsrKFJ33ryvAj3Q3LxXldo+rT6OtEr7lMPaA/JwDbq8aHQpRj3zalPzAYew=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:709:b0:57a:118a:f31 with SMTP id
 bs9-20020a05690c070900b0057a118a0f31mr4149ywb.7.1691706015047; Thu, 10 Aug
 2023 15:20:15 -0700 (PDT)
Date: Thu, 10 Aug 2023 15:20:13 -0700
In-Reply-To: <CAJHc60x=bhXS3PahuRPwRVdqN4LeX-PBdjdEeCEomhf2YAJ1mw@mail.gmail.com>
Mime-Version: 1.0
References: <20230808231330.3855936-1-rananta@google.com> <20230808231330.3855936-3-rananta@google.com>
 <c33b0518-6e64-7acf-efa8-f404fce1ccac@redhat.com> <CAJHc60yCJANBQOizaoSPhEJH9e8a9C6n68x4qdVkOhVZiiWqkw@mail.gmail.com>
 <30e45ef3-309a-63de-e085-be1645c1be79@redhat.com> <CAJHc60x=bhXS3PahuRPwRVdqN4LeX-PBdjdEeCEomhf2YAJ1mw@mail.gmail.com>
Message-ID: <ZNVfsxdYKu9Nt+j+@google.com>
Subject: Re: [PATCH v8 02/14] KVM: Declare kvm_arch_flush_remote_tlbs() globally
From: Sean Christopherson <seanjc@google.com>
To: Raghavendra Rao Ananta <rananta@google.com>
Cc: Shaoqin Huang <shahuang@redhat.com>, Gavin Shan <gshan@redhat.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Jing Zhang <jingzhangos@google.com>, 
	Reiji Watanabe <reijiw@google.com>, Colton Lewis <coltonlewis@google.com>, 
	David Matlack <dmatlack@google.com>, Fuad Tabba <tabba@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_152016_926071_15389B1F 
X-CRM114-Status: GOOD (  23.89  )
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

T24gVGh1LCBBdWcgMTAsIDIwMjMsIFJhZ2hhdmVuZHJhIFJhbyBBbmFudGEgd3JvdGU6Cj4gT24g
VGh1LCBBdWcgMTAsIDIwMjMgYXQgNToyNuKAr0FNIFNoYW9xaW4gSHVhbmcgPHNoYWh1YW5nQHJl
ZGhhdC5jb20+IHdyb3RlOgo+ID4gT24gOC8xMC8yMyAwMDozOCwgUmFnaGF2ZW5kcmEgUmFvIEFu
YW50YSB3cm90ZToKPiA+ID4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9rdm1faG9zdC5o
IGIvaW5jbHVkZS9saW51eC9rdm1faG9zdC5oCj4gPiA+Pj4gaW5kZXggZTNmOTY4YjM4YWU5Ny4u
YWRlNWQ0NTAwYzJjZSAxMDA2NDQKPiA+ID4+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0
LmgKPiA+ID4+PiArKysgYi9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmgKPiA+ID4+PiBAQCAtMTQ4
NCw2ICsxNDg0LDggQEAgc3RhdGljIGlubGluZSBpbnQga3ZtX2FyY2hfZmx1c2hfcmVtb3RlX3Rs
YnMoc3RydWN0IGt2bSAqa3ZtKQo+ID4gPj4+ICAgIHsKPiA+ID4+PiAgICAgICAgcmV0dXJuIC1F
Tk9UU1VQUDsKPiA+ID4+PiAgICB9Cj4gPiA+Pj4gKyNlbHNlCj4gPiA+Pj4gK2ludCBrdm1fYXJj
aF9mbHVzaF9yZW1vdGVfdGxicyhzdHJ1Y3Qga3ZtICprdm0pOwo+ID4gPj4+ICAgICNlbmRpZgo+
ID4gPj4+Cj4gPiA+Pj4gICAgI2lmZGVmIF9fS1ZNX0hBVkVfQVJDSF9OT05DT0hFUkVOVF9ETUEK
PiA+ID4+Cj4gPiA+PiBJcyB0aGUgZGVjbGFyYXRpb24gaW5jb25zaXN0ZW50IHRvIHRoYXQgaW4g
YXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaD8KPiA+ID4+IEluIG9yZGVyIHRvIGtlZXAg
dGhlbSBjb25zaXN0ZW50LCBJIGd1ZXNzIHdlIG5lZWQgbW92ZSBrdm1fYXJjaF9mbHVzaF9yZW1v
dGVfdGxicygpCj4gPiA+PiBmcm9tIHg4NidzIGhlYWRlciBmaWxlIHRvIGFyY2gveDg2L2t2bS9t
bXUvbW11LmMgYW5kICdpbmxpbmUnIG5lZWRzIHRvIGJlIGRyb3BwZWQuCj4gPiA+Pgo+ID4gPiBV
bnN1cmUgb2YgdGhlIG9yaWdpbmFsIGludGVudGlvbnMsIEkgZGlkbid0IHdhbnQgdG8gZGlzdHVy
YiBhbnkKPiA+ID4gZXhpc3RpbmcgYXJyYW5nZW1lbnRzLiBJZiBtb3JlIHBlb3BsZSBhZ3JlZSB0
byB0aGlzIHJlZmFjdG9yaW5nLCBJJ20KPiA+ID4gaGFwcHkgdG8gbW92ZS4KPiA+Cj4gPiBUaGlz
IGlzIGFtYXppbmcgdG8gbWUuIFRoaXMgY2hhbmdlIGNhbiBiZSBjb21waWxlZCB3aXRob3V0IGFu
eSBlcnJvcgo+ID4gZXZlbiBpZiB0aGUgZGVjbGFyYXRpb24gaW5jb25zaXN0ZW50IGJldHdlZW4g
dGhlIGt2bV9ob3N0LmggYW5kIHg4NidzCj4gPiBoZWFkZXIgZmlsZS4KPiA+Cj4gPiBJJ20gY3Vy
aW91cyB3aGljaCBvcHRpb24gbWFrZSBpdCBwb3NzaWJsZT8KPiA+Cj4gQWZ0ZXIgZG9pbmcgc29t
ZSBleHBlcmltZW50cywgSSB0aGluayBpdCB3b3JrcyBiZWNhdXNlIG9mIHRoZSBvcmRlciBpbgo+
IHdoaWNoIHRoZSBpbmxpbmUtZGVmaW5pdGlvbiBhbmQgdGhlIGRlY2xhcmF0aW9uIGFyZSBsYWlk
IG91dC4gSWYgdGhlCj4gJ2lubGluZScgcGFydCBvZiB0aGUgZnVuY3Rpb24gY29tZXMgZmlyc3Qg
YW5kIHRoZW4gdGhlIGRlY2xhcmF0aW9uLCB3ZQo+IGRvbid0IHNlZSBhbnkgZXJyb3IuIEhvd2V2
ZXIgaWYgdGhlIHBvc2l0aW9ucyB3ZXJlIHJldmVyc2VkLCB3ZSB3b3VsZAo+IHNlZSBhbiBlcnJv
ci4gKEknbSBub3Qgc3VyZSB3aGF0IHRoZSB0ZWNobmljYWwgcmVhc29uIGZvciB0aGlzIGlzKS4K
PiAKPiBKdXN0IHRvIGJlIHNhZmUsIEkgY2FuIG1vdmUgdGhlIGRlZmluaXRpb24gdG8gYXJjaC94
ODYva3ZtL21tdS9tbXUuYwo+IGFzIGEgbm9uLWlubGluZSBmdW5jdGlvbi4KCk5vIG5lZWQsIGFz
bS9rdm1faG9zdC5oIF9tdXN0XyBiZSBpbmNsdWRlZCBiZWZvcmUgdGhlIGRlY2xhcmF0aW9uLCBv
dGhlcndpc2UgdGhlCmRlY2xhcmF0aW9uIHdvdWxkbid0IGJlIG1hZGUgYmVjYXVzZSBfX0tWTV9I
QVZFX0FSQ0hfRkxVU0hfUkVNT1RFX1RMQlMgd291bGRuJ3QKYmUgZGVmaW5lZC4gIEkuZS4gd2Ug
d29uJ3QgcnVuIGludG8gaXNzdWVzIHdoZXJlIHRoZSBub24tc3RhdGljIGRlY2xhcmF0aW9uIGNv
bWVzCmJlZm9yZSB0aGUgc3RhdGljIGlubGluZSBkZWZpbml0aW9uLgoKQzk5IGV4cGxpY2l0bHkg
Y292ZXJzIHRoaXMgY2FzZToKCiAgNi4yLjIgTGlua2FnZXMgb2YgaWRlbnRpZmllcnMKCiAgLi4u
CgogIElmIHRoZSBkZWNsYXJhdGlvbiBvZiBhIGZpbGUgc2NvcGUgaWRlbnRpZmllciBmb3IgYW4g
b2JqZWN0IG9yIGEgZnVuY3Rpb24gY29udGFpbnMgdGhlIHN0b3JhZ2UtCiAgY2xhc3Mgc3BlY2lm
aWVyIHN0YXRpYywgdGhlIGlkZW50aWZpZXIgaGFzIGludGVybmFsIGxpbmthZ2UuCgogIEZvciBh
biBpZGVudGlmaWVyIGRlY2xhcmVkIHdpdGggdGhlIHN0b3JhZ2UtY2xhc3Mgc3BlY2lmaWVyIGV4
dGVybiBpbiBhIHNjb3BlIGluIHdoaWNoIGEKICBwcmlvciBkZWNsYXJhdGlvbiBvZiB0aGF0IGlk
ZW50aWZpZXIgaXMgdmlzaWJsZSBpZiB0aGUgcHJpb3IgZGVjbGFyYXRpb24gc3BlY2lmaWVzIGlu
dGVybmFsIG9yCiAgZXh0ZXJuYWwgbGlua2FnZSwgdGhlIGxpbmthZ2Ugb2YgdGhlIGlkZW50aWZp
ZXIgYXQgdGhlIGxhdGVyIGRlY2xhcmF0aW9uIGlzIHRoZSBzYW1lIGFzIHRoZQogIGxpbmthZ2Ug
c3BlY2lmaWVkIGF0IHRoZSBwcmlvciBkZWNsYXJhdGlvbi4gSWYgbm8gcHJpb3IgZGVjbGFyYXRp
b24gaXMgdmlzaWJsZSwgb3IgaWYgdGhlIHByaW9yCiAgZGVjbGFyYXRpb24gc3BlY2lmaWVzIG5v
IGxpbmthZ2UsIHRoZW4gdGhlIGlkZW50aWZpZXIgaGFzIGV4dGVybmFsIGxpbmthZ2UuCgpJbiBz
aG9ydCwgYmVjYXVzZSB0aGUgInN0YXRpYyBpbmxpbmUiIGRlY2xhcmVkIGludGVybmFsIGxpbmth
Z2UgZmlyc3QsIGl0IHdpbnMuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
