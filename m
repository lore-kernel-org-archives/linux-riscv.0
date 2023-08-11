Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A22EAC0015E
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 11:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FQwiBXKAW0W6qLfZXK/0UYWgzJBk6ltZXGFfiKKW1c0=; b=wYfN9JxtFP5eWk
	1KZqiBf9a2CiUrvWj2DoCT3P9bGtI+LRxFmvh41NgTZe6J4CbnJ3ZvX9dTZoGbV2XpGMwwGfHDDd0
	utJFHwrmLtF51v0N3b3zURhQkEkuuF9QjGQxF6X8bzp8wtIzCaXW1x7a6qmJ+DwrLqtXt7WDPJ9cw
	BbpJ4OnPwEq1QzWFeBEcKn3YSN4v/1LAfDGWW96iok6IOtwIYw6w/ATtr3MZl4zKdd3B4nNKuqEET
	cwFpv5c0WKnjizNsiMzE8e4kADm2j2+uggQ4TI8fZMRpjSC+80Y65mRptOSxLm6nXQzmCxCzGAcv4
	aJpKgwwEYA6lYzaPSrRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUQ2g-00AOff-2J;
	Fri, 11 Aug 2023 11:10:54 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUQ2d-00AOdf-1v
	for linux-riscv@lists.infradead.org;
	Fri, 11 Aug 2023 11:10:53 +0000
Received: by mail-wm1-x341.google.com with SMTP id 5b1f17b1804b1-3fe32016bc8so16106155e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 11 Aug 2023 04:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691752248; x=1692357048;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H0MQJH4+pITYkHBLtS+BCOJ0qhFoL1psieZswN4tkhU=;
        b=JoodpZ+jub5G5ZkW/LLA0aZ04zeEZUuOXIVCoqwSG9rKD0dob9tE4ZLTbVBjLRdrwy
         2HejF139lcZzPXQc3D4Z+zZmQ5KlIAKA9k0GlWe/qc4mTbknw9NVHEdhYTrsZff/bNh9
         DSR31yAQtoH7XjDr8qskzPU4gn+gZoKdJaml+84f0bOl7vthmkMwMfRV6sFZu1U5belg
         G0oQ+PSRdw9Ze/YUMJQzS6mN/jL1+4RqYAlRR39jK2UNcHxh6fzpktNfJ1ky4wSqKm+A
         r08yV3XlZ2ftzWY5S9W3q8hwHKsWmT0rcOJRc4WOovsYjwE/63ewyK4S1CxxpT5qkqAS
         pH8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691752248; x=1692357048;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H0MQJH4+pITYkHBLtS+BCOJ0qhFoL1psieZswN4tkhU=;
        b=hVY4b1OAi3PYdIe73W3Q3ZSxlpXG1LgDWY2GJHBtTI9Ami2MunIrx9J5ZVXeYXrip0
         5mVMhSGRNbJuRNDyjWbK+LkuVt2QqGh+RKfvVH/Z8u4ZnefX6Rxz0uEEuwwJQTvQOcou
         pSqHf0YNBEqOydpukirkvYz/ZjXUuDmk3yxGB10Wg/utm3+V2CqQjYfVwbZsLCmBv3Ko
         wQpMA2Lab8o7WhNpMOZkWOipajhRlgBjhoQpj8BsOvjFbv3usqsppT4MPocDEjIl79U3
         8kUEJsMBbFvQh5F32l+Y8ztZKONS7fg0FrRR8WlKduvIOC44QX94X8+0NBsHSqSlzsfk
         Y4/g==
X-Gm-Message-State: AOJu0YwxxTIKMXfWhXrGNeTzpp91Y6UOavnl4vt3rIJOEs++pRqI7EqD
	mahhg3zqgyrqv97sYr1Kl69rfg==
