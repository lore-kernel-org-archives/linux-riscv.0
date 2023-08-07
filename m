Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 208FAC001DB
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Aug 2023 04:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=00bSSS+LuuaY0IlUZearKr8nt8Jc0dFKnISZKpR5B8A=; b=EyNQqme4NLKzib
	Rq9vlPjlByOr0mnhU4boVwpoMBtUERbqZ7d4CTtBGpmtzdZs2CQOIHC4MYRh6XIWGZsBKJNEf/71A
	WWoqBFPbcBBTfMsy8UQ8Ag3p4nrIiIyUtbBzc7fW44RqfDJKD+h4Iff83ziD7zmHEi46mocQkEm7V
	XeT8wSj1s+i7aHEmGbrAAuVZHawtZMk42eHsnz9g2eR3S5s+tgflD8DmxbcJzM39RA4AQVetBRkBJ
	TbE4VnUvCAeTD3HoDoG+aLEyZnCOshXpu+aroA8Xn04eTzMq/pCfp/seNNSPQC36zUCdLVMPDLhez
	0R8qZsRcQupdW/biFGdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSrVa-00G6vT-1U;
	Mon, 07 Aug 2023 04:06:18 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSrVY-00G6ts-0B
	for linux-riscv@lists.infradead.org;
	Mon, 07 Aug 2023 04:06:17 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-99bc9e3cbf1so863602266b.0
        for <linux-riscv@lists.infradead.org>; Sun, 06 Aug 2023 21:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1691381174; x=1691985974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vEWPXDn6LTbDwSYJWSCeD5wsbd77oZ0En+w/Ewq960U=;
        b=2oKzq3PvnrlaeNqLKhnUo2MXUv9/MUFGkm3uA4z3oAo6SBKvN7XBZdZXJ28PRMGbGm
         sqWefCy7NX/vo//66AZ0nuIB/WnPHsWNKEyBb42SVIgq95s8L6cIU0+5HSGVwTqLqyDz
         NJq1EpR44emE9nry9CPnlvZwg9sDNDcuR4u5UFnMrGcdL6uLVSrFDrKxkkveDlYQaU4B
         h9WdiRmRjndplp34la+HvmFdwvyI6fkXD7cwuzXnzWzRGsGSISAu4j1HZkev0lfT/1Jj
         pHSerMm6tcuUcU6vmrVPU7e0FxRSBRsmTeyGxtnA3vT8dd1tOgJV03W3vsnCNu/HaP8y
         yFbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691381174; x=1691985974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vEWPXDn6LTbDwSYJWSCeD5wsbd77oZ0En+w/Ewq960U=;
        b=liS4toBYWPXr39PTJ4apvYlgg4Rm5sMQFxudkRqAzW/VrlvGghFns7usA6JOjMMVbo
         p6iQvSYDR/Wi1HZAXxSwPsvbNH05D/TkhPd8o1gAIIo/ZzIuv0e/PwvUvegwZUUzBv2j
         1TFBIOZ7GetHXZHPtbHv5J6G0A+ceGvyC5nY8IEvF8FHn7pTtMH42+jyEU6Q7SqHD6CB
         p3UGqcbHpg/YMFUmILBTFH2Xrl2CDaPeJPHdHAg/NIRQDIEjXdPHIktLQnW/e7oRijcr
         JEPN178EEXCPiESJ6KBw7YaFQEh5k9o2rkX+YLlbI8BpNByHnRUJ5z3ek/8zflexcqJ4
         pZqA==
X-Gm-Message-State: AOJu0YwSwVc9090wfUx/vpA7oBL/0YZxAiNeKm8aTCPJy01ir3UzvDAJ
	Vm2nmjJePyJZTwiV8ypLgSh3tTgpDCjNauFtc3xtyg==
