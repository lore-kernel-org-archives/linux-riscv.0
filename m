Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5503CD5BD1
	for <linux-riscv@archiver.kernel.org>; Thu, 28 May 2026 07:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iI02MNFPniuDdzlLePDFxMSVyAZ08C3OfBClqSJ0+uY=; b=ahSvkS3IVDSa5B
	mOYY4mfex+m8k4Jt3m2Oskl0k2eOkqGIGPpJ092VuDqHkZMnd48bwSet1r21cHTNXGFg+cDlAD2QP
	nLefKhyGCaQvYn9gSWBm/QbD1wFI5kA5ZLt/IfjjpUQtZa0Syv1Z9MKeAeUs/MvFbJRT1jrUotb6j
	/dIXTkPlmT+N5DQyX30hC19kT7rxZAR80YNayL6EyG3yeg4ubFEOObDpoWo396WENbWq0a+bl7AhV
	WZLgy8FidPvStRWGDNQNA/JcFaabW4Q20yumqXacWgvwgacUtWMUbbElsYIN4BKid4x7t0Wg4nQNU
	qxHodX0cvCoeBShUcgyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSVKT-00000005HCu-2fzi;
	Thu, 28 May 2026 07:38:57 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSVKP-00000005HCI-1yWg;
	Thu, 28 May 2026 07:38:55 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=kcfmxoAhvHW1ZhGDwtgqi/DjUNMSbaPMdIrHdQsNguc=;
	b=f8XC3yJNgC87Lps2UOgSUA93oWaCi71/L5C74Qtkh2xvvB9/wWmNmoUIUb5UVMXIubbWL8933
	e8h8uZrHE9vRx70zyh+l2grmIqGnOBqJvoqoULa9vBWTYvnrKPHZkSsRAH2oTuA7Ix9baO7kUuW
	toKQ8NrVfgquDl51K9J1RjY=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gQyp223cczKm5b;
	Thu, 28 May 2026 15:30:50 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id E7CD840539;
	Thu, 28 May 2026 15:38:38 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 28 May 2026 15:38:33 +0800
Message-ID: <7ddab21c-bdb2-4a43-87fa-198b26d82f20@huawei.com>
Date: Thu, 28 May 2026 15:38:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 00/17] arm64/riscv: Add support for crashkernel CMA
 reservation
To: Huacai Chen <chenhuacai@kernel.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <kernel@xen0n.name>, <maddy@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <chleroy@kernel.org>,
	<pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <robh@kernel.org>,
	<saravanak@kernel.org>, <akpm@linux-foundation.org>, <bhe@redhat.com>,
	<rppt@kernel.org>, <pasha.tatashin@soleen.com>, <pratyush@kernel.org>,
	<ruirui.yang@linux.dev>, <rdunlap@infradead.org>, <pmladek@suse.com>,
	<feng.tang@linux.alibaba.com>, <dapeng1.mi@linux.intel.com>,
	<kees@kernel.org>, <elver@google.com>, <kuba@kernel.org>,
	<lirongqing@baidu.com>, <ebiggers@kernel.org>, <paulmck@kernel.org>,
	<thuth@redhat.com>, <ardb@kernel.org>, <masahiroy@kernel.org>,
	<mark.rutland@arm.com>, <maz@kernel.org>, <james.morse@arm.com>,
	<leitao@debian.org>, <sourabhjain@linux.ibm.com>, <yeoreum.yun@arm.com>,
	<coxu@redhat.com>, <jbohac@suse.cz>, <ryan.roberts@arm.com>,
	<cfsworks@gmail.com>, <tangyouling@kylinos.cn>, <ritesh.list@gmail.com>,
	<songshuaishuai@tinylab.org>, <junhui.liu@pigmoral.tech>,
	<vishal.moola@gmail.com>, <kas@kernel.org>, <debug@rivosinc.com>,
	<namcao@linutronix.de>, <liaoyuanhong@vivo.com>, <fuqiang.wang@easystack.cn>,
	<seanjc@google.com>, <guoren@kernel.org>, <chenjiahao16@huawei.com>,
	<hbathini@linux.ibm.com>, <bgwin@google.com>, <takahiro.akashi@linaro.org>,
	<lizhengyu3@huawei.com>, <x86@kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<kexec@lists.infradead.org>
