Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6076FC0015E
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 17:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=fl/RChv5iNlcLXdtxEhdSqgG+Sihn+0UCLzD25m48V0=; b=nzTS0Mo2OYPmvre3alk7Jvy5kz
	XJz9mZT5pQ8adYbIMRnGDKsPUr09/EECGsdihuoDv67kfcgNXM99i4WeI6eLc+tNQIFuv2agFAcUn
	eespGVl/GmOZQtpPG2T7KWTpcXO7oQy2Rq7jIvHwT/Is8KcFTh9ajrBngGmRV2r1t1dHsdogn3wks
	O3iQ5ZOY6bD24l31rtGV5/+PeTuRhw+XYlODNgD0FkQNwRVY68pE9FJaTrZyFsMI9SiOS2L3pvEKX
	r3VCP9SmwgyzNQAtXl9hgiUFWuEK5jDfiWg3Q10igmckoyX5rrb4p3vCnYoNN5jDITbDFUpeSqzVL
	rT1sLdtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVxeD-0023XQ-0F;
	Tue, 15 Aug 2023 17:16:01 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVxe9-0023Va-0j
	for linux-riscv@lists.infradead.org;
	Tue, 15 Aug 2023 17:15:59 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-c647150c254so11005263276.1
        for <linux-riscv@lists.infradead.org>; Tue, 15 Aug 2023 10:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692119754; x=1692724554;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h4pRofXYscuxJwlZlec+kz5JByk1VStjcQk6pNX8VCg=;
        b=0ULGW8lrz4LAfQvUr6zW2RUHxg7wnB8mbW6D5bd2rDtC7t6jWPtR/lVCZvnMtK039v
         Gg8JyKieoo8YzZWKJSwsneurYfUwDhsBEjHR8BDDFIcMNXvxQFl1SY6+8po7yWKtX3gK
         0M47n08PCbwSAAAHpnB5NZUa5PJ3jqM0sFJYHYCV1+uFsvROyNCULug2lOezvw4KSxiC
         SwvzuqKN0keYa4/1ydFK2xGN83du5F8hP7y28i8MbkevBr7RMbIjQF8iEl3lxI4AS4rj
         O6jyhFmalRm5sDGo51MDmx9Yc7ibOQgbEesKJpyN5wkexREqBNWTi2YgoIds/heBTaQl
         JrNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692119754; x=1692724554;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h4pRofXYscuxJwlZlec+kz5JByk1VStjcQk6pNX8VCg=;
        b=jkINzIqjBTQ/+Yql4JDxKhF/1d9AafTEWQScOQfPEvDjGQKBJDgn0v2IJdsVgzObja
         +NsWSLFPAvB6PlK9tlRXLTrmjpPeN7dj3xCjWVzFKMxEYgry/orjp8euK7oE1l+62TsZ
         oagkfp8I0kzTOfz/Qe1rBah9zMgnh6IqJNVP8IuSKopJD9n+7OKWBpebC+2gDpmw9c62
         SkHnB3JKIjiCE8tT5CFsUORg2qUmhwCpbUz1+hdEcckZkmJMeNfQcEejcZIBVzm6wS7I
         VodFJzLJm5wGlq5ROAVn3ncfpfE0NmixQOam/DtnW7VdbGBYl9TIUDCj3f08VJVjk9E6
         Ih4Q==
X-Gm-Message-State: AOJu0Yy7HJOSOfVIUjVI+3uTijBgpr8rsH23QS43ZQmZ8BqBTrQRMr3C
	YjDV2g4zYKbuaqyLmE1wni2lKVwCbNk=
X-Google-Smtp-Source: AGHT+IEdTpAtlbhdDz4CSAmHfwiSyntmeRr/8GY1hRZWQcWfFLbFbn/FO7WCsNQ5MIITNcxj8ryCZ17c50c=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:890e:0:b0:d08:95:76d with SMTP id
 e14-20020a25890e000000b00d080095076dmr40567ybl.6.1692119754466; Tue, 15 Aug
 2023 10:15:54 -0700 (PDT)
Date: Tue, 15 Aug 2023 17:15:53 +0000
In-Reply-To: <CAJHc60yp7X9Za=CJnJWqAbPuKznp91fYtnBOuQQCGtiXyQBqWw@mail.gmail.com>
Mime-Version: 1.0
References: <20230811045127.3308641-1-rananta@google.com> <ZNq15SZ+53umvOfx@google.com>
 <CAJHc60wMueazp3Wm=b6-tnFPAyX0zeYuVQe9uPEJrpAm0azw2A@mail.gmail.com>
 <ZNrMTmppUfQhdsyY@google.com> <CAJHc60yp7X9Za=CJnJWqAbPuKznp91fYtnBOuQQCGtiXyQBqWw@mail.gmail.com>