X-Google-Smtp-Source: AGHT+IHkJ8RMNVRzMULpDXQ0KtrFxg5bZylO+ADnFINQziij2vocykBLyKglTdT0sIkr8tWhhF0IS9jMJqoQlJalbxQ=
X-Received: by 2002:a17:907:2ccc:b0:994:1eb4:6896 with SMTP id
 hg12-20020a1709072ccc00b009941eb46896mr6675872ejc.25.1691381174183; Sun, 06
 Aug 2023 21:06:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230722022251.3446223-1-rananta@google.com> <20230722022251.3446223-5-rananta@google.com>
In-Reply-To: <20230722022251.3446223-5-rananta@google.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 7 Aug 2023 09:36:02 +0530
Message-ID: <CAAhSdy3X+vtKHoYhkJ-wQ9g3BWE4Zh9FTim_XoSqXTTLYpQ2hA@mail.gmail.com>
Subject: Re: [PATCH v7 04/12] KVM: Allow range-based TLB invalidation from
 common code
To: Raghavendra Rao Ananta <rananta@google.com>
Cc: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	Atish Patra <atishp@atishpatra.org>, Jing Zhang <jingzhangos@google.com>, 
	Reiji Watanabe <reijiw@google.com>, Colton Lewis <coltonlewis@google.com>, 
	David Matlack <dmatlack@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Gavin Shan <gshan@redhat.com>, Shaoqin Huang <shahuang@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230806_210616_090640_F1C71666 
X-CRM114-Status: GOOD (  20.36  )
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

