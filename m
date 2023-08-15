Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D66B0C04E69
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 17:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m8msZyEIuUaN/JxOUeZhWxzOTicXKgcI1SjmPJgXYZ8=; b=M0hpRijrmy9wcT
	mVdnE+a6JZSEJ60Pavt3e/gpEeOi0wEwJ3NHN/2aZNKW/1MaMNxfzlPj+4zVE8Ukp0JsIb4s8hmjP
	PRnYyXGBiegjAaeWAzozU50D/J5J2fh2+Sgmz4kzxz4VIIiGKFkrPCr7fyOkbPf4ASGkK1HYx87f1
	ow85SGuX05+v95YhK9p97LtJ5Z1HcwB/Joufl5VLn/Yogi1aCrF0c34GYNj3+KjR8l1lZbG04Fv/e
	jAJAHBT9i0AR19MJbKnK7KgE79CEIQ86QYMmTG3QtDhhUC3xdMqZ2fyC2mBvSKEqT7mzforVC1U85
	TGd1gdSGHIIGXiL5UHCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVxZg-00233H-1g;
	Tue, 15 Aug 2023 17:11:20 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVxZc-00231T-2Q
	for linux-riscv@lists.infradead.org;
	Tue, 15 Aug 2023 17:11:18 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-40a47e8e38dso12811cf.1
        for <linux-riscv@lists.infradead.org>; Tue, 15 Aug 2023 10:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692119475; x=1692724275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VjU1cPGHPErz26GfxK/V2Y6QQnaVBfBoHVJffwhAgeg=;
        b=OkID7iHXzv+hD+tKR8T6YOXxoIXliF3W34NUBxDaFcmljCtGa4UoyiTKJr8D/Tqe60
         twt1hBEnODfYIcEtDbVnm54kA0lIiilXkx9/J9jQrHX5X/XhOJQ7UdJ3uclpwKIqOirD
         Nz+BaBpxqO9GVtg0Nf9FtqfKgA5MSX6L6ZpkqwrGirkV/80R7EjnEy3vAejyJrvzENi/
         tBF0sSeWY68NphfTowZ3duiS82ZwwGD9DYGMlv24ihtwu4rin3c/EbsSxVYNJXnuceR1
         sl4g7UKfuObykb/yzYDT2NhA5VP8HNK+onSuMDL7WMvns54M1ica33zsia1c0sn9ISDX
         ebGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692119475; x=1692724275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VjU1cPGHPErz26GfxK/V2Y6QQnaVBfBoHVJffwhAgeg=;
        b=eXDUZWrTQZRSQv6/l0uQVBZFdGVobw+HbKIMYYkz2GuKrHjtlg3IJAEbBU0wcs5vsi
         +Yizxm+EyZ269EpdBtuWIQSaTiMU+nB9fLf6vcZ2n0VPE6s0MC+gL7fRtg6cxDMyIFKB
         3/krMjsB6JNaGunqmWVvOz1Hasji70oHT/fUVg1N1eVH0F0bbJIwTSlspasmMc4Zkcfu
         2OYgnpmfrbIRQCyiePCIBCLL9lhWfuZHrbJXqh73otbagsrUl3/T5eBexZU9VsioE64z
         fy4yB+taJI4OfvGkEod5IWK4nABctDPSEK+w3sdR5CvIM16e7YwOPiaMbURf37MuypKf
         ovYw==
X-Gm-Message-State: AOJu0Yw14MLtQFFYE0vqXZEDDEgetE/FieTRMczyeAkPUTnFw5G1Fftq
	vhXRdPzFjmEREGOipPyYzEO9mesdk6HJZ+Oaf4VOIQ==
