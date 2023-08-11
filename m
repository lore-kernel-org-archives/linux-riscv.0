Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE71FC0015E
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 11:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TybLWhswvBk8MkxhpfnkElG0k8TZZfEoOjdH2xwvvtA=; b=1hzBlVc2+RSJpy
	q8ein/0hL8qwVFoaWs/uUqDrOoXChsXZzwQp2m7znSuq0UsyGJsX1vdgpWo+ikvStjN8H4J+FmJTD
	PzdIKrVs8vtZRfWtuodMXMZB0L45g7SAJnvNgRb3aud5C60RIItXt/dvoah05sdZeJIpdALQx2mVf
	uTngv/Pre+SPcErGti5hQVRxLhXZU6P+sTYGACXsUN7doMRnkI5F49GrTlYf1VgHc/kYyItrxuDK3
	zmOIUXBWNzDVxGB8Kyb4uAgGvryLYNCXQHLC7dQA23C/nQfggLb81yORdytzru2iX59MKn9N13Nd/
	PxfVywmIC/isa2DhydMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUQ8k-00APID-2O;
	Fri, 11 Aug 2023 11:17:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUQ8h-00APHC-0I
	for linux-riscv@lists.infradead.org;
	Fri, 11 Aug 2023 11:17:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 37F3765321
	for <linux-riscv@lists.infradead.org>; Fri, 11 Aug 2023 11:17:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A6C9C433C8
	for <linux-riscv@lists.infradead.org>; Fri, 11 Aug 2023 11:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691752625;
	bh=LiMd4YcWRrHGbaUx/9sIeqLDv2OtXbK5Stff+O4Teqk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cm1CsDKUAnxFsaqLjXmvfRH8KGtLmDldbpsJbKdg2Vv6iYTR80H8ckjS1KkDwgMts
	 cskpGQkfOOXfUnOXKmwmt77UfAb+VmbKVsTspwC1WjZYRYNO/9dBFUKeWu8PxhzQFx
	 JdVJSyrBAM8iDSc5NeoJVL24QUyAwzHOfsMN2eyCQMR433/LcTjFVhncZQr64M5br0
	 oC0QBSYB271aI6Y4MWnK2SVXM58MFQ5I1auP7s7+pY42kOh0cXVT+tDjABZSWRDrzN
	 NYs3EwV6ugUlEFh3Z7lQ8CvcPrnNRF5Z02MBAW/73R+iaSSv8kzM2eCIUeVW203Uvd
	 T5PxQUhMHtP5g==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-523ba00a581so1534806a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 11 Aug 2023 04:17:05 -0700 (PDT)
X-Gm-Message-State: AOJu0YzkuKD6/LPs3XqQ6Mu/KzTB3d+D7i8Wa9VSLNtcGrh9gs1ziYkY
	TXtk36Y0a3tub5d2Lv/WKHVetaOvHzHgke/KN6M=
X-Google-Smtp-Source: AGHT+IEe2UMHELNEPv1Mvk+a15+cz/CQPdLz0Wcclu6w1jxyN3DyNVgy7YVDggf1f2cyLytuXBg7iLUqdebOOSvZk4c=
X-Received: by 2002:aa7:d9c3:0:b0:522:28fa:3009 with SMTP id
 v3-20020aa7d9c3000000b0052228fa3009mr1580108eds.13.1691752623225; Fri, 11 Aug
 2023 04:17:03 -0700 (PDT)
MIME-Version: 1.0
References: <98f523e515b2adc2aa7bb8d133353bad74e30897.camel@redhat.com>
 <mhng-92f37526-d36c-48c0-8fbd-7676df1b6086@palmer-ri-x1c9>
 <CAJF2gTQgv5xsfSfvV7KePAXFnFQOMq4GXOp40kQgM54L6hVD7w@mail.gmail.com> <20230811-bd73721199b8699c9d7da564@orel>
