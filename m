Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF756C001B0
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 16:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cYN/LAPwvL03eDbDQoJnHGHZV+umrX8BnckWZOrMyO4=; b=qqcjYP2s4YQHpw
	7uzUmpuKSMxSqAjMFTfzXgPsg6u9onHVGys8uZKUOtElplS2ek48FuCQ5E0LBPM+6TQr4xkwcYbfT
	febk2TLVimTiPjqgvwqs2/b3qZWme/FzxCbiQRR3IIlSfyLWZg1Yo9UydulXHTLu2sOqV6ZPzAKkE
	sJfqLbzb9vSJdZp5NJHeu+p8t3YlfDgzZfKqMXkgUQzVw3XC/71EW+WbFKo7+rO/vDyEgTrBRSI16
	7ixauS0xhQhL890OoLdSR6adkSF9Rdgw13KdzscxVsT0SOnaZonaioah805IVv6BLJEXU68bCNWWp
	DFZDsd4TCeJK+bh7ys8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTPRL-002x06-17;
	Tue, 08 Aug 2023 16:20:11 +0000
Received: from mail-il1-f173.google.com ([209.85.166.173])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTPRI-002wxz-0O
	for linux-riscv@lists.infradead.org;
	Tue, 08 Aug 2023 16:20:09 +0000
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3492e05be7cso153715ab.0
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 09:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691511605; x=1692116405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U4qeJyFw/gGtNGwwL76+JxYJVDiytKHvIxhzv45xt00=;
        b=FpfAKc3XyP1qtbWBZ1r5mjM0gGcK3mBqFnQDJg0z7xglITdvPvyPFO68jQ0PYtEUYV
         rpNDUVZsipF7n+fTt95dGPnaD80TOiS9mDENUKcX5WGNdhDAs8DDDxN/NVyVQA8z0W5P
         25Tt2lotrmP+TltcpTJg7iP1p/XE1wX+ZjijZoVt+3tKY7bWxnQCNP5LL5wrjU0b2GnI
         aVqQqHH8Ca7ngxoTSYzFdMaiz/kEiqSAcaMrBMBDLXzcSuPFg8+njtH5c8+y240S5y9+
         6uPltBfXOJFc9jALMNDRbM20jjU7jRwikkRkGmhO/qF4WtwZoWK1pjQTtuAfpe/Mq/Sf
         Sg5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691511605; x=1692116405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U4qeJyFw/gGtNGwwL76+JxYJVDiytKHvIxhzv45xt00=;
        b=X4G8oMH7qadgyY7tKbgmG+X/wIx+l73bJZ5dFmXWwBbscsYtk4DwedQO1wpX/kN8Yn
         2bZthpzL4+RErygpEA7eUEfOvQPTNSZB8kQqMwRfDgtzzwgdH8KcwRCHcmO6xahDSNbe
         jmowSZyEBtVjnZPlUl2nydhmM7fM6ZkTeAsQqYi5NfzSzX4ZeJ29XGxL3z51heL42vga
         taylRoF5l56QQLEqrQe6R92eb4O0ii7hyo1pTe6vpmQvi2m0fCgJ8MXELC8B2g2Dfp0L
         Skj2ZOHykA7SlJ3AUDN1ulAZzoOmtqzQFznoElSzmiILpYh08Rf49EpBV/s0Reo/Ro2e
         0n0w==
X-Gm-Message-State: AOJu0YxiFsxpXrCtqwQaL+1EqOZL/S/JrwVcbO/mms4YnI/cUVtAPKzt
	ltVRHZrT8XecfiDeS5lO2V3uQg1IxAtAvao04/FvTQ==
