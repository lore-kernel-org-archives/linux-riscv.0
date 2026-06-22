Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEDE5CDB46F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 09:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=azV9n89vb8042pXTm6pM+ubt/3sMQCThLYEE4jGVHDo=; b=CVjeFkyyQ1GfJZ
	2HIIhI2K96K6QF3n1b7Kk2m1BBA22AbY+ecj1+mavlZp7chV0BrJmx78LVWmg7qUrFDbe0jG51FgP
	k7qXiODHBMwLxQz8MAOjiRaBXToiH0A9cNDbzaRpWdvWQvIx/uhMPTT18pMpuexj82XXKf14IjWY2
	0biWQ3gOxS+A1oWy4YWs7Hinu6NPZUO3LZNSkrtqqTQ0k9FFwtApa/b+dWzF3QJ5CAqsgDS2nV1iD
	XIz6yGGPX06OnwX+Rb2ybeMM5TUT7/v/hkBlfMVgT7SA+hEaHK9ftqdYLeXgayqzK5v0/AL74T3DY
	myceH26768K4yNBlwwbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbam6-00000004jo3-3enQ;
	Mon, 22 Jun 2026 09:17:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbam4-00000004jni-3vng;
	Mon, 22 Jun 2026 09:17:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=gz16ZH9DYGPBkD+pXEoFxanVGNLD5CokSPREwvD3FzM=; b=bXjPBVnwKoVgWdR23Vv0nGMq7K
	eft/IvzlSMxbhuWTyvk4G6JmK1L5/zz2MTahwNL3TJr1Zj3FMMxALMlL3WhufZfJU2G+xaNkWPiyG
	677biAtYhJFxO5f/5GjAdcN6y5wk3SovkcwkRDxeKGudBJU7I0UkNw1u9ocBpKkKmZRbgNyQotQ+V
	JPZ1VxZ4UgpgWp+Hg1cg8a27vJ600XRizU9iaKoy7mcKofGfGw+jhYLH1qitaDDQeX9Q40bQCDkBp
	4jKUTOI3m0JZxfls4k/fl4QCPtwVHynQDDkYnIQXyd7bbDcF5rlYFLFM+vcPFO7hDt1tAaLqYxn+B
	gxEgPfDQ==;
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wbalz-0000000HFuF-0mtw;
	Mon, 22 Jun 2026 09:16:59 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=gz16ZH9DYGPBkD+pXEoFxanVGNLD5CokSPREwvD3FzM=;
	b=iDpQu2YAQjuV/tnUvSFc/IfA/QHC+chs6j95gLPcVQDfxvY/K61tKJpDenU9U7gsY/W785auK
	9ejn1uywZpaNZ7Vj+jKp5Dm6tlLP0o/tzv2/8bC1jUjx+iZd7VRGgxpVFtAPXBYiMcWzdJ9+MZB
	kEGLm0Rldmi+TYDWir3I0uo=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4gkMm12tWrzmVD1;
	Mon, 22 Jun 2026 17:07:29 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id AA77E40539;
	Mon, 22 Jun 2026 17:16:33 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 22 Jun 2026 17:16:31 +0800
