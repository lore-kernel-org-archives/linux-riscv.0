Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A03F8C001B0
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 16:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/FKBWMxUEzbQGfUf2Hd1S58POyRBu0xBRvumgvB7Uuk=; b=hogbD6OUqNnvf2
	ZBDww7TQ0CR4HSg9mhCHXhNYsuCFgNjRVrKHwN7MQHRORW44qr2RHHO1khpA17pBm0ecNEfee2IXg
	ljDrrM8tOR/bxkkpFf67NIVtvFLd34IwQ+Z5yh4kkrUT0CnFMUFsV/PscG/lXNhkTXjGmsX+GA9Cs
	HbJR7+XZ3k2ci47WHj7yE4orT4TUO6KEj4Qn+VNx9VzmLi6+Qlp51QPhiNppbQw5Lw6bWkv42AdEp
	VOwZvCZvUTpSe4ZJw7hHB+hyh9O+8VmQDbCH6O6Wwz3wW1idWQjv8Kc0oH1I4N1gsECsIhGdav4D0
	jiEtq01sB2Aphc+r05CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTPr5-0031I3-08;
	Tue, 08 Aug 2023 16:46:47 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTPr2-0031GP-1n
	for linux-riscv@lists.infradead.org;
	Tue, 08 Aug 2023 16:46:45 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-407db3e9669so1571cf.1
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 09:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691513202; x=1692118002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5cUkGvBinqrQEB7Ikj5Ug8tOjVRS6TZ8gJMeTTJk/U=;
        b=MEkJuLCCzNqujltO/2hEBF2IZ8JWjwedY1wVwMFzuxok1cUuORptjOLuKh3jhngmbg
         OszqqJ2FqeHwHlyz5sFzOsmGpkD/3QVma5URjR1jvw5cArnTbvACynfjopC1KnzTKMyP
         LXtBLl+32K1Fk6s33cihV9KIyTralnRC9ZedyF08T1fha1zO1t3FCcIBW73zDo4JKWLl
         vJ8fFQFUq8E0fvlL0hxqbxzzMtCdpELvpY0iRowFTc93kwORZVBnOlcAefdf1Jr8F9Be
         CvcMGmnUR49gQaXX06ieIIW2SXQ7B8dXiV4ZHtlX/+YS3IaUh5D5bc+PU8DnZ2XozQpU
         wELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691513202; x=1692118002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e5cUkGvBinqrQEB7Ikj5Ug8tOjVRS6TZ8gJMeTTJk/U=;
        b=jM5LLmcDuUraW5godOzEjvZj/y9GYm77oGPn63JUYD82gVAKOTD7IwJ/Xvlm9Pyyu4
         duMs5x0YOVnjYbJuwnjd0TPrgVIA6kFsvqpQK7YJZCu1rEt2v89geYP6jvgOXUkRpmok
         HzMTRfI9b5LIbH5FcokSE5BVxKv+WekfL8JWhbw0l4RdKIi6r7dPk22LQW6fzgVNhABm
         oV5yoZQbe3U7q9MB+BWM2CgG+XaBO9NWLtRRrmS/P1TU+Y2PT+v65n4rPb5qIFm/iHR8
         XHpawCjuQ8Wj8pzi6aBlzEPlXBQIjKggu7yez5gtqDnEgalBqupu0H3eVey/cnoCSU0L
         vGYg==
X-Gm-Message-State: AOJu0YwaVNE5U6NUjETfWpErMAVkfNssZ27OMYDu3i38yFaAE2YdnOLp
	rPWsEs+51/t8jU3HNqCsvu/0SHqo0LwkczWLAKXOqw==
X-Google-Smtp-Source: AGHT+IF4HzuUwWkMUsGsweRhCwPAzuoceDkfaSL4D3AD1VB/sy6hMsEVitqG7c6zwkKT6LNm7NuGpkKpwVJ6D73FF6Q=
X-Received: by 2002:a05:622a:11d3:b0:40f:dc70:fde2 with SMTP id
 n19-20020a05622a11d300b0040fdc70fde2mr2783qtk.26.1691513201715; Tue, 08 Aug
 2023 09:46:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230722022251.3446223-1-rananta@google.com> <20230722022251.3446223-3-rananta@google.com>
 <87tttpr6qy.wl-maz@kernel.org> <ZMgsjx8dwKd4xBGe@google.com>
 <877cqdqw12.wl-maz@kernel.org> <CAJHc60xAUVt5fbhEkOqeC-VF8SWVOt3si=1yxVVAUW=+Hu_wNg@mail.gmail.com>
 <CAJHc60zN-dc2E-fS7fuXgkrfGD9bqW6tMy2GRZxbHOeZv0ZOBw@mail.gmail.com>
 <ZNJaPxTtPRCv0HOl@google.com> <CAJHc60yiGnVc=ysdOaNemWaDpTBSk02mRLenK3sN2XtN_Cp98g@mail.gmail.com>
 <fc430350dd7d8ac664054a99f1e452c1@kernel.org>
