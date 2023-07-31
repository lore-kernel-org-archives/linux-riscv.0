Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FDA2C001E0
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 17:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ExSXQ+I+/k89UxxGy+gcTHiLfIRlEd0hEE3qfWtKzOk=; b=ND7gJrrIqoFmzS
	8XxCYknQrqcrkbYlJuxaOmJcRaapLziKgb2agQ/G01S4FkOc9XQhwh+h2flxescppmwZVPHcNXpAm
	TDkbWpPwp5fiebxwvLcLE0X1XfIS47tt0CaXHFX/vZr0qYwYw7X/keJRdCfxaTHMjH2udc84b6YD9
	Hk7UFNK421GpQLx6+z6hwo/Dtzn9uDAvrkkgtWH5FVcj0o1NY0whk+6AydultyodrP2VSUwqZ1iDt
	dWY/YvGjTL3+cY2RzLNsul54+zLbBnVrdJ7xr5A3vbYuYVDdBZ5MM95KA2n4qiPBioyG0+HBvHLl4
	K9ZGs/6bVB45g3DbpgEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQWje-00GrWa-0B;
	Mon, 31 Jul 2023 17:31:10 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQWjZ-00GrVM-1R
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 17:31:06 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3492e05be7cso7685ab.0
        for <linux-riscv@lists.infradead.org>; Mon, 31 Jul 2023 10:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690824664; x=1691429464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q03jsirrcpz9THZTEToDjGsCufQsuiDSytShuzuhytQ=;
        b=sORGvbtJhHxz53qrI/C6oraxYpTnjnsD8fulzoT4dhIBDQX2BnR3JuUM9pXznh0fVK
         0Q++QS9YBd6xZyRFZ45krv0aqCEokBCpd/ksYBupaCA6A92A58scXFedQYlh0k/k4C5r
         zId0p3PvqEPnRt5OU/Hwn5/TEFX9vZSKdXDZpHTqROf6CdWFvh35L9PfPXiugBLjPSJg
         4xk332WGEOIjrUYIWqdFinZaga1dIOvxx0x/8JSRVskIc3FfZSLuGYh/O8Eto/p3IxhW
         UYrRZcZL2C+X0esJUx4cUe1XLN8KMhWEmZW1V/Lb6UhZ7IMDvhGKObCAe9xtsJhQgGWN
         hRLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690824664; x=1691429464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q03jsirrcpz9THZTEToDjGsCufQsuiDSytShuzuhytQ=;
        b=JxsktWowadxaqz4wsKAWV6ppUZSF01eaOv/+HoBxgKYao5GLxoVRsaDr4AkRutWCay
         M/A6VNRzQZaBf6pJELHGLQEf2YxDUWk/Uz9GynV2+aFuV2mm2YDwf5McOGdYSE8AeXSh
         rfraQKINBmJF3WW+8gPqnYDV9cE6U11i7CBD1VWGZittQByhpfJEXParGU0+I4i59Rdf
         NUBGk1NOSu2cKqAoN7XwlVuU55fxFFt5FfMyS/hoJNRb+AwZwKTCgp3c1BkspLXy3Li1
         eLeBypr86/zwlLkzey7qR83UysrG9yhGK56O5upZhqbd+UjEL+qzyRAHyzas1jXas9Op
         DoAg==
X-Gm-Message-State: ABy/qLZc91XwNrBEYtDreSepHOaXJYL7AlqwfhhbE7lWy2hyfWsTjqvF
	cDbhnYwwREf2TURVzJoXJOsIe32VRrt3BHQVYLIchw==
X-Google-Smtp-Source: APBJJlHmjmYpt26t014ApaGi4Ojnes96IDMRRl/L7/toNT1PsolsYi/piLtNCaMzdPalSPaMz0fip/Zr0n5KeG8QyVE=
X-Received: by 2002:a05:6e02:1a09:b0:349:290:74e3 with SMTP id
 s9-20020a056e021a0900b00349029074e3mr505815ild.23.1690824664464; Mon, 31 Jul
 2023 10:31:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230722022251.3446223-1-rananta@google.com> <20230722022251.3446223-6-rananta@google.com>
 <87sf99r5gz.wl-maz@kernel.org>
