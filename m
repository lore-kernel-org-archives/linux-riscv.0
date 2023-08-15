Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B5DCC001DB
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 00:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=q/n+ijy2wn7sZFrG6W8C1LSGfVn2U82zcqsb9FXbngI=; b=mt/d+eb51sTkNotLjk7gvdFHdn
	HYw51VGDh8fsVqeoEDzbdrQ3oQQcR4ejeUG8NTbnBuh/Zq6MGV4CCy7j8rpyKjti9DaJ55kxf+PKR
	O1Q7pAcxsLpZ/6AN4K6WGqfmT8XjlEkuKN3yraWM0lnAn/7nJe4yEMYeowELkAtYO6+SM9YcXSYAW
	KNDCZbSfAqH+hDNlxRBOti8+FidwBgm2oXesx2p01QnfeZs/NIYPB3e/9EylIJYwjfKZXSfTXJ2KX
	1ostbfPLdIl/nFOh9XShNOcolPqVKvVUlXFfivC5ct5w65H6f+NhGXVyPWmrHYiGD4tJ0LaP4qRIH
	31YoizwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qViIY-000d3k-2i;
	Tue, 15 Aug 2023 00:52:38 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qViIU-000d2D-1G
	for linux-riscv@lists.infradead.org;
	Tue, 15 Aug 2023 00:52:36 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-589c2516024so48270257b3.3
        for <linux-riscv@lists.infradead.org>; Mon, 14 Aug 2023 17:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692060752; x=1692665552;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hk15mUEG36mYzoWqdyXNILxXbUGFuZdN5ezEkvLZ3iM=;
        b=SUKnvazqj9CVjAezsoD2+y+B/lascXFbPfh2BmPWUTPhsp2ltMrajsTckozDu9ifdm
         uRoTdnCgOM98B7Rnb91Ve9c/MBRF5IHK3nGacQ54NRHNp4jfWACljRlSNeWuoRdL+3na
         CtHqlJoC59YHPayYcYzVEhCEfMbZsPVJQIkTDsx0J6ehfskI+bg3C/TTqGB4GfV7K9Vn
         rRDM2yi+re6usECld7Z4U2WK/2ghsl54KPV4Ycl6v1kRxR+u2a297eNSVYm3jPrYQCL2
         cXFmXO9Zt4S3exCCMfQ/QP9nNjQaIR5tBPHnG0PDbMprpJdiffEDLgQQkSHFXTPIaHgD
         6rOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692060752; x=1692665552;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hk15mUEG36mYzoWqdyXNILxXbUGFuZdN5ezEkvLZ3iM=;
        b=dfxcez9c7vEBFWEQPHFtbHGCvXjYMYaUrAJDQlNk1aJanDz3cbRMwqV6WhAcrrX4bA
         BAcSGq6xcQumL71b+Ng33UcKw7rFBd6AKcvWLoFAvjL7IZbXefHTAozWJAWYMzePx0ft
         tXofzf6xlm1Sdbq3RuUVypXKJCLW9CxJvC8Iv0W2nEANWgERbrNXZS7RIP3fesIjDzbV
         oNySi+x0KyE5CpK0c3uCOfSHrfpD785OO8MVcMZofvOPU6bxMsLHeN9jQsGLvpoPHw7F
         f3W8L7EfW//telOVFH2A6NbPXDrlTJIdMqQkVLxg/SR3RjG4TyPxwX1KgUBbaVoFZj1p
         kMcg==
X-Gm-Message-State: AOJu0YzfvcVuqV4bq37zdXMaYa2c1KYCpFFIaJHm03XF+Wdl33h9BwIH
	vcxBOmIukbP0e4C8iKi+YKo+igsMdj8=
X-Google-Smtp-Source: AGHT+IEm/gyjzby2m0z7Th7h1NzS+zVz9W6iAdmwDKQNzO5UYu/Tw93ovcYoaLNJ0fJilJkbmSYm3tW9J7c=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:7443:0:b0:d20:7752:e384 with SMTP id
 p64-20020a257443000000b00d207752e384mr148317ybc.3.1692060751838; Mon, 14 Aug
 2023 17:52:31 -0700 (PDT)
Date: Mon, 14 Aug 2023 17:52:30 -0700
In-Reply-To: <CAJHc60wMueazp3Wm=b6-tnFPAyX0zeYuVQe9uPEJrpAm0azw2A@mail.gmail.com>
Mime-Version: 1.0
References: <20230811045127.3308641-1-rananta@google.com> <ZNq15SZ+53umvOfx@google.com>
 <CAJHc60wMueazp3Wm=b6-tnFPAyX0zeYuVQe9uPEJrpAm0azw2A@mail.gmail.com>
Message-ID: <ZNrMTmppUfQhdsyY@google.com>
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
X-CRM114-CacheID: sfid-20230814_175234_435731_8911C69B 
X-CRM114-Status: GOOD (  25.96  )
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

