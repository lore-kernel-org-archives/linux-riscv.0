Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E314FC001DE
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 00:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8VqTt6gBW1DJBD0lL5ac5vt1hp2Q69CSLHfnGXEvkKc=; b=bPDaTu9VoIDy51
	9poiMkil1QUzyeFmoMEa/RNLCtJFEoRm9EMId8RxsfR/yok8YYWSZ5ASQM9NY5s0u7d/VjBhkDXAD
	aF0EUEX+87hlairkDAPN28Bog/ARD+L1SFCcopH/NV99nxXRx50wibLaFVEZqYFuQEVAJp5FTCLc9
	xiou3qKB4peOHyg5GhfHvcJPYw8En/+l6wSPgsyOYKBmmsJA4z1PUxGf6AlqjoTsF4+2UJVsRY+Xr
	ZKFuACkataKU+pI9394QlzYfKo6DDO6L8u5chU0zxXUBgHBkO+GO6w6jtyMF0MJwTBszHGaflUwg+
	8cw9ggyjITBbARtAZ5Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQdTi-0003oA-1F;
	Tue, 01 Aug 2023 00:43:10 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQdTf-0003mw-2e
	for linux-riscv@lists.infradead.org;
	Tue, 01 Aug 2023 00:43:09 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-40c72caec5cso133991cf.0
        for <linux-riscv@lists.infradead.org>; Mon, 31 Jul 2023 17:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690850585; x=1691455385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wz5PQDI2T5JD79/VqNSh8cAHB4+Dq2pKqfYEsmYHYJc=;
        b=MFYDUohPKYqzUjmRdIik4Kf/M1i09cRnmwx/ISJELixqxj8gzvM0dEKMXyxYAMFbw3
         ReLM/cPUTz05PxclkqkBgVsoeT/7EH3dALymU5TM8n9AYViSu4kpjQw8g9TlIr5lYEdx
         STtN0tXmEUrwz4qA3H7UDuyRNjk2yzkj4bwdACzU8bzIwG8V1u6MRimG2rWhgHRiWHYy
         eXQ8o14YblAtdc0/rR4R99744OZdbLElco3n3qUL5oyzjog5namRFGU6L/NVq+oZEqqn
         QLVsLJdbOWotDUgFVkV6iklP9yVqIk7HEQLLekRiuMLcq+3DzGurl/ToVlHLeESVGYUY
         hxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690850585; x=1691455385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wz5PQDI2T5JD79/VqNSh8cAHB4+Dq2pKqfYEsmYHYJc=;
        b=HNTa5tlNKFz57aWSKuNOfzm9UiQkH6JMQySdSkUBcH4gaG5LKgUBLEAK121IYjn3DO
         r0UqM+BRnXoXT7/haROM+ioBeQFwpQYze4Nz2z6asA9SX8AeY4fNOUs8u+DOV7nRI5qW
         Jsndus4vqpRCEY50nBRJcxuypwnFmesiEs1/OQdWtqGB3xKkBV030EbthuRkIpNUqQiv
         Q+8QDnFfBScnlExrfmqpq2jdMQgV2ERMyiiDCNN6s4dGsydsS3h1FeNZ9G5KbRdM7mRr
         zCjHxmW0X74fk/6BdHAbGajyCZpHd1l4oRbVdpHU9AANhrweeKS/A53etoJqCT5BEKmE
         8AoQ==
X-Gm-Message-State: ABy/qLaCMOUhVcF5GJQf+oniNLH5jwB/yU4N537sW934lIVhZl39UOLQ
	QNHju3t8/JghbsvXuXYADHv1p0ptlFCP9nwa80ZG6A==
X-Google-Smtp-Source: APBJJlGp1HM0IIW5HWYh0WPnS7cydIdnyyIPn3xHA78fZgN1YFWKwQ3DKE5js9J5XfPxG82YjMXnoKhazzIIIJsIP5M=
X-Received: by 2002:a05:622a:1447:b0:3f4:f0fd:fe7e with SMTP id
 v7-20020a05622a144700b003f4f0fdfe7emr530327qtx.3.1690850585401; Mon, 31 Jul
 2023 17:43:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230722022251.3446223-1-rananta@google.com> <20230722022251.3446223-2-rananta@google.com>
 <87v8e5r6s6.wl-maz@kernel.org> <CAJHc60wtc2Usei3hKj1ykVRvBZFFCBOHMi9HCxnNvGK2dPFApA@mail.gmail.com>
 <ZMgqueePlmKvgUId@google.com>
In-Reply-To: <ZMgqueePlmKvgUId@google.com>
From: Raghavendra Rao Ananta <rananta@google.com>
Date: Mon, 31 Jul 2023 17:42:54 -0700
Message-ID: <CAJHc60xM+KsUKxtoqORnpzrRke4T-sob2uLJRMvBKwruipxnpw@mail.gmail.com>
Subject: Re: [PATCH v7 01/12] KVM: Rename kvm_arch_flush_remote_tlb() to kvm_arch_flush_remote_tlbs()
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
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Gavin Shan <gshan@redhat.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Shaoqin Huang <shahuang@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_174307_862180_02B32DC8 
X-CRM114-Status: GOOD (  30.59  )
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