In-Reply-To: <87sf99r5gz.wl-maz@kernel.org>
From: Raghavendra Rao Ananta <rananta@google.com>
Date: Mon, 31 Jul 2023 10:30:53 -0700
Message-ID: <CAJHc60xiGyV69a68UBabnzRK0NNycWWQ1kt=ZjJGmC2qzmadAg@mail.gmail.com>
Subject: Re: [PATCH v7 05/12] KVM: Move kvm_arch_flush_remote_tlbs_memslot()
 to common code
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Jing Zhang <jingzhangos@google.com>, 
	Reiji Watanabe <reijiw@google.com>, Colton Lewis <coltonlewis@google.com>, 
	David Matlack <dmatlack@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Gavin Shan <gshan@redhat.com>, Shaoqin Huang <shahuang@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_103105_508140_52E47201 
X-CRM114-Status: GOOD (  28.48  )
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

T24gVGh1LCBKdWwgMjcsIDIwMjMgYXQgMzo1M+KAr0FNIE1hcmMgWnluZ2llciA8bWF6QGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gU2F0LCAyMiBKdWwgMjAyMyAwMzoyMjo0NCArMDEwMCwKPiBS
YWdoYXZlbmRyYSBSYW8gQW5hbnRhIDxyYW5hbnRhQGdvb2dsZS5jb20+IHdyb3RlOgo+ID4KPiA+
IEZyb206IERhdmlkIE1hdGxhY2sgPGRtYXRsYWNrQGdvb2dsZS5jb20+Cj4gPgo+ID4gTW92ZSBr
dm1fYXJjaF9mbHVzaF9yZW1vdGVfdGxic19tZW1zbG90KCkgdG8gY29tbW9uIGNvZGUgYW5kIGRy
b3AKPiA+ICJhcmNoXyIgZnJvbSB0aGUgbmFtZS4ga3ZtX2FyY2hfZmx1c2hfcmVtb3RlX3RsYnNf
bWVtc2xvdCgpIGlzIGp1c3QgYQo+ID4gcmFuZ2UtYmFzZWQgVExCIGludmFsaWRhdGlvbiB3aGVy
ZSB0aGUgcmFuZ2UgaXMgZGVmaW5lZCBieSB0aGUgbWVtc2xvdC4KPiA+IE5vdyB0aGF0IGt2bV9m
bHVzaF9yZW1vdGVfdGxic19yYW5nZSgpIGNhbiBiZSBjYWxsZWQgZnJvbSBjb21tb24gY29kZSB3
ZQo+ID4gY2FuIGp1c3QgdXNlIHRoYXQgYW5kIGRyb3AgYSBidW5jaCBvZiBkdXBsaWNhdGUgY29k
ZSBmcm9tIHRoZSBhcmNoCj4gPiBkaXJlY3Rvcmllcy4KPiA+Cj4gPiBOb3RlIHRoaXMgYWRkcyBh
IGxvY2tkZXAgYXNzZXJ0aW9uIGZvciBzbG90c19sb2NrIGJlaW5nIGhlbGQgd2hlbgo+ID4gY2Fs
bGluZyBrdm1fZmx1c2hfcmVtb3RlX3RsYnNfbWVtc2xvdCgpLCB3aGljaCB3YXMgcHJldmlvdXNs
eSBvbmx5Cj4gPiBhc3NlcnRlZCBvbiB4ODYuIE1JUFMgaGFzIGNhbGxzIHRvIGt2bV9mbHVzaF9y
ZW1vdGVfdGxic19tZW1zbG90KCksCj4gPiBidXQgdGhleSBhbGwgaG9sZCB0aGUgc2xvdHNfbG9j
aywgc28gdGhlIGxvY2tkZXAgYXNzZXJ0aW9uIGNvbnRpbnVlcyB0bwo+ID4gaG9sZCB0cnVlLgo+
ID4KPiA+IEFsc28gZHJvcCB0aGUgQ09ORklHX0tWTV9HRU5FUklDX0RJUlRZTE9HX1JFQURfUFJP
VEVDVCBpZmRlZiBnYXRpbmcKPiA+IGt2bV9mbHVzaF9yZW1vdGVfdGxic19tZW1zbG90KCksIHNp
bmNlIGl0IGlzIG5vIGxvbmdlciBuZWNlc3NhcnkuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRGF2
aWQgTWF0bGFjayA8ZG1hdGxhY2tAZ29vZ2xlLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IFJhZ2hh
dmVuZHJhIFJhbyBBbmFudGEgPHJhbmFudGFAZ29vZ2xlLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBH
YXZpbiBTaGFuIDxnc2hhbkByZWRoYXQuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IFNoYW9xaW4gSHVh
bmcgPHNoYWh1YW5nQHJlZGhhdC5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL2FybTY0L2t2bS9hcm0u
YyAgICAgfCAgNiAtLS0tLS0KPiA+ICBhcmNoL21pcHMva3ZtL21pcHMuYyAgICAgfCAxMCArKy0t
LS0tLS0tCj4gPiAgYXJjaC9yaXNjdi9rdm0vbW11LmMgICAgIHwgIDYgLS0tLS0tCj4gPiAgYXJj
aC94ODYva3ZtL21tdS9tbXUuYyAgIHwgMTYgKy0tLS0tLS0tLS0tLS0tLQo+ID4gIGFyY2gveDg2
L2t2bS94ODYuYyAgICAgICB8ICAyICstCj4gPiAgaW5jbHVkZS9saW51eC9rdm1faG9zdC5oIHwg
IDcgKysrLS0tLQo+ID4gIHZpcnQva3ZtL2t2bV9tYWluLmMgICAgICB8IDE4ICsrKysrKysrKysr
KysrKystLQo+ID4gIDcgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgNDIgZGVsZXRp
b25zKC0pCj4gPgo+Cj4gWy4uLl0KPgo+ID4gZGlmZiAtLWdpdCBhL3ZpcnQva3ZtL2t2bV9tYWlu
LmMgYi92aXJ0L2t2bS9rdm1fbWFpbi5jCj4gPiBpbmRleCA4MDQ0NzBmY2NhYzcuLjU4MjEzY2M0
YjliOSAxMDA2NDQKPiA+IC0tLSBhL3ZpcnQva3ZtL2t2bV9tYWluLmMKPiA+ICsrKyBiL3ZpcnQv
a3ZtL2t2bV9tYWluLmMKPiA+IEBAIC0zNzksNiArMzc5LDIwIEBAIHZvaWQga3ZtX2ZsdXNoX3Jl
bW90ZV90bGJzX3JhbmdlKHN0cnVjdCBrdm0gKmt2bSwgZ2ZuX3QgZ2ZuLCB1NjQgcGFnZXMpCj4g
PiAgICAgICBrdm1fZmx1c2hfcmVtb3RlX3RsYnMoa3ZtKTsKPiA+ICB9Cj4gPgo+ID4gK3ZvaWQg
a3ZtX2ZsdXNoX3JlbW90ZV90bGJzX21lbXNsb3Qoc3RydWN0IGt2bSAqa3ZtLAo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGt2bV9tZW1vcnlfc2xvdCAq
bWVtc2xvdCkKPiA+ICt7Cj4gPiArICAgICAvKgo+ID4gKyAgICAgICogQWxsIGN1cnJlbnQgdXNl
IGNhc2VzIGZvciBmbHVzaGluZyB0aGUgVExCcyBmb3IgYSBzcGVjaWZpYyBtZW1zbG90Cj4gPiAr
ICAgICAgKiByZWxhdGVkIHRvIGRpcnR5IGxvZ2dpbmcsIGFuZCBtYW55IGRvIHRoZSBUTEIgZmx1
c2ggb3V0IG9mIG1tdV9sb2NrLgo+Cj4gSSBhcHByZWNpYXRlIHRoaXMgaXMgYSBjb3B5IHBhc3Rl
IG9mIGFuIGV4aXN0aW5nIGNvbW1lbnQsIGJ1dCBJIGNhbid0Cj4gcGFyc2UgaXQuIE15IGNvbW1h
bmQgb2YgdGhlIEVuZ2xpc2ggbGFuZ3VhZ2UgaXMgbm90b3Jpb3VzbHkKPiBhcHByb3hpbWF0ZSwg
YnV0IGl0IGZlZWxzIHRoYXQgc29tZXRoaW5nIGlzIG1pc3NpbmcgaW4gdGhlIGZpcnN0Cj4gc2Vu
dGVuY2UsIHN1Y2ggYXMgYSB2ZXJiLgo+Ck5vLCB5b3UgYXJlIHJpZ2h0LiBUaGUgc2VudGVuY2Ug
aXMgYnJva2VuLCBwcm9iYWJseSBhIG1pc3NpbmcgImFyZSIgYXQKdGhlIGVuZCBvZiB0aGUgZmly
c3QgbGluZS4gSSdsbCBmaXggaXQuCgotIFJhZ2hhdmVuZHJhCj4gICAgICAgICBNLgo+Cj4gLS0K
PiBXaXRob3V0IGRldmlhdGlvbiBmcm9tIHRoZSBub3JtLCBwcm9ncmVzcyBpcyBub3QgcG9zc2li
bGUuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
