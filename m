Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA58CDB47C
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jun 2026 09:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pDS+GO2zIJMKnHIi1u9UIrKCu1U/KTV4S6ztTs5uWrY=; b=zisqjNa72uhJBy
	54li+Lg2d1NkL0VkfKCbE1exCZ9aUGpcSJ+TKfIYYgfQ4TZ9ngnJ/fB+VfxEL4OqKQVdF4svZz1y8
	Ml7OtLWATIeBqRxJIJkmUfKMtoU0mcBQagj3ciTPL5hSQfaP2IfuqHSUWZGfhCb7U/63/CSUQLMj5
	7HoQoJABS2oG/FU8fmMpsy13T3IKi4yaIU0OYRSOybNe4/Mp6j/lNesP9sd6OWRZJTleapwiiFsnv
	lHV8ucpbkd5e/tXe36sGVXlGbUXuWi8Xg0oBOOu7toRuvVaODRqWrx6NJUCjXevToQl10zLsmpGMe
	4L7yPOI7rfb4fs+D3Qkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJvT-00000007Vro-2W10;
	Wed, 24 Jun 2026 09:29:43 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJvQ-00000007Vqf-2G2I;
	Wed, 24 Jun 2026 09:29:42 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=d1eG3hPlsm1+oT45P4zhN9osQ73dxXUyqZH+WHKL4Lo=;
	b=no3zg9rEHsY+O6tH7lGBZCr/wtQTLde9WTBakbu/lBUC2VtlVNPDQ7njD2eIAQDbPGnbNU2jA
	HUJhzeTdVN3bmifdnpxCNgcDjzfTf/O21bzqAMhNYus0NTL070RWrW3IB5vlEXdFX6WLp1Gmefd
	V2TB0gHX2ucPShwXbN+bL2U=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4glby464Fzz1K9Z7;
	Wed, 24 Jun 2026 17:20:28 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id ECEA240565;
	Wed, 24 Jun 2026 17:29:32 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 24 Jun 2026 17:29:31 +0800
Message-ID: <39df6d17-5151-469d-bcff-b0db3fb5f417@huawei.com>
Date: Wed, 24 Jun 2026 17:29:30 +0800
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
 <b828dd7a-0363-46cf-aad0-e4962e299338@huawei.com>
 <ajqZJVBCu_D-BkTy@willie-the-truck>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <ajqZJVBCu_D-BkTy@willie-the-truck>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_022940_921178_552B3955 
X-CRM114-Status: GOOD (  23.56  )
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

