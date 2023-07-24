Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D517C0015E
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 16:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CSkc4w0cIwGnBIBjEMfCtwYteHal2hiJB1ES+u6/1Co=; b=vNZRhfv7ZH8bPB
	6PgdPt7ro830CGc5WHWmXqvScm4r8fv57IPKSh8i6TM959CxpOqq3N6lWHTWjrM0+CErnYPxZIv0c
	aA1FMEQ7FX/SKwS0AF9I1QU5MPTYiVM9G34ljz4D91IJbFZP40FGv4IWzbp1sXro1QQgYQN82ChTG
	564qMHMxhrawYkvxKzeft0os8fjCzDKAj7OY3W/d2tjRmZ+TpFa5E+1qJJBKJEcSpm3dw6mnFgRrN
	B6LqBlivOQYAcgpmGE2J94OilNS4cOZAHyIYY61bn0y3MiKlLbhGDcpzP8YM5ulvDGJLaorPDyurC
	TRxEiio0iY7n9q9ZcvrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNyj7-004v1h-0p;
	Mon, 24 Jul 2023 16:48:05 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNyj3-004v05-0R
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 16:48:03 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3460770afe2so299705ab.1
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jul 2023 09:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690217278; x=1690822078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gK3B5wZw1OFgk2DT1iEhz+umMy+9ra8FX/pBQvU+W/w=;
        b=xY3tx3WTK4KdOY0TvcsLtqmIECu15VlVbTEUqZLznKTrcEQ3qq9MZ8A73xGTPHFhur
         A/0lC2YaasiB2qtLY96CMo7gEkIDOmPcUEvCDuOPhXiO41+3fvy2/Skq1jEll2CJZ4lB
         wyvmFXGj4o8we+38ahIX0hi2cof+wdyVSxg0IuxH6YMIzNwMT6/bsiJ/gjrGwSSgyJjB
         nLN8V8tWusmsM+7/fZZ4n+x9rbksRwiIno10akUtzIy+PPeQIuE7QuixtX1MDApQ0wfG
         +Jl9ixl11ZsGp2pA/Fh2BIytERW9S4aYDU7b7oeTBewyBL4tWEcTlqqwi4vIUmQP0co3
         8Khw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690217278; x=1690822078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gK3B5wZw1OFgk2DT1iEhz+umMy+9ra8FX/pBQvU+W/w=;
        b=f8NLM/BZ4fCRXCn5MiU8AA2/1KMzlZ8EbCIisIkSUjAstQqiZo1IUAyY8z8Rou81ey
         v0RXv9kB8o9UjDw0qL8emumRrVyaRHeJ3p8XnVKCxbq6acqYRFX3quhQUv3WRTaVf/iL
         SCqREeCNcLw30J21na3v+W3ZQXyUuWUbN4CnFooNod2L6VM0vdjVo4ITYIm7AJZ9cI5f
         AAFcy47AWTUK5D5kPoBoE6FRult+wB07XeBq3x8RN4ztO78J1CqZoNOP0LoLoXz6ZLLN
         9OLHir2f4xRp8TR8v2LvzlO/vFaJGDIoM+MCm1cQ3wknWVDRgNv264DLLBmKD3BoecBf
         juTw==
X-Gm-Message-State: ABy/qLasanpnFi+W3vV3DibA9UkUZayCwAOudjKA9XqXnPQe958mH0tE
	19FFsjUls9X8Dhd0L/g0Slqp+E1NNn3rNmy631smyA==
X-Google-Smtp-Source: APBJJlFsPT/IwrE4lZVNtp/1e+lmtgN7VA69U7UflS8F9GMvZ0xsWoBJPqsBR24E0XAF1wZyOEEj+fEvQ3/vP7Be/nQ=
X-Received: by 2002:a05:6e02:1a0d:b0:348:cfeb:f52 with SMTP id
 s13-20020a056e021a0d00b00348cfeb0f52mr272705ild.7.1690217278012; Mon, 24 Jul
 2023 09:47:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230722022251.3446223-1-rananta@google.com> <20230722022251.3446223-13-rananta@google.com>
 <0841aca6-2824-6a1b-a568-119f8bd220de@redhat.com>