X-Google-Smtp-Source: AGHT+IFbQjtZWxIg18iTlDgX3Z2owGZPVaikc674RSqcYVvMq2CXbMCbvCe+psPnv6sY+apM2fcoeg==
X-Received: by 2002:a05:600c:3797:b0:3f7:678c:74b0 with SMTP id o23-20020a05600c379700b003f7678c74b0mr1229864wmr.12.1691752247252;
        Fri, 11 Aug 2023 04:10:47 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id 26-20020a05600c22da00b003fbb618f7adsm4860871wmg.15.2023.08.11.04.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 04:10:46 -0700 (PDT)
Date: Fri, 11 Aug 2023 13:10:45 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, leobras@redhat.com, 
	Arnd Bergmann <arnd@arndb.de>, Will Deacon <will@kernel.org>, peterz@infradead.org, 
	boqun.feng@gmail.com, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, parri.andrea@gmail.com, 
	andrzej.hajda@intel.com, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [RFC PATCH v5 5/5] riscv/cmpxchg: Implement xchg for variables
 of size 1 and 2
Message-ID: <20230811-bd73721199b8699c9d7da564@orel>
References: <98f523e515b2adc2aa7bb8d133353bad74e30897.camel@redhat.com>
 <mhng-92f37526-d36c-48c0-8fbd-7676df1b6086@palmer-ri-x1c9>
 <CAJF2gTQgv5xsfSfvV7KePAXFnFQOMq4GXOp40kQgM54L6hVD7w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTQgv5xsfSfvV7KePAXFnFQOMq4GXOp40kQgM54L6hVD7w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_041051_638493_17FA332E 
X-CRM114-Status: GOOD (  48.72  )
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

