Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 854E1C54EED
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 18:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KmDCyZQnI1sy/p8e9rMm2W+S/t3yi6pQTycCkDGfA7g=; b=cCqUokL2Ct4EZE
	+dvAXxsMKIX42v1PpT/qv7cizeQLOg68X5KBuJ8+D4p6SSAqQz22bO/Fu65ZDMYQRuRumXzhJHDvL
	TngcB5x6O6NF71/razJB85lDmK5gJ0xt/oAiUsUCJZgDcYzF/UsV3DEBofZyH7LtZR72i1ywJOvZT
	Ipk28HVToGOSn9DNKqekmnCdCdkZxZGudml8tM3eXH+DP9bHEF3uoW3KbRHh/s1BbInikOeKFOR20
	lD2hhddHVyIhotOlL7HnTo5uom7vNjb4V34bh2MYIA6kt/KEUrbPaBi1QWxnws4s807K+u2PzqsRJ
	lyCy0ZsjxwE2664lPwJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYhu-004uPB-P5; Mon, 30 Jan 2023 18:16:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYh7-004u6U-Kt
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 18:15:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8AD5C19F0;
	Mon, 30 Jan 2023 07:50:04 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.10.155])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B45653F882;
	Mon, 30 Jan 2023 07:49:20 -0800 (PST)
Date: Mon, 30 Jan 2023 15:49:15 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Guo Ren <guoren@kernel.org>, "liaochang (A)" <liaochang1@huawei.com>,
	palmer@dabbelt.com, paul.walmsley@sifive.com, mhiramat@kernel.org,
	conor.dooley@microchip.com, penberg@kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH] riscv: kprobe: Optimize kprobe with accurate atomicity
Message-ID: <Y9fm+6LPXgtDSma/@FVFF77S0Q05N>
References: <20230126161559.1467374-1-guoren@kernel.org>
 <0abbbdd4-6b85-9659-03ee-97c56a5b77c1@huawei.com>
 <CAJF2gTS0s4X_uwLaEeSqKAyRmxCR2vxRuHhz7-SP2w4bBqzr+Q@mail.gmail.com>
 <87r0vc9h4g.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87r0vc9h4g.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_101553_824507_8494B99C 
X-CRM114-Status: GOOD (  28.28  )
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