CgpPbiA2LzIzLzIwMjYgMTA6MzMgUE0sIFdpbGwgRGVhY29uIHdyb3RlOgo+IE9uIE1vbiwgSnVu
IDIyLCAyMDI2IGF0IDA1OjE2OjMwUE0gKzA4MDAsIEppbmppZSBSdWFuIHdyb3RlOgo+Pgo+Pgo+
PiBPbiA2LzE4LzIwMjYgODoyMSBQTSwgV2lsbCBEZWFjb24gd3JvdGU6Cj4+PiBIaSBKaW5qaWUs
Cj4+Pgo+Pj4gT24gTW9uLCBKdW4gMTUsIDIwMjYgYXQgMDQ6NTE6NDhQTSArMDgwMCwgSmluamll
IFJ1YW4gd3JvdGU6Cj4+Pj4gT24gNi8xMi8yMDI2IDExOjQ1IFBNLCBNaWNoYWVsIEtlbGxleSB3
cm90ZToKPj4+Pj4gRnJvbTogSmluamllIFJ1YW4gPHJ1YW5qaW5qaWVAaHVhd2VpLmNvbT4gU2Vu
dDogVGh1cnNkYXksIEp1bmUgMTEsIDIwMjYgNjozOCBBTQo+Pj4+Pj4KPj4+Pj4+IFN1cHBvcnQg
Zm9yIHBhcmFsbGVsIHNlY29uZGFyeSBDUFUgYnJpbmd1cCBpcyBhbHJlYWR5IHV0aWxpemVkIGJ5
IHg4NiwKPj4+Pj4+IE1JUFMsIGFuZCBSSVNDLVYuIFRoaXMgcGF0Y2ggYnJpbmdzIHRoaXMgY2Fw
YWJpbGl0eSB0byB0aGUgYXJtNjQKPj4+Pj4+IGFyY2hpdGVjdHVyZS4KPj4+Pj4+Cj4+Pj4+PiBS
ZXdvcmsgdGhlIGdsb2JhbCBgc2Vjb25kYXJ5X2RhdGFgIGFjY2Vzc2VkIGR1cmluZyBlYXJseSBi
b290IGludG8KPj4+Pj4+IGEgcGVyLUNQVSBhcnJheS4gVGhpcyBhcnJheSBtYXBzIGxvZ2ljYWwg
Q1BVIElEcyB0byBNUElEUl9FTDEgdmFsdWVzLAo+Pj4+Pj4gZW5hYmxpbmcgdGhlIGVhcmx5IGJv
b3QgY29kZSBpbiBoZWFkLlMgdG8gcmVzb2x2ZSBlYWNoIHNlY29uZGFyeSBDUFUncwo+Pj4+Pj4g
bG9naWNhbCBJRCBjb25jdXJyZW50bHkuCj4+Pj4+Pgo+Pj4+Pj4gVG8gZnVsbHkgZW5hYmxlIEhP
VFBMVUdfUEFSQUxMRUwsIHRoaXMgcGF0Y2ggaW1wbGVtZW50czoKPj4+Pj4+IDEpIEFuIGFybTY0
LXNwZWNpZmljIGFyY2hfY3B1aHBfa2lja19hcF9hbGl2ZSgpIGhhbmRsZXIuCj4+Pj4+PiAyKSBD
YWxsYmFja3MgdG8gY3B1aHBfYXBfc3luY19hbGl2ZSgpIGluc2lkZSBzZWNvbmRhcnlfc3RhcnRf
a2VybmVsKCkuCj4+Pj4+Pgo+Pj4+Pj4gU3VjY2Vzc2Z1bGx5IHRlc3RlZCBvbiBRRU1VIEFSTTY0
IHZpcnQgbWFjaGluZSAoS1ZNIG9uLCAxMjggdkNQVXMpLgo+Pj4+Pj4KPj4+Pj4+IHwgICAgIHRl
c3Qga2VybmVsCSAgIHwgc2Vjb25kYXJ5IENQVXMgYm9vdCB0aW1lIHwKPj4+Pj4+IHwgIC0tLS0t
LS0tLS0tLS0tLS0tLS0tLSAgIHwJLS0tLS0tLS0tLS0tLS0tLS0tLS0gIHwKPj4+Pj4+IHwgICBX
aXRob3V0IHRoaXMgcGF0Y2ggICAgIHwJCTE1NS42NzIJICAgICAgfAo+Pj4+Pj4gfCAgIGNwdWhw
LnBhcmFsbGVsPTAJICAgfAkJNjIuODk3CSAgICAgIHwKPj4+Pj4+IHwgICBjcHVocC5wYXJhbGxl
bD0xCSAgIHwJCTE2Ni43MDMJICAgICAgfAo+Pj4+Pgo+Pj4+PiBUaGUgbGFzdCB0d28gcm93cyBz
ZWVtIG1peGVkIHVwLiBJIHdvdWxkIGV4cGVjdCBwYXJhbGxlbD0wIHRvCj4+Pj4+IHJlc3VsdCBp
biBhIGxvbmdlciBib290IHRpbWUuCj4+Pj4KPj4+PiBIaSwgTWljaGFlbCwKPj4+Pgo+Pj4+IFRo
ZSByZXN1bHRzIGFyZSBjb3JyZWN0IGFuZCBub3QgbWl4ZWQgdXAuCj4+Pj4KPj4+PiBDb21wYXJl
ZCB0byB0aGUgb3JpZ2luYWwgbm9u4oCRSE9UUExVR19QQVJBTExFTCBhcHByb2FjaCwgdGhlIGFk
dmFudGFnZSBvZgo+Pj4+IGNwdWhwLnBhcmFsbGVsPTAgbGllcyBpbiBpdHMgdXNlIG9mIGNwdV9y
ZWxheChgeWllbGRgIG9uIGFybTY0KSBpbnN0ZWFkCj4+Pj4gb2YgdGhlIHdhaXRfZm9yX2NvbXBs
ZXRpb25fdGltZW91dCgpIG1lY2hhbmlzbSAod2hpY2ggbWF5IGNhdXNlIHNsZWVwCj4+Pj4gYW5k
IGNvbnRleHQgc3dpdGNoaW5nKS4gVGhpcyBzaWduaWZpY2FudGx5IHJlZHVjZXMgdGhlIG92ZXJo
ZWFkIG9mIFZNCj4+Pj4gZXhpdHMgYW5kIGNvbnRleHQgc3dpdGNoZXMgaW4gYSBLVk0gZ3Vlc3Qs
IHRoZXJlYnkgY3V0dGluZyB0aGUgc2Vjb25kYXJ5Cj4+Pj4gQ1BVIGJvb3QgdGltZSBieSBtb3Jl
IHRoYW4gaGFsZi4KPj4+Cj4+PiBJIGRvbid0IHRoaW5rIHRoYXQncyBhIHBhcnRpY3VsYXJseSBj
b21wZWxsaW5nIHJlYXNvbiB0byBlbmFibGUgdGhpcyBmb3IKPj4+IGFybTY0LCBpbiBhbGwgaG9u
ZXN0eS4gVGhlIHlpZWxkIGluc3RydWN0aW9uIHR5cGljYWxseSBkb2Vzbid0IGRvCj4+PiBhbnl0
aGluZyBvbiBhY3R1YWwgYXJtNjQgc2lsaWNvbiwgc28gdGhpcyBwcm9iYWJseSBtZWFucyB0aGF0
IHlvdSdyZQo+Pj4gaW50cm9kdWNpbmcgYnVzeS1sb29wcyB3aGljaCB0ZW5kIHRvIGJlIGJhZCBm
b3IgcG93ZXIgYW5kIHNjYWxhYmlsaXR5Lgo+Pj4KPj4+IEkgaW1wbGVtZW50ZWQgdGhpcyBhIHdo
aWxlIGFnbyBbMV0gYnV0IGRpZG4ndCBtYW5hZ2UgdG8gc2VlIG11Y2ggaW4gdGVybXMKPj4+IG9m
IHBlcmZvcm1hbmNlIGltcHJvdmVtZW50IGFuZCBzbyBJIGRpZG4ndCBib3RoZXIgdG8gc2VuZCB0
aGUgcGF0Y2hlcyBvdXQKPj4+IGFmdGVyIHRhbGtpbmcgYWJvdXQgaXQgYXQgS1ZNIGZvcnVtIFsy
XS4gSG93ZXZlciwgYXMgbWVudGlvbmVkIGF0IHRoZSBlbmQKPj4+IG9mIHRoYXQgdGFsaywgaXQg
X2lzXyBzdGlsbCB1c2VmdWwgZm9yIGNvbmZpZGVudGlhbCBWTXMgdXNpbmcgUFNDSSBzbwo+Pj4g
bGV0IG1lIGR1c3Qgb2ZmIG15IG9sZCBzZXJpZXMgYW5kIHNlbmQgaXQgb3V0IHRvIHNlZSB3aGF0
IHlvdSB0aGluay4KPj4KPj4gSGkgV2lsbCwKPj4KPj4gVGhhbmtzIGZvciB0aGUgaW5zaWdodHMh
IFlvdXIgcG9pbnQgYWJvdXQgdXNpbmcgUFNDSSB2MC4yJ3MgQ29udGV4dCBJRAo+PiB0byBhdm9p
ZCB0aGUgTlJfQ1BVUyBhcnJheSBmb3IgaW5wdXQgcGFyYW1ldGVycyAobGlrZQo+PiBzZWNvbmRh
cnlfZGF0YS50YXNrKSBpcyBpbmNyZWRpYmx5IGVsZWdhbnQuCj4+Cj4+IEhvd2V2ZXIsIGlmIEkg
dW5kZXJzdGFuZCB5b3VyIHNlcmllcyBjb3JyZWN0bHksIGl0IHNlZW1zIHlvdXIgYXBwcm9hY2gK
Pj4gcHJpbWFyaWx5IHRhcmdldHMgcHJldmVudGluZyB0aGUgY29uY3VycmVudCB1c2Ugb2Ygc2Vj
b25kYXJ5X2RhdGEudGFzaywKPj4gYnV0IGl0IGRvZXNuJ3Qgc2VlbSB0byBhY2NvdW50IGZvciB0
aGUgcG90ZW50aWFsIGRhdGEgdHJhbXBsaW5nIG9uCj4+IHNlY29uZGFyeV9kYXRhLnN0YXR1cyB3
aGVuIG11bHRpcGxlIHNlY29uZGFyeSBDUFVzIGFyZSBicm91Z2h0IHVwCj4+IHNpbXVsdGFuZW91
c2x5Lgo+Pgo+PiB1cGRhdGVfY3B1X2Jvb3Rfc3RhdHVzKCkKPj4gICAtPiBXUklURV9PTkNFKHNl
Y29uZGFyeV9kYXRhLnN0YXR1cy5mbGFnc1t2YWxdLCAxKQo+Pgo+PiBhcmNoX2NwdWhwX2NsZWFu
dXBfa2lja19jcHUoKQo+PiAgIC0+IHN0YXR1cyA9IFJFQURfT05DRShzZWNvbmRhcnlfZGF0YS5z
dGF0dXMpCj4gCj4gSSBuZWVkIHRvIGR1c3QgaXQgYmFjayBvZmYgYnV0IElJUkMgSSBtYWRlIHRo
YXQgdGhpbmcgYSBieXRlIGFycmF5LCB3aXRoCj4gYSBzZXBhcmF0ZSBieXRlIGZvciBlYWNoIGZh
aWx1cmUgcmVhc29uLgo+IAo+IFdpbGwKCkhpLCBXaWxsLAoKVGhhbmtzIGZvciB0aGUgY2xhcmlm
aWNhdGlvbi4gQSBieXRlIGFycmF5IHdpdGggYSBzZXBhcmF0ZSBieXRlIHBlcgpmYWlsdXJlIHJl
YXNvbiBkb2VzIHByZXZlbnQgdHJhbXBsaW5nIGJldHdlZW4gZGlmZmVyZW50IGZhaWx1cmUgdHlw
ZXMuCgpIb3dldmVyLCB0aGUgaXNzdWUgYXJpc2VzIGlmIG11bHRpcGxlIHNlY29uZGFyeSBDUFVz
IGZhaWwgZm9yIHRoZSBleGFjdApzYW1lIHJlYXNvbiBzaW11bHRhbmVvdXNseS4gSW4gdGhhdCBz
Y2VuYXJpbywgdGhleSB3aWxsIHN0aWxsIGF0dGVtcHQgdG8Kd3JpdGUgdG8gdGhlIHNhbWUgYnl0
ZSBpbmRleCBhdCB0aGUgc2FtZSB0aW1lLiBBcyBhIHJlc3VsdCwgdGhlIHByaW1hcnkKQ1BVIHJl
YWRpbmcgdGhlIHN0YXR1cyBsYXRlciB3b24ndCBiZSBhYmxlIHRvIGRpc3Rpbmd1aXNoIHdoaWNo
IHNwZWNpZmljCkNQVXMgZW5jb3VudGVyZWQgdGhlIHByb2JsZW0sIG9yIGhvdyBtYW55IG9mIHRo
ZW0gZmFpbGVkLgoKSSB0ZXN0IHlvdXIgcGF0Y2ggd2l0aCBlcnJvciBpbmplY3QsIHdoaWNoIGNv
bmZpZ3VyZXMgQ1BVNCBhbmQgQ1BVNiwKYWxvbmcgd2l0aCBDUFUxNiBhbmQgQ1BVMTgsIHRvIGdl
bmVyYXRlIGRpc3RpbmN0IGJvb3QgZmFpbHVyZXMsIHdoaWxlCm1ha2luZyBDUFUxNyBoaXQgdGhl
IHNhbWUgYm9vdCBmYWlsdXJlIGFzIENQVTE2LiBUaGUgb3V0cHV0IGlzIG5vdApjb3JyZWN0IGFz
IGJlbG93OgoKWyAgICAwLjMzMjUyOF0gc21wOiBCcmluZ2luZyB1cCBzZWNvbmRhcnkgQ1BVcyAu
Li4KWyAgIDEwLjY3NDExNF0gQ1BVMSBmYWlsZWQgdG8gcmVwb3J0IGFsaXZlIHN0YXRlClsgICAx
MC42NzQzOTJdIENQVTEgZGV0ZWN0ZWQgbGFjayBvZiBzdXBwb3J0IGZvciA1Mi1iaXQgVkFzClsg
ICAxMC42NzQ2MTBdIENQVXMgbWF5IGJlIHN0dWNrIGluIGtlcm5lbApbICAgMjEuMDE2NzA3XSBD
UFUyIGZhaWxlZCB0byByZXBvcnQgYWxpdmUgc3RhdGUKWyAgIDMxLjM1NzMyMF0gQ1BVMyBmYWls
ZWQgdG8gcmVwb3J0IGFsaXZlIHN0YXRlClsgICA0MS42OTMyMjhdIENQVTQgZmFpbGVkIHRvIHJl
cG9ydCBhbGl2ZSBzdGF0ZQpbICAgNTIuMDMzMTEyXSBDUFU1IGZhaWxlZCB0byByZXBvcnQgYWxp
dmUgc3RhdGUKWyAgIDYyLjM3ODE5OF0gQ1BVNiBmYWlsZWQgdG8gcmVwb3J0IGFsaXZlIHN0YXRl
ClsgICA3Mi43MTY0NjddIENQVTcgZmFpbGVkIHRvIHJlcG9ydCBhbGl2ZSBzdGF0ZQpbICAgODMu
MDQ2NzQ2XSBDUFU4IGZhaWxlZCB0byByZXBvcnQgYWxpdmUgc3RhdGUKWyAgIDkzLjMzODAyMF0g
Q1BVOSBmYWlsZWQgdG8gcmVwb3J0IGFsaXZlIHN0YXRlClsgIDEwMy41OTE5ODZdIENQVTEwIGZh
aWxlZCB0byByZXBvcnQgYWxpdmUgc3RhdGUKWyAgMTEzLjg5Mzc0MV0gQ1BVMTEgZmFpbGVkIHRv
IHJlcG9ydCBhbGl2ZSBzdGF0ZQpbICAxMjQuMjMwODcwXSBDUFUxMiBmYWlsZWQgdG8gcmVwb3J0
IGFsaXZlIHN0YXRlClsgIDEzNC41Njc1OTddIENQVTEzIGZhaWxlZCB0byByZXBvcnQgYWxpdmUg
c3RhdGUKWyAgMTQ0LjkwNTI1Nl0gQ1BVMTQgZmFpbGVkIHRvIHJlcG9ydCBhbGl2ZSBzdGF0ZQpb
ICAxNTUuMjQ3NjMzXSBDUFUxNSBmYWlsZWQgdG8gcmVwb3J0IGFsaXZlIHN0YXRlClsgIDE2NS41
ODQ4OTFdIENQVTE2IGZhaWxlZCB0byByZXBvcnQgYWxpdmUgc3RhdGUKWyAgMTc1LjkyMDc5NF0g
Q1BVMTcgZmFpbGVkIHRvIHJlcG9ydCBhbGl2ZSBzdGF0ZQpbICAxODYuMjU2MzIzXSBDUFUxOCBm
YWlsZWQgdG8gcmVwb3J0IGFsaXZlIHN0YXRlClsgIDE5Ni41OTYxMzZdIENQVTE5IGZhaWxlZCB0
byByZXBvcnQgYWxpdmUgc3RhdGUKClRoZSBleHBlY3RlZCBvdXRwdXQgaXMgYXMgYmVsb3c6Cgog
ICAgICAgIENQVTQgZmFpbGVkIHRvIHJlcG9ydCBhbGl2ZSBzdGF0ZQogICAgICAgIENQVTQ6IGlz
IHN0dWNrIGluIGtlcm5lbAogICAgICAgIENQVTQ6IGRvZXMgbm90IHN1cHBvcnQgNTItYml0IFZB
cwoKICAgICAgICBDUFU2IGZhaWxlZCB0byByZXBvcnQgYWxpdmUgc3RhdGUKICAgICAgICBDUFU2
OiBpcyBzdHVjayBpbiBrZXJuZWwKICAgICAgICBDUFU2OiBkb2VzIG5vdCBzdXBwb3J0IDRLIGdy
YW51bGUKCiAgICAgICAgR0lDdjM6IENQVTg6IGZvdW5kIHJlZGlzdHJpYnV0b3IgOCByZWdpb24g
MDoweDAwMDAwMDAwMDgxYTAwMDAKICAgICAgICBHSUN2MzogQ1BVODogdXNpbmcgYWxsb2NhdGVk
IExQSSBwZW5kaW5nIHRhYmxlIEAweDAwMDAwMDAxMDAzNjAwMDAKICAgICAgICBDUFU4OiBCb290
ZWQgc2Vjb25kYXJ5IHByb2Nlc3NvciAweDAwMDAwMDAwMDggWzB4NDEwZmQwMzRdCiAgICAgICAg
Li4uCiAgICAgICAgQ1BVMTYgZmFpbGVkIHRvIHJlcG9ydCBhbGl2ZSBzdGF0ZQogICAgICAgIHBz
Y2k6IENQVTE2IGtpbGxlZCAocG9sbGVkIDAgbXMpCiAgICAgICAgQ1BVMTY6IGRpZWQgZHVyaW5n
IGVhcmx5IGJvb3QKCiAgICAgICAgQ1BVMTc6IHdpbGwgbm90IGJvb3QKICAgICAgICBDUFUxNyBm
YWlsZWQgdG8gcmVwb3J0IGFsaXZlIHN0YXRlCiAgICAgICAgcHNjaTogQ1BVMTcga2lsbGVkIChw
b2xsZWQgMCBtcykKICAgICAgICBDUFUxNzogZGllZCBkdXJpbmcgZWFybHkgYm9vdAoKICAgICAg
ICBDUFUxOCBmYWlsZWQgdG8gcmVwb3J0IGFsaXZlIHN0YXRlCiAgICAgICAgS2VybmVsIHBhbmlj
IC0gbm90IHN5bmNpbmc6IENQVTE4IGRldGVjdGVkIHVuc3VwcG9ydGVkIGNvbmZpZ3VyYXRpb24K
CkJlc3QgcmVnYXJkcywKSmluamllCgoKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
