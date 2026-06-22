Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C2F3CDB471
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 08:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ffzqfHM/l6NOfSx+vGWxy53P7f3TCYuZeGdinmIsn5w=; b=H+F6r4SzuUPOcR
	WM2CusCAksfV84DHeV6nlr0dBKdWkeRCSf+XkVJ/5gWrIn9+WT0w8fIGCgyXriTh3rikOLbiIj6Y3
	GPh9/KHrAsIpD1+fpJWQzmsjczp72rMA1W8aPx617A6dnUFGYhh3GDykmzvq11BtUK5fB+/jn+CNq
	mDGaDTiJZy4AxdYs84mYqGpUa3hgkYo0ToKSuoY+ZEFNvstC9Klyocy81QYEVU4qP+SDroO4zWkW7
	iaxlYU2Mk57XOUBBSLidSRXVPykBpSXkunKQUWg0jcFUNGxH9JAg6Med9jfP7stMq+97fhjBAiyyP
	oPkRp+dpSWU+8SlCtY4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbZgM-00000004dn8-0Sdv;
	Mon, 22 Jun 2026 08:07:02 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbZgB-00000004dS1-2bDi;
	Mon, 22 Jun 2026 08:06:54 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=7l3MIp31Oqn6l35ANG2oeSNGQ5mPwFEIt+3BHRhEgFs=;
	b=JVcKeZfRvP8T8eSthBTDPagvkz4L0tUeCdqiAVGv4Eh3T3SVTQXrwmvOHMtG0cUUpo0xQ5/O4
	aR6aIwZIftD9mfmnCd56hixc1MZIztHFios6RgBUF+IkCieMOqGm+NmJXzvSoKNNHpGsbDuVE/n
	scbJtcuZ3SQZ7BdsHKOvpH4=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4gkLCQ6hV0zRhVP;
	Mon, 22 Jun 2026 15:57:38 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id AB1BA40363;
	Mon, 22 Jun 2026 16:06:41 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 22 Jun 2026 16:06:39 +0800
Message-ID: <2a34ff43-78a0-4d99-885a-0e7f560634ca@huawei.com>
Date: Mon, 22 Jun 2026 16:06:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/3] arm64: Add HOTPLUG_PARALLEL support for secondary
 CPUs
To: Will Deacon <will@kernel.org>
CC: Michael Kelley <mhklinux@outlook.com>, "catalin.marinas@arm.com"
	<catalin.marinas@arm.com>, "tsbogend@alpha.franken.de"
	<tsbogend@alpha.franken.de>, "pjw@kernel.org" <pjw@kernel.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "alex@ghiti.fr" <alex@ghiti.fr>, "tglx@kernel.org"
	<tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de"
	<bp@alien8.de>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"hpa@zytor.com" <hpa@zytor.com>, "peterz@infradead.org"
	<peterz@infradead.org>, "kees@kernel.org" <kees@kernel.org>,
	"nathan@kernel.org" <nathan@kernel.org>, "linusw@kernel.org"
	<linusw@kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>,
	"david.kaplan@amd.com" <david.kaplan@amd.com>, "lukas.bulwahn@redhat.com"
	<lukas.bulwahn@redhat.com>, "ryan.roberts@arm.com" <ryan.roberts@arm.com>,
	"maz@kernel.org" <maz@kernel.org>, "timothy.hayes@arm.com"
	<timothy.hayes@arm.com>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"thuth@redhat.com" <thuth@redhat.com>, "oupton@kernel.org"
	<oupton@kernel.org>, "yeoreum.yun@arm.com" <yeoreum.yun@arm.com>,
	"miko.lenczewski@arm.com" <miko.lenczewski@arm.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "kevin.brodsky@arm.com" <kevin.brodsky@arm.com>,
	"james.clark@linaro.org" <james.clark@linaro.org>, "tabba@google.com"
	<tabba@google.com>, "mrigendra.chaubey@gmail.com"
	<mrigendra.chaubey@gmail.com>, "arnd@arndb.de" <arnd@arndb.de>,
	"anshuman.khandual@arm.com" <anshuman.khandual@arm.com>, "x86@kernel.org"
	<x86@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