T24gTW9uLCBKdWwgMzEsIDIwMjMgYXQgMjo0MuKAr1BNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgSnVsIDMxLCAyMDIzLCBSYWdoYXZl
bmRyYSBSYW8gQW5hbnRhIHdyb3RlOgo+ID4gT24gVGh1LCBKdWwgMjcsIDIwMjMgYXQgMzoyNOKA
r0FNIE1hcmMgWnluZ2llciA8bWF6QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBT
YXQsIDIyIEp1bCAyMDIzIDAzOjIyOjQwICswMTAwLAo+ID4gPiBSYWdoYXZlbmRyYSBSYW8gQW5h
bnRhIDxyYW5hbnRhQGdvb2dsZS5jb20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gRnJvbTogRGF2
aWQgTWF0bGFjayA8ZG1hdGxhY2tAZ29vZ2xlLmNvbT4KPiA+ID4gPgo+ID4gPiA+IFJlbmFtZSBr
dm1fYXJjaF9mbHVzaF9yZW1vdGVfdGxiKCkgYW5kIHRoZSBhc3NvY2lhdGVkIG1hY3JvCj4gPiA+
ID4gX19LVk1fSEFWRV9BUkNIX0ZMVVNIX1JFTU9URV9UTEIgdG8ga3ZtX2FyY2hfZmx1c2hfcmVt
b3RlX3RsYnMoKSBhbmQKPiA+ID4gPiBfX0tWTV9IQVZFX0FSQ0hfRkxVU0hfUkVNT1RFX1RMQlMg
cmVzcGVjdGl2ZWx5Lgo+ID4gPiA+Cj4gPiA+ID4gTWFraW5nIHRoZSBuYW1lIHBsdXJhbCBtYXRj
aGVzIGt2bV9mbHVzaF9yZW1vdGVfdGxicygpIGFuZCBtYWtlcyBpdCBtb3JlCj4gPiA+ID4gY2xl
YXIgdGhhdCB0aGlzIGZ1bmN0aW9uIGNhbiBhZmZlY3QgbW9yZSB0aGFuIG9uZSByZW1vdGUgVExC
Lgo+ID4gPiA+Cj4gPiA+ID4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQuCj4gPiA+ID4K
PiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBNYXRsYWNrIDxkbWF0bGFja0Bnb29nbGUuY29t
Pgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFJhZ2hhdmVuZHJhIFJhbyBBbmFudGEgPHJhbmFudGFA
Z29vZ2xlLmNvbT4KPiA+ID4gPiBSZXZpZXdlZC1ieTogR2F2aW4gU2hhbiA8Z3NoYW5AcmVkaGF0
LmNvbT4KPiA+ID4gPiBSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxt
ZEBsaW5hcm8ub3JnPgo+ID4gPiA+IFJldmlld2VkLWJ5OiBTaGFvcWluIEh1YW5nIDxzaGFodWFu
Z0ByZWRoYXQuY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICBhcmNoL21pcHMvaW5jbHVkZS9hc20v
a3ZtX2hvc3QuaCB8IDQgKystLQo+ID4gPiA+ICBhcmNoL21pcHMva3ZtL21pcHMuYyAgICAgICAg
ICAgICB8IDIgKy0KPiA+ID4gPiAgYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCAgfCA0
ICsrLS0KPiA+ID4gPiAgaW5jbHVkZS9saW51eC9rdm1faG9zdC5oICAgICAgICAgfCA0ICsrLS0K
PiA+ID4gPiAgdmlydC9rdm0va3ZtX21haW4uYyAgICAgICAgICAgICAgfCAyICstCj4gPiA+ID4g
IDUgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+ID4gPiA+
Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9pbmNsdWRlL2FzbS9rdm1faG9zdC5oIGIv
YXJjaC9taXBzL2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKPiA+ID4gPiBpbmRleCAwNGNlZGY5Zjg4
MTEuLjliMGFkOGYzYmYzMiAxMDA2NDQKPiA+ID4gPiAtLS0gYS9hcmNoL21pcHMvaW5jbHVkZS9h
c20va3ZtX2hvc3QuaAo+ID4gPiA+ICsrKyBiL2FyY2gvbWlwcy9pbmNsdWRlL2FzbS9rdm1faG9z
dC5oCj4gPiA+ID4gQEAgLTg5Niw3ICs4OTYsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQga3ZtX2Fy
Y2hfc2NoZWRfaW4oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBpbnQgY3B1KSB7fQo+ID4gPiA+ICBz
dGF0aWMgaW5saW5lIHZvaWQga3ZtX2FyY2hfdmNwdV9ibG9ja2luZyhzdHJ1Y3Qga3ZtX3ZjcHUg
KnZjcHUpIHt9Cj4gPiA+ID4gIHN0YXRpYyBpbmxpbmUgdm9pZCBrdm1fYXJjaF92Y3B1X3VuYmxv
Y2tpbmcoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KSB7fQo+ID4gPiA+Cj4gPiA+ID4gLSNkZWZpbmUg
X19LVk1fSEFWRV9BUkNIX0ZMVVNIX1JFTU9URV9UTEIKPiA+ID4gPiAtaW50IGt2bV9hcmNoX2Zs
dXNoX3JlbW90ZV90bGIoc3RydWN0IGt2bSAqa3ZtKTsKPiA+ID4gPiArI2RlZmluZSBfX0tWTV9I
QVZFX0FSQ0hfRkxVU0hfUkVNT1RFX1RMQlMKPiA+ID4gPiAraW50IGt2bV9hcmNoX2ZsdXNoX3Jl
bW90ZV90bGJzKHN0cnVjdCBrdm0gKmt2bSk7Cj4gPiA+Cj4gPiA+IEhvdyBhYm91dCBtYWtpbmcg
dGhpcyBwcm90b3R5cGUgZ2xvYmFsPyBJIGRvbid0IHNlZSBhIHBvaW50IGluIGhhdmluZwo+ID4g
PiBpdCBwZXItYXJjaGl0ZWN0dXJlLCBzcGVjaWFsbHkgYXMgeW91IGFyZSBhZGRpbmcgYXJtNjQg
dG8gdGhhdCBtaXggaW4KPiA+ID4gdGhlIGZvbGxvd2luZyBwYXRjaC4KPiA+ID4KPiA+IFdlIGNh
biBtYWtlIGl0IGdsb2JhbCwgYnV0IEknbSBub3Qgc3VyZSB3aGF0IHdhcyB0aGUgaW50ZW50aW9u
IG9mIHRoZQo+ID4gb3JpZ2luYWwgYXV0aG9yLiBNeSBndWVzcyBpcyB0aGF0IGhlIHdhcyBmb2xs
b3dpbmcgdGhlIHNhbWUgc3R5bGUgdGhhdAo+ID4gd2UgaGF2ZSBmb3Igc29tZSBvZiB0aGUgb3Ro
ZXIga3ZtX2FyY2hfKigpIGZ1bmN0aW9ucwo+ID4gKGt2bV9hcmNoX2ZyZWVfdm0oKSBmb3IgZXhh
bXBsZSk/Cj4KPiBIZWgsIEtWTSBoYXMgYSAqbG90KiBvZiBjb2RlIHRoYXQgd2FzIHdyaXR0ZW4g
d2l0aCBxdWVzdGlvbmFibGUgc3R5bGUuICBJIGFncmVlCj4gd2l0aCBNYXJjLCBJIGNhbid0IHRo
aW5rIG9mIGEgc2luZ2xlIHJlYXNvbiBub3QgdG8gaGF2ZSB0aGUgZGVmaW5pdGlvbiBpbiBjb21t
b24KPiBjb2RlLiAgRGVjbGFyaW5nIHRoZSBmdW5jdGlvbiBkb2Vzbid0IHByZWNsdWRlIGEgInN0
YXRpYyBpbmxpbmUiIGltcGxlbWVudGF0aW9uLAo+IGFuZCB3ZSBjb3VsZCBldmVuIGtlZXAgdGhl
IHByb3RvdHlwZSB1bmRlciBhbiAjaWZkZWYsIGUuZy4KPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L2xpbnV4L2t2bV9ob3N0LmggYi9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmgKPiBpbmRleCA5ZDNh
Yzc3MjBkYTkuLjVhYzY0ZjkzMzU0NyAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2t2bV9o
b3N0LmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmgKPiBAQCAtMTQ4NCw2ICsxNDg0
LDggQEAgc3RhdGljIGlubGluZSBpbnQga3ZtX2FyY2hfZmx1c2hfcmVtb3RlX3RsYihzdHJ1Y3Qg
a3ZtICprdm0pCj4gIHsKPiAgICAgICAgIHJldHVybiAtRU5PVFNVUFA7Cj4gIH0KPiArI2Vsc2UK
PiAraW50IGt2bV9hcmNoX2ZsdXNoX3JlbW90ZV90bGIoc3RydWN0IGt2bSAqa3ZtKTsKPiAgI2Vu
ZGlmCj4KPiAgI2lmZGVmIF9fS1ZNX0hBVkVfQVJDSF9OT05DT0hFUkVOVF9ETUEKPgpUaGFua3Mg
Zm9yIHRoZSBzdWdnZXN0aW9uczsgSSBjYW4gZ28gd2l0aCBhIGNvbW1vbiBkZWNsYXJhdGlvbi4g
QWxvbmcKd2l0aCB0aGF0LCBkbyB3ZSB3YW50IHRvIGtlZXAgZGVmaW5pbmcKX19LVk1fSEFWRV9B
UkNIX0ZMVVNIX1JFTU9URV9UTEJTIGluIHRoZSBhcmNoIGNvZGUgdGhhdCBzdXBwb3J0cyBpdCBv
cgpjb252ZXJ0IGl0IGludG8gYSBDT05GSUdfPwoKLSBSYWdoYXZlbmRyYQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
