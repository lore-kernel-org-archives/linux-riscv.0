Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7489C04A94
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 00:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Pt2xL6boQ0guwizTdCMSqq13w1opIqpjJZZ9eL9DJc=; b=UkzZUDgx6vM4kH
	w2+aeRTCfAqbLNtBJ2OhGsNbIWAubJ8DZO6KaPbj9fMcRK9Wjs41oLalHzwsvocRrgS7GNtFcdMTh
	91QUPgCxNtK03hbmbtCRAwI1LJzR1rEy/+acBO0eyLtghyYI+BK2QopXtyuUQhef47k0wAgw0+KHq
	7ylTaE0O/84QEEx+YH7ukQtRHoMqrzFbVLgOhjc9LutI7VRgY90OOfgiyyVQtQ+Ok4xEEpR++Mzst
	nSUlPrnaukF1K7mqkTO9l4vdGgyOTGUjJat7TMdkaqOLcjDdT/Szz+TqKAW3F3vaqXRrkdj8CzQTM
	E0+1OOHoIIMir+KjNuDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQdQv-0003Vk-34;
	Tue, 01 Aug 2023 00:40:17 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQdQs-0003Ty-1U
	for linux-riscv@lists.infradead.org;
	Tue, 01 Aug 2023 00:40:15 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-3460770afe2so30615ab.1
        for <linux-riscv@lists.infradead.org>; Mon, 31 Jul 2023 17:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690850410; x=1691455210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lQaJrQRUIiWVDCsAsh3n8+ThLFrN8Bh/awGWXHsDQe0=;
        b=aVcAiHgZKSA41yfjau5sn0kLRmUefICGRUqWSxWFrJPabknpsf37xFnhkfkJC3slWo
         91oO/teCA7rEBLT9/jqVl0I3w0vKM+fMIl1YqCUbA/rjydkD0AR/YZFtYf6nH1izkSrF
         xKBFggrAYblDXn/jMHHkbJNvSG33lwajusV8jSWSvb0c4Lz2rapmmWQHsqY/ONVhpByE
         3XGtvM20VEgq7GbSzk7nxPKs8B3a5rMkGJmSBlg5uTV3XP2hOeCTee2K4YqKZoAzNQKt
         QrhnKxe+2Bc1BuNej97Pv2MDvN4e/17QXLgjAzxwLeABWuygJ1AgQBF7RM3ubeWKOPly
         cxpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690850410; x=1691455210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lQaJrQRUIiWVDCsAsh3n8+ThLFrN8Bh/awGWXHsDQe0=;
        b=Z5iAAAdGxbZKXt/ZDkM3eRUS547VqNVYKs2+jrpEe6t58xWCmCSDkJyqClwYf+u/2E
         E2VzwYWdwZ2VJ1YHCbhB0qqoULPiqUhV72Dl5pTVCwORn1zo5DNaKan9oQD8AbfR6Quv
         aIiQAOn0YFgU4DvTY3W7fduiBm8stzAwYTJBttOPOUbgHmz5hTEzjwVHJF632qiA9rDm
         rIUsTcczTus5MhribAQsUWs/5ytizDFXhHunn+gm6PddxrOnZc8H02Av/bQKJ5rA3+mk
         cclsMcZxszDuOTS8Iqb3KOZW+9GUx8KB6ZaV3M50CzXU22XG59NjLAVlQsM27RHynLCf
         /0MA==
X-Gm-Message-State: ABy/qLZCXH30erkBIyw1Xx/rTOLwQf/C6fcGcTMaOFyZYw1dXkCEBgxL
	cCBD1GhVe18Oj9NCS6XKQB3m2mRtrMy9LqY6xnItog==
X-Google-Smtp-Source: APBJJlFeLAtZrNblceba5ioTZ4DaE3CnKkiRezjalaS8wXUAU6iXNC2RzAxTccCohDa4D2H3S0/XfoB4jVHw7a5eXhQ=
X-Received: by 2002:a05:6e02:1a09:b0:349:290:74e3 with SMTP id
 s9-20020a056e021a0900b00349029074e3mr626628ild.23.1690850410184; Mon, 31 Jul
 2023 17:40:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230722022251.3446223-1-rananta@google.com> <20230722022251.3446223-5-rananta@google.com>
 <ZMgtwp/YCZciRvdr@google.com>
