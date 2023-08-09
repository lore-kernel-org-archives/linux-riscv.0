Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CC3C001B0
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 16:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=74rfwDJbcjZXnqILAbZz8yBxYefyoiqX4vJgFZbJmBI=; b=yH/Qo3SrkDsuYU
	37D2ezTRkQg0RLHQHhoXi0ZJOaVPVRr59qiF01+l+NO+v9EjAzD/1dS52qNKRJLcH/SDOhs88SWLi
	AqgIb49oI7XRtTu67Ngxy1vXICgfYAHE2MBQ+lsr/LKTftcrO7YZIxmHTUaYEX3SwCuYCsyEQncRX
	+WAV1nfU3c5bfaSeBsHGuxZtHUqqVJlWqq+TQEmeO5g0NcKE+5ruuV3S48+OVlRKl13VKqgCv2DZQ
	akt2L16mfcVGP6ymhXn+2uRQRcAMkYI3QjzjSQDlgji6FXokuwRIvDJtrJsNkGRwm/LyL+XJ9gfRX
	+5HvONFv3SFmT5SvcfzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTmDF-005PY0-2E;
	Wed, 09 Aug 2023 16:39:09 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTmDC-005PWR-1r
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 16:39:07 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-4036bd4fff1so4511cf.0
        for <linux-riscv@lists.infradead.org>; Wed, 09 Aug 2023 09:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691599141; x=1692203941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rAabttuUSlISLQ9kur95AJErnuBmKPlF1t5IPI4xLW8=;
        b=QK/Md6pLtQcnNYaG7FaNR8YGO5V1BDDGTN1QNcb5t4M8hyK/g2UzsOCkQFbfYrRiBB
         G0kclZmDhOUC4jPYSDgzil3jq7z68Wq4Y/XsBYF1MGe9Iir+sC7RphbJoMfImBbhq2T/
         pEhwFheHJqKkE6YRXMAxkXUnF8lSNA2TqIGy9iPTw7Y7ze+v2ZO6wVbfvsq9lZ13AZGe
         qcvfeTRsEBx541O+obhMMtIFxCFLknFX2bE3VoAPa0QB2Ao3Loe9vbjMaWTez52X0ZNb
         c1pWu8dZp76+bEISHoUz6Gcb1Dks1IYF1WyX0qZyE1sqGI1eUsOyDxlWzYy0GZ7RrbKU
         pVQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691599141; x=1692203941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rAabttuUSlISLQ9kur95AJErnuBmKPlF1t5IPI4xLW8=;
        b=l72HtoAfDsnr4t11mztSFxCVq2okd5VCPF3mo6sURbp+cRxgXz9LwcLasNoUfY7WuE
         DI1DbhiaeWExVAE9itbVM6n8G4s55B6Z1JjYQ7b6PqBJGlhcOhkG3E1GLLxxuqLIxLFQ
         SDcoI+PSjv3V/4PiZ1/q2dvrkfWnxTdzaxFyWCxE9xMzrrAhhUb/kw5ISeUxxWNp+4/u
         MiViT9Ih+4ln/MNfsvv0WxzjzMw+1fNTTq4et0VniJjaryIO+M8srRf7DvyUApqMOv8L
         nQFhESgxr8zE2t0EvDzi2Y08IRc3zc2HMHR2b2M3f1COSm4uMNbCUbts7rvLbXbdSsDR
         1+WA==
X-Gm-Message-State: AOJu0YwMIb7LfYCiaYRRsNG+8Y95fbgxoqHCMuk+vipuL8N70NnlSLUf
	4Pb1sRrLc37f8B21+RvRta4Qgk01ay2GITuigsd0qw==
X-Google-Smtp-Source: AGHT+IFIKXrr2ilFq3pewZHyAMJbe1zJNw2R6kC9Ag8lwIUUWtSfseAhG7bbTMLUN+5Rf6sXibPKOvlrXvIKI8OeOqU=
X-Received: by 2002:a05:622a:206:b0:3ef:302c:319e with SMTP id
 b6-20020a05622a020600b003ef302c319emr161886qtx.8.1691599141628; Wed, 09 Aug
 2023 09:39:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230808231330.3855936-1-rananta@google.com> <20230808231330.3855936-3-rananta@google.com>
 <c33b0518-6e64-7acf-efa8-f404fce1ccac@redhat.com>
In-Reply-To: <c33b0518-6e64-7acf-efa8-f404fce1ccac@redhat.com>
From: Raghavendra Rao Ananta <rananta@google.com>
Date: Wed, 9 Aug 2023 09:38:49 -0700
Message-ID: <CAJHc60yCJANBQOizaoSPhEJH9e8a9C6n68x4qdVkOhVZiiWqkw@mail.gmail.com>
Subject: Re: [PATCH v8 02/14] KVM: Declare kvm_arch_flush_remote_tlbs() globally
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
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_093906_610696_F4B124C6 
X-CRM114-Status: GOOD (  17.20  )
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