SGkgQmpvcm4sCgpPbiBNb24sIEphbiAzMCwgMjAyMyBhdCAwNDoyODoxNVBNICswMTAwLCBCasO2
cm4gVMO2cGVsIHdyb3RlOgo+IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPiB3cml0ZXM6Cj4g
Cj4gPj4gSW4gdGhlIHNlcmllIG9mIFJJU0NWIE9QVFBST0JFUyBbMV0sIGl0IHBhdGNoZXMgYSBs
b25nLWp1bXAgaW5zdHJ1Y3Rpb25zIHBhaXIKPiA+PiBBVUlQQy9KQUxSIGluIGtlcm5lbCB0ZXh0
LCBzbyBpbiBvcmRlciB0byBlbnN1cmUgb3RoZXIgQ1BVcyBkb2VzIG5vdCBleGVjdXRlCj4gPj4g
aW4gdGhlIGluc3RydWN0aW9ucyB0aGF0IHdpbGwgYmUgbW9kaWZpZWQsIGl0IGlzIHN0aWxsIG5l
ZWQgdG8gc3RvcCBvdGhlciBDUFVzCj4gPj4gdmlhIHBhdGNoX3RleHQgQVBJLCBvciB5b3UgaGF2
ZSBhbnkgYmV0dGVyIHNvbHV0aW9uIHRvIGFjaGlldmUgdGhlIHB1cnBvc2U/Cj4gPiAgLSBUaGUg
c3RvcF9tYWNoaW5lIGlzIGFuIGV4cGVuc2l2ZSB3YXkgYWxsIGFyY2hpdGVjdHVyZXMgc2hvdWxk
Cj4gPiBhdm9pZCwgYW5kIHlvdSBjb3VsZCBrZWVwIHRoYXQgaW4geW91ciBPUFRQUk9CRVMgaW1w
bGVtZW50YXRpb24gZmlsZXMKPiA+IHdpdGggc3RhdGljIGZ1bmN0aW9ucy4KPiA+ICAtIFRoZSBz
dG9wX21hY2hpbmUgY291bGRuJ3Qgd29yayB3aXRoIFBSRUVNUFRJT04sIHNvIHlvdXIKPiA+IGlt
cGxlbWVudGF0aW9uIG5lZWRzIHRvIHdvcmsgd2l0aCAhUFJFRU1QVElPTi4KPiAKPiAuLi5hbmQg
c3RvcF9tYWNoaW5lKCkgd2l0aCAhUFJFRU1QVElPTiBpcyBicm9rZW4gYXMgd2VsbCwgd2hlbiB5
b3UncmUKPiByZXBsYWNpbmcgbXVsdGlwbGUgaW5zdHJ1Y3Rpb25zIChzZWUgTWFyaydzIHBvc3Qg
YXQgWzFdKS4gVGhlCj4gc3RvcF9tYWNoaW5lKCkgZGFuY2UgbWlnaHQgd29yayB3aGVuIHlvdSdy
ZSByZXBsYWNpbmcgKm9uZSogaW5zdHJ1Y3Rpb24sCj4gbm90IG11bHRpcGxlIGFzIGluIHRoZSBS
SVNDLVYgY2FzZS4gSSdsbCBleHBhbmQgb24gdGhpcyBpbiBhIGNvbW1lbnQgaW4KPiB0aGUgT1BU
UFJPQkVTIHY2IHNlcmllcy4KCkp1c3QgdG8gY2xhcmlmeSwgbXkgY29tbWVudHMgaW4gWzFdIHdl
cmUgYXNzdW1pbmcgdGhhdCBzdG9wX21hY2hpbmUoKSB3YXMgbm90CnVzZWQsIGluIHdoaWNoIGNh
c2UgdGhlcmUgaXMgYSBwcm9ibGVtIHdpdGggb3Igd2l0aG91dCBQUkVFTVBUSU9OLgoKSSBiZWxp
ZXZlIHRoYXQgd2hlbiB1c2luZyBzdG9wX21hY2hpbmUoKSwgdGhlICFQUkVFTVBUSU9OIGNhc2Ug
aXMgZmluZSwgc2luY2UKc3RvcF9tYWNoaW5lKCkgc2NoZWR1bGVzIHdvcmsgcmF0aGVyIHRoYW4g
cnVubmluZyB3b3JrIGluIElSUSBjb250ZXh0IG9uIHRoZQpiYWNrIG9mIGFuIElQSSwgc28gbm8g
Q1BVcyBzaG91bGQgYmUgbWlkLXNlcXVuY2UgZHVyaW5nIHRoZSBwYXRjaGluZywgYW5kIGl0J3MK
bm90IHBvc3NpYmxlIGZvciB0aGVyZSB0byBiZSB0aHJlYWRzIHdoaWNoIGFyZSBwcmVlbXB0ZWQg
bWlkLXNlcXVlbmNlLgoKVGhhdCBhbGwgc2FpZCwgSUlVQyBvcHRwcm9iZXMgaXMgZ29pbmcgdG8g
ZGlzYXBwZWFyIG9uY2UgZnByb2JlIGlzIHJlYWR5CmV2ZXJ5d2hlcmUsIHNvIHRoYXQgbWlnaHQg
YmUgbW9vdC4KClRoYW5rcywKTWFyay4KCj4gPj4gPiAgc3RhdGljIHZvaWQgX19rcHJvYmVzIGFy
Y2hfcHJlcGFyZV9zaW11bGF0ZShzdHJ1Y3Qga3Byb2JlICpwKQo+ID4+ID4gQEAgLTExNCwxNiAr
MTIwLDIzIEBAIHZvaWQgKmFsbG9jX2luc25fcGFnZSh2b2lkKQo+ID4+ID4gIC8qIGluc3RhbGwg
YnJlYWtwb2ludCBpbiB0ZXh0ICovCj4gPj4gPiAgdm9pZCBfX2twcm9iZXMgYXJjaF9hcm1fa3By
b2JlKHN0cnVjdCBrcHJvYmUgKnApCj4gPj4gPiAgewo+ID4+ID4gLSAgICAgaWYgKChwLT5vcGNv
ZGUgJiBfX0lOU05fTEVOR1RIX01BU0spID09IF9fSU5TTl9MRU5HVEhfMzIpCj4gPj4gPiAtICAg
ICAgICAgICAgIHBhdGNoX3RleHQocC0+YWRkciwgX19CVUdfSU5TTl8zMik7Cj4gPj4gPiAtICAg
ICBlbHNlCj4gPj4gPiAtICAgICAgICAgICAgIHBhdGNoX3RleHQocC0+YWRkciwgX19CVUdfSU5T
Tl8xNik7Cj4gPj4gPiArI2lmZGVmIENPTkZJR19SSVNDVl9JU0FfQwo+ID4+ID4gKyAgICAgdTMy
IG9wY29kZSA9IF9fQlVHX0lOU05fMTY7Cj4gPj4gPiArI2Vsc2UKPiA+PiA+ICsgICAgIHUzMiBv
cGNvZGUgPSBfX0JVR19JTlNOXzMyOwo+ID4+ID4gKyNlbmRpZgo+ID4+ID4gKyAgICAgcGF0Y2hf
dGV4dF9ub3N5bmMocC0+YWRkciwgJm9wY29kZSwgR0VUX0lOU05fTEVOR1RIKG9wY29kZSkpOwo+
ID4+Cj4gPj4gU291bmRzIGdvb2QsIGJ1dCBpdCB3aWxsIGxlYXZlIHNvbWUgUlZJIGluc3RydWN0
aW9uIHRydW5jYXRlZCBpbiBrZXJuZWwgdGV4dCwKPiA+PiBpIGRvdWJ0IGtlcm5lbCBiZWhhdmlv
ciBkZXBlbmRzIG9uIHRoZSByZXN0IG9mIHRoZSB0cnVuY2F0ZWQgaW5zdHJ1Y3Rpb24sIHdlbGws
Cj4gPj4gaXQgbmVlZHMgbW9yZSBzdHJpY3QgdGVzdGluZyB0byBwcm92ZSBteSBjb25jZXJuIDop
Cj4gPiBJIGRvIHRoaXMgb24gcHVycG9zZSwgYW5kIGl0IGRvZXNuJ3QgY2F1c2UgYW55IHByb2Js
ZW1zLiBEb24ndCB3b3JyeTsKPiA+IElGVSBodyBtdXN0IGVuZm9yY2UgdGhlIGZldGNoIHNlcXVl
bmNlLCBhbmQgdGhlcmUgaXMgbm8gd2F5IHRvIGV4ZWN1dGUKPiA+IGJyb2tlbiBpbnN0cnVjdGlv
bnMgZXZlbiBpbiB0aGUgc3BlY3VsYXRpdmUgZXhlY3V0aW9uIHBhdGguCj4gCj4gVGhpcyBpcyBz
dHJldGNoaW5nIHJlYWxpdHkgYSBiaXQgbXVjaC4gQVJNdjgsIGUuZy4sIGhhcyBhIGNoYXB0ZXIg
aW4gdGhlCj4gQXJtIEFSTSBbMl0gQXBwZW5kaXggQiAiQ29uY3VycmVudCBtb2RpZmljYXRpb24g
YW5kIGV4ZWN1dGlvbiBvZgo+IGluc3RydWN0aW9ucyIgKENNT0RYKS4gKlNvbWUqIGluc3RydWN0
aW9ucyBjYW4gYmUgcmVwbGFjZWQgY29uY3VycmVudGx5LAo+IGFuZCBvdGhlcnMgY2Fubm90IHdp
dGhvdXQgY2F1dGlvbi4gQXNzdW1pbmcgdGhhdCB0aGF0IGFsbCBSSVNDLVYKPiBpbXBsZW1lbnRh
dGlvbnMgY2FuLCBpcyBhIHN0cmV0Y2guIFJJU0MtViBoYXNuJ3QgZXZlbiBzcGVjaWZpZWQgdGhl
Cj4gYmVoYXZpb3Igb2YgQ01PRFggKHdoaWNoIGlzIHByb2JsZW1hdGljKS4KPiAKPiBJZiBhbnl0
aGluZyBpdCB3b3VsZCBiZSBtb3JlIGxpa2VseSB0aGF0IHRoZSBleGlzdGluZwo+ICJzdG9wX21h
Y2hpbmUoKS10by1yZXBsYWNlLXdpdGgtZWJyZWFrIiB3b3JrcyAoYWdhaW4sIHJlcGxhY2luZyBv
bmUKPiBpbnN0cnVjdGlvbiBkb2VzIG5vdCBoYXZlIHRoZSAhUFJFRU1QVElPTiBpc3N1ZXMpLiBU
aGVuIGFnYWluLCBubyBzcGVjLAo+IHNvIG1vc3RseSBndWVzc2luZyBmcm9tIG15IHNpZGUuIDot
KAo+IAo+IE9oLCBidXQgdGhlIGV4aXN0aW5nICJlYnJlYWsgcmVwbGFjZSIgbWlnaHQgYmUgYnJv
a2VuIGxpa2UgWzNdLgo+IAo+IAo+IEJqw7Zybgo+IAo+IAo+IFsxXSBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1yaXNjdi9ZNyUyRjZBdFg1WDArNXFGNllARlZGRjc3UzBRMDVOLwo+IFsy
XSBodHRwczovL2RldmVsb3Blci5hcm0uY29tL2RvY3VtZW50YXRpb24vZGRpMDQ4Ny9sYXRlc3QK
PiBbM10gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyMzAxMjYxNzA2MDcu
MTQ4OTE0MS0yLWd1b3JlbkBrZXJuZWwub3JnLwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