Message-ID: <b828dd7a-0363-46cf-aad0-e4962e299338@huawei.com>
Date: Mon, 22 Jun 2026 17:16:30 +0800
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
X-CRM114-CacheID: sfid-20260622_101658_140655_2049E536 
X-CRM114-Status: GOOD (  25.19  )
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
b3BzIHdoaWNoIHRlbmQgdG8gYmUgYmFkIGZvciBwb3dlciBhbmQgc2NhbGFiaWxpdHkuCj4gCj4g
SSBpbXBsZW1lbnRlZCB0aGlzIGEgd2hpbGUgYWdvIFsxXSBidXQgZGlkbid0IG1hbmFnZSB0byBz
ZWUgbXVjaCBpbiB0ZXJtcwo+IG9mIHBlcmZvcm1hbmNlIGltcHJvdmVtZW50IGFuZCBzbyBJIGRp
ZG4ndCBib3RoZXIgdG8gc2VuZCB0aGUgcGF0Y2hlcyBvdXQKPiBhZnRlciB0YWxraW5nIGFib3V0
IGl0IGF0IEtWTSBmb3J1bSBbMl0uIEhvd2V2ZXIsIGFzIG1lbnRpb25lZCBhdCB0aGUgZW5kCj4g
b2YgdGhhdCB0YWxrLCBpdCBfaXNfIHN0aWxsIHVzZWZ1bCBmb3IgY29uZmlkZW50aWFsIFZNcyB1
c2luZyBQU0NJIHNvCj4gbGV0IG1lIGR1c3Qgb2ZmIG15IG9sZCBzZXJpZXMgYW5kIHNlbmQgaXQg
b3V0IHRvIHNlZSB3aGF0IHlvdSB0aGluay4KCkhpIFdpbGwsCgpUaGFua3MgZm9yIHRoZSBpbnNp
Z2h0cyEgWW91ciBwb2ludCBhYm91dCB1c2luZyBQU0NJIHYwLjIncyBDb250ZXh0IElECnRvIGF2
b2lkIHRoZSBOUl9DUFVTIGFycmF5IGZvciBpbnB1dCBwYXJhbWV0ZXJzIChsaWtlCnNlY29uZGFy
eV9kYXRhLnRhc2spIGlzIGluY3JlZGlibHkgZWxlZ2FudC4KCkhvd2V2ZXIsIGlmIEkgdW5kZXJz
dGFuZCB5b3VyIHNlcmllcyBjb3JyZWN0bHksIGl0IHNlZW1zIHlvdXIgYXBwcm9hY2gKcHJpbWFy
aWx5IHRhcmdldHMgcHJldmVudGluZyB0aGUgY29uY3VycmVudCB1c2Ugb2Ygc2Vjb25kYXJ5X2Rh
dGEudGFzaywKYnV0IGl0IGRvZXNuJ3Qgc2VlbSB0byBhY2NvdW50IGZvciB0aGUgcG90ZW50aWFs
IGRhdGEgdHJhbXBsaW5nIG9uCnNlY29uZGFyeV9kYXRhLnN0YXR1cyB3aGVuIG11bHRpcGxlIHNl
Y29uZGFyeSBDUFVzIGFyZSBicm91Z2h0IHVwCnNpbXVsdGFuZW91c2x5LgoKdXBkYXRlX2NwdV9i
b290X3N0YXR1cygpCiAgLT4gV1JJVEVfT05DRShzZWNvbmRhcnlfZGF0YS5zdGF0dXMuZmxhZ3Nb
dmFsXSwgMSkKCmFyY2hfY3B1aHBfY2xlYW51cF9raWNrX2NwdSgpCiAgLT4gc3RhdHVzID0gUkVB
RF9PTkNFKHNlY29uZGFyeV9kYXRhLnN0YXR1cykKCkJlc3QgcmVnYXJkcywKSmluamllCgo+IAo+
IEl0IHJlbGllcyBvbiBQU0NJIHYwLjIsIHdoaWNoIG1lYW5zIHdlIGRvbid0IG5lZWQgdGhlIE5S
X0NQVVMgc2l6ZSBhcnJheQo+IGZvciBzZWNvbmRhcnlfZGF0YSBhbmQgSSBhbHNvIGhhdmUgc29t
ZSBzdXBwb3J0IGZvciBlcnJvciBoYW5kbGluZyAoaXQKPiBkb2Vzbid0IGxvb2sgbGlrZSB5b3Ug
aGFuZGxlIF9fZWFybHlfY3B1X2Jvb3Rfc3RhdHVzIHByb3Blcmx5KS4KPiAKPiBJdCBsb29rcyBs
aWtlIEkgY291bGQgaW5jbHVkZSB5b3VyIGZpcnN0IHBhdGNoLCB0aG91Z2ghCj4gCj4gV2lsbAo+
IAo+IFsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC93
aWxsL2xpbnV4LmdpdC9sb2cvP2g9Y3B1LWhvdHBsdWcKPiBbMl0gaHR0cHM6Ly93d3cueW91dHVi
ZS5jb20vd2F0Y2g/dj1RNmtPc2hublF1RQo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