X-Google-Smtp-Source: AGHT+IE0t1UQBz7Q+Wd5oVDkD3MWrd9+fYCOI5tNf8F86oCLp/yKAd0cOFrr+Qrz9mpkQuy5myhBpG2/Eo43uNjBaY0=
X-Received: by 2002:a05:6e02:156e:b0:33b:4a8c:2147 with SMTP id
 k14-20020a056e02156e00b0033b4a8c2147mr897399ilu.8.1691511605457; Tue, 08 Aug
 2023 09:20:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230722022251.3446223-1-rananta@google.com> <20230722022251.3446223-3-rananta@google.com>
 <87tttpr6qy.wl-maz@kernel.org> <ZMgsjx8dwKd4xBGe@google.com>
 <877cqdqw12.wl-maz@kernel.org> <CAJHc60xAUVt5fbhEkOqeC-VF8SWVOt3si=1yxVVAUW=+Hu_wNg@mail.gmail.com>
 <CAJHc60zN-dc2E-fS7fuXgkrfGD9bqW6tMy2GRZxbHOeZv0ZOBw@mail.gmail.com> <ZNJaPxTtPRCv0HOl@google.com>
In-Reply-To: <ZNJaPxTtPRCv0HOl@google.com>
From: Raghavendra Rao Ananta <rananta@google.com>
Date: Tue, 8 Aug 2023 09:19:53 -0700
Message-ID: <CAJHc60yiGnVc=ysdOaNemWaDpTBSk02mRLenK3sN2XtN_Cp98g@mail.gmail.com>
Subject: Re: [PATCH v7 02/12] KVM: arm64: Use kvm_arch_flush_remote_tlbs()
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
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
X-CRM114-CacheID: sfid-20230808_092008_168800_5FF06714 
X-CRM114-Status: GOOD (  20.82  )
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

