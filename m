Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C31D2FEDC
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jan 2026 20:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lBlH0ed5OSNth1V2AjkL1x2b/2PgBSJU1vUXasLXg6Y=; b=aAbtrnxnQyFfQY
	cSS+iFYjSzV4RQn5BwiUK0MI1FSVSsbQlPaDDBC7xE9i/bAoyuTUwWkumaysEQupbFFA3sSOhcCPL
	FA097zlcziFGeBYTsDWTqve7CMRU2EscOuK6XRoko5gVmDa4D4+zT2h7nJ6w7U47TqYFxkrtHPEY7
	e05B9IhrbKIQGTVa4WbV0lmka0jTO65nDG3+CdouCuD267duIullxEzjrrzQlZpz1gR3x24SQEN+g
	g6sKqm0XuFfCVHsSIrxWNZNsyOHe5D44jLBZWMbX3d37Pq2b6wHis520HVZlr1QCcBazumEvjRW5M
	MJLT3LWse8ZuYF5uHmLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkpIn-0000000Ez4p-26Jw;
	Tue, 27 Jan 2026 20:04:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkpIl-0000000Ez4T-2GA0
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jan 2026 20:04:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DDCA5443AF
	for <linux-riscv@lists.infradead.org>; Tue, 27 Jan 2026 20:04:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C27D3C2BCB2
	for <linux-riscv@lists.infradead.org>; Tue, 27 Jan 2026 20:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769544278;
	bh=jUUtUcVXRERiAsRJ9OwA/nKDSiKokoPY+D9aCIvylXk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RQHneNFT8DagMfI3zRgS3fFX0jtx3XgKHGpaBUcycRlcLWcwNrDF8+iaQowgamVQ1
	 xXqXfBvm/BX3XSYQSTqEWvSHp1jyjymN+//hhAvPlu96mkbAVz7XCixPnQnnknFnsO
	 5qZEFNOflGyMAPa/ZKdIpT/bdoP5XVrwtW9IpZG7QhqKgrQlITxqvqHI38RVhq5EqQ
	 0GSwSHotr9nxM21o+9HHc+XxQpXaKR0Tuosza5N6TWCVlFYiiy9OP7GB15ghqYdBOu
	 EZLCSJ6jmfm2ihAH7mFex5VqwproBcl3VAthGrE2GgVJcYQ8+LpzhNtJ9yRWMO1NHy
	 lJAxYqWod4Blw==
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-40418578e28so1715486fac.1
        for <linux-riscv@lists.infradead.org>; Tue, 27 Jan 2026 12:04:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUbHJ/m4CGRXWMP2zTsXz4IYbkv9lwKcT/VBpNx7hpgB9V36BV/cS4mfYdqnvZuRmM5lqLpIe8X4g46zg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwWbQQVExSAvXAK/AvdG7dXFwAIRJ4sfJRP2vwm+YGAfxp40BKf
	kPgORtnRvRQ/1F5o2LedCDm9l91wBMdzyckN3LLJJz8X5funLAzxSASd/4TfAQGlJ0DU5UwXKpb
	UWU23zJCXV6cuaoYpyI5H//d3pUT8KK0=
X-Received: by 2002:a05:6820:1a0c:b0:662:fabc:b115 with SMTP id
 006d021491bc7-662fabcb5f8mr147622eaf.3.1769544277656; Tue, 27 Jan 2026
 12:04:37 -0800 (PST)
MIME-Version: 1.0
References: <CAJZ5v0iZukqD0atbdfBnmZAxUzNB6sTcJ1YUeAo5a8NRn-emEg@mail.gmail.com>
 <20260127194648.GA368841@bhelgaas>
In-Reply-To: <20260127194648.GA368841@bhelgaas>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 27 Jan 2026 21:04:26 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0gXGXOEJpYSAsFiO_L+ek1o9mKT0k2gJe1SSYz0p1=RaA@mail.gmail.com>
X-Gm-Features: AZwV_QhJYNqSfxPIkL2EQRerz5kqNDyWsVWPfnCWR5f_Ug00YI2GuruF3_YUUIw
Message-ID: <CAJZ5v0gXGXOEJpYSAsFiO_L+ek1o9mKT0k2gJe1SSYz0p1=RaA@mail.gmail.com>
Subject: Re: [PATCH v2] ACPI: pci_root: Clear the acpi dependencies after PCI
 root bridge initialization on RISC-V
