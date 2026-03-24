Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA18F532E4
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 06:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZSwQFMmIZ8B8wNocYJYSOAHXP7kzc+crAkSeaYYse14=; b=1/I3+50HRk6cA2
	kApZNV+V+H7f/popd1P5WoKI2L/XoUzQhuhaJtO2b5hBMEl9oToiARAPFZZL3wPOUIIzoGdsYggcy
	N6S94jzPRhL3GkuuVL4ypvrPA8b6jGBcNfXzOihtbWYPgQtAKxZZ+lcmvPcoFGe7hYJa72pkgCbPT
	5+BMJGmN/Fs7zsp/GfTpJABNxD+yqSGs6+xBPhLkogp6YFE2HtRPGAD0TFln4ukiO7yXG9wnmzM7U
	iN4bVKKMGhqFCXvzuGM7ffBN2JiLj+hQFgZxfoxp98nIntWzN/2eRSg2NDUPukqLSGIbmRT1yT9SL
	4AkLssaIYh6ukQMWsfZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4v2a-00000000fce-0m3m;
	Tue, 24 Mar 2026 06:15:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4v2X-00000000fac-2tec;
	Tue, 24 Mar 2026 06:14:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=qfaMojy4YCJI6x7hn3yLKKO+h1WPTwEnl4yVpQYK7UQ=; b=AlNPbq+92yYcp6cnb5kk/aLQxd
	in7+YMXScLmg+R2no6KntNPs5fpeZtzKroo7yaaUS3eKPPbzaZ9gfAmCVEokPYMOFvhaHvND01Z2W
	886dY+SsUyRHYYtkpuV5DjiAxk7hLX4vG57Q0Q6oBQjZNoylPraCnlgIN4VIbExWdV8GAQy2UJB9Q
	F4iMkXSCUgYl4q1L2y/cJK5H/FwkUsnR1586QLVw1WJSw2oaZ+GZA+sj3eAATs62rl/NXOj+yb20x
	Eq3jea/IUJB6xM71lU6tnhJa+DXLywgiTblfUBE66Khsx06NdznE2M+iySE5hNCWVjfRJxfsmm+gN
	ZTZR2voA==;
Received: from [113.46.200.219] (helo=canpmsgout04.his.huawei.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4v2J-00000003GNW-34mF;
	Tue, 24 Mar 2026 06:14:51 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=qfaMojy4YCJI6x7hn3yLKKO+h1WPTwEnl4yVpQYK7UQ=;
	b=jpV0OS8P669YME8Q51wZE1sJYxg0mWoQB30y8MPrPMbvQ22ehAAXuIqteUT/3sIxyL1MmSP7h
	RbyG9KeFJGYgssJdZyGAsROKKri5Ypb8c7977na6j8YwpXxHoqMP1oXnnOWDxdKrCxthN2TlvfT
	lJ1A1OOOgmTlVrMeRWDFqEE=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4fg02m0NPjz1prkX;
	Tue, 24 Mar 2026 14:08:16 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id B7AF22012A;
	Tue, 24 Mar 2026 14:14:23 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 24 Mar 2026 14:14:20 +0800
Message-ID: <e51d5a5d-40d4-950b-274f-229e1d72e60d@huawei.com>
Date: Tue, 24 Mar 2026 14:14:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v9 0/5] arm64/riscv: Add support for crashkernel CMA
 reservation
Content-Language: en-US
To: Sourabh Jain <sourabhjain@linux.ibm.com>, Andrew Morton
	<akpm@linux-foundation.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <chenhuacai@kernel.org>, <kernel@xen0n.name>,
	<maddy@linux.ibm.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<chleroy@kernel.org>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <robh@kernel.org>, <saravanak@kernel.org>, <bhe@redhat.com>,
	<vgoyal@redhat.com>, <dyoung@redhat.com>, <rdunlap@infradead.org>,
	<peterz@infradead.org>, <feng.tang@linux.alibaba.com>,
	<pawan.kumar.gupta@linux.intel.com>, <dapeng1.mi@linux.intel.com>,
	<kees@kernel.org>, <elver@google.com>, <paulmck@kernel.org>,
	<lirongqing@baidu.com>, <safinaskar@gmail.com>, <rppt@kernel.org>,
	<ardb@kernel.org>, <leitao@debian.org>, <jbohac@suse.cz>,
	<cfsworks@gmail.com>, <osandov@fb.com>, <tangyouling@kylinos.cn>,
	<ritesh.list@gmail.com>, <eajames@linux.ibm.com>,
	<songshuaishuai@tinylab.org>, <kevin.brodsky@arm.com>,
	<samuel.holland@sifive.com>, <vishal.moola@gmail.com>,
	<junhui.liu@pigmoral.tech>, <coxu@redhat.com>, <liaoyuanhong@vivo.com>,
	<fuqiang.wang@easystack.cn>, <x86@kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<kexec@lists.infradead.org>
