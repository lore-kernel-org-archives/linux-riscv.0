Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBFCCC001E0
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 16:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=18SoPxRm/cj6BT7nVm2p1eTK+n0JhxIXqfPEwiOYrdw=; b=xu9GUiPFrTKon0
	JDfe9CDTKs827fvC5ZHqJZoYMmNiNkfZckslfFGvAy6NR2N5KvOyN9MQFiT0gtJpJXZzVdCxpTmr2
	SbQK2s+rPpfVpO4AMcfXHbRST0KHqxQKJO4r5V8vLobovEQheNHI3clts4kh7vZsHGpqTKfY7izGa
	XHsXGzJXNKAKo7Aks2Cd2L+6oIVTk1Os44VD1knGLq/fJ6PnD3Z2HT5u+ybyq/9hBh/MXsCDevOXM
	/S45fhwiGkOm4yeFEG+7sP2OmEH9Cu4yQaQZh97+l6g+vn+2zoEpxXxfXR8KOZqRPKRJjdN1AbmPD
	X9r3x/7jhi8tlvrMTlww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTmG5-005Pss-1B;
	Wed, 09 Aug 2023 16:42:05 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTmG1-005Pq8-2S
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 16:42:03 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-40a47e8e38dso309741cf.1
        for <linux-riscv@lists.infradead.org>; Wed, 09 Aug 2023 09:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691599317; x=1692204117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lPf4XGOX6Yz3caGFLI4HNiFX/4urner6v/ltX/ESS/0=;
        b=M8NqHm95x4nGnCdrVnscaqRXS4zv1xJk+mKi6qhzpoV0xAgedW8xKK1WrktthW+/qX
         b79Rjw1HWdoTj0bfrzxyYngD13WhEXYtTDNUTB4Nwp3syn4yn8vOXHVKklDeZcJZpc9o
         GDICgnZbUUQ4VwPvxkozg6ZrzrsWy820TbFiNBjvXSnVlLga3PusimdxiUHWSrjmgq9M
         YMKKBcxudeH5NygCy+Ei5czOibqi8SOG3nDIHx+h0cIT0Z9F1Ff0QOjnl3TwU7bKPVG3
         fESF+gvCoCtyd47weuYbH5uFlwg9LfCAVKAGmtq8i8np6ERRNhFQ4wt4KpNnlYCunDKT
         NTyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691599317; x=1692204117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lPf4XGOX6Yz3caGFLI4HNiFX/4urner6v/ltX/ESS/0=;
        b=HCiOxyEI2OitxI+w+k6kgYPm+fMzDdEkuHpvSRu6lnr8DNW3oseWCJKMWSrvnh/VZq
         pygwLi0ewJ/V3GMWZgQvsiH86kS8SydMSnWUyJXrwficZ+ELL97ObmkkcN/PZQu2HRzo
         z6SewVB05erF86skR8AsXoy8qfNsuVY+Wal7j/o0b+2Pd525YlHUlwBs1XNYHlJFS7AN
         ivva+iWUk5uMZ15EoxbxW/ZvN8R0NJ+MhIFyDmlov+j6KqJ1xYsC+JYaawt4lckiyZzh
         9BX4BGlhFKk65/KQ4UQ9amVZr2EZA00p+zPZcwjWXBg0lWmo0RBp0Tg7zgaVqPPXBJIJ
         Zqnw==
X-Gm-Message-State: AOJu0YzYGqcYbY8WGbc49cbsCD5lcVkpIkPG330m1MSRvajUZHGbLyBV
	AKLN6TdoSmfkn4TdH4lLmQJYd9YN8grSbmT8tdmfjQ==
X-Google-Smtp-Source: AGHT+IEasKjYjirTCPg/lhza9bQPF4rYp5ejx4/QKjY7XilhifZ9KFaFlpeH95SrDC1XV+HGwPF+ASFIZPAlqAB/AME=
X-Received: by 2002:ac8:5dc9:0:b0:3f5:2006:50f1 with SMTP id
 e9-20020ac85dc9000000b003f5200650f1mr133814qtx.12.1691599316808; Wed, 09 Aug
 2023 09:41:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230808231330.3855936-1-rananta@google.com> <20230808231330.3855936-6-rananta@google.com>
 <15975205-6161-d54b-fe40-805a16b0cb27@redhat.com>