X-Google-Smtp-Source: AGHT+IHxC6i5qwpObe1eDOWi/Od0g4GRgAk9jzOZ3XKeiC1SDm7VVZDyGLVzpXyK6cSH8wHoFhS6cxSCFQC9A0v0DV0=
X-Received: by 2002:a05:622a:198f:b0:40f:c60d:1c79 with SMTP id
 u15-20020a05622a198f00b0040fc60d1c79mr3382qtc.28.1692119474862; Tue, 15 Aug
 2023 10:11:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230811045127.3308641-1-rananta@google.com> <ZNq15SZ+53umvOfx@google.com>
 <CAJHc60wMueazp3Wm=b6-tnFPAyX0zeYuVQe9uPEJrpAm0azw2A@mail.gmail.com> <ZNrMTmppUfQhdsyY@google.com>
In-Reply-To: <ZNrMTmppUfQhdsyY@google.com>
From: Raghavendra Rao Ananta <rananta@google.com>
Date: Tue, 15 Aug 2023 10:11:02 -0700
Message-ID: <CAJHc60yp7X9Za=CJnJWqAbPuKznp91fYtnBOuQQCGtiXyQBqWw@mail.gmail.com>
Subject: Re: [PATCH v9 00/14] KVM: arm64: Add support for FEAT_TLBIRANGE
To: Sean Christopherson <seanjc@google.com>
Cc: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
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
X-CRM114-CacheID: sfid-20230815_101116_789301_313109B5 
X-CRM114-Status: GOOD (  30.00  )
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

