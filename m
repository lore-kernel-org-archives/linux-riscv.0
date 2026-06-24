Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E61A1CDB47C
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jun 2026 10:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c3xMi2zQI0upMFwpE3wf2Mzscnt6aqyyEg5RyTH2Jy8=; b=JPLGTr/HlyCy7o
	F+epPzVsnc2dQRJnxseEzWAmBirLJRJsQdwzhkIWaE3yTTJx5kV7qPuv1jIgtQm7lJfU3wMRllril
	D6EmbI7lj2XnPMrvXEcccCZPg2pvgnIKsq/PNlriXoESGcZZ5uMiqMgIYyVXHtHF0Ih5mbzUTFKVn
	Vnnms4BfiIvnwunk6SvwC6f9YkvF4oL0a4nnjzuTAO8KhlT9gZ9KE7n5NeEfYafok3FozJYxz+P1t
	ispy458WpfHdVXQIbNtbDFN1yfZUQbjsSIuzTs6o/qjjkrRHrhYFIhILXxV8q3qjAvN+KJY3eVngx
	jd+T3YAxHoahbX7l/0kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcKPn-00000007YSR-2eZA;
	Wed, 24 Jun 2026 10:01:03 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcKPh-00000007YQp-2Bma;
	Wed, 24 Jun 2026 10:01:01 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=1395hZTLdzjvGEUA5mY2MXbrSyHdvWfUix1ZT9yBBvU=;
	b=qlRqlki8Vete58SPLgzXr/AdeIESPRlfvmDp+qvgdcQ9hdmA0UUGgAXDOKcsXvSaxXgIiKOXt
	3DjyBcgH9e3sBFpLQEQzJHUd57n5Xz+/Cmhtv/VSkMbJOFp8Ulw3OyOt2bVX4hKemQQiKbc1Qfp
	7EHlN4/awC+2PYDruCMPWZw=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4glcfW6d8Rz12LCg;
	Wed, 24 Jun 2026 17:52:03 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id F21A540575;
	Wed, 24 Jun 2026 18:00:50 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 24 Jun 2026 18:00:48 +0800
Message-ID: <a0a531b7-6f1e-4055-ad0c-c1ebf3fadba3@huawei.com>
Date: Wed, 24 Jun 2026 18:00:47 +0800
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
 <2a34ff43-78a0-4d99-885a-0e7f560634ca@huawei.com>
 <ajqYaklhIyvaNLlk@willie-the-truck>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <ajqYaklhIyvaNLlk@willie-the-truck>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_030058_194726_0BA0FBB8 
X-CRM114-Status: GOOD (  34.08  )
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

