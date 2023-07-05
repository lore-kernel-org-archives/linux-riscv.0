Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C1CEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 08:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QwBxvzPFgAAWHAilMA09pJRukkbRcY9pxFeoqTLZnRY=; b=B1WD2gsaAlBhNC
	gBLfjODK64zLU+yNAaYz3ligaDm33q2tJ1SAs9dBfYWASCamDNQkOwh6FvlSxMmQaVYqRU+8v6Edj
	lbNLextVrH9iv5iduRycTTaZPPwYlV4mlTURf27YSG4X4esteAkCXJ4K1DJP/y+9zoQBNJxWmSJLn
	lIQ/iVwX1dGJy5KNgxpbXbDvjbRZVxh4SM8x70N1gaHJOrazKs3hV8yUxtH7Brp0utMGnfEAiR6yK
	v/HsrYcYNo9Zo2r7PmPhcGgPPG4aofPAiNZdNdfpGKrDvJvDYxvbFcFh7UOiRIEwTdKMgzDdxp+t2
	oAwyfp/iFdL8f7bZZcYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGy76-00FFXn-1N;
	Wed, 05 Jul 2023 08:43:52 +0000
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGy71-00FFWA-0s;
	Wed, 05 Jul 2023 08:43:50 +0000
Received: by mail-vs1-xe2d.google.com with SMTP id ada2fe7eead31-4435508cff9so1923001137.0;
        Wed, 05 Jul 2023 01:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688546625; x=1691138625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OfLzlu2hCuH/qNgHtEqj71Fn9ZBy4uE0Z7kkhh4XPaU=;
        b=EcSDcbMFLlaEKCnAfTNq6ncklG6G9aICkpdmAnIqeybUq25h0n04X5AdQKHA7ie10B
         lNc/Wu9uxR7DSqJdKi4ZR4CO7aC60Was+59WEFygIao4OxzvM3ExJtlmMRSRSITZ3jbP
         qfJ5gWKACUFlABiAC3a9IKngo5vX/7G8Ge9CL2IQIMPWHD7oMIQLr33gNaWWRbzVsiSx
         na0BZny08KFWuPAM5Sfwwc2WMDxLARuH9UdUm0JKzhKrs5ZsuSsMdxQBN9TLHg/jfoN/
         bPmaYtawgUtRk99LL/nUxuk0QbU5QFV0LuLfeZTEUU9O9xTjggAvb3iW/nKfE0wnT34F
         eFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688546625; x=1691138625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OfLzlu2hCuH/qNgHtEqj71Fn9ZBy4uE0Z7kkhh4XPaU=;
        b=ZxlO+NZucAv6CdI4LqFoNJRWJ/hVx7n53jnpxi4hs9RKtI452qgN8DuocuysRroABJ
         h05t0DO/nFedJamQrA40VQXv15/bKJ5wm1Gxwq/8ZsaSBAYURCyfIlk8H16PW3tpjx04
         42L/D7OJ47Mb6Uv4IGxm/Esc82QrrDUU3s51vVOMN5s8js5+hLDWWa07JwUgLCw4thzq
         nfMtN+DE8YlWaSycMdkMTOB4S8GrjjXRLxBZVYnOAYnHLy+bi+Plc2cP2/Q/pOkg8lQ0
         Uv3EhF3jHasu8cKKPjEADVbsw8nuoM6kHKDsOytdI1mzAQoYlsKWu75sOnfPP/0PKOgP
         QssQ==
X-Gm-Message-State: ABy/qLZlIBSUHZvsMKXcYJxUrVfiSWPNNgAus/dgDvFnjPvUJAD3Zwbc
	/aGDcKof9t6ELc162LI4HQHRBUN9JDiT6QoGVt4=
X-Google-Smtp-Source: APBJJlFLUnJaRW83dmmmrNBi+Pcq3+yZ/Or6M1SrtK+X+fK4Yl/i1JA0jGSQfbLmKOpA+aNZfqIRanR69NKYC7JoALc=
X-Received: by 2002:a67:fd82:0:b0:443:7516:450b with SMTP id
 k2-20020a67fd82000000b004437516450bmr4352254vsq.35.1688546625075; Wed, 05 Jul
 2023 01:43:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230518065934.12877-1-yangyicong@huawei.com> <20230518065934.12877-3-yangyicong@huawei.com>
 <ZJ2x6DlmyA3kVh1n@arm.com> <ZJ2+37Q7v4odMmEd@arm.com> <2f593850-797c-5422-2c80-ce214fac02bb@huawei.com>