In-Reply-To: <15975205-6161-d54b-fe40-805a16b0cb27@redhat.com>
From: Raghavendra Rao Ananta <rananta@google.com>
Date: Wed, 9 Aug 2023 09:41:44 -0700
Message-ID: <CAJHc60xk1ZAw-44FG7CDbAGPMUSnAmZ3LxMPGcQ0RPBcenHrig@mail.gmail.com>
Subject: Re: [PATCH v8 05/14] KVM: Allow range-based TLB invalidation from
 common code
To: Gavin Shan <gshan@redhat.com>
Cc: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Jing Zhang <jingzhangos@google.com>, Reiji Watanabe <reijiw@google.com>, 
	Colton Lewis <coltonlewis@google.com>, David Matlack <dmatlack@google.com>, 
	Fuad Tabba <tabba@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Shaoqin Huang <shahuang@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_094201_800149_1476450B 
X-CRM114-Status: GOOD (  25.14  )
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

T24gVHVlLCBBdWcgOCwgMjAyMyBhdCAxMTowOeKAr1BNIEdhdmluIFNoYW4gPGdzaGFuQHJlZGhh
dC5jb20+IHdyb3RlOgo+Cj4gT24gOC85LzIzIDA5OjEzLCBSYWdoYXZlbmRyYSBSYW8gQW5hbnRh
IHdyb3RlOgo+ID4gRnJvbTogRGF2aWQgTWF0bGFjayA8ZG1hdGxhY2tAZ29vZ2xlLmNvbT4KPiA+
Cj4gPiBNYWtlIGt2bV9mbHVzaF9yZW1vdGVfdGxic19yYW5nZSgpIHZpc2libGUgaW4gY29tbW9u
IGNvZGUgYW5kIGNyZWF0ZSBhCj4gPiBkZWZhdWx0IGltcGxlbWVudGF0aW9uIHRoYXQganVzdCBp
bnZhbGlkYXRlcyB0aGUgd2hvbGUgVExCLgo+ID4KPiA+IFRoaXMgcGF2ZXMgdGhlIHdheSBmb3Ig
c2V2ZXJhbCBmdXR1cmUgZmVhdHVyZXMvY2xlYW51cHM6Cj4gPgo+ID4gICAtIEludHJvZHVjdGlv
biBvZiByYW5nZS1iYXNlZCBUTEJJIG9uIEFSTS4KPiA+ICAgLSBFbGltaW5hdGluZyBrdm1fYXJj
aF9mbHVzaF9yZW1vdGVfdGxic19tZW1zbG90KCkKPiA+ICAgLSBNb3ZpbmcgdGhlIEtWTS94ODYg
VERQIE1NVSB0byBjb21tb24gY29kZS4KPiA+Cj4gPiBObyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRl
bmRlZC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBNYXRsYWNrIDxkbWF0bGFja0Bnb29n
bGUuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogUmFnaGF2ZW5kcmEgUmFvIEFuYW50YSA8cmFuYW50
YUBnb29nbGUuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IEdhdmluIFNoYW4gPGdzaGFuQHJlZGhhdC5j
b20+Cj4gPiBSZXZpZXdlZC1ieTogU2hhb3FpbiBIdWFuZyA8c2hhaHVhbmdAcmVkaGF0LmNvbT4K
PiA+IFJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgo+ID4gLS0t
Cj4gPiAgIGFyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggfCAgMiArKwo+ID4gICBhcmNo
L3g4Ni9rdm0vbW11L21tdS5jICAgICAgICAgIHwgIDggKysrKy0tLS0KPiA+ICAgYXJjaC94ODYv
a3ZtL21tdS9tbXVfaW50ZXJuYWwuaCB8ICAzIC0tLQo+ID4gICBpbmNsdWRlL2xpbnV4L2t2bV9o
b3N0LmggICAgICAgIHwgMTIgKysrKysrKysrKysrCj4gPiAgIHZpcnQva3ZtL2t2bV9tYWluLmMg
ICAgICAgICAgICAgfCAxMyArKysrKysrKysrKysrCj4gPiAgIDUgZmlsZXMgY2hhbmdlZCwgMzEg
aW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC94
ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0
LmgKPiA+IGluZGV4IGEyZDNjZmMyZWI3NWMuLmI1NDdkMTdjNThmNjMgMTAwNjQ0Cj4gPiAtLS0g
YS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCj4gPiArKysgYi9hcmNoL3g4Ni9pbmNs
dWRlL2FzbS9rdm1faG9zdC5oCj4gPiBAQCAtMTgwNCw2ICsxODA0LDggQEAgc3RhdGljIGlubGlu
ZSBpbnQga3ZtX2FyY2hfZmx1c2hfcmVtb3RlX3RsYnMoc3RydWN0IGt2bSAqa3ZtKQo+ID4gICAg
ICAgICAgICAgICByZXR1cm4gLUVOT1RTVVBQOwo+ID4gICB9Cj4gPgo+ID4gKyNkZWZpbmUgX19L
Vk1fSEFWRV9BUkNIX0ZMVVNIX1JFTU9URV9UTEJTX1JBTkdFCj4gPiArCj4gPiAgICNkZWZpbmUg
a3ZtX2FyY2hfcG1pX2luX2d1ZXN0KHZjcHUpIFwKPiA+ICAgICAgICgodmNwdSkgJiYgKHZjcHUp
LT5hcmNoLmhhbmRsaW5nX2ludHJfZnJvbV9ndWVzdCkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJj
aC94ODYva3ZtL21tdS9tbXUuYyBiL2FyY2gveDg2L2t2bS9tbXUvbW11LmMKPiA+IGluZGV4IGVj
MTY5ZjVjN2RjZTIuLjZhZGJlNmM4NzA5ODIgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3g4Ni9rdm0v
bW11L21tdS5jCj4gPiArKysgYi9hcmNoL3g4Ni9rdm0vbW11L21tdS5jCj4gPiBAQCAtMjc4LDE2
ICsyNzgsMTYgQEAgc3RhdGljIGlubGluZSBib29sIGt2bV9hdmFpbGFibGVfZmx1c2hfcmVtb3Rl
X3RsYnNfcmFuZ2Uodm9pZCkKPiA+ICAgICAgIHJldHVybiBrdm1feDg2X29wcy5mbHVzaF9yZW1v
dGVfdGxic19yYW5nZTsKPiA+ICAgfQo+ID4KPiA+IC12b2lkIGt2bV9mbHVzaF9yZW1vdGVfdGxi
c19yYW5nZShzdHJ1Y3Qga3ZtICprdm0sIGdmbl90IHN0YXJ0X2dmbiwKPiA+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBnZm5fdCBucl9wYWdlcykKPiA+ICtpbnQga3ZtX2FyY2hfZmx1
c2hfcmVtb3RlX3RsYnNfcmFuZ2Uoc3RydWN0IGt2bSAqa3ZtLCBnZm5fdCBzdGFydF9nZm4sCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1NjQgbnJfcGFnZXMpCj4gPiAg
IHsKPiA+ICAgICAgIGludCByZXQgPSAtRU9QTk9UU1VQUDsKPiA+Cj4gPiAgICAgICBpZiAoa3Zt
X3g4Nl9vcHMuZmx1c2hfcmVtb3RlX3RsYnNfcmFuZ2UpCj4gPiAgICAgICAgICAgICAgIHJldCA9
IHN0YXRpY19jYWxsKGt2bV94ODZfZmx1c2hfcmVtb3RlX3RsYnNfcmFuZ2UpKGt2bSwgc3RhcnRf
Z2ZuLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBucl9wYWdlcyk7Cj4gPiAtICAgICBpZiAocmV0KQo+ID4gLSAgICAg
ICAgICAgICBrdm1fZmx1c2hfcmVtb3RlX3RsYnMoa3ZtKTsKPiA+ICsKPiA+ICsgICAgIHJldHVy
biByZXQ7Cj4gPiAgIH0KPiA+Cj4KPiBJIGd1ZXNzIEBzdGFydF9nZm4gY2FuIGJlIHJlbmFtZWQg
dG8gQGdmbiwgdG8gYmUgY29uc2lzdGVudCB3aXRoIGl0cyBkZWNsYXJhdGlvbgo+IGluIGluY2x1
ZGUvbGludXgva3ZtX2hvc3QuaCBhbmQgc3RydWN0IGt2bV94ODZfb3BzOjpmbHVzaF9yZW1vdGVf
dGxic19yYW5nZSgpCj4KT2gsIHllcy4gSSdsbCBjb25zaWRlciB0aGlzIGNoYW5nZSBmb3Igdjkg
KGlmIHRoZXJlIGFyZSBlbm91Z2ggY2hhbmdlcwphbmQgd2UgcGxhbiB0byBwdXNoIG9uZSkuCgpU
aGFuayB5b3UuClJhZ2hhdmVuZHJhCgo+ID4gICBzdGF0aWMgZ2ZuX3Qga3ZtX21tdV9wYWdlX2dl
dF9nZm4oc3RydWN0IGt2bV9tbXVfcGFnZSAqc3AsIGludCBpbmRleCk7Cj4gPiBkaWZmIC0tZ2l0
IGEvYXJjaC94ODYva3ZtL21tdS9tbXVfaW50ZXJuYWwuaCBiL2FyY2gveDg2L2t2bS9tbXUvbW11
X2ludGVybmFsLmgKPiA+IGluZGV4IGQzOWFmNTYzOWNlOTcuLjg2Y2I4M2JiMzQ4MDQgMTAwNjQ0
Cj4gPiAtLS0gYS9hcmNoL3g4Ni9rdm0vbW11L21tdV9pbnRlcm5hbC5oCj4gPiArKysgYi9hcmNo
L3g4Ni9rdm0vbW11L21tdV9pbnRlcm5hbC5oCj4gPiBAQCAtMTcwLDkgKzE3MCw2IEBAIGJvb2wg
a3ZtX21tdV9zbG90X2dmbl93cml0ZV9wcm90ZWN0KHN0cnVjdCBrdm0gKmt2bSwKPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qga3ZtX21lbW9yeV9zbG90ICpzbG90
LCB1NjQgZ2ZuLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCBtaW5f
bGV2ZWwpOwo+ID4KPiA+IC12b2lkIGt2bV9mbHVzaF9yZW1vdGVfdGxic19yYW5nZShzdHJ1Y3Qg
a3ZtICprdm0sIGdmbl90IHN0YXJ0X2dmbiwKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBnZm5fdCBucl9wYWdlcyk7Cj4gPiAtCj4gPiAgIC8qIEZsdXNoIHRoZSBnaXZlbiBwYWdl
IChodWdlIG9yIG5vdCkgb2YgZ3Vlc3QgbWVtb3J5LiAqLwo+ID4gICBzdGF0aWMgaW5saW5lIHZv
aWQga3ZtX2ZsdXNoX3JlbW90ZV90bGJzX2dmbihzdHJ1Y3Qga3ZtICprdm0sIGdmbl90IGdmbiwg
aW50IGxldmVsKQo+ID4gICB7Cj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9rdm1faG9z
dC5oIGIvaW5jbHVkZS9saW51eC9rdm1faG9zdC5oCj4gPiBpbmRleCBhZGU1ZDQ1MDBjMmNlLi5m
MGJlNWQ5YzM3ZGQxIDEwMDY0NAo+ID4gLS0tIGEvaW5jbHVkZS9saW51eC9rdm1faG9zdC5oCj4g
PiArKysgYi9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmgKPiA+IEBAIC0xMzU5LDYgKzEzNTksNyBA
QCBpbnQga3ZtX3ZjcHVfeWllbGRfdG8oc3RydWN0IGt2bV92Y3B1ICp0YXJnZXQpOwo+ID4gICB2
b2lkIGt2bV92Y3B1X29uX3NwaW4oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBib29sIHlpZWxkX3Rv
X2tlcm5lbF9tb2RlKTsKPiA+Cj4gPiAgIHZvaWQga3ZtX2ZsdXNoX3JlbW90ZV90bGJzKHN0cnVj
dCBrdm0gKmt2bSk7Cj4gPiArdm9pZCBrdm1fZmx1c2hfcmVtb3RlX3RsYnNfcmFuZ2Uoc3RydWN0
IGt2bSAqa3ZtLCBnZm5fdCBnZm4sIHU2NCBucl9wYWdlcyk7Cj4gPgo+ID4gICAjaWZkZWYgS1ZN
X0FSQ0hfTlJfT0JKU19QRVJfTUVNT1JZX0NBQ0hFCj4gPiAgIGludCBrdm1fbW11X3RvcHVwX21l
bW9yeV9jYWNoZShzdHJ1Y3Qga3ZtX21tdV9tZW1vcnlfY2FjaGUgKm1jLCBpbnQgbWluKTsKPiA+
IEBAIC0xNDg4LDYgKzE0ODksMTcgQEAgc3RhdGljIGlubGluZSBpbnQga3ZtX2FyY2hfZmx1c2hf
cmVtb3RlX3RsYnMoc3RydWN0IGt2bSAqa3ZtKQo+ID4gICBpbnQga3ZtX2FyY2hfZmx1c2hfcmVt
b3RlX3RsYnMoc3RydWN0IGt2bSAqa3ZtKTsKPiA+ICAgI2VuZGlmCj4gPgo+ID4gKyNpZm5kZWYg
X19LVk1fSEFWRV9BUkNIX0ZMVVNIX1JFTU9URV9UTEJTX1JBTkdFCj4gPiArc3RhdGljIGlubGlu
ZSBpbnQga3ZtX2FyY2hfZmx1c2hfcmVtb3RlX3RsYnNfcmFuZ2Uoc3RydWN0IGt2bSAqa3ZtLAo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnZm5f
dCBnZm4sIHU2NCBucl9wYWdlcykKPiA+ICt7Cj4gPiArICAgICByZXR1cm4gLUVPUE5PVFNVUFA7
Cj4gPiArfQo+ID4gKyNlbHNlCj4gPiAraW50IGt2bV9hcmNoX2ZsdXNoX3JlbW90ZV90bGJzX3Jh
bmdlKHN0cnVjdCBrdm0gKmt2bSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGdmbl90IGdmbiwgdTY0IG5yX3BhZ2VzKTsKPiA+ICsjZW5kaWYKPiA+ICsKPiA+ICAgI2lm
ZGVmIF9fS1ZNX0hBVkVfQVJDSF9OT05DT0hFUkVOVF9ETUEKPiA+ICAgdm9pZCBrdm1fYXJjaF9y
ZWdpc3Rlcl9ub25jb2hlcmVudF9kbWEoc3RydWN0IGt2bSAqa3ZtKTsKPiA+ICAgdm9pZCBrdm1f
YXJjaF91bnJlZ2lzdGVyX25vbmNvaGVyZW50X2RtYShzdHJ1Y3Qga3ZtICprdm0pOwo+ID4gZGlm
ZiAtLWdpdCBhL3ZpcnQva3ZtL2t2bV9tYWluLmMgYi92aXJ0L2t2bS9rdm1fbWFpbi5jCj4gPiBp
bmRleCBkNmIwNTA3ODYxNTUwLi4yNmU5MTAwMGY1NzlkIDEwMDY0NAo+ID4gLS0tIGEvdmlydC9r
dm0va3ZtX21haW4uYwo+ID4gKysrIGIvdmlydC9rdm0va3ZtX21haW4uYwo+ID4gQEAgLTM2Niw2
ICszNjYsMTkgQEAgdm9pZCBrdm1fZmx1c2hfcmVtb3RlX3RsYnMoc3RydWN0IGt2bSAqa3ZtKQo+
ID4gICB9Cj4gPiAgIEVYUE9SVF9TWU1CT0xfR1BMKGt2bV9mbHVzaF9yZW1vdGVfdGxicyk7Cj4g
Pgo+ID4gK3ZvaWQga3ZtX2ZsdXNoX3JlbW90ZV90bGJzX3JhbmdlKHN0cnVjdCBrdm0gKmt2bSwg
Z2ZuX3QgZ2ZuLCB1NjQgbnJfcGFnZXMpCj4gPiArewo+ID4gKyAgICAgaWYgKCFrdm1fYXJjaF9m
bHVzaF9yZW1vdGVfdGxic19yYW5nZShrdm0sIGdmbiwgbnJfcGFnZXMpKQo+ID4gKyAgICAgICAg
ICAgICByZXR1cm47Cj4gPiArCj4gPiArICAgICAvKgo+ID4gKyAgICAgICogRmFsbCBiYWNrIHRv
IGEgZmx1c2hpbmcgZW50aXJlIFRMQnMgaWYgdGhlIGFyY2hpdGVjdHVyZSByYW5nZS1iYXNlZAo+
ID4gKyAgICAgICogVExCIGludmFsaWRhdGlvbiBpcyB1bnN1cHBvcnRlZCBvciBjYW4ndCBiZSBw
ZXJmb3JtZWQgZm9yIHdoYXRldmVyCj4gPiArICAgICAgKiByZWFzb24uCj4gPiArICAgICAgKi8K
PiA+ICsgICAgIGt2bV9mbHVzaF9yZW1vdGVfdGxicyhrdm0pOwo+ID4gK30KPiA+ICsKPiA+ICAg
c3RhdGljIHZvaWQga3ZtX2ZsdXNoX3NoYWRvd19hbGwoc3RydWN0IGt2bSAqa3ZtKQo+ID4gICB7
Cj4gPiAgICAgICBrdm1fYXJjaF9mbHVzaF9zaGFkb3dfYWxsKGt2bSk7Cj4KPiBUaGFua3MsCj4g
R2F2aW4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
