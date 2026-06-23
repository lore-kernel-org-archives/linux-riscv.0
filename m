Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2530CDB479
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jun 2026 14:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N8oJWZc8XCK+Ca4m/oNEt7n9yRSEVuIrnjefFQzNQ04=; b=fzz1kZFc3P+XLk
	VnMvr+XRuXxCvb540uCFMEu5aSjkWQagl6taMJz1oiZmoPSsmWuovpdQ4AIBuTKGrbOOpnEzcE/e+
	doLZMjbmunVuHqrUyCBq04qzCkXEUsqH4N+Ccf83OBSCZS+1Mcx1FkXuW39W4j69UDeu3Q5TDZ2qr
	el2k/RUq8PcjUATYnjBQl2hlhM+qW8pQKKAGkvY2Qdqatl/ruTLqMxhq9P0VOQqFhx49rFHasHC+F
	VM/SIyS+XntX4Z/AlwjR6lK1dRjG+FTikwVglWBQKWJMYuzZnxneFgVXvctK+Wuog0Fy2/803Cx9w
	S7m5E+inSvV3Nk2cAmFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc2Bl-00000006SY9-3ig6;
	Tue, 23 Jun 2026 14:33:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc2Bk-00000006SXW-3CrO;
	Tue, 23 Jun 2026 14:33:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 42F894176A;
	Tue, 23 Jun 2026 14:33:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A16A1F000E9;
	Tue, 23 Jun 2026 14:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782225200;
	bh=UZpCUInDhnBDublTX9djjKn8UqqE1Mq1Xlz/SmoClrk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Rh2lkpja7usItkPkL21c8D3oJ/sJj+BeFrnINZg5ZXo0XMUiBESVoC+NJFfXTbGmw
	 AlnyN0+/A3OUoh3Gu+FZC8xXzD82M78lnXhvuOg9K59PmLI28Y1f2H5RDHcUBaHILM
	 9U85m9rQNzb4T6oym6ZfRoJrXLD/5pl9F2NrhPym4KLK5CEqLCIPi8kdypSuYfEQYg
	 tBpL8EaOn00V0r66V62qxNtLYpopmL7XMZay7CpFB//6dDan+H/ry4r2Q5pRiVGML6
	 qPsyx5/D8JKoez9yuuxDzpkh7TPifKGVum5HmBDVUWthTVp4vYhfu/Vi189GVcTKmh
	 kPWqXifwjASWw==
Date: Tue, 23 Jun 2026 15:33:09 +0100
From: Will Deacon <will@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Michael Kelley <mhklinux@outlook.com>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
	"pjw@kernel.org" <pjw@kernel.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"alex@ghiti.fr" <alex@ghiti.fr>,
	"tglx@kernel.org" <tglx@kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"hpa@zytor.com" <hpa@zytor.com>,
	"peterz@infradead.org" <peterz@infradead.org>,
	"kees@kernel.org" <kees@kernel.org>,
	"nathan@kernel.org" <nathan@kernel.org>,
	"linusw@kernel.org" <linusw@kernel.org>,
	"ojeda@kernel.org" <ojeda@kernel.org>,
	"david.kaplan@amd.com" <david.kaplan@amd.com>,
	"lukas.bulwahn@redhat.com" <lukas.bulwahn@redhat.com>,
	"ryan.roberts@arm.com" <ryan.roberts@arm.com>,
	"maz@kernel.org" <maz@kernel.org>,
	"timothy.hayes@arm.com" <timothy.hayes@arm.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"thuth@redhat.com" <thuth@redhat.com>,
	"oupton@kernel.org" <oupton@kernel.org>,
	"yeoreum.yun@arm.com" <yeoreum.yun@arm.com>,
	"miko.lenczewski@arm.com" <miko.lenczewski@arm.com>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"kevin.brodsky@arm.com" <kevin.brodsky@arm.com>,
	"james.clark@linaro.org" <james.clark@linaro.org>,
	"tabba@google.com" <tabba@google.com>,
	"mrigendra.chaubey@gmail.com" <mrigendra.chaubey@gmail.com>,
	"arnd@arndb.de" <arnd@arndb.de>,
	"anshuman.khandual@arm.com" <anshuman.khandual@arm.com>,
	"x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH RFC 3/3] arm64: Add HOTPLUG_PARALLEL support for
 secondary CPUs
