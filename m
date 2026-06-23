Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F137CDB479
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jun 2026 14:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qo2HdRk+yap4OxBVhzyB0wUnFYxzJxmGFEY/+qtCuaw=; b=VJWLpxBJMUAiK4
	6eXIi0Fqgyrl7CQCmui607naf0ovZXFBcN0kggko4wJ+4FyxCUOKEoRGTbwQYYOGAI+A3aewGVJvs
	vZg75ns14TJa7jgbwBVTRx81yViVZKdN33CaWqhsewaZqhpg5hkLdZ0zjfEZLtE3/XwGmGy7s2YUr
	HLSPMVvUK0od6sVY7RRJcswGdMtBL43RJrn176XqnDIi8axWrHso2vCCmqu0O7FQB4Urtf2djw+bD
	cev02IR38RMi3VwriXJ7TU5s5LeX5c64xB6NyB6u4ZzuFrARCPUPDPoTFwAgT8lZGWcY2+2JOD/kw
	bNVOLk5XnbZZ3Lckof6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc28n-00000006Rev-3kCE;
	Tue, 23 Jun 2026 14:30:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc28j-00000006RcY-07jC;
	Tue, 23 Jun 2026 14:30:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9ED2640427;
	Tue, 23 Jun 2026 14:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A6021F000E9;
	Tue, 23 Jun 2026 14:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782225012;
	bh=+WOKyD1Rs8KI4TFU2iAMfZNF7RUu66RNK0cgJJH7Hh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ie1vNp+HwT4kChz++sdxq3g9aY9z+Vm5DYWZa1lrf7bHVA1ni3VAwJGjckFhfV3cK
	 SnDfkLgnEQfEDWOPg8fTQS3WuOuUetSNXmz0r4+XEfufckpIvXCkg8JoJUNWNfgqnd
	 xXJ6yMKEKHd8T8z+zE4O3ciang7EPjUYvI5Nq5qi92heRfkADAstoZ25ijGE1RSH9/
	 TeGX0D82UaggvFA5Jx46D/amaoftWsouz2M1WnttJo8sfMG4yaqCPPELBkee/HygGn
	 SDMNTfo2N1kNbNJW8U4VFj/xpiUlNFUbnsqsFTJBr7azteQJCRMLrtiGWCZZRWZNiC
	 cgg1fhb5XS7LQ==
Date: Tue, 23 Jun 2026 15:30:02 +0100
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
Message-ID: <ajqYaklhIyvaNLlk@willie-the-truck>
References: <20260611133809.3854977-1-ruanjinjie@huawei.com>
 <20260611133809.3854977-4-ruanjinjie@huawei.com>
 <SN6PR02MB41575306521E6223561F476FD4182@SN6PR02MB4157.namprd02.prod.outlook.com>
 <e96a2579-c010-4198-a2a3-6ba35b14aef0@huawei.com>
 <ajPitENEHWa8lDfC@willie-the-truck>
 <2a34ff43-78a0-4d99-885a-0e7f560634ca@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2a34ff43-78a0-4d99-885a-0e7f560634ca@huawei.com>
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