References: <20260323072745.2481719-1-ruanjinjie@huawei.com>
 <20260323095548.fa4e13d6e8ae5005ae585e13@linux-foundation.org>
 <4cfde40c-673a-12b0-dfc5-703d582d6ea9@huawei.com>
 <595e793d-adc3-4acb-af18-f0a3cf2d5e73@linux.ibm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <595e793d-adc3-4acb-af18-f0a3cf2d5e73@linux.ibm.com>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_061447_009014_81DEC6E9 
X-CRM114-Status: GOOD (  21.25  )
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

CgpPbiAyMDI2LzMvMjQgMTI6MjksIFNvdXJhYmggSmFpbiB3cm90ZToKPiAKPiAKPiBPbiAyNC8w
My8yNiAwOTozMiwgSmluamllIFJ1YW4gd3JvdGU6Cj4+Cj4+IE9uIDIwMjYvMy8yNCAwOjU1LCBB
bmRyZXcgTW9ydG9uIHdyb3RlOgo+Pj4gT24gTW9uLCAyMyBNYXIgMjAyNiAxNToyNzo0MCArMDgw
MCBKaW5qaWUgUnVhbgo+Pj4gPHJ1YW5qaW5qaWVAaHVhd2VpLmNvbT4gd3JvdGU6Cj4+Pgo+Pj4+
IFRoZSBjcmFzaCBtZW1vcnkgYWxsb2NhdGlvbiwgYW5kIHRoZSBleGNsdWRlIG9mIGNyYXNoa19y
ZXMsCj4+Pj4gY3Jhc2hrX2xvd19yZXMKPj4+PiBhbmQgY3Jhc2hrX2NtYSBtZW1vcnkgYXJlIGFs
bW9zdCBpZGVudGljYWwgYWNyb3NzIGRpZmZlcmVudAo+Pj4+IGFyY2hpdGVjdHVyZXMsCj4+Pj4g
VGhpcyBwYXRjaCBzZXQgaGFuZGxlIHRoZW0gaW4gY3Jhc2ggY29yZSBpbiBhIGdlbmVyYWwgd2F5
LCB3aGljaAo+Pj4+IGVsaW1pbmF0ZQo+Pj4+IGEgbG90IG9mIGR1cGxpY2F0aW9uIGNvZGUuCj4+
Pj4KPj4+PiBBbmQgYWRkIHN1cHBvcnQgZm9yIGNyYXNoa2VybmVsIENNQSByZXNlcnZhdGlvbiBm
b3IgYXJtNjQgYW5kIHJpc2N2Lgo+Pj4gVGhhbmtzLsKgIEFJIHJldmlldyBoYXMgY29tcGxldGVk
IGFuZCBpdCBhc2tzIHF1ZXN0aW9uczoKPj4+IMKgwqDCoMKgaHR0cHM6Ly9zYXNoaWtvLmRldi8j
L3BhdGNoc2V0LzIwMjYwMzIzMDcyNzQ1LjI0ODE3MTktMS1ydWFuamluamllQGh1YXdlaS5jb20K
Pj4gSSBiZWxpZXZlIGl0IGlkZW50aWZpZWQgNCB2YWxpZCBpc3N1ZXM6Cj4+Cj4+IC0gVGhlIGFs
cmVhZHkgZGlzY292ZXJlZCBjcmFzaGtfbG93X3JlcyBub3QgZXhjbHVkZWQgYnVnIGluIHRoZSBl
eGlzdGluZwo+PiBSSVNDLVYgY29kZS4KPj4KPj4gLSBBbiBleGlzdGluZyBtZW1vcnkgbGVhayBp
c3N1ZSBpbiB0aGUgZXhpc3RpbmcgUG93ZXJQQyBjb2RlLgo+IAo+IFllcyBhbmQgc3VnZ2VzdGVk
IGFwcHJvYWNoIHRvIGZpeCB0aGUgaXNzdWUgbG9va3MgZ29vZC4KPiBXaGljaCBpcyBiYXNpY2Fs
bHkgcmVwbGFjZSByZXR1cm4gd2l0aCBnb3RvIG91dC4KPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9w
b3dlcnBjL2tleGVjL2NyYXNoLmMgYi9hcmNoL3Bvd2VycGMva2V4ZWMvY3Jhc2guYwo+IGluZGV4
IDg5ODc0MmE1MjA1Yy4uMTQyNmQyMDk5YmFkIDEwMDY0NAo+IC0tLSBhL2FyY2gvcG93ZXJwYy9r
ZXhlYy9jcmFzaC5jCj4gKysrIGIvYXJjaC9wb3dlcnBjL2tleGVjL2NyYXNoLmMKPiBAQCAtNDQw
LDcgKzQ0MCw3IEBAIHN0YXRpYyB2b2lkIHVwZGF0ZV9jcmFzaF9lbGZjb3JlaGRyKHN0cnVjdCBr
aW1hZ2UKPiAqaW1hZ2UsIHN0cnVjdCBtZW1vcnlfbm90aWZ5ICoKPiDCoCDCoCDCoCDCoCByZXQg
PSBnZXRfY3Jhc2hfbWVtb3J5X3JhbmdlcygmY21lbSk7Cj4gwqAgwqAgwqAgwqAgaWYgKHJldCkg
ewo+IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHByX2VycigiRmFpbGVkIHRvIGdldCBjcmFzaCBt
ZW0gcmFuZ2VcbiIpOwo+IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybjsKPiArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBnb3RvIG91dDsKPiDCoCDCoCDCoCDCoCB9Cj4gCj4gwqAgwqAgwqAg
wqAgLyoKPiAKPiBBcmUgeW91IHBsYW5uaW5nIHRvIGhhbmRsZSB0aGlzIGluIHRoaXMgcGF0Y2gg
c2VyaWVzPyBPciBkbyB5b3Ugd2FudCBtZQo+IHRvIHNlbmQgYSBzZXBhcmF0ZSBmaXggcGF0Y2g/
CgpZZXMsIHdpbGwgZml4IGl0IGluIHYxMCwgdGhhbmtzIGZvciB0aGUgY2xhcmlmaWNhdGlvbi4K
CkJlc3QgcmVnYXJkcywKSmluamllCgo+IAo+IAo+Pgo+PiAtIFRoZSBvcmRlcmluZyBpc3N1ZSBv
ZiBhZGRpbmcgQ01BIHJhbmdlcyB0byAibGludXgsdXNhYmxlLW1lbW9yeS1yYW5nZSIuCj4+Cj4+
IC0gQW4gZXhpc3RpbmcgY29uY3VycmVuY3kgaXNzdWUuIEEgQ29uY3VycmVudCBtZW1vcnkgaG90
cGx1ZyBtYXkgb2NjdXIKPj4gYmV0d2VlbiByZWFkaW5nIG1lbWJsb2NrIGFuZCBhdHRlbXB0aW5n
IHRvIGZpbGwgY21lbSBkdXJpbmcga2V4ZWNfbG9hZCgpCj4+IGZvciBhbG1vc3QgYWxsIGV4aXN0
aW5nIGFyY2hpdGVjdHVyZXPvvIxJJ20gbm90IHN1cmUgaWYgdGhpcyBpcyBhCj4+IHByYWN0aWNh
bCBpc3N1ZSBpbiByZWFsaXR5Li4KCldoYXQgYXJlIHlvdXIgdGhvdWdodHMgb24gdGhpcyBjb25j
dXJyZW5jeSBpc3N1ZT8KCj4+Cj4+IMKgIFJhY2UgQ29uZGl0aW9uIFNjZW5hcmlvCj4+Cj4+IMKg
wqAgVGltZWxpbmU6Cj4+IMKgwqAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+IMKgwqAgVDE6IGtleGVjX2xvYWQo
KSBzeXNjYWxsIHN0YXJ0cwo+PiDCoMKgIFQyOiBrZXhlY190cnlsb2NrKCkgYWNxdWlyZXMga2V4
ZWNfbG9jawo+PiDCoMKgIFQzOiBjcmFzaF9wcmVwYXJlX2hlYWRlcnMoKSBpcyBjYWxsZWQKPj4g
wqDCoCBUNDogYXJjaF9nZXRfc3lzdGVtX25yX3JhbmdlcygpIHF1ZXJpZXMgbWVtYmxvY2sg4oaS
IGZpbmRzIDEwMCBtZW1vcnkKPj4gcmFuZ2VzCj4+IMKgwqAgVDU6IGNtZW0gPSBhbGxvY19jbWVt
KDEwMCkgYWxsb2NhdGVzIGJ1ZmZlciBmb3IgMTAwIHJhbmdlcwo+PiDCoMKgIFQ2OiBbUkFDRSBX
SU5ET1ddIEFub3RoZXIgcHJvY2VzcyB0cmlnZ2VycyBtZW1vcnkgaG90cGx1Zwo+PiDCoMKgIFQ3
OiBhZGRfbWVtb3J5KCkg4oaSIGxvY2tfZGV2aWNlX2hvdHBsdWcoKSDihpIgbWVtYmxvY2tfYWRk
X25vZGUoKQo+PiDCoMKgIFQ4OiBOZXcgbWVtb3J5IHJlZ2lvbiBhZGRlZCB0byBtZW1ibG9jawo+
PiDCoMKgIFQ5OiBhcmNoX2NyYXNoX3BvcHVsYXRlX2NtZW0oKSBpdGVyYXRlczogbm93IGZpbmRz
IDEwMiByYW5nZXMKPj4gwqDCoCBUMTA6IGNtZW0tPnJhbmdlc1sxMDBdIOKGkiBPVVQgT0YgQk9V
TkRTIFdSSVRFIQo+PiDCoMKgIFQxMTogY21lbS0+cmFuZ2VzWzEwMV0g4oaSIE9VVCBPRiBCT1VO
RFMgV1JJVEUhCj4+IMKgwqAgVDEyOiBLZXJuZWwgY3Jhc2ggb3IgbWVtb3J5IGNvcnJ1cHRpb24K
Pj4KPj4gwqDCoCBXaHkgVGhpcyBIYXBwZW5zCj4+Cj4+IMKgwqAgMS4gRGlmZmVyZW50IGxvY2tz
IHVzZWQ6Cj4+IMKgwqDCoMKgIC0ga2V4ZWNfbG9hZCgpIHVzZXMga2V4ZWNfdHJ5bG9jayAoYXRv
bWljX3QpCj4+IMKgwqDCoMKgIC0gTWVtb3J5IGhvdHBsdWcgdXNlcyBkZXZpY2VfaG90cGx1Z19s
b2NrIChtdXRleCkKPj4gwqDCoCAyLiBObyBzeW5jaHJvbml6YXRpb24gYmV0d2VlbiB0aGVzZSB0
d28gb3BlcmF0aW9ucwo+PiDCoMKgIDMuIFRpbWUtb2YtY2hlY2sgdG8gdGltZS1vZi11c2UgKFRP
Q1RPVSkgaXNzdWU6Cj4+IMKgwqDCoMKgIC0gU3RlcCBUNC1UNTogV2UgcXVlcnkgdGhlIG51bWJl
ciBvZiByYW5nZXMgYW5kIGFsbG9jYXRlIGJ1ZmZlcgo+PiDCoMKgwqDCoCAtIFN0ZXAgVDYtVDk6
IE1lbW9yeSBob3RwbHVnIGFkZHMgbmV3IHJhbmdlcyBiZXR3ZWVuIHF1ZXJ5IGFuZAo+PiBwb3B1
bGF0aW9uCj4+Cj4+Cj4+Cj4+IEFueSBjb21tZW50cyBvciBzdWdnZXN0aW9ucyBvbiB0aGUgZm9s
bG93aW5nIGFwcHJvYWNoPwo+Pgo+Pgo+PiBpbnQgY3Jhc2hfcHJlcGFyZV9oZWFkZXJzKC4uLikK
Pj4gwqDCoCB7Cj4+IMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgbWF4X25yX3JhbmdlczsKPj4g
wqDCoMKgwqDCoMKgIHN0cnVjdCBjcmFzaF9tZW0gKmNtZW07Cj4+IMKgwqDCoMKgwqDCoCBpbnQg
cmV0Owo+Pgo+PiDCoMKgwqDCoMKgwqAgbG9ja19kZXZpY2VfaG90cGx1ZygpOwo+Pgo+PiDCoMKg
wqDCoMKgwqAgbWF4X25yX3JhbmdlcyA9IGFyY2hfZ2V0X3N5c3RlbV9ucl9yYW5nZXMoKTsKPj4g
wqDCoMKgwqDCoMKgIC8vIC4uLgo+PiDCoMKgwqDCoMKgwqAgcmV0ID0gYXJjaF9jcmFzaF9wb3B1
bGF0ZV9jbWVtKGNtZW0pOwo+PiDCoMKgwqDCoMKgwqAgLy8gLi4uCj4+Cj4+IMKgwqDCoMKgwqDC
oCB1bmxvY2tfZGV2aWNlX2hvdHBsdWcoKTsKPj4gwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+
IMKgwqAgfQo+Pgo+Pgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