In-Reply-To: <0841aca6-2824-6a1b-a568-119f8bd220de@redhat.com>
From: Raghavendra Rao Ananta <rananta@google.com>
Date: Mon, 24 Jul 2023 09:47:46 -0700
Message-ID: <CAJHc60znT5ThqKE3TgTW-0Us3oNv8+KF=81TSK0PbG3tTyJLFQ@mail.gmail.com>
Subject: Re: [PATCH v7 12/12] KVM: arm64: Use TLBI range-based intructions for unmap
To: Shaoqin Huang <shahuang@redhat.com>
Cc: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Jing Zhang <jingzhangos@google.com>, Reiji Watanabe <reijiw@google.com>, 
	Colton Lewis <coltonlewis@google.com>, David Matlack <dmatlack@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_094801_173079_09EB19CA 
X-CRM114-Status: GOOD (  30.40  )
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

T24gTW9uLCBKdWwgMjQsIDIwMjMgYXQgMjozNeKAr0FNIFNoYW9xaW4gSHVhbmcgPHNoYWh1YW5n
QHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gSGkgUmFnaGF2ZW5kcmEsCj4KPiBPbiA3LzIyLzIzIDEw
OjIyLCBSYWdoYXZlbmRyYSBSYW8gQW5hbnRhIHdyb3RlOgo+ID4gVGhlIGN1cnJlbnQgaW1wbGVt
ZW50YXRpb24gb2YgdGhlIHN0YWdlLTIgdW5tYXAgd2Fsa2VyIHRyYXZlcnNlcwo+ID4gdGhlIGdp
dmVuIHJhbmdlIGFuZCwgYXMgYSBwYXJ0IG9mIGJyZWFrLWJlZm9yZS1tYWtlLCBwZXJmb3Jtcwo+
ID4gVExCIGludmFsaWRhdGlvbnMgd2l0aCBhIERTQiBmb3IgZXZlcnkgUFRFLiBBIG11bHRpdHVk
ZSBvZiB0aGlzCj4gPiBjb21iaW5hdGlvbiBjb3VsZCBjYXVzZSBhIHBlcmZvcm1hbmNlIGJvdHRs
ZW5lY2sgb24gc29tZSBzeXN0ZW1zLgo+ID4KPiA+IEhlbmNlLCBpZiB0aGUgc3lzdGVtIHN1cHBv
cnRzIEZFQVRfVExCSVJBTkdFLCBkZWZlciB0aGUgVExCCj4gPiBpbnZhbGlkYXRpb25zIHVudGls
IHRoZSBlbnRpcmUgd2FsayBpcyBmaW5pc2hlZCwgYW5kIHRoZW4KPiA+IHVzZSByYW5nZS1iYXNl
ZCBpbnN0cnVjdGlvbnMgdG8gaW52YWxpZGF0ZSB0aGUgVExCcyBpbiBvbmUgZ28uCj4gPiBDb25k
aXRpb24gZGVmZXJyZWQgVExCIGludmFsaWRhdGlvbiBvbiB0aGUgc3lzdGVtIHN1cHBvcnRpbmcg
RldCLAo+ID4gYXMgdGhlIG9wdGltaXphdGlvbiBpcyBlbnRpcmVseSBwb2ludGxlc3Mgd2hlbiB0
aGUgdW5tYXAgd2Fsa2VyCj4gPiBuZWVkcyB0byBwZXJmb3JtIENNT3MuCj4gPgo+ID4gUmVuYW1l
IHN0YWdlMl9wdXRfcHRlKCkgdG8gc3RhZ2UyX3VubWFwX3B1dF9wdGUoKSBhcyB0aGUgZnVuY3Rp
b24KPiA+IG5vdyBzZXJ2ZXMgdGhlIHN0YWdlLTIgdW5tYXAgd2Fsa2VyIHNwZWNpZmljYWxseSwg
cmF0aGVyIHRoYW4KPiA+IGFjdGluZyBnZW5lcmljLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFJh
Z2hhdmVuZHJhIFJhbyBBbmFudGEgPHJhbmFudGFAZ29vZ2xlLmNvbT4KPiA+IC0tLQo+ID4gICBh
cmNoL2FybTY0L2t2bS9oeXAvcGd0YWJsZS5jIHwgNjcgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKy0tLS0tCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA1OCBpbnNlcnRpb25zKCspLCA5IGRl
bGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2t2bS9oeXAvcGd0YWJs
ZS5jIGIvYXJjaC9hcm02NC9rdm0vaHlwL3BndGFibGUuYwo+ID4gaW5kZXggNWVmMDk4YWYxNzM2
Li5jZjg4OTMzYTJlYTAgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL2FybTY0L2t2bS9oeXAvcGd0YWJs
ZS5jCj4gPiArKysgYi9hcmNoL2FybTY0L2t2bS9oeXAvcGd0YWJsZS5jCj4gPiBAQCAtODMxLDE2
ICs4MzEsNTQgQEAgc3RhdGljIHZvaWQgc3RhZ2UyX21ha2VfcHRlKGNvbnN0IHN0cnVjdCBrdm1f
cGd0YWJsZV92aXNpdF9jdHggKmN0eCwga3ZtX3B0ZV90IG4KPiA+ICAgICAgIHNtcF9zdG9yZV9y
ZWxlYXNlKGN0eC0+cHRlcCwgbmV3KTsKPiA+ICAgfQo+ID4KPiA+IC1zdGF0aWMgdm9pZCBzdGFn
ZTJfcHV0X3B0ZShjb25zdCBzdHJ1Y3Qga3ZtX3BndGFibGVfdmlzaXRfY3R4ICpjdHgsIHN0cnVj
dCBrdm1fczJfbW11ICptbXUsCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGt2
bV9wZ3RhYmxlX21tX29wcyAqbW1fb3BzKQo+ID4gK3N0cnVjdCBzdGFnZTJfdW5tYXBfZGF0YSB7
Cj4gPiArICAgICBzdHJ1Y3Qga3ZtX3BndGFibGUgKnBndDsKPiA+ICsgICAgIGJvb2wgZGVmZXJf
dGxiX2ZsdXNoX2luaXQ7Cj4gPiArfTsKPiA+ICsKPiA+ICtzdGF0aWMgYm9vbCBfX3N0YWdlMl91
bm1hcF9kZWZlcl90bGJfZmx1c2goc3RydWN0IGt2bV9wZ3RhYmxlICpwZ3QpCj4gPiArewo+ID4g
KyAgICAgLyoKPiA+ICsgICAgICAqIElmIEZFQVRfVExCSVJBTkdFIGlzIGltcGxlbWVudGVkLCBk
ZWZlciB0aGUgaW5kaXZpZHVhbAo+ID4gKyAgICAgICogVExCIGludmFsaWRhdGlvbnMgdW50aWwg
dGhlIGVudGlyZSB3YWxrIGlzIGZpbmlzaGVkLCBhbmQKPiA+ICsgICAgICAqIHRoZW4gdXNlIHRo
ZSByYW5nZS1iYXNlZCBUTEJJIGluc3RydWN0aW9ucyB0byBkbyB0aGUKPiA+ICsgICAgICAqIGlu
dmFsaWRhdGlvbnMuIENvbmRpdGlvbiBkZWZlcnJlZCBUTEIgaW52YWxpZGF0aW9uIG9uIHRoZQo+
ID4gKyAgICAgICogc3lzdGVtIHN1cHBvcnRpbmcgRldCLCBhcyB0aGUgb3B0aW1pemF0aW9uIGlz
IGVudGlyZWx5Cj4gPiArICAgICAgKiBwb2ludGxlc3Mgd2hlbiB0aGUgdW5tYXAgd2Fsa2VyIG5l
ZWRzIHRvIHBlcmZvcm0gQ01Pcy4KPiA+ICsgICAgICAqLwo+ID4gKyAgICAgcmV0dXJuIHN5c3Rl
bV9zdXBwb3J0c190bGJfcmFuZ2UoKSAmJiBzdGFnZTJfaGFzX2Z3YihwZ3QpOwo+ID4gK30KPiA+
ICsKPiA+ICtzdGF0aWMgYm9vbCBzdGFnZTJfdW5tYXBfZGVmZXJfdGxiX2ZsdXNoKHN0cnVjdCBz
dGFnZTJfdW5tYXBfZGF0YSAqdW5tYXBfZGF0YSkKPiA+ICt7Cj4gPiArICAgICBib29sIGRlZmVy
X3RsYl9mbHVzaCA9IF9fc3RhZ2UyX3VubWFwX2RlZmVyX3RsYl9mbHVzaCh1bm1hcF9kYXRhLT5w
Z3QpOwo+ID4gKwo+ID4gKyAgICAgLyoKPiA+ICsgICAgICAqIFNpbmNlIF9fc3RhZ2UyX3VubWFw
X2RlZmVyX3RsYl9mbHVzaCgpIGlzIGJhc2VkIG9uIGFsdGVybmF0aXZlCj4gPiArICAgICAgKiBw
YXRjaGluZyBhbmQgdGhlIFRMQklzJyBvcGVyYXRpb25zIGJlaGF2aW9yIGRlcGVuZCBvbiB0aGlz
LAo+ID4gKyAgICAgICogdHJhY2sgaWYgdGhlcmUncyBhbnkgY2hhbmdlIGluIHRoZSBzdGF0ZSBk
dXJpbmcgdGhlIHVubWFwIHNlcXVlbmNlLgo+ID4gKyAgICAgICovCj4gPiArICAgICBXQVJOX09O
KHVubWFwX2RhdGEtPmRlZmVyX3RsYl9mbHVzaF9pbml0ICE9IGRlZmVyX3RsYl9mbHVzaCk7Cj4g
PiArICAgICByZXR1cm4gZGVmZXJfdGxiX2ZsdXNoOwo+ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMg
dm9pZCBzdGFnZTJfdW5tYXBfcHV0X3B0ZShjb25zdCBzdHJ1Y3Qga3ZtX3BndGFibGVfdmlzaXRf
Y3R4ICpjdHgsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qga3ZtX3My
X21tdSAqbW11LAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGt2bV9w
Z3RhYmxlX21tX29wcyAqbW1fb3BzKQo+ID4gICB7Cj4gPiArICAgICBzdHJ1Y3Qgc3RhZ2UyX3Vu
bWFwX2RhdGEgKnVubWFwX2RhdGEgPSBjdHgtPmFyZzsKPiA+ICsKPiA+ICAgICAgIC8qCj4gPiAt
ICAgICAgKiBDbGVhciB0aGUgZXhpc3RpbmcgUFRFLCBhbmQgcGVyZm9ybSBicmVhay1iZWZvcmUt
bWFrZSB3aXRoCj4gPiAtICAgICAgKiBUTEIgbWFpbnRlbmFuY2UgaWYgaXQgd2FzIHZhbGlkLgo+
ID4gKyAgICAgICogQ2xlYXIgdGhlIGV4aXN0aW5nIFBURSwgYW5kIHBlcmZvcm0gYnJlYWstYmVm
b3JlLW1ha2UgaWYgaXQgd2FzCj4gPiArICAgICAgKiB2YWxpZC4gRGVwZW5kaW5nIG9uIHRoZSBz
eXN0ZW0gc3VwcG9ydCwgdGhlIFRMQiBtYWludGVuYW5jZSBmb3IKPiA+ICsgICAgICAqIHRoZSBz
YW1lIGNhbiBiZSBkZWZlcnJlZCB1bnRpbCB0aGUgZW50aXJlIHVubWFwIGlzIGNvbXBsZXRlZC4K
PiA+ICAgICAgICAqLwo+ID4gICAgICAgaWYgKGt2bV9wdGVfdmFsaWQoY3R4LT5vbGQpKSB7Cj4g
PiAgICAgICAgICAgICAgIGt2bV9jbGVhcl9wdGUoY3R4LT5wdGVwKTsKPiA+IC0gICAgICAgICAg
ICAga3ZtX2NhbGxfaHlwKF9fa3ZtX3RsYl9mbHVzaF92bWlkX2lwYSwgbW11LCBjdHgtPmFkZHIs
IGN0eC0+bGV2ZWwpOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICBpZiAoIXN0YWdlMl91bm1hcF9k
ZWZlcl90bGJfZmx1c2godW5tYXBfZGF0YSkpCj4gV2h5IG5vdCBkaXJlY3RseSBjaGVjayAodW5t
YXBfZGF0YS0+ZGVmZXJfdGxiX2ZsdXNoX2luaXQpIGhlcmU/Cj4KKFJlLXNlbmRpbmcgdGhlIHJl
cGx5IGFzIHRoZSBwcmV2aW91cyBvbmUgd2FzIGZvcm1hdHRlZCBhcyBIVE1MIGFuZAp3YXMgYmxv
Y2tlZCBieSBtYW55IGxpc3RzKQoKTm8gcGFydGljdWxhciByZWFzb24gcGVyIHNheSwgYnV0IEkg
d2FzIGp1c3QgZ29pbmcgd2l0aCB0aGUgbG9naWMgb2YKZGV0ZXJtaW5pbmcgaWYgd2UgbmVlZCB0
byBkZWZlciB0aGUgZmx1c2ggYW5kIHRoZSBXQVJOX09OKCkgcGFydHMKc2VwYXJhdGUuCkFueSBh
ZHZhbnRhZ2UgaWYgd2UgZGlyZWN0bHkgY2hlY2sgaW4gc3RhZ2UyX3VubWFwX3B1dF9wdGUoKSB0
aGF0IEkKbWlzc2VkIG9yIGlzIHRoaXMgcHVyZWx5IGZvciByZWFkYWJpbGl0eT8KCj4gPiArICAg
ICAgICAgICAgICAgICAgICAga3ZtX2NhbGxfaHlwKF9fa3ZtX3RsYl9mbHVzaF92bWlkX2lwYSwg
bW11LAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjdHgtPmFkZHIs
IGN0eC0+bGV2ZWwpOwo+IFNtYWxsIGluZGVudCBoaW50LiBUaGUgY3R4LT5hZGRyIGNhbiBhbGln
biB3aXRoIF9fa3ZtX3RsYl9mbHVzaF92bWlkX2lwYS4KPgpBaCwgeWVzLiBJJ2xsIGFkanVzdCB0
aGlzIGlmIEkgc2VuZCBvdXQgYSB2OC4KClRoYW5rIHlvdS4KUmFnaGF2ZW5kcmEKPiBUaGFua3Ms
Cj4gU2hhb3Fpbgo+ID4gICAgICAgfQo+ID4KPiA+ICAgICAgIG1tX29wcy0+cHV0X3BhZ2UoY3R4
LT5wdGVwKTsKPiA+IEBAIC0xMDcwLDcgKzExMDgsOCBAQCBpbnQga3ZtX3BndGFibGVfc3RhZ2Uy
X3NldF9vd25lcihzdHJ1Y3Qga3ZtX3BndGFibGUgKnBndCwgdTY0IGFkZHIsIHU2NCBzaXplLAo+
ID4gICBzdGF0aWMgaW50IHN0YWdlMl91bm1hcF93YWxrZXIoY29uc3Qgc3RydWN0IGt2bV9wZ3Rh
YmxlX3Zpc2l0X2N0eCAqY3R4LAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbnVt
IGt2bV9wZ3RhYmxlX3dhbGtfZmxhZ3MgdmlzaXQpCj4gPiAgIHsKPiA+IC0gICAgIHN0cnVjdCBr
dm1fcGd0YWJsZSAqcGd0ID0gY3R4LT5hcmc7Cj4gPiArICAgICBzdHJ1Y3Qgc3RhZ2UyX3VubWFw
X2RhdGEgKnVubWFwX2RhdGEgPSBjdHgtPmFyZzsKPiA+ICsgICAgIHN0cnVjdCBrdm1fcGd0YWJs
ZSAqcGd0ID0gdW5tYXBfZGF0YS0+cGd0Owo+ID4gICAgICAgc3RydWN0IGt2bV9zMl9tbXUgKm1t
dSA9IHBndC0+bW11Owo+ID4gICAgICAgc3RydWN0IGt2bV9wZ3RhYmxlX21tX29wcyAqbW1fb3Bz
ID0gY3R4LT5tbV9vcHM7Cj4gPiAgICAgICBrdm1fcHRlX3QgKmNoaWxkcCA9IE5VTEw7Cj4gPiBA
QCAtMTA5OCw3ICsxMTM3LDcgQEAgc3RhdGljIGludCBzdGFnZTJfdW5tYXBfd2Fsa2VyKGNvbnN0
IHN0cnVjdCBrdm1fcGd0YWJsZV92aXNpdF9jdHggKmN0eCwKPiA+ICAgICAgICAqIGJsb2NrIGVu
dHJ5IGFuZCByZWx5IG9uIHRoZSByZW1haW5pbmcgcG9ydGlvbnMgYmVpbmcgZmF1bHRlZAo+ID4g
ICAgICAgICogYmFjayBsYXppbHkuCj4gPiAgICAgICAgKi8KPiA+IC0gICAgIHN0YWdlMl9wdXRf
cHRlKGN0eCwgbW11LCBtbV9vcHMpOwo+ID4gKyAgICAgc3RhZ2UyX3VubWFwX3B1dF9wdGUoY3R4
LCBtbXUsIG1tX29wcyk7Cj4gPgo+ID4gICAgICAgaWYgKG5lZWRfZmx1c2ggJiYgbW1fb3BzLT5k
Y2FjaGVfY2xlYW5faW52YWxfcG9jKQo+ID4gICAgICAgICAgICAgICBtbV9vcHMtPmRjYWNoZV9j
bGVhbl9pbnZhbF9wb2Moa3ZtX3B0ZV9mb2xsb3coY3R4LT5vbGQsIG1tX29wcyksCj4gPiBAQCAt
MTExMiwxMyArMTE1MSwyMyBAQCBzdGF0aWMgaW50IHN0YWdlMl91bm1hcF93YWxrZXIoY29uc3Qg
c3RydWN0IGt2bV9wZ3RhYmxlX3Zpc2l0X2N0eCAqY3R4LAo+ID4KPiA+ICAgaW50IGt2bV9wZ3Rh
YmxlX3N0YWdlMl91bm1hcChzdHJ1Y3Qga3ZtX3BndGFibGUgKnBndCwgdTY0IGFkZHIsIHU2NCBz
aXplKQo+ID4gICB7Cj4gPiArICAgICBpbnQgcmV0Owo+ID4gKyAgICAgc3RydWN0IHN0YWdlMl91
bm1hcF9kYXRhIHVubWFwX2RhdGEgPSB7Cj4gPiArICAgICAgICAgICAgIC5wZ3QgPSBwZ3QsCj4g
PiArICAgICAgICAgICAgIC5kZWZlcl90bGJfZmx1c2hfaW5pdCA9IF9fc3RhZ2UyX3VubWFwX2Rl
ZmVyX3RsYl9mbHVzaChwZ3QpLAo+ID4gKyAgICAgfTsKPiA+ICAgICAgIHN0cnVjdCBrdm1fcGd0
YWJsZV93YWxrZXIgd2Fsa2VyID0gewo+ID4gICAgICAgICAgICAgICAuY2IgICAgID0gc3RhZ2Uy
X3VubWFwX3dhbGtlciwKPiA+IC0gICAgICAgICAgICAgLmFyZyAgICA9IHBndCwKPiA+ICsgICAg
ICAgICAgICAgLmFyZyAgICA9ICZ1bm1hcF9kYXRhLAo+ID4gICAgICAgICAgICAgICAuZmxhZ3Mg
ID0gS1ZNX1BHVEFCTEVfV0FMS19MRUFGIHwgS1ZNX1BHVEFCTEVfV0FMS19UQUJMRV9QT1NULAo+
ID4gICAgICAgfTsKPiA+Cj4gPiAtICAgICByZXR1cm4ga3ZtX3BndGFibGVfd2FsayhwZ3QsIGFk
ZHIsIHNpemUsICZ3YWxrZXIpOwo+ID4gKyAgICAgcmV0ID0ga3ZtX3BndGFibGVfd2FsayhwZ3Qs
IGFkZHIsIHNpemUsICZ3YWxrZXIpOwo+ID4gKyAgICAgaWYgKHN0YWdlMl91bm1hcF9kZWZlcl90
bGJfZmx1c2goJnVubWFwX2RhdGEpKQo+ID4gKyAgICAgICAgICAgICAvKiBQZXJmb3JtIHRoZSBk
ZWZlcnJlZCBUTEIgaW52YWxpZGF0aW9ucyAqLwo+ID4gKyAgICAgICAgICAgICBrdm1fdGxiX2Zs
dXNoX3ZtaWRfcmFuZ2UocGd0LT5tbXUsIGFkZHIsIHNpemUpOwo+ID4gKwo+ID4gKyAgICAgcmV0
dXJuIHJldDsKPiA+ICAgfQo+ID4KPiA+ICAgc3RydWN0IHN0YWdlMl9hdHRyX2RhdGEgewo+Cj4g
LS0KPiBTaGFvcWluCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