Message-ID: <ajqZJVBCu_D-BkTy@willie-the-truck>
References: <20260611133809.3854977-1-ruanjinjie@huawei.com>
 <20260611133809.3854977-4-ruanjinjie@huawei.com>
 <SN6PR02MB41575306521E6223561F476FD4182@SN6PR02MB4157.namprd02.prod.outlook.com>
 <e96a2579-c010-4198-a2a3-6ba35b14aef0@huawei.com>
 <ajPitENEHWa8lDfC@willie-the-truck>
 <b828dd7a-0363-46cf-aad0-e4962e299338@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b828dd7a-0363-46cf-aad0-e4962e299338@huawei.com>
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

T24gTW9uLCBKdW4gMjIsIDIwMjYgYXQgMDU6MTY6MzBQTSArMDgwMCwgSmluamllIFJ1YW4gd3Jv
dGU6Cj4gCj4gCj4gT24gNi8xOC8yMDI2IDg6MjEgUE0sIFdpbGwgRGVhY29uIHdyb3RlOgo+ID4g
SGkgSmluamllLAo+ID4gCj4gPiBPbiBNb24sIEp1biAxNSwgMjAyNiBhdCAwNDo1MTo0OFBNICsw
ODAwLCBKaW5qaWUgUnVhbiB3cm90ZToKPiA+PiBPbiA2LzEyLzIwMjYgMTE6NDUgUE0sIE1pY2hh
ZWwgS2VsbGV5IHdyb3RlOgo+ID4+PiBGcm9tOiBKaW5qaWUgUnVhbiA8cnVhbmppbmppZUBodWF3
ZWkuY29tPiBTZW50OiBUaHVyc2RheSwgSnVuZSAxMSwgMjAyNiA2OjM4IEFNCj4gPj4+Pgo+ID4+
Pj4gU3VwcG9ydCBmb3IgcGFyYWxsZWwgc2Vjb25kYXJ5IENQVSBicmluZ3VwIGlzIGFscmVhZHkg
dXRpbGl6ZWQgYnkgeDg2LAo+ID4+Pj4gTUlQUywgYW5kIFJJU0MtVi4gVGhpcyBwYXRjaCBicmlu
Z3MgdGhpcyBjYXBhYmlsaXR5IHRvIHRoZSBhcm02NAo+ID4+Pj4gYXJjaGl0ZWN0dXJlLgo+ID4+
Pj4KPiA+Pj4+IFJld29yayB0aGUgZ2xvYmFsIGBzZWNvbmRhcnlfZGF0YWAgYWNjZXNzZWQgZHVy
aW5nIGVhcmx5IGJvb3QgaW50bwo+ID4+Pj4gYSBwZXItQ1BVIGFycmF5LiBUaGlzIGFycmF5IG1h
cHMgbG9naWNhbCBDUFUgSURzIHRvIE1QSURSX0VMMSB2YWx1ZXMsCj4gPj4+PiBlbmFibGluZyB0
aGUgZWFybHkgYm9vdCBjb2RlIGluIGhlYWQuUyB0byByZXNvbHZlIGVhY2ggc2Vjb25kYXJ5IENQ
VSdzCj4gPj4+PiBsb2dpY2FsIElEIGNvbmN1cnJlbnRseS4KPiA+Pj4+Cj4gPj4+PiBUbyBmdWxs
eSBlbmFibGUgSE9UUExVR19QQVJBTExFTCwgdGhpcyBwYXRjaCBpbXBsZW1lbnRzOgo+ID4+Pj4g
MSkgQW4gYXJtNjQtc3BlY2lmaWMgYXJjaF9jcHVocF9raWNrX2FwX2FsaXZlKCkgaGFuZGxlci4K
PiA+Pj4+IDIpIENhbGxiYWNrcyB0byBjcHVocF9hcF9zeW5jX2FsaXZlKCkgaW5zaWRlIHNlY29u
ZGFyeV9zdGFydF9rZXJuZWwoKS4KPiA+Pj4+Cj4gPj4+PiBTdWNjZXNzZnVsbHkgdGVzdGVkIG9u
IFFFTVUgQVJNNjQgdmlydCBtYWNoaW5lIChLVk0gb24sIDEyOCB2Q1BVcykuCj4gPj4+Pgo+ID4+
Pj4gfCAgICAgdGVzdCBrZXJuZWwJICAgfCBzZWNvbmRhcnkgQ1BVcyBib290IHRpbWUgfAo+ID4+
Pj4gfCAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tICAgfAktLS0tLS0tLS0tLS0tLS0tLS0tLSAgfAo+
ID4+Pj4gfCAgIFdpdGhvdXQgdGhpcyBwYXRjaCAgICAgfAkJMTU1LjY3MgkgICAgICB8Cj4gPj4+
PiB8ICAgY3B1aHAucGFyYWxsZWw9MAkgICB8CQk2Mi44OTcJICAgICAgfAo+ID4+Pj4gfCAgIGNw
dWhwLnBhcmFsbGVsPTEJICAgfAkJMTY2LjcwMwkgICAgICB8Cj4gPj4+Cj4gPj4+IFRoZSBsYXN0
IHR3byByb3dzIHNlZW0gbWl4ZWQgdXAuIEkgd291bGQgZXhwZWN0IHBhcmFsbGVsPTAgdG8KPiA+
Pj4gcmVzdWx0IGluIGEgbG9uZ2VyIGJvb3QgdGltZS4KPiA+Pgo+ID4+IEhpLCBNaWNoYWVsLAo+
ID4+Cj4gPj4gVGhlIHJlc3VsdHMgYXJlIGNvcnJlY3QgYW5kIG5vdCBtaXhlZCB1cC4KPiA+Pgo+
ID4+IENvbXBhcmVkIHRvIHRoZSBvcmlnaW5hbCBub27igJFIT1RQTFVHX1BBUkFMTEVMIGFwcHJv
YWNoLCB0aGUgYWR2YW50YWdlIG9mCj4gPj4gY3B1aHAucGFyYWxsZWw9MCBsaWVzIGluIGl0cyB1
c2Ugb2YgY3B1X3JlbGF4KGB5aWVsZGAgb24gYXJtNjQpIGluc3RlYWQKPiA+PiBvZiB0aGUgd2Fp
dF9mb3JfY29tcGxldGlvbl90aW1lb3V0KCkgbWVjaGFuaXNtICh3aGljaCBtYXkgY2F1c2Ugc2xl
ZXAKPiA+PiBhbmQgY29udGV4dCBzd2l0Y2hpbmcpLiBUaGlzIHNpZ25pZmljYW50bHkgcmVkdWNl
cyB0aGUgb3ZlcmhlYWQgb2YgVk0KPiA+PiBleGl0cyBhbmQgY29udGV4dCBzd2l0Y2hlcyBpbiBh
IEtWTSBndWVzdCwgdGhlcmVieSBjdXR0aW5nIHRoZSBzZWNvbmRhcnkKPiA+PiBDUFUgYm9vdCB0
aW1lIGJ5IG1vcmUgdGhhbiBoYWxmLgo+ID4gCj4gPiBJIGRvbid0IHRoaW5rIHRoYXQncyBhIHBh
cnRpY3VsYXJseSBjb21wZWxsaW5nIHJlYXNvbiB0byBlbmFibGUgdGhpcyBmb3IKPiA+IGFybTY0
LCBpbiBhbGwgaG9uZXN0eS4gVGhlIHlpZWxkIGluc3RydWN0aW9uIHR5cGljYWxseSBkb2Vzbid0
IGRvCj4gPiBhbnl0aGluZyBvbiBhY3R1YWwgYXJtNjQgc2lsaWNvbiwgc28gdGhpcyBwcm9iYWJs
eSBtZWFucyB0aGF0IHlvdSdyZQo+ID4gaW50cm9kdWNpbmcgYnVzeS1sb29wcyB3aGljaCB0ZW5k
IHRvIGJlIGJhZCBmb3IgcG93ZXIgYW5kIHNjYWxhYmlsaXR5Lgo+ID4gCj4gPiBJIGltcGxlbWVu
dGVkIHRoaXMgYSB3aGlsZSBhZ28gWzFdIGJ1dCBkaWRuJ3QgbWFuYWdlIHRvIHNlZSBtdWNoIGlu
IHRlcm1zCj4gPiBvZiBwZXJmb3JtYW5jZSBpbXByb3ZlbWVudCBhbmQgc28gSSBkaWRuJ3QgYm90
aGVyIHRvIHNlbmQgdGhlIHBhdGNoZXMgb3V0Cj4gPiBhZnRlciB0YWxraW5nIGFib3V0IGl0IGF0
IEtWTSBmb3J1bSBbMl0uIEhvd2V2ZXIsIGFzIG1lbnRpb25lZCBhdCB0aGUgZW5kCj4gPiBvZiB0
aGF0IHRhbGssIGl0IF9pc18gc3RpbGwgdXNlZnVsIGZvciBjb25maWRlbnRpYWwgVk1zIHVzaW5n
IFBTQ0kgc28KPiA+IGxldCBtZSBkdXN0IG9mZiBteSBvbGQgc2VyaWVzIGFuZCBzZW5kIGl0IG91
dCB0byBzZWUgd2hhdCB5b3UgdGhpbmsuCj4gCj4gSGkgV2lsbCwKPiAKPiBUaGFua3MgZm9yIHRo
ZSBpbnNpZ2h0cyEgWW91ciBwb2ludCBhYm91dCB1c2luZyBQU0NJIHYwLjIncyBDb250ZXh0IElE
Cj4gdG8gYXZvaWQgdGhlIE5SX0NQVVMgYXJyYXkgZm9yIGlucHV0IHBhcmFtZXRlcnMgKGxpa2UK
PiBzZWNvbmRhcnlfZGF0YS50YXNrKSBpcyBpbmNyZWRpYmx5IGVsZWdhbnQuCj4gCj4gSG93ZXZl
ciwgaWYgSSB1bmRlcnN0YW5kIHlvdXIgc2VyaWVzIGNvcnJlY3RseSwgaXQgc2VlbXMgeW91ciBh
cHByb2FjaAo+IHByaW1hcmlseSB0YXJnZXRzIHByZXZlbnRpbmcgdGhlIGNvbmN1cnJlbnQgdXNl
IG9mIHNlY29uZGFyeV9kYXRhLnRhc2ssCj4gYnV0IGl0IGRvZXNuJ3Qgc2VlbSB0byBhY2NvdW50
IGZvciB0aGUgcG90ZW50aWFsIGRhdGEgdHJhbXBsaW5nIG9uCj4gc2Vjb25kYXJ5X2RhdGEuc3Rh
dHVzIHdoZW4gbXVsdGlwbGUgc2Vjb25kYXJ5IENQVXMgYXJlIGJyb3VnaHQgdXAKPiBzaW11bHRh
bmVvdXNseS4KPiAKPiB1cGRhdGVfY3B1X2Jvb3Rfc3RhdHVzKCkKPiAgIC0+IFdSSVRFX09OQ0Uo
c2Vjb25kYXJ5X2RhdGEuc3RhdHVzLmZsYWdzW3ZhbF0sIDEpCj4gCj4gYXJjaF9jcHVocF9jbGVh
bnVwX2tpY2tfY3B1KCkKPiAgIC0+IHN0YXR1cyA9IFJFQURfT05DRShzZWNvbmRhcnlfZGF0YS5z
dGF0dXMpCgpJIG5lZWQgdG8gZHVzdCBpdCBiYWNrIG9mZiBidXQgSUlSQyBJIG1hZGUgdGhhdCB0
aGluZyBhIGJ5dGUgYXJyYXksIHdpdGgKYSBzZXBhcmF0ZSBieXRlIGZvciBlYWNoIGZhaWx1cmUg
cmVhc29uLgoKV2lsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