Message-ID: <ZNuyyQsFCmDc7Gmb@google.com>
Subject: Re: [PATCH v9 00/14] KVM: arm64: Add support for FEAT_TLBIRANGE
From: Sean Christopherson <seanjc@google.com>
To: Raghavendra Rao Ananta <rananta@google.com>
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
X-CRM114-CacheID: sfid-20230815_101557_262702_E0C978D0 
X-CRM114-Status: GOOD (  23.06  )
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

T24gVHVlLCBBdWcgMTUsIDIwMjMsIFJhZ2hhdmVuZHJhIFJhbyBBbmFudGEgd3JvdGU6Cj4gT24g
TW9uLCBBdWcgMTQsIDIwMjMgYXQgNTo1MuKAr1BNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5q
Y0Bnb29nbGUuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBNb24sIEF1ZyAxNCwgMjAyMywgUmFnaGF2
ZW5kcmEgUmFvIEFuYW50YSB3cm90ZToKPiA+ID4gT24gTW9uLCBBdWcgMTQsIDIwMjMgYXQgNDox
NuKAr1BNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPiA+
ID4gPgo+ID4gPiA+IE9uIEZyaSwgQXVnIDExLCAyMDIzLCBSYWdoYXZlbmRyYSBSYW8gQW5hbnRh
IHdyb3RlOgo+ID4gPiA+ID4gVGhlIHNlcmllcyBpcyBiYXNlZCBvZmYgb2YgdXBzdHJlYW0gdjYu
NS1yYzEuCj4gPiA+ID4KPiA+ID4gPiBMaWVzISAgOi0pCj4gPiA+ID4KPiA+ID4gPiBUaGlzIGlz
IGJhc2VkIG9mZiBvbmUgb2YgdGhlIGt2bWFybS5naXQgdG9waWMgYnJhbmNoZXMgKEkgZGlkbid0
IGJvdGhlciB0byBmaWd1cmUKPiA+ID4gPiBvdXQgd2hpY2ggb25lKSwgbm90IHY2LjUtcmMxLgo+
ID4gPiA+Cj4gPiA+IFNvcnJ5LCB3aGF0IGFtIEkgbWlzc2luZyBoZXJlPyBNeSBnaXQgbG9nIGlz
IGFzIGZvbGxvd3M6Cj4gPgo+ID4gSG1tLCBub3Qgc3VyZSB3aGF0J3MgZ29pbmcgb24uICBNYXli
ZSBJIG1pc2ludGVycHJldGVkIHdoeSBgZ2l0IGFtYCB3YXMgZmFpbGluZz8KPiA+IEkgYXNzdW1l
ZCBpdCB3YXMgYmVjYXVzZSB0aGVyZSB3ZXJlIG9iamVjdHMgaW4ga3ZtYXJtIHRoYXQgSSBkaWRu
J3QgaGF2ZSBsb2NhbGx5LAo+ID4gYW5kIGZldGNoaW5nIGt2bWFybSBhbGxvd2VkIGFtIHRvIGNv
bXBsZXRlLCB0aG91Z2ggd2l0aCAzLXdheSBtZXJnZXMsIHdoaWNoIElJVUMKPiA+IHNob3VsZG4n
dCBoYXZlIGJlZW4gbmVjZXNzYXJ5IGlmIEkgd2FzIHVzaW5nIHRoZSBleGFjdCBzYW1lIGJhc2Uu
ICBPciBtYXliZSBJCj4gPiBtZXNzZWQgdXAgYW5kIGRpZG4ndCBhY3R1YWxseSByZXNldCB0byA2
LjUtcmMxLgo+ID4KPiA+ID4gJCBnaXQgbG9nIC0tb25lbGluZSB1cHN0cmVhbV90bGJpX3Jhbmdl
X3Y5Cj4gPiA+IDUwMjU4NTc1MDdhYmUgKHVwc3RyZWFtX3RsYmlfcmFuZ2VfdjkpIEtWTTogYXJt
NjQ6IFVzZSBUTEJJCj4gPiA+IHJhbmdlLWJhc2VkIGluc3RydWN0aW9ucyBmb3IgdW5tYXAKPiA+
ID4gNWMwMjkxYjk5YThmYyBLVk06IGFybTY0OiBJbnZhbGlkYXRlIHRoZSB0YWJsZSBlbnRyaWVz
IHVwb24gYSByYW5nZQo+ID4gPiA4YzQ2YjU0ZDRhYWVjIEtWTTogYXJtNjQ6IEZsdXNoIG9ubHkg
dGhlIG1lbXNsb3QgYWZ0ZXIgd3JpdGUtcHJvdGVjdAo+ID4gPiAyMzFhYmFlYjdmZmMyIEtWTTog
YXJtNjQ6IEltcGxlbWVudCBrdm1fYXJjaF9mbHVzaF9yZW1vdGVfdGxic19yYW5nZSgpCj4gPiA+
IDVlYzI5MWI4NjMzMDkgS1ZNOiBhcm02NDogRGVmaW5lIGt2bV90bGJfZmx1c2hfdm1pZF9yYW5n
ZSgpCj4gPiA+IDViY2Q3YTA4NWMzNGUgS1ZNOiBhcm02NDogSW1wbGVtZW50ICBfX2t2bV90bGJf
Zmx1c2hfdm1pZF9yYW5nZSgpCj4gPiA+IGVhMDhmOWRmZjdlNWIgYXJtNjQ6IHRsYjogSW1wbGVt
ZW50IF9fZmx1c2hfczJfdGxiX3JhbmdlX29wKCkKPiA+ID4gYjMxNzg2ODc5NDdjOSBhcm02NDog
dGxiOiBSZWZhY3RvciB0aGUgY29yZSBmbHVzaCBhbGdvcml0aG0gb2YgX19mbHVzaF90bGJfcmFu
Z2UKPiA+ID4gYTQ4NTBmYTk4OGVlZiBLVk06IE1vdmUga3ZtX2FyY2hfZmx1c2hfcmVtb3RlX3Rs
YnNfbWVtc2xvdCgpIHRvIGNvbW1vbiBjb2RlCj4gPiA+IDMwNmRjNGU2YWZkMzcgS1ZNOiBBbGxv
dyByYW5nZS1iYXNlZCBUTEIgaW52YWxpZGF0aW9uIGZyb20gY29tbW9uIGNvZGUKPiA+ID4gZDAy
Nzg1YTBhMWUwMSBLVk06IFJlbW92ZSBDT05GSUdfSEFWRV9LVk1fQVJDSF9UTEJfRkxVU0hfQUxM
Cj4gPiA+IDEzNmZhMmQyNTQ1MzcgS1ZNOiBhcm02NDogVXNlIGt2bV9hcmNoX2ZsdXNoX3JlbW90
ZV90bGJzKCkKPiA+ID4gZTM1YzY4YTc1MTcwZCBLVk06IERlY2xhcmUga3ZtX2FyY2hfZmx1c2hf
cmVtb3RlX3RsYnMoKSBnbG9iYWxseQo+ID4gPiA1ZDU5Mjc3N2I5YmJhIEtWTTogUmVuYW1lIGt2
bV9hcmNoX2ZsdXNoX3JlbW90ZV90bGIoKSB0bwo+ID4gPiBrdm1fYXJjaF9mbHVzaF9yZW1vdGVf
dGxicygpCj4gPiA+IDA2YzJhZmI4NjJmOWQgKHRhZzogdjYuNS1yYzEsIHRhZzogbGludXgvdjYu
NS1yYzEpIExpbnV4IDYuNS1yYzEKPiA+ID4gYzE5MmFjNzM1NzY4MyBNQUlOVEFJTkVSUyAyOiBF
bGVjdHJpYyBCb29nYWxvbwo+ID4gPiBmNzFmNjQyMTBkNjk4IE1lcmdlIHRhZyAnZG1hLW1hcHBp
bmctNi41LTIwMjMtMDctMDknIG9mCj4gPiA+IGdpdDovL2dpdC5pbmZyYWRlYWQub3JnL3VzZXJz
L2hjaC9kbWEtbWFwcGluZwo+ID4gPiAuLi4KPiA+ID4KPiA+ID4gSXNuJ3QgdGhlIGNvbW1pdCwg
MDZjMmFmYjg2MmY5ZCAoMDZjMmFmYjg2MmY5ZCAodGFnOiB2Ni41LXJjMSwgdGFnOgo+ID4gPiBs
aW51eC92Ni41LXJjMSkgTGludXggNi41LXJjMSkgdGhlICdiYXNlJyBjb21taXQ/Cj4gPgo+ID4g
WWEsIHNob3VsZCBiZS4KPiA+Cj4gPiBFaXRoZXIgd2F5LCBldmVuIGlmIHRoaXMgaXMgUEVCS0FD
IG9uIG15IGVuZCwgdXNpbmcgLS1iYXNlIHdvdWxkIGJlIG5pY2UsIGUuZy4KPiA+IHRoZW4geW91
IGNhbiBkZWZpbml0ZWx5IHNheSBpdCdzIG15IGZhdWx0IDstKQo+ID4KPiBJJ2xsIGNvbnNpZGVy
IHRoaXMsIGFuZCB0aGFua3MgZm9yIHRoZSBjb25maXJtYXRpb24uCgpDb25maXJtZWQgUEVCS0FD
LCBJIHJlc2V0IHRvIHY2LjUtcmMyLCBub3QgcmMxLiAgTXkgYXBvbG9naWVzLCBhbmQgdGhhbmtz
IGZvciBiZWluZwpnZW50bGUuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