T24gVHVlLCBBdWcgOCwgMjAyMyBhdCA4OjA34oCvQU0gU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2Vh
bmpjQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBBdWcgMDQsIDIwMjMsIFJhZ2hhdmVu
ZHJhIFJhbyBBbmFudGEgd3JvdGU6Cj4gPiBPbiBXZWQsIEF1ZyAyLCAyMDIzIGF0IDQ6MjjigK9Q
TSBSYWdoYXZlbmRyYSBSYW8gQW5hbnRhCj4gPiA8cmFuYW50YUBnb29nbGUuY29tPiB3cm90ZToK
PiA+ID4KPiA+ID4gU3VyZSwgSSdsbCBjaGFuZ2UgaXQgdG8ga3ZtX2FyY2hfZmx1c2hfdm1fdGxi
cygpIGluIHY4Lgo+ID4gPgo+ID4gV2hpbGUgd29ya2luZyBvbiB0aGUgcmVuYW1pbmcsIEkgcmVh
bGl6ZWQgdGhhdCBzaW5jZSB0aGlzIGZ1bmN0aW9uIGlzCj4gPiBjYWxsZWQgZnJvbSBrdm1fbWFp
bi5jJ3Mga3ZtX2ZsdXNoX3JlbW90ZV90bGJzKCkuIERvIHdlIHdhbnQgdG8gcmVuYW1lCj4gPiB0
aGlzIGFuZCB0aGUgb3RoZXIga3ZtX2ZsdXNoXyooKSBmdW5jdGlvbnMgdGhhdCB0aGUgc2VyaWVz
IGludHJvZHVjZXMKPiA+IHRvIG1hdGNoIHRoZWlyIGt2bV9hcmNoX2ZsdXNoXyooKSBjb3VudGVy
cGFydHM/Cj4KPiBIbW0sIGlmIHdlJ3JlIGdvaW5nIHRvIHJlbmFtZSBvbmUgYXJjaCBob29rLCB0
aGVuIHllcywgSSB0aGluayBpdCBtYWtlcyBzZW5zZSB0bwo+IHJlbmFtZSBhbGwgdGhlIGNvbW1v
biBBUElzIGFuZCBhcmNoIGhvb2tzIHRvIG1hdGNoLgo+Cj4gSG93ZXZlciwgeDg2IGlzIHJpZmUg
d2l0aCB0aGUgInJlbW90ZV90bGJzIiBub21lbmNsYXR1cmUsIGFuZCByZW5hbWluZyB0aGUgY29t
bW9uCj4gQVBJcyB3aWxsIGp1c3QgcHVzaCB0aGUgaW5jb25zaXN0ZW5jaWVzIGludG8geDg2LiAg
V2hpbGUgSSAxMDAlIGFncmVlIHRoYXQgdGhlCj4gY3VycmVudCBuYW1pbmcgaXMgZmxhd2VkLCBJ
IGFtIG5vdCB3aWxsaW5nIHRvIGVuZCB1cCB3aXRoIHg4NiBiZWluZyBwYXJ0aWFsbHkKPiBjb252
ZXJ0ZWQuCj4KPiBJIHRoaW5rIEknbSBvayByZW5hbWluZyBhbGwgb2YgeDg2J3MgbWFueSBob29r
cz8gIEJ1dCBJJ2QgZGVmaW5pdGVseSB3YW50IGlucHV0Cj4gZnJvbSBtb3JlIHg4NiBmb2xrcywg
YW5kIHRoZSBzaXplIGFuZCBzY29wZSBvZiB0aGlzIHNlcmllcyB3b3VsZCBleHBsb2RlLiAgVW5s
ZXNzCj4gTWFyYyBvYmplY3RzIGFuZC9vciBoYXMgYSBiZXR0ZXIgaWRlYSwgdGhlIGxlYXN0IGF3
ZnVsIG9wdGlvbiBpcyBwcm9iYWJseSB0byBpZ25vcmUKPiB0aGUgcG9vciAicmVtb3RlX3RsYnMi
IG5hbWluZyBhbmQgdGFja2xlIGl0IGluIGEgc2VwYXJhdGUgc2VyaWVzLgo+ClN1cmUsIEkgdGhp
bmsgaXQncyBiZXR0ZXIgdG8gZG8gaXQgaW4gYSBzZXBhcmF0ZSBzZXJpZXMgYXMgd2VsbC4gSSdt
CmhhcHB5IHRvIGNhcnJ5IG91dCB0aGUgdGFzayBhZnRlciB0aGlzIG9uZSBnZXRzIG1lcmdlZC4g
QnV0LCBsZXQncwp3YWl0IGZvciBNYXJjIGFuZCBvdGhlcnMnIG9waW5pb24gb24gdGhlIG1hdHRl
ci4KClRoYW5rIHlvdS4KUmFnaGF2ZW5kcmEKPiBTb3JyeSBmb3Igbm90IG5vdGljaWluZyB0aGlz
IGVhcmxpZXIsIEkgZGlkbid0IHJlYWxpemUganVzdCBob3cgbXVjaCB4ODYgdXNlcwo+IHJlbW90
ZV90bGJzLgo+Cj4gPiAoc3BpcmFsaW5nIG1vcmUgaW50byB0aGlzLCB3ZSBhbHNvIGhhdmUgdGhl
ICdyZW1vdGVfdGxiX2ZsdXNoX3JlcXVlc3RzJyBhbmQKPiA+ICdyZW1vdGVfdGxiX2ZsdXNoJyBz
dGF0cykKPgo+IFJlZ2FyZGxlc3Mgb2Ygd2hhdCB3ZSBkZWNpZGUgZm9yIHRoZSBBUElzLCBkZWZp
bml0ZWx5IGxlYXZlIHRoZSBzdGF0cyBhbG9uZS4gIFRoZQo+IG5hbWVzIGFyZSBBQkkuICBXZSBj
b3VsZCBwcmVzZXJ2ZSB0aGUgbmFtZXMgYW5kIGNoYW5nZXMgdGhlIHN0cnVjdCBmaWVsZHMsIGJ1
dCB0aGF0Cj4gd291bGQgYmUgYSBuZXQgbmVnYXRpdmUgSU1PLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