To: Bjorn Helgaas <helgaas@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_120439_628515_1E9F9177 
X-CRM114-Status: GOOD (  47.77  )
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org, hu.yuye@zte.com.cn, guo.chang2@zte.com.cn, deng.weixian@zte.com.cn, liu.qingtao2@zte.com.cn, zuo.jiang@zte.com.cn, linux-acpi@vger.kernel.org, li.kunpeng@zte.com.cn, wu.jiabao@zte.com.cn, lin.yongchun@zte.com.cn, Albert Ou <aou@eecs.berkeley.edu>, huyuye <huyuye812@163.com>, dai.hualiang@zte.com.cn, Bjorn Helgaas <bhelgaas@google.com>, Alexandre Ghiti <alex@ghiti.fr>, zhang.longxiang@zte.com.cn, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKYW4gMjcsIDIwMjYgYXQgODo0NuKAr1BNIEJqb3JuIEhlbGdhYXMgPGhlbGdhYXNA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIEphbiAyNywgMjAyNiBhdCAwNjo1MDoyNFBN
ICswMTAwLCBSYWZhZWwgSi4gV3lzb2NraSB3cm90ZToKPiA+IE9uIFR1ZSwgSmFuIDI3LCAyMDI2
IGF0IDY6MjbigK9QTSBCam9ybiBIZWxnYWFzIDxoZWxnYWFzQGtlcm5lbC5vcmc+IHdyb3RlOgo+
ID4gPiBPbiBUdWUsIEphbiAyNywgMjAyNiBhdCAwNDowMDo0OVBNICswMTAwLCBSYWZhZWwgSi4g
V3lzb2NraSB3cm90ZToKPiA+ID4gPiBPbiBNb24sIEphbiAxMiwgMjAyNiBhdCAzOjE34oCvUE0g
aHV5dXllIDxodXl1eWU4MTJAMTYzLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gSGkg
UmFmYWVsLAo+ID4gPiA+ID4gVGhhbmsgeW91IGZvciB5b3VyIHRob3JvdWdoIHJldmlldyBhbmQg
dmFsdWFibGUgY29tbWVudHMgb24gdjEuCj4gPiA+ID4gPiBJJ3ZlIHVwZGF0ZWQgdGhlIHBhdGNo
IGFzIGZvbGxvd3M6Cj4gPiA+ID4gPiAxLiBSZW1vdmVkIHRoZSByZWR1bmRhbnQgI2lmZGVmIENP
TkZJR19BQ1BJIGFuZCBpZiAoIWFjcGlfZGlzYWJsZWQpCj4gPiA+ID4gPiBndWFyZCBhcyB5b3Ug
cG9pbnRlZCBvdXQuIFRoZSBlbnRpcmUgY29kZSBibG9jayBpbmRlZWQgYWxyZWFkeSBkZXBlbmRz
Cj4gPiA+ID4gPiBvbiBDT05GSUdfQUNQSSBhdCBhIGhpZ2hlciBsZXZlbCwgbWFraW5nIHRoZSBp
bm5lciBndWFyZCB1bm5lY2Vzc2FyeS4KPiA+ID4gPiA+IDIuIE1vdmVkIGFjcGlfZGV2X2NsZWFy
X2RlcGVuZGVuY2llcyB0byBSSVNDLVYgc3BlY2lmaWMgYXJjaGl0ZWN0dXJlCj4gPiA+ID4gPiBj
b2RlIChkcml2ZXIvYWNwaS9yaXNjdi9hY3BpX3BjaS5jKS4gVGhpcyBlbnN1cmVzIHRoYXQgQUNQ
SSBkZXBlbmRlbmN5Cj4gPiA+ID4gPiBjbGVhcmluZyBpcyBoYW5kbGVkIHdpdGhpbiB0aGUgYXBw
cm9wcmlhdGUgYXJjaGl0ZWN0dXJhbCBjb250ZXh0Lgo+ID4gPiA+ID4KPiA+ID4gPiA+IEJlc3Qg
cmVnYXJkcwo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogaHV5dXllIDxodXl1eWU4MTJAMTYzLmNv
bT4KPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gIGRyaXZlcnMvYWNwaS9wY2lfcm9vdC5jICAgICAg
IHwgIDYgKysrKysrCj4gPiA+ID4gPiAgZHJpdmVycy9hY3BpL3Jpc2N2L01ha2VmaWxlICAgfCAg
MiArLQo+ID4gPiA+ID4gIGRyaXZlcnMvYWNwaS9yaXNjdi9hY3BpX3BjaS5jIHwgMTEgKysrKysr
KysrKysKPiA+ID4gPiA+ICBpbmNsdWRlL2FjcGkvYWNwaV9idXMuaCAgICAgICB8ICAxICsKPiA+
ID4gPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
PiA+ID4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9hY3BpL3Jpc2N2L2FjcGlfcGNp
LmMKPiA+ID4gPiA+Cj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9hY3BpL3BjaV9yb290
LmMgYi9kcml2ZXJzL2FjcGkvcGNpX3Jvb3QuYwo+ID4gPiA+ID4gaW5kZXggOWQ3Zjg1ZGFkYzQ4
Li5hMTZlYjkwOTdjZGMgMTAwNjQ0Cj4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2FjcGkvcGNpX3Jv
b3QuYwo+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9hY3BpL3BjaV9yb290LmMKPiA+ID4gPiA+IEBA
IC0zMCw2ICszMCwxMSBAQCBzdGF0aWMgaW50IGFjcGlfcGNpX3Jvb3RfYWRkKHN0cnVjdCBhY3Bp
X2RldmljZSAqZGV2aWNlLAo+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBj
b25zdCBzdHJ1Y3QgYWNwaV9kZXZpY2VfaWQgKm5vdF91c2VkKTsKPiA+ID4gPiA+ICBzdGF0aWMg
dm9pZCBhY3BpX3BjaV9yb290X3JlbW92ZShzdHJ1Y3QgYWNwaV9kZXZpY2UgKmRldmljZSk7Cj4g
PiA+ID4gPgo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gK3ZvaWQgX193ZWFrIGFyY2hfYWNwaV9wY2lf
cm9vdF9hZGRfY2xlYXJfZGVwKHN0cnVjdCBhY3BpX2RldmljZSAqZGV2aWNlKQo+ID4gPiA+ID4g
K3sKPiA+ID4gPiA+ICt9Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiAgc3RhdGljIGludCBhY3BpX3Bj
aV9yb290X3NjYW5fZGVwZW5kZW50KHN0cnVjdCBhY3BpX2RldmljZSAqYWRldikKPiA+ID4gPiA+
ICB7Cj4gPiA+ID4gPiAgICAgICAgIGFjcGlwaHBfY2hlY2tfaG9zdF9icmlkZ2UoYWRldik7Cj4g
PiA+ID4gPiBAQCAtNzYwLDYgKzc2NSw3IEBAIHN0YXRpYyBpbnQgYWNwaV9wY2lfcm9vdF9hZGQo
c3RydWN0IGFjcGlfZGV2aWNlICpkZXZpY2UsCj4gPiA+ID4gPiAgICAgICAgIHBjaV9sb2NrX3Jl
c2Nhbl9yZW1vdmUoKTsKPiA+ID4gPiA+ICAgICAgICAgcGNpX2J1c19hZGRfZGV2aWNlcyhyb290
LT5idXMpOwo+ID4gPiA+ID4gICAgICAgICBwY2lfdW5sb2NrX3Jlc2Nhbl9yZW1vdmUoKTsKPiA+
ID4gPiA+ICsgICAgICAgYXJjaF9hY3BpX3BjaV9yb290X2FkZF9jbGVhcl9kZXAoZGV2aWNlKTsK
PiA+ID4gPgo+ID4gPiA+IEFjdHVhbGx5LCB0aGlzIGNvdWxkIGJlIGFzIHNpbXBsZSBhcwo+ID4g
PiA+Cj4gPiA+ID4gICAgICAgIGlmIChJU19FTkFCTEVEKENPTkZJR19SSVNDVikpCj4gPiA+ID4g
ICAgICAgICAgICAgICBhY3BpX2Rldl9jbGVhcl9kZXBlbmRlbmNpZXMoZGV2aWNlKTsKPiA+ID4g
Pgo+ID4gPiA+IHdpdGggYSBicmllZiBjb21tZW50IGV4cGxhaW5pbmcgd2h5IGl0IGlzIG5lZWRl
ZC4KPiA+ID4gPgo+ID4gPiA+IEJqb3JuLCBhbnkgdGhvdWdodHM/Cj4gPiA+Cj4gPiA+IFRoZSBq
dXN0aWZpY2F0aW9uICgiSWYgYSBob3N0IGJyaWRnZSBCIGRlcGVuZHMgb24gaG9zdCBicmlkZ2Ug
QSAodmlhCj4gPiA+IF9ERVApLCB0aGlzIGNhbGwgYWxsb3dzIGJyaWRnZSBCIHRvIHByb2NlZWQg
d2l0aCBlbnVtZXJhdGlvbiBhZnRlcgo+ID4gPiBicmlkZ2UgQSBpcyBmdWxseSBpbml0aWFsaXpl
ZCIpIGRvZXNuJ3Qgc291bmQgc3BlY2lmaWMgdG8gUklTQy1WLgo+ID4KPiA+IEJ1dCB0aGVyZSBh
cmUgbm8gX0RFUCBkZXBlbmRlbmNpZXMgYmV0d2VlbiBob3N0IGJyaWRnZXJzIG9uIG90aGVyCj4g
PiBhcmNoaXRlY3R1cmVzIGluIHByYWN0aWNlLgo+ID4KPiA+IGFjcGlfZGV2X2NsZWFyX2RlcGVu
ZGVuY2llcygpIGNvdWxkIGJlIGNhbGxlZCB1bmNvbmRpdGlvbmFsbHkgaGVyZSwKPiA+IGJ1dCBp
dCB3b3VsZCBiZSB1c2VsZXNzIG92ZXJoZWFkIGlmIG5vIHN1Y2ggZGVwZW5kZW5jaWVzIGV4aXN0
ZWQuCj4gPgo+ID4gPiBGb3IgdGhhdCBtYXR0ZXIsIGl0IGRvZXNuJ3Qgc291bmQgc3BlY2lmaWMg
dG8gaG9zdCBicmlkZ2VzIGVpdGhlci4KPiA+Cj4gPiBObywgaXQgaXMgbm90IHNwZWNpZmljIHRv
IGhvc3QgYnJpZGdlcy4KPiA+Cj4gPiA+IFRoZSBfREVQIHNwZWMgbGFuZ3VhZ2UgaXMgYSBiaXQg
dmFndWUuICBBQ1BJIHI2LjYsIHNlYyA2LjUuOCwgc2F5czoKPiA+ID4KPiA+ID4gICBfREVQIGV2
YWx1YXRlcyB0byBhIHBhY2thZ2UgYW5kIGRlc2lnbmF0ZXMgZGV2aWNlIG9iamVjdHMgdGhhdCBP
U1BNCj4gPiA+ICAgc2hvdWxkIGFzc2lnbiBhIGhpZ2hlciBwcmlvcml0eSBpbiBzdGFydCBvcmRl
cmluZyBkdWUgdG8KPiA+ID4gICBkZXBlbmRlbmNpZXMgYmV0d2VlbiBkZXZpY2VzIChmb3IgZXhh
bXBsZSwgcmVsYXRlZCB0byBmdXR1cmUKPiA+ID4gICBvcGVyYXRpb24gcmVnaW9uIGFjY2Vzc2Vz
KS4KPiA+ID4KPiA+ID4gSSBkb24ndCBrbm93IHdoYXQgImRldmljZSBzdGFydCIgbWVhbnMuICBJ
dCBzb3VuZHMgbGlrZSB0aGlzIGFsbHVkZXMKPiA+ID4gdG8gdGhlIG9yZGVyIGluIHdoaWNoIE9T
UE0gcnVucyBzb21lIGRldmljZSBzdGFydCBtZXRob2Q/ICBfSU5JPwo+ID4gPiBTaG91bGQgYWNw
aV9kZXZfY2xlYXJfZGVwZW5kZW5jaWVzKCkgYmUgZG9uZSBhdCB0aGUgcG9pbnQgd2hlcmUgdGhh
dAo+ID4gPiBkZXZpY2Ugc3RhcnQgbWV0aG9kIGlzIHJ1bj8KPiA+Cj4gPiBOb3QgcmVhbGx5Lgo+
ID4KPiA+IGFjcGlfZGV2X2NsZWFyX2RlcGVuZGVuY2llcygpIGlzIHJlbGF0ZWQgdG8gdGhlIHdh
eSBMaW51eCB1c2VzIF9ERVAKPiA+IHdoaWNoIGlzIHRvIGRlZmVyIHRoZSBlbnVtZXJhdGlvbiBv
ZiBkZXBlbmRlbnQgZGV2aWNlcyB1bnRpbCB0aGUKPiA+IGRldmljZXMgdGhleSBkZXBlbmQgb24g
YXJlIHJlYWR5Lgo+ID4KPiA+IFNvIGJ5IGNhbGxpbmcgYWNwaV9kZXZfY2xlYXJfZGVwZW5kZW5j
aWVzKCkgdGhlIGRyaXZlciBiYXNpY2FsbHkKPiA+IGFsbG93cyBvdGhlciBkcml2ZXJzIHRvIGJp
bmQgdG8gZGV2aWNlcy4KPgo+IEkgYXNzdW1lZCB0aGUgZGVwZW5kZW5jeSBleHByZXNzZWQgYnkg
X0RFUCB3b3VsZCBiZSBzYXRpc2ZpZWQgYnkgdGhlCj4gZXhlY3V0aW9uIG9mIHNvbWUgb3RoZXIg
QUNQSSBtZXRob2QuICBFLmcuLCB0aGUgZGVwZW5kZW5jeSBtaWdodCBiZQo+IHNhdGlzZmllZCB3
aGVuIGEgX1JFRyBtZXRob2QgbWFrZXMgYW4gb3ByZWdpb24gYXZhaWxhYmxlIChhbHRob3VnaCB0
aGUKPiBzcGVjIHNlZW1zIHRvIHN1Z2dlc3QgdGhhdCdzIG9ubHkgb25lIG9mIHRoZSBwb3NzaWJs
ZSBkZXBlbmRlbmNpZXMpLgo+Cj4gQnV0IGluIHRoaXMgY2FzZSBpdCBzb3VuZHMgbGlrZSBSSVND
LVYgaXMgdXNpbmcgX0RFUCBub3QgYmVjYXVzZSBvZgo+IGFueSBBQ1BJLXJlbGF0ZWQgb3JkZXJp
bmcgcmVxdWlyZW1lbnQsIGJ1dCBzaW1wbHkgdG8gZW5mb3JjZSB0aGUgT1MKPiBlbnVtZXJhdGlv
biBvcmRlciAoYW5kIHRoZXJlZm9yZSBuYW1pbmcpLiAgSSBndWVzcyB0aGlzIHJlZmVycyB0byBQ
Q0kKPiBkZXZpY2UgbmFtaW5nLCBzbyBJIHN1cHBvc2UgdGhhdCBkZXBlbmRlbmN5IGlzIG9uCj4g
cGNpX2FjcGlfc2Nhbl9yb290KCkuCj4KPiBJIHRob3VnaHQgdWRldiB3YXMgc3VwcG9zZWQgdG8g
YmUgdGhlIHJlYWwgc29sdXRpb24gZm9yIGNvbnNpc3RlbnQKPiBuYW1pbmcuICBJcyB0aGlzIHNv
cnQgb2YgYSB3b3JrYXJvdW5kIHRvIGFjY29tcGxpc2ggdGhlIHNhbWUgZW5kPwoKSUlVQywgdGhl
IGVudW1lcmF0aW9uIG9yZGVyaW5nIGVuZm9yY2VtZW50IG9uIFJJU0MtViBpcyByZWxhdGVkIHRv
IGEKZnVuY3Rpb25hbCBkZXBlbmRlbmN5LCBidXQgYWRtaXR0ZWRseSBJJ20gdW5mYW1pbGlhciB3
aXRoIHRoZSBkZXRhaWxzLgoKPiBJbiBhbnkgY2FzZSwgeW91ciBJU19FTkFCTEVEKENPTkZJR19S
SVNDVikgcHJvcG9zYWwgc2VlbXMgZmluZSB0byBtZS4KPiBJIHRoaW5rIGl0J3MgbmljZSBpZiB3
ZSBjYW4gYXZvaWQgYWRkaW5nIGFub3RoZXIgX193ZWFrIGZ1bmN0aW9uLgoKT0ssIHRoYW5rcyEK
Ckkgd291bGQgYWxzbyBsaWtlIHRvIGdldCBzb21lIGZlZWRiYWNrIG9uIHRoaXMgZnJvbSB0aGUg
UklTQy1WIHNpZGUuClNwZWNpZmljYWxseSBvbiB0aGUgcmVhc29ucyB3aHkgdGhlIF9ERVAgaW4g
cXVlc3Rpb24gaXMgdXNlZCBpbiB0aGUKZmlybXdhcmUuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