T24gTW9uLCBBdWcgMTQsIDIwMjMsIFJhZ2hhdmVuZHJhIFJhbyBBbmFudGEgd3JvdGU6Cj4gT24g
TW9uLCBBdWcgMTQsIDIwMjMgYXQgNDoxNuKAr1BNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5q
Y0Bnb29nbGUuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBGcmksIEF1ZyAxMSwgMjAyMywgUmFnaGF2
ZW5kcmEgUmFvIEFuYW50YSB3cm90ZToKPiA+ID4gVGhlIHNlcmllcyBpcyBiYXNlZCBvZmYgb2Yg
dXBzdHJlYW0gdjYuNS1yYzEuCj4gPgo+ID4gTGllcyEgIDotKQo+ID4KPiA+IFRoaXMgaXMgYmFz
ZWQgb2ZmIG9uZSBvZiB0aGUga3ZtYXJtLmdpdCB0b3BpYyBicmFuY2hlcyAoSSBkaWRuJ3QgYm90
aGVyIHRvIGZpZ3VyZQo+ID4gb3V0IHdoaWNoIG9uZSksIG5vdCB2Ni41LXJjMS4KPiA+Cj4gU29y
cnksIHdoYXQgYW0gSSBtaXNzaW5nIGhlcmU/IE15IGdpdCBsb2cgaXMgYXMgZm9sbG93czoKCkht
bSwgbm90IHN1cmUgd2hhdCdzIGdvaW5nIG9uLiAgTWF5YmUgSSBtaXNpbnRlcnByZXRlZCB3aHkg
YGdpdCBhbWAgd2FzIGZhaWxpbmc/CkkgYXNzdW1lZCBpdCB3YXMgYmVjYXVzZSB0aGVyZSB3ZXJl
IG9iamVjdHMgaW4ga3ZtYXJtIHRoYXQgSSBkaWRuJ3QgaGF2ZSBsb2NhbGx5LAphbmQgZmV0Y2hp
bmcga3ZtYXJtIGFsbG93ZWQgYW0gdG8gY29tcGxldGUsIHRob3VnaCB3aXRoIDMtd2F5IG1lcmdl
cywgd2hpY2ggSUlVQwpzaG91bGRuJ3QgaGF2ZSBiZWVuIG5lY2Vzc2FyeSBpZiBJIHdhcyB1c2lu
ZyB0aGUgZXhhY3Qgc2FtZSBiYXNlLiAgT3IgbWF5YmUgSQptZXNzZWQgdXAgYW5kIGRpZG4ndCBh
Y3R1YWxseSByZXNldCB0byA2LjUtcmMxLgoKPiAkIGdpdCBsb2cgLS1vbmVsaW5lIHVwc3RyZWFt
X3RsYmlfcmFuZ2VfdjkKPiA1MDI1ODU3NTA3YWJlICh1cHN0cmVhbV90bGJpX3JhbmdlX3Y5KSBL
Vk06IGFybTY0OiBVc2UgVExCSQo+IHJhbmdlLWJhc2VkIGluc3RydWN0aW9ucyBmb3IgdW5tYXAK
PiA1YzAyOTFiOTlhOGZjIEtWTTogYXJtNjQ6IEludmFsaWRhdGUgdGhlIHRhYmxlIGVudHJpZXMg
dXBvbiBhIHJhbmdlCj4gOGM0NmI1NGQ0YWFlYyBLVk06IGFybTY0OiBGbHVzaCBvbmx5IHRoZSBt
ZW1zbG90IGFmdGVyIHdyaXRlLXByb3RlY3QKPiAyMzFhYmFlYjdmZmMyIEtWTTogYXJtNjQ6IElt
cGxlbWVudCBrdm1fYXJjaF9mbHVzaF9yZW1vdGVfdGxic19yYW5nZSgpCj4gNWVjMjkxYjg2MzMw
OSBLVk06IGFybTY0OiBEZWZpbmUga3ZtX3RsYl9mbHVzaF92bWlkX3JhbmdlKCkKPiA1YmNkN2Ew
ODVjMzRlIEtWTTogYXJtNjQ6IEltcGxlbWVudCAgX19rdm1fdGxiX2ZsdXNoX3ZtaWRfcmFuZ2Uo
KQo+IGVhMDhmOWRmZjdlNWIgYXJtNjQ6IHRsYjogSW1wbGVtZW50IF9fZmx1c2hfczJfdGxiX3Jh
bmdlX29wKCkKPiBiMzE3ODY4Nzk0N2M5IGFybTY0OiB0bGI6IFJlZmFjdG9yIHRoZSBjb3JlIGZs
dXNoIGFsZ29yaXRobSBvZiBfX2ZsdXNoX3RsYl9yYW5nZQo+IGE0ODUwZmE5ODhlZWYgS1ZNOiBN
b3ZlIGt2bV9hcmNoX2ZsdXNoX3JlbW90ZV90bGJzX21lbXNsb3QoKSB0byBjb21tb24gY29kZQo+
IDMwNmRjNGU2YWZkMzcgS1ZNOiBBbGxvdyByYW5nZS1iYXNlZCBUTEIgaW52YWxpZGF0aW9uIGZy
b20gY29tbW9uIGNvZGUKPiBkMDI3ODVhMGExZTAxIEtWTTogUmVtb3ZlIENPTkZJR19IQVZFX0tW
TV9BUkNIX1RMQl9GTFVTSF9BTEwKPiAxMzZmYTJkMjU0NTM3IEtWTTogYXJtNjQ6IFVzZSBrdm1f
YXJjaF9mbHVzaF9yZW1vdGVfdGxicygpCj4gZTM1YzY4YTc1MTcwZCBLVk06IERlY2xhcmUga3Zt
X2FyY2hfZmx1c2hfcmVtb3RlX3RsYnMoKSBnbG9iYWxseQo+IDVkNTkyNzc3YjliYmEgS1ZNOiBS
ZW5hbWUga3ZtX2FyY2hfZmx1c2hfcmVtb3RlX3RsYigpIHRvCj4ga3ZtX2FyY2hfZmx1c2hfcmVt
b3RlX3RsYnMoKQo+IDA2YzJhZmI4NjJmOWQgKHRhZzogdjYuNS1yYzEsIHRhZzogbGludXgvdjYu
NS1yYzEpIExpbnV4IDYuNS1yYzEKPiBjMTkyYWM3MzU3NjgzIE1BSU5UQUlORVJTIDI6IEVsZWN0
cmljIEJvb2dhbG9vCj4gZjcxZjY0MjEwZDY5OCBNZXJnZSB0YWcgJ2RtYS1tYXBwaW5nLTYuNS0y
MDIzLTA3LTA5JyBvZgo+IGdpdDovL2dpdC5pbmZyYWRlYWQub3JnL3VzZXJzL2hjaC9kbWEtbWFw
cGluZwo+IC4uLgo+IAo+IElzbid0IHRoZSBjb21taXQsIDA2YzJhZmI4NjJmOWQgKDA2YzJhZmI4
NjJmOWQgKHRhZzogdjYuNS1yYzEsIHRhZzoKPiBsaW51eC92Ni41LXJjMSkgTGludXggNi41LXJj
MSkgdGhlICdiYXNlJyBjb21taXQ/CgpZYSwgc2hvdWxkIGJlLgoKRWl0aGVyIHdheSwgZXZlbiBp
ZiB0aGlzIGlzIFBFQktBQyBvbiBteSBlbmQsIHVzaW5nIC0tYmFzZSB3b3VsZCBiZSBuaWNlLCBl
LmcuCnRoZW4geW91IGNhbiBkZWZpbml0ZWx5IHNheSBpdCdzIG15IGZhdWx0IDstKQoKPiA+IFBs
ZWFzZSB0cnkgdG8gaW5jb3Jwb3JhdGUgZ2l0IGZvcm1hdC1wYXRjaCdzICItLWJhc2UiIG9wdGlv
biBpbnRvIHlvdXIgd29ya2Zsb3csCj4gPiBlLmcuIEkgZG8gImdpdCBmb3JtYXQtcGF0Y2ggLS1i
YXNlPUhFQUR+JG5yIiB3aGVyZSAkbnIgaXMgdGhlIG51bWJlciBvZiBwYXRjaGVzCj4gPiBJIGFt
IHBvc3RpbmcuCj4gPgo+ID4gSXQncyBub3QgZm9vbHByb29mLCBlLmcuIG15IGFwcHJvYWNoIGRv
ZXNuJ3QgaGVscCBpZiBJIGhhdmUgYSBsb2NhbCBwYXRjaCB0aGF0Cj4gPiBJJ20gbm90IHBvc3Rp
bmcsIGJ1dCA5OSUgb2YgdGhlIHRpbWUgaXQgSnVzdCBXb3JrcyBhbmQgZWxpbWluYXRlcyBhbnkg
YW1idWl0aXR5Lgo+ID4KPiA+IFlvdSBjYW4gYWxzbyBkbyAiLS1iYXNlPWF1dG8iLCBidXQgdGhh
dCBvbmx5IGRvZXMgdGhlIHJpZ2h0IHRoaW5nIGlmIHlvdXIgc2VyaWVzCj4gPiBoYXMgaXRzIHVw
c3RyZWFtIGJyYW5jaCBzZXQgdG8gdGhlIGJhc2UvdHJlZSB0aGF0IHlvdSB3YW50IHlvdXIgcGF0
Y2hlcyBhcHBsaWVkCj4gPiB0byAoSSB1c2UgdGhlIHVwc3RyZWFtIGJyYW5jaCBmb3IgYSBjb21w
bGV0ZWx5IGRpZmZlcmVudCBwdXJwb3NlIGZvciBteSBkZXYgYnJhbmNoZXMpLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