In-Reply-To: <2f593850-797c-5422-2c80-ce214fac02bb@huawei.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 5 Jul 2023 16:43:29 +0800
Message-ID: <CAGsJ_4zG=DT0gwC+5uN51rQKT=UudNDZ4t1BgRNoFb_3NNLOtQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v9 2/2] arm64: support batched/deferred tlb
 shootdown during page reclamation/migration
To: Yicong Yang <yangyicong@huawei.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, yangyicong@hisilicon.com, 
	akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org, mark.rutland@arm.com, 
	ryan.roberts@arm.com, will@kernel.org, anshuman.khandual@arm.com, 
	linux-doc@vger.kernel.org, corbet@lwn.net, peterz@infradead.org, 
	arnd@arndb.de, punit.agrawal@bytedance.com, linux-kernel@vger.kernel.org, 
	darren@os.amperecomputing.com, huzhanyuan@oppo.com, lipeifeng@oppo.com, 
	zhangshiming@oppo.com, guojian@oppo.com, realmz6@gmail.com, 
	linux-mips@vger.kernel.org, openrisc@lists.librecores.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, wangkefeng.wang@huawei.com, 
	xhao@linux.alibaba.com, prime.zeng@hisilicon.com, Jonathan.Cameron@huawei.com, 
	Barry Song <v-songbaohua@oppo.com>, Nadav Amit <namit@vmware.com>, Mel Gorman <mgorman@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_014347_330780_C12E7EA1 
X-CRM114-Status: GOOD (  36.13  )
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