CgpPbiA2LzIzLzIwMjYgMTA6MzAgUE0sIFdpbGwgRGVhY29uIHdyb3RlOgo+IE9uIE1vbiwgSnVu
IDIyLCAyMDI2IGF0IDA0OjA2OjM4UE0gKzA4MDAsIEppbmppZSBSdWFuIHdyb3RlOgo+PiBPbiA2
LzE4LzIwMjYgODoyMSBQTSwgV2lsbCBEZWFjb24gd3JvdGU6Cj4+PiBPbiBNb24sIEp1biAxNSwg
MjAyNiBhdCAwNDo1MTo0OFBNICswODAwLCBKaW5qaWUgUnVhbiB3cm90ZToKPj4+PiBPbiA2LzEy
LzIwMjYgMTE6NDUgUE0sIE1pY2hhZWwgS2VsbGV5IHdyb3RlOgo+Pj4+PiBGcm9tOiBKaW5qaWUg
UnVhbiA8cnVhbmppbmppZUBodWF3ZWkuY29tPiBTZW50OiBUaHVyc2RheSwgSnVuZSAxMSwgMjAy
NiA2OjM4IEFNCj4+Pj4+Pgo+Pj4+Pj4gU3VwcG9ydCBmb3IgcGFyYWxsZWwgc2Vjb25kYXJ5IENQ
VSBicmluZ3VwIGlzIGFscmVhZHkgdXRpbGl6ZWQgYnkgeDg2LAo+Pj4+Pj4gTUlQUywgYW5kIFJJ
U0MtVi4gVGhpcyBwYXRjaCBicmluZ3MgdGhpcyBjYXBhYmlsaXR5IHRvIHRoZSBhcm02NAo+Pj4+
Pj4gYXJjaGl0ZWN0dXJlLgo+Pj4+Pj4KPj4+Pj4+IFJld29yayB0aGUgZ2xvYmFsIGBzZWNvbmRh
cnlfZGF0YWAgYWNjZXNzZWQgZHVyaW5nIGVhcmx5IGJvb3QgaW50bwo+Pj4+Pj4gYSBwZXItQ1BV
IGFycmF5LiBUaGlzIGFycmF5IG1hcHMgbG9naWNhbCBDUFUgSURzIHRvIE1QSURSX0VMMSB2YWx1
ZXMsCj4+Pj4+PiBlbmFibGluZyB0aGUgZWFybHkgYm9vdCBjb2RlIGluIGhlYWQuUyB0byByZXNv
bHZlIGVhY2ggc2Vjb25kYXJ5IENQVSdzCj4+Pj4+PiBsb2dpY2FsIElEIGNvbmN1cnJlbnRseS4K
Pj4+Pj4+Cj4+Pj4+PiBUbyBmdWxseSBlbmFibGUgSE9UUExVR19QQVJBTExFTCwgdGhpcyBwYXRj
aCBpbXBsZW1lbnRzOgo+Pj4+Pj4gMSkgQW4gYXJtNjQtc3BlY2lmaWMgYXJjaF9jcHVocF9raWNr
X2FwX2FsaXZlKCkgaGFuZGxlci4KPj4+Pj4+IDIpIENhbGxiYWNrcyB0byBjcHVocF9hcF9zeW5j
X2FsaXZlKCkgaW5zaWRlIHNlY29uZGFyeV9zdGFydF9rZXJuZWwoKS4KPj4+Pj4+Cj4+Pj4+PiBT
dWNjZXNzZnVsbHkgdGVzdGVkIG9uIFFFTVUgQVJNNjQgdmlydCBtYWNoaW5lIChLVk0gb24sIDEy
OCB2Q1BVcykuCj4+Pj4+Pgo+Pj4+Pj4gfCAgICAgdGVzdCBrZXJuZWwJICAgfCBzZWNvbmRhcnkg
Q1BVcyBib290IHRpbWUgfAo+Pj4+Pj4gfCAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tICAgfAktLS0t
LS0tLS0tLS0tLS0tLS0tLSAgfAo+Pj4+Pj4gfCAgIFdpdGhvdXQgdGhpcyBwYXRjaCAgICAgfAkJ
MTU1LjY3MgkgICAgICB8Cj4+Pj4+PiB8ICAgY3B1aHAucGFyYWxsZWw9MAkgICB8CQk2Mi44OTcJ
ICAgICAgfAo+Pj4+Pj4gfCAgIGNwdWhwLnBhcmFsbGVsPTEJICAgfAkJMTY2LjcwMwkgICAgICB8
Cj4+Pj4+Cj4+Pj4+IFRoZSBsYXN0IHR3byByb3dzIHNlZW0gbWl4ZWQgdXAuIEkgd291bGQgZXhw
ZWN0IHBhcmFsbGVsPTAgdG8KPj4+Pj4gcmVzdWx0IGluIGEgbG9uZ2VyIGJvb3QgdGltZS4KPj4+
Pgo+Pj4+IFRoZSByZXN1bHRzIGFyZSBjb3JyZWN0IGFuZCBub3QgbWl4ZWQgdXAuCj4+Pj4KPj4+
PiBDb21wYXJlZCB0byB0aGUgb3JpZ2luYWwgbm9u4oCRSE9UUExVR19QQVJBTExFTCBhcHByb2Fj
aCwgdGhlIGFkdmFudGFnZSBvZgo+Pj4+IGNwdWhwLnBhcmFsbGVsPTAgbGllcyBpbiBpdHMgdXNl
IG9mIGNwdV9yZWxheChgeWllbGRgIG9uIGFybTY0KSBpbnN0ZWFkCj4+Pj4gb2YgdGhlIHdhaXRf
Zm9yX2NvbXBsZXRpb25fdGltZW91dCgpIG1lY2hhbmlzbSAod2hpY2ggbWF5IGNhdXNlIHNsZWVw
Cj4+Pj4gYW5kIGNvbnRleHQgc3dpdGNoaW5nKS4gVGhpcyBzaWduaWZpY2FudGx5IHJlZHVjZXMg
dGhlIG92ZXJoZWFkIG9mIFZNCj4+Pj4gZXhpdHMgYW5kIGNvbnRleHQgc3dpdGNoZXMgaW4gYSBL
Vk0gZ3Vlc3QsIHRoZXJlYnkgY3V0dGluZyB0aGUgc2Vjb25kYXJ5Cj4+Pj4gQ1BVIGJvb3QgdGlt
ZSBieSBtb3JlIHRoYW4gaGFsZi4KPj4+Cj4+PiBJIGRvbid0IHRoaW5rIHRoYXQncyBhIHBhcnRp
Y3VsYXJseSBjb21wZWxsaW5nIHJlYXNvbiB0byBlbmFibGUgdGhpcyBmb3IKPj4+IGFybTY0LCBp
biBhbGwgaG9uZXN0eS4gVGhlIHlpZWxkIGluc3RydWN0aW9uIHR5cGljYWxseSBkb2Vzbid0IGRv
Cj4+PiBhbnl0aGluZyBvbiBhY3R1YWwgYXJtNjQgc2lsaWNvbiwgc28gdGhpcyBwcm9iYWJseSBt
ZWFucyB0aGF0IHlvdSdyZQo+Pj4gaW50cm9kdWNpbmcgYnVzeS1sb29wcyB3aGljaCB0ZW5kIHRv
IGJlIGJhZCBmb3IgcG93ZXIgYW5kIHNjYWxhYmlsaXR5Lgo+Pgo+PiBBZnRlciB1cGRhdGluZyB0
aGUgaW1wbGVtZW50YXRpb24gaW4gdjIsIHRoZSBwZXJmb3JtYW5jZSBnYWlucyBhcmUKPj4gcHJp
bWFyaWx5IG9ic2VydmVkIG9uIGFjdHVhbCBoYXJkd2FyZS4KPiAKPiAuLi4gYnV0IHRoYXQncyBw
cmVzdW1hYmx5IGJlY2F1c2UgdGhlIHNlY29uZGFyeSBjb3JlcyBhcmUgYnVzeS1sb29waW5nLgo+
IFRoYXQncyBub3Qgc29tZXRoaW5nIHdlIHNob3VsZCBkbyBkdXJpbmcgYm9vdC4gSXQgbWlnaHQg
YmUgImZhc3QiIG9uCj4geW91ciBtYWNoaW5lIGJ1dCBpdCB3aWxsIHByb2JhYmx5IGJlICJob3Qi
IGFzIHdlbGwuCgpIaSwgV2lsbCwKCkkgc2VlIHlvdXIgcG9pbnQgcmVnYXJkaW5nIHRoZSAnaG90
IGJvb3QnIGlzc3VlLCB3aGljaCBpcyBpbmRlZWQgYSB2YWxpZApjb25jZXJuIGZvciBwb3dlci1j
b25zdHJhaW5lZCBkZXZpY2VzLAoKTXkgb3B0aW1pemF0aW9uIGlzIHRhaWxvcmVkIGZvciBzZXJ2
ZXJzIGFuZCBjb250aW51b3VzbHkgcG93ZXJlZCBzaW5nbGUKYm9hcmRzLCB3aGVyZSBib290LXVw
IHNwZWVkIGlzIG11Y2ggbW9yZSBjcml0aWNhbCB0aGFuIHRlbXBvcmFyeSBwb3dlcgp1c2FnZSBk
dXJpbmcgdGhlIGVhcmx5IGJvb3QgcGhhc2UuCgpQZXJoYXBzIHdlIGNvdWxkIHJlcGxhY2UgdGhl
ICJ5aWVsZCIgaW5zdHJ1Y3Rpb24gd2l0aCAiV0ZFIC8gU0VWIgppbnN0cnVjdGlvbnMgdG8gY29v
cmRpbmF0ZSB0aGUgcGFyYWxsZWwgYm9vdCBvZiB0aGUgcHJpbWFyeSBhbmQKc2Vjb25kYXJ5IGNv
cmVzLiBUaGlzIGFwcHJvYWNoIHdvdWxkIGFsbG93IHRoZSBzZWNvbmRhcnkgY29yZXMgdG8gZW50
ZXIKYSBsb3ctcG93ZXIgc3RhbmRieSBzdGF0ZSByYXRoZXIgdGhhbiBidXN5LWxvb3BpbmcsIGVm
ZmVjdGl2ZWx5CnByZXZlbnRpbmcgdGhlIHRoZXJtYWwgYW5kIHBvd2VyIGlzc3VlcyBvbiBiYXR0
ZXJ5LWNvbnN0cmFpbmVkIG1hY2hpbmVzLgoKPiAKPj4+IEkgaW1wbGVtZW50ZWQgdGhpcyBhIHdo
aWxlIGFnbyBbMV0gYnV0IGRpZG4ndCBtYW5hZ2UgdG8gc2VlIG11Y2ggaW4gdGVybXMKPj4+IG9m
IHBlcmZvcm1hbmNlIGltcHJvdmVtZW50IGFuZCBzbyBJIGRpZG4ndCBib3RoZXIgdG8gc2VuZCB0
aGUgcGF0Y2hlcyBvdXQKPj4KPj4gQXMgc2hvd24gaW4gdjIgYmVsb3csIG9uIGFjdHVhbCBoYXJk
d2FyZSwgdGhpcyByZXN1bHRzIGluIGEgNDAl4oCTNjAlCj4+IHJlZHVjdGlvbiBpbiBib290IHRp
bWUuCj4+Cj4+IEJyaW5ndXAgVGltZSBDb21wYXJpc29uIChtcywgbG93ZXIgaXMgYmV0dGVyKToK
Pj4KPj4gfCAgICAgUGxhdGZvcm0JCXwgQmFzZWxpbmV8ICAgUD0wICAgfCAgIFA9MSAgfCBEZWx0
YSglKXwKPj4gfCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0gfCAtLS0tLS0tIHwgLS0tLS0tLSB8IC0t
LS0tLSB8IC0tLS0tLS0gfAo+PiB8IDY0LWNvcmUgQVRGIFFFTVUJfCAyMDc1LjggIHwgMjA4MC43
ICB8IDE2NTMuNCB8IDIwLjM0JSAgfAo+PiB8IDE5Mi1jb3JlIHNlcnZlcihISVAxMil8IDE0NjE5
LjIgfCAxNDYxOS4xIHwgODU4OS40IHwgNDEuMjElICB8Cj4+IHwgMzItY29yZSBib2FyZAkgICAg
ICAgIHwgMjc3Ni41ICB8IDI4ODEuMCAgfCAxMDQ1LjAgfCA2Mi4zNiUgIHwKPj4KPj4gTGluazoK
Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwNjE4MDkyNDQ0LjEzMTYzMzYtNS1y
dWFuamluamllQGh1YXdlaS5jb20vCj4gCj4gVG8gYmUgaG9uZXN0LCBJJ20gcHJldHR5IGNvbmZ1
c2VkIHdpdGggYWxsIHRoZXNlIG51bWJlcnMuIFlvdXIgZmlyc3QKPiB0YWJsZSBhYm92ZSBzdWdn
ZXN0cyB0aGF0IHBhcmFsbGVsIGJvb3QgaXMgKnNsb3dlciogYnV0IHRoZW4gdGhpcyB0YWJsZQo+
IHN1Z2dlc3RzIHRoZSBvcHBvc2l0ZS4gSG93ZXZlciwgaXQgYWxzbyBoYXMgYSBRRU1VIGVudHJ5
IGRlc3BpdGUgYmVpbmcKPiAib24gYWN0dWFsIGhhcmR3YXJlIi4gSXMgdGhhdCBpbiBhIFZNPwoK
U29ycnksIHRoZXJlIGlzIGEgbGl0dGxlIGNvbmZ1c2VkLiAxOTItY29yZSBzZXJ2ZXIoSElQMTIp
IGFuZCAzMi1jb3JlCmJvYXJkIGFyZSB0ZXN0ZWQgb24gcmVhbCBoYXJkd2FyZSwgd2hpY2ggaGFz
IDQwJeKAkzYwJSByZWR1Y3Rpb24gaW4gYm9vdCB0aW1lLgoKPiAKPj4+IGFmdGVyIHRhbGtpbmcg
YWJvdXQgaXQgYXQgS1ZNIGZvcnVtIFsyXS4gSG93ZXZlciwgYXMgbWVudGlvbmVkIGF0IHRoZSBl
bmQKPj4+IG9mIHRoYXQgdGFsaywgaXQgX2lzXyBzdGlsbCB1c2VmdWwgZm9yIGNvbmZpZGVudGlh
bCBWTXMgdXNpbmcgUFNDSSBzbwo+Pj4gbGV0IG1lIGR1c3Qgb2ZmIG15IG9sZCBzZXJpZXMgYW5k
IHNlbmQgaXQgb3V0IHRvIHNlZSB3aGF0IHlvdSB0aGluay4KPj4+Cj4+PiBJdCByZWxpZXMgb24g
UFNDSSB2MC4yLCB3aGljaCBtZWFucyB3ZSBkb24ndCBuZWVkIHRoZSBOUl9DUFVTIHNpemUgYXJy
YXkKPj4+IGZvciBzZWNvbmRhcnlfZGF0YSBhbmQgSSBhbHNvIGhhdmUgc29tZSBzdXBwb3J0IGZv
ciBlcnJvciBoYW5kbGluZyAoaXQKPj4+IGRvZXNuJ3QgbG9vayBsaWtlIHlvdSBoYW5kbGUgX19l
YXJseV9jcHVfYm9vdF9zdGF0dXMgcHJvcGVybHkpLgo+Pgo+PiBJIG5lZWQgc29tZSB0aW1lIHRv
IGxvb2sgY2xvc2VseSBhdCB5b3VyIHBhdGNoLiBBbHRlcm5hdGl2ZWx5LCBJIHdpbGwKPj4gaW50
ZWdyYXRlIHlvdXIgY2hhbmdlcywgcmUtdGVzdCBldmVyeXRoaW5nIG9uIGFjdHVhbCBoYXJkd2Fy
ZSwgYW5kIHRoZW4KPj4gc2VuZCBvdXQgYSByZXZpc2VkIHZlcnNpb24uCj4gCj4gUGxlYXNlIGp1
c3QgZ2l2ZSBtZSBhIHdlZWsgb3Igc28gdG8gcmViYXNlIG15IGNoYW5nZXMgYW5kIHNlbmQgdGhl
bSBvdXQKPiBmb3IgZGlzY3Vzc2lvbi4gSXQnbGwgYmUgaW50ZXJlc3RpbmcgdG8gc2VlIHdoYXQg
bnVtYmVycyB5b3UgZ2V0LgoKU291bmRzIGdvb2QhIFRha2UgeW91ciB0aW1lLCBhbmQgSSdtIGxv
b2tpbmcgZm9yd2FyZCB0byB5b3VyIHNlcmllcy4KCkluIHRoZSBtZWFudGltZSwgSSBoYXZlIGp1
c3Qgc2VudCBvdXQgdjMgb2YgdGhpcyBwYXRjaC4gV2hpbGUgd29ya2luZwpjbG9zZWx5IHdpdGgg
eW91ciBwcmV2aW91cyBjb2RlLCBJIGlkZW50aWZpZWQgYSBmZXcgYnVncyAoaW5jbHVkaW5nIHRo
ZQptdWx0aS1DUFUgc3RhdHVzIHRyYW1wbGluZyBpc3N1ZSB3ZSBkaXNjdXNzZWQpIGFuZCBhZGRy
ZXNzZWQgdGhlbSBpbgp0aGlzIG5ldyB2ZXJzaW9uLkkgd2FudGVkIHRvIHNoYXJlIHYzIHdpdGgg
eW91IG5vdyBzbyB5b3UgY2FuIGVhc2lseQpyZXZpZXcgdGhlIGZpeGVzIGFuZCBwb3RlbnRpYWxs
eSBpbnRlZ3JhdGUgdGhlbSB3aGVuIHlvdSByZWJhc2UgeW91cgpjaGFuZ2VzIG5leHQgd2Vlay4g
SXQgYWxzbyBpbmNsdWRlcyB0aGUgdXBkYXRlZCBwZXJmb3JtYW5jZSBudW1iZXJzIG9uCm15IHNl
dHVwIGZvciB5b3VyIHJlZmVyZW5jZS4KCkxpbms6Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Fs
bC8yMDI2MDYyNDA5MjUzNy4yOTE2OTcxLTEtcnVhbmppbmppZUBodWF3ZWkuY29tLwoKTG9va2lu
ZyBmb3J3YXJkIHRvIHRoZSBkaXNjdXNzaW9uIQoKQmVzdCByZWdhcmRzLApKaW5qaWUKCj4gCj4+
IEl0IHNlZW1zIHRoYXQgdGhlIGZvbGxvd2luZyBwYXRjaCByZW1vdmluZwo+PiBgcmN1dHJlZV9y
ZXBvcnRfY3B1X3N0YXJ0aW5nKClgIHdpbGwgcmVpbnRyb2R1Y2UgdGhlIG9yaWdpbmFsIGlzc3Vl
IGFzCj4+IGNvbW1pdCBjZTNkMzFhZDNjYWMgKCJhcm02NC9zbXA6IE1vdmUKPj4gcmN1X2NwdV9z
dGFydGluZygpIGVhcmxpZXIiKSBzb2xvdmVkLgo+Pgo+PiBMaW5rOgo+PiBodHRwczovL3dlYi5n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvd2lsbC9saW51eC5naXQvY29t
bWl0Lz9oPWNwdS1ob3RwbHVnJmlkPWJiYTRiNjJmNDVmMjYxNGJmNjA4NWU2Y2QzZjIzMzUyOGY4
NWJmMjYKPj4KPj4gSW5kZWVkLCBJIGFsc28gbm90aWNlZCB0aGF0IHRoZSBpbnZvY2F0aW9uIG9y
ZGVyIG9mCj4+IHJjdXRyZWVfcmVwb3J0X2NwdV9zdGFydGluZygpIG9uIGFybTY0IGlzIHNvbWV3
aGF0IHN1Ym9wdGltYWwuIEl0Cj4+IGhpbmRlcnMgdGhlIGltcGxlbWVudGF0aW9uIG9mIHBhcmFs
bGVsIGJyaW5ndXAgb24gYXJtNjQgYW5kIGNvdWxkCj4+IHBvdGVudGlhbGx5IGxlYWQgdG8gUkNV
IHN0YWxscy4KPj4KPj4gTGluazoKPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYw
NjE4MDkyNDQ0LjEzMTYzMzYtNC1ydWFuamluamllQGh1YXdlaS5jb20vCj4+Cj4+IFsgICAgMC4z
MjkwMTddIHNtcDogQnJpbmdpbmcgdXAgc2Vjb25kYXJ5IENQVXMgLi4uCj4+IFsgICAgMC4zNDM2
MjhdIERldGVjdGVkIFZJUFQgSS1jYWNoZSBvbiBDUFUxCj4+IFsgICAgMC4zNDM3ODhdCj4+IFsg
ICAgMC4zNDM4MDZdID09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4+IFsgICAgMC4zNDM4
MTZdIFdBUk5JTkc6IHN1c3BpY2lvdXMgUkNVIHVzYWdlCj4+IFsgICAgMC4zNDM5NjZdIDcuMS4w
LXJjMS1nMjdjMTg3MTg0OGEyICMxMDkgTm90IHRhaW50ZWQKPj4gWyAgICAwLjM0NDA4N10gLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4gWyAgICAwLjM0NDA5OF0ga2VybmVsL2xvY2tp
bmcvbG9ja2RlcC5jOjM4MDEgUkNVLWxpc3QgdHJhdmVyc2VkIGluCj4+IG5vbi1yZWFkZXIgc2Vj
dGlvbiEhCj4gCj4gVGhhbmtzLCBJJ2xsIGxvb2sgaW50byB0aGlzLgo+IAo+IFdpbGwKPiAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
