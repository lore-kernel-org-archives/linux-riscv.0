Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDC7C001E0
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 18:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X/taAE5SRdhbQAO0obZpibEIE7AMvmHaybpguE7O5f8=; b=FPXd7ooKq9tG1Q
	ftMqhqASMRBmFO/vjaRed2AtffQs3OK2koU/fSKvP1qitatAzA6bPIDk2HR9YzxC2kO4urYcFcH4k
	zpiDYJ8NiZ6ZZvJ7zj09QkuFB/mxXQ/hAsDFr0+S0XBSl6qBOGYmOaQK9J2rLAfGwFrDQK7Yl7xvx
	1oY/Dcmnde6GOH2pD/kkD01bYnQHjY9UmALHyQoZ8k5lrgCZoEttQwMuUt7tF90iY2B03p5ZXEp8y
	61g8sCGqM0TBsTurNxAkjU1EwNQda93+uCwBHyxiP9j1JorpBJZgDzlmhD8JrukNEOZYGKrtCVFkC
	6f/s3xVpHJBHAKI6YU4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQXDg-00GvbG-05;
	Mon, 31 Jul 2023 18:02:12 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQXDc-00GvZw-2y
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 18:02:10 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-40c72caec5cso31711cf.0
        for <linux-riscv@lists.infradead.org>; Mon, 31 Jul 2023 11:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690826525; x=1691431325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X0gCxxFfGpH7+EO1EgURYZAY2bdhrbnISyF1lBRoK6A=;
        b=qZXJd0+ffo+L4HQlrADJFOpNsrtneEkEjKGaCenKWHHQEco9dlSNxersD+gpofApiW
         o02MZh+LdJtBnpNbTaunNFo/yrUZVDlYroTi00ctwRDARSeVylQBSOGLLV6g3BPsFik1
         4KZESg4WwqRH2heMDI/gKOTA96YxqAHdeR6cwsxRS352/fhcTvniO25FMpqKBC+vkbG+
         7U3kQrA7UwBFicH5pD7tews8lYXa8aG2Rtx/WHVJ50zWYGSnD/DEpHGm5+dNWqrCjKzK
         vrB7i6HMlTdlHH7oSEErO/ezx1jdtNdTdwaGk/ao8HCv4z3XUdYfTfahIP4mt6yralea
         cWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690826525; x=1691431325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X0gCxxFfGpH7+EO1EgURYZAY2bdhrbnISyF1lBRoK6A=;
        b=XfGrUvNRW4jwpMfxx4eRVpj7h5ifSL2hSPoyitSeZM3/na4PXRVR/ckdE8DpnaJJIf
         QsrHRT2e16JooNdJgvuWkS/wvV/lb248k/p6qe/S7vUFKthEWuR5Y9GHV+mvqp7/ipkH
         Bcr7L9h+4VrZaOdbmBMx+RBjHIGDDTNi/UOgp+cMfZ42fA7LT7UzgRSuDY0b95SHoNXU
         yKf9mz96aONLZBFH8GuVAnw4nS0Z/DS+Tpn39mHnOAGS0gsku+bDZ1RNGMM50QksuWTz
         c/jgiUfqIzjJQ4vo/EyBbFlRk4L2E1jjd66LfXPqkbnLSqPpqZzlT8arKDLXQsuii7w6
         LYbw==
X-Gm-Message-State: ABy/qLascQUbhx8EOvVtekjPJdhdsMtI4IKq0oA7PQHKQ8JexicSDlBX
	Jk1N+8Bfj9vzxpN1tGWaragQ5/TirWY+S1JbIGx/jw==
X-Google-Smtp-Source: APBJJlEBpxAr+gWpuQ40S4Mxoz6DvPL1ZVwppPhat0hf9uVLuJsVRwWK349Eb3xEO5XCaxjIBjS+YDqgeGbyrEVO6AI=
X-Received: by 2002:a05:622a:104d:b0:403:9572:e37f with SMTP id
 f13-20020a05622a104d00b004039572e37fmr425212qte.22.1690826524611; Mon, 31 Jul
 2023 11:02:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230722022251.3446223-1-rananta@google.com> <20230722022251.3446223-9-rananta@google.com>
 <87o7jxr06t.wl-maz@kernel.org> <87lef1qzim.wl-maz@kernel.org>