T24gVHVlLCBKdWwgNCwgMjAyMyBhdCAxMDozNuKAr1BNIFlpY29uZyBZYW5nIDx5YW5neWljb25n
QGh1YXdlaS5jb20+IHdyb3RlOgo+Cj4gT24gMjAyMy82LzMwIDE6MjYsIENhdGFsaW4gTWFyaW5h
cyB3cm90ZToKPiA+IE9uIFRodSwgSnVuIDI5LCAyMDIzIGF0IDA1OjMxOjM2UE0gKzAxMDAsIENh
dGFsaW4gTWFyaW5hcyB3cm90ZToKPiA+PiBPbiBUaHUsIE1heSAxOCwgMjAyMyBhdCAwMjo1OToz
NFBNICswODAwLCBZaWNvbmcgWWFuZyB3cm90ZToKPiA+Pj4gRnJvbTogQmFycnkgU29uZyA8di1z
b25nYmFvaHVhQG9wcG8uY29tPgo+ID4+Pgo+ID4+PiBvbiB4ODYsIGJhdGNoZWQgYW5kIGRlZmVy
cmVkIHRsYiBzaG9vdGRvd24gaGFzIGxlYWQgdG8gOTAlCj4gPj4+IHBlcmZvcm1hbmNlIGluY3Jl
YXNlIG9uIHRsYiBzaG9vdGRvd24uIG9uIGFybTY0LCBIVyBjYW4gZG8KPiA+Pj4gdGxiIHNob290
ZG93biB3aXRob3V0IHNvZnR3YXJlIElQSS4gQnV0IHN5bmMgdGxiaSBpcyBzdGlsbAo+ID4+PiBx
dWl0ZSBleHBlbnNpdmUuCj4gPj4gWy4uLl0KPiA+Pj4gIC4uLi9mZWF0dXJlcy92bS9UTEIvYXJj
aC1zdXBwb3J0LnR4dCAgICAgICAgICB8ICAyICstCj4gPj4+ICBhcmNoL2FybTY0L0tjb25maWcg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4gPj4+ICBhcmNoL2FybTY0L2luY2x1
ZGUvYXNtL3RsYmJhdGNoLmggICAgICAgICAgICAgfCAxMiArKysrCj4gPj4+ICBhcmNoL2FybTY0
L2luY2x1ZGUvYXNtL3RsYmZsdXNoLmggICAgICAgICAgICAgfCAzMyArKysrKysrKy0KPiA+Pj4g
IGFyY2gvYXJtNjQvbW0vZmx1c2guYyAgICAgICAgICAgICAgICAgICAgICAgICB8IDY5ICsrKysr
KysrKysrKysrKysrKysKPiA+Pj4gIGFyY2gveDg2L2luY2x1ZGUvYXNtL3RsYmZsdXNoLmggICAg
ICAgICAgICAgICB8ICA1ICstCj4gPj4+ICBpbmNsdWRlL2xpbnV4L21tX3R5cGVzX3Rhc2suaCAg
ICAgICAgICAgICAgICAgfCAgNCArLQo+ID4+PiAgbW0vcm1hcC5jICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgMTIgKystLQo+ID4+Cj4gPj4gRmlyc3Qgb2YgYWxsLCB0aGlz
IHBhdGNoIG5lZWRzIHRvIGJlIHNwbGl0IGluIHNvbWUgcHJlcGFyYXRvcnkgcGF0Y2hlcwo+ID4+
IGludHJvZHVjaW5nL3JlbmFtaW5nIGZ1bmN0aW9ucyB3aXRoIG5vIGZ1bmN0aW9uYWwgY2hhbmdl
IGZvciB4ODYuIE9uY2UKPiA+PiBkb25lLCB5b3UgY2FuIGFkZCB0aGUgYXJtNjQtb25seSBjaGFu
Z2VzLgo+ID4+Cj4KPiBnb3QgaXQuIHdpbGwgdHJ5IHRvIHNwbGl0IHRoaXMgcGF0Y2ggYXMgc3Vn
Z2VzdGVkLgo+Cj4gPj4gTm93LCBvbiB0aGUgaW1wbGVtZW50YXRpb24sIEkgaGFkIHNvbWUgY29t
bWVudHMgb24gdjcgYnV0IHdlIGRpZG4ndCBnZXQKPiA+PiB0byBhIGNvbmNsdXNpb24gYW5kIHRo
ZSB0aHJlYWQgZXZlbnR1YWxseSBkaWVkOgo+ID4+Cj4gPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtbW0vWTdjVG9qNW1XZDFaYk15UUBhcm0uY29tLwo+ID4+Cj4gPj4gSSBrbm93IEkg
c2FpZCBhIGNvbW1hbmQgbGluZSBhcmd1bWVudCBpcyBiZXR0ZXIgdGhhbiBLY29uZmlnIG9yIHNv
bWUKPiA+PiByYW5kb20gbnVtYmVyIG9mIENQVXMgaGV1cmlzdGljcyBidXQgaXQgd291bGQgYmUg
ZXZlbiBiZXR0ZXIgaWYgd2UgZG9uJ3QKPiA+PiBib3RoZXIgd2l0aCBhbnksIGp1c3QgbWFrZSB0
aGlzIGFsd2F5cyBvbi4KPgo+IG9rLCB3aWxsIG1ha2UgdGhpcyBhbHdheXMgb24uCj4KPiA+PiBC
YXJyeSBoYWQgc29tZSBjb21tZW50cwo+ID4+IGFyb3VuZCBtcHJvdGVjdCgpIGJlaW5nIHJhY3kg
YW5kIHRoYXQncyB3aHkgd2UgaGF2ZQo+ID4+IGZsdXNoX3RsYl9iYXRjaGVkX3BlbmRpbmcoKSBi
dXQgSSBkb24ndCB0aGluayBpdCdzIG5lZWRlZCAob3IsIGZvcgo+ID4+IGFybTY0LCBpdCBjYW4g
YmUgYSBEU0Igc2luY2UgdGhpcyBwYXRjaCBpc3N1ZXMgdGhlIFRMQklzIGJ1dCB3aXRob3V0IHRo
ZQo+ID4+IERWTSBTeW5jKS4gU28gd2UgbmVlZCB0byBjbGFyaWZ5IHRoaXMgKHNlZSBCYXJyeSdz
IGxhc3QgZW1haWwgb24gdGhlCj4gPj4gYWJvdmUgdGhyZWFkKSBhbmQgYmVmb3JlIGF0dGVtcHRp
bmcgbmV3IHZlcnNpb25zIG9mIHRoaXMgcGF0Y2hzZXQuIFdpdGgKPiA+PiBmbHVzaF90bGJfYmF0
Y2hlZF9wZW5kaW5nKCkgcmVtb3ZlZCAob3IgRFNCKSwgSSBoYXZlIGEgc3VzcGljaW9uIHN1Y2gK
PiA+PiBpbXBsZW1lbnRhdGlvbiB3b3VsZCBiZSBmYXN0ZXIgb24gYW55IFNvQyBpcnJlc3BlY3Rp
dmUgb2YgdGhlIG51bWJlciBvZgo+ID4+IENQVXMuCj4gPgo+ID4gSSB0aGluayBJIGdvdCB0aGUg
bmVlZCBmb3IgZmx1c2hfdGxiX2JhdGNoZWRfcGVuZGluZygpLiBJZgo+ID4gdHJ5X3RvX3VubWFw
KCkgbWFya3MgdGhlIHB0ZSAhcHJlc2VudCBhbmQgd2UgaGF2ZSBhIHBlbmRpbmcgVExCSSwKPiA+
IGNoYW5nZV9wdGVfcmFuZ2UoKSB3aWxsIHNraXAgdGhlIFRMQiBtYWludGVuYW5jZSBhbHRvZ2V0
aGVyIHNpbmNlIGl0IGRpZAo+ID4gbm90IGNoYW5nZSB0aGUgcHRlLiBTbyB3ZSBjb3VsZCBiZSBs
ZWZ0IHdpdGggc3RhbGUgVExCIGVudHJpZXMgYWZ0ZXIKPiA+IG1wcm90ZWN0KCkgYmVmb3JlIFRU
VSBkb2VzIHRoZSBiYXRjaCBmbHVzaGluZy4KPiA+CgpHb29kIGNhdGNoLgpUaGlzIGNvdWxkIGJl
IGFsc28gdHJ1ZSBmb3IgTUFEVl9ET05UTkVFRC4gYWZ0ZXIgdHJ5X3RvX3VubWFwLCB3ZSBydW4K
TUFEVl9ET05UTkVFRCBvbiB0aGlzIGFyZWEsIGFzIHB0ZSBpcyBub3QgcHJlc2VudCwgd2UgZG9u
J3QgZG8gYW55dGhpbmcKb24gdGhpcyBQVEUgaW4gemFwX3B0ZV9yYW5nZSBhZnRlcndhcmRzLgoK
PiA+IFdlIGNhbiBoYXZlIGFuIGFyY2gtc3BlY2lmaWMgZmx1c2hfdGxiX2JhdGNoZWRfcGVuZGlu
ZygpIHRoYXQgY2FuIGJlIGEKPiA+IERTQiBvbmx5IG9uIGFybTY0IGFuZCBhIGZ1bGwgbW0gZmx1
c2ggb24geDg2Lgo+ID4KPgo+IFdlIG5lZWQgdG8gZG8gYSBmbHVzaC9kc2IgaW4gZmx1c2hfdGxi
X2JhdGNoZWRfcGVuZGluZygpIG9ubHkgaW4gYSByYWNlCj4gY29uZGl0aW9uIHNvIHdlIGZpcnN0
IGNoZWNrIHdoZXRoZXIgdGhlcmUncyBhIHBlbmRlZCBiYXRjaGVkIGZsdXNoIGFuZAo+IGlmIHNv
IGRvIHRoZSB0bGIgZmx1c2guIFRoZSBwZW5kaW5nIGNoZWNraW5nIGlzIGNvbW1vbiBhbmQgdGhl
IGRpZmZlcmVuY2VzCj4gYW1vbmcgdGhlIGFyY2hzIGlzIGhvdyB0byBmbHVzaCB0aGUgVExCIGhl
cmUgd2l0aGluIHRoZSBmbHVzaF90bGJfYmF0Y2hlZF9wZW5kaW5nKCksCj4gb24gYXJtNjQgaXQg
c2hvdWxkIG9ubHkgYmUgYSBkc2IuCj4KPiBBcyB3ZSBvbmx5IG5lZWRzIHRvIG1haW50YWluIHRo
ZSBUTEJzIGFscmVhZHkgcGVuZGVkIGluIGJhdGNoZWQgZmx1c2gsCj4gZG9lcyBpdCBtYWtlIHNl
bnNlIHRvIG9ubHkgaGFuZGxlIHRob3NlIFRMQnMgaW4gZmx1c2hfdGxiX2JhdGNoZWRfcGVuZGlu
ZygpPwo+IFRoZW4gd2UgY2FuIHVzZSB0aGUgYXJjaF90bGJiYXRjaF9mbHVzaCgpIHJhdGhlciB0
aGFuIGZsdXNoX3RsYl9tbSgpIGluCj4gZmx1c2hfdGxiX2JhdGNoZWRfcGVuZGluZygpIGFuZCBu
byBhcmNoIHNwZWNpZmljIGZ1bmN0aW9uIG5lZWRlZC4KCmFzIHdlIGhhdmUgaXNzdWVkIG5vLXN5
bmMgdGxiaSBvbiB0aG9zZSBwZW5kaW5nIGFkZHJlc3NlcyAsIHRoYXQgbWVhbnMKb3VyIGhhcmR3
YXJlCmhhcyBhbHJlYWR5ICJyZWNvcmRlZCIgd2hhdCBzaG91bGQgYmUgZmx1c2hlZCBpbiB0aGUg
c3BlY2lmaWMgbW0uIHNvCkRTQiBvbmx5IHdpbGwgZmx1c2gKdGhlbSBjb3JyZWN0bHkuIHJpZ2h0
PwoKPgo+IFRoYW5rcy4KPgoKQmFycnkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