In-Reply-To: <20230811-bd73721199b8699c9d7da564@orel>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 11 Aug 2023 19:16:48 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRSogcPF3D3eAEvcJOh-63wtKzncEiyH=sT-OLuVM0pvw@mail.gmail.com>
Message-ID: <CAJF2gTRSogcPF3D3eAEvcJOh-63wtKzncEiyH=sT-OLuVM0pvw@mail.gmail.com>
Subject: Re: [RFC PATCH v5 5/5] riscv/cmpxchg: Implement xchg for variables of
 size 1 and 2
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, leobras@redhat.com, Arnd Bergmann <arnd@arndb.de>, 
	Will Deacon <will@kernel.org>, peterz@infradead.org, boqun.feng@gmail.com, 
	Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, 
	parri.andrea@gmail.com, andrzej.hajda@intel.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_041707_214678_33746B70 
X-CRM114-Status: GOOD (  50.95  )
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

T24gRnJpLCBBdWcgMTEsIDIwMjMgYXQgNzoxMOKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBBdWcgMTEsIDIwMjMgYXQgMDk6NDA6
MzBBTSArMDgwMCwgR3VvIFJlbiB3cm90ZToKPiA+IE9uIEZyaSwgQXVnIDExLCAyMDIzIGF0IDEy
OjIz4oCvQU0gUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4g
Pgo+ID4gPiBPbiBUaHUsIDEwIEF1ZyAyMDIzIDA5OjA0OjA0IFBEVCAoLTA3MDApLCBsZW9icmFz
QHJlZGhhdC5jb20gd3JvdGU6Cj4gPiA+ID4gT24gVGh1LCAyMDIzLTA4LTEwIGF0IDA4OjUxICsw
MjAwLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+ID4gPiA+PiBPbiBUaHUsIEF1ZyAxMCwgMjAyMywg
YXQgMDY6MDMsIExlb25hcmRvIEJyYXMgd3JvdGU6Cj4gPiA+ID4+ID4geGNoZyBmb3IgdmFyaWFi
bGVzIG9mIHNpemUgMS1ieXRlIGFuZCAyLWJ5dGVzIGlzIG5vdCB5ZXQgYXZhaWxhYmxlIGZvcgo+
ID4gPiA+PiA+IHJpc2N2LCBldmVuIHRob3VnaCBpdHMgcHJlc2VudCBpbiBvdGhlciBhcmNoaXRl
Y3R1cmVzIHN1Y2ggYXMgYXJtNjQgYW5kCj4gPiA+ID4+ID4geDg2LiBUaGlzIGNvdWxkIGxlYWQg
dG8gbm90IGJlaW5nIGFibGUgdG8gaW1wbGVtZW50IHNvbWUgbG9ja2luZyBtZWNoYW5pc21zCj4g
PiA+ID4+ID4gb3IgcmVxdWlyaW5nIHNvbWUgcmV3b3JrIHRvIG1ha2UgaXQgd29yayBwcm9wZXJs
eS4KPiA+ID4gPj4gPgo+ID4gPiA+PiA+IEltcGxlbWVudCAxLWJ5dGUgYW5kIDItYnl0ZXMgeGNo
ZyBpbiBvcmRlciB0byBhY2hpZXZlIHBhcml0eSB3aXRoIG90aGVyCj4gPiA+ID4+ID4gYXJjaGl0
ZWN0dXJlcy4KPiA+ID4gPj4gPgo+ID4gPiA+PiA+IFNpZ25lZC1vZmYtYnk6IExlb25hcmRvIEJy
YXMgPGxlb2JyYXNAcmVkaGF0LmNvbT4KPiA+ID4gPj4KPiA+ID4gPgo+ID4gPiA+IEhlbGxvIEFy
bmQgQmVyZ21hbm4sIHRoYW5rcyBmb3IgcmV2aWV3aW5nIQo+ID4gPiA+Cj4gPiA+ID4+IFBhcml0
eSB3aXRoIG90aGVyIGFyY2hpdGVjdHVyZXMgYnkgaXRzZWxmIGlzIG5vdCBhIHJlYXNvbiB0byBk
byB0aGlzLAo+ID4gPiA+PiBpbiBwYXJ0aWN1bGFyIHRoZSBvdGhlciBhcmNoaXRlY3R1cmVzIHlv
dSBsaXN0ZWQgaGF2ZSB0aGUgaW5zdHJ1Y3Rpb25zCj4gPiA+ID4+IGluIGhhcmR3YXJlIHdoaWxl
IHJpc2N2IGRvZXMgbm90Lgo+ID4gPiA+Cj4gPiA+ID4gU3VyZSwgSSB1bmRlcnN0YW5kIFJJU0Mt
ViBkb24ndCBoYXZlIG5hdGl2ZSBzdXBwb3J0IGZvciB4Y2hnIG9uIHZhcmlhYmxlcyBvZgo+ID4g
PiA+IHNpemUgPCA0Qi4gTXkgYXJndW1lbnQgaXMgdGhhdCBpdCdzIG5pY2UgdG8gaGF2ZSBldmVu
IGFuIGVtdWxhdGVkIHZlcnNpb24gZm9yCj4gPiA+ID4gdGhpcyBpbiBjYXNlIGFueSBmdXR1cmUg
bWVjaGFuaXNtIHdhbnRzIHRvIHVzZSBpdC4KPiA+ID4gPgo+ID4gPiA+IE5vdCBoYXZpbmcgaXQg
bWF5IG1lYW4gd2Ugd29uJ3QgYmUgYWJsZSB0byBlbmFibGUgZ2l2ZW4gbWVjaGFuaXNtIGluIFJJ
U0MtVi4KPiA+ID4KPiA+ID4gSUlVQyB0aGUgYXNrIGlzIHRvIGhhdmUgYSB1c2VyIHdpdGhpbiB0
aGUga2VybmVsIGZvciB0aGVzZSBmdW5jdGlvbnMuCj4gPiA+IFRoYXQncyB0aGUgZ2VuZXJhbCB0
aGluZyB0byBkbywgYW5kIGxhc3QgdGltZSB0aGlzIGNhbWUgdXAgdGhlcmUgd2FzIG5vCj4gPiA+
IGluLWtlcm5lbCB1c2Ugb2YgaXQgLS0gdGhlIHFzcGlubG9jayBzdHVmZiB3b3VsZCwgYnV0IHdl
IGhhdmVuJ3QgZW5hYmxlZAo+ID4gPiBpdCB5ZXQgYmVjYXVzZSB3ZSdyZSB3b3JyaWVkIGFib3V0
IHRoZSBwZXJmb3JtYW5jZS9mYWlybmVzcyBzdHVmZiB0aGF0Cj4gPiA+IG90aGVyIHBvcnRzIGhh
dmUgc2VlbiBhbmQgbm9ib2R5J3MgZ290IGNvbmNyZXRlIGJlbmNobWFya3MgeWV0ICh0aG91Z2gK
PiA+ID4gdGhlcmUncyBhbm90aGVyIHBhdGNoIHNldCBvdXQgdGhhdCBJIGhhdmVuJ3QgaGFkIHRp
bWUgdG8gbG9vayB0aHJvdWdoLAo+ID4gPiBzbyB0aGF0IG1heSBoYXZlIGNoYW5nZWQpLgo+ID4g
Q29ub3IgZG9lc24ndCBhZ3JlZSB3aXRoIHVzaW5nIGFuIGFsdGVybmF0aXZlIGFzIGEgZGV0b3Vy
IG1lY2hhbmlzbQo+ID4gYmV0d2VlbiBxc3BpbmxvY2sgJiB0aWNrZXQgbG9jay4gU28gSSdtIHBy
ZXBhcmluZyBWMTEgd2l0aCBzdGF0aWNfa2V5Cj4gPiAoanVtcF9sYWJlbCkgc3R5bGUuIE5leHQg
dmVyc2lvbiwgSSB3b3VsZCBzZXBhcmF0ZSBwYXJhdmlydF9xc3BpbmxvY2sKPiA+ICYgQ05BX3Fz
cGlubG9jayBmcm9tIFYxMC4gVGhhdCB3b3VsZCBtYWtlIGl0IGVhc3kgdG8gcmV2aWV3IHRoZQo+
ID4gcXNwaW5sb2NrIHBhdGNoIHNlcmllcy4gWW91IGNhbiByZXZpZXcgdGhlIG5leHQgdmVyc2lv
biBWMTEuIE5vdyBJJ20KPiA+IGRlYnVnZ2luZyBhIHN0YXRpY19rZXkgaW5pdCBwcm9ibGVtIHdo
ZW4gbG9hZF9tb2R1bGVzLCB3aGljaCBpcwo+ID4gdHJpZ2dlcmVkIGJ5IG91ciBjb21ib19xc3Bp
bmxvY2suCj4KPiBXZSd2ZSBzZWVuIHByb2JsZW1zIHdpdGggc3RhdGljIGtleXMgYW5kIG1vZHVs
ZSBsb2FkaW5nIGluIHRoZSBwYXN0LiBZb3UKPiBtYXkgd2FudCB0byB0YWtlIGEgbG9vayBhdCBj
b21taXQgZWI2MzU0ZTExNjMwICgicmlzY3Y6IEVuc3VyZSBpc2EtZXh0Cj4gc3RhdGljIGtleXMg
YXJlIHdyaXRhYmxlIikKVGhhbmsgeW91IGZvciB0aGUgdGlwLiBJIHdvdWxkIHRha2UgYSBsb29r
LgoKPgo+IFRoYW5rcywKPiBkcmV3Cj4KPiA+Cj4gPiBUaGUgcXNwaW5sb2NrIGlzIGJlaW5nIHRl
c3RlZCBvbiB0aGUgcmlzY3YgcGxhdGZvcm0gWzFdIHdpdGggMTI4IGNvcmVzCj4gPiB3aXRoIDgg
TlVNQSBub2RlcywgbmV4dCwgSSB3b3VsZCB1cGRhdGUgdGhlIGNvbXBhcmlzb24gcmVzdWx0cyBv
Zgo+ID4gcXNwaW5sb2NrICYgdGlja2V0IGxvY2suCj4gPgo+ID4gWzFdOiBodHRwczovL3d3dy5z
b3Bob24uYWkvCj4gPgo+ID4gPgo+ID4gPiBTbyBpZiBzb21ldGhpbmcgdXNlcyB0aGVzZSBJJ20g
aGFwcHkgdG8gZ28gbG9vayBjbG9zZXIuCj4gPiA+Cj4gPiA+ID4+IEVtdWxhdGluZyB0aGUgc21h
bGwgeGNoZygpIHRocm91Z2ggY21weGNoZygpIGlzIHBhcnRpY3VsYXJseSB0cmlja3kKPiA+ID4g
Pj4gc2luY2UgaXQncyBlYXN5IHRvIHJ1biBpbnRvIGEgY2FzZSB3aGVyZSB0aGlzIGRvZXMgbm90
IGd1YXJhbnRlZQo+ID4gPiA+PiBmb3J3YXJkIHByb2dyZXNzLgo+ID4gPiA+Pgo+ID4gPiA+Cj4g
PiA+ID4gRGlkbid0IGdldCB0aGlzIHBhcnQ6Cj4gPiA+ID4gQnkgImVtdWxhdGluZyBzbWFsbCB4
Y2hnKCkgdGhyb3VnaCBjbXB4Y2hnKCkiLCBkaWQgeW91IG1lYW4gbGlrZSBlbXVsYXRpbmcgYW4K
PiA+ID4gPiB4Y2hnICh1c3VhbGx5IDEgaW5zdHJ1Y3Rpb24pIHdpdGggbHIgJiBzYyAoc2FtZSB1
c2VkIGluIGNtcHhjaGcpID8KPiA+ID4gPgo+ID4gPiA+IElmIHNvLCB5ZWFoLCBpdCdzIGEgZmFp
ciBwb2ludDogaW4gc29tZSBleHRyZW1lIGNhc2Ugd2UgY291bGQgaGF2ZSBtdWx0aXBsZQo+ID4g
PiA+IHRocmVhZHMgYWNjZXNzaW5nIGdpdmVuIGNhY2hlbGluZSBhbmQgaGF2ZSBzYyBhbHdheXMg
ZmFpbGluZy4gT24gdGhlIG90aGVyIGhhbmQsCj4gPiA+ID4gdGhlcmUgYXJlIDIgYXJndW1lbnRz
IG9uIHRoYXQ6Cj4gPiA+ID4KPiA+ID4gPiAxIC0gT3RoZXIgYXJjaGl0ZWN0dXJlcywgKHN1Y2gg
YXMgcG93ZXJwYywgYXJtIGFuZCBhcm02NCB3aXRob3V0IExTRSBhdG9taWNzKQo+ID4gPiA+IGFs
c28gc2VlbSB0byByZWx5IGluIHRoaXMgbWVjaGFuaXNtIGZvciBldmVyeSB4Y2hnIHNpemUuIEFu
b3RoZXIgYXJjaHMgbGlrZSBjc2t5Cj4gPiA+ID4gYW5kIGxvb25nYXJjaCB1c2UgYXNtIHRoYXQg
bG9vayBsaWtlIG1pbmUgdG8gaGFuZGxlIHNpemUgPCA0QiB4Y2hnLgo+ID4gPiA+Cj4gPiA+ID4K
PiA+ID4gPj4gIFRoaXMgaXMgYWxzbyBzb21ldGhpbmcgdGhhdCBhbG1vc3Qgbm8gYXJjaGl0ZWN0
dXJlCj4gPiA+ID4+IHNwZWNpZmljIGNvZGUgcmVsaWVzIG9uIChnZW5lcmljIHFzcGlubG9jayBi
ZWluZyBhIG5vdGFibGUgZXhjZXB0aW9uKS4KPiA+ID4gPj4KPiA+ID4gPgo+ID4gPiA+IDIgLSBB
cyB5b3UgbWVudGlvbmVkLCB0aGVyZSBzaG91bGQgYmUgdmVyeSBsaXR0bGUgY29kZSB0aGF0IHdp
bGwgYWN0dWFsbHkgbWFrZQo+ID4gPiA+IHVzZSBvZiB4Y2hnIGZvciB2YXJzIDwgNEIsIHNvIGl0
IHNob3VsZCBiZSBzYWZlIHRvIGFzc3VtZSBpdHMgZmluZSB0byBub3QKPiA+ID4gPiBndWFyYW50
ZWUgZm9yd2FyZCBwcm9ncmVzcyBmb3IgdGhvc2UgcmFyZSB1c2FnZXMgKGxpa2Ugc29tZSBvZiBh
Ym92ZSBtZW50aW9uZWQKPiA+ID4gPiBhcmNocykuCj4gPiA+ID4KPiA+ID4gPj4gSSB3b3VsZCBy
ZWNvbW1lbmQganVzdCBkcm9wcGluZyB0aGlzIHBhdGNoIGZyb20gdGhlIHNlcmllcywgYXQgbGVh
c3QKPiA+ID4gPj4gdW50aWwgdGhlcmUgaXMgYSBuZWVkIGZvciBpdC4KPiA+ID4gPgo+ID4gPiA+
IFdoaWxlIEkgYWdyZWUgdGhpcyBpcyBhIHZhbGlkIHBvaW50LCBJIGJlbGlldmUgaXRzIG1vcmUg
aW50ZXJlc3RpbmcgdG8gaGF2ZSBpdAo+ID4gPiA+IGltcGxlbWVudGVkIGlmIGFueSBmdXR1cmUg
bWVjaGFuaXNtIHdhbnRzIHRvIG1ha2UgdXNlIG9mIHRoaXMuCj4gPiA+ID4KPiA+ID4gPgo+ID4g
PiA+IFRoYW5rcyEKPiA+ID4gPiBMZW8KPiA+Cj4gPgo+ID4KPiA+IC0tCj4gPiBCZXN0IFJlZ2Fy
ZHMKPiA+ICBHdW8gUmVuCj4gPgo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiA+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+ID4gbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