In-Reply-To: <87lef1qzim.wl-maz@kernel.org>
From: Raghavendra Rao Ananta <rananta@google.com>
Date: Mon, 31 Jul 2023 11:01:53 -0700
Message-ID: <CAJHc60xC-Bs-0uoqkytDVcwHTxVnW7eyVxfHhO0mRrupVbdaYg@mail.gmail.com>
Subject: Re: [PATCH v7 08/12] KVM: arm64: Define kvm_tlb_flush_vmid_range()
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
X-CRM114-CacheID: sfid-20230731_110208_963811_2D75FC43 
X-CRM114-Status: GOOD (  23.63  )
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

T24gVGh1LCBKdWwgMjcsIDIwMjMgYXQgNjowMeKAr0FNIE1hcmMgWnluZ2llciA8bWF6QGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCAyNyBKdWwgMjAyMyAxMzo0NzowNiArMDEwMCwKPiBN
YXJjIFp5bmdpZXIgPG1hekBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBTYXQsIDIyIEp1
bCAyMDIzIDAzOjIyOjQ3ICswMTAwLAo+ID4gUmFnaGF2ZW5kcmEgUmFvIEFuYW50YSA8cmFuYW50
YUBnb29nbGUuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gSW1wbGVtZW50IHRoZSBoZWxwZXIga3Zt
X3RsYl9mbHVzaF92bWlkX3JhbmdlKCkgdGhhdCBhY3RzCj4gPiA+IGFzIGEgd3JhcHBlciBmb3Ig
cmFuZ2UtYmFzZWQgVExCIGludmFsaWRhdGlvbnMuIEZvciB0aGUKPiA+ID4gZ2l2ZW4gVk1JRCwg
dXNlIHRoZSByYW5nZS1iYXNlZCBUTEJJIGluc3RydWN0aW9ucyB0byBkbwo+ID4gPiB0aGUgam9i
IG9yIGZhbGxiYWNrIHRvIGludmFsaWRhdGluZyBhbGwgdGhlIFRMQiBlbnRyaWVzLgo+ID4gPgo+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBSYWdoYXZlbmRyYSBSYW8gQW5hbnRhIDxyYW5hbnRhQGdvb2ds
ZS5jb20+Cj4gPiA+IFJldmlld2VkLWJ5OiBHYXZpbiBTaGFuIDxnc2hhbkByZWRoYXQuY29tPgo+
ID4gPiBSZXZpZXdlZC1ieTogU2hhb3FpbiBIdWFuZyA8c2hhaHVhbmdAcmVkaGF0LmNvbT4KPiA+
ID4gLS0tCj4gPiA+ICBhcmNoL2FybTY0L2luY2x1ZGUvYXNtL2t2bV9wZ3RhYmxlLmggfCAxMCAr
KysrKysrKysrCj4gPiA+ICBhcmNoL2FybTY0L2t2bS9oeXAvcGd0YWJsZS5jICAgICAgICAgfCAy
MCArKysrKysrKysrKysrKysrKysrKwo+ID4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAzMCBpbnNlcnRp
b25zKCspCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL2t2
bV9wZ3RhYmxlLmggYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL2t2bV9wZ3RhYmxlLmgKPiA+ID4g
aW5kZXggODI5NGE5YTdlNTY2Li41ZThiMWZmMDc4NTQgMTAwNjQ0Cj4gPiA+IC0tLSBhL2FyY2gv
YXJtNjQvaW5jbHVkZS9hc20va3ZtX3BndGFibGUuaAo+ID4gPiArKysgYi9hcmNoL2FybTY0L2lu
Y2x1ZGUvYXNtL2t2bV9wZ3RhYmxlLmgKPiA+ID4gQEAgLTc1NCw0ICs3NTQsMTQgQEAgZW51bSBr
dm1fcGd0YWJsZV9wcm90IGt2bV9wZ3RhYmxlX3N0YWdlMl9wdGVfcHJvdChrdm1fcHRlX3QgcHRl
KTsKPiA+ID4gICAqICAgIGt2bV9wZ3RhYmxlX3Byb3QgZm9ybWF0Lgo+ID4gPiAgICovCj4gPiA+
ICBlbnVtIGt2bV9wZ3RhYmxlX3Byb3Qga3ZtX3BndGFibGVfaHlwX3B0ZV9wcm90KGt2bV9wdGVf
dCBwdGUpOwo+ID4gPiArCj4gPiA+ICsvKioKPiA+ID4gKyAqIGt2bV90bGJfZmx1c2hfdm1pZF9y
YW5nZSgpIC0gSW52YWxpZGF0ZS9mbHVzaCBhIHJhbmdlIG9mIFRMQiBlbnRyaWVzCj4gPiA+ICsg
Kgo+ID4gPiArICogQG1tdTogICBTdGFnZS0yIEtWTSBNTVUgc3RydWN0Cj4gPiA+ICsgKiBAYWRk
cjogIFRoZSBiYXNlIEludGVybWVkaWF0ZSBwaHlzaWNhbCBhZGRyZXNzIGZyb20gd2hpY2ggdG8g
aW52YWxpZGF0ZQo+ID4gPiArICogQHNpemU6ICBTaXplIG9mIHRoZSByYW5nZSBmcm9tIHRoZSBi
YXNlIHRvIGludmFsaWRhdGUKPiA+ID4gKyAqLwo+ID4gPiArdm9pZCBrdm1fdGxiX2ZsdXNoX3Zt
aWRfcmFuZ2Uoc3RydWN0IGt2bV9zMl9tbXUgKm1tdSwKPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHBoeXNfYWRkcl90IGFkZHIsIHNpemVfdCBzaXplKTsKPiA+ID4gICNlbmRpZiAg
ICAgLyogX19BUk02NF9LVk1fUEdUQUJMRV9IX18gKi8KPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gv
YXJtNjQva3ZtL2h5cC9wZ3RhYmxlLmMgYi9hcmNoL2FybTY0L2t2bS9oeXAvcGd0YWJsZS5jCj4g
PiA+IGluZGV4IGFhNzQwYTk3NGUwMi4uNWQxNGQ1ZDU4MTlhIDEwMDY0NAo+ID4gPiAtLS0gYS9h
cmNoL2FybTY0L2t2bS9oeXAvcGd0YWJsZS5jCj4gPiA+ICsrKyBiL2FyY2gvYXJtNjQva3ZtL2h5
cC9wZ3RhYmxlLmMKPiA+ID4gQEAgLTY3MCw2ICs2NzAsMjYgQEAgc3RhdGljIGJvb2wgc3RhZ2Uy
X2hhc19md2Ioc3RydWN0IGt2bV9wZ3RhYmxlICpwZ3QpCj4gPiA+ICAgICByZXR1cm4gIShwZ3Qt
PmZsYWdzICYgS1ZNX1BHVEFCTEVfUzJfTk9GV0IpOwo+ID4gPiAgfQo+ID4gPgo+ID4gPiArdm9p
ZCBrdm1fdGxiX2ZsdXNoX3ZtaWRfcmFuZ2Uoc3RydWN0IGt2bV9zMl9tbXUgKm1tdSwKPiA+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgIHBoeXNfYWRkcl90IGFkZHIsIHNpemVfdCBzaXpl
KQo+ID4gPiArewo+ID4gPiArICAgdW5zaWduZWQgbG9uZyBwYWdlcywgaW52YWxfcGFnZXM7Cj4g
PiA+ICsKPiA+ID4gKyAgIGlmICghc3lzdGVtX3N1cHBvcnRzX3RsYl9yYW5nZSgpKSB7Cj4gPiA+
ICsgICAgICAgICAgIGt2bV9jYWxsX2h5cChfX2t2bV90bGJfZmx1c2hfdm1pZCwgbW11KTsKPiA+
ID4gKyAgICAgICAgICAgcmV0dXJuOwo+ID4gPiArICAgfQo+ID4gPiArCj4gPiA+ICsgICBwYWdl
cyA9IHNpemUgPj4gUEFHRV9TSElGVDsKPiA+ID4gKyAgIHdoaWxlIChwYWdlcyA+IDApIHsKPiA+
ID4gKyAgICAgICAgICAgaW52YWxfcGFnZXMgPSBtaW4ocGFnZXMsIE1BWF9UTEJJX1JBTkdFX1BB
R0VTKTsKPiA+ID4gKyAgICAgICAgICAga3ZtX2NhbGxfaHlwKF9fa3ZtX3RsYl9mbHVzaF92bWlk
X3JhbmdlLCBtbXUsIGFkZHIsIGludmFsX3BhZ2VzKTsKPiA+ID4gKwo+ID4gPiArICAgICAgICAg
ICBhZGRyICs9IGludmFsX3BhZ2VzIDw8IFBBR0VfU0hJRlQ7Cj4gPiA+ICsgICAgICAgICAgIHBh
Z2VzIC09IGludmFsX3BhZ2VzOwo+ID4gPiArICAgfQo+ID4gPiArfQo+ID4gPiArCj4gPgo+ID4g
VGhpcyByZWFsbHkgc2hvdWxkbid0IGxpdmUgaW4gcGd0YWJsZS5jLiBUaGlzIGNvZGUgZ2V0cyBs
aW5rZWQgaW50bwo+ID4gdGhlIEVMMiBvYmplY3QuIFdoYXQgZG8geW91IHRoaW5rIGhhcHBlbnMg
aWYsIGZvciBzb21lIHJlYXNvbiwgdGhpcwo+ID4gZ2V0cyBjYWxsZWQgKmZyb20gRUwyKj8KPgo+
IEFoLCBhY3R1YWxseSwgbm90aGluZyB0b28gYmFkIHdvdWxkIGhhcHBlbiwgYXMgd2UgY29udmVy
dCB0aGUKPiBrdm1fY2FsbF9oeXAoKSBpbnRvIGEgZnVuY3Rpb24gY2FsbC4KPgo+IEJ1dCBzdGls
bCwgd2UgZG9uJ3QgbmVlZCB0d28gY29waWVzIG9mIHRoaXMgc3R1ZmYsIGFuZCBpdCBjYW4gbGl2
ZSBpbgo+IG1tdS5jLgo+CkJ1dCBzaW5jZSB3ZSBoYXZlIGEgY291cGxlIG9mIHJlZmVyZW5jZXMg
aW4gcGd0YWJsZS5jIHRvCmt2bV90bGJfZmx1c2hfdm1pZF9yYW5nZSgpLCB3b3VsZG4ndCB0aGF0
IGJlIGFuIChsaW5raW5nKSBpc3N1ZSBpZiB3ZQptb3ZlZCB0aGUgZGVmaW5pdGlvbiB0byBtbXUu
Yz8KCmxkOiBlcnJvcjogdW5kZWZpbmVkIHN5bWJvbDogX19rdm1fbnZoZV9rdm1fdGxiX2ZsdXNo
X3ZtaWRfcmFuZ2UKPj4+IHJlZmVyZW5jZWQgYnkgcGd0YWJsZS5jOjExNDggKC4vYXJjaC9hcm02
NC9rdm0vaHlwL252aGUvLi4vcGd0YWJsZS5jOjExNDgpCj4+PiAgICAgICAgICAgICAgIGFyY2gv
YXJtNjQva3ZtL2h5cC9udmhlL2t2bV9udmhlLm86KF9fa3ZtX252aGVfa3ZtX3BndGFibGVfc3Rh
Z2UyX3VubWFwKSBpbiBhcmNoaXZlIHZtbGludXguYQouLi4KCk9yIGlzIHRoZXJlIHNvbWUgb3Ro
ZXIgd2F5IHRvIG1ha2UgaXQgd29yaz8KCi0gUmFnaGF2ZW5kcmEKCj4gICAgICAgICBNLgo+Cj4g
LS0KPiBXaXRob3V0IGRldmlhdGlvbiBmcm9tIHRoZSBub3JtLCBwcm9ncmVzcyBpcyBub3QgcG9z
c2libGUuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