T24gTW9uLCBBdWcgMTQsIDIwMjMgYXQgNTo1MuKAr1BNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgQXVnIDE0LCAyMDIzLCBSYWdoYXZl
bmRyYSBSYW8gQW5hbnRhIHdyb3RlOgo+ID4gT24gTW9uLCBBdWcgMTQsIDIwMjMgYXQgNDoxNuKA
r1BNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPiA+ID4K
PiA+ID4gT24gRnJpLCBBdWcgMTEsIDIwMjMsIFJhZ2hhdmVuZHJhIFJhbyBBbmFudGEgd3JvdGU6
Cj4gPiA+ID4gVGhlIHNlcmllcyBpcyBiYXNlZCBvZmYgb2YgdXBzdHJlYW0gdjYuNS1yYzEuCj4g
PiA+Cj4gPiA+IExpZXMhICA6LSkKPiA+ID4KPiA+ID4gVGhpcyBpcyBiYXNlZCBvZmYgb25lIG9m
IHRoZSBrdm1hcm0uZ2l0IHRvcGljIGJyYW5jaGVzIChJIGRpZG4ndCBib3RoZXIgdG8gZmlndXJl
Cj4gPiA+IG91dCB3aGljaCBvbmUpLCBub3QgdjYuNS1yYzEuCj4gPiA+Cj4gPiBTb3JyeSwgd2hh
dCBhbSBJIG1pc3NpbmcgaGVyZT8gTXkgZ2l0IGxvZyBpcyBhcyBmb2xsb3dzOgo+Cj4gSG1tLCBu
b3Qgc3VyZSB3aGF0J3MgZ29pbmcgb24uICBNYXliZSBJIG1pc2ludGVycHJldGVkIHdoeSBgZ2l0
IGFtYCB3YXMgZmFpbGluZz8KPiBJIGFzc3VtZWQgaXQgd2FzIGJlY2F1c2UgdGhlcmUgd2VyZSBv
YmplY3RzIGluIGt2bWFybSB0aGF0IEkgZGlkbid0IGhhdmUgbG9jYWxseSwKPiBhbmQgZmV0Y2hp
bmcga3ZtYXJtIGFsbG93ZWQgYW0gdG8gY29tcGxldGUsIHRob3VnaCB3aXRoIDMtd2F5IG1lcmdl
cywgd2hpY2ggSUlVQwo+IHNob3VsZG4ndCBoYXZlIGJlZW4gbmVjZXNzYXJ5IGlmIEkgd2FzIHVz
aW5nIHRoZSBleGFjdCBzYW1lIGJhc2UuICBPciBtYXliZSBJCj4gbWVzc2VkIHVwIGFuZCBkaWRu
J3QgYWN0dWFsbHkgcmVzZXQgdG8gNi41LXJjMS4KPgo+ID4gJCBnaXQgbG9nIC0tb25lbGluZSB1
cHN0cmVhbV90bGJpX3JhbmdlX3Y5Cj4gPiA1MDI1ODU3NTA3YWJlICh1cHN0cmVhbV90bGJpX3Jh
bmdlX3Y5KSBLVk06IGFybTY0OiBVc2UgVExCSQo+ID4gcmFuZ2UtYmFzZWQgaW5zdHJ1Y3Rpb25z
IGZvciB1bm1hcAo+ID4gNWMwMjkxYjk5YThmYyBLVk06IGFybTY0OiBJbnZhbGlkYXRlIHRoZSB0
YWJsZSBlbnRyaWVzIHVwb24gYSByYW5nZQo+ID4gOGM0NmI1NGQ0YWFlYyBLVk06IGFybTY0OiBG
bHVzaCBvbmx5IHRoZSBtZW1zbG90IGFmdGVyIHdyaXRlLXByb3RlY3QKPiA+IDIzMWFiYWViN2Zm
YzIgS1ZNOiBhcm02NDogSW1wbGVtZW50IGt2bV9hcmNoX2ZsdXNoX3JlbW90ZV90bGJzX3Jhbmdl
KCkKPiA+IDVlYzI5MWI4NjMzMDkgS1ZNOiBhcm02NDogRGVmaW5lIGt2bV90bGJfZmx1c2hfdm1p
ZF9yYW5nZSgpCj4gPiA1YmNkN2EwODVjMzRlIEtWTTogYXJtNjQ6IEltcGxlbWVudCAgX19rdm1f
dGxiX2ZsdXNoX3ZtaWRfcmFuZ2UoKQo+ID4gZWEwOGY5ZGZmN2U1YiBhcm02NDogdGxiOiBJbXBs
ZW1lbnQgX19mbHVzaF9zMl90bGJfcmFuZ2Vfb3AoKQo+ID4gYjMxNzg2ODc5NDdjOSBhcm02NDog
dGxiOiBSZWZhY3RvciB0aGUgY29yZSBmbHVzaCBhbGdvcml0aG0gb2YgX19mbHVzaF90bGJfcmFu
Z2UKPiA+IGE0ODUwZmE5ODhlZWYgS1ZNOiBNb3ZlIGt2bV9hcmNoX2ZsdXNoX3JlbW90ZV90bGJz
X21lbXNsb3QoKSB0byBjb21tb24gY29kZQo+ID4gMzA2ZGM0ZTZhZmQzNyBLVk06IEFsbG93IHJh
bmdlLWJhc2VkIFRMQiBpbnZhbGlkYXRpb24gZnJvbSBjb21tb24gY29kZQo+ID4gZDAyNzg1YTBh
MWUwMSBLVk06IFJlbW92ZSBDT05GSUdfSEFWRV9LVk1fQVJDSF9UTEJfRkxVU0hfQUxMCj4gPiAx
MzZmYTJkMjU0NTM3IEtWTTogYXJtNjQ6IFVzZSBrdm1fYXJjaF9mbHVzaF9yZW1vdGVfdGxicygp
Cj4gPiBlMzVjNjhhNzUxNzBkIEtWTTogRGVjbGFyZSBrdm1fYXJjaF9mbHVzaF9yZW1vdGVfdGxi
cygpIGdsb2JhbGx5Cj4gPiA1ZDU5Mjc3N2I5YmJhIEtWTTogUmVuYW1lIGt2bV9hcmNoX2ZsdXNo
X3JlbW90ZV90bGIoKSB0bwo+ID4ga3ZtX2FyY2hfZmx1c2hfcmVtb3RlX3RsYnMoKQo+ID4gMDZj
MmFmYjg2MmY5ZCAodGFnOiB2Ni41LXJjMSwgdGFnOiBsaW51eC92Ni41LXJjMSkgTGludXggNi41
LXJjMQo+ID4gYzE5MmFjNzM1NzY4MyBNQUlOVEFJTkVSUyAyOiBFbGVjdHJpYyBCb29nYWxvbwo+
ID4gZjcxZjY0MjEwZDY5OCBNZXJnZSB0YWcgJ2RtYS1tYXBwaW5nLTYuNS0yMDIzLTA3LTA5JyBv
Zgo+ID4gZ2l0Oi8vZ2l0LmluZnJhZGVhZC5vcmcvdXNlcnMvaGNoL2RtYS1tYXBwaW5nCj4gPiAu
Li4KPiA+Cj4gPiBJc24ndCB0aGUgY29tbWl0LCAwNmMyYWZiODYyZjlkICgwNmMyYWZiODYyZjlk
ICh0YWc6IHY2LjUtcmMxLCB0YWc6Cj4gPiBsaW51eC92Ni41LXJjMSkgTGludXggNi41LXJjMSkg
dGhlICdiYXNlJyBjb21taXQ/Cj4KPiBZYSwgc2hvdWxkIGJlLgo+Cj4gRWl0aGVyIHdheSwgZXZl
biBpZiB0aGlzIGlzIFBFQktBQyBvbiBteSBlbmQsIHVzaW5nIC0tYmFzZSB3b3VsZCBiZSBuaWNl
LCBlLmcuCj4gdGhlbiB5b3UgY2FuIGRlZmluaXRlbHkgc2F5IGl0J3MgbXkgZmF1bHQgOy0pCj4K
SSdsbCBjb25zaWRlciB0aGlzLCBhbmQgdGhhbmtzIGZvciB0aGUgY29uZmlybWF0aW9uLgoKLSBS
YWdoYXZlbmRyYQo+ID4gPiBQbGVhc2UgdHJ5IHRvIGluY29ycG9yYXRlIGdpdCBmb3JtYXQtcGF0
Y2gncyAiLS1iYXNlIiBvcHRpb24gaW50byB5b3VyIHdvcmtmbG93LAo+ID4gPiBlLmcuIEkgZG8g
ImdpdCBmb3JtYXQtcGF0Y2ggLS1iYXNlPUhFQUR+JG5yIiB3aGVyZSAkbnIgaXMgdGhlIG51bWJl
ciBvZiBwYXRjaGVzCj4gPiA+IEkgYW0gcG9zdGluZy4KPiA+ID4KPiA+ID4gSXQncyBub3QgZm9v
bHByb29mLCBlLmcuIG15IGFwcHJvYWNoIGRvZXNuJ3QgaGVscCBpZiBJIGhhdmUgYSBsb2NhbCBw
YXRjaCB0aGF0Cj4gPiA+IEknbSBub3QgcG9zdGluZywgYnV0IDk5JSBvZiB0aGUgdGltZSBpdCBK
dXN0IFdvcmtzIGFuZCBlbGltaW5hdGVzIGFueSBhbWJ1aXRpdHkuCj4gPiA+Cj4gPiA+IFlvdSBj
YW4gYWxzbyBkbyAiLS1iYXNlPWF1dG8iLCBidXQgdGhhdCBvbmx5IGRvZXMgdGhlIHJpZ2h0IHRo
aW5nIGlmIHlvdXIgc2VyaWVzCj4gPiA+IGhhcyBpdHMgdXBzdHJlYW0gYnJhbmNoIHNldCB0byB0
aGUgYmFzZS90cmVlIHRoYXQgeW91IHdhbnQgeW91ciBwYXRjaGVzIGFwcGxpZWQKPiA+ID4gdG8g
KEkgdXNlIHRoZSB1cHN0cmVhbSBicmFuY2ggZm9yIGEgY29tcGxldGVseSBkaWZmZXJlbnQgcHVy
cG9zZSBmb3IgbXkgZGV2IGJyYW5jaGVzKS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