T24gRnJpLCBBdWcgMTEsIDIwMjMgYXQgMDk6NDA6MzBBTSArMDgwMCwgR3VvIFJlbiB3cm90ZToK
PiBPbiBGcmksIEF1ZyAxMSwgMjAyMyBhdCAxMjoyM+KAr0FNIFBhbG1lciBEYWJiZWx0IDxwYWxt
ZXJAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUaHUsIDEwIEF1ZyAyMDIzIDA5OjA0
OjA0IFBEVCAoLTA3MDApLCBsZW9icmFzQHJlZGhhdC5jb20gd3JvdGU6Cj4gPiA+IE9uIFRodSwg
MjAyMy0wOC0xMCBhdCAwODo1MSArMDIwMCwgQXJuZCBCZXJnbWFubiB3cm90ZToKPiA+ID4+IE9u
IFRodSwgQXVnIDEwLCAyMDIzLCBhdCAwNjowMywgTGVvbmFyZG8gQnJhcyB3cm90ZToKPiA+ID4+
ID4geGNoZyBmb3IgdmFyaWFibGVzIG9mIHNpemUgMS1ieXRlIGFuZCAyLWJ5dGVzIGlzIG5vdCB5
ZXQgYXZhaWxhYmxlIGZvcgo+ID4gPj4gPiByaXNjdiwgZXZlbiB0aG91Z2ggaXRzIHByZXNlbnQg
aW4gb3RoZXIgYXJjaGl0ZWN0dXJlcyBzdWNoIGFzIGFybTY0IGFuZAo+ID4gPj4gPiB4ODYuIFRo
aXMgY291bGQgbGVhZCB0byBub3QgYmVpbmcgYWJsZSB0byBpbXBsZW1lbnQgc29tZSBsb2NraW5n
IG1lY2hhbmlzbXMKPiA+ID4+ID4gb3IgcmVxdWlyaW5nIHNvbWUgcmV3b3JrIHRvIG1ha2UgaXQg
d29yayBwcm9wZXJseS4KPiA+ID4+ID4KPiA+ID4+ID4gSW1wbGVtZW50IDEtYnl0ZSBhbmQgMi1i
eXRlcyB4Y2hnIGluIG9yZGVyIHRvIGFjaGlldmUgcGFyaXR5IHdpdGggb3RoZXIKPiA+ID4+ID4g
YXJjaGl0ZWN0dXJlcy4KPiA+ID4+ID4KPiA+ID4+ID4gU2lnbmVkLW9mZi1ieTogTGVvbmFyZG8g
QnJhcyA8bGVvYnJhc0ByZWRoYXQuY29tPgo+ID4gPj4KPiA+ID4KPiA+ID4gSGVsbG8gQXJuZCBC
ZXJnbWFubiwgdGhhbmtzIGZvciByZXZpZXdpbmchCj4gPiA+Cj4gPiA+PiBQYXJpdHkgd2l0aCBv
dGhlciBhcmNoaXRlY3R1cmVzIGJ5IGl0c2VsZiBpcyBub3QgYSByZWFzb24gdG8gZG8gdGhpcywK
PiA+ID4+IGluIHBhcnRpY3VsYXIgdGhlIG90aGVyIGFyY2hpdGVjdHVyZXMgeW91IGxpc3RlZCBo
YXZlIHRoZSBpbnN0cnVjdGlvbnMKPiA+ID4+IGluIGhhcmR3YXJlIHdoaWxlIHJpc2N2IGRvZXMg
bm90Lgo+ID4gPgo+ID4gPiBTdXJlLCBJIHVuZGVyc3RhbmQgUklTQy1WIGRvbid0IGhhdmUgbmF0
aXZlIHN1cHBvcnQgZm9yIHhjaGcgb24gdmFyaWFibGVzIG9mCj4gPiA+IHNpemUgPCA0Qi4gTXkg
YXJndW1lbnQgaXMgdGhhdCBpdCdzIG5pY2UgdG8gaGF2ZSBldmVuIGFuIGVtdWxhdGVkIHZlcnNp
b24gZm9yCj4gPiA+IHRoaXMgaW4gY2FzZSBhbnkgZnV0dXJlIG1lY2hhbmlzbSB3YW50cyB0byB1
c2UgaXQuCj4gPiA+Cj4gPiA+IE5vdCBoYXZpbmcgaXQgbWF5IG1lYW4gd2Ugd29uJ3QgYmUgYWJs
ZSB0byBlbmFibGUgZ2l2ZW4gbWVjaGFuaXNtIGluIFJJU0MtVi4KPiA+Cj4gPiBJSVVDIHRoZSBh
c2sgaXMgdG8gaGF2ZSBhIHVzZXIgd2l0aGluIHRoZSBrZXJuZWwgZm9yIHRoZXNlIGZ1bmN0aW9u
cy4KPiA+IFRoYXQncyB0aGUgZ2VuZXJhbCB0aGluZyB0byBkbywgYW5kIGxhc3QgdGltZSB0aGlz
IGNhbWUgdXAgdGhlcmUgd2FzIG5vCj4gPiBpbi1rZXJuZWwgdXNlIG9mIGl0IC0tIHRoZSBxc3Bp
bmxvY2sgc3R1ZmYgd291bGQsIGJ1dCB3ZSBoYXZlbid0IGVuYWJsZWQKPiA+IGl0IHlldCBiZWNh
dXNlIHdlJ3JlIHdvcnJpZWQgYWJvdXQgdGhlIHBlcmZvcm1hbmNlL2ZhaXJuZXNzIHN0dWZmIHRo
YXQKPiA+IG90aGVyIHBvcnRzIGhhdmUgc2VlbiBhbmQgbm9ib2R5J3MgZ290IGNvbmNyZXRlIGJl
bmNobWFya3MgeWV0ICh0aG91Z2gKPiA+IHRoZXJlJ3MgYW5vdGhlciBwYXRjaCBzZXQgb3V0IHRo
YXQgSSBoYXZlbid0IGhhZCB0aW1lIHRvIGxvb2sgdGhyb3VnaCwKPiA+IHNvIHRoYXQgbWF5IGhh
dmUgY2hhbmdlZCkuCj4gQ29ub3IgZG9lc24ndCBhZ3JlZSB3aXRoIHVzaW5nIGFuIGFsdGVybmF0
aXZlIGFzIGEgZGV0b3VyIG1lY2hhbmlzbQo+IGJldHdlZW4gcXNwaW5sb2NrICYgdGlja2V0IGxv
Y2suIFNvIEknbSBwcmVwYXJpbmcgVjExIHdpdGggc3RhdGljX2tleQo+IChqdW1wX2xhYmVsKSBz
dHlsZS4gTmV4dCB2ZXJzaW9uLCBJIHdvdWxkIHNlcGFyYXRlIHBhcmF2aXJ0X3FzcGlubG9jawo+
ICYgQ05BX3FzcGlubG9jayBmcm9tIFYxMC4gVGhhdCB3b3VsZCBtYWtlIGl0IGVhc3kgdG8gcmV2
aWV3IHRoZQo+IHFzcGlubG9jayBwYXRjaCBzZXJpZXMuIFlvdSBjYW4gcmV2aWV3IHRoZSBuZXh0
IHZlcnNpb24gVjExLiBOb3cgSSdtCj4gZGVidWdnaW5nIGEgc3RhdGljX2tleSBpbml0IHByb2Js
ZW0gd2hlbiBsb2FkX21vZHVsZXMsIHdoaWNoIGlzCj4gdHJpZ2dlcmVkIGJ5IG91ciBjb21ib19x
c3BpbmxvY2suCgpXZSd2ZSBzZWVuIHByb2JsZW1zIHdpdGggc3RhdGljIGtleXMgYW5kIG1vZHVs
ZSBsb2FkaW5nIGluIHRoZSBwYXN0LiBZb3UKbWF5IHdhbnQgdG8gdGFrZSBhIGxvb2sgYXQgY29t
bWl0IGViNjM1NGUxMTYzMCAoInJpc2N2OiBFbnN1cmUgaXNhLWV4dApzdGF0aWMga2V5cyBhcmUg
d3JpdGFibGUiKQoKVGhhbmtzLApkcmV3Cgo+IAo+IFRoZSBxc3BpbmxvY2sgaXMgYmVpbmcgdGVz
dGVkIG9uIHRoZSByaXNjdiBwbGF0Zm9ybSBbMV0gd2l0aCAxMjggY29yZXMKPiB3aXRoIDggTlVN
QSBub2RlcywgbmV4dCwgSSB3b3VsZCB1cGRhdGUgdGhlIGNvbXBhcmlzb24gcmVzdWx0cyBvZgo+
IHFzcGlubG9jayAmIHRpY2tldCBsb2NrLgo+IAo+IFsxXTogaHR0cHM6Ly93d3cuc29waG9uLmFp
Lwo+IAo+ID4KPiA+IFNvIGlmIHNvbWV0aGluZyB1c2VzIHRoZXNlIEknbSBoYXBweSB0byBnbyBs
b29rIGNsb3Nlci4KPiA+Cj4gPiA+PiBFbXVsYXRpbmcgdGhlIHNtYWxsIHhjaGcoKSB0aHJvdWdo
IGNtcHhjaGcoKSBpcyBwYXJ0aWN1bGFybHkgdHJpY2t5Cj4gPiA+PiBzaW5jZSBpdCdzIGVhc3kg
dG8gcnVuIGludG8gYSBjYXNlIHdoZXJlIHRoaXMgZG9lcyBub3QgZ3VhcmFudGVlCj4gPiA+PiBm
b3J3YXJkIHByb2dyZXNzLgo+ID4gPj4KPiA+ID4KPiA+ID4gRGlkbid0IGdldCB0aGlzIHBhcnQ6
Cj4gPiA+IEJ5ICJlbXVsYXRpbmcgc21hbGwgeGNoZygpIHRocm91Z2ggY21weGNoZygpIiwgZGlk
IHlvdSBtZWFuIGxpa2UgZW11bGF0aW5nIGFuCj4gPiA+IHhjaGcgKHVzdWFsbHkgMSBpbnN0cnVj
dGlvbikgd2l0aCBsciAmIHNjIChzYW1lIHVzZWQgaW4gY21weGNoZykgPwo+ID4gPgo+ID4gPiBJ
ZiBzbywgeWVhaCwgaXQncyBhIGZhaXIgcG9pbnQ6IGluIHNvbWUgZXh0cmVtZSBjYXNlIHdlIGNv
dWxkIGhhdmUgbXVsdGlwbGUKPiA+ID4gdGhyZWFkcyBhY2Nlc3NpbmcgZ2l2ZW4gY2FjaGVsaW5l
IGFuZCBoYXZlIHNjIGFsd2F5cyBmYWlsaW5nLiBPbiB0aGUgb3RoZXIgaGFuZCwKPiA+ID4gdGhl
cmUgYXJlIDIgYXJndW1lbnRzIG9uIHRoYXQ6Cj4gPiA+Cj4gPiA+IDEgLSBPdGhlciBhcmNoaXRl
Y3R1cmVzLCAoc3VjaCBhcyBwb3dlcnBjLCBhcm0gYW5kIGFybTY0IHdpdGhvdXQgTFNFIGF0b21p
Y3MpCj4gPiA+IGFsc28gc2VlbSB0byByZWx5IGluIHRoaXMgbWVjaGFuaXNtIGZvciBldmVyeSB4
Y2hnIHNpemUuIEFub3RoZXIgYXJjaHMgbGlrZSBjc2t5Cj4gPiA+IGFuZCBsb29uZ2FyY2ggdXNl
IGFzbSB0aGF0IGxvb2sgbGlrZSBtaW5lIHRvIGhhbmRsZSBzaXplIDwgNEIgeGNoZy4KPiA+ID4K
PiA+ID4KPiA+ID4+ICBUaGlzIGlzIGFsc28gc29tZXRoaW5nIHRoYXQgYWxtb3N0IG5vIGFyY2hp
dGVjdHVyZQo+ID4gPj4gc3BlY2lmaWMgY29kZSByZWxpZXMgb24gKGdlbmVyaWMgcXNwaW5sb2Nr
IGJlaW5nIGEgbm90YWJsZSBleGNlcHRpb24pLgo+ID4gPj4KPiA+ID4KPiA+ID4gMiAtIEFzIHlv
dSBtZW50aW9uZWQsIHRoZXJlIHNob3VsZCBiZSB2ZXJ5IGxpdHRsZSBjb2RlIHRoYXQgd2lsbCBh
Y3R1YWxseSBtYWtlCj4gPiA+IHVzZSBvZiB4Y2hnIGZvciB2YXJzIDwgNEIsIHNvIGl0IHNob3Vs
ZCBiZSBzYWZlIHRvIGFzc3VtZSBpdHMgZmluZSB0byBub3QKPiA+ID4gZ3VhcmFudGVlIGZvcndh
cmQgcHJvZ3Jlc3MgZm9yIHRob3NlIHJhcmUgdXNhZ2VzIChsaWtlIHNvbWUgb2YgYWJvdmUgbWVu
dGlvbmVkCj4gPiA+IGFyY2hzKS4KPiA+ID4KPiA+ID4+IEkgd291bGQgcmVjb21tZW5kIGp1c3Qg
ZHJvcHBpbmcgdGhpcyBwYXRjaCBmcm9tIHRoZSBzZXJpZXMsIGF0IGxlYXN0Cj4gPiA+PiB1bnRp
bCB0aGVyZSBpcyBhIG5lZWQgZm9yIGl0Lgo+ID4gPgo+ID4gPiBXaGlsZSBJIGFncmVlIHRoaXMg
aXMgYSB2YWxpZCBwb2ludCwgSSBiZWxpZXZlIGl0cyBtb3JlIGludGVyZXN0aW5nIHRvIGhhdmUg
aXQKPiA+ID4gaW1wbGVtZW50ZWQgaWYgYW55IGZ1dHVyZSBtZWNoYW5pc20gd2FudHMgdG8gbWFr
ZSB1c2Ugb2YgdGhpcy4KPiA+ID4KPiA+ID4KPiA+ID4gVGhhbmtzIQo+ID4gPiBMZW8KPiAKPiAK
PiAKPiAtLSAKPiBCZXN0IFJlZ2FyZHMKPiAgR3VvIFJlbgo+IAo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
