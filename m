Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A105BCD5BD1
	for <linux-riscv@archiver.kernel.org>; Thu, 28 May 2026 07:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZejuKy4cqerQc68uhYXHVHXbOOinZk9D+QMfxur9/oU=; b=YQFy7H9wLKWfPe
	RaMHHrTmvQFxsARsmpMUtm4FnLEvsRr0NjWZqEQH+osbPZ8ugXvJu1Xy/Pcr76EN6fYV7mhFpcNkh
	znMfCqtHZfFAqUlVyenLvqGIhyqxlfAhGNgyxNMl0pHySHrOtYX9L/1U9QIntjnmtzyRPf5HC8elo
	7qkhCnMtroATebfSCnJuiCQ6JL9w/chcCGanRsm0/c/2VC2CeTlPjp2T4MqEuBLvumvJtLmb8udq0
	MeXvMT6K0LwFQV1iVpcJu9vqf16y3CZx8K6J8pvp6PlJJ2dPt5ZXYyDX4tScWYCndBCadRCfuZ/Y8
	buIBic7J+4gWJN0jekeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSVTy-00000005Ips-25Jj;
	Thu, 28 May 2026 07:48:46 +0000
Received: from [113.46.200.224] (helo=canpmsgout09.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSVTu-00000005Io8-3awq;
	Thu, 28 May 2026 07:48:44 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=dpnGK6j+kvjnma6YHvrd5wwrLUxTfDRQvHYx5YGFkW8=;
	b=1P43YydGlenQu7gtjAUK3WkAvoYefi1zaef3ts/PCFV8z8jXMftJzmpGqo5LjAapMRdRXr6/a
	N1fDE/FHFxcXRLBxskpsButEzn/mkgSXUmZGYLvw2ukswIM6zPl+B8AGyjYLYkBV/NlrO3ruwSZ
	nO8/hOI1gcFH8PiH3P2wFRQ=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4gQz1K6V9Wz1cyQK;
	Thu, 28 May 2026 15:40:37 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 95504402AB;
	Thu, 28 May 2026 15:48:22 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 28 May 2026 15:48:16 +0800
Message-ID: <08ab6756-091c-4bee-9d49-cb84d0be027c@huawei.com>
Date: Thu, 28 May 2026 15:48:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 00/17] arm64/riscv: Add support for crashkernel CMA
 reservation
To: Huacai Chen <chenhuacai@kernel.org>, Mike Rapoport <rppt@kernel.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <kernel@xen0n.name>, <maddy@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <chleroy@kernel.org>,
	<pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <robh@kernel.org>,
	<saravanak@kernel.org>, <akpm@linux-foundation.org>, <bhe@redhat.com>,
	<pasha.tatashin@soleen.com>, <pratyush@kernel.org>, <ruirui.yang@linux.dev>,
	<rdunlap@infradead.org>, <pmladek@suse.com>, <feng.tang@linux.alibaba.com>,
	<dapeng1.mi@linux.intel.com>, <kees@kernel.org>, <elver@google.com>,
	<kuba@kernel.org>, <lirongqing@baidu.com>, <ebiggers@kernel.org>,
	<paulmck@kernel.org>, <thuth@redhat.com>, <ardb@kernel.org>,
	<masahiroy@kernel.org>, <mark.rutland@arm.com>, <maz@kernel.org>,
	<james.morse@arm.com>, <leitao@debian.org>, <sourabhjain@linux.ibm.com>,
	<yeoreum.yun@arm.com>, <coxu@redhat.com>, <jbohac@suse.cz>,
	<ryan.roberts@arm.com>, <cfsworks@gmail.com>, <tangyouling@kylinos.cn>,
	<ritesh.list@gmail.com>, <songshuaishuai@tinylab.org>,
	<junhui.liu@pigmoral.tech>, <vishal.moola@gmail.com>, <kas@kernel.org>,
	<debug@rivosinc.com>, <namcao@linutronix.de>, <liaoyuanhong@vivo.com>,
	<fuqiang.wang@easystack.cn>, <seanjc@google.com>, <guoren@kernel.org>,
	<chenjiahao16@huawei.com>, <hbathini@linux.ibm.com>, <bgwin@google.com>,
	<takahiro.akashi@linaro.org>, <lizhengyu3@huawei.com>, <x86@kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <loongarch@lists.linux.dev>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <kexec@lists.infradead.org>