T24gTW9uLCBKdW4gMjIsIDIwMjYgYXQgMDQ6MDY6MzhQTSArMDgwMCwgSmluamllIFJ1YW4gd3Jv
dGU6Cj4gT24gNi8xOC8yMDI2IDg6MjEgUE0sIFdpbGwgRGVhY29uIHdyb3RlOgo+ID4gT24gTW9u
LCBKdW4gMTUsIDIwMjYgYXQgMDQ6NTE6NDhQTSArMDgwMCwgSmluamllIFJ1YW4gd3JvdGU6Cj4g
Pj4gT24gNi8xMi8yMDI2IDExOjQ1IFBNLCBNaWNoYWVsIEtlbGxleSB3cm90ZToKPiA+Pj4gRnJv
bTogSmluamllIFJ1YW4gPHJ1YW5qaW5qaWVAaHVhd2VpLmNvbT4gU2VudDogVGh1cnNkYXksIEp1
bmUgMTEsIDIwMjYgNjozOCBBTQo+ID4+Pj4KPiA+Pj4+IFN1cHBvcnQgZm9yIHBhcmFsbGVsIHNl
Y29uZGFyeSBDUFUgYnJpbmd1cCBpcyBhbHJlYWR5IHV0aWxpemVkIGJ5IHg4NiwKPiA+Pj4+IE1J
UFMsIGFuZCBSSVNDLVYuIFRoaXMgcGF0Y2ggYnJpbmdzIHRoaXMgY2FwYWJpbGl0eSB0byB0aGUg
YXJtNjQKPiA+Pj4+IGFyY2hpdGVjdHVyZS4KPiA+Pj4+Cj4gPj4+PiBSZXdvcmsgdGhlIGdsb2Jh
bCBgc2Vjb25kYXJ5X2RhdGFgIGFjY2Vzc2VkIGR1cmluZyBlYXJseSBib290IGludG8KPiA+Pj4+
IGEgcGVyLUNQVSBhcnJheS4gVGhpcyBhcnJheSBtYXBzIGxvZ2ljYWwgQ1BVIElEcyB0byBNUElE
Ul9FTDEgdmFsdWVzLAo+ID4+Pj4gZW5hYmxpbmcgdGhlIGVhcmx5IGJvb3QgY29kZSBpbiBoZWFk
LlMgdG8gcmVzb2x2ZSBlYWNoIHNlY29uZGFyeSBDUFUncwo+ID4+Pj4gbG9naWNhbCBJRCBjb25j
dXJyZW50bHkuCj4gPj4+Pgo+ID4+Pj4gVG8gZnVsbHkgZW5hYmxlIEhPVFBMVUdfUEFSQUxMRUws
IHRoaXMgcGF0Y2ggaW1wbGVtZW50czoKPiA+Pj4+IDEpIEFuIGFybTY0LXNwZWNpZmljIGFyY2hf
Y3B1aHBfa2lja19hcF9hbGl2ZSgpIGhhbmRsZXIuCj4gPj4+PiAyKSBDYWxsYmFja3MgdG8gY3B1
aHBfYXBfc3luY19hbGl2ZSgpIGluc2lkZSBzZWNvbmRhcnlfc3RhcnRfa2VybmVsKCkuCj4gPj4+
Pgo+ID4+Pj4gU3VjY2Vzc2Z1bGx5IHRlc3RlZCBvbiBRRU1VIEFSTTY0IHZpcnQgbWFjaGluZSAo
S1ZNIG9uLCAxMjggdkNQVXMpLgo+ID4+Pj4KPiA+Pj4+IHwgICAgIHRlc3Qga2VybmVsCSAgIHwg
c2Vjb25kYXJ5IENQVXMgYm9vdCB0aW1lIHwKPiA+Pj4+IHwgIC0tLS0tLS0tLS0tLS0tLS0tLS0t
LSAgIHwJLS0tLS0tLS0tLS0tLS0tLS0tLS0gIHwKPiA+Pj4+IHwgICBXaXRob3V0IHRoaXMgcGF0
Y2ggICAgIHwJCTE1NS42NzIJICAgICAgfAo+ID4+Pj4gfCAgIGNwdWhwLnBhcmFsbGVsPTAJICAg
fAkJNjIuODk3CSAgICAgIHwKPiA+Pj4+IHwgICBjcHVocC5wYXJhbGxlbD0xCSAgIHwJCTE2Ni43
MDMJICAgICAgfAo+ID4+Pgo+ID4+PiBUaGUgbGFzdCB0d28gcm93cyBzZWVtIG1peGVkIHVwLiBJ
IHdvdWxkIGV4cGVjdCBwYXJhbGxlbD0wIHRvCj4gPj4+IHJlc3VsdCBpbiBhIGxvbmdlciBib290
IHRpbWUuCj4gPj4KPiA+PiBUaGUgcmVzdWx0cyBhcmUgY29ycmVjdCBhbmQgbm90IG1peGVkIHVw
Lgo+ID4+Cj4gPj4gQ29tcGFyZWQgdG8gdGhlIG9yaWdpbmFsIG5vbuKAkUhPVFBMVUdfUEFSQUxM
RUwgYXBwcm9hY2gsIHRoZSBhZHZhbnRhZ2Ugb2YKPiA+PiBjcHVocC5wYXJhbGxlbD0wIGxpZXMg
aW4gaXRzIHVzZSBvZiBjcHVfcmVsYXgoYHlpZWxkYCBvbiBhcm02NCkgaW5zdGVhZAo+ID4+IG9m
IHRoZSB3YWl0X2Zvcl9jb21wbGV0aW9uX3RpbWVvdXQoKSBtZWNoYW5pc20gKHdoaWNoIG1heSBj
YXVzZSBzbGVlcAo+ID4+IGFuZCBjb250ZXh0IHN3aXRjaGluZykuIFRoaXMgc2lnbmlmaWNhbnRs
eSByZWR1Y2VzIHRoZSBvdmVyaGVhZCBvZiBWTQo+ID4+IGV4aXRzIGFuZCBjb250ZXh0IHN3aXRj
aGVzIGluIGEgS1ZNIGd1ZXN0LCB0aGVyZWJ5IGN1dHRpbmcgdGhlIHNlY29uZGFyeQo+ID4+IENQ
VSBib290IHRpbWUgYnkgbW9yZSB0aGFuIGhhbGYuCj4gPiAKPiA+IEkgZG9uJ3QgdGhpbmsgdGhh
dCdzIGEgcGFydGljdWxhcmx5IGNvbXBlbGxpbmcgcmVhc29uIHRvIGVuYWJsZSB0aGlzIGZvcgo+
ID4gYXJtNjQsIGluIGFsbCBob25lc3R5LiBUaGUgeWllbGQgaW5zdHJ1Y3Rpb24gdHlwaWNhbGx5
IGRvZXNuJ3QgZG8KPiA+IGFueXRoaW5nIG9uIGFjdHVhbCBhcm02NCBzaWxpY29uLCBzbyB0aGlz
IHByb2JhYmx5IG1lYW5zIHRoYXQgeW91J3JlCj4gPiBpbnRyb2R1Y2luZyBidXN5LWxvb3BzIHdo
aWNoIHRlbmQgdG8gYmUgYmFkIGZvciBwb3dlciBhbmQgc2NhbGFiaWxpdHkuCj4gCj4gQWZ0ZXIg
dXBkYXRpbmcgdGhlIGltcGxlbWVudGF0aW9uIGluIHYyLCB0aGUgcGVyZm9ybWFuY2UgZ2FpbnMg
YXJlCj4gcHJpbWFyaWx5IG9ic2VydmVkIG9uIGFjdHVhbCBoYXJkd2FyZS4KCi4uLiBidXQgdGhh
dCdzIHByZXN1bWFibHkgYmVjYXVzZSB0aGUgc2Vjb25kYXJ5IGNvcmVzIGFyZSBidXN5LWxvb3Bp
bmcuClRoYXQncyBub3Qgc29tZXRoaW5nIHdlIHNob3VsZCBkbyBkdXJpbmcgYm9vdC4gSXQgbWln
aHQgYmUgImZhc3QiIG9uCnlvdXIgbWFjaGluZSBidXQgaXQgd2lsbCBwcm9iYWJseSBiZSAiaG90
IiBhcyB3ZWxsLgoKPiA+IEkgaW1wbGVtZW50ZWQgdGhpcyBhIHdoaWxlIGFnbyBbMV0gYnV0IGRp
ZG4ndCBtYW5hZ2UgdG8gc2VlIG11Y2ggaW4gdGVybXMKPiA+IG9mIHBlcmZvcm1hbmNlIGltcHJv
dmVtZW50IGFuZCBzbyBJIGRpZG4ndCBib3RoZXIgdG8gc2VuZCB0aGUgcGF0Y2hlcyBvdXQKPiAK
PiBBcyBzaG93biBpbiB2MiBiZWxvdywgb24gYWN0dWFsIGhhcmR3YXJlLCB0aGlzIHJlc3VsdHMg
aW4gYSA0MCXigJM2MCUKPiByZWR1Y3Rpb24gaW4gYm9vdCB0aW1lLgo+IAo+IEJyaW5ndXAgVGlt
ZSBDb21wYXJpc29uIChtcywgbG93ZXIgaXMgYmV0dGVyKToKPiAKPiB8ICAgICBQbGF0Zm9ybQkJ
fCBCYXNlbGluZXwgICBQPTAgICB8ICAgUD0xICB8IERlbHRhKCUpfAo+IHwgLS0tLS0tLS0tLS0t
LS0tLS0tLS0tIHwgLS0tLS0tLSB8IC0tLS0tLS0gfCAtLS0tLS0gfCAtLS0tLS0tIHwKPiB8IDY0
LWNvcmUgQVRGIFFFTVUJfCAyMDc1LjggIHwgMjA4MC43ICB8IDE2NTMuNCB8IDIwLjM0JSAgfAo+
IHwgMTkyLWNvcmUgc2VydmVyKEhJUDEyKXwgMTQ2MTkuMiB8IDE0NjE5LjEgfCA4NTg5LjQgfCA0
MS4yMSUgIHwKPiB8IDMyLWNvcmUgYm9hcmQJICAgICAgICB8IDI3NzYuNSAgfCAyODgxLjAgIHwg
MTA0NS4wIHwgNjIuMzYlICB8Cj4gCj4gTGluazoKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvMjAyNjA2MTgwOTI0NDQuMTMxNjMzNi01LXJ1YW5qaW5qaWVAaHVhd2VpLmNvbS8KClRvIGJl
IGhvbmVzdCwgSSdtIHByZXR0eSBjb25mdXNlZCB3aXRoIGFsbCB0aGVzZSBudW1iZXJzLiBZb3Vy
IGZpcnN0CnRhYmxlIGFib3ZlIHN1Z2dlc3RzIHRoYXQgcGFyYWxsZWwgYm9vdCBpcyAqc2xvd2Vy
KiBidXQgdGhlbiB0aGlzIHRhYmxlCnN1Z2dlc3RzIHRoZSBvcHBvc2l0ZS4gSG93ZXZlciwgaXQg
YWxzbyBoYXMgYSBRRU1VIGVudHJ5IGRlc3BpdGUgYmVpbmcKIm9uIGFjdHVhbCBoYXJkd2FyZSIu
IElzIHRoYXQgaW4gYSBWTT8KCj4gPiBhZnRlciB0YWxraW5nIGFib3V0IGl0IGF0IEtWTSBmb3J1
bSBbMl0uIEhvd2V2ZXIsIGFzIG1lbnRpb25lZCBhdCB0aGUgZW5kCj4gPiBvZiB0aGF0IHRhbGss
IGl0IF9pc18gc3RpbGwgdXNlZnVsIGZvciBjb25maWRlbnRpYWwgVk1zIHVzaW5nIFBTQ0kgc28K
PiA+IGxldCBtZSBkdXN0IG9mZiBteSBvbGQgc2VyaWVzIGFuZCBzZW5kIGl0IG91dCB0byBzZWUg
d2hhdCB5b3UgdGhpbmsuCj4gPiAKPiA+IEl0IHJlbGllcyBvbiBQU0NJIHYwLjIsIHdoaWNoIG1l
YW5zIHdlIGRvbid0IG5lZWQgdGhlIE5SX0NQVVMgc2l6ZSBhcnJheQo+ID4gZm9yIHNlY29uZGFy
eV9kYXRhIGFuZCBJIGFsc28gaGF2ZSBzb21lIHN1cHBvcnQgZm9yIGVycm9yIGhhbmRsaW5nIChp
dAo+ID4gZG9lc24ndCBsb29rIGxpa2UgeW91IGhhbmRsZSBfX2Vhcmx5X2NwdV9ib290X3N0YXR1
cyBwcm9wZXJseSkuCj4gCj4gSSBuZWVkIHNvbWUgdGltZSB0byBsb29rIGNsb3NlbHkgYXQgeW91
ciBwYXRjaC4gQWx0ZXJuYXRpdmVseSwgSSB3aWxsCj4gaW50ZWdyYXRlIHlvdXIgY2hhbmdlcywg
cmUtdGVzdCBldmVyeXRoaW5nIG9uIGFjdHVhbCBoYXJkd2FyZSwgYW5kIHRoZW4KPiBzZW5kIG91
dCBhIHJldmlzZWQgdmVyc2lvbi4KClBsZWFzZSBqdXN0IGdpdmUgbWUgYSB3ZWVrIG9yIHNvIHRv
IHJlYmFzZSBteSBjaGFuZ2VzIGFuZCBzZW5kIHRoZW0gb3V0CmZvciBkaXNjdXNzaW9uLiBJdCds
bCBiZSBpbnRlcmVzdGluZyB0byBzZWUgd2hhdCBudW1iZXJzIHlvdSBnZXQuCgo+IEl0IHNlZW1z
IHRoYXQgdGhlIGZvbGxvd2luZyBwYXRjaCByZW1vdmluZwo+IGByY3V0cmVlX3JlcG9ydF9jcHVf
c3RhcnRpbmcoKWAgd2lsbCByZWludHJvZHVjZSB0aGUgb3JpZ2luYWwgaXNzdWUgYXMKPiBjb21t
aXQgY2UzZDMxYWQzY2FjICgiYXJtNjQvc21wOiBNb3ZlCj4gcmN1X2NwdV9zdGFydGluZygpIGVh
cmxpZXIiKSBzb2xvdmVkLgo+IAo+IExpbms6Cj4gaHR0cHM6Ly93ZWIuZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3dpbGwvbGludXguZ2l0L2NvbW1pdC8/aD1jcHUtaG90
cGx1ZyZpZD1iYmE0YjYyZjQ1ZjI2MTRiZjYwODVlNmNkM2YyMzM1MjhmODViZjI2Cj4gCj4gSW5k
ZWVkLCBJIGFsc28gbm90aWNlZCB0aGF0IHRoZSBpbnZvY2F0aW9uIG9yZGVyIG9mCj4gcmN1dHJl
ZV9yZXBvcnRfY3B1X3N0YXJ0aW5nKCkgb24gYXJtNjQgaXMgc29tZXdoYXQgc3Vib3B0aW1hbC4g
SXQKPiBoaW5kZXJzIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiBwYXJhbGxlbCBicmluZ3VwIG9uIGFy
bTY0IGFuZCBjb3VsZAo+IHBvdGVudGlhbGx5IGxlYWQgdG8gUkNVIHN0YWxscy4KPiAKPiBMaW5r
Ogo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDYxODA5MjQ0NC4xMzE2MzM2LTQt
cnVhbmppbmppZUBodWF3ZWkuY29tLwo+IAo+IFsgICAgMC4zMjkwMTddIHNtcDogQnJpbmdpbmcg
dXAgc2Vjb25kYXJ5IENQVXMgLi4uCj4gWyAgICAwLjM0MzYyOF0gRGV0ZWN0ZWQgVklQVCBJLWNh
Y2hlIG9uIENQVTEKPiBbICAgIDAuMzQzNzg4XQo+IFsgICAgMC4zNDM4MDZdID09PT09PT09PT09
PT09PT09PT09PT09PT09PT09Cj4gWyAgICAwLjM0MzgxNl0gV0FSTklORzogc3VzcGljaW91cyBS
Q1UgdXNhZ2UKPiBbICAgIDAuMzQzOTY2XSA3LjEuMC1yYzEtZzI3YzE4NzE4NDhhMiAjMTA5IE5v
dCB0YWludGVkCj4gWyAgICAwLjM0NDA4N10gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
PiBbICAgIDAuMzQ0MDk4XSBrZXJuZWwvbG9ja2luZy9sb2NrZGVwLmM6MzgwMSBSQ1UtbGlzdCB0
cmF2ZXJzZWQgaW4KPiBub24tcmVhZGVyIHNlY3Rpb24hIQoKVGhhbmtzLCBJJ2xsIGxvb2sgaW50
byB0aGlzLgoKV2lsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