References: <20260611133809.3854977-1-ruanjinjie@huawei.com>
 <20260611133809.3854977-4-ruanjinjie@huawei.com>
 <SN6PR02MB41575306521E6223561F476FD4182@SN6PR02MB4157.namprd02.prod.outlook.com>
 <e96a2579-c010-4198-a2a3-6ba35b14aef0@huawei.com>
 <ajPitENEHWa8lDfC@willie-the-truck>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <ajPitENEHWa8lDfC@willie-the-truck>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_010652_287017_C53210AA 
X-CRM114-Status: GOOD (  26.34  )
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

CgpPbiA2LzE4LzIwMjYgODoyMSBQTSwgV2lsbCBEZWFjb24gd3JvdGU6Cj4gSGkgSmluamllLAo+
IAo+IE9uIE1vbiwgSnVuIDE1LCAyMDI2IGF0IDA0OjUxOjQ4UE0gKzA4MDAsIEppbmppZSBSdWFu
IHdyb3RlOgo+PiBPbiA2LzEyLzIwMjYgMTE6NDUgUE0sIE1pY2hhZWwgS2VsbGV5IHdyb3RlOgo+
Pj4gRnJvbTogSmluamllIFJ1YW4gPHJ1YW5qaW5qaWVAaHVhd2VpLmNvbT4gU2VudDogVGh1cnNk
YXksIEp1bmUgMTEsIDIwMjYgNjozOCBBTQo+Pj4+Cj4+Pj4gU3VwcG9ydCBmb3IgcGFyYWxsZWwg
c2Vjb25kYXJ5IENQVSBicmluZ3VwIGlzIGFscmVhZHkgdXRpbGl6ZWQgYnkgeDg2LAo+Pj4+IE1J
UFMsIGFuZCBSSVNDLVYuIFRoaXMgcGF0Y2ggYnJpbmdzIHRoaXMgY2FwYWJpbGl0eSB0byB0aGUg
YXJtNjQKPj4+PiBhcmNoaXRlY3R1cmUuCj4+Pj4KPj4+PiBSZXdvcmsgdGhlIGdsb2JhbCBgc2Vj
b25kYXJ5X2RhdGFgIGFjY2Vzc2VkIGR1cmluZyBlYXJseSBib290IGludG8KPj4+PiBhIHBlci1D
UFUgYXJyYXkuIFRoaXMgYXJyYXkgbWFwcyBsb2dpY2FsIENQVSBJRHMgdG8gTVBJRFJfRUwxIHZh
bHVlcywKPj4+PiBlbmFibGluZyB0aGUgZWFybHkgYm9vdCBjb2RlIGluIGhlYWQuUyB0byByZXNv
bHZlIGVhY2ggc2Vjb25kYXJ5IENQVSdzCj4+Pj4gbG9naWNhbCBJRCBjb25jdXJyZW50bHkuCj4+
Pj4KPj4+PiBUbyBmdWxseSBlbmFibGUgSE9UUExVR19QQVJBTExFTCwgdGhpcyBwYXRjaCBpbXBs
ZW1lbnRzOgo+Pj4+IDEpIEFuIGFybTY0LXNwZWNpZmljIGFyY2hfY3B1aHBfa2lja19hcF9hbGl2
ZSgpIGhhbmRsZXIuCj4+Pj4gMikgQ2FsbGJhY2tzIHRvIGNwdWhwX2FwX3N5bmNfYWxpdmUoKSBp
bnNpZGUgc2Vjb25kYXJ5X3N0YXJ0X2tlcm5lbCgpLgo+Pj4+Cj4+Pj4gU3VjY2Vzc2Z1bGx5IHRl
c3RlZCBvbiBRRU1VIEFSTTY0IHZpcnQgbWFjaGluZSAoS1ZNIG9uLCAxMjggdkNQVXMpLgo+Pj4+
Cj4+Pj4gfCAgICAgdGVzdCBrZXJuZWwJICAgfCBzZWNvbmRhcnkgQ1BVcyBib290IHRpbWUgfAo+
Pj4+IHwgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLSAgIHwJLS0tLS0tLS0tLS0tLS0tLS0tLS0gIHwK
Pj4+PiB8ICAgV2l0aG91dCB0aGlzIHBhdGNoICAgICB8CQkxNTUuNjcyCSAgICAgIHwKPj4+PiB8
ICAgY3B1aHAucGFyYWxsZWw9MAkgICB8CQk2Mi44OTcJICAgICAgfAo+Pj4+IHwgICBjcHVocC5w
YXJhbGxlbD0xCSAgIHwJCTE2Ni43MDMJICAgICAgfAo+Pj4KPj4+IFRoZSBsYXN0IHR3byByb3dz
IHNlZW0gbWl4ZWQgdXAuIEkgd291bGQgZXhwZWN0IHBhcmFsbGVsPTAgdG8KPj4+IHJlc3VsdCBp
biBhIGxvbmdlciBib290IHRpbWUuCj4+Cj4+IEhpLCBNaWNoYWVsLAo+Pgo+PiBUaGUgcmVzdWx0
cyBhcmUgY29ycmVjdCBhbmQgbm90IG1peGVkIHVwLgo+Pgo+PiBDb21wYXJlZCB0byB0aGUgb3Jp
Z2luYWwgbm9u4oCRSE9UUExVR19QQVJBTExFTCBhcHByb2FjaCwgdGhlIGFkdmFudGFnZSBvZgo+
PiBjcHVocC5wYXJhbGxlbD0wIGxpZXMgaW4gaXRzIHVzZSBvZiBjcHVfcmVsYXgoYHlpZWxkYCBv
biBhcm02NCkgaW5zdGVhZAo+PiBvZiB0aGUgd2FpdF9mb3JfY29tcGxldGlvbl90aW1lb3V0KCkg
bWVjaGFuaXNtICh3aGljaCBtYXkgY2F1c2Ugc2xlZXAKPj4gYW5kIGNvbnRleHQgc3dpdGNoaW5n
KS4gVGhpcyBzaWduaWZpY2FudGx5IHJlZHVjZXMgdGhlIG92ZXJoZWFkIG9mIFZNCj4+IGV4aXRz
IGFuZCBjb250ZXh0IHN3aXRjaGVzIGluIGEgS1ZNIGd1ZXN0LCB0aGVyZWJ5IGN1dHRpbmcgdGhl
IHNlY29uZGFyeQo+PiBDUFUgYm9vdCB0aW1lIGJ5IG1vcmUgdGhhbiBoYWxmLgo+IAo+IEkgZG9u
J3QgdGhpbmsgdGhhdCdzIGEgcGFydGljdWxhcmx5IGNvbXBlbGxpbmcgcmVhc29uIHRvIGVuYWJs
ZSB0aGlzIGZvcgo+IGFybTY0LCBpbiBhbGwgaG9uZXN0eS4gVGhlIHlpZWxkIGluc3RydWN0aW9u
IHR5cGljYWxseSBkb2Vzbid0IGRvCj4gYW55dGhpbmcgb24gYWN0dWFsIGFybTY0IHNpbGljb24s
IHNvIHRoaXMgcHJvYmFibHkgbWVhbnMgdGhhdCB5b3UncmUKPiBpbnRyb2R1Y2luZyBidXN5LWxv
b3BzIHdoaWNoIHRlbmQgdG8gYmUgYmFkIGZvciBwb3dlciBhbmQgc2NhbGFiaWxpdHkuCgpBZnRl
ciB1cGRhdGluZyB0aGUgaW1wbGVtZW50YXRpb24gaW4gdjIsIHRoZSBwZXJmb3JtYW5jZSBnYWlu
cyBhcmUKcHJpbWFyaWx5IG9ic2VydmVkIG9uIGFjdHVhbCBoYXJkd2FyZS4KCj4gCj4gSSBpbXBs
ZW1lbnRlZCB0aGlzIGEgd2hpbGUgYWdvIFsxXSBidXQgZGlkbid0IG1hbmFnZSB0byBzZWUgbXVj
aCBpbiB0ZXJtcwo+IG9mIHBlcmZvcm1hbmNlIGltcHJvdmVtZW50IGFuZCBzbyBJIGRpZG4ndCBi
b3RoZXIgdG8gc2VuZCB0aGUgcGF0Y2hlcyBvdXQKCkFzIHNob3duIGluIHYyIGJlbG93LCBvbiBh
Y3R1YWwgaGFyZHdhcmUsIHRoaXMgcmVzdWx0cyBpbiBhIDQwJeKAkzYwJQpyZWR1Y3Rpb24gaW4g
Ym9vdCB0aW1lLgoKQnJpbmd1cCBUaW1lIENvbXBhcmlzb24gKG1zLCBsb3dlciBpcyBiZXR0ZXIp
OgoKfCAgICAgUGxhdGZvcm0JCXwgQmFzZWxpbmV8ICAgUD0wICAgfCAgIFA9MSAgfCBEZWx0YSgl
KXwKfCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0gfCAtLS0tLS0tIHwgLS0tLS0tLSB8IC0tLS0tLSB8
IC0tLS0tLS0gfAp8IDY0LWNvcmUgQVRGIFFFTVUJfCAyMDc1LjggIHwgMjA4MC43ICB8IDE2NTMu
NCB8IDIwLjM0JSAgfAp8IDE5Mi1jb3JlIHNlcnZlcihISVAxMil8IDE0NjE5LjIgfCAxNDYxOS4x
IHwgODU4OS40IHwgNDEuMjElICB8CnwgMzItY29yZSBib2FyZAkgICAgICAgIHwgMjc3Ni41ICB8
IDI4ODEuMCAgfCAxMDQ1LjAgfCA2Mi4zNiUgIHwKCkxpbms6Cmh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2FsbC8yMDI2MDYxODA5MjQ0NC4xMzE2MzM2LTUtcnVhbmppbmppZUBodWF3ZWkuY29tLwoK
PiBhZnRlciB0YWxraW5nIGFib3V0IGl0IGF0IEtWTSBmb3J1bSBbMl0uIEhvd2V2ZXIsIGFzIG1l
bnRpb25lZCBhdCB0aGUgZW5kCj4gb2YgdGhhdCB0YWxrLCBpdCBfaXNfIHN0aWxsIHVzZWZ1bCBm
b3IgY29uZmlkZW50aWFsIFZNcyB1c2luZyBQU0NJIHNvCj4gbGV0IG1lIGR1c3Qgb2ZmIG15IG9s
ZCBzZXJpZXMgYW5kIHNlbmQgaXQgb3V0IHRvIHNlZSB3aGF0IHlvdSB0aGluay4KPiAKPiBJdCBy
ZWxpZXMgb24gUFNDSSB2MC4yLCB3aGljaCBtZWFucyB3ZSBkb24ndCBuZWVkIHRoZSBOUl9DUFVT
IHNpemUgYXJyYXkKPiBmb3Igc2Vjb25kYXJ5X2RhdGEgYW5kIEkgYWxzbyBoYXZlIHNvbWUgc3Vw
cG9ydCBmb3IgZXJyb3IgaGFuZGxpbmcgKGl0Cj4gZG9lc24ndCBsb29rIGxpa2UgeW91IGhhbmRs
ZSBfX2Vhcmx5X2NwdV9ib290X3N0YXR1cyBwcm9wZXJseSkuCgpJIG5lZWQgc29tZSB0aW1lIHRv
IGxvb2sgY2xvc2VseSBhdCB5b3VyIHBhdGNoLiBBbHRlcm5hdGl2ZWx5LCBJIHdpbGwKaW50ZWdy
YXRlIHlvdXIgY2hhbmdlcywgcmUtdGVzdCBldmVyeXRoaW5nIG9uIGFjdHVhbCBoYXJkd2FyZSwg
YW5kIHRoZW4Kc2VuZCBvdXQgYSByZXZpc2VkIHZlcnNpb24uCgo+IAo+IEl0IGxvb2tzIGxpa2Ug
SSBjb3VsZCBpbmNsdWRlIHlvdXIgZmlyc3QgcGF0Y2gsIHRob3VnaCEKClRoYW5rIHlvdSB2ZXJ5
IG11Y2guCgo+IAo+IFdpbGwKPiAKPiBbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2Nt
L2xpbnV4L2tlcm5lbC9naXQvd2lsbC9saW51eC5naXQvbG9nLz9oPWNwdS1ob3RwbHVnCgpJdCBz
ZWVtcyB0aGF0IHRoZSBmb2xsb3dpbmcgcGF0Y2ggcmVtb3ZpbmcKYHJjdXRyZWVfcmVwb3J0X2Nw
dV9zdGFydGluZygpYCB3aWxsIHJlaW50cm9kdWNlIHRoZSBvcmlnaW5hbCBpc3N1ZSBhcwpjb21t
aXQgY2UzZDMxYWQzY2FjICgiYXJtNjQvc21wOiBNb3ZlCnJjdV9jcHVfc3RhcnRpbmcoKSBlYXJs
aWVyIikgc29sb3ZlZC4KCkxpbms6Cmh0dHBzOi8vd2ViLmdpdC5rZXJuZWwub3JnL3B1Yi9zY20v
bGludXgva2VybmVsL2dpdC93aWxsL2xpbnV4LmdpdC9jb21taXQvP2g9Y3B1LWhvdHBsdWcmaWQ9
YmJhNGI2MmY0NWYyNjE0YmY2MDg1ZTZjZDNmMjMzNTI4Zjg1YmYyNgoKSW5kZWVkLCBJIGFsc28g
bm90aWNlZCB0aGF0IHRoZSBpbnZvY2F0aW9uIG9yZGVyIG9mCnJjdXRyZWVfcmVwb3J0X2NwdV9z
dGFydGluZygpIG9uIGFybTY0IGlzIHNvbWV3aGF0IHN1Ym9wdGltYWwuIEl0CmhpbmRlcnMgdGhl
IGltcGxlbWVudGF0aW9uIG9mIHBhcmFsbGVsIGJyaW5ndXAgb24gYXJtNjQgYW5kIGNvdWxkCnBv
dGVudGlhbGx5IGxlYWQgdG8gUkNVIHN0YWxscy4KCkxpbms6Cmh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2FsbC8yMDI2MDYxODA5MjQ0NC4xMzE2MzM2LTQtcnVhbmppbmppZUBodWF3ZWkuY29tLwoK
WyAgICAwLjMyOTAxN10gc21wOiBCcmluZ2luZyB1cCBzZWNvbmRhcnkgQ1BVcyAuLi4KWyAgICAw
LjM0MzYyOF0gRGV0ZWN0ZWQgVklQVCBJLWNhY2hlIG9uIENQVTEKWyAgICAwLjM0Mzc4OF0KWyAg
ICAwLjM0MzgwNl0gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KWyAgICAwLjM0MzgxNl0g
V0FSTklORzogc3VzcGljaW91cyBSQ1UgdXNhZ2UKWyAgICAwLjM0Mzk2Nl0gNy4xLjAtcmMxLWcy
N2MxODcxODQ4YTIgIzEwOSBOb3QgdGFpbnRlZApbICAgIDAuMzQ0MDg3XSAtLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQpbICAgIDAuMzQ0MDk4XSBrZXJuZWwvbG9ja2luZy9sb2NrZGVwLmM6
MzgwMSBSQ1UtbGlzdCB0cmF2ZXJzZWQgaW4Kbm9uLXJlYWRlciBzZWN0aW9uISEKWyAgICAwLjM0
NDExMl0KWyAgICAwLjM0NDExMl0gb3RoZXIgaW5mbyB0aGF0IG1pZ2h0IGhlbHAgdXMgZGVidWcg
dGhpczoKWyAgICAwLjM0NDExMl0KWyAgICAwLjM0NDEzNV0KWyAgICAwLjM0NDEzNV0gUkNVIHVz
ZWQgaWxsZWdhbGx5IGZyb20gb2ZmbGluZSBDUFUhClsgICAgMC4zNDQxMzVdIHJjdV9zY2hlZHVs
ZXJfYWN0aXZlID0gMSwgZGVidWdfbG9ja3MgPSAxClsgICAgMC4zNDQxNzRdIG5vIGxvY2tzIGhl
bGQgYnkgc3dhcHBlci8xLzAuClsgICAgMC4zNDQyMDRdClsgICAgMC4zNDQyMDRdIHN0YWNrIGJh
Y2t0cmFjZToKWyAgICAwLjM0NDYxMV0gQ1BVOiAxIFVJRDogMCBQSUQ6IDAgQ29tbTogc3dhcHBl
ci8xIE5vdCB0YWludGVkCjcuMS4wLXJjMS1nMjdjMTg3MTg0OGEyICMxMDkgUFJFRU1QVApbICAg
IDAuMzQ0NzA3XSBIYXJkd2FyZSBuYW1lOiBsaW51eCxkdW1teS12aXJ0IChEVCkKWyAgICAwLjM0
NTI2N10gQ2FsbCB0cmFjZToKWyAgICAwLjM0NTQzNl0gIHNob3dfc3RhY2srMHgxOC8weDI0IChD
KQpbICAgIDAuMzQ1NTkzXSAgZHVtcF9zdGFja19sdmwrMHg5MC8weGQwClsgICAgMC4zNDU2MjBd
ICBkdW1wX3N0YWNrKzB4MTgvMHgyNApbICAgIDAuMzQ1NjM5XSAgbG9ja2RlcF9yY3Vfc3VzcGlj
aW91cysweDE3MC8weDIzNApbICAgIDAuMzQ1NjY1XSAgX19sb2NrX2FjcXVpcmUrMHhkZDQvMHgy
MDc4ClsgICAgMC4zNDU2ODhdICBsb2NrX2FjcXVpcmUrMHgxYzQvMHgzZjAKWyAgICAwLjM0NTcx
MV0gIF9yYXdfc3Bpbl9sb2NrX2lycXNhdmUrMHg2MC8weDg4ClsgICAgMC4zNDU3MzZdICBkb3du
X3RyeWxvY2srMHgxOC8weDQ4ClsgICAgMC4zNDU3NThdICBfX2Rvd25fdHJ5bG9ja19jb25zb2xl
X3NlbSsweDM4LzB4YzQKWyAgICAwLjM0NTc4Ml0gIHZwcmludGtfZW1pdCsweDIzYy8weDNkMApb
ICAgIDAuMzQ1ODAyXSAgdnByaW50a19kZWZhdWx0KzB4MzgvMHg0NApbICAgIDAuMzQ1ODIyXSAg
dnByaW50aysweDI4LzB4MzQKWyAgICAwLjM0NTg0MV0gIF9wcmludGsrMHg1Yy8weDg0ClsgICAg
MC4zNDU4NjRdICBjcHVpbmZvX3N0b3JlX2NwdSsweDE3NC8weDI5OApbICAgIDAuMzQ1ODg0XSAg
c2Vjb25kYXJ5X3N0YXJ0X2tlcm5lbCsweGJjLzB4MTUwClsgICAgMC4zNDU5MDVdICBfX3NlY29u
ZGFyeV9zd2l0Y2hlZCsweGMwLzB4YzQKWyAgICAwLjM1MDMwN10gR0lDdjM6IENQVTE6IGZvdW5k
IHJlZGlzdHJpYnV0b3IgMSByZWdpb24KMDoweDAwMDAwMDAwMDgwYzAwMDAKWyAgICAwLjM1MDUy
M10gR0lDdjM6IENQVTE6IHVzaW5nIGFsbG9jYXRlZCBMUEkgcGVuZGluZyB0YWJsZQpAMHgwMDAw
MDAwMTA0MmYwMDAwClsgICAgMC4zNTEzMDNdIENQVTE6IEJvb3RlZCBzZWNvbmRhcnkgcHJvY2Vz
c29yIDB4MDAwMDAwMDAwMSBbMHg0MTBmZDAzNF0KWyAgICAwLjM4NzQyNV0gRGV0ZWN0ZWQgVklQ
VCBJLWNhY2hlIG9uIENQVTIKCgo+IFsyXSBodHRwczovL3d3dy55b3V0dWJlLmNvbS93YXRjaD92
PVE2a09zaG5uUXVFCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