In-Reply-To: <ZMgtwp/YCZciRvdr@google.com>
From: Raghavendra Rao Ananta <rananta@google.com>
Date: Mon, 31 Jul 2023 17:39:58 -0700
Message-ID: <CAJHc60xsNtnOpc8=XV_102A2sEESk=Scfhj7ktjNepQp2exw_A@mail.gmail.com>
Subject: Re: [PATCH v7 04/12] KVM: Allow range-based TLB invalidation from
 common code
To: Sean Christopherson <seanjc@google.com>
Cc: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Jing Zhang <jingzhangos@google.com>, 
	Reiji Watanabe <reijiw@google.com>, Colton Lewis <coltonlewis@google.com>, 
	David Matlack <dmatlack@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Gavin Shan <gshan@redhat.com>, Shaoqin Huang <shahuang@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_174014_505907_256069BC 
X-CRM114-Status: GOOD (  12.01  )
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

T24gTW9uLCBKdWwgMzEsIDIwMjMgYXQgMjo1NeKAr1BNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IE9uIFNhdCwgSnVsIDIyLCAyMDIzLCBSYWdoYXZl
bmRyYSBSYW8gQW5hbnRhIHdyb3RlOgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS9tbXUv
bW11LmMgYi9hcmNoL3g4Ni9rdm0vbW11L21tdS5jCj4gPiBpbmRleCBlYzE2OWY1YzdkY2UuLmVi
ODhkMjVmOTg5NiAxMDA2NDQKPiA+IC0tLSBhL2FyY2gveDg2L2t2bS9tbXUvbW11LmMKPiA+ICsr
KyBiL2FyY2gveDg2L2t2bS9tbXUvbW11LmMKPiA+IEBAIC0yNzgsMTYgKzI3OCwxNSBAQCBzdGF0
aWMgaW5saW5lIGJvb2wga3ZtX2F2YWlsYWJsZV9mbHVzaF9yZW1vdGVfdGxic19yYW5nZSh2b2lk
KQo+ID4gICAgICAgcmV0dXJuIGt2bV94ODZfb3BzLmZsdXNoX3JlbW90ZV90bGJzX3JhbmdlOwo+
ID4gIH0KPiA+Cj4gPiAtdm9pZCBrdm1fZmx1c2hfcmVtb3RlX3RsYnNfcmFuZ2Uoc3RydWN0IGt2
bSAqa3ZtLCBnZm5fdCBzdGFydF9nZm4sCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZ2ZuX3QgbnJfcGFnZXMpCj4gPiAraW50IGt2bV9hcmNoX2ZsdXNoX3JlbW90ZV90bGJzX3Jh
bmdlKHN0cnVjdCBrdm0gKmt2bSwgZ2ZuX3Qgc3RhcnRfZ2ZuLCB1NjQgcGFnZXMpCj4KPiBQbGVh
c2Uga2VlcCAibnJfcGFnZXMiLCBJIGhhdmUgYSB2ZXJ5IHN0cm9uZyBwcmVmZXJlbmNlIGZvciB0
aGF0IG92ZXIganVzdCAicGFnZXMiCj4gYXMgdGhlICJucl8iIG1ha2VzIGl0IHN1cGVyIG9idmlv
dXMgdGhhdCBpdCdzIGEgc2luZ2xlIG51bWJlciwgYXMgb3Bwb3NlZCB0byBhbgo+IGFycmF5IG9m
IHBhZ2VzIG9yIHNvbWV0aGluZy4KPgpTdXJlLCBJJ2xsIHJldmVydCBiYWNrIHRvICducl9wYWdl
cycuCgotIFJhZ2hhdmVuZHJhCj4gQW5kIGl0IGRvZXNuJ3QgdHJ1bHkgbWF0dGVyLCBidXQgSU1P
IHRoZSBnZm5fdCB0eXBlIGlzIG1vcmUgYXBwcm9wcmlhdGUgc2luY2UKPiB0aGUgZ2ZuIGFuZCB0
aGUgbnVtYmVyIG9mIHBhZ2VzIG5lZWQgdG8gaGF2ZSB0aGUgc2FtZSB0eXBlLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