References: <20260525084932.934910-1-ruanjinjie@huawei.com>
 <CAAhV-H4NA7vgyxKnK+N_3C6pWBnwXc2URUyLh_h1m-MO=MnsGQ@mail.gmail.com>
 <ahQ0WRiMsB011tym@kernel.org>
 <CAAhV-H5x3m08=acrUr2VOAQ8-r2PhN1xTdr3NihHocoPM5=3hQ@mail.gmail.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <CAAhV-H5x3m08=acrUr2VOAQ8-r2PhN1xTdr3NihHocoPM5=3hQ@mail.gmail.com>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_004843_195577_DAACF1C2 
X-CRM114-Status: UNSURE (   8.64  )
X-CRM114-Notice: Please train this message.
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

CgpPbiA1LzI1LzIwMjYgOToxNyBQTSwgSHVhY2FpIENoZW4gd3JvdGU6Cj4gT24gTW9uLCBNYXkg
MjUsIDIwMjYgYXQgNzozN+KAr1BNIE1pa2UgUmFwb3BvcnQgPHJwcHRAa2VybmVsLm9yZz4gd3Jv
dGU6Cj4+Cj4+IEhpIEh1YWNhaSwKPj4KPj4gT24gTW9uLCBNYXkgMjUsIDIwMjYgYXQgMDY6MTQ6
NTJQTSArMDgwMCwgSHVhY2FpIENoZW4gd3JvdGU6Cj4+PiBPbiBNb24sIE1heSAyNSwgMjAyNiBh
dCA0OjUw4oCvUE0gSmluamllIFJ1YW4gPHJ1YW5qaW5qaWVAaHVhd2VpLmNvbT4gd3JvdGU6Cj4+
Pj4KPj4+PiBKaW5qaWUgUnVhbiAoMTYpOgo+Pj4+ICAgcmlzY3Y6IGtleGVjX2ZpbGU6IEZpeCBj
cmFzaGtfbG93X3JlcyBub3QgZXhjbHVkZSBidWcKPj4+PiAgIHBvd2VycGMvY3Jhc2g6IEZpeCBw
b3NzaWJsZSBtZW1vcnkgbGVhayBpbiB1cGRhdGVfY3Jhc2hfZWxmY29yZWhkcigpCj4+Pj4gICBh
cm02NDoga2V4ZWM6IEZpeCBpbWFnZS0+ZWxmX2hlYWRlcnMgbWVtb3J5IGxlYWsgZHVyaW5nIHJl
dHJ5IGxvb3AKPj4+PiAgIHg4Ni9rZXhlYzogRml4IHBvdGVudGlhbCBidWZmZXIgb3ZlcmZsb3cg
aW4gcHJlcGFyZV9lbGZfaGVhZGVycygpCj4+Pj4gICBhcm02NDoga2V4ZWNfZmlsZTogRml4IHBv
dGVudGlhbCBidWZmZXIgb3ZlcmZsb3cgaW4KPj4+PiAgICAgcHJlcGFyZV9lbGZfaGVhZGVycygp
Cj4+Pj4gICByaXNjdjoga2V4ZWNfZmlsZTogRml4IHBvdGVudGlhbCBidWZmZXIgb3ZlcmZsb3cg
aW4KPj4+PiAgICAgcHJlcGFyZV9lbGZfaGVhZGVycygpCj4+Pj4gICBMb29uZ0FyY2g6IGtleGVj
OiBGaXggcG90ZW50aWFsIGJ1ZmZlciBvdmVyZmxvdyBpbgo+Pj4+ICAgICBwcmVwYXJlX2VsZl9o
ZWFkZXJzKCkKPj4+PiAgIGNyYXNoOiBBZGQgY3Jhc2hfcHJlcGFyZV9oZWFkZXJzKCkgdG8gZXhj
bHVkZSBjcmFzaCBrZXJuZWwgbWVtb3J5Cj4+Pj4gICBhcm02NDoga2V4ZWNfZmlsZTogVXNlIGNy
YXNoX3ByZXBhcmVfaGVhZGVycygpIGhlbHBlciB0byBzaW1wbGlmeSBjb2RlCj4+Pj4gICB4ODYv
a2V4ZWM6IFVzZSBjcmFzaF9wcmVwYXJlX2hlYWRlcnMoKSBoZWxwZXIgdG8gc2ltcGxpZnkgY29k
ZQo+Pj4+ICAgcmlzY3Y6IGtleGVjX2ZpbGU6IFVzZSBjcmFzaF9wcmVwYXJlX2hlYWRlcnMoKSBo
ZWxwZXIgdG8gc2ltcGxpZnkgY29kZQo+Pj4+ICAgTG9vbmdBcmNoOiBrZXhlYzogVXNlIGNyYXNo
X3ByZXBhcmVfaGVhZGVycygpIGhlbHBlciB0byBzaW1wbGlmeSBjb2RlCj4+Pj4gICBjcmFzaDog
VXNlIGNyYXNoX2V4Y2x1ZGVfY29yZV9yYW5nZXMoKSBvbiBwb3dlcnBjCj4+Pj4gICBhcm02NDog
a2V4ZWM6IEFkZCBzdXBwb3J0IGZvciBjcmFzaGtlcm5lbCBDTUEgcmVzZXJ2YXRpb24KPj4+PiAg
IHJpc2N2OiBrZXhlYzogQWRkIHN1cHBvcnQgZm9yIGNyYXNoa2VybmVsIENNQSByZXNlcnZhdGlv
bgo+Pj4+ICAgYXJtNjQvY3Jhc2g6IEFkZCBjcmFzaCBob3RwbHVnIHN1cHBvcnQKPj4+IEkgaGF2
ZSBzb21lIGJpa2VzaGVlZGluZ3MgYWJvdXQgdGhlIHN1YmplY3RzLiBDYW4gd2UgdW5pZnkgdGhl
IHByZWZpeCBmb3JtYXRzPwo+Pj4geDg2L2tleGVjLCBhcm02NDoga2V4ZWNfZmlsZSwgcmlzY3Y6
IGtleGVjX2ZpbGUsIExvb25nQXJjaDoga2V4ZWMgLi4uLi4KPj4KPj4gSXQgbWlnaHQgbG9vayB3
ZWlyZCBpbiB0aGUgc2VyaWVzLCBidXQgcG93ZXJwYyBhbmQgeDg2IHVzZSAnLycgYW5kIGFybTY0
IGFuZAo+PiByaXNjdiB1c2UgJzonIHNvIGluIHRoZSBsb2dzIGluIGFyY2gvIHRoaXMgd291bGQg
YmUgYWN0dWFsbHkgZmluZS4KPiBPSywgYnV0IGF0IGxlYXN0IHdlIGNhbiB1bmlmeSBrZXhlYyBh
bmQga2V4ZWNfZmlsZS4KClRoYXQgbG9va3MgZmluZS4KCkppbmppZQoKPiAKPiBIdWFjYWkKPiAK
Pj4KPj4gV2l0aCB0aGUgb25seSBleGNlcHRpb24gb2YgYXJtNjQvY3Jhc2ggdGhhdCBzaG91bGQg
aGF2ZSBiZWVuIGFybTY0OiBjcmFzaDoKPj4KPj4+IEh1YWNhaQo+Pgo+PiAtLQo+PiBTaW5jZXJl
bHkgeW91cnMsCj4+IE1pa2UuCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