In-Reply-To: <fc430350dd7d8ac664054a99f1e452c1@kernel.org>
From: Raghavendra Rao Ananta <rananta@google.com>
Date: Tue, 8 Aug 2023 09:46:30 -0700
Message-ID: <CAJHc60zspGChscVTj5K31=gzRmFu5d++FZNLz8eaZMxfOV+KAQ@mail.gmail.com>
Subject: Re: [PATCH v7 02/12] KVM: arm64: Use kvm_arch_flush_remote_tlbs()
To: Marc Zyngier <maz@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Jing Zhang <jingzhangos@google.com>, 
	Reiji Watanabe <reijiw@google.com>, Colton Lewis <coltonlewis@google.com>, 
	David Matlack <dmatlack@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_094644_600011_637FBDC8 
X-CRM114-Status: GOOD (  23.33  )
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

T24gVHVlLCBBdWcgOCwgMjAyMyBhdCA5OjQz4oCvQU0gTWFyYyBaeW5naWVyIDxtYXpAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiBPbiAyMDIzLTA4LTA4IDE3OjE5LCBSYWdoYXZlbmRyYSBSYW8gQW5h
bnRhIHdyb3RlOgo+ID4gT24gVHVlLCBBdWcgOCwgMjAyMyBhdCA4OjA34oCvQU0gU2VhbiBDaHJp
c3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+Cj4gPiB3cm90ZToKPiA+Pgo+ID4+IE9uIEZy
aSwgQXVnIDA0LCAyMDIzLCBSYWdoYXZlbmRyYSBSYW8gQW5hbnRhIHdyb3RlOgo+ID4+ID4gT24g
V2VkLCBBdWcgMiwgMjAyMyBhdCA0OjI44oCvUE0gUmFnaGF2ZW5kcmEgUmFvIEFuYW50YQo+ID4+
ID4gPHJhbmFudGFAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4gPj4gPiA+Cj4gPj4gPiA+IFN1cmUsIEkn
bGwgY2hhbmdlIGl0IHRvIGt2bV9hcmNoX2ZsdXNoX3ZtX3RsYnMoKSBpbiB2OC4KPiA+PiA+ID4K
PiA+PiA+IFdoaWxlIHdvcmtpbmcgb24gdGhlIHJlbmFtaW5nLCBJIHJlYWxpemVkIHRoYXQgc2lu
Y2UgdGhpcyBmdW5jdGlvbiBpcwo+ID4+ID4gY2FsbGVkIGZyb20ga3ZtX21haW4uYydzIGt2bV9m
bHVzaF9yZW1vdGVfdGxicygpLiBEbyB3ZSB3YW50IHRvIHJlbmFtZQo+ID4+ID4gdGhpcyBhbmQg
dGhlIG90aGVyIGt2bV9mbHVzaF8qKCkgZnVuY3Rpb25zIHRoYXQgdGhlIHNlcmllcyBpbnRyb2R1
Y2VzCj4gPj4gPiB0byBtYXRjaCB0aGVpciBrdm1fYXJjaF9mbHVzaF8qKCkgY291bnRlcnBhcnRz
Pwo+ID4+Cj4gPj4gSG1tLCBpZiB3ZSdyZSBnb2luZyB0byByZW5hbWUgb25lIGFyY2ggaG9vaywg
dGhlbiB5ZXMsIEkgdGhpbmsgaXQKPiA+PiBtYWtlcyBzZW5zZSB0bwo+ID4+IHJlbmFtZSBhbGwg
dGhlIGNvbW1vbiBBUElzIGFuZCBhcmNoIGhvb2tzIHRvIG1hdGNoLgo+ID4+Cj4gPj4gSG93ZXZl
ciwgeDg2IGlzIHJpZmUgd2l0aCB0aGUgInJlbW90ZV90bGJzIiBub21lbmNsYXR1cmUsIGFuZCBy
ZW5hbWluZwo+ID4+IHRoZSBjb21tb24KPiA+PiBBUElzIHdpbGwganVzdCBwdXNoIHRoZSBpbmNv
bnNpc3RlbmNpZXMgaW50byB4ODYuICBXaGlsZSBJIDEwMCUgYWdyZWUKPiA+PiB0aGF0IHRoZQo+
ID4+IGN1cnJlbnQgbmFtaW5nIGlzIGZsYXdlZCwgSSBhbSBub3Qgd2lsbGluZyB0byBlbmQgdXAg
d2l0aCB4ODYgYmVpbmcKPiA+PiBwYXJ0aWFsbHkKPiA+PiBjb252ZXJ0ZWQuCj4gPj4KPiA+PiBJ
IHRoaW5rIEknbSBvayByZW5hbWluZyBhbGwgb2YgeDg2J3MgbWFueSBob29rcz8gIEJ1dCBJJ2Qg
ZGVmaW5pdGVseQo+ID4+IHdhbnQgaW5wdXQKPiA+PiBmcm9tIG1vcmUgeDg2IGZvbGtzLCBhbmQg
dGhlIHNpemUgYW5kIHNjb3BlIG9mIHRoaXMgc2VyaWVzIHdvdWxkCj4gPj4gZXhwbG9kZS4gIFVu
bGVzcwo+ID4+IE1hcmMgb2JqZWN0cyBhbmQvb3IgaGFzIGEgYmV0dGVyIGlkZWEsIHRoZSBsZWFz
dCBhd2Z1bCBvcHRpb24gaXMKPiA+PiBwcm9iYWJseSB0byBpZ25vcmUKPiA+PiB0aGUgcG9vciAi
cmVtb3RlX3RsYnMiIG5hbWluZyBhbmQgdGFja2xlIGl0IGluIGEgc2VwYXJhdGUgc2VyaWVzLgo+
ID4+Cj4gPiBTdXJlLCBJIHRoaW5rIGl0J3MgYmV0dGVyIHRvIGRvIGl0IGluIGEgc2VwYXJhdGUg
c2VyaWVzIGFzIHdlbGwuIEknbQo+ID4gaGFwcHkgdG8gY2Fycnkgb3V0IHRoZSB0YXNrIGFmdGVy
IHRoaXMgb25lIGdldHMgbWVyZ2VkLiBCdXQsIGxldCdzCj4gPiB3YWl0IGZvciBNYXJjIGFuZCBv
dGhlcnMnIG9waW5pb24gb24gdGhlIG1hdHRlci4KPgo+IFllYWgsIGxldCdzIHB1bnQgdGhhdCB0
byBhIHNlcGFyYXRlIHNlcmllcy4gSSdtIG1vcmUgaW50ZXJlc3RlZCBpbgo+IGdldHRpbmcgdGhp
cyBjb2RlIG1lcmdlZCB0aGFuIGluIHRoZSBpbmV2aXRhYmxlIGJpa2Utc2hlZGRpbmcgdGhhdAo+
IHdpbGwgcmVzdWx0IGZyb20gc3VjaCBhIHByb3Bvc2FsLgo+Cj4gUmFnaGF2ZW5kcmEsIGFueSBj
aGFuY2UgeW91IGNvdWxkIHJlc3BpbiB0aGUgc2VyaWVzIHRoaXMgd2Vlaz8KPiBJJ2QgcmVhbGx5
IGxpa2UgaXQgdG8gc3BlbmQgc29tZSBxdWFsaXR5IHRpbWUgaW4gLW5leHQuLi4KPgpObyBwcm9i
bGVtLiBJJ2xsIHNlbmQgb3V0IHY4IGJ5IHRvZGF5IG9yIHRvbW9ycm93LgoKVGhhbmsgeW91LgpS
YWdoYXZlbmRyYQo+IFRoYW5rcywKPgo+ICAgICAgICAgIE0uCj4gLS0KPiBKYXp6IGlzIG5vdCBk
ZWFkLiBJdCBqdXN0IHNtZWxscyBmdW5ueS4uLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