SGkgR2F2aW4sCgpPbiBUdWUsIEF1ZyA4LCAyMDIzIGF0IDk6MDDigK9QTSBHYXZpbiBTaGFuIDxn
c2hhbkByZWRoYXQuY29tPiB3cm90ZToKPgo+Cj4gT24gOC85LzIzIDA5OjEzLCBSYWdoYXZlbmRy
YSBSYW8gQW5hbnRhIHdyb3RlOgo+ID4gVGhlcmUncyBubyByZWFzb24gZm9yIHRoZSBhcmNoaXRl
Y3R1cmVzIHRvIGRlY2xhcmUKPiA+IGt2bV9hcmNoX2ZsdXNoX3JlbW90ZV90bGJzKCkgaW4gdGhl
aXIgb3duIGhlYWRlcnMuIEhlbmNlIHRvCj4gPiBhdm9pZCB0aGlzIGR1cGxpY2F0aW9uLCBtYWtl
IHRoZSBkZWNsYXJhdGlvbiBnbG9iYWwsIGxlYXZpbmcKPiA+IHRoZSBhcmNoaXRlY3R1cmVzIHRv
IGRlZmluZSBvbmx5IF9fS1ZNX0hBVkVfQVJDSF9GTFVTSF9SRU1PVEVfVExCUwo+ID4gYXMgbmVl
ZGVkLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFJhZ2hhdmVuZHJhIFJhbyBBbmFudGEgPHJhbmFu
dGFAZ29vZ2xlLmNvbT4KPiA+IC0tLQo+ID4gICBhcmNoL21pcHMvaW5jbHVkZS9hc20va3ZtX2hv
c3QuaCB8IDEgLQo+ID4gICBpbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmggICAgICAgICB8IDIgKysK
PiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+
Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9taXBzL2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggYi9hcmNo
L21pcHMvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAo+ID4gaW5kZXggOWIwYWQ4ZjNiZjMyNy4uNTRh
ODVmMWQ0ZjJjOCAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvbWlwcy9pbmNsdWRlL2FzbS9rdm1faG9z
dC5oCj4gPiArKysgYi9hcmNoL21pcHMvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAo+ID4gQEAgLTg5
Nyw2ICs4OTcsNSBAQCBzdGF0aWMgaW5saW5lIHZvaWQga3ZtX2FyY2hfdmNwdV9ibG9ja2luZyhz
dHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpIHt9Cj4gPiAgIHN0YXRpYyBpbmxpbmUgdm9pZCBrdm1fYXJj
aF92Y3B1X3VuYmxvY2tpbmcoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KSB7fQo+ID4KPiA+ICAgI2Rl
ZmluZSBfX0tWTV9IQVZFX0FSQ0hfRkxVU0hfUkVNT1RFX1RMQlMKPiA+IC1pbnQga3ZtX2FyY2hf
Zmx1c2hfcmVtb3RlX3RsYnMoc3RydWN0IGt2bSAqa3ZtKTsKPiA+Cj4gPiAgICNlbmRpZiAvKiBf
X01JUFNfS1ZNX0hPU1RfSF9fICovCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9rdm1f
aG9zdC5oIGIvaW5jbHVkZS9saW51eC9rdm1faG9zdC5oCj4gPiBpbmRleCBlM2Y5NjhiMzhhZTk3
Li5hZGU1ZDQ1MDBjMmNlIDEwMDY0NAo+ID4gLS0tIGEvaW5jbHVkZS9saW51eC9rdm1faG9zdC5o
Cj4gPiArKysgYi9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmgKPiA+IEBAIC0xNDg0LDYgKzE0ODQs
OCBAQCBzdGF0aWMgaW5saW5lIGludCBrdm1fYXJjaF9mbHVzaF9yZW1vdGVfdGxicyhzdHJ1Y3Qg
a3ZtICprdm0pCj4gPiAgIHsKPiA+ICAgICAgIHJldHVybiAtRU5PVFNVUFA7Cj4gPiAgIH0KPiA+
ICsjZWxzZQo+ID4gK2ludCBrdm1fYXJjaF9mbHVzaF9yZW1vdGVfdGxicyhzdHJ1Y3Qga3ZtICpr
dm0pOwo+ID4gICAjZW5kaWYKPiA+Cj4gPiAgICNpZmRlZiBfX0tWTV9IQVZFX0FSQ0hfTk9OQ09I
RVJFTlRfRE1BCj4KPiBJcyB0aGUgZGVjbGFyYXRpb24gaW5jb25zaXN0ZW50IHRvIHRoYXQgaW4g
YXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaD8KPiBJbiBvcmRlciB0byBrZWVwIHRoZW0g
Y29uc2lzdGVudCwgSSBndWVzcyB3ZSBuZWVkIG1vdmUga3ZtX2FyY2hfZmx1c2hfcmVtb3RlX3Rs
YnMoKQo+IGZyb20geDg2J3MgaGVhZGVyIGZpbGUgdG8gYXJjaC94ODYva3ZtL21tdS9tbXUuYyBh
bmQgJ2lubGluZScgbmVlZHMgdG8gYmUgZHJvcHBlZC4KPgpVbnN1cmUgb2YgdGhlIG9yaWdpbmFs
IGludGVudGlvbnMsIEkgZGlkbid0IHdhbnQgdG8gZGlzdHVyYiBhbnkKZXhpc3RpbmcgYXJyYW5n
ZW1lbnRzLiBJZiBtb3JlIHBlb3BsZSBhZ3JlZSB0byB0aGlzIHJlZmFjdG9yaW5nLCBJJ20KaGFw
cHkgdG8gbW92ZS4KClRoYW5rIHlvdS4KUmFnaGF2ZW5kcmEKPiBUaGFua3MsCj4gR2F2aW4KPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