References: <20260525084932.934910-1-ruanjinjie@huawei.com>
 <CAAhV-H4NA7vgyxKnK+N_3C6pWBnwXc2URUyLh_h1m-MO=MnsGQ@mail.gmail.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <CAAhV-H4NA7vgyxKnK+N_3C6pWBnwXc2URUyLh_h1m-MO=MnsGQ@mail.gmail.com>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_003854_144348_1BDAA63A 
X-CRM114-Status: GOOD (  20.58  )
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

CgpPbiA1LzI1LzIwMjYgNjoxNCBQTSwgSHVhY2FpIENoZW4gd3JvdGU6Cj4gSGksIEppbmppZSwK
PiAKPiBPbiBNb24sIE1heSAyNSwgMjAyNiBhdCA0OjUw4oCvUE0gSmluamllIFJ1YW4gPHJ1YW5q
aW5qaWVAaHVhd2VpLmNvbT4gd3JvdGU6Cj4+Cj4+IFRoZSBjcmFzaCBtZW1vcnkgYWxsb2NhdGlv
biwgYW5kIHRoZSBleGNsdWRlIG9mIGNyYXNoa19yZXMsIGNyYXNoa19sb3dfcmVzCj4+IGFuZCBj
cmFzaGtfY21hIG1lbW9yeSBhcmUgYWxtb3N0IGlkZW50aWNhbCBhY3Jvc3MgZGlmZmVyZW50IGFy
Y2hpdGVjdHVyZXMsCj4+IFRoaXMgcGF0Y2ggc2V0IGhhbmRsZSB0aGVtIGluIGNyYXNoIGNvcmUg
aW4gYSBnZW5lcmFsIHdheSwgd2hpY2ggZWxpbWluYXRlCj4+IGEgbG90IG9mIGR1cGxpY2F0aW9u
IGNvZGUuCj4+Cj4+IEFuZCBhZGQgc3VwcG9ydCBmb3IgY3Jhc2hrZXJuZWwgQ01BIHJlc2VydmF0
aW9uIGZvciBhcm02NCBhbmQgcmlzY3YuCj4+Cj4+IEFsc28gYWRkIHN1cHBvcnQgZm9yIGFybTY0
IGNyYXNoIGhvdHBsdWcuCj4+Cj4+IFRoaXMgcGF0Y2ggc2V0IGlzIHJlYmFzZWQgb24gdjcuMS1y
YzEuCj4+Cj4+IEJhc2ljIHNlY29uZCBrZXJuZWwgYm9vdCB0ZXN0IHdlcmUgcGVyZm9ybWVkIG9u
IFFFTVUgcGxhdGZvcm1zIGZvciB4ODYsCj4+IEFSTTY0IGFuZCBSSVNDLVYgYXJjaGl0ZWN0dXJl
cyB3aXRoIHRoZSBmb2xsb3dpbmcgcGFyYW1ldGVyczoKPj4KPj4gICAgICAgICAiY21hPTI1Nk0g
Y3Jhc2hrZXJuZWw9NEcgY3Jhc2hrZXJuZWw9NjRNLGNtYSIKPj4KPj4gRm9yIGZpcnN0IGtlcm5l
bCwgdGhlcmUgd2lsbCBiZSBzdWNoIGxvZzoKPj4KPj4gICAgICAgICAjIGRtZXNnIHwgZ3JlcCBj
cmFzaAo+PiAgICAgICAgIFsgICAgMC4wMDAwMDBdIGNyYXNoa2VybmVsIGxvdyBtZW1vcnkgcmVz
ZXJ2ZWQ6IDB4ZTgwMDAwMDAgLSAweGYwMDAwMDAwICgxMjggTUIpCj4+ICAgICAgICAgWyAgICAw
LjAwMDAwMF0gY3Jhc2hrZXJuZWwgcmVzZXJ2ZWQ6IDB4MDAwMDAwMDIzZTYwMDAwMCAtIDB4MDAw
MDAwMDMzZTYwMDAwMCAoNDA5NiBNQikKPj4gICAgICAgICBbICAgIDAuMDAwMDAwXSBjcmFzaGtl
cm5lbCBDTUEgcmVzZXJ2ZWQ6IDY0IE1CIGluIDEgcmFuZ2VzCj4+Cj4+ICAgICAgICAgIyBkbWVz
ZyB8IGdyZXAgY21hCj4+ICAgICAgICAgWyAgICAwLjAwMDAwMF0gY21hOiBSZXNlcnZlZCAyNTYg
TWlCIGF0IDB4MDAwMDAwMDBmMDAwMDAwMAo+PiAgICAgICAgIFsgICAgMC4wMDAwMDBdIGNtYTog
UmVzZXJ2ZWQgNjQgTWlCIGF0IDB4MDAwMDAwMDEwMDAwMDAwMAo+Pgo+PiBGb3Igc2Vjb25kIGtl
cm5lbCwgdGhlcmUgd2lsbCBiZSBzdWNoIGxvZzoKPj4KPj4gICAgICAgICBbICAgIDAuMDAwMDAw
XSBPRjogZmR0OiBMb29raW5nIGZvciB1c2FibGUtbWVtb3J5LXJhbmdlIHByb3BlcnR5Li4uCj4+
ICAgICAgICAgWyAgICAwLjAwMDAwMF0gT0Y6IGZkdDogY2FwX21lbV9yZWdpb25zWzBdOiBiYXNl
PTB4MDAwMDAwMDIzZTYwMDAwMCwgc2l6ZT0weDAwMDAwMDAxMDAwMDAwMDAKPj4gICAgICAgICBb
ICAgIDAuMDAwMDAwXSBPRjogZmR0OiBjYXBfbWVtX3JlZ2lvbnNbMV06IGJhc2U9MHgwMDAwMDAw
MGU4MDAwMDAwLCBzaXplPTB4MDAwMDAwMDAwODAwMDAwMAo+PiAgICAgICAgIFsgICAgMC4wMDAw
MDBdIE9GOiBmZHQ6IGNhcF9tZW1fcmVnaW9uc1syXTogYmFzZT0weDAwMDAwMDAxMDAwMDAwMDAs
IHNpemU9MHgwMDAwMDAwMDA0MDAwMDAwCj4+Cj4+IENoYW5nZXMgaW4gdjE0Ogo+PiAtIEZpeCBp
bWFnZS0+ZWxmX2hlYWRlcnMgbWVtb3J5IGxlYWsgZHVyaW5nIHJldHJ5IGxvb3AgZm9yIGFybTY0
IGFzIFNhc2hpa28KPj4gICBBSSBjb2RlIHJldmlldyBwb2ludGVkIG91dC4KPj4gLSBTb2x2ZSB0
aGUgaG90cGx1ZyBub3RpZmllciBhcmNoX2NyYXNoX2hhbmRsZV9ob3RwbHVnX2V2ZW50KCkgQUEK
Pj4gICBzZWxmLWRlYWRsb2NrIHByb2JsZW0gYXMgU2FzaGlrbyBBSSBjb2RlIHJldmlldyBwb2lu
dGVkIG91dC4KPj4gLSBGaXggdGhlIFRPQ1RPVSBpc3N1ZSBpbiBwcmVwYXJlX2VsZl9oZWFkZXJz
KCkgYnkgZ2V0X29ubGluZV9tZW1zKCkuCj4+IC0gLUVOT01FTSAtPiAtRUFHQUlOIGFzIEJyZW5v
IHN1Z2dlc3RlZC4KPj4gLSBBZGQgc3VwcG9ydCBmb3IgYXJtNjQgY3Jhc2ggaG90cGx1Zy4KPj4g
LSBMaW5rIHRvIHYxMzogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwNTExMDMwNDU0
LjE3MzA4ODEtMS1ydWFuamluamllQGh1YXdlaS5jb20vCj4+Cj4+IENoYW5nZXMgaW4gdjEzOgo+
PiAtIFJlYmFzZWQgb24gdjcuMS1yYzEuCj4+IC0gVXBkYXRlIHRoZSBjb21taXQgbWVzc2FnZS4K
Pj4gLSBBZGQgUmV2aWV3ZWQtYnkuCj4+IC0gTGluayB0byB2MTI6IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2FsbC8yMDI2MDQwMjA3MjcwMS42MjgyOTMtMS1ydWFuamluamllQGh1YXdlaS5jb20v
Cj4+Cj4+IENoYW5nZXMgaW4gdjEyOgo+PiAtIFJlbW92ZSB0aGUgdW51c2VkICJucl9tZW1fcmFu
Z2VzIiBmb3IgeDg2Lgo+PiAtIEFkZCAiRml4IGNyYXNoa19sb3dfcmVzIG5vdCBleGNsdWRlIGJ1
ZyIgdGVzdCBsb2cuCj4+IC0gUHJvdmlkZSBhIHNlcGFyYXRlIHBhdGNoIGZvciBlYWNoIGFyY2hp
dGVjdHVyZSBmb3IgdXNpbmcKPj4gICBjcmFzaF9wcmVwYXJlX2hlYWRlcnMoKSwgd2hpY2ggd2ls
bCBtYWtlIHRoZSByZXZpZXcgbW9yZSBjb252ZW5pZW50Lgo+PiAtIEFkZCBSZXZpZXdlZC1ieSBh
bmQgVGVzdGVkLWJ5Lgo+PiAtIExpbmsgdG8gdjExOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvMjAyNjAzMjgwNzQwMTMuMzU4OTU0NC0xLXJ1YW5qaW5qaWVAaHVhd2VpLmNvbS8KPj4KPj4g
Q2hhbmdlcyBpbiB2MTE6Cj4+IC0gQXZvaWQgc2lsZW50bHkgZHJvcCBjcmFzaCBtZW1vcnkgaWYg
dGhlIGNyYXNoIGtlcm5lbCBpcyBidWlsdCB3aXRob3V0Cj4+ICAgQ09ORklHX0NNQS4KPj4gLSBS
ZW1vdmUgdW5uZWNlc3NhcnkgImNtZW0tPm5yX3JhbmdlcyA9IDAiIGZvciBhcmNoX2NyYXNoX3Bv
cHVsYXRlX2NtZW0oKQo+PiAgIGFzIHdlIHVzZSBrdnphbGxvYygpLgo+PiAtIFByb3ZpZGUgYSBz
ZXBhcmF0ZSBwYXRjaCBmb3IgZWFjaCBhcmNoaXRlY3R1cmUgdG8gZml4IHRoZSBleGlzdGluZwo+
PiAgIGJ1ZmZlciBvdmVyZmxvdyBpc3N1ZS4KPj4gLSBBZGQgQWNrZWQtYnlzIGZvciBhcm02NC4K
Pj4KPj4gQ2hhbmdlcyBpbiB2MTA6Cj4+IC0gRml4IGNyYXNoa19sb3dfcmVzIG5vdCBleGNsdWRl
ZCBidWcgaW4gdGhlIGV4aXN0aW5nCj4+ICAgUklTQy1WIGNvZGUuCj4+IC0gRml4IGFuIGV4aXN0
aW5nIG1lbW9yeSBsZWFrIGlzc3VlIGluIHRoZSBleGlzdGluZyBQb3dlclBDIGNvZGUuCj4+IC0g
Rml4IHRoZSBvcmRlcmluZyBpc3N1ZSBvZiBhZGRpbmcgQ01BIHJhbmdlcyB0bwo+PiAgICJsaW51
eCx1c2FibGUtbWVtb3J5LXJhbmdlIi4KPj4gLSBGaXggYW4gZXhpc3RpbmcgY29uY3VycmVuY3kg
aXNzdWUuIEEgQ29uY3VycmVudCBtZW1vcnkgaG90cGx1ZyBtYXkgb2NjdXIKPj4gICBiZXR3ZWVu
IHJlYWRpbmcgbWVtYmxvY2sgYW5kIGF0dGVtcHRpbmcgdG8gZmlsbCBjbWVtIGR1cmluZyBrZXhl
Y19sb2FkKCkKPj4gICBmb3IgYWxtb3N0IGFsbCBleGlzdGluZyBhcmNoaXRlY3R1cmVzLgo+PiAt
IExpbmsgdG8gdjk6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDMyMzA3Mjc0NS4y
NDgxNzE5LTEtcnVhbmppbmppZUBodWF3ZWkuY29tLwo+Pgo+PiBDaGFuZ2VzIGluIHY5Ogo+PiAt
IENvbGxlY3QgUmV2aWV3ZWQtYnkgYW5kIEFja2VkLWJ5LCBhbmQgcHJlcGFyZSBmb3IgU2FzaGlr
byBBSSByZXZpZXcuCj4+IC0gTGluayB0byB2ODogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxs
LzIwMjYwMzAyMDM1MzE1LjM4OTIyNDEtMS1ydWFuamluamllQGh1YXdlaS5jb20vCj4+Cj4+IENo
YW5nZXMgaW4gdjg6Cj4+IC0gRml4IHRoZSBidWlsZCBpc3N1ZXMgcmVwb3J0ZWQgYnkga2VybmVs
IHRlc3Qgcm9ib3QgYW5kIFNvdXJhYmguCj4+IC0gTGluayB0byB2NzogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYWxsLzIwMjYwMjI2MTMwNDM3LjE4Njc2NTgtMS1ydWFuamluamllQGh1YXdlaS5j
b20vCj4+Cj4+IENoYW5nZXMgaW4gdjc6Cj4+IC0gQ29ycmVjdCB0aGUgaW5jbHVzaW9uIG9mIENN
QS1yZXNlcnZlZCByYW5nZXMgZm9yIGtkdW1wIGtlcm5lbCBpbiBvZi9rZXhlYwo+PiAgIGZvciBh
cm02NCBhbmQgcmlzY3YuCj4+IC0gQWRkIEFja2VkLWJ5Lgo+PiAtIExpbmsgdG8gdjY6IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDIyNDA4NTM0Mi4zODc5OTYtMS1ydWFuamluamll
QGh1YXdlaS5jb20vCj4+Cj4+IENoYW5nZXMgaW4gdjY6Cj4+IC0gVXBkYXRlIHRoZSBjcmFzaCBj
b3JlIGV4Y2x1ZGUgY29kZSBhcyBNaWtlIHN1Z2dlc3RlZC4KPj4gLSBSZWJhc2VkIG9uIHY3LjAt
cmMxLgo+PiAtIEFkZCBhY2tlZC1ieS4KPj4gLSBMaW5rIHRvIHY1OiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9hbGwvMjAyNjAyMTIxMDEwMDEuMzQzMTU4LTEtcnVhbmppbmppZUBodWF3ZWkuY29t
Lwo+Pgo+PiBKaW5qaWUgUnVhbiAoMTYpOgo+PiAgIHJpc2N2OiBrZXhlY19maWxlOiBGaXggY3Jh
c2hrX2xvd19yZXMgbm90IGV4Y2x1ZGUgYnVnCj4+ICAgcG93ZXJwYy9jcmFzaDogRml4IHBvc3Np
YmxlIG1lbW9yeSBsZWFrIGluIHVwZGF0ZV9jcmFzaF9lbGZjb3JlaGRyKCkKPj4gICBhcm02NDog
a2V4ZWM6IEZpeCBpbWFnZS0+ZWxmX2hlYWRlcnMgbWVtb3J5IGxlYWsgZHVyaW5nIHJldHJ5IGxv
b3AKPj4gICB4ODYva2V4ZWM6IEZpeCBwb3RlbnRpYWwgYnVmZmVyIG92ZXJmbG93IGluIHByZXBh
cmVfZWxmX2hlYWRlcnMoKQo+PiAgIGFybTY0OiBrZXhlY19maWxlOiBGaXggcG90ZW50aWFsIGJ1
ZmZlciBvdmVyZmxvdyBpbgo+PiAgICAgcHJlcGFyZV9lbGZfaGVhZGVycygpCj4+ICAgcmlzY3Y6
IGtleGVjX2ZpbGU6IEZpeCBwb3RlbnRpYWwgYnVmZmVyIG92ZXJmbG93IGluCj4+ICAgICBwcmVw
YXJlX2VsZl9oZWFkZXJzKCkKPj4gICBMb29uZ0FyY2g6IGtleGVjOiBGaXggcG90ZW50aWFsIGJ1
ZmZlciBvdmVyZmxvdyBpbgo+PiAgICAgcHJlcGFyZV9lbGZfaGVhZGVycygpCj4+ICAgY3Jhc2g6
IEFkZCBjcmFzaF9wcmVwYXJlX2hlYWRlcnMoKSB0byBleGNsdWRlIGNyYXNoIGtlcm5lbCBtZW1v
cnkKPj4gICBhcm02NDoga2V4ZWNfZmlsZTogVXNlIGNyYXNoX3ByZXBhcmVfaGVhZGVycygpIGhl
bHBlciB0byBzaW1wbGlmeSBjb2RlCj4+ICAgeDg2L2tleGVjOiBVc2UgY3Jhc2hfcHJlcGFyZV9o
ZWFkZXJzKCkgaGVscGVyIHRvIHNpbXBsaWZ5IGNvZGUKPj4gICByaXNjdjoga2V4ZWNfZmlsZTog
VXNlIGNyYXNoX3ByZXBhcmVfaGVhZGVycygpIGhlbHBlciB0byBzaW1wbGlmeSBjb2RlCj4+ICAg
TG9vbmdBcmNoOiBrZXhlYzogVXNlIGNyYXNoX3ByZXBhcmVfaGVhZGVycygpIGhlbHBlciB0byBz
aW1wbGlmeSBjb2RlCj4+ICAgY3Jhc2g6IFVzZSBjcmFzaF9leGNsdWRlX2NvcmVfcmFuZ2VzKCkg
b24gcG93ZXJwYwo+PiAgIGFybTY0OiBrZXhlYzogQWRkIHN1cHBvcnQgZm9yIGNyYXNoa2VybmVs
IENNQSByZXNlcnZhdGlvbgo+PiAgIHJpc2N2OiBrZXhlYzogQWRkIHN1cHBvcnQgZm9yIGNyYXNo
a2VybmVsIENNQSByZXNlcnZhdGlvbgo+PiAgIGFybTY0L2NyYXNoOiBBZGQgY3Jhc2ggaG90cGx1
ZyBzdXBwb3J0Cj4gSSBoYXZlIHNvbWUgYmlrZXNoZWVkaW5ncyBhYm91dCB0aGUgc3ViamVjdHMu
IENhbiB3ZSB1bmlmeSB0aGUgcHJlZml4IGZvcm1hdHM/Cj4geDg2L2tleGVjLCBhcm02NDoga2V4
ZWNfZmlsZSwgcmlzY3Y6IGtleGVjX2ZpbGUsIExvb25nQXJjaDoga2V4ZWMgLi4uLi4KPiAKPiBI
dWFjYWkKClN1cmUsIHdpbGwgdXBkYXRlIGl0IGluIG5leHQgdmVyc2lvbi4KCj4gCj4+Cj4+IFNv
dXJhYmggSmFpbiAoMSk6Cj4+ICAgcG93ZXJwYy9jcmFzaDogc29ydCBjcmFzaCBtZW1vcnkgcmFu
Z2VzIGJlZm9yZSBwcmVwYXJpbmcgZWxmY29yZWhkcgo+Pgo+PiAgLi4uL2FkbWluLWd1aWRlL2tl
cm5lbC1wYXJhbWV0ZXJzLnR4dCAgICAgICAgIHwgIDE2ICstLQo+PiAgYXJjaC9hcm02NC9LY29u
ZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAzICsKPj4gIGFyY2gvYXJtNjQvaW5j
bHVkZS9hc20va2V4ZWMuaCAgICAgICAgICAgICAgICB8ICAxNCArLQo+PiAgYXJjaC9hcm02NC9r
ZXJuZWwvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgIHwgICAxICsKPj4gIGFyY2gvYXJtNjQv
a2VybmVsL2NyYXNoLmMgICAgICAgICAgICAgICAgICAgICB8IDEyNSArKysrKysrKysrKysrKysr
KysKPj4gIGFyY2gvYXJtNjQva2VybmVsL2tleGVjX2ltYWdlLmMgICAgICAgICAgICAgICB8ICAy
MiArKy0KPj4gIGFyY2gvYXJtNjQva2VybmVsL21hY2hpbmVfa2V4ZWNfZmlsZS5jICAgICAgICB8
ICA3OCArKysrKystLS0tLQo+PiAgYXJjaC9hcm02NC9tbS9pbml0LmMgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgICA1ICstCj4+ICBhcmNoL2xvb25nYXJjaC9rZXJuZWwvbWFjaGluZV9rZXhl
Y19maWxlLmMgICAgfCAgNDMgKysrLS0tCj4+ICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20va2V4
ZWNfcmFuZ2VzLmggICAgICAgfCAgIDEgLQo+PiAgYXJjaC9wb3dlcnBjL2tleGVjL2NyYXNoLmMg
ICAgICAgICAgICAgICAgICAgIHwgICA3ICstCj4+ICBhcmNoL3Bvd2VycGMva2V4ZWMvcmFuZ2Vz
LmMgICAgICAgICAgICAgICAgICAgfCAxMDEgKy0tLS0tLS0tLS0tLS0KPj4gIGFyY2gvcmlzY3Yv
a2VybmVsL21hY2hpbmVfa2V4ZWNfZmlsZS5jICAgICAgICB8ICA0MiArKystLS0KPj4gIGFyY2gv
cmlzY3YvbW0vaW5pdC5jICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNSArLQo+PiAgYXJj
aC94ODYva2VybmVsL2NyYXNoLmMgICAgICAgICAgICAgICAgICAgICAgIHwgIDkyICsrLS0tLS0t
LS0tLS0KPj4gIGRyaXZlcnMvb2YvZmR0LmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAgOSArLQo+PiAgZHJpdmVycy9vZi9rZXhlYy5jICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgICA5ICsrCj4+ICBpbmNsdWRlL2xpbnV4L2NyYXNoX2NvcmUuaCAgICAgICAgICAgICAgICAg
ICAgfCAgMTEgKysKPj4gIGluY2x1ZGUvbGludXgvY3Jhc2hfcmVzZXJ2ZS5oICAgICAgICAgICAg
ICAgICB8ICAgNCArLQo+PiAga2VybmVsL2NyYXNoX2NvcmUuYyAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgMTAyICsrKysrKysrKysrKystCj4+ICAyMCBmaWxlcyBjaGFuZ2VkLCAzOTIgaW5z
ZXJ0aW9ucygrKSwgMjk4IGRlbGV0aW9ucygtKQo+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gv
YXJtNjQva2VybmVsL2NyYXNoLmMKPj4KPj4gLS0KPj4gMi4zNC4xCj4+Cj4gCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