T24gU2F0LCBKdWwgMjIsIDIwMjMgYXQgNzo1MuKAr0FNIFJhZ2hhdmVuZHJhIFJhbyBBbmFudGEK
PHJhbmFudGFAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBEYXZpZCBNYXRsYWNrIDxkbWF0
bGFja0Bnb29nbGUuY29tPgo+Cj4gTWFrZSBrdm1fZmx1c2hfcmVtb3RlX3RsYnNfcmFuZ2UoKSB2
aXNpYmxlIGluIGNvbW1vbiBjb2RlIGFuZCBjcmVhdGUgYQo+IGRlZmF1bHQgaW1wbGVtZW50YXRp
b24gdGhhdCBqdXN0IGludmFsaWRhdGVzIHRoZSB3aG9sZSBUTEIuCj4KPiBUaGlzIHBhdmVzIHRo
ZSB3YXkgZm9yIHNldmVyYWwgZnV0dXJlIGZlYXR1cmVzL2NsZWFudXBzOgo+Cj4gIC0gSW50cm9k
dWN0aW9uIG9mIHJhbmdlLWJhc2VkIFRMQkkgb24gQVJNLgo+ICAtIEVsaW1pbmF0aW5nIGt2bV9h
cmNoX2ZsdXNoX3JlbW90ZV90bGJzX21lbXNsb3QoKQo+ICAtIE1vdmluZyB0aGUgS1ZNL3g4NiBU
RFAgTU1VIHRvIGNvbW1vbiBjb2RlLgo+Cj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBNYXRsYWNrIDxkbWF0bGFja0Bnb29nbGUuY29tPgo+
IFNpZ25lZC1vZmYtYnk6IFJhZ2hhdmVuZHJhIFJhbyBBbmFudGEgPHJhbmFudGFAZ29vZ2xlLmNv
bT4KPiBSZXZpZXdlZC1ieTogR2F2aW4gU2hhbiA8Z3NoYW5AcmVkaGF0LmNvbT4KPiBSZXZpZXdl
ZC1ieTogU2hhb3FpbiBIdWFuZyA8c2hhaHVhbmdAcmVkaGF0LmNvbT4KCkZvciBLVk0gUklTQy1W
OgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClJlZ2FyZHMs
CkFudXAKCj4gLS0tCj4gIGFyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggfCAgMyArKysK
PiAgYXJjaC94ODYva3ZtL21tdS9tbXUuYyAgICAgICAgICB8ICA5ICsrKystLS0tLQo+ICBhcmNo
L3g4Ni9rdm0vbW11L21tdV9pbnRlcm5hbC5oIHwgIDMgLS0tCj4gIGluY2x1ZGUvbGludXgva3Zt
X2hvc3QuaCAgICAgICAgfCAgOSArKysrKysrKysKPiAgdmlydC9rdm0va3ZtX21haW4uYyAgICAg
ICAgICAgICB8IDEzICsrKysrKysrKysrKysKPiAgNSBmaWxlcyBjaGFuZ2VkLCAyOSBpbnNlcnRp
b25zKCspLCA4IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUv
YXNtL2t2bV9ob3N0LmggYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCj4gaW5kZXgg
YTJkM2NmYzJlYjc1Li4wODkwMGFmYmYyYWQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC94ODYvaW5jbHVk
ZS9hc20va3ZtX2hvc3QuaAo+ICsrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgK
PiBAQCAtMTgwNCw2ICsxODA0LDkgQEAgc3RhdGljIGlubGluZSBpbnQga3ZtX2FyY2hfZmx1c2hf
cmVtb3RlX3RsYnMoc3RydWN0IGt2bSAqa3ZtKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVO
T1RTVVBQOwo+ICB9Cj4KPiArI2RlZmluZSBfX0tWTV9IQVZFX0FSQ0hfRkxVU0hfUkVNT1RFX1RM
QlNfUkFOR0UKPiAraW50IGt2bV9hcmNoX2ZsdXNoX3JlbW90ZV90bGJzX3JhbmdlKHN0cnVjdCBr
dm0gKmt2bSwgZ2ZuX3Qgc3RhcnRfZ2ZuLCB1NjQgcGFnZXMpOwo+ICsKPiAgI2RlZmluZSBrdm1f
YXJjaF9wbWlfaW5fZ3Vlc3QodmNwdSkgXAo+ICAgICAgICAgKCh2Y3B1KSAmJiAodmNwdSktPmFy
Y2guaGFuZGxpbmdfaW50cl9mcm9tX2d1ZXN0KQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2
bS9tbXUvbW11LmMgYi9hcmNoL3g4Ni9rdm0vbW11L21tdS5jCj4gaW5kZXggZWMxNjlmNWM3ZGNl
Li5lYjg4ZDI1Zjk4OTYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC94ODYva3ZtL21tdS9tbXUuYwo+ICsr
KyBiL2FyY2gveDg2L2t2bS9tbXUvbW11LmMKPiBAQCAtMjc4LDE2ICsyNzgsMTUgQEAgc3RhdGlj
IGlubGluZSBib29sIGt2bV9hdmFpbGFibGVfZmx1c2hfcmVtb3RlX3RsYnNfcmFuZ2Uodm9pZCkK
PiAgICAgICAgIHJldHVybiBrdm1feDg2X29wcy5mbHVzaF9yZW1vdGVfdGxic19yYW5nZTsKPiAg
fQo+Cj4gLXZvaWQga3ZtX2ZsdXNoX3JlbW90ZV90bGJzX3JhbmdlKHN0cnVjdCBrdm0gKmt2bSwg
Z2ZuX3Qgc3RhcnRfZ2ZuLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdmbl90
IG5yX3BhZ2VzKQo+ICtpbnQga3ZtX2FyY2hfZmx1c2hfcmVtb3RlX3RsYnNfcmFuZ2Uoc3RydWN0
IGt2bSAqa3ZtLCBnZm5fdCBzdGFydF9nZm4sIHU2NCBwYWdlcykKPiAgewo+ICAgICAgICAgaW50
IHJldCA9IC1FT1BOT1RTVVBQOwo+Cj4gICAgICAgICBpZiAoa3ZtX3g4Nl9vcHMuZmx1c2hfcmVt
b3RlX3RsYnNfcmFuZ2UpCj4gICAgICAgICAgICAgICAgIHJldCA9IHN0YXRpY19jYWxsKGt2bV94
ODZfZmx1c2hfcmVtb3RlX3RsYnNfcmFuZ2UpKGt2bSwgc3RhcnRfZ2ZuLAo+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBu
cl9wYWdlcyk7Cj4gLSAgICAgICBpZiAocmV0KQo+IC0gICAgICAgICAgICAgICBrdm1fZmx1c2hf
cmVtb3RlX3RsYnMoa3ZtKTsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFnZXMpOwo+ICsKPiArICAgICAgIHJldHVy
biByZXQ7Cj4gIH0KPgo+ICBzdGF0aWMgZ2ZuX3Qga3ZtX21tdV9wYWdlX2dldF9nZm4oc3RydWN0
IGt2bV9tbXVfcGFnZSAqc3AsIGludCBpbmRleCk7Cj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2
bS9tbXUvbW11X2ludGVybmFsLmggYi9hcmNoL3g4Ni9rdm0vbW11L21tdV9pbnRlcm5hbC5oCj4g
aW5kZXggZDM5YWY1NjM5Y2U5Li44NmNiODNiYjM0ODAgMTAwNjQ0Cj4gLS0tIGEvYXJjaC94ODYv
a3ZtL21tdS9tbXVfaW50ZXJuYWwuaAo+ICsrKyBiL2FyY2gveDg2L2t2bS9tbXUvbW11X2ludGVy
bmFsLmgKPiBAQCAtMTcwLDkgKzE3MCw2IEBAIGJvb2wga3ZtX21tdV9zbG90X2dmbl93cml0ZV9w
cm90ZWN0KHN0cnVjdCBrdm0gKmt2bSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3Qga3ZtX21lbW9yeV9zbG90ICpzbG90LCB1NjQgZ2ZuLAo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGludCBtaW5fbGV2ZWwpOwo+Cj4gLXZvaWQga3ZtX2Zs
dXNoX3JlbW90ZV90bGJzX3JhbmdlKHN0cnVjdCBrdm0gKmt2bSwgZ2ZuX3Qgc3RhcnRfZ2ZuLAo+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdmbl90IG5yX3BhZ2VzKTsKPiAtCj4g
IC8qIEZsdXNoIHRoZSBnaXZlbiBwYWdlIChodWdlIG9yIG5vdCkgb2YgZ3Vlc3QgbWVtb3J5LiAq
Lwo+ICBzdGF0aWMgaW5saW5lIHZvaWQga3ZtX2ZsdXNoX3JlbW90ZV90bGJzX2dmbihzdHJ1Y3Qg
a3ZtICprdm0sIGdmbl90IGdmbiwgaW50IGxldmVsKQo+ICB7Cj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvbGludXgva3ZtX2hvc3QuaCBiL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaAo+IGluZGV4IGUz
Zjk2OGIzOGFlOS4uYTczMTk2N2IyNGZmIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgva3Zt
X2hvc3QuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaAo+IEBAIC0xMzU5LDYgKzEz
NTksNyBAQCBpbnQga3ZtX3ZjcHVfeWllbGRfdG8oc3RydWN0IGt2bV92Y3B1ICp0YXJnZXQpOwo+
ICB2b2lkIGt2bV92Y3B1X29uX3NwaW4oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBib29sIHlpZWxk
X3RvX2tlcm5lbF9tb2RlKTsKPgo+ICB2b2lkIGt2bV9mbHVzaF9yZW1vdGVfdGxicyhzdHJ1Y3Qg
a3ZtICprdm0pOwo+ICt2b2lkIGt2bV9mbHVzaF9yZW1vdGVfdGxic19yYW5nZShzdHJ1Y3Qga3Zt
ICprdm0sIGdmbl90IGdmbiwgdTY0IHBhZ2VzKTsKPgo+ICAjaWZkZWYgS1ZNX0FSQ0hfTlJfT0JK
U19QRVJfTUVNT1JZX0NBQ0hFCj4gIGludCBrdm1fbW11X3RvcHVwX21lbW9yeV9jYWNoZShzdHJ1
Y3Qga3ZtX21tdV9tZW1vcnlfY2FjaGUgKm1jLCBpbnQgbWluKTsKPiBAQCAtMTQ4Niw2ICsxNDg3
LDE0IEBAIHN0YXRpYyBpbmxpbmUgaW50IGt2bV9hcmNoX2ZsdXNoX3JlbW90ZV90bGJzKHN0cnVj
dCBrdm0gKmt2bSkKPiAgfQo+ICAjZW5kaWYKPgo+ICsjaWZuZGVmIF9fS1ZNX0hBVkVfQVJDSF9G
TFVTSF9SRU1PVEVfVExCU19SQU5HRQo+ICtzdGF0aWMgaW5saW5lIGludCBrdm1fYXJjaF9mbHVz
aF9yZW1vdGVfdGxic19yYW5nZShzdHJ1Y3Qga3ZtICprdm0sCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ2ZuX3QgZ2ZuLCB1NjQgcGFnZXMpCj4g
K3sKPiArICAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsKPiArfQo+ICsjZW5kaWYKPiArCj4gICNp
ZmRlZiBfX0tWTV9IQVZFX0FSQ0hfTk9OQ09IRVJFTlRfRE1BCj4gIHZvaWQga3ZtX2FyY2hfcmVn
aXN0ZXJfbm9uY29oZXJlbnRfZG1hKHN0cnVjdCBrdm0gKmt2bSk7Cj4gIHZvaWQga3ZtX2FyY2hf
dW5yZWdpc3Rlcl9ub25jb2hlcmVudF9kbWEoc3RydWN0IGt2bSAqa3ZtKTsKPiBkaWZmIC0tZ2l0
IGEvdmlydC9rdm0va3ZtX21haW4uYyBiL3ZpcnQva3ZtL2t2bV9tYWluLmMKPiBpbmRleCBkNmIw
NTA3ODYxNTUuLjgwNDQ3MGZjY2FjNyAxMDA2NDQKPiAtLS0gYS92aXJ0L2t2bS9rdm1fbWFpbi5j
Cj4gKysrIGIvdmlydC9rdm0va3ZtX21haW4uYwo+IEBAIC0zNjYsNiArMzY2LDE5IEBAIHZvaWQg
a3ZtX2ZsdXNoX3JlbW90ZV90bGJzKHN0cnVjdCBrdm0gKmt2bSkKPiAgfQo+ICBFWFBPUlRfU1lN
Qk9MX0dQTChrdm1fZmx1c2hfcmVtb3RlX3RsYnMpOwo+Cj4gK3ZvaWQga3ZtX2ZsdXNoX3JlbW90
ZV90bGJzX3JhbmdlKHN0cnVjdCBrdm0gKmt2bSwgZ2ZuX3QgZ2ZuLCB1NjQgcGFnZXMpCj4gK3sK
PiArICAgICAgIGlmICgha3ZtX2FyY2hfZmx1c2hfcmVtb3RlX3RsYnNfcmFuZ2Uoa3ZtLCBnZm4s
IHBhZ2VzKSkKPiArICAgICAgICAgICAgICAgcmV0dXJuOwo+ICsKPiArICAgICAgIC8qCj4gKyAg
ICAgICAgKiBGYWxsIGJhY2sgdG8gYSBmbHVzaGluZyBlbnRpcmUgVExCcyBpZiB0aGUgYXJjaGl0
ZWN0dXJlIHJhbmdlLWJhc2VkCj4gKyAgICAgICAgKiBUTEIgaW52YWxpZGF0aW9uIGlzIHVuc3Vw
cG9ydGVkIG9yIGNhbid0IGJlIHBlcmZvcm1lZCBmb3Igd2hhdGV2ZXIKPiArICAgICAgICAqIHJl
YXNvbi4KPiArICAgICAgICAqLwo+ICsgICAgICAga3ZtX2ZsdXNoX3JlbW90ZV90bGJzKGt2bSk7
Cj4gK30KPiArCj4gIHN0YXRpYyB2b2lkIGt2bV9mbHVzaF9zaGFkb3dfYWxsKHN0cnVjdCBrdm0g
Kmt2bSkKPiAgewo+ICAgICAgICAga3ZtX2FyY2hfZmx1c2hfc2hhZG93X2FsbChrdm0pOwo+IC0t
Cj4gMi40MS4wLjQ4Ny5nNmQ3MmYzZTk5NS1nb29nCj4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
